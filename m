Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE64C798
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:44:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tsk74h5czDr4d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C105mobK"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmf0BqCzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:33 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id a186so969256pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBuB6/qrybfDYytoqa3c3abzzsDprcNpB/Tfgst0fT0=;
 b=C105mobKlthZ3uHGpX8xsnPp7p8DLm2jJ1P6mo8hEinE6bQz1k0ezEiANTQbDG8RXn
 XqCiWii4wKAueft6lOtOBOSXDCYjFtDBnQwwyqavDu1jl2+NX+Kt1H/PdJO+4VwV7R/D
 GZKQEJeSYYFvYi9DxI3oMjODPUZI04eneLHLyj1rki7SBqDkmvHFi5oRbe0iSPvlmLol
 WdfuUP4WILFJ12I8hg5pC2ryx9USc/QAbzySZSHbWLrglXw62ZpaDNuNdmiMZemdbfQQ
 6Mka4c7Lw58LV8MQZafVrWKjHb0WfR7qRPj97pblNNbXlNerLpPgEEfo3Jbv1WiJycG+
 DRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBuB6/qrybfDYytoqa3c3abzzsDprcNpB/Tfgst0fT0=;
 b=m8s07RpdS1nvAKlm7pzVPWvT8Vc7Re3xQAeK3f7D+dcmqQtGFqXTb40ohPL0n+Z2hM
 yXPM+iawfHl08KCkMoMPocEC5JwEXXBhMOicmXBzmS404+nh20ncTDFel8l4e7IbJhaE
 /54r4r+JknLccwZzI2UnWBPMO1/uyqKYA/N0MK/T6cb/GLkrkewutt6hw3KEir9ibBJP
 aeAJucDioXIyr5AL7ZeGVV/tuqMukkBVNx8iUlTCj/nhy16yfytc4qe1WQTNgF10wBp0
 ZMDz9VkaVWlCfSe7dbjHkIwEa8c+GXQJFsNBTyuIImZTEm7W9T/8yqqgtrVNBP8eEVk8
 dqfQ==
X-Gm-Message-State: APjAAAWAKjG0DmFUFDxih6Yo/jhc+ib3zK1eS7IK/IJ0tCRUWi9BvJX7
 SNZrsSH9XE1KwlOskXMtS3r3az9M
X-Google-Smtp-Source: APXvYqyqFj7zwfiNAHX60uRRFv/lAK/+w8lUH+x9F0l4LRvwwmdMfckpzV6qPPp5XL2c44avdclNzQ==
X-Received: by 2002:a65:42cd:: with SMTP id l13mr11015780pgp.72.1561007790868; 
 Wed, 19 Jun 2019 22:16:30 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 42/52] powerpc/64s/exception: machine check fwnmi does not
 trigger when in HV mode
Date: Thu, 20 Jun 2019 15:14:49 +1000
Message-Id: <20190620051459.29573-43-npiggin@gmail.com>
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

Remove dead code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 286bd5670d60..b12755a4f884 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1040,9 +1040,6 @@ TRAMP_REAL_BEGIN(machine_check_pSeries)
 	.globl machine_check_fwnmi
 machine_check_fwnmi:
 	EXCEPTION_PROLOG_0 PACA_EXMC
-BEGIN_FTR_SECTION
-	b	machine_check_common_early
-END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 machine_check_pSeries_0:
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
 	/*
-- 
2.20.1

