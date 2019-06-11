Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8453D15F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:52:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZJp5TMVzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:52:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwaOEkqi"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZz4PmJzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:51 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v9so5369662pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RlGc7jvedizI6lERi57rGfBiDiifygWU13Wf6p4Vw2A=;
 b=fwaOEkqidsBliQQkQJqp8/rMp/SG+bwQtxfi0pF2XAJu/Jzk/w/1WXJBRhNx7T5Enr
 YAMTDVyCNT3iyyzsUxNCeMpdotNgib4UrqLtf4CEizUBHWJu12FT4iMzLhsbphz6p9Ou
 s+XYMz9214M9hNnAzygekApdjMQMkT3O37tT2lLTgz/kNu7hOlPIWFG11m6r0xS8qOTb
 pTxqP+iT/uBYMX+Ew8LakXNbaLXLRTmFMImKWxYUwbxoIe5ylKCTqeXUT2mwnuLvRlvz
 dXvFs2tg+aGf5ijD5XtOBal1vBCtY8JCgGftD7Ij/k7j6GDyIpmZjIa7e7wN2nG3PP1X
 GBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RlGc7jvedizI6lERi57rGfBiDiifygWU13Wf6p4Vw2A=;
 b=Mt5NhYxdPnonFtB8H9RJWxOz1F0zpa2rFwKaX63glQ0ZVe5Z0KJWobiMJPS2VJIEVm
 WcR3KeX9dgtwvYPIQUmcCYHhw7Nrf8WJttHgSt+b54mwESvHISpKxKtQfd2k1t/XE6sp
 xMbQZK6dWFvZh7bg3Lk67zZ/n7AAppwqWugHZAaqqeFS1Z3iG61HDLOxrZ8Cdi3T7k3A
 7v75MYAxx81O3qUfNh4/VEG0Yd7dVe2Wuevfkn6z5G3dBSIh+9khVKddKhKXmefTlpv0
 yziky71DKc0OLWcjtla9xLYM+LZbyjUr9kh+Ua/qwNNN2OZSZMyjWQZa0X5EdGllk+MG
 UyTw==
X-Gm-Message-State: APjAAAW7+VZFxcwIPk3OWEtJ0GZueUvRQpYEP8CkpuO3kmpDUkAzLCJs
 8PgF9Ssg5SdU13uUHeaxc7sIILwz
X-Google-Smtp-Source: APXvYqxei94lmFNX5/k0aW+GmZC+cE6tASK1pKEjAaHYh9utObh6M3CBSK5mjQEiu0yGyQdP6Yp6bw==
X-Received: by 2002:aa7:8817:: with SMTP id c23mr13314977pfo.146.1560263689012; 
 Tue, 11 Jun 2019 07:34:49 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 28/28] powerpc/64s/exception: avoid SPR RAW scoreboard stall
 in real mode entry
Date: Wed, 12 Jun 2019 00:30:40 +1000
Message-Id: <20190611143040.7834-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

Move SPR reads ahead of writes. Real mode entry that is not a KVM
guest is rare these days, but bad practice propagates.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d9e531a00319..df9c3126fe08 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -183,19 +183,19 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.endif
 	.if \hsrr
 	mfspr	r11,SPRN_HSRR0		/* save HSRR0 */
+	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
+	mtspr	SPRN_HSRR1,r10
 	.else
 	mfspr	r11,SPRN_SRR0		/* save SRR0 */
+	mfspr	r12,SPRN_SRR1		/* and SRR1 */
+	mtspr	SPRN_SRR1,r10
 	.endif
-	LOAD_HANDLER(r12, \label\())
+	LOAD_HANDLER(r10, \label\())
 	.if \hsrr
-	mtspr	SPRN_HSRR0,r12
-	mfspr	r12,SPRN_HSRR1		/* and HSRR1 */
-	mtspr	SPRN_HSRR1,r10
+	mtspr	SPRN_HSRR0,r10
 	HRFI_TO_KERNEL
 	.else
-	mtspr	SPRN_SRR0,r12
-	mfspr	r12,SPRN_SRR1		/* and SRR1 */
-	mtspr	SPRN_SRR1,r10
+	mtspr	SPRN_SRR0,r10
 	RFI_TO_KERNEL
 	.endif
 	b	.	/* prevent speculative execution */
-- 
2.20.1

