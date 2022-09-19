Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCE5BCDE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRKG4TDZz3fHm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VhxOa0cz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VhxOa0cz;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRFN2pw2z3c2s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:16 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id b21so28000529plz.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=f5h7HCcn1O5csY+xJCrFCG+7GL6x1YOOvqm0fP+dhEw=;
        b=VhxOa0czejm6UFDd5V7GluF7wyGGcjJ+OPQYvhR6pvJd3i5K9x0qPTiGutJkFVQn6q
         Xcr89ksNv4w8V+Zv6h+h2AJqo9yV0dvFRNHDekbam6ivFA6i+aHMZ8mLAh5T1ADsqd6i
         /QoIiM9yPWiDK7GumgLpwrGcX9J9l83elfjciOUjQrlWZOWDDrlosQDUw3zlQxHe86f6
         UytyCbeovcavYWZXaToG0MPH1g8qQRRhdGTRuI5aMMxlsVCg9yZJgV0k3nrd08dt57Ev
         zv9506kIlwfKI6/q5Kt6Y3a+FgeG2zL2ow60bKyjUfglV8oO1sxTox6SqLbv1H4uYq3v
         4vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f5h7HCcn1O5csY+xJCrFCG+7GL6x1YOOvqm0fP+dhEw=;
        b=2QaNItQhdfHuQvlNt3paA6kcbVDP6+jbkb4gF1wxRBVkfKyqHYsjN6rfHOokwyEnGM
         3O/MJoFwFUJim57L/o7hZQJjdw9WHmIHLcqkJ81F6SGc4cStmDs2E7mCB5e2UoNahF9C
         KS8VQLCxxIq11gRrEOySYytne8LWaCuhQzsIPfD0k1iVmafqh3W1ZYPcuN1FY2dmQnhN
         OF4wBr4LZd4maH+h8+EEYx3jTANUqIgUdKsFGmhE9AiEyQJXiLvS/PT5QEVkqkErKKzi
         T7FogsDR6EWeiiRYkUJT4PzSWi1poR3dKEww80hlezpLj8z4vm7FFDM8gwcJAyGKN54z
         5O2w==
X-Gm-Message-State: ACrzQf37+/Qy7xsEg7lXLbwcwJ3QPFMIOxMXnUCpcifjkdcK4sSELDAG
	x/5bOFSKf/bWObMOYKqDFbV+etj9Q6U=
X-Google-Smtp-Source: AMsMyM7MOxAJBg5seLex0wMWqb4V/7sEvCq5mSbkMN9L45XesR4cYkjQytRPG1bImAz6FwBVmrEYKQ==
X-Received: by 2002:a17:90b:3148:b0:203:41c:2124 with SMTP id ip8-20020a17090b314800b00203041c2124mr29389975pjb.223.1663596133404;
        Mon, 19 Sep 2022 07:02:13 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/7] powerpc/64s: update generic cpu option name and compiler flags
Date: Tue, 20 Sep 2022 00:01:47 +1000
Message-Id: <20220919140149.4018927-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919140149.4018927-1-npiggin@gmail.com>
References: <20220919140149.4018927-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the 64s GENERIC_CPU option. POWER4 support has been dropped, so
make that clear in the option name.

-mtune= before power8 is dropped because the minimum gcc version
supports power8, and tuning is made consistent between big and little
endian.

Big endian drops -mcpu=power4 in favour of power5. Effectively the
minimum compiler version means power5 was always being selected here,
so this should not change anything. 970 / G5 code generation does not
seem to have been a problem with -mcpu=power5, but it's possible we
should go back to power4 to be really safe.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile                  | 8 +++++---
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 02742facf895..471ef14f8574 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -149,11 +149,13 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 ifdef CONFIG_PPC_BOOK3S_64
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power9,-mtune=power8)
 else
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power7,$(call cc-option,-mtune=power5))
-CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mcpu=power5,-mcpu=power4)
+# -mcpu=power5 should generate 970 compatible kernel code
+CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power5
 endif
+CFLAGS-$(CONFIG_GENERIC_CPU) += $(call cc-option,-mtune=power10,	\
+				  $(call cc-option,-mtune=power9,	\
+				  $(call cc-option,-mtune=power8)))
 else ifdef CONFIG_PPC_BOOK3E_64
 CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
 endif
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 5185d942b455..4bf9af6a6eb5 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -125,7 +125,7 @@ choice
 	  If unsure, select Generic.
 
 config GENERIC_CPU
-	bool "Generic (POWER4 and above)"
+	bool "Generic (POWER5 / PPC970 and above)"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
 	select PPC_64S_HASH_MMU
 
-- 
2.37.2

