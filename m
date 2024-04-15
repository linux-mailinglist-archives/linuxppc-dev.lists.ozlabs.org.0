Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA78A5E47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 01:29:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TY/nhKHK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJNgB1yV2z3dLl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 09:29:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TY/nhKHK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=jain.abhinav177@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJBx64wWsz3dV3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 02:11:06 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso2639984b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713197463; x=1713802263; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idKY/AXCx9ADdtSZX2SyJbtyHMfNUkXAqrrB1Te8B8I=;
        b=TY/nhKHKN/ZTQk8dzR3aUdypI9CnE3t507kEIcEFa1F68SbLgWsnhmf3Ym+04CFwI7
         sx6qsXxWj4H2GtHY3YMtLiidVDPb6q4R6GRCN8cRArY8Fw7zjQfLW0l/XfiaZKhypah7
         V1a2P79Z871aWCzBqcTaciefF4B80yHKnuwk94g3tQRHgl3eSM3MYbM/nTna165tGTmQ
         bTd6kdGIK6BSKYMKPsyg8jcURl6v1sIojkYcu4620ruysqmDjb+gChGFxQTAPctZAqzf
         sIHLWf+1HEDujmMVL5Z2JDHUJm1nq9jx7YX7Of8p3qUeenogwbpoY+jwXCdRwnq7Gyy9
         1YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197463; x=1713802263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idKY/AXCx9ADdtSZX2SyJbtyHMfNUkXAqrrB1Te8B8I=;
        b=AwJg2k3X3Hmb16zyMUwa2YpU8QywgvWPDjYEW25lW/INvK7CRZLqPYJaJ1nHm72VHv
         xgAnQdzeGPHKYjdB+VUGz0nCMZeR4ufBmMi6BrRv3QoqD4NeIHYekc0pnbrk3BDWwC4i
         iUbrds7MIuoRMy/oskFDu6mStqEZUePgtInJOdv0buZbGHD/mmTgLSAXSrQ+p7AiOvsY
         OyKHgtw/TR+kV8zw6YpLJRTUGxZiksSSJ6kzAk+jDo9WbMqrOp4Bm/8AzH59uY0lUP07
         lyXa9MHzQPE6EXgE6BONkRpUj/NL+1K+7Cba8KmW6xdLUIAOm0fvputTBhRv55kUeBVm
         BV8g==
X-Forwarded-Encrypted: i=1; AJvYcCVb1yjRd8TVkkwxNXCo3upYxDYoXg68oKJ+TNSlOs7mVUif/SnYBAnjfv4CFJoyRN+UHUNhCViqxN+iW8xzO11m9mRrSkTSpGlDMUfrEA==
X-Gm-Message-State: AOJu0YyPq+05xpoxhvR1AInzwcQsgRgiTyxuqRyHG51ZmEeUIeh/v9Cx
	4gh1FZ+5K/gcvanFhaUYG8HuzVlmBnGyT2t98oTcYXzYIvxDbasS
X-Google-Smtp-Source: AGHT+IHCW5enMeqSxfKAKz6Q3Kx5ErcaMW7349ZcFBrKfz5bX7YYXC6EAqUVqihnGGZwN6vufHHUqw==
X-Received: by 2002:a05:6a20:560d:b0:1a7:3095:b3b9 with SMTP id ir13-20020a056a20560d00b001a73095b3b9mr8753963pzc.22.1713197463496;
        Mon, 15 Apr 2024 09:11:03 -0700 (PDT)
Received: from dev0.. ([49.43.161.106])
        by smtp.gmail.com with ESMTPSA id 6-20020a056a00070600b006eab6f3d8a9sm7414200pfl.207.2024.04.15.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:11:03 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: mahesh@linux.ibm.com,
	oohall@gmail.com,
	bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/AER: Print error message as per the TODO
Date: Mon, 15 Apr 2024 16:10:55 +0000
Message-Id: <20240415161055.8316-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Apr 2024 09:29:06 +1000
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
Cc: javier.carrasco.cruz@gmail.com, Abhinav Jain <jain.abhinav177@gmail.com>, skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a pr_err() to print the add device error in find_device_iter()

Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>
---
 drivers/pci/pcie/aer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ac6293c24976..0e1ad2998116 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -885,7 +885,8 @@ static int find_device_iter(struct pci_dev *dev, void *data)
 		/* List this device */
 		if (add_error_device(e_info, dev)) {
 			/* We cannot handle more... Stop iteration */
-			/* TODO: Should print error message here? */
+			pr_err("find_device_iter: Cannot handle more devices.
+					Stopping iteration");
 			return 1;
 		}
 
-- 
2.34.1

