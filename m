Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49C5BF2FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 03:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXLk62YVqz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 11:41:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mxo4mSHU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mxo4mSHU;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXLjT0Jbrz2xfv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 11:41:14 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id x1so4180991plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hR7QwSAGQh9N6q7ZPHC7+ZqD38IvKoHXc94J4+WGZwY=;
        b=Mxo4mSHU8kYuEp4BvVR7qikgRY/uE6s3Q2FZDwegO/Ar8lCXIMsXt1Cty///J5iamH
         cphh6xP5q+ZkF70qh94WHjIIs6oY34Jm/sHwfWS6E9XYq+bVi+nmFz2EgEOLArDppqxP
         oKfPUClOzXbuH2Awp9ZEY0B/61gWl40pPzpRsQenot15XCDoCbDsTthOq4ikyULNoYcd
         cXVA8j1Nv598K1BZJhioycmidovg3DJXOugY/vjsswxm6cZECUNj8JIUwP7AXCmpmqoy
         MJcGbELpncfqdqKtr/Uv9xbe7Ys5hb7ozfNNBwSoPzl5P9UwsI3kHo3y3jhyaqXPOidc
         bg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hR7QwSAGQh9N6q7ZPHC7+ZqD38IvKoHXc94J4+WGZwY=;
        b=n4c4aQrfDvzKAn8TaKPt3p9ihLqFs7MwS8SuUCPabOq28WKvgJRNI9ZeqhWTdi1Hza
         hGtgMzFROtUjzUiqGk4g0+MTr930RHv7SqEIrvD1CcSURzcJPJn34yfvFXW0pgUx4zto
         qJiYsdEsJiEjHJ0/U02LdeM6/PY8FTOqp5eCdWTtVu1StZyVgVFsA8Rke95WU+aGbOAW
         ZOYGatyuSYCy2bRyy2hhJgAfi+rX/r4I1RhqHGiCx7fNpevEqUvuEhM4i25JxH2858sU
         x+wfX/76K7nD9Lr593Qku32xnTlTIAyxYM3DHrs0Hx7YQQehRMDAbv0ryq7JkX8TQy5X
         3aIw==
X-Gm-Message-State: ACrzQf0EqH6pg1G9AOw17AYTCuabUm88emI8vKVS5xq49Fi5lGPiKD/9
	2R/UxX4CfrvqKs07gN3x+DQfBlwofCA=
X-Google-Smtp-Source: AMsMyM6Fko4zV8FDijogf//Kb6pO3nsw5iIyDjj+vzSczAaHLcADzje62Xz0GalFOn2Wr46tbeukNA==
X-Received: by 2002:a17:902:c7d1:b0:178:54cf:d69e with SMTP id r17-20020a170902c7d100b0017854cfd69emr2433872pla.86.1663724471244;
        Tue, 20 Sep 2022 18:41:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id w62-20020a623041000000b0053e156e9475sm575131pfw.182.2022.09.20.18.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 18:41:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
Date: Wed, 21 Sep 2022 11:41:02 +1000
Message-Id: <20220921014103.587954-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

Big-endian GENERIC_CPU supports 970, but builds with -mcpu=power5.
POWER5 is ISA v2.02 whereas 970 is v2.01 plus Altivec. 2.02 added
the popcntb instruction which a compiler might use.

Use -mcpu=power4.

Fixes: 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 02742facf895..140a5e6471fe 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -152,7 +152,7 @@ CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
 CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power9,-mtune=power8)
 else
 CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mcpu=power5,-mcpu=power4)
+CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power4
 endif
 else ifdef CONFIG_PPC_BOOK3E_64
 CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
-- 
2.37.2

