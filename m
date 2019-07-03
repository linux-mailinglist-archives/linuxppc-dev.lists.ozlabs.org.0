Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F055DF47
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:04:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dttp5bFvzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:04:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XFhzwfrJ"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthT6mzWzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:55:53 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id p184so824940pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GObua8H54fup3mM+gXxoZ439qwDeiSqF74A3rMTO8s0=;
 b=XFhzwfrJGpek7ei17Q4kW1Nx8rabPjrwaPP369ghMSjgEuYU2lOJCmJxuHmhc/ClQk
 HxS9voTUAtmoph36YyCE9NRYps+4hKNvGaP8cxKIqp2NLhLtnKt8cSjnwkx7Bc4qodLo
 ZeQ5Abj5TN2vmi/6mWplHtZCbL3N/BYpLN5XE5+KYA4xdZ0sNgcmYxLWxAVCM0v9F9k/
 wsh9fvUWGSBYZLMCbvpEUbUi6WVGBwDSjHXxWJ46erS0xtEwIC2uqQVoO/xl2+mv99iC
 FTZrlmcROD+NQx45Gt4DWtGWIWeKFrsPRJdvXQx7zQVCZJEOgxA/ZD/TxSo+k7DZIeEV
 AsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GObua8H54fup3mM+gXxoZ439qwDeiSqF74A3rMTO8s0=;
 b=EqkGmncPbewumLjLjvO9IaXmLNZcwNqYsHZKMk1MtkEVtUjiXICuLszYjXaXQlnabS
 tjUICTc6jjt9Jdk5w4gVtmNxIaUqniR7euqH7D6Cxc2kljrzQi3wFffzRXvwcgRQ+n3L
 Uucdz5gx+YZPuGufFJ27Q/6EmLkRrZFcKMZWsu6bsMCvMHQeifIE4Uo+16e3gABdNAxG
 UvdFIBXVRvFcX680fieVdgI6CI7VMIsq/Gm2jb49dbeMKwND2F7Q5Rvx5e+TDyWmSJRN
 20inl0LTb8rA0di3m7OXDrFfCtdJvHwxUEiKyDR6zSeyca/jAj3+t+/kki7MzDKpSy9H
 qyWA==
X-Gm-Message-State: APjAAAXtEQvkQWQKeCQ835MJOxw9Hk/AUQxf42wSCrDmdq1CSyTo0aH0
 DTAQTCoy0BO7xItyfQ5109MjtMs1
X-Google-Smtp-Source: APXvYqyfndHQxwaJhrbm2FTEpj+KD6OVTSAjcsOa24pmO8k4OC3mB1M3zhX+ROf4gEK/nzeKRtjpYw==
X-Received: by 2002:a65:640d:: with SMTP id a13mr26203662pgv.256.1562140550813; 
 Wed, 03 Jul 2019 00:55:50 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:55:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/14] powerpc/64s/exception: machine check adjust RFI target
Date: Wed,  3 Jul 2019 17:54:34 +1000
Message-Id: <20190703075444.19005-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The host kernel delivery case for powernv does RFI_TO_USER_OR_KERNEL,
but should just use RFI_TO_KERNEL which makes it clear this is not a
user case.

This is not a bug because RFI_TO_USER_OR_KERNEL deals with kernel
returns just fine.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5789a00691f9..0186a44bb981 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1184,7 +1184,7 @@ BEGIN_FTR_SECTION
 	 */
 	bl	machine_check_queue_event
 	MACHINE_CHECK_HANDLER_WINDUP
-	RFI_TO_USER_OR_KERNEL
+	RFI_TO_KERNEL
 FTR_SECTION_ELSE
 	/*
 	 * pSeries: Return from MC interrupt. Before that stay on emergency
-- 
2.20.1

