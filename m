Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3D67658E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 11:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzX1Y0JtKz3cQV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 21:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HhRK+BJP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HhRK+BJP;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzWyf6y8gz3fG6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 20:58:18 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id z4-20020a17090a170400b00226d331390cso7088056pjd.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 01:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFstcbn+wLbDV/KUT+RiVCyVkIiP9x4xm9O4flLrIDg=;
        b=HhRK+BJPiceeov8ScbAkgb/syOdCHWl7O78PS5SowJZ/3n4C/1v4HJ5IbXnq+RaLFY
         w9sGz3qWCXchnKtp1LxstPK/cvCK+YkF1O105RRxwSlTlH5zsOvzwxL6p0X6tfifGQw3
         R6vYzfHvE31swl7msals8Xyz9+n35Q3xvxBej9w8BzQlS9e7tPfNVSewG08qOfmRLGSX
         JQ7z1dUSigWE3Ju9NS+TON5Y0PJ19M9bCranAYGZwAVFvHUpmYGQjIz92xKfEotJkY61
         Zgv2/rY6/SDJZ6RMRp5lEgdPz/l20lXyWRLJVBwniLwos04saVPV4FIxBkUZfZNTN3Mr
         Qfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFstcbn+wLbDV/KUT+RiVCyVkIiP9x4xm9O4flLrIDg=;
        b=qwFCyEBZAhHUaZSyHRom5rokSS4pAY80B64fmYXmCgUU791EYaoLfQOZUplA7cA/lt
         Kup11TpDXVsDpRiOj0JbkRIorQ8L0zWG7U5JY/moBwf22/GuFZUD7xtoGm6cbKAgUZAv
         lhRZ/RZjnvNzaUxmvA6sf/y2A/VcGxJ1FxqyRib3kPTYnMlgS3NmvHCpSuxtLTwfaAh+
         VkszcRGUcIgDMW5ugh91ayfDwLOab9yaP8ncD7yS3lF8MITSCJ0SGOQ3b5CpxgvjElHt
         c00CPu7FNKDD1Ftfq6Tb23uDRrxTNHF98XXZDnJZEz38N/ob4PPu6HkRBT1UA1rOTzex
         eIXw==
X-Gm-Message-State: AFqh2kqSLciu/UOuk1D9xdEEosnN6D5xjl1fNRO1g0jaBVSq7+R9F7Pu
	RN4O4nQ/aGNuBss52scUn9Cma/GQChs=
X-Google-Smtp-Source: AMrXdXsfM22r7XiVZm0UPvOzthEnvfNo6I1KXjd8FTrB0ie9UjWgz6SOYlen76vjohwgH2JRgmRCdA==
X-Received: by 2002:a05:6a20:6d8a:b0:b8:828c:9232 with SMTP id gl10-20020a056a206d8a00b000b8828c9232mr17786856pzb.22.1674295096215;
        Sat, 21 Jan 2023 01:58:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id r33-20020a635161000000b0046f56534d9fsm23733539pgl.21.2023.01.21.01.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 01:58:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/32: implement HAVE_CONTEXT_TRACKING_USER support
Date: Sat, 21 Jan 2023 19:58:04 +1000
Message-Id: <20230121095805.2823731-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121095805.2823731-1-npiggin@gmail.com>
References: <20230121095805.2823731-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Context tracking involves tracking user, kernel, guest switches. 32-bit
shares interrupt and syscall entry and exit code (and context tracking
calls) with 64-bit, and KVM can not be selected if CONTEXT_TRACKING_USER
is enabled, so context tracking can be enabled for 32-bit.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56bddc..7683788af8cb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -207,7 +207,7 @@ config PPC
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
-	select HAVE_CONTEXT_TRACKING_USER		if PPC64
+	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
-- 
2.37.2

