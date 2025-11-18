Return-Path: <linuxppc-dev+bounces-14298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F7C69540
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 13:17:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9kBz6Dbbz2yv9;
	Tue, 18 Nov 2025 23:17:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763468251;
	cv=none; b=Ab+vZqNyH24uc+zjJq3PpbID2yMBQPeJ8gDOeYXD1qPjcho/sss/qxnxwtwlHRaLuS1MQoGxyJau+u+A9/4k3UVEF43GpERPsI1lOAIKCBIBMBTcyj3ypKmv8l29SAatXah0c5zBSlCg7V+XxHxc4HMELw4tsugVJfusKE4TySS5qJEoUBR5FssqzbxhBzMcUAcAWCvAu8krhbiW4IdP51JiNLjk4werSGYTz933NP1Rmt3/aLSqpwC2d6ehsukP0cHrJrP3rkaW0anlv9NTHg8gPPLSHfqCcvwg8EBdeY9Xxg5wgH3joxIvRDiA0IrOFYQ1iCmhTqHL27mk8x3wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763468251; c=relaxed/relaxed;
	bh=yA1z6/yzX06CrYPNUozJJh9ZoiURLo5ikElsnyrc8uU=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=A8Jzzm9qAb2/ZMmDz3V2mZVyEEG/ctBFn5uuYsjre/8/BvtY5GCAEdCMZ53NbmtXyFWIPGX62ojtaE00JzxQb9A12v55wRgtB+t8XNZSHeBBEG63MedmDdtrrUrKmtD0Cg/6wEKhRXPKBHicq5YRjiAdIqgnZ8mo7KHBfg5uoCpbPOO19G0pGiCbHdbBKVMzPjOJdHZA5rkv1KVfPIPYnTTHjX4WAFgK4PusAWyuSIHy9R6mAht0G3a8Kc3H+b7RJ/7yHpHt7SWzbjk8b8qWnl3GuVs0wvnDWrTurlLoM6c6hTejEiYV3YTNX07/w8Du0aULd1XgDZaybZxcJWRQTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=SKeWdvoj; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=SKeWdvoj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9kBx1bK4z2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 23:17:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=yA1z6/yzX06CrYPNUozJJh9ZoiURLo5ikElsnyrc8uU=; b=S
	KeWdvojIDZ9GnBUOh2L2GLCjWXTUovyDh2aZprrXCzXLADAKfJ2mz5PR31GBFQQ+YLU7dbwl+uBSj
	xawb3/I1mG5sn5GF/0Qj4UcPiSBQoygOrcvNQ316GvHF1l05+uGw1vrkubISIvk9UbNshQrSQFv+5
	BCE57WIVg6PGax+hCm9eZ8SoHCz92j2YAy8c0YfpXsc5sBcUv4DJ2GVP9McavTMv4bOkAdi9N71RV
	hE7SR7sz3bVLi3P28EYH12vct6mV2uJaGGsvsmcL4MHbDRLHiKPUuWAo6G68bRAr0RBhSqgovlLX8
	EDEszr7HDJQTpWoyaLP9AnlJVE2weGQIw==;
Date: Tue, 18 Nov 2025 13:17:35 +0100 (CET)
Message-Id: <20251118.131735.802732108462696577.rene@exactco.de>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] modpost: amend ppc symnames for -Os build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Building a size optimized ppc kernel, gcc emmits more symbols than
currently allowed listed in scripts/mod/modpost.c. Add to fix:

MODPOST Module.symvers
ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)

Signed-off-by: René Rebe <rene@exactco.de>

---
 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 47c8aa2a6939..133dfa16308a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 		/* Special register function linked on all modules during final link of .ko */
 		if (strstarts(symname, "_restgpr0_") ||
 		    strstarts(symname, "_savegpr0_") ||
+		    strstarts(symname, "_restgpr1_") ||
+		    strstarts(symname, "_savegpr1_") ||
+		    strstarts(symname, "_restfpr_") ||
+		    strstarts(symname, "_savefpr_") ||
 		    strstarts(symname, "_restvr_") ||
 		    strstarts(symname, "_savevr_") ||
 		    strcmp(symname, ".TOC.") == 0)
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

