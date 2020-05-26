Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF41E1B22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 08:19:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WP1s6RB8zDqGt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 16:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WNzw3qlszDqGB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 16:17:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XJXIcPTi; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49WNzv4c6Tz9sRW; Tue, 26 May 2020 16:17:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49WNzv3ZR4z9sSs; Tue, 26 May 2020 16:17:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590473867;
 bh=p6L8QO26y2rPAWcS9oYxcI3jKYpozJ3Ms8+B9+RQ3KE=;
 h=From:To:Cc:Subject:Date:From;
 b=XJXIcPTi4RHsxI69NfYEz6oqVUAKrPjgJtPkqEnScHCwct2mm0hQsk9WMl4+3Oeao
 elo6vDCAN54u1nYtzEbVAzFyQKCOUl9LFZkUta9lsX8S/Lh5hShtZgybrW3FzMBkTT
 iaOFLcgT06ssTJCorpqXbhcWOuHFNGK9I9m17vBEtsoalRtG1RpQ5xqjyoUrG4oWMI
 B/37x/A/n6Z5mK8Fd5+iHc9C9lKuuPyPvS5ilfu7BoQ7u2V9LzVh1aq6cXt9R/CbO3
 JsNwSkrzmqxxf33DyQQqv6LO7R09snUZBCKR1pN3ht4WgUT04Nxjx/aenISo0FY00D
 SUcbw4QIUkf7w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64s: Fix restore of NV GPRs after facility
 unavailable exception
Date: Tue, 26 May 2020 16:18:08 +1000
Message-Id: <20200526061808.2472279-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 702f09805222 ("powerpc/64s/exception: Remove lite interrupt
return") changed the interrupt return path to not restore non-volatile
registers by default, and explicitly restore them in paths where it is
required.

But it missed that the facility unavailable exception can sometimes
modify user registers, ie. when it does emulation of move from DSCR.

This is seen as a failure of the dscr_sysfs_thread_test:
  test: dscr_sysfs_thread_test
  [cpu 0] User DSCR should be 1 but is 0
  failure: dscr_sysfs_thread_test

So restore non-volatile GPRs after facility unavailable exceptions.

Currently the hypervisor facility unavailable exception is also wired
up to call facility_unavailable_exception().

In practice we should never take a hypervisor facility unavailable
exception for the DSCR. On older bare metal systems we set HFSCR_DSCR
unconditionally in __init_HFSCR, or on newer systems it should be
enabled via the "data-stream-control-register" device tree CPU
feature.

Even if it's not, since commit f3c99f97a3cd ("KVM: PPC: Book3S HV:
Don't access HFSCR, LPIDR or LPCR when running nested"), the KVM code
has unconditionally set HFSCR_DSCR when running guests.

So we should only get a hypervisor facility unavailable for the DSCR
if skiboot has disabled the "data-stream-control-register" feature,
and we are somehow in guest context but not via KVM.

Given all that, it should be unnecessary to add a restore of
non-volatile GPRs after the hypervisor facility exception, because we
never expect to hit that path. But equally we may as well add the
restore, because we never expect to hit that path, and if we ever did,
at least we would correctly restore the registers to their post
emulation state.

In future we can split the non-HV and HV facility unavailable handling
so that there is no emulation in the HV handler, and then remove the
restore for the HV case.

Fixes: 702f09805222 ("powerpc/64s/exception: Remove lite interrupt return")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0801cd0e6012..72036082dbaf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2436,6 +2436,7 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
+	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
 	GEN_KVM facility_unavailable
@@ -2465,6 +2466,7 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	facility_unavailable_exception
+	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
 	b	interrupt_return
 
 	GEN_KVM h_facility_unavailable
-- 
2.25.1

