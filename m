Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC87E2601
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:48:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZglGHqWn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCNh0YqGz3dK9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:48:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZglGHqWn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCHD5mYdz3c4s
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CA05CE0B75;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 625FCC433C7;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=9pQwjUL7PMtkICM3/JD7Qu1swEeqMIjv9S2iKiZDUTc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZglGHqWnIRJUNTVZ9A2YLddqw03RtYvkn8ULy+7Q5txNJ3TEeynoCHedoHovVlRRF
	 vChaXPMrPtyt6tTGMLIwUOsORugDawXBBDFSY0ahVluiGoe2g+XRsMSlmDm5sBPH4k
	 pKis1qnK27d208h2ZOJXBpSPhk8U2cmB2MTsVjArVaLM0YiMZYQKBD8vIB7D7hZNrQ
	 FuBCzT6kh1hKdgItRYd/eMYZ/uk/2ivMPCsdjA/Fb2o0Tki/JtZTKo3kt91AHpC/wY
	 Kb6UPFFEZv2Ns5WjtJVFXuSSMYXI1XXy8/ElMeddWzUM2RP80C2I9757shPDe54FnA
	 kssOvO89kW/nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460D3C4332F;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Subject: [PATCH 0/7] powerpc/rtas: Trivial, coding style, and kernel-doc
 fixes
Date: Mon, 06 Nov 2023 07:42:52 -0600
Message-Id: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3tSGUC/x3MQQqAIBBA0avIrBNszIiuEi3ExhqIilEikO6et
 HyL/wskEqYEoyogdHPi86hoGwVh88dKmpdqQIO2Nei0ZJ90Fr7Z7xoDYqDB2dj1UJNLKPLz76b
 5fT/omXtAXgAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=1321;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=9pQwjUL7PMtkICM3/JD7Qu1swEeqMIjv9S2iKiZDUTc=;
 b=JrW+Hf9xPog4O7u0O5jPQgBqHi0ee4XAIIbc7nwjyBCzra0D7hBuantEwSbrG/sy3UAFZMVe1
 tIkHMImp0j/CIK0h9uXpLoxss5eAw+nUo+ox14UJx4n1T3XDMKR74Tp
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Fix recently introduced kernel-doc warnings.
* Make minor coding style adjustments for readability.
* Remove rtas_service_present() and an old call_rtas() declaration.
* Move a pseries-specific function prototype to pseries code.

---
Nathan Lynch (7):
      powerpc/pseries/rtas-work-area: Fix rtas_work_area_reserve_arena() kernel-doc
      powerpc/rtas: Fix ppc_rtas_rmo_buf_show() kernel-doc
      powerpc/rtas: Drop declaration of undefined call_rtas() function
      powerpc/rtas: Remove unused rtas_service_present()
      powerpc/rtas: Move post_mobility_fixup() declaration to pseries
      powerpc/rtas: Remove trailing space
      powerpc/rtas: Remove 'extern' from function declarations in rtas.h

 arch/powerpc/include/asm/rtas.h                 | 62 ++++++++++++-------------
 arch/powerpc/kernel/rtas-proc.c                 |  2 +
 arch/powerpc/kernel/rtas.c                      | 23 ++++-----
 arch/powerpc/platforms/pseries/pseries.h        |  1 +
 arch/powerpc/platforms/pseries/rtas-work-area.c |  1 +
 arch/powerpc/platforms/pseries/suspend.c        |  1 +
 6 files changed, 43 insertions(+), 47 deletions(-)
---
base-commit: 303d77a6e1707498f09c9d8ee91b1dc07ca315a5
change-id: 20231025-rtas-trivial-2c22ce853f46

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

