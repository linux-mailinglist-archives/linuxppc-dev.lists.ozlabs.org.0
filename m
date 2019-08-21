Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8D979DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:47:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D6rQ1QDNzDrKd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 22:47:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qpqk/3kE"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D6Jz5tfTzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 22:23:47 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k3so1215273pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 05:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHZVbMRQpsgu56XAs+41JphKLcpzqEbQaZx+3eVwq1E=;
 b=Qpqk/3kE+Ov6Z9dhT5yd17ysjGBd8gfzM6+HH0cbm/Mlp6k2BLwnQgtto+qFF7vM5n
 5+iouO2nJqQmAQtNZOpV0GscSdyBVQf8aKE9hEuUuxDQd8mMcfWuZFZu+9r9SXUKxJBk
 36fjG+eZjd3StEjJe6rJTXRnnoFCV+9z9/a4gWXPVdwmZDIsUHf/3OIARQ/RR6GSQ/04
 k5wAri5BrtjPXFjRi6rnNPrqO3y9/q5eYell2wcL/+YRJ6BlWkJkSCAIS1zqi7JAl4P7
 emeOso//LnUXefGAZbOSMBYxQEH5YiD1ruXvmua9n4bY4YVur2Ts7gepnMOtUxnH+sTo
 EuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHZVbMRQpsgu56XAs+41JphKLcpzqEbQaZx+3eVwq1E=;
 b=I7UnWBVsBNoV+ISwNmenlXrkOdugFBQDuiBLbFOtYl8P3Y7ANkZ4TnCGN1ItB7Nh8c
 9iLVwyqFRWG8Piymh0V+WxG8OnRQ7tKF4CqBDUZUg8MPGcafS7ApmHpn7tqok0ldTtr2
 0aQOqv3sGSD2AtFaOgK1eF0IB5pGo+MpSKYtfEFGWZ7BWkqVfyBKPJdLcV7AdfGbTXKJ
 XOibrZnFi2jcytleMixLUFduas0uO7hFESk9jlQCsjMmTd2/iaXvERBdvAEM7bfJ/9KD
 ya7kqoH7Yl4c0W/XprRQ7u6ommNLGPL/pkOFOZxbhvGZOMymBagiGQu3CsIQDsm051ng
 gTyA==
X-Gm-Message-State: APjAAAUpy76liyks3nw4iw8nkwnt/b+W5e3+6bVJ2RTdHWudJVgrKHb4
 BLVpeE5SnrW0U0C/nmCVvmzYeg7i
X-Google-Smtp-Source: APXvYqwoqwn4QfvPxsQy1LQZ5MNWJaKIfVP7Q8qwx3Ql2aeLe+fuDNsrNdJu/5T17UW2BvbCbSYsaQ==
X-Received: by 2002:a17:90a:b014:: with SMTP id
 x20mr4983332pjq.60.1566390225850; 
 Wed, 21 Aug 2019 05:23:45 -0700 (PDT)
Received: from bobo.local0.net ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id a3sm23657819pfc.70.2019.08.21.05.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:23:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/10] powerpc/64s/exception: re-inline some handlers
Date: Wed, 21 Aug 2019 22:23:14 +1000
Message-Id: <20190821122315.9535-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821122315.9535-1-npiggin@gmail.com>
References: <20190821122315.9535-1-npiggin@gmail.com>
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

The reduction in interrupt entry size allows some handlers to be
re-inlined.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3f4b7dfa800b..87bce1fd7e11 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1187,7 +1187,7 @@ INT_DEFINE_BEGIN(data_access)
 INT_DEFINE_END(data_access)
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
-	GEN_INT_ENTRY data_access, GEN_REAL, GEN_OOL
+	GEN_INT_ENTRY data_access, GEN_REAL
 EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, GEN_VIRT
@@ -1218,7 +1218,7 @@ INT_DEFINE_BEGIN(data_access_slb)
 INT_DEFINE_END(data_access_slb)
 
 EXC_REAL_BEGIN(data_access_slb, 0x380, 0x80)
-	GEN_INT_ENTRY data_access_slb, GEN_REAL, GEN_OOL
+	GEN_INT_ENTRY data_access_slb, GEN_REAL
 EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	GEN_INT_ENTRY data_access_slb, GEN_VIRT
@@ -1485,7 +1485,7 @@ INT_DEFINE_BEGIN(decrementer)
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
-	GEN_INT_ENTRY decrementer, GEN_REAL, GEN_OOL
+	GEN_INT_ENTRY decrementer, GEN_REAL
 EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	GEN_INT_ENTRY decrementer, GEN_VIRT
-- 
2.22.0

