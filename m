Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097B0476B85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:13:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4cC5x3yz3djN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D/wbfINT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D/wbfINT; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgJy36GYz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:22 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id u16so20723161qvk.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4HRnFtO7nbz1o4w5nKTK+Gut+U6vAEjJAJ+AJd3BHY=;
 b=D/wbfINTAaWwtafIZLjWA/RJjtas3J8F7BtVmqIkwFxI6mohYFdkykPc8YPGY/Su+R
 B292NmkWCR0xCeuckMOkZU5giveuh//OgvU3b5jy8lnFfuV548yqIWsc6xq78A2+Zu/7
 idakBt55m41a/Sq8E716VuodR1XDA6kVs8+ORDLZCM36gfEoFMAe3vXZeeTioVxATjJN
 kLz8rR1c/02onwqOjkikn33VwetDoY0gEGkKwq+P0KkgdVSvqXYWyH/n+dyUuPwdI6B2
 AtAlPVsEgZzHcHzzjyfH1Ic+QsPamUs21csc6uJozTyXJwODOTVXK6s3AsQGEdwOasrq
 zTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4HRnFtO7nbz1o4w5nKTK+Gut+U6vAEjJAJ+AJd3BHY=;
 b=G5XzvTik6W3/DYBiWiRCndadzJiI5QIwQy9rGH5e0McGDJYVRfbyVqRIjx+dhktyyC
 HriFT7DCOm4qtnIK1f2olTYdZ5G3MYRaBFT0KQyzLzbcSVUH/GRX5JzT4w0+fCw0pqeq
 N3JExQ1keDmNUP4twt3nXezc5HvcPOR918e8XsxnD87RCGLPkEzFZ9OaXHKOZl9GcxwQ
 iyk7qEwSsGoZFpYwvPZDmF/JQnbOtxOf90ahS1djdd8kKKlDJyU1I20L7GWtSijph+ol
 s1h7c4db6Rs/DDHhrfBBD9TLYHPpcBtqKsTCyQQG/awu3E8H4Us3OZbrWTcjiBr1S4Ks
 XqOQ==
X-Gm-Message-State: AOAM531kcswYuX6fFtWv/YS/lOuFQOFVijNokb/KcPf59vVjRtniqY76
 wbdqCMRfVj8SKk54JfJAWzjtQGWZeP4=
X-Google-Smtp-Source: ABdhPJwRc8zx4ITChlpj3qpWljSqyEuZya1hvGPbjiZkL8QW/n8YhQMew/gITHs7hFnG3I95KkWlqg==
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr11736334qvb.47.1639584799181; 
 Wed, 15 Dec 2021 08:13:19 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:18 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/20] powerpc/perf: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:27 -0500
Message-Id: <20211215161243.16396-5-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/perf' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  2 +-
 arch/powerpc/perf/core-book3s.c              |  2 +-
 arch/powerpc/perf/generic-compat-pmu.c       |  2 +-
 arch/powerpc/perf/internal.h                 | 18 +++++++++---------
 arch/powerpc/perf/power10-pmu.c              |  2 +-
 arch/powerpc/perf/power5+-pmu.c              |  2 +-
 arch/powerpc/perf/power5-pmu.c               |  2 +-
 arch/powerpc/perf/power6-pmu.c               |  2 +-
 arch/powerpc/perf/power7-pmu.c               |  2 +-
 arch/powerpc/perf/power8-pmu.c               |  2 +-
 arch/powerpc/perf/power9-pmu.c               |  2 +-
 arch/powerpc/perf/ppc970-pmu.c               |  2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index f4c3428e816b..858d3f97e6f9 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -98,7 +98,7 @@ struct power_pmu {
 #define PPMU_LIMITED_PMC_REQD	2	/* have to put this on a limited PMC */
 #define PPMU_ONLY_COUNT_RUN	4	/* only counting in run state */
 
-extern int register_power_pmu(struct power_pmu *);
+extern int register_power_pmu(struct power_pmu *) __init;
 
 struct pt_regs;
 extern unsigned long perf_misc_flags(struct pt_regs *regs);
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 8d4ff93462fb..35a2aa46bbd3 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2392,7 +2392,7 @@ static int power_pmu_prepare_cpu(unsigned int cpu)
 	return 0;
 }
 
