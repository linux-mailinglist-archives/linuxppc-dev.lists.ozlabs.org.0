Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D42BD534A6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7ytc5TWNz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 16:38:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LTtaV0TB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LTtaV0TB;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7ysy2VScz2xXS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 16:37:41 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id q18so670591pln.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVMFPRbqfbr0+Ow1PyR0/attd0/hVa7z4r02HwR3n/w=;
        b=LTtaV0TBUgt5hSXkmgl8czuxj2+Mkt9PMneFj53ROnDWfnklvJgwRXNoL/b0y+CIEv
         LXsYvzyzgFS3StokA7hS6OgXMEN9hfcdVlwEIzWC7XVAaU5RHPkAdXL1tOs02Ilrn9tr
         SCt6wCbtOGms5RdhtSo7KxzdKf4mQrDxeZowZbJ0UY4FqdTY3gy+Y/aOHIT2Pcwd4+Do
         Zi5LSk52P0giAe3olGslgK+Pn+PWhyaOfK6BM3zn6eKdpHdYtkpp9UD0E9MDRcjt1R1x
         WC+GWbYbalCeZEKPQWqyh+oyYBeTVKKVl233gNCEMci9TZm5yiPA99b90l2X6no1SDaa
         RY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=SVMFPRbqfbr0+Ow1PyR0/attd0/hVa7z4r02HwR3n/w=;
        b=4Afd8kBoMxN9RuXyXj9a62jwH+ktuUWSve0Hp2ATfAXFLsyzjrwVygSAHW0Y5yrwdT
         /BvwDibocip6IfsoPrOyCIp9CDBtNG+JfXofw+Av2+T11c84F6FkWyA8GwHLmN508b1q
         NO4vtfdAZQVlsQwzUJnbwwmXFqUOsYlcWRBkfIGl2x+bRgpIxS+l4b3XfDBmp2+1pbem
         FFvwTe464NB87IZd5l+nBFQ9piM/oP7ioHZ0Wua0JoQx85I8naHxdL6AQralcQV6+eQ7
         QOGo7GHaNc0uI8XT8wMPhVVm2xugOz53tSfZOHhRI7sKCNVJDq1sIPWehdkR9K+evy6c
         ggEg==
X-Gm-Message-State: AOAM533mdKxjmgi8Gj4/hZCwbINUgK0yFprrpV6HPWdEwI8aayJHHFTZ
	FzAF3Ybdr69NZ3LBeQJDhAU=
X-Google-Smtp-Source: ABdhPJw2LyIo7zSYe5KBvV0vBPDArIhlbG3h/htukDzKAdwn1PN8gzVA37CGFpQEm2XJdzpGgVVeTw==
X-Received: by 2002:a17:90b:807:b0:1e0:c2f5:9f80 with SMTP id bk7-20020a17090b080700b001e0c2f59f80mr1033340pjb.161.1653547058021;
        Wed, 25 May 2022 23:37:38 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id ay12-20020a1709028b8c00b00161ac982b9esm588747plb.185.2022.05.25.23.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 23:37:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] powerpc/perf: Give generic PMU a nice name
Date: Thu, 26 May 2022 16:07:23 +0930
Message-Id: <20220526063723.51471-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When booting on a machine that uses the compat pmu driver we see this:

 [    0.071192] GENERIC_COMPAT performance monitor hardware support registered

Which is a bit shouty. Give it a nicer name.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Other options:

 - ISAv3 (because it is relevant for PowerISA 3.0B and beyond, see the
   comment in init_generic_compat_pmu)

 - Generic Compat (same, but less shouty)

 arch/powerpc/perf/generic-compat-pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index f3db88aee4dd..5be5a5ebaf42 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -292,7 +292,7 @@ static int generic_compute_mmcr(u64 event[], int n_ev,
 }
 
 static struct power_pmu generic_compat_pmu = {
-	.name			= "GENERIC_COMPAT",
+	.name			= "Architected",
 	.n_counter		= MAX_PMU_COUNTERS,
 	.add_fields		= ISA207_ADD_FIELDS,
 	.test_adder		= ISA207_TEST_ADDER,
-- 
2.35.1

