Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5060FAB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 11:50:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gn5P6ryrzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 19:50:33 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="mBEzBj8v"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gn1Q2bJhzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:47:06 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i8so5295158pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEGm5RO370+1d5IRbqWLncN9g8dMNoXOhptUJSSSVGY=;
 b=mBEzBj8vbsKdbvW0Zx1Dn8jQ/u53rs+b5W1ysLxVy0a4mt07Z055jidmPi5vWNZi14
 Z/usFKXwVCfIgpC83pZcACXZFqqufwWn1wgW1FaGiCoLHDG06AqX2hvK2QyJ7VvtIqE1
 aMDpa0DFVmgkr9OOM+i8RDwWEwrsktnIRrwzXRc/iyjLUcv8CTIJYR094smOXDOLO/SI
 0pdQ/xdxd+DhayzpveGvoqbFS5YRsgqpgojxg1ROEWWpklTNLXWy8fCoONbl2KRABWKc
 QHZXdlrLDv01b+l1JnMHUYQf1qjJjXp67cegxrACcyysTxTMwCD4G/DfPuL524oeMkDN
 fFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEGm5RO370+1d5IRbqWLncN9g8dMNoXOhptUJSSSVGY=;
 b=f1PKYBEnTsw0dxiQWrG8PwgrjOn3tJ/mYIeNQirTAaRG5xcgU7fPG536GBtwEoOus+
 gL2wK6O2+02ZVNfV6b6qHybsmtOWuvcw316hxPqAuUbU5Wli8CI5ho9jh/+vr3oiDxWi
 nSZR7szRS+jEb5Q7eeo9EQtE3l3Jw9bFoxNB8BPPVTBqVD23dellEckwtyvfAe8KQQla
 Dgy1pQpAUuJizf2wl4EmrjRYLA/uV+31F6Urm/btpQr6W0HMA01RSAVZHUwchTkeHKbs
 CvMlH3Adjykt5xI/5MYy4lRkWUM+klrOsUEXvW1iDcm2CQ92KbuBRqO9zAXxnbD72SiT
 n34Q==
X-Gm-Message-State: APjAAAVE9kZ48nxeLmcsK6hZpGG5WsGmaYR76yNp+LsrpMLRRB3IkcL6
 EL6e9FuFOIQhxBYaAuMHX0WkivsmUpwVow==
X-Google-Smtp-Source: APXvYqyC+Rnoihd7omNGzRD/l5Dv0DvyEPJDRKpeK/tLtYjn3pRMCtIseNPHtJGkiKEpjCXcTFeNmQ==
X-Received: by 2002:a63:1356:: with SMTP id 22mr10397706pgt.160.1562406421918; 
 Sat, 06 Jul 2019 02:47:01 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id p23sm13493091pfn.10.2019.07.06.02.46.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:47:01 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v4 1/6] powerpc/mce: Make machine_check_ue_event() static
Date: Sat,  6 Jul 2019 15:16:42 +0530
Message-Id: <20190706094647.15427-2-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190706094647.15427-1-santosh@fossix.org>
References: <20190706094647.15427-1-santosh@fossix.org>
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

