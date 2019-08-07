Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325784F69
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:04:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463ZYD364gzDqHv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:04:48 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="GLMrLdsE"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ZNh6449zDqk7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 00:57:24 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c2so41187588plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2019 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/M6TqzLiuanVCliBc3NhrwyBR/yMVzqsnz9WE14WyI=;
 b=GLMrLdsEfsoREUBYlWy8vT8pdGthJ92pv+sWNHZjUTL3BDROZ8LRVrj6pG+CAGUw+9
 qEfKOLMdyv+zJWzfXdefMFdBt8ly+ZWmVWeGz4SorPm3xYND6vMo5wBarHZn+xuHZ7a8
 C75UO9/+gdOMJM4W3faH5fXZQuQ/+A4hjMIu7mbjBBBKsKbculP3m3OLKGQCTxfhfUL2
 WFgDAXSxycs1N+6FMFh4GclR7Ltboc/zLF+rOucZxGrZblH3UFAqMadSWKr3ZgwRkDMQ
 /3qWkOIWlefdSCitcVVCvlRYGfhL6sYQaFP8UDFIoICb3dDDpPzWgNTApOAauqA1wd/c
 CcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/M6TqzLiuanVCliBc3NhrwyBR/yMVzqsnz9WE14WyI=;
 b=FXRTABfnkzHh0ADsK/UwfCUMSDzHkAy8+MXoxrkeW/+jFRPmel49zJhNwJA0z+iZor
 qjUdhSdQdRhybDqDAk/gdhCJss4m9NApvG5CdFHrHqbfXBpJR1+FwCigaR4iHHQZiMl0
 NGZX4fyZY/r2pGPM6yUQajZtlGegD8rXnWlpPRrkojQ5vdmB5Ig8qu/yUTM+HiInfsAU
 QhW7y3WjD2nfc/iKkaXOL/6L2O2EKPyQKI5fbRkpB9uVXmEBx8CHppnpVoU5kwXhb8NS
 2SqdRkHBGj447iZLskpSBM7ClynmhXudsmzYPqobhFGPQ+ocKh1UJg0ypYWuSyvwxKAh
 mTvA==
X-Gm-Message-State: APjAAAXd6+WclbhZQA2Nv+6DdOAdwdLJKKgGT1jdEtqkwFGjWW6y9gzS
 ZdcwPfyov8Ll0BJalMAM+hoR+vJdfDWN+A==
X-Google-Smtp-Source: APXvYqxzMReHYAEsSHL6ZuwbnY64jPC5qnuBeknw3Xb7bNVWZPF4JNwuf2donTQXV7yUbF0LMOE7nA==
X-Received: by 2002:aa7:93a8:: with SMTP id x8mr9992935pff.49.1565189842221;
 Wed, 07 Aug 2019 07:57:22 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([183.82.17.96])
 by smtp.gmail.com with ESMTPSA id l4sm93617475pff.50.2019.08.07.07.57.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:57:21 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 2/7] powerpc/mce: Make machine_check_ue_event() static
Date: Wed,  7 Aug 2019 20:26:55 +0530
Message-Id: <20190807145700.25599-3-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807145700.25599-1-santosh@fossix.org>
References: <20190807145700.25599-1-santosh@fossix.org>
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

