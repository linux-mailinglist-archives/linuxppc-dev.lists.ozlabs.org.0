Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED062534A9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:59:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7zM95phBz3dQC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 16:59:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=F8VufYvf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=F8VufYvf;
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7zK96N14z3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 16:57:49 +1000 (AEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A21073F4B8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653548264;
	bh=Txe6Joc+D2sNVGRTbSJSoJjs7Jo7D+TANko+R2z0/4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=F8VufYvfGCPsRjd4WVp2p0KmFBf5XcVRnngbofvAbVszPRw1cmrIR/SGGtC6uFQ19
	 DNHYSLzFpkFH2kJ8vLt1kHj8cfjuAT2NWxPCt7mieY2NRcYIESP7EtO0sB2PwjG+9M
	 3KSZ7DcnqnSCUTrAawPJiQgrFu8eQnGIgJeorkxOTNem9aTJZ2TRAJtpq7hWc3lpc0
	 GzlBzcsp2QxYVl3zdtJqEO7wwCqbMnIMsMU6X2NA6PqXRpflPVhB04kW9U0LB+ys41
	 cbQm3hWiiDQN9wiX4Nx8QieGuzRaSkyHYNeJH8I5+zkMjBln7cHgfA12OMmpS0RtXg
	 WuYbLt5Ug0x2w==
Received: by mail-ed1-f71.google.com with SMTP id q12-20020a056402040c00b0042a84f9939dso480208edv.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Txe6Joc+D2sNVGRTbSJSoJjs7Jo7D+TANko+R2z0/4w=;
        b=2IsN0HiuDPbQBU8Fy5tkvuCO6uaBOSGIBWqMvUu/JLf8coUW/0M9iy7/uadrEBAwmF
         nYwmYMfi9rmezGlBV/TLwTsP862MMyN5iuQO3/JvmaMIWwJtBF1ut8XbaMU2K3khYYsA
         OTPPcwp9G7qJMx7t57yxZV8kZddqOI9TK30z4ULckI4IWoE3YG0BW23jMtaseQAaNaXD
         kC3Ddm6hKXlaXBV0TZVj/S7SX4CaFQXWQPX/6TQvzPu7sZrDIMcBHwloGv1BHIr/VJDg
         VmgwK6JWsDExPjCzXtMTy+VSbFKvLLWSAOSqngK90R5zPEK2DRjokCNf5bgXJDuZF5XO
         r7LA==
X-Gm-Message-State: AOAM53272aa3rkxIvsSmrFbXfA2DG2Q+FQ8I8hy5cXsUWIZBGsMC9LT2
	VJV1m+/77IlqjHNxsNqOzoTuej0iiSjNypWCCRIAPuSxqz+d13Fs42/iiDLc8Ggu8ei+Ft+tFVP
	W+s0VSNZzm6RjLAjAVdydoZ+M3uHYLoJC6lAma6PDfyo=
X-Received: by 2002:a17:907:2cc5:b0:6f9:1fc:ebef with SMTP id hg5-20020a1709072cc500b006f901fcebefmr31436513ejc.121.1653548262291;
        Wed, 25 May 2022 23:57:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAzlMCLTa7rB0D14mp1uSRSJck3CimWoqaJa1PBLLHcC7RI032CbnbDvhBqTGp/pQy8R5TgQ==
X-Received: by 2002:a17:907:2cc5:b0:6f9:1fc:ebef with SMTP id hg5-20020a1709072cc500b006f901fcebefmr31436506ejc.121.1653548262126;
        Wed, 25 May 2022 23:57:42 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090652cf00b006fed8dfcf78sm220906ejn.225.2022.05.25.23.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 23:57:41 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: Kconfig: Replace tabs with whitespaces
Date: Thu, 26 May 2022 08:57:36 +0200
Message-Id: <20220526065737.86370-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526065737.86370-1-juerg.haefliger@canonical.com>
References: <20220526065737.86370-1-juerg.haefliger@canonical.com>
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
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace tabs after keywords with whitespaces to be consistent.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/powerpc/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..b4acaa77837a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -11,7 +11,7 @@ config 64BIT
 
 config LIVEPATCH_64
 	def_bool PPC64
-	depends	on LIVEPATCH
+	depends on LIVEPATCH
 
 config MMU
 	bool
@@ -446,7 +446,7 @@ choice
 	default MATH_EMULATION_FULL
 	depends on MATH_EMULATION
 
-config	MATH_EMULATION_FULL
+config MATH_EMULATION_FULL
 	bool "Emulate all the floating point instructions"
 	help
 	  Select this option will enable the kernel to support to emulate
@@ -1235,7 +1235,7 @@ config PHYSICAL_START
 	default "0x00000000"
 endif
 
-config	ARCH_RANDOM
+config ARCH_RANDOM
 	def_bool n
 
 config PPC_LIB_RHEAP
-- 
2.32.0

