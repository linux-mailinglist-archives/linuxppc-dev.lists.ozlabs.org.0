Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 403641E4730
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 17:20:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XDzy0CrXzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 01:20:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XDWM29xwzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 00:59:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DMXvOdGS; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49XDW85m3Jz9sTP; Thu, 28 May 2020 00:59:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49XDW46g6kz9sTS; Thu, 28 May 2020 00:59:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590591552;
 bh=THHrOuLbfX/mEGH1m3fEzelpHAYg+X8QseUe50Lw53o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DMXvOdGSoREU+hRNhgqT8+xE/wvEe4CitRbhI0zzArOXZLg8d5+Rh7W+TttROK9Je
 yGVaUcU9MfBjTcAhPMCxZxQJ9WgMrcRXXnoMCtyUUHsKycDz9vkMdyYvO1w4U+iTLw
 jWGdaVx2jEDnvYzW2sw0qDbawJQo9Y33kO4fvZtJMDuKHzKLsjxTnsA01PkvktK40l
 F/oPnvDywSOcS6hcCP0coMIzcqSuy1SPvSts7P4n85MKHqQPvZirF3Nkyqu4B8fHk4
 0DwEMtRWinjA3v9H4MfF0LcUGy1aJfGPmo2/Gmiu3DUOSWFwPWw00WUu46/jUb3F3n
 jVwKRIFB0sRdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 2/4] powerpc/64s: Don't let DT CPU features set FSCR_DSCR
Date: Thu, 28 May 2020 00:58:41 +1000
Message-Id: <20200527145843.2761782-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200527145843.2761782-1-mpe@ellerman.id.au>
References: <20200527145843.2761782-1-mpe@ellerman.id.au>
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
Cc: alistair@popple.id.au, mikey@neuling.org, npiggin@gmail.com,
 jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device tree CPU features binding includes FSCR bit numbers which
Linux is instructed to set by firmware.

Whether that's a good idea or not, in the case of the DSCR the Linux
implementation has a hard requirement that the FSCR_DSCR bit not be
set by default. We use it to track when a process reads/writes to
DSCR, so it must be clear to begin with.

So if firmware tells us to set FSCR_DSCR we must ignore it.

Currently this does not cause a bug in our DSCR handling because the
value of FSCR that the device tree CPU features code establishes is
only used by swapper. All other tasks use the value hard coded in
init_task.thread.fscr.

However we'd like to fix that in a future commit, at which point this
will become necessary.

Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
Cc: stable@vger.kernel.org # v4.12+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 36bc0d5c4f3a..fca4d7ff22b9 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -346,6 +346,14 @@ static int __init feat_enable_dscr(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
 
+	/*
+	 * Linux relies on FSCR[DSCR] being clear, so that we can take the
+	 * facility unavailable interrupt and track the task's usage of DSCR.
+	 * See facility_unavailable_exception().
+	 * Clear the bit here so that feat_enable() doesn't set it.
+	 */
+	f->fscr_bit_nr = -1;
+
 	feat_enable(f);
 
 	lpcr = mfspr(SPRN_LPCR);
-- 
2.25.1

