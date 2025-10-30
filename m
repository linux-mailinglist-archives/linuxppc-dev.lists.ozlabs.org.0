Return-Path: <linuxppc-dev+bounces-13548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F587C1E668
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 06:18:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxsp21Cm5z2yvv;
	Thu, 30 Oct 2025 16:18:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761801498;
	cv=none; b=IjnB7fbO4KAU/bUjf3EsuceKHipmZ2dhGn5xT2nf9M4pI2g0+9jGzQ4E+CKWxonj89Qu2g2oddNunx2eA/Dlh2yKBnY6uNe4P4+Kuqn9TCyjSfnenaglh4rHJ0a2cnR3nOmnIpYvXvunTrKWQwF95kGaYzbhJQJegMq7m23Xdfhbt4Wk1pv/emUZkJ0IWjTi6cpK0nvGAbiWDvCpyUIulmAzxob8+fKYIE8kPWwAhOauOTN+u7x+GEZl8BOvfP2ZKXPWz0KENhvkfzRF7Azknw4OoCW5wHCeWXaG5JzYJiBUE2o6UWNcx+Ri6qfqfOUihv9YKpkYd7juPllHUxkMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761801498; c=relaxed/relaxed;
	bh=74tfITgN+jliSCJFJEsvOUjVL101aogmvXZmW0Fyfy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h3uSeftyY4xm8QOmKQHOs6tXpStdZE92MprPi0yTgnoYs3Ipyu70FFrb67M32hGUNltIOlfy/xZbRwtxvLhRWNbcaySBru1+NqWuSDjrKXylCWkXZUFZivQU98dSgkI0+qyx/urq/SjvcmDBxXIrW0UtTngpNTQios/+1Ky3Jh2N7UqVFn6s6VxZgiLc+l0pIywvqwEixqr43Pii63472OB8z2+mfyO5hjBD0NFfehScwGKq0c5Ri/Hzc8I+msQ0vPYeRzXs3NSFF9e3oI6wKIreHbuUshBawDQpo9Sr3x4qjcScD30tcq2+GW7eJ970ucL/87O3liaiEH3Gah26Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abWZUeXZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=abWZUeXZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxsp129z6z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 16:18:16 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7810289cd4bso768682b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 22:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761801494; x=1762406294; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74tfITgN+jliSCJFJEsvOUjVL101aogmvXZmW0Fyfy8=;
        b=abWZUeXZRR9uqclE5/wFtIsyu3mi9bmR4l0gK4FCQjODyuAKf4chtwodP40i7gyUxE
         UbT6KBr+MO9iF5LQ6ccQo5bDNldgEJk49AkOJt9939N1bUku6EuM8G8Tux9CpfhmEE6k
         fcjovpBvNZ3oL7nhGDERtB2XnKL+mnYj6WLjqKMTCyzfkJRl7FY76CqIKt7I2XXnzd+K
         ++0M21KC8DxqSZNQMlx1DVu1PXMwFU2AOPio1Rs/6Ynwac27xm0IwMHZ5ktKL6Wwy7GL
         r9GHR///fH8M63XGNKbdG1wWlF4TrEdc2X05qyCT02lvx166FmPmugn/j/MfjtpaugXO
         VMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761801494; x=1762406294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74tfITgN+jliSCJFJEsvOUjVL101aogmvXZmW0Fyfy8=;
        b=cVRH8toc4iljjn+JmwFtbV70mc2UtDbnc/8Vm8HI2xd8ziK94OUM7BmILWd8WMrHB3
         FNTm/TH929IlDgJWmQ47QabSiffE6FfKC5h3KIgnUcPjrgOK04+7SGSfI5NVNLunXSMj
         bCK4zXggX+VHIFY6nyTyiWNJv92l+7ok4RTmDlXHE7pwnJvBfzDYYpKxBhx9AePDKFYN
         8VAm/+WAKWnUsrHL0sJUMvab8ynvLHEJYrA/r+0q9VY690PFMPRGQxeYuY2TQ7VLiDrI
         vc603d6qWH3pe2m6lrTJ/iIy0SJwwbljs9VGbb8fJYfvLkgEdbUjOX8G7H9ZQPff3QOp
         f7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUlKwRrQz+anBdOaFnxjdwUNJzg4/DWm9uhHnnF3FpUjlYf5D0N3DYJxXi872Pous4I3YSG+sSu+P8Yy7k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwykqDDOSEgu6wZA5W8uTOWKzQ04m3GEmyozvB296pGuCOMZYRo
	uNCM/I7LpTDrEfDPXA+K/bJq+Gezamb34y7z1Fh1cmpBi4P1MNEvr6w4
X-Gm-Gg: ASbGncvftgZOovgw5QY+S3Oz2CT8vPBLVjg9LwUoO/MP9t6/QPDZz9zzGmV1VF8vdQv
	ur4P+Q35OOsogR6SzFeNpIb/0M6nr13ptjsNzpzKsuyPyL6E5ydyrJ8UuxbsB7JGIZD7XpT2mFj
	XuCrSEb/iQ/v/CLr6gPkYSQ8ZZNWf5xFccBv9Q0AUWERnaao23LOjv8Q+IKnO7LDaUqbkOAOs3S
	ByFmuTClphbWsStZ+9vF5QdFhpF2H64/Wua9ZhBG2xX+1tlPrBdhrdVqovLxE4PMvVlVIjZ1X94
	Ishe9zLzETOBcfGwYO0iS37xXkd9c0VfHUo3QU7SZsmzSg3e5s5aNOqc6r3mmsdVPhrZCmD/943
	5H5cD+t/av8Ni5wIWUN+SPJZbYP7qp58W3rBIKyY6TvaIR7szQQH3rRIuwZug0ihj15hbhCRagW
	9QoMSX7VhBBuBgW1tIEnzosANR3uNge3MF
X-Google-Smtp-Source: AGHT+IEhzK1oEYrUQqCBBSqPHXsRDk4cferL/O21CP4C7/ru0ksQFcHNu9ziLSsqEz7nZQmTjmZx7A==
X-Received: by 2002:a05:6a00:3988:b0:7a2:183a:924f with SMTP id d2e1a72fcca58-7a62cc6de7cmr2012742b3a.31.1761801494420;
        Wed, 29 Oct 2025 22:18:14 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a414066d0esm17445157b3a.43.2025.10.29.22.18.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 22:18:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geliang Tang <geliang@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/pseries: add input size check in ofdt_write
Date: Thu, 30 Oct 2025 13:17:55 +0800
Message-Id: <20251030051759.93014-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A malicious user could pass an arbitrarily bad value
to memdup_user_nul(), potentially causing kernel crash.

This follows the same pattern as commit ee76746387f6
("netdevsim: prevent bad user input in nsim_dev_health_break_write()")

Found via static analysis and code review.

Fixes: 3783225130f0 ("powerpc/pseries: use memdup_user_nul")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/pseries/reconfig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 599bd2c78514..b6bc1d8b2207 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -366,6 +366,9 @@ static ssize_t ofdt_write(struct file *file, const char __user *buf, size_t coun
 	if (rv)
 		return rv;
 
+	if (count == 0 || count > PAGE_SIZE)
+		return -EINVAL;
+
 	kbuf = memdup_user_nul(buf, count);
 	if (IS_ERR(kbuf))
 		return PTR_ERR(kbuf);
-- 
2.39.5 (Apple Git-154)


