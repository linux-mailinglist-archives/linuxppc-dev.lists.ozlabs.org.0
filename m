Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B181CA256
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:40:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHgr34JLzDr1X
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:40:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mj+/r+VD; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHXw3H3RzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:24 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id z6so174609plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtY2WfL1JPGj+fO1hNVGxKtL2inTNkP2M7UMo8aWaBA=;
 b=Mj+/r+VDCyz+ZmPTsVVKDtyiZrVn4muSujOEeQwapKvwc2NT4YfYSEvjvPz6x7pGex
 +L8A/IRRnHgzpUgtG7uCUSgXPARQxZyEGRtytT6RVXvin/EGXvOqUz86kd5Pisy1XTnY
 9j9eXIm3WOCTHev3yJNexvSN0tcJqTUctRwXj/N0W6RilvvUb+Hwk7IUp21uU4/wv0XW
 V5C/ecDs7dr6+5ORdchDmhxaETOLR7K6FS7mB9y7FSDtTKDwRUp4Ix9KR3v6N1eBgnGw
 ei8x5SO6TJcefzM60YZOsNm1efsvz6Mzue4AnKQL7SMPHj4DukAgpQDfAub5vajN4Flh
 daEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtY2WfL1JPGj+fO1hNVGxKtL2inTNkP2M7UMo8aWaBA=;
 b=bzp8RO+qSfieAqpmE3B1fY6xgqgqpn9O+sqDwwz5GeloUUy24PqiITGQTNCQ3QPsB4
 NTyBJUGCihYNsrh1tGNji6w9EtzFxe2uOxC/koqbaKqH8295L7MeqPBSuweyK5iVJhE0
 2F4XAjtY2SH5BHDqjLfKTSa2UHuLMeXMnS1M6jjpPw+5KDdcnDDANjZhSGkE7y5xa7A6
 3zJD5hE0t+bQIfVT7LQ6meyZ8W3pkDt7vP1ONPEyRU482mTeG+r6fL/rAqYs/9cOM7jL
 yqoEIxnG4uMrOFgVcpFQml4H97DeieOlaSiNBrvLlBz92dx5srxk+HpSEXocVgADVxK3
 hDbQ==
X-Gm-Message-State: AGi0PuYZm1LqwIpaPWXXlfQEJB7lROaTGXU8JQYpL6RZyZkimblZPVoK
 nAaUp8QZ6M0EFP6yXToGPKhfxBFw
X-Google-Smtp-Source: APiQypLKrMdiVBDn44SrW1hr41/4DaohSm2r+AEIkzalu67PC8XSUVMvfdrYV+H+vT/19hxZmf+JmA==
X-Received: by 2002:a17:90a:cd03:: with SMTP id
 d3mr3864598pju.233.1588912461669; 
 Thu, 07 May 2020 21:34:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 02/16] powerpc/64s/exceptions: Fix in_mce accounting in
 unrecoverable path
Date: Fri,  8 May 2020 14:33:54 +1000
Message-Id: <20200508043408.886394-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bbf3109c5cba..3322000316ab 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1267,6 +1267,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
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

