Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95B9593D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:18:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CNvy5z9rzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="tWa+y3xQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CNqL1JLZzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:14:05 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id l21so2778704pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sloTW0YEU5DdpgVJy+78o9fe+CEqOumJXiAyJzqIzoM=;
 b=tWa+y3xQrmUbjXFYL9/i7bLqTFLvoEN/X+R6ZnOhKhuVLEoiBQdR99IKDZE7nd4U9z
 mwDWr5V7mJDqHVMmbEywkVVoXikNkaSC8llGubEvqqWHiTJZWFzXr+dOHbEzCcQ5JNYj
 Cm1qCn7nPrOEqKF7Nfx9klDoiq1xnYGRQwLKHeDD4Q1tfsjOnp0w+LoAhMSsBZbZ4Fh5
 hZCLQXKuXx0SKDC4zHqAEr9ZL3LVdDp2xI/dbTwt9kqna72QHEqZfM8oWHKbXl2KKm1U
 unN5Qfr1N61EOBswiTmG+LKB3RwmXmeZlKAE7lo6gJC6a9WyjKryuw+YJbBZt3qJgo8O
 j26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sloTW0YEU5DdpgVJy+78o9fe+CEqOumJXiAyJzqIzoM=;
 b=OHP/sWvI950XQ7gB9QVwFcIA5TKCFEyKPkFGR/0sTnTr03VpWnAyasNwQXTrnbl+cO
 BoMCy8aIPzABrgjWMcVrrGq8/WpAxbF3i6MsJKyB9DK50iOzFFM4hsvpfq0xf7WMJr7a
 5+uJkoy8jgf6sWn2XFiNFsQm+hvex/ySWgdP6vwOyo88V6vI58R+R6vYV7R2eipzN4m2
 w816rc6BXxsvBz8cowTd9U7Hz3tL2Tee0uXWI3NYQsTMUDq5snsD9QBS91emM35sz+q1
 T7mfbevozd6Fv0yfRBnc7pdrTROqNDyHmp791vHeeMe8xepzpDaiTAR9DrwiXz51mPe7
 5tSg==
X-Gm-Message-State: APjAAAU7dyTWtAgUps6meCpSipwu7N42UYuUvcXdnwHTqj93mvV21j19
 MYtU0wLJUG9lWfmSpZMMAYiu9bh/4/NCSA==
X-Google-Smtp-Source: APXvYqxMP9x70oy7aMToUuCo9JKhJOhruFoPsMOCKCRG/kDeIMJQMt4VJJyz+BBRQxdGvLT9OdBbNg==
X-Received: by 2002:a63:947:: with SMTP id 68mr15413137pgj.212.1566288843562; 
 Tue, 20 Aug 2019 01:14:03 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.78])
 by smtp.gmail.com with ESMTPSA id b14sm18949265pfo.15.2019.08.20.01.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:14:03 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 1/7] powerpc/mce: Schedule work from irq_work
Date: Tue, 20 Aug 2019 13:43:46 +0530
Message-Id: <20190820081352.8641-2-santosh@fossix.org>
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>, stable@vger.kernel.org,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

schedule_work() cannot be called from MCE exception context as MCE can
interrupt even in interrupt disabled context.

fixes: 733e4a4c ("powerpc/mce: hookup memory_failure for UE errors")
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Acked-by: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Cc: stable@vger.kernel.org # v4.15+
---
 arch/powerpc/kernel/mce.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b18df633eae9..cff31d4a501f 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -33,6 +33,7 @@ static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT],
 					mce_ue_event_queue);
 
 static void machine_check_process_queued_event(struct irq_work *work);
+static void machine_check_ue_irq_work(struct irq_work *work);
 void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
@@ -40,6 +41,10 @@ static struct irq_work mce_event_process_work = {
         .func = machine_check_process_queued_event,
 };
 
+static struct irq_work mce_ue_event_irq_work = {
+	.func = machine_check_ue_irq_work,
+};
+
 DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
 
 static void mce_set_error_info(struct machine_check_event *mce,
@@ -199,6 +204,10 @@ void release_mce_event(void)
 	get_mce_event(NULL, true);
 }
 
+static void machine_check_ue_irq_work(struct irq_work *work)
+{
+	schedule_work(&mce_ue_event_work);
+}
 
 /*
  * Queue up the MCE event which then can be handled later.
@@ -216,7 +225,7 @@ void machine_check_ue_event(struct machine_check_event *evt)
 	memcpy(this_cpu_ptr(&mce_ue_event_queue[index]), evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
-	schedule_work(&mce_ue_event_work);
+	irq_work_queue(&mce_ue_event_irq_work);
 }
 
 /*
-- 
2.21.0

