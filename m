Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C124C7D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:04:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tt8d239RzDr0X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:04:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vPqbji84"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqn24608zDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:54 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id w10so920799pgj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+o+ck5DbwN8p5JRXUvqQTXITr0Xj8W5nIUWrEQvZz1Q=;
 b=vPqbji84+XnSGqdR6CqCTYDPxFi4aTf+kks7hkLx5Pta6TLcragc8zv2jLMCDkht/y
 SdEAwXu7pQktym3u0BwRiDHQY0Rh3NJYlamqBb0DkHaRNuA/fdGMkMD5mwHXDfXeFBkL
 6B9tulsjvreBY2EkpItqJKYynj5x6vRa01iALtu0DX4Y1uktmT+dCc72KMTe4z5pBiaT
 ahq3uMZmkb22NJySR7ODlon4KKKESpNLE050XcXyCtxUrWQoC3xPADbwW0JSzqooE8WI
 lD+KeguwijD9RfDNOzczv5YHPDplQ/V73JfRVwz9Jc21ef1IGhiMuKCyCb5BiBKQj2tn
 bPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+o+ck5DbwN8p5JRXUvqQTXITr0Xj8W5nIUWrEQvZz1Q=;
 b=IR0P7ATYifFkKIhaNF3XS643rsBJMOlqKzeWb7NetAOxV9xnf1x72BEgunYPLxczhF
 xgIsKwKEuNmrlc7Snvge3JMJSmjuTE54GxUrvBZh2zgH4ng87MDnQ2xwWihy1i4R355c
 qXymiKumx1JcK0gL9pgXyf0KvN978XotFIwh9W8Hsw31WQ0f9ZdXv2NaDtbuz6HhJKC4
 MXqmo6QsjZai5iGVS6dFeIqAQeDFzBhkkrLWYgAKpI2HZQQZo1FLoN26cCVYN/uGl9Jq
 H5ucvlSm0VAh7/SgnqxyskAAiV6ngwDCncLmFqe2f2Ysq1Fl+hkKSYy/ANkmDHNtywmc
 Synw==
X-Gm-Message-State: APjAAAUc4m0MezA0ddw/jx7pXJQsLqpBpLXiclpE8J5s/bQCPkgVyQrO
 EvHuqVw79CZhIYw6MKe8hTUpjlTs
X-Google-Smtp-Source: APXvYqxbspgfgjLsf0PXZdIgx5EQpCzp7YqGEpHYsVm9sT/ku602tCcHKkrQJYPI1oPdRfysU6aGRQ==
X-Received: by 2002:a63:d944:: with SMTP id e4mr11142307pgj.261.1561007811693; 
 Wed, 19 Jun 2019 22:16:51 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 51/52] powerpc/64s/exception: machine check improve branch
 labels
Date: Thu, 20 Jun 2019 15:14:58 +1000
Message-Id: <20190620051459.29573-52-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

Short forward and backward branches can be given number labels,
but larger significant divergences in code path a more readable
if they're given descriptive names.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 793d611fa937..e21bf047156d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1071,11 +1071,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 	 * continue in host kernel in V mode to deliver the MC event.
 	 */
 	rldicl.	r11,r12,4,63		/* See if MC hit while in HV mode. */
-	beq	5f
+	beq	1f
 	andi.	r11,r12,MSR_PR		/* See if coming from user. */
-	bne	9f			/* continue in V mode if we are. */
+	bne	deliver_mce		/* continue in V mode if we are. */
+1:
 
-5:
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	/*
 	 * We are coming from kernel context. Check if we are coming from
@@ -1084,7 +1084,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
-	bne	9f			/* continue if we are. */
+	bne	deliver_mce		/* continue if we are. */
 #endif
 	/*
 	 * At this point we are not sure about what context we come from.
@@ -1112,7 +1112,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_USER_OR_KERNEL
 
-9:
+deliver_mce:
 	/* Deliver the machine check to host kernel in V mode. */
 BEGIN_FTR_SECTION
 	ld	r10,ORIG_GPR3(r1)
-- 
2.20.1