-int register_power_pmu(struct power_pmu *pmu)
+int __init register_power_pmu(struct power_pmu *pmu)
 {
 	if (ppmu)
 		return -EBUSY;		/* something's already registered */
diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index 695975227e60..b6e25f75109d 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -307,7 +307,7 @@ static struct power_pmu generic_compat_pmu = {
 	.attr_groups		= generic_compat_pmu_attr_groups,
 };
 
-int init_generic_compat_pmu(void)
+int __init init_generic_compat_pmu(void)
 {
 	int rc = 0;
 
diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
index 80bbf72bfec2..3e6aba6d05e9 100644
--- a/arch/powerpc/perf/internal.h
+++ b/arch/powerpc/perf/internal.h
@@ -2,12 +2,12 @@
 //
 // Copyright 2019 Madhavan Srinivasan, IBM Corporation.
 
-extern int init_ppc970_pmu(void);
-extern int init_power5_pmu(void);
-extern int init_power5p_pmu(void);
-extern int init_power6_pmu(void);
-extern int init_power7_pmu(void);
-extern int init_power8_pmu(void);
-extern int init_power9_pmu(void);
-extern int init_power10_pmu(void);
-extern int init_generic_compat_pmu(void);
+extern int init_ppc970_pmu(void) __init;
+extern int init_power5_pmu(void) __init;
+extern int init_power5p_pmu(void) __init;
+extern int init_power6_pmu(void) __init;
+extern int init_power7_pmu(void) __init;
+extern int init_power8_pmu(void) __init;
+extern int init_power9_pmu(void) __init;
+extern int init_power10_pmu(void) __init;
+extern int init_generic_compat_pmu(void) __init;
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 9dd75f385837..0975ad0b42c4 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -592,7 +592,7 @@ static struct power_pmu power10_pmu = {
 	.check_attr_config	= power10_check_attr_config,
 };
 
-int init_power10_pmu(void)
+int __init init_power10_pmu(void)
 {
 	unsigned int pvr;
 	int rc;
diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
index 18732267993a..753b4740ef64 100644
--- a/arch/powerpc/perf/power5+-pmu.c
+++ b/arch/powerpc/perf/power5+-pmu.c
@@ -677,7 +677,7 @@ static struct power_pmu power5p_pmu = {
 	.cache_events		= &power5p_cache_events,
 };
 
-int init_power5p_pmu(void)
+int __init init_power5p_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5+")
diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
index cb611c1e7abe..1f83c4cba0aa 100644
--- a/arch/powerpc/perf/power5-pmu.c
+++ b/arch/powerpc/perf/power5-pmu.c
@@ -618,7 +618,7 @@ static struct power_pmu power5_pmu = {
 	.flags			= PPMU_HAS_SSLOT,
 };
 
-int init_power5_pmu(void)
+int __init init_power5_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5"))
diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
index 69ef38216418..aec746f86804 100644
--- a/arch/powerpc/perf/power6-pmu.c
+++ b/arch/powerpc/perf/power6-pmu.c
@@ -539,7 +539,7 @@ static struct power_pmu power6_pmu = {
 	.cache_events		= &power6_cache_events,
 };
 
-int init_power6_pmu(void)
+int __init init_power6_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power6"))
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index 894c17f9a762..99b5ba314ea7 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -445,7 +445,7 @@ static struct power_pmu power7_pmu = {
 	.cache_events		= &power7_cache_events,
 };
 
-int init_power7_pmu(void)
+int __init init_power7_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power7"))
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index 5282e8415ddf..f21194b5604a 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -378,7 +378,7 @@ static struct power_pmu power8_pmu = {
 	.bhrb_nr		= 32,
 };
 
-int init_power8_pmu(void)
+int __init init_power8_pmu(void)
 {
 	int rc;
 
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index ff3382140d7e..4b7c17e36100 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -452,7 +452,7 @@ static struct power_pmu power9_pmu = {
 	.check_attr_config	= power9_check_attr_config,
 };
 
-int init_power9_pmu(void)
+int __init init_power9_pmu(void)
 {
 	int rc = 0;
 	unsigned int pvr = mfspr(SPRN_PVR);
diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
index 1f8263785286..09802482ba72 100644
--- a/arch/powerpc/perf/ppc970-pmu.c
+++ b/arch/powerpc/perf/ppc970-pmu.c
@@ -489,7 +489,7 @@ static struct power_pmu ppc970_pmu = {
 	.flags			= PPMU_NO_SIPR | PPMU_NO_CONT_SAMPLING,
 };
 
-int init_ppc970_pmu(void)
+int __init init_ppc970_pmu(void)
 {
 	if (!cur_cpu_spec->oprofile_cpu_type ||
 	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970")
-- 
2.25.1

