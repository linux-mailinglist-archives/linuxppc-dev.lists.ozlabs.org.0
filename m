Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D53534A9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7zLT1RY0z3cFN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 16:58:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=XjZO7lqk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=XjZO7lqk;
	dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7zK720zhz3bwk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 16:57:46 +1000 (AEST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BC2233F864
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 06:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653548263;
	bh=Ye7eLUY2KVbpTNU7R7EP53lRPzenCCRrRZNY2f0Pw2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=XjZO7lqkx+arWLHLPSz6iBnBw78rkn+znXI7Owav+lQ3WLWA2SUIRcRT9n/ZhNcZv
	 RayLVhCsf0xR0goPd4M1+cFljKTOhn2XZmaUGAStuzQ4iEcZCpRVBfgBdVuIuskwZ1
	 STvEniKvQzaIuVVyrw3sYHHBriaHVoBkBBFpb5Zxhr/0JpjYmKsHyZwwBuE2q7GU41
	 zXvj7oJC/8TdRnNhRwbCLN2SGfx3oWpcnZnyZ9fhzFXOz9yZ3zzb12YCzmR5PXhCFH
	 a8NDyxu/EAuFtqRjsF1+i0OWAtgQr0StsOAyQwbtGc8WzBtlc6UVb+ZKjsNulu2SNU
	 s1NSt/upxl9aw==
Received: by mail-ej1-f71.google.com with SMTP id m20-20020a170906849400b006ff296bb911so186911ejx.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ye7eLUY2KVbpTNU7R7EP53lRPzenCCRrRZNY2f0Pw2s=;
        b=p23ufP0NdkOI/+Myb08FVf7Ldw4sHToqRL545QZH4dzU5vDuwohJTKzSFEhfK0IYLF
         BSsgupUPM0eMD2P4hhxe4Xlhkf2s74IlktnWTROOCoR3FtX8wA77rXBbvvogZOjD9g1B
         fF1uXbYMOH9n2vPsDy2/csj+ke+zHODZkyiXHdRKPY37hcd1eIMEN8z84ZrmvcuYEMFz
         Ukf8m42CVN7IJEps/780qkNh2XcHxNIrJ0bNiflDdx7UF2xb6jgXFGrLzBiKs8BCvC+3
         oJN0qCyL7P338UePEq/kyW9kGG5EPr3qRTsaM+/Tcql1JDhN6C/xdVvyiEBIV9Fy6LLq
         Qdcw==
X-Gm-Message-State: AOAM531GiCXxsWfigtCZ0bxXVsZJk8XmzFxvlbYI9bvc2K6WX/jRfgYg
	YVQak2twF+g9NyYqSzlnBWpHUyavU30qe2I3z5DPuOyQb1kx5Nxir3KdjfnNoznL453G7VXYnH0
	QakD0k4N0o5ABA/FyClJyMhAVpzU8dxFRNFrrdFI1QZE=
X-Received: by 2002:a05:6402:3312:b0:42a:e883:5397 with SMTP id e18-20020a056402331200b0042ae8835397mr18160464eda.74.1653548263136;
        Wed, 25 May 2022 23:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR4IFmT/fyGSD8rES9S1+NQ2cUFE7jP02xDAxp+UsJlxwdSHoZNNzwFy42v0L4V/6VSI1Tag==
X-Received: by 2002:a05:6402:3312:b0:42a:e883:5397 with SMTP id e18-20020a056402331200b0042ae8835397mr18160454eda.74.1653548262989;
        Wed, 25 May 2022 23:57:42 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090652cf00b006fed8dfcf78sm220906ejn.225.2022.05.25.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 23:57:42 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: Kconfig.debug: Remove extra empty line
Date: Thu, 26 May 2022 08:57:37 +0200
Message-Id: <20220526065737.86370-3-juerg.haefliger@canonical.com>
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

Remove a stray extra empty line.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/powerpc/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 192f0ed0097f..2c019e4ac432 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -305,7 +305,6 @@ config PPC_EARLY_DEBUG_OPAL
 	def_bool y
 	depends on PPC_EARLY_DEBUG_OPAL_RAW || PPC_EARLY_DEBUG_OPAL_HVSI
 
-
 config PPC_EARLY_DEBUG_HVSI_VTERMNO
 	hex "vterm number to use with early debug HVSI"
 	depends on PPC_EARLY_DEBUG_LPAR_HVSI
-- 
2.32.0

