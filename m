Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12D899D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 11:30:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Vvc1vr3zDqNt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 19:30:52 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="S4icX2XX"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Vkd38LwzDqZ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 19:23:05 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id i2so47676991plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 02:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJYgBqte5Ii/VSliQ8oA8G2Ha5PCLW/st87+39mATT8=;
 b=S4icX2XXM6aIjRUdCAkkGKuWAlG5xkCElu+5yhd+i9XYs2hv+ypGPPVNmlizlHd8aS
 kXcJ6Wf+v9zz5MCleydykchsEAViVPb4zRVxyF+l2XG+3trA+2rE1Aw+8Y9/TPCZfobf
 bPqqWDvmeBP28baUu8om09wmBoeD1FzDQprayAHHjJcAxhv859rl8sn7uIC3hpffO6Dh
 arS1uY1FrlvK814Adh3FljnYif/ReiU3MKRxAMfM2TxgJD3kRxz+NiYEw+kJ43VhU3UM
 dL6x26v1zKNTqtLL40/gG2R/Ev8c9WzaOhcSdZn8M4KXUm1+eFsR4BoHcBwF6oPYh5YO
 hTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJYgBqte5Ii/VSliQ8oA8G2Ha5PCLW/st87+39mATT8=;
 b=WH4DxYVXcPbz7zaKudVu7T85zLTWLd9NLR8PieTi3vKAr607t47pFDhCQkz4tQ09OR
 IpfP+h6Ft61GGJ75mnTPQmEPn8Zzaf7FgmWfyOHbSknJvC+cVyzBF/zKI4qU393X2gxK
 qekKOr1+hFwX34rYeRkwxi8+gWGIzgaNxDYz1syri/RGYMoNeTmkkp//8RDxSLXLnL33
 NcoCIXFsPbqCy1+xW2zVDOZeWrFsRSwHePVptZc6aHOp1IVAOkV3cHy/nSPcoXTuJwKf
 w6ujyHuHxhWJFuCDZs7e9wQeHy/zvMln1kZglNGVFX6ti0hnMGeko2M6mqkC6dRl1tnv
 fMKw==
X-Gm-Message-State: APjAAAXXsMZL7ox4wZRtzgwQnd3q0/1nSzgah2EnxlABaYbv0x/0G2MC
 9Ky+JKtNg+kAdWAvNLm+DY23XTEnD7Gz2g==
X-Google-Smtp-Source: APXvYqxjMi1RdbCw38eLMQP/8fgPlz8ypjbBhtn9w4gdYK0krPBKiebotVX2Lf+DSq11TIMl/TjBRw==
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr32274336plq.218.1565601783051; 
 Mon, 12 Aug 2019 02:23:03 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.75])
 by smtp.gmail.com with ESMTPSA id y188sm10543517pfb.115.2019.08.12.02.23.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 02:23:02 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 3/7] powerpc/mce: Make machine_check_ue_event() static
Date: Mon, 12 Aug 2019 14:52:32 +0530
Message-Id: <20190812092236.16648-4-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812092236.16648-1-santosh@fossix.org>
References: <20190812092236.16648-1-santosh@fossix.org>
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

