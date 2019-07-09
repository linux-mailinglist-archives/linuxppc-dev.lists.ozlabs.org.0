Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D3463586
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:21:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jhJV0K6BzDqBG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:21:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="WOizcZs9"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jh9b1JKKzDqBG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 22:15:47 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id l21so5350993pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEGm5RO370+1d5IRbqWLncN9g8dMNoXOhptUJSSSVGY=;
 b=WOizcZs9v6vfzMjSAwsxUTZr8HRQuZkMIXs35U6NVDapUVL1hscQFMSZl0VemXWbwQ
 wPtTNPuEckt0rmSIp5VkYT8DBlzwnNAwJwXpsLocRULPPjrlCuX6lmudgxDJW5PfFAco
 lNMFE8wDqvByBx27hTYwxihYQDpj9KpSF8GERrmg+6metVI5zjjFLIv3AvPzTf+GjEWW
 Ayh9CuWVlHutAMuZtbNO/eHjDAw2llAzK0bL+kfLPlzAxDF9lTCQmiAsR9o2i5MVDtmq
 M4Q0IyDODehuc038NLwnyNfomepPCoHYc776YVtx2kO9pS1nV+Cg08ByHtdJDYFf+szs
 TjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEGm5RO370+1d5IRbqWLncN9g8dMNoXOhptUJSSSVGY=;
 b=XSKta2mAZvNEt4yIE+oau0MrBYlRnMH1fgOoT5iC7Dzaj5OYvD8ZIpUt43Sxsgq7TN
 Cu+EUnbU0Ikmx+jNTbxlNXZSp96A6rgVg3/CVy5KKZX8V3zZmlmRXN72dLhzXz5gSLgR
 U3Plg8ke4EX1i92Nt92JC032+wCBkI/01xQYNqIHGSzRPwQgERdR6vzAMZHoT7hzJUBo
 IxNoc3MMIsPE0hpDuDd7/xt+93iWDJpYOffAylNVy32txU+/BE+l7lpoyFpNd3WiDLIj
 xcA7cqzIIH/pnraccfA5zlaBv6AHxB15sFQx33n2CS6+4NGRInAujCdBfmqHb0GW+4tU
 RmNg==
X-Gm-Message-State: APjAAAUMx9D/rWFDAcFp2dinLmPTM7fFPp4pJCxOytTcffg1JWb3GEg1
 7TK8ic5cZNoYSVGgDRDKryI5g9z+Tz12jpRI
X-Google-Smtp-Source: APXvYqwgynr3BUnrTGLgu4deUSaQXIo1BtFn5NAG/AplpsZcUMvzgFzdvi1iY5oZukQevHnvTZh0rQ==
X-Received: by 2002:a17:90a:8d0c:: with SMTP id
 c12mr31348441pjo.140.1562674544487; 
 Tue, 09 Jul 2019 05:15:44 -0700 (PDT)
Received: from santosiv.in.ibm.com ([223.186.121.175])
 by smtp.gmail.com with ESMTPSA id o15sm21243933pgj.18.2019.07.09.05.15.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 05:15:43 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v5 1/6] powerpc/mce: Make machine_check_ue_event() static
Date: Tue,  9 Jul 2019 17:45:19 +0530
Message-Id: <20190709121524.18762-2-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709121524.18762-1-santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
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

