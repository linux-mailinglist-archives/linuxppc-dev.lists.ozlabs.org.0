Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433FF4C657A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 10:12:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6ZQD39zQz3bcX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 20:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JJboFRW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JJboFRW5; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6ZPZ3DyTz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 20:11:28 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso14228639pjk.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 01:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeLL4lKnmthZzGm3Ht7K/jZBXOToEYNqwKUWhC0cZkM=;
 b=JJboFRW5+9vbH4s42UCtdyOxHWzZhonlIhJ6g1jD0UYKsbrVBUVFCNhmvskYHId9mx
 uLfZQRqrQwUShj+52TBQzYbqxo1M1wsxlbSW/3qWC72OC3HHqP529ZUZjwG8Acywm7qa
 JNlUK80XGWpFVzOxv+HEELDK6Mtidd3tljLagQcv27qBbfqHTmZ5nZc5bQus6urAIL8n
 XSY068EwonQywjy4hIrLBiVdEMf3Dx0GVQ49c7TydpoBC7z5LNgVSEM8Vx08zHmm/WzE
 vVby2/1Llqv8xMHYbMW5NkIKTcp++triDH0tZrLfxYu1jCgholbbK+8BiwtdW1eUdEa2
 Bkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeLL4lKnmthZzGm3Ht7K/jZBXOToEYNqwKUWhC0cZkM=;
 b=L718Dgyvjd7LE8TEGcuPhnNRMHP3FRLGUxfZV34R7X6kvvBtT8ip5Ycb0u+ywm2aZw
 MynQ+ty2w1APZKBK4Xhsh9PBvuhqm0mKTDyikLB+xe7mEewoUts/W8OThhnDkI0vUMT7
 cR4GolexfMAoktIYm0u7GhPYRUYDAQehRKzNKBpxyQCMDMrFYZjuDgNd5lebamQ4ZrwW
 KoSJu6JRxNZnkkUmES/OsPZvOTamdrKMBXWr5zwr07slo5WgARKdabr2jkYW4kmHDAO3
 6xHvVTc9nxMy3jbpm3jLQrsjA8RxTB3mFfv/rfxsphvtUIK2TYxS6QT27t1gIkbrJVb1
 ET7Q==
X-Gm-Message-State: AOAM533jSgUn2bPeF67QwPphTZBlpv0z9N/RY1DtPcROYkeKKyhmD1A2
 nHpWsJJ/eJGGGESknGaFwHk=
X-Google-Smtp-Source: ABdhPJw3rr4qT1Ye/wOojFetibRRFcKxLJTBeXNycqhdvhVfvn9KNcvskoTRkjWIH6g78qbp4eYMAg==
X-Received: by 2002:a17:903:32c3:b0:151:58b1:adf8 with SMTP id
 i3-20020a17090332c300b0015158b1adf8mr7597373plr.29.1646039486284; 
 Mon, 28 Feb 2022 01:11:26 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.53])
 by smtp.gmail.com with ESMTPSA id
 bo10-20020a17090b090a00b001bc8405bd55sm16622829pjb.30.2022.02.28.01.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:11:25 -0800 (PST)
From: Hangyu Hua <hbh25y@gmail.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: kernel: fix a refcount leak in format_show()
Date: Mon, 28 Feb 2022 17:11:03 +0800
Message-Id: <20220228091103.39749-1-hbh25y@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

node needs to be dropped when of_property_read_string fails. So an earlier call
to of_node_put is required here.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index a0a78aba2083..cd0fa7028d86 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -30,13 +30,12 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
 		return -ENODEV;
 
 	rc = of_property_read_string(node, "format", &format);
+	of_node_put(node);
 	if (rc)
 		return rc;
 
 	rc = sprintf(buf, "%s\n", format);
 
-	of_node_put(node);
-
 	return rc;
 }
 
-- 
2.25.1

