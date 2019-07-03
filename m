Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E15395DF51
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:10:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dv0n1PP2zDqSd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:10:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6pFMRAq"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthd43PqzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:01 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g15so791131pgi.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQeLG+f8ET5u/YrOrVFZ7LJHLtCq+lw80ktcqY0BsDk=;
 b=e6pFMRAqhwRNP+xb9vBuTcT5OSI+39Me71VWsPUbIBsANWBak1SAFMk3syiSK9ieR4
 MFe0OZ61E6qHX2jOnsKNL6Pig/IAqZ/Bb1PavWFBd56idZu1qb/YfIp/6hKFmYSD53Rc
 0izMWRmEYtEcnwloRfrT7DgZjKlGfrvYHidiIEKcqxMAGU0n5ojHwg7aiMvo7YU3CheT
 yHPD40sEfYa0rluRUG4BOheu2LRKMdVJDP09Hz4G5y1jNkR2dtKgL6CJv50SUT4ApGxB
 mYND9pd1TM42yRabX4BAZpfwW5p9xOHHdKQdMbBzHawocmlk6gmPV+KNkVseIMny1g8H
 MWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQeLG+f8ET5u/YrOrVFZ7LJHLtCq+lw80ktcqY0BsDk=;
 b=qAIO2RRC/6LmQVaSTAIsuQhl4XXPM29ZRsDS2a13A1pfVzKSteYRTPCmnxxgsoKhV1
 SvP7MOa7xxNrTcUl0QpM8RoRVNCGUcXM8PjHlVPZrmwFhAKsEEeCYJPqBf5IJT902pew
 JNjQE4GmLANiOHtAj7bjLjBNICxGXX6omBYutYKwlA2qZLtvGDajk0PvNJZLLRQOwY3j
 /ip6Guf2cbyDJtykB0SpS+5CJN3AQe2EGR1+ozXZgHLztHh4QOArUXNe+GYYMYGzPaCM
 cTYOfFNPF/w6JnYahaOf7us+4R9pUc0SrVHtzNsePP9Yze2VJUBNiI+wW5IsBWdFo0hs
 4AiA==
X-Gm-Message-State: APjAAAXo5hztKG2DAzszwIYKCiuWGFvO/KwNgLhH/dJafKd0fA8JRiQ+
 DCqfkyUU1yL9ZA7DWbgg58D7BiNt
X-Google-Smtp-Source: APXvYqxtA93wFsFyk8bdISKzUHDQYZcKK645drshjvVaGpLTys3ee9U/T+IHE3wZvhUs2gy0/iz6nA==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr11162599pjd.72.1562140559065; 
 Wed, 03 Jul 2019 00:55:59 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:55:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/14] powerpc/64s/exception: machine check use correct cfar
 for late handler
Date: Wed,  3 Jul 2019 17:54:37 +1000
Message-Id: <20190703075444.19005-8-npiggin@gmail.com>
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

Bare metal machine checks run an "early" handler in real mode before
running the main handler which reports the event.

The main handler runs exactly as a normal interrupt handler, after the
"windup" which sets registers back as they were at interrupt entry.
CFAR does not get restored by the windup code, so that will be wrong
when the handler is run.

Restore the CFAR to the saved value before running the late handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 54ca2b189d43..f2c24a4ae723 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1186,6 +1186,10 @@ FTR_SECTION_ELSE
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 9:
 	/* Deliver the machine check to host kernel in V mode. */
+BEGIN_FTR_SECTION
+	ld	r10,ORIG_GPR3(r1)
+	mtspr	SPRN_CFAR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-- 
2.20.1

