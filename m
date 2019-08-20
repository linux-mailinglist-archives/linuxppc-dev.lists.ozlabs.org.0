Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C2A9595A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:22:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CP0s4XF1zDqFL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:22:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="o8PfGZiI"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CNqR6HdGzDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:14:11 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t14so2353328plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJYgBqte5Ii/VSliQ8oA8G2Ha5PCLW/st87+39mATT8=;
 b=o8PfGZiIlB2TqYW1b3hM8z1019vtcXTc/m8pBj5F5FdYLJgcRYH7K88P2YJM1ibjj3
 8SsafjOOWlHk39uF6xHZ4rTpqPFu9WW5djBEn1+zZPk0aEnwF+rIAzWAuSx/Oj9JTdYi
 pNcFBy0MgtQZYmJZ+csCGzMpCAC0woTGkcuNQiYGAhJrI5f9Yyq3diOSx/nt9sNU1554
 9TlzNQCgpqvQhxxgGnGo3QZIjr33sCZETfocJwj8dWv4/R6QETvBgiZtlrZwSeGSvQ+U
 UsP0nSy6LLU+CqqkgD9U887l+2B5xk9xH/s3Sr2niAUh0rUkpxUaHXFa+wQZv8i9iW2v
 rcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJYgBqte5Ii/VSliQ8oA8G2Ha5PCLW/st87+39mATT8=;
 b=orNiJs/07bC3HVLHu0kh1dlSQ+1uYbv9HHUBZzZy0z3HkSZUqJbDAxJqDFGA44d+Px
 C5im5yvUm/FtooUfiBkatY4WNL8CFfJs6QrTbqPKiK+WT0Khxpvh0vAOJztuWWh2xEDv
 Z/soxbIWrbyvU0yXBcpMN7cf8c46K67Q9bp3MkpXljz4k35eikUP3s79qRUVTF9woLtb
 XvS/ZuXnESwRud334/Lkacme5gbeIQsy+qSzNl94N7Cpv4vR8Nb56K88o8lBy2f3/t73
 fRkwHSqJ7JhtFweuDdnBagQA2tLRl/g5PG1NJShI1vLH8E0bYB9raX2reulIVnSv19oR
 mfEw==
X-Gm-Message-State: APjAAAW0dpIKS0YWbEoAfqpw3fqT8UIUDNnBK6FFIoS5/tMh1PfFJExH
 807ES9x8qWEyKz6y+ZB2iUxuN0Qvd/mzeQ==
X-Google-Smtp-Source: APXvYqzQm/aCpNRce4Y9mErF0e8Uju13vUdmSIZWfvkH8IIfs+311kArKxd4CLK9fTMu4ft13FN/bw==
X-Received: by 2002:a17:902:7442:: with SMTP id
 e2mr16414839plt.315.1566288850090; 
 Tue, 20 Aug 2019 01:14:10 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.78])
 by smtp.gmail.com with ESMTPSA id b14sm18949265pfo.15.2019.08.20.01.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:14:09 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 3/7] powerpc/mce: Make machine_check_ue_event() static
Date: Tue, 20 Aug 2019 13:43:48 +0530
Message-Id: <20190820081352.8641-4-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820081352.8641-1-santosh@fossix.org>
References: <20190820081352.8641-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

The function doesn't get used outside this file, so make it static.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index cff31d4a501f..a3b122a685a5 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -34,7 +34,7 @@ static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT],
 
 static void machine_check_process_queued_event(struct irq_work *work);
 static void machine_check_ue_irq_work(struct irq_work *work);
-void machine_check_ue_event(struct machine_check_event *evt);
+static void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
 static struct irq_work mce_event_process_work = {
@@ -212,7 +212,7 @@ static void machine_check_ue_irq_work(struct irq_work *work)
 /*
  * Queue up the MCE event which then can be handled later.
  */
-void machine_check_ue_event(struct machine_check_event *evt)
+static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-- 
2.21.0

