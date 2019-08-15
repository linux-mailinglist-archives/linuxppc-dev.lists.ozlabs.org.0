Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A48E1F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46879Y01yzzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:48:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="BLnqqaQj"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686zv5Gw5zDqxb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:40:11 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id c81so380323pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJYgBqte5Ii/VSliQ8oA8G2Ha5PCLW/st87+39mATT8=;
 b=BLnqqaQjeHeynjb2upKtSsQU8m3cioAHFRtTkjUpzDGa/XUf8CkP/ErCoH+EBSHzHx
 hkBF2gLJHzQi2sxZjkq1FhGkaTTyy5/FE+pJRaXsArXJg+8P8tdJtjzcG0/bKLgjlPl5
 4i9amV7QwcIvrK7kOf1QputrHeg43JC8BvGjAq2KA6ufzlBVt9CK0J+Ql8BWvJqyglmk
 dDtC6YbeidQZZqFVzuT8uoNugTM3e7CbEphDDOaMSKksVNT0M+hIX6zv11t8Q81SdgDv
 Yv8MrI+zfN0Zud3yFkFk0wfzr9krSc7MGDuPFsC3p5G4qiYBP8WRtsvjq3Fx3HGfJVvJ
 y1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJYgBqte5Ii/VSliQ8oA8G2Ha5PCLW/st87+39mATT8=;
 b=Gjsn/zVDzKswKA1Qjy+6eeQW/N/kEu1EX7mNav+IMPJUKFKoxKEq6TV0iHhWG7FH/H
 fE5qLxb+6X2EvgUADXznWoVT2oBA4fkl2Qz3WqK2R/nnHdP2QHdrjat0GhuJorYYXSDv
 6uovqKkxclW8if8oIt4dRcL1oLXU7I5mAY9KqOTvAcJsq8J7i9e12425rKZMkJfPZD3v
 eCG9zPm8W4hrLYzQanurYA+nNur/xbD7sLh+GgHrmbVJ+fz3tTLy45QhXhgUg1pYimKI
 AgjkDWGshnInuN+Bv9Tg1wWbvGCJO+mH/CJ7BCbX9vSYhEQLzP+aivX5Ksvn0jq1RqUi
 vlfQ==
X-Gm-Message-State: APjAAAX7R1bLIQnI7Iyloxfyjfm1nmWPGtPmSw3xvZwa4FEu1j0KWl7E
 f3DegGL6z98To99i2VB/5TXHao9cXRkstg==
X-Google-Smtp-Source: APXvYqynGfUANrP4f5hZr25klluqQldG/UIZYzBNgm3PsD2gdEL5UyBoWWIRuHzjIptw+X0314DW4g==
X-Received: by 2002:a63:69c1:: with SMTP id e184mr1451823pgc.198.1565829608298; 
 Wed, 14 Aug 2019 17:40:08 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id g8sm815917pgk.1.2019.08.14.17.40.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:40:07 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 3/7] powerpc/mce: Make machine_check_ue_event() static
Date: Thu, 15 Aug 2019 06:09:37 +0530
Message-Id: <20190815003941.18655-4-santosh@fossix.org>
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

