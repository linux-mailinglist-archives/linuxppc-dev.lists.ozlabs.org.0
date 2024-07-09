Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C430C92C5B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:50:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hJpyt9Bv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJZRv3p9Gz3dmy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 07:50:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hJpyt9Bv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=david.hunter.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJNpB1rd5z3cYQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 00:36:01 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-4f2f39829a9so1755123e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2024 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720535758; x=1721140558; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PjX1xL+hMVlCmCMu07z260TgAr+cz1WYtrqWTblIH4Y=;
        b=hJpyt9BvLlV8TLCPhRW08C6udy6+tOu/6BooqPP7E9+UMI54gBfQXplsf/XavW+Qrv
         OWhs7K/tOSZdAtB4dP51nhaoG5A1drfzscmOweyy7jM3NB8s0b8j7KWLYKAWZ64LaF64
         PXgrU2Rwm1YAizFWgTOg9BYFptNRjXLLjQUt6NUDJJjE/LeDpfASBVApuv1kEGpFpD1L
         bX2WrHwTtRWfVQKYcMtluaNWEjrxc2Cyav8T7e2MIspqvZuohAeZ1QW4g7e9TQ2QcAAM
         7WVUd1xOL5jUXmNwdrpYE7feGQatTRn5de/BhcGbF6ADy91TEQ6sCDQgcZfzWYnGBDXh
         eKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720535758; x=1721140558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjX1xL+hMVlCmCMu07z260TgAr+cz1WYtrqWTblIH4Y=;
        b=GMeahLz07OdipdtNxK9ewgIyCHjZWT7C7iHIXwA9LTTzziMURBf+1V+ySToFeaYcH1
         6FMdA2OnVzYBivM7WWalWI4QpWT/hxghUV3fUpoxlwijf9JUUmMRu8+EgElUgJ0+TRyf
         jeCI7UzSgmBP+iyViODhp7YewBEwt6hSFRsvqohlTUq4nupyO+AtZf+bqPCJ2VHQkItN
         feIXvfSWOFgPUDRZ2uJOYh05W7IBB9rKguPPRKzov9Z5dxwpV9JxcbdQ04YIydRp4otW
         81DNvsD1yQXCXqVWMEer6e7r0X4WRrC3J5/UeSh1FPqB+fEMO4s0FBKX+EwUIAbITn+0
         5T+w==
X-Forwarded-Encrypted: i=1; AJvYcCUs02/VgFDgd81qs263Y3PtScVDeioGIzpAkN21SHYcVOlJVZDK28oFCPrKnG9C+eOAPbxc/DIe6CCaN1Kra84Y7mQRktjO0vPGOVbaMg==
X-Gm-Message-State: AOJu0Yw6RAZhkahzzbvu5H/MS7rLLigrwLVV9HFfZbKeLc8Mm1AEAPG9
	KYwM8WVyGRQmaHhbc01iI/mIVi1BJVr+KDrADAubNdk1jC15IrEJ
X-Google-Smtp-Source: AGHT+IEcptUClsIFM9Md/kEl1v3WWdt35t46lG9y2rbzIy4j3iWxnuXi+HjMva0kISYK813NU5SPaQ==
X-Received: by 2002:a05:6122:14b:b0:4f3:45b2:b757 with SMTP id 71dfb90a1353d-4f345b2c180mr1459069e0c.14.1720535758232;
        Tue, 09 Jul 2024 07:35:58 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-490313bead5sm383447137.4.2024.07.09.07.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 07:35:57 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc-km82xx.c: replace of_node_put with __free improves cleanup
Date: Tue,  9 Jul 2024 10:35:53 -0400
Message-Id: <20240709143553.117053-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Jul 2024 07:50:17 +1000
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
Cc: julia.lawall@inria.fr, javier.carrasco.cruz@gmail.com, David Hunter <david.hunter.linux@gmail.com>, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The use of the __free function allows the cleanup to be based on scope
instead of on another function called later. This makes the cleanup
automatic and less susceptible to errors later.

This code was compiled without errors or warnings.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 arch/powerpc/platforms/82xx/km82xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index c86da3f2b74b..5791c9c5acd0 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -27,15 +27,15 @@
 
 static void __init km82xx_pic_init(void)
 {
-	struct device_node *np = of_find_compatible_node(NULL, NULL,
-							"fsl,pq2-pic");
+	struct device_node *np __free(device_node) = of_find_compatible_node(NULL,
+									     NULL,
+									     "fsl,pq2-pic");
 	if (!np) {
 		pr_err("PIC init: can not find cpm-pic node\n");
 		return;
 	}
 
 	cpm2_pic_init(np);
-	of_node_put(np);
 }
 
 struct cpm_pin {
-- 
2.34.1

