Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE98BBB77
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:41:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=huaWFRpL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnN927RZz3gDn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:41:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=huaWFRpL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7B6Vwkz30WD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:58 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f4496af4cdso474142b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825796; x=1715430596; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FibUaZR7a7YpmE3r8aur9Iczi126UDYou5egcERbaPU=;
        b=huaWFRpLgaf8GB5SOPrkGMDon5Z4DlraVctkt8nflBGvX6+foeO14O/G1sBb9VHwp8
         gciTne6ea6LcRyJ3rCWosb4aKeKkjtpk7bELvtjIMVq2NrSVBnrDZna7qUG2v2u11ZbH
         giJ+o+/mdR34RPij2s86cHAN2ML9ew2nBoSk9yUxaFmp2rTizGxeEqj8dJOvCwcamJE8
         eX4RFxFrW7UaAfXvspwmN1+SCy8n4He1QpD9YUpACKvAvVnKCmEMb066uuWiSVPN7eH/
         XMhe0PpF9/6B8PC/pK2Ap/VKsFIxANRbm2y8ENdojDGHjT0wq5GNWrnAc9q0NvMpG+x9
         meTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825796; x=1715430596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FibUaZR7a7YpmE3r8aur9Iczi126UDYou5egcERbaPU=;
        b=qbufRzdKrZbX40B2xU1Qj/QI3sf+hPP2KRIk1cJJ8jpPyABqJBpvpeU3O33UkXre/j
         T3f3FTUBSxOnnjftv7yw4T+Xkm2cpSmAAAwuT40LhrKNw9hnlwoAFnu96nhxHp2wwCbn
         bNaSAtpg5olZcu/Uncj1NofGk+uN+H2pW47PXZ2WoD5Rwocn92V9Eizo7eLdRm4nOSX2
         pqIddmLuuafllRRl7h7s8gbVIMuxA3Lookvdh14YeAyc5rMz4wZajN+ft7Oct4UDzqv6
         L2Tqf36rK+V2ws4F4rWcqH+OK90qXGqHbXxTSrZKsLz2lHIxT4+Fw6JQH3gwwvisBLIC
         iHBg==
X-Forwarded-Encrypted: i=1; AJvYcCXtbrlJIPkL89cItpSoG1t/g1wtYeA2OAoTT8Xhqj2hY46keY3ZYWkLeGDi/xXnA2AAHJ/XQMICBwXbADVosWe84FqO9sKKy7pUEhpE6A==
X-Gm-Message-State: AOJu0Yyzs5BYAIycAQjxpJohEQyfXf/YypvlGlu0yj3OpMuZeKtzkz0b
	YC1kun1AWakR9NmKzzm0ttAowi1ijXIxEhV2e6taYliOF4Kea+ytQX3y9Q==
X-Google-Smtp-Source: AGHT+IFg9G2Bb7q3NP5uRAnJ4+QwVnW2uvirGMpGnluQF6UbjZr9y1Mkv1rM0MtalmE/Lrd9dZQD6g==
X-Received: by 2002:a05:6a00:4b4d:b0:6f4:4723:98ad with SMTP id kr13-20020a056a004b4d00b006f4472398admr6462655pfb.16.1714825796206;
        Sat, 04 May 2024 05:29:56 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 17/31] powerpc: Add cpu_relax
Date: Sat,  4 May 2024 22:28:23 +1000
Message-ID: <20240504122841.1177683-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a cpu_relax variant that uses SMT priority nop instructions like
Linux. This was split out of the SMP patch because it affects the sprs
test case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/ppc64/asm/barrier.h | 1 +
 powerpc/sprs.c          | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/ppc64/asm/barrier.h b/lib/ppc64/asm/barrier.h
index d2df29520..475434b6a 100644
--- a/lib/ppc64/asm/barrier.h
+++ b/lib/ppc64/asm/barrier.h
@@ -1,6 +1,7 @@
 #ifndef _ASMPPC64_BARRIER_H_
 #define _ASMPPC64_BARRIER_H_
 
+#define cpu_relax() asm volatile("or 1,1,1 ; or 2,2,2" ::: "memory")
 #define pause_short() asm volatile(".long 0x7c40003c" ::: "memory")
 
 #define mb() asm volatile("sync":::"memory")
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index de9e87a21..c5844985a 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -228,8 +228,8 @@ static const struct spr sprs_power_common[1024] = {
 [815] = { "TAR",	64,	RW, },
 [848] = { "IC",		64,	HV_RW | OS_RO,	SPR_ASYNC, },
 [849] = { "VTB",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
-[896] = { "PPR",	64,	RW, },
-[898] = { "PPR32",	32,	RW, },
+[896] = { "PPR",	64,	RW,		SPR_ASYNC, }, /* PPR(32) is changed by cpu_relax(), appears to be async */
+[898] = { "PPR32",	32,	RW,		SPR_ASYNC, },
 [1023]= { "PIR",	32,	OS_RO,		SPR_ASYNC, }, /* Can't be virtualised, appears to be async */
 };
 
-- 
2.43.0

