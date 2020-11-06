Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B041D2A9909
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:04:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQFX065pzDrGs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a3Eneg0l; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7h2LwbzDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:43 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id r186so1270566pgr.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIIEpdoT5k+Q/cRJQzOOxSApk227V26+L05t3G1jq5s=;
 b=a3Eneg0lAqFX924qVGJ2ONHFkE6vojNh3qHzvffBs7wpOrn4Md+0QvUsIv7Ftj6uv4
 BieKIGfpJaHAjWZp+akLTSYln6nN8zAaSk7PqVWi+YXHZ33xvAQAFow57zHa7142I+64
 RheEMx/y4iPBvERa43USepbUhTAz/zBdgDBXJ5EKf5TQ8hM2dJmqyg9vHBA7VUpDdfCa
 bzMrHfF6MBNrTuLVeypl5DbpDd5kjcmhpikXbzTkxr+rHGXcUKdhuT5p72D4O/69H68X
 yHnzWtgEqbCcPis25yGLfkw6jmxSeFldo8zvJVT3ck/iZP98zqy0D4OgICFH690VpBHo
 xXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIIEpdoT5k+Q/cRJQzOOxSApk227V26+L05t3G1jq5s=;
 b=AHUSRzjOAybCav2eJWEP789HvZngSIfP7i6viO44YEc/psLf9mKTMfwsU83uByeuRl
 WxMu9yvGmecer5AKJqveWauOge+1FP6U3A2nodHYw1zx0ubdl6Tq72b0/NlWMr6BNM8G
 3qUMQs8yOB2MRY/9O1+SNGNaGtP4qzY/sDkYfpwZmL+VUdPgXKofLhG6JaDImKd7bEgr
 b66MzuqBCg1gQV1dZgAFiS36ZiRV+r1VFU8FSRwJS3i8/0WHzg0sZ+/M0dLso9qJJwzV
 tiytI0cxGn4IybrwRZ/PjeO0U4Vso0x/Bktxrk9YgnlSlZzu79FiNk+CdLMMdpFyCbVE
 wY9w==
X-Gm-Message-State: AOAM5330SkN92Ro7LwwNprQIwFMGbsFXOghr56OQyyfmGZn9IAVc/mU7
 f+BPYGUhOjtawGIo9HWlGZH9Lbb3sAM=
X-Google-Smtp-Source: ABdhPJzueqL78pBUYHobdiHcbKoNtz71pZ8ToJy04ZPnIkuhPWI2HoxRZE32oNO3filTFhmLzqF8hg==
X-Received: by 2002:aa7:8a8e:0:b029:160:1a45:a6e6 with SMTP id
 a14-20020aa78a8e0000b02901601a45a6e6mr2720295pfc.54.1604678380847; 
 Fri, 06 Nov 2020 07:59:40 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/9] powerpc/64s: system call avoid setting MSR[RI] until
 we set MSR[EE]
Date: Sat,  7 Nov 2020 01:59:22 +1000
Message-Id: <20201106155929.2246055-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
References: <20201106155929.2246055-1-npiggin@gmail.com>
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

This extends the MSR[RI]=0 window a little further into the system
call in order to pair RI and EE enabling with a single mtmsrd.

XXX: May need to make this radix-only opt. - might take SLB or HPT faults
on the context tracking, etc.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ea7bb7cc0db1..ad9f51e49806 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1905,8 +1905,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	mtctr	r10
 	bctr
 	.else
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
 	__LOAD_HANDLER(r10, system_call_common)
 	mtctr	r10
-- 
2.23.0

