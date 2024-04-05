Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47089986F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:49:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QUh4Im+h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9scM25qlz3vmF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QUh4Im+h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKm71Qpz3vdQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:00 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c5d5de746cso696209b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306219; x=1712911019; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVYqqHarz35z2bPDLkBdM4mE9lu/iFPV0s4V9UaHozw=;
        b=QUh4Im+htEuCOb1gaC/Q0JK00CutCmfqu2MI0kCJt/ztKwripNAu39FT0rZKJCg70L
         gXWCewx/jX+dLO+ptTZLzG8qxfMyvv0jvGvwE0lwtRDTXX7V23u5vr/zewDPDf/f4J4Q
         MDzKvppsNuPIrfwH5NqnPcHP7hS9HqzLRl39dHHzD5tWnS3vNmnRXTAhmS/Fg8Fhkj0a
         tW9aGbekCMvbZPSLxatXiAeVtRhx0WxlfUn2jqfutwp73TCxoeVuAM8VVlNEWRISNgAC
         wIUuOg2d+/ss9ZaMqEALwqV/Weid3PDxCCpHdyGtXIrm3Fpd17+nps927KgZds+ewFZl
         LrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306219; x=1712911019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVYqqHarz35z2bPDLkBdM4mE9lu/iFPV0s4V9UaHozw=;
        b=gqEswZwdaaj9uExKxjSJ/YZ0lJn+ziinRu3BzjTjHpp4FrDHU8Yqvj832i18OrTMuZ
         GB72VNsflkpjS1nnBQ7NC6jt2NDp3zl9/+7ShNo4isy4AJtb80XkWXpwp3nKvnVjgBcY
         Wrd8/lc/cRPU8/Uhoqj+2qEa0QFATueiIIM0mQT3FbgUIGQ53LKaejKZYud/9n8Efb8A
         KKqJ609y1aDKcKgeau4Sa7FWLHVvqPNh1qh5CTJFamFFbz4INZ4bKTc9J/r6IbQ2ieEr
         4FrPQso8eLtxfcBqt+90lAoavwY353S6HIS367aGH54ftqK4HVgpXoiUE3voqgyXJgpu
         S/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYb329M8UxtjTKr31g5CwSaLbOfc2aO+VsKqYz8dfbvnT+4Wk42xQeSq4Y1lo7ExSWIe57uprofjYEvaOM8u5c7IRy3PZgn41+vfLxnw==
X-Gm-Message-State: AOJu0YywxVDlxvwXReQC3Ju3PEllV/0skgv1nZejQFdZrp5UlqzHnPPL
	ikkEFdKphvBQo+LcbC3yeUcpu1FdUXl20fnDTXtbw7BIgTGO0zel
X-Google-Smtp-Source: AGHT+IGONk+2bVcU1kBsY7l8EGy3hJXmRltBZFla7gk+WV2vmkiRRpwOVMFVXS3NYuIdjWZ5BW9lgQ==
X-Received: by 2002:a05:6808:1a85:b0:3c3:d587:4ac with SMTP id bm5-20020a0568081a8500b003c3d58704acmr679375oib.25.1712306219012;
        Fri, 05 Apr 2024 01:36:59 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 18/35] powerpc/sprs: Test hypervisor registers on powernv machine
Date: Fri,  5 Apr 2024 18:35:19 +1000
Message-ID: <20240405083539.374995-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables HV privilege registers to be tested with the powernv
machine.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index cb1d6c980..0a82418d6 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -199,16 +199,16 @@ static const struct spr sprs_power_common[1024] = {
 [190] = { "HFSCR",	64,	HV_RW, },
 [256] = { "VRSAVE",	32,	RW, },
 [259] = { "SPRG3",	64,	RO, },
-[284] = { "TBL",	32,	HV_WO, },
-[285] = { "TBU",	32,	HV_WO, },
-[286] = { "TBU40",	64,	HV_WO, },
+[284] = { "TBL",	32,	HV_WO, }, /* Things can go a bit wonky with */
+[285] = { "TBU",	32,	HV_WO, }, /* Timebase changing. Should save */
+[286] = { "TBU40",	64,	HV_WO, }, /* and restore it. */
 [304] = { "HSPRG0",	64,	HV_RW, },
 [305] = { "HSPRG1",	64,	HV_RW, },
 [306] = { "HDSISR",	32,	HV_RW,		SPR_INT, },
 [307] = { "HDAR",	64,	HV_RW,		SPR_INT, },
 [308] = { "SPURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
 [309] = { "PURR",	64,	HV_RW | OS_RO,	SPR_ASYNC, },
-[313] = { "HRMOR",	64,	HV_RW, },
+[313] = { "HRMOR",	64,	HV_RW,		SPR_HARNESS, }, /* Harness can't cope with HRMOR changing */
 [314] = { "HSRR0",	64,	HV_RW,		SPR_INT, },
 [315] = { "HSRR1",	64,	HV_RW,		SPR_INT, },
 [318] = { "LPCR",	64,	HV_RW, },
@@ -306,7 +306,7 @@ static const struct spr sprs_power9_10[1024] = {
 [921] = { "TSCR",	32,	HV_RW, },
 [922] = { "TTR",	64,	HV_RW, },
 [1006]= { "TRACE",	64,	WO, },
-[1008]= { "HID",	64,	HV_RW, },
+[1008]= { "HID",	64,	HV_RW,		SPR_HARNESS, }, /* HILE would be unhelpful to change */
 };
 
 /* This covers POWER8 and POWER9 PMUs */
@@ -350,6 +350,22 @@ static const struct spr sprs_power10_pmu[1024] = {
 
 static struct spr sprs[1024];
 
+static bool spr_read_perms(int spr)
+{
+	if (cpu_has_hv)
+		return !!(sprs[spr].access & SPR_HV_READ);
+	else
+		return !!(sprs[spr].access & SPR_OS_READ);
+}
+
+static bool spr_write_perms(int spr)
+{
+	if (cpu_has_hv)
+		return !!(sprs[spr].access & SPR_HV_WRITE);
+	else
+		return !!(sprs[spr].access & SPR_OS_WRITE);
+}
+
 static void setup_sprs(void)
 {
 	int i;
@@ -461,7 +477,7 @@ static void get_sprs(uint64_t *v)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 		v[i] = __mfspr(i);
 	}
@@ -472,8 +488,9 @@ static void set_sprs(uint64_t val)
 	int i;
 
 	for (i = 0; i < 1024; i++) {
-		if (!(sprs[i].access & SPR_OS_WRITE))
+		if (!spr_write_perms(i))
 			continue;
+
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
 		__mtspr(i, val);
@@ -561,7 +578,7 @@ int main(int argc, char **argv)
 	for (i = 0; i < 1024; i++) {
 		bool pass = true;
 
-		if (!(sprs[i].access & SPR_OS_READ))
+		if (!spr_read_perms(i))
 			continue;
 
 		if (sprs[i].width == 32) {
-- 
2.43.0

