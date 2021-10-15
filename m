Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942142F76B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9mH1H8Lz3dr4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:53:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S1jcNizl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S1jcNizl; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cb5jlWz3cCD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:55 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id k26so8695543pfi.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBfegSip8uJBm6f+7E6aCO88l+bAoSzfsmhWLvtW/G4=;
 b=S1jcNizlBvqaS0nJyeceeBEMqJUWaLUC/HJRo8krv7NUYTQzHQ1AQSEeud6ZxgEd4K
 ss+w7Xn96BW7k6L8RqmNK7ZlWBdflhyWecelIuWrF+q41X12oZSouOUa5nixODFBevg8
 vDcaHOxNd2tklCMyO6/+nwWeUHjIHRKui96tlga7gEPZK3fsW8Gt60qLObwL8TKFtOhl
 4y/pAC84RgnlxL209bxjGEG2QHwLAbKDCrZqRIXDH9mpO/F6DapUSzcMILuVxiCG38cI
 5i2z7Alg97rhpECt5SZogcPkBDmWFWxFY0wjXhipYR2n3Co35Ao0QCX5I03v2XSoSR8Q
 a+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBfegSip8uJBm6f+7E6aCO88l+bAoSzfsmhWLvtW/G4=;
 b=hjK66krw66sbQ2yhaDC+xT13mjVaByomLU0VwV3Vpo1BoUDRDuzPmcLv4b1RM3RXN0
 TbAWYjePgccReVOtSf746sKe52+SdsjAyV5zScT5gevUuVPj9LVJCMi5sTNfU1xjcsgR
 wscbD9ntAw0v9f7RwYAJ4zvP/tRD5eunk12dw3z6Yn0T18yNkUWZ3LruZGIAPiEE/2Gd
 IsfUiHYTZBeU7ZX5kCqhs1c68+qM6zvtgLjaPY5oqWBtaFmE5GOOOwG4L1/DT/NE1Yw1
 XEy9BHPX2AqVL3xWP48U6Z1aBIes+njMEb8kDyDHkRYDoRd4+j6lPqUwerR2VGT3qY0b
 NbyQ==
X-Gm-Message-State: AOAM531Tfgs5F5N0UaBKLDCtFlxwdnvigs+neIXf0DG5nDiwuHBH3Ifb
 NeATma5+7Un+Y7X3k7l2CH3aamni5F0=
X-Google-Smtp-Source: ABdhPJxlmcBHpz/56IitWZDh8m30rancAl7FBrN323vjKcjTyKipj8MUbDrBfnagBVQNQk2Lya2t4g==
X-Received: by 2002:a05:6a00:1801:b0:44c:aab8:a5ba with SMTP id
 y1-20020a056a00180100b0044caab8a5bamr12151208pfa.32.1634312813666; 
 Fri, 15 Oct 2021 08:46:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 10/11] powerpc/configs/microwatt: add POWER9_CPU
Date: Sat, 16 Oct 2021 01:46:23 +1000
Message-Id: <20211015154624.922960-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211015154624.922960-1-npiggin@gmail.com>
References: <20211015154624.922960-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Microwatt implements a subset of ISA v3.0 (which is equivalent to
the POWER9_CPU option).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 9465209b8c5b..6e62966730d3 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -15,6 +15,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_PPC64=y
+CONFIG_POWER9_CPU=y
 # CONFIG_PPC_KUEP is not set
 # CONFIG_PPC_KUAP is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
-- 
2.23.0

