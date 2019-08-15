Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFD8E1EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46874s1c06zDqPv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="aCwGXfz9"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686zk5hXwzDqyH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:40:02 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id y1so368712plp.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hX9FcR9k27bW2r47hkwwmrOs6JunuLhROiik32U8Jn4=;
 b=aCwGXfz94wukudd9tuojbYRnyA7WGGS1y8gkVhsbLxhws+h/RMlWiwFmWy8tiw/weF
 coHyjch09dwLyo4bP/3v3iRs3oi3+SaT7ebzJ9/d+6Ng4qIi+cWMqgvTbyimIFPPm9Le
 dO/MwznrDnYGoQwXstSsEBd9sK+g8sjYRFu/wMnGXY2a+/FN5DcPGldtOvw4cMzNAQuT
 y7/JIRe2hdTh9HgcTX+hN/JWm8yBFjgsJ6Qina+BqBe02RcgGTwwYfK19nPEFhES5rgK
 L0QvRTjLgkwNKfZWFxxRqoSSiEVrrfA8QA+5QCwn/u7XeVyLgfHU+DxD7yuVVGLbQxOZ
 qP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hX9FcR9k27bW2r47hkwwmrOs6JunuLhROiik32U8Jn4=;
 b=WjatAiTLSL6dxwqGYlpr1ahGZjkPmhpaIWwVpm83Y1LpnklNi94vjTRnVnpasUZyOM
 LLjbp2Xyo8yv7VEFq9ZSOy00x0Z7kzd2V9S33kAivnEqFpo+gDAx01wCrZDe0OF3YzHD
 zyCYzSET4vShNThbsCz3JNWk+tVivmwIb7PEMlOUf9Y/MSLLs0EhPuhX+cnCL/uPumpe
 CmyaiBqW7alYObUOlvpQR3aICiwz5trSIPmy1JGYsM5MuJ8pt1pA7nhpNcFEkIRK0KaP
 ts24OnvNnaiEytITiuLKC9IF/iw13tliXALmY5g4eRNBI6vL3wCxmpB6lci3/r3Lejdb
 plUA==
X-Gm-Message-State: APjAAAWlSToMi20SQTk10mgyEzlhGc618pgAXk38cKWylfmgnngpBhSt
 zeKlUOiBN9ngjspalFmc100b632gohYnWQ==
X-Google-Smtp-Source: APXvYqwxcOx+m23mKTnmX2OStoG3e6DOzHFNzvhFqCGTVqAhAdIJ5qOLmc4HnWhJPnrTOIHJi+F09g==
X-Received: by 2002:a17:902:1a4:: with SMTP id
 b33mr1859694plb.141.1565829600382; 
 Wed, 14 Aug 2019 17:40:00 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id g8sm815917pgk.1.2019.08.14.17.39.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:39:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 1/7] powerpc/mce: Schedule work from irq_work
Date: Thu, 15 Aug 2019 06:09:35 +0530
Message-Id: <20190815003941.18655-2-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815003941.18655-1-santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
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
Suggested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Acked-by: Balbir Singh <bsingharora@gmail.com>
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

