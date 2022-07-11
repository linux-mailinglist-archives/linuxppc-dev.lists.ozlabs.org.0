Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 668A156D343
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8Bl28XFz3c4s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:14:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KzkRB4/w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KzkRB4/w;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh81g2dJMz3f35
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:07:03 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 23so3630371pgc.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WYmEQp9PB7GhJg1eCdT2pNfPg6zVS0XFBViUYb9wsQ=;
        b=KzkRB4/wXBlzuhQ8aW9ptbpEoEY2zIIoX1DtVZzCsC6LgDlcIwZ/eSyObjidlr/6Ac
         4zPzjxsWME7q8xrchbplzQwgEI+TRvuWyQFx9LrS44mFVTG3h6u/RfMI91MGh/3Ld5/m
         NcaUaqUih7LNfps+iW+CHzcLz6+Mj3enkbreRza0mHz5HC/RDbJZcjqdikBzHDBi/nXM
         9aeRTeu4IoIxmIOagcI9LWnKjhemnVQtWViv+Tb4W0u+aBFfP9IAxZ5HrytHsAdQjTG/
         xXI3RMyk/RMwUlCX7ANgheyTmX1ddfF6FNw+4fu7CXqkD7cFFeuSNLu53OaGV3/rZvRq
         ym/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0WYmEQp9PB7GhJg1eCdT2pNfPg6zVS0XFBViUYb9wsQ=;
        b=tEbrU/ahmoptT0Zdq88pZDfsviFY4pKo7SZkMac0Gs3gedB3SpOvB3eSiYI/lu9747
         T3s2DSZKJK3PmiQWfkcb8TUShJr0Ipodn5HgTwu5WGZ6bNi8YTyCyi/6kJsxWs1iqNVf
         eaf1JeOTkszfkNBeYgNZKAaWlZFddrjOCtcNFphltC1ZGIl0zHVYoDtkBUgxmahDv37a
         nfAx8hS2W6398Z6jCdBE0hJCtZVzb6eTwhnCPy2/DaxMYJ6mmflIpTz6ETh8bkOb9p66
         xtESXaceDc1leWh17tRu6f0zSzsbOrXOKl3W6JbY+IajjMToY07CtvXxPoXcGbTZoiWW
         Gumw==
X-Gm-Message-State: AJIora+9HPfeVQ2RFDcgcxGIjlI2Atz6JwyTu2fSorHXPt0CLHclBG6i
	8VkYq0NE4kl6egK+FR53JZNeBNL1WpY=
X-Google-Smtp-Source: AGRyM1v0gyNjMBDy4YSJc2DVzB6JVpblON5LAvSwuViKJVzM9/9frGhWBcHbIPTnwNRKoqEM4Ol7Yw==
X-Received: by 2002:a63:eb50:0:b0:40d:c602:98b0 with SMTP id b16-20020a63eb50000000b0040dc60298b0mr13818200pgk.81.1657508820317;
        Sun, 10 Jul 2022 20:07:00 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b0016a17da4ad4sm3432372plg.39.2022.07.10.20.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:06:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/mce: mce_init use early_cpu_to_node
Date: Mon, 11 Jul 2022 13:06:52 +1000
Message-Id: <20220711030653.150950-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cpu_to_node is not available (setup_arch() is called before
setup_per_cpu_areas() by start_kernel()).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 18173199b79d..6c5d30fba766 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -756,7 +756,7 @@ void __init mce_init(void)
 		mce_info = memblock_alloc_try_nid(sizeof(*mce_info),
 						  __alignof__(*mce_info),
 						  MEMBLOCK_LOW_LIMIT,
-						  limit, cpu_to_node(i));
+						  limit, early_cpu_to_node(i));
 		if (!mce_info)
 			goto err;
 		paca_ptrs[i]->mce_info = mce_info;
-- 
2.35.1

