Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0676081253
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 08:29:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4627CR4Cw9zDqZp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 16:29:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="1Nse/dO2"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46273n0TRDzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 16:22:44 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id az7so36019603plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2019 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/M6TqzLiuanVCliBc3NhrwyBR/yMVzqsnz9WE14WyI=;
 b=1Nse/dO23Ys1MctZWr+L8K1WlGtDgARRZnoh5PGymw+9Eu9kdrsnfK4WmSY9X4jRsq
 5vcDPjPH6UM/qX6zRFpX8KjxaNGzTShw5Oqoq2H9q2WruYazsPSeUI8VNvmJs14chpEn
 umzFmf3dUagSdryUGeIIhY7BJLH6RU1uDuRKkDyjDhOePY5RwBKFZZFhqhjL3BCx9JLP
 d97OiAVZ+e413fgnUvzJH4H9ZwIxYEUGUXwhiTpjycjIOrWJaFHN408f/CP0F+0PFigj
 RZdeBbiXnLmUn+fCA+SstBfhlS6W1mJrEFJ0oPzbYPfDasGwlCUKmGb4HDCqX3zWdtfh
 b1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/M6TqzLiuanVCliBc3NhrwyBR/yMVzqsnz9WE14WyI=;
 b=uVBDrQXko8VhlUQdMmHTz0pl/4Oj1oLcTQyBOuTo44mVe8hadoM2pVy8VUmAargEAm
 fn6SxtcrLgSz6YxkmCpCcoJrrphsNOCEco+fbI+rnNLNlASo7pj1APXRkzsczAKwhRdh
 5ieiIovTZdyVpWrJZmKwD6z8OQa4J+BSPYoEUVHVABmzqS9FbMXmLZrDOu5z5qS9QxOm
 dCKYamrwxHBXaN0BIqKBgYY0STUGrs7hS7hB984lGnh1E7KU8NAacxnsSvPPHoLXhArl
 nhE/XVLwFpaQajqOEiihL25Kq0ANzS4m2VO/+ZAqMIjT+rz6fhqioWrdcxC2Fc3fPMFO
 SGEg==
X-Gm-Message-State: APjAAAV22oebaUWiCOq+8sC4uYxr1VsHwBDMYkqXB9H1cUyTLbpcDTW0
 hKZJ9s5u3JtqGgdO3unvGkHXcgD6doE=
X-Google-Smtp-Source: APXvYqzExHvOBf8j3MhHZWTk+Z3VqVYZHgHGPaR9MQnzwDtZFXfB5bCcqDxIIAFdNRwOe2v+7v6ctw==
X-Received: by 2002:a17:902:9a07:: with SMTP id
 v7mr35731472plp.245.1564986161925; 
 Sun, 04 Aug 2019 23:22:41 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.66])
 by smtp.gmail.com with ESMTPSA id i14sm124680082pfk.0.2019.08.04.23.22.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 23:22:41 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] powerpc/mce: Make machine_check_ue_event() static
Date: Mon,  5 Aug 2019 11:52:20 +0530
Message-Id: <20190805062225.4354-3-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805062225.4354-1-santosh@fossix.org>
References: <20190805062225.4354-1-santosh@fossix.org>
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
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 0ab6fa7cbbbb..8c0b471658a7 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -33,7 +33,7 @@ static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT],
 					mce_ue_event_queue);
 
 static void machine_check_process_queued_event(struct irq_work *work);
-void machine_check_ue_event(struct machine_check_event *evt);
+static void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
 static struct irq_work mce_event_process_work = {
@@ -202,7 +202,7 @@ void release_mce_event(void)
 /*
  * Queue up the MCE event which then can be handled later.
  */
-void machine_check_ue_event(struct machine_check_event *evt)
+static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-- 
2.20.1

