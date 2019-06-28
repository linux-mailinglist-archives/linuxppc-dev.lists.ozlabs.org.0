Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85E5938F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:42:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZlyY03TmzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:42:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pPxNhXxe"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmd0FWDzDqnf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:36 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d126so2381351pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kBWknKNxwM/+LkiYlUeRRHsmo+N12kLIAavTLAX1+Y=;
 b=pPxNhXxeUGVOliwFNX06hysCCksp7MaCUqGaDui8RrdwUNBEuq4cwoKnNH5Lihoi+y
 2ZLNVkTJmJO+GHXV9gTQ1DfP1aySohUgHT7O9ELjcRS1lCrASJodFyg6+Y2jKNq1Muir
 9Y5STZlUKlrnhkuXBpSoArS3JbUQrAivUI/fm6QxJdzz4OGJhZ2w/CuKwR6n0WoT4B4U
 sVr5GnxGPMIktqpkcR3r5U6kRWZBu08SpQ0bcgZz4AFtdWVYDUWpc/nYITZUe68MeVvY
 wrL1XJ7525ro93t3FXDg0b2LDJb03fLaJlgeUAec4y/kgUsK/QbWOCC9rDt5uN5s/kl5
 KzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0kBWknKNxwM/+LkiYlUeRRHsmo+N12kLIAavTLAX1+Y=;
 b=tSqyZyUIKgly7eJGrAuiw/RrJeUD2xJqXc/jHU8aYLUh4UGQs4CUdQsNug3EWMUyO1
 wNRKoBa8YZEvdEW9JEB4d5cQhCao/iyz45e86zzeR4o5tvjV2k5j3HhSQ72DoR7iIw4T
 cnZjq71w2r+s408hRVNFNuzc0QithPLRRDdtLZ7CJVbDrmKWo4WF/v0gtXHGEopk9HHF
 2ZqLEOK+45rkHYG4nf+l2S4WdsxCbi5/zgxbGNbIZRrKk9Cr3jAAGgCr7sICOjzAx3D9
 iR5ulYcNh0iafrQXW0e6lKJaErAjYK3iQgTjpmx560jMWZLm0uVIXYValxBzWfmhIoN+
 FYhA==
X-Gm-Message-State: APjAAAUbAqTPVsh1vuqxmsv+il/pFw5JtLFxxGIEI4v6KxiBYF278Cy4
 e76xyVs82ZtjPll6CJi6o9EzSYjz
X-Google-Smtp-Source: APXvYqwu+UDbcYCQ0B3QeKw4AHyDzztavF4Ydycl6eC9XSzZgojcCUZ1hYIZvskVeHnkUcZ2YtmWiQ==
X-Received: by 2002:a17:90a:26ef:: with SMTP id
 m102mr10720693pje.50.1561700014645; 
 Thu, 27 Jun 2019 22:33:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/13] powerpc/64s/exception: move machine check windup
 in_mce handling
Date: Fri, 28 Jun 2019 15:33:24 +1000
Message-Id: <20190628053332.22366-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move in_mce decrement earlier before registers are restored (but
still after RI=0). This helps with later consolidation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b1dfd0af0120..c1d9ec5fe849 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1080,6 +1080,10 @@ EXC_COMMON_BEGIN(machine_check_common)
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
 	li	r9,0;					\
 	mtmsrd	r9,1;		/* Clear MSR_RI */	\
+	/* Decrement paca->in_mce now RI is clear. */	\
+	lhz	r12,PACA_IN_MCE(r13);			\
+	subi	r12,r12,1;				\
+	sth	r12,PACA_IN_MCE(r13);			\
 	/* Move original SRR0 and SRR1 into the respective regs */	\
 	ld	r9,_MSR(r1);				\
 	mtspr	SPRN_SRR1,r9;				\
@@ -1096,10 +1100,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	REST_GPR(10, r1);				\
 	ld	r11,_CCR(r1);				\
 	mtcr	r11;					\
-	/* Decrement paca->in_mce. */			\
-	lhz	r12,PACA_IN_MCE(r13);			\
-	subi	r12,r12,1;				\
-	sth	r12,PACA_IN_MCE(r13);			\
 	REST_GPR(11, r1);				\
 	REST_2GPRS(12, r1);				\
 	/* restore original r1. */			\
-- 
2.20.1

