Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1CF477FC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:03:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR2z3ZpWz3dg2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:03:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2cOTLe0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=I2cOTLe0; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzV17Vbz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:53 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id m6so590678qvh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8j10UXEHLrL4Uxp9Y6hxfOFIwQv0UYRt8V9/xVxi+pA=;
 b=I2cOTLe0c8ABy1dSr+2D4+PIsizf5ZSXV6ULTM/MNlNfXpxFmxqjqVINsEqZ71rV/S
 j8+UlFkJPNhcm1umrFCQ+N6T7x9W7QlbheY6HW/kwjJXm0qaNs3rTcpe1PY7hgh0xO6+
 jBpdfjLFEY8MqhvtVKtwYJOqNl4kZzEKMC0wYDqkYmfIRUWBNr+nrbDm/wAStNuu9HxS
 2jOAIqRSWWY8p+CdrjxHTYUaaG6EeFnLyYiaJEtwZM+nOX8CBcCwyJDk/1tbWCA2cSb9
 rjZCzo8TMVUjmYDGEUizTW4RrfejUbaYBLu1jeUsXTJm+lUYF9fkxYwC8nAusXVONh6D
 iIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8j10UXEHLrL4Uxp9Y6hxfOFIwQv0UYRt8V9/xVxi+pA=;
 b=hfmCXx6RGgjH08dlDBmAKKwewbvR+029kHQ9Vu9FRzIGnlYDGR56+to0Y+KxtVzbRf
 GQ8VmcHZcQ6ykvVEKuiPH26ahYbaIbNNpCfFoUQxNg8O27Wnve5+SaiLz03jzhgJEGiY
 KEnj2mgvbAhqZKqIVr4RVF/3D1kq10L3TvSpKeZVWQcUIJl5RDqCZMBk/t08ENezat9j
 J3yF/Lp1fjX7W4ljCymAdNn5wWBe4NbBvVcW3hXnvJLegLiY08i82cb/aoXwhk2dRSok
 5Olb5Vxz0r3NdqDBazJvTfNQ9PZ5aM7r8qe2/uOiCtGG2udOpt8AMd+LmoGm8xH9tK/C
 wQhw==
X-Gm-Message-State: AOAM532270rCKpyL+cxH/0DgzTehAkxv4U9s7fjshAUcbnAGKS8n4YQZ
 ZvfUA/Lm6Y4CYDMaA49BNE5CAVY/IdQ=
X-Google-Smtp-Source: ABdhPJxgJ6a16qmStzaXxM6oB0wNn8FZZiPy/q9z/t7Y3N1iC+XxeC5svRwZwPUPzykJqvsWFLRVhw==
X-Received: by 2002:a05:6214:29e7:: with SMTP id
 jv7mr8355757qvb.16.1639692050830; 
 Thu, 16 Dec 2021 14:00:50 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:50 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/20] powerpc/perf: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:19 -0500
Message-Id: <20211216220035.605465-5-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
index f4c3428e816b..e2221d29fdf9 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -98,7 +98,7 @@ struct power_pmu {
 #define PPMU_LIMITED_PMC_REQD	2	/* have to put this on a limited PMC */
 #define PPMU_ONLY_COUNT_RUN	4	/* only counting in run state */
 
-extern int register_power_pmu(struct power_pmu *);
+int __init register_power_pmu(struct power_pmu *pmu);
 
 struct pt_regs;
 extern unsigned long perf_misc_flags(struct pt_regs *regs);
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 1f1ded29a06e..15a4f3b87bcf 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2448,7 +2448,7 @@ static int power_pmu_prepare_cpu(unsigned int cpu)
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
index 80bbf72bfec2..4c18b5504326 100644
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
+int __init init_ppc970_pmu(void);
+int __init init_power5_pmu(void);
+int __init init_power5p_pmu(void);
+int __init init_power6_pmu(void);
+int __init init_power7_pmu(void);
+int __init init_power8_pmu(void);
+int __init init_power9_pmu(void);
+int __init init_power10_pmu(void);
+int __init init_generic_compat_pmu(void);
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

