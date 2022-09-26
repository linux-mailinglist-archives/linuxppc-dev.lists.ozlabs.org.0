Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085F5E98D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWlk31Kbz3bdy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:39:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ODOqYTCY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ODOqYTCY;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWl375fBz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:38:37 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id y11so5236893pjv.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7ZdCMVLhYq3JRztz3HvHu0altb7sondrkVR0DIsz530=;
        b=ODOqYTCYXHe9OdG5gH9C9WM1ypus8e707X3DUNaYj2GQLHyUyyavb0ZH8n2aIz0iM8
         87IQp+XQDMZ/D/60dRi8Q32capt5tAXfMFTBnKMj3IxGJeMhHAE4HGvohqOB23UxHuyF
         PKdzGIUaPYB8t1ks1F6TgWQ0aNqtFgwRXgHpSY9OQ4SowBW4qPCWETCZYxJS0AH0JSpd
         9SwB+FKdLBI0oNdeitaKS+0A85tdZGdQCpH0Vz/fd/mK8XnHNuXmfh1jPom5BWz5sMsU
         mSNNRRIIp+qLxjYM6qaeJW1vP/tgxa6ahHmkicBYDHgRXTKca4BjqB3T6dS2RuQdH/Ft
         PAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7ZdCMVLhYq3JRztz3HvHu0altb7sondrkVR0DIsz530=;
        b=cBWeVwyXzewXBuUDtPBoGco2wwkHKo8T8SXmMfcjurr69BCjPvgDuFUooiQRH9LuhQ
         Tkqt9HuD8YUgBTJUAGvfz85IYqOdbzkEZ9vc1/IBh3WTIHDPr7X13A30lxvb7qJUOBGt
         Ks+3Il1ZqHImtJ3XeR+9f/JPwdpaER+NXNLVCx3VdFK1Y04fx4tHjV84CRPkuHknJw6z
         HEXZ1ILZElLD7w2rPeFuztUWighYlfkw2ZvTqrobo0WTAP5HFAVKlT9eyIG/ZQ8+9kc2
         K4urHH3xsShe61OEtir+2+vL3vioD07J6Wa1wAdZhe3/u6EfIrNbcawaSY14eOaiQfy/
         PPlA==
X-Gm-Message-State: ACrzQf3lorK4if2AbvjFm3+l2CFebHJdihVyW+vMbiSV9SLAybjmQ5ZR
	Qfbb4fSoEVhG7ftbNHMOOWbAZF5pm40=
X-Google-Smtp-Source: AMsMyM5y3tgJSOYTvbWhld/L1srlyjMbsUvTo7JOdw9M35z2waDGoortLNgGoOgK9ULj/6pwqYoz8g==
X-Received: by 2002:a17:903:2015:b0:178:8022:ff1 with SMTP id s21-20020a170903201500b0017880220ff1mr20514935pla.18.1664170713987;
        Sun, 25 Sep 2022 22:38:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c08600b00172b87d9770sm10169455pld.81.2022.09.25.22.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:38:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: move hcall_tracepoint_refcount out of .toc
Date: Mon, 26 Sep 2022 15:38:23 +1000
Message-Id: <20220926053823.2668799-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .toc section is not really intended for arbitrary data. Writable
data in particular prevents making the TOC read-only after relocation.
Move hcall_tracepoint_refcount into the .data section.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This is split out from "[v2,2/5] powerpc/64: asm use consistent global
variable declaration and access" because another series to make TOC
read-only depends on it. This patch decouples the two series.

Thanks,
Nick

 arch/powerpc/platforms/pseries/hvCall.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index ab9fc6506861..762eb15d3bd4 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -16,7 +16,7 @@
 #ifdef CONFIG_TRACEPOINTS
 
 #ifndef CONFIG_JUMP_LABEL
-	.section	".toc","aw"
+	.data
 
 	.globl hcall_tracepoint_refcount
 hcall_tracepoint_refcount:
@@ -88,7 +88,7 @@ hcall_tracepoint_refcount:
 BEGIN_FTR_SECTION;						\
 	b	1f;						\
 END_FTR_SECTION(0, 1);						\
-	ld	r12,hcall_tracepoint_refcount@toc(r2);		\
+	LOAD_REG_ADDR(r12, hcall_tracepoint_refcount) ;		\
 	std	r12,32(r1);					\
 	cmpdi	r12,0;						\
 	bne-	LABEL;						\
-- 
2.37.2

