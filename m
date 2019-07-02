Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4D5C8BA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:21:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCKC3QBVzDqW8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:21:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="nhdS0KN6"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCGq6FYlzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:19:47 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w24so8508435plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+d/dQulSsirIOKPqYl4FAJMvNn/8ZD+HSg3OI8Zr9U=;
 b=nhdS0KN6t7UeKEx07/tvhS5TN5HJYAjclysXa2xPwbXdb+j2HKfICd4zUHIOCP5uJg
 K/qPNhrk3xQg862DQqnqNBBUXY55U4LUzbPO3U7D9inNSujwXVVF9w1M2rHMVxR0rllV
 vuNH7g91R92bTAmDCJzGNowD48qhjpt0dOkIFBn8w9KHMsQ+ashmolOpGzeOBlVjHoHy
 6RK57+MISandUTSsedNqlVzZ2BpEN7i47MHXTQb+nhpjj7ELqlxVkEfU96r9JyHnXBT/
 Xrlnq/N4IfED5eKlt9Zhk5dNla6J0Dy4Xauebmd8mO16iNTzUy0PGF165l9+IEgu1koW
 oTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+d/dQulSsirIOKPqYl4FAJMvNn/8ZD+HSg3OI8Zr9U=;
 b=sEENUsAoQevkstJsWUmDRUT7oQeNwXN6cuMWXnCfeEDZ2j9psUkgrTQLPbgOSTvTQo
 doezIGma5rgYFHYXJlHft18gaIqN7bNzEZNhrwvyb7sT+DAvWDNtFKrgdP4uY2dujhPO
 876O6k551kFhNYGK4+PWLHluNdtagVAcNeUGNbnJZ+RXqLOC9vqs/sEO3EJzUsOajMgy
 TcjbFNkGq21pmPgPyelGA4me3AKpPr8qSQjG6HBmp6jZ+DOcKQGYYdcaPPZcQnLG+Sos
 ulK2ZsP3T8ILe/kXJe652dN7TRHOXQ4VOqpipAwUKcL2odLdYTAyoLmMwUdbmn+Qz3Ob
 UhOw==
X-Gm-Message-State: APjAAAWHil0w0qxzwfGN+FEPcnmw7kRUlh7B34sa/nVl42/ORW/6smMz
 n+5S+I8TCefKZIfyHDXvyen6pzrxCEDKKA==
X-Google-Smtp-Source: APXvYqwu53hhrwJ1/YfXfyXjY5fijnNg2Px0Ayjq9tqtt2dCf0MFBdWQBi94btLTHlBo/yiK3bfOrQ==
X-Received: by 2002:a17:902:4e25:: with SMTP id
 f34mr32889807ple.305.1562044785853; 
 Mon, 01 Jul 2019 22:19:45 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:19:45 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 01/12] powerpc/mce: Make machine_check_ue_event() static
Date: Tue,  2 Jul 2019 10:49:21 +0530
Message-Id: <20190702051932.511-2-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

The function doesn't get used outside this file, so make it static.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b18df633eae9..e78c4f18ea0a 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -33,7 +33,7 @@ static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT],
 					mce_ue_event_queue);
 
 static void machine_check_process_queued_event(struct irq_work *work);
-void machine_check_ue_event(struct machine_check_event *evt);
+static void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
 static struct irq_work mce_event_process_work = {
@@ -203,7 +203,7 @@ void release_mce_event(void)
 /*
  * Queue up the MCE event which then can be handled later.
  */
-void machine_check_ue_event(struct machine_check_event *evt)
+static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-- 
2.20.1

