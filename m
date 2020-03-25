Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCE1925D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:38:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPjl3SbFzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:38:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tmivXP7w; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPd95vrxzDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:34:53 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id g18so667894plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mNj/TlzLnylpgNirn/Uu1rtzilwWmVyXXTASyWvdwM=;
 b=tmivXP7w5oNWxyOxiBOs8WP+wscRC/OuhOt0D0fH4Ip1hhhsCmICdN5vjRCdidoxKP
 oFGX9HDGBurlpubWc28DklTToizX8PhqOJQCW+UlyU8ZU3TfvILrvdynAE2sN6CAVy7/
 gT4kniF0ZpsrdGeTm3tbD3NrWjGm6xZT7VqOfYdWs9YHSlK95J/JoBS7lTL0h5kmz4PS
 DXekfzxN38sK+eOQxeKsUNjPuTo18ysFRzyCaAbiMnoGkAXUfTkgGSq8TXcoz581kF1c
 MvIIJUCKK+uK8X7RFp74Wy1S4cvOTrqkqekcYZmLVsEpvIilW5HRl0yxIWPTeh0HlxPa
 9cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mNj/TlzLnylpgNirn/Uu1rtzilwWmVyXXTASyWvdwM=;
 b=DH1yNXwEiWUUl/iWSrIgMXK7SCdf918zfmvfVKYIJMCU8tnqLGlEFG1dT5AbYjQks5
 FDVV5k3Dvo0fuUqGIMJ9LRmHCUyzEYrfOVB4PkaiE+3DTXlyddViMDLp83US7UAw45qc
 L1ChEwhKeAcmLQeQqqK7OKIMxfVWb0FwyTQfapHrcNYrQoxaQ337sLo/8visJHeEtOkh
 NmuLOc6Kec6j+f6nWk/ECCRoP3D385I3tgoxlBq1ZXp8aMDCQczWmPRaKGuADtiGF6vl
 evOyJLOwQ81UVFav70UDmTq/JV6+iz0Z58nTGlNNUr6Yvd9RNsyDIqG2ljykBBoCfVd6
 u8Hw==
X-Gm-Message-State: ANhLgQ2dZjehgRj8edc8qDppEl/SAmh8WRj3FosO9LWBGgw82QvbqyDv
 nvkEOuWBd463jnMntNM5JYLqHdL4
X-Google-Smtp-Source: ADFU+vu0gVgv5aD7/Lt8ns6yfna31it5cvGIb/5q4loaDw1ps9vlEX+yeIy3he6Ek/VFLPGwT9SZ0w==
X-Received: by 2002:a17:90a:c790:: with SMTP id
 gn16mr2981684pjb.146.1585132491120; 
 Wed, 25 Mar 2020 03:34:51 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:34:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/12] powerpc/64s/exceptions: Fix in_mce accounting in
 unrecoverable path
Date: Wed, 25 Mar 2020 20:33:59 +1000
Message-Id: <20200325103410.157573-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6a936c9199d6..67cbcb2d0c7f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1335,6 +1335,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	andc	r10,r10,r3
 	mtmsrd	r10
 
+	lhz	r12,PACA_IN_MCE(r13)
+	subi	r12,r12,1
+	sth	r12,PACA_IN_MCE(r13)
+
 	/* Invoke machine_check_exception to print MCE event and panic. */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-- 
2.23.0

