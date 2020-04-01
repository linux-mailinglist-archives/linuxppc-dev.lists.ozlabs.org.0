Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 550DC19ADAF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 16:20:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48spJN0RjYzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 01:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i3LUIZfw; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48snwm0hXXzDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 01:03:34 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id kx8so2769128pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EEKP3lV2VlpKQt++4DONOFgvkw+YDut/zygrjE8fEDA=;
 b=i3LUIZfw51umE5QKDQgVBUTOLPMCSjCBRSizxiQqxRn+3P3FlEyaALfQoLgxhjbmUy
 NbZJKLxsVDMuvdRBX6hP5Hi8rqvVTcN1WRk9JHyRU+pgqtrrgGeG+8J8T3Yp6n85oSfZ
 Bo/cgVh2wsyWTn1tkTteDFh7hemSt57oL3EevoGAeAHUfp4BpwPxt5Rj7ghctFV3VamM
 zZhgVnLo4a5ayjTWOwXh0Khs38jP294No0jcQhPdAI5hfvjXoUb9bBfdLWjIvVgy02cC
 O+qCzldUlefOEaR9uFaaFoHJqMvC6m/t3+Oc6fvF4SkxdGSBDZHXONHtKeteQIe7ShGT
 Zbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EEKP3lV2VlpKQt++4DONOFgvkw+YDut/zygrjE8fEDA=;
 b=Y5GebswDQoXh+KDEI6CPglgOLjRdN6im+xLdQWhFZtXSSZdhdSD9A69AfD0wduaNgk
 IkZ0DXiMfTIu3GjtvcyFmA7j3ielfar3mPVpRXn4UdT6GlcM5tkGkkDAdN/8WWI1lzkL
 Eo0ByKz/WulS8jLfgPAb4WfVAzlFAbeYkV60xcCg8Is+TTmK2pJBuU6MQJH6rv+FJOV7
 nFw5gcXRz+YVWUrCdkShHlA7i5Osb60P5qxV4skn/tWC5oP6B9fC0uJMGMsLlmviSOPL
 1+5/K2jjGl8y3SJWjWD7LJNv2kjP1h1FwhkVhS6OgFguxKMngZLu/t3lLxdTVIcIrI9B
 qazA==
X-Gm-Message-State: AGi0PuY+pvSbi/BrukRqs92tECGfbI2dDzofz/xEz4xjuSPobCbyDULH
 0fRkexyfguSd7MkKl8GzSLNjgRjYkQ==
X-Google-Smtp-Source: APiQypJKxZzuXR4zq/VBEYjPGPea83KhAUBYGp/gTMlJgZj5ehQG+WRwYza2NfDNBVfQcmYvMCaqgw==
X-Received: by 2002:a17:902:9048:: with SMTP id
 w8mr8958739plz.24.1585749809003; 
 Wed, 01 Apr 2020 07:03:29 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w4sm1662968pfc.57.2020.04.01.07.03.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2020 07:03:28 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv4] powerpc/crashkernel: take "mem=" option into account
Date: Wed,  1 Apr 2020 22:00:44 +0800
Message-Id: <1585749644-4148-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <48c1b852-28e0-9c46-cafa-7c5992f966a7@linux.ibm.com>
References: <48c1b852-28e0-9c46-cafa-7c5992f966a7@linux.ibm.com>
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
Cc: kexec@lists.infradead.org, Hari Bathini <hbathini@linux.ibm.com>,
 Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'mem=" option is an easy way to put high pressure on memory during some
test. Hence after applying the memory limit, instead of total mem, the
actual usable memory should be considered when reserving mem for
crashkernel. Otherwise the boot up may experience OOM issue.

E.g. it would reserve 4G prior to the change and 512M afterward, if passing
crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
mem=5G on a 256G machine.

This issue is powerpc specific because it puts higher priority on fadump
and kdump reservation than on "mem=". Referring the following code:
    if (fadump_reserve_mem() == 0)
            reserve_crashkernel();
    ...
    /* Ensure that total memory size is page-aligned. */
    limit = ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_SIZE);
    memblock_enforce_memory_limit(limit);

While on other arches, the effect of "mem=" takes a higher priority and pass
through memblock_phys_mem_size() before calling reserve_crashkernel().

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
---
v3 -> v4: fix total_mem_sz based on adjusted memory_limit

 arch/powerpc/kexec/core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 078fe3d..56da5eb 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -115,11 +115,12 @@ void machine_kexec(struct kimage *image)

 void __init reserve_crashkernel(void)
 {
-	unsigned long long crash_size, crash_base;
+	unsigned long long crash_size, crash_base, total_mem_sz;
 	int ret;

+	total_mem_sz = memory_limit ? memory_limit : memblock_phys_mem_size();
 	/* use common parsing */
-	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
+	ret = parse_crashkernel(boot_command_line, total_mem_sz,
 			&crash_size, &crash_base);
 	if (ret == 0 && crash_size > 0) {
 		crashk_res.start = crash_base;
@@ -178,6 +179,7 @@ void __init reserve_crashkernel(void)
 	/* Crash kernel trumps memory limit */
 	if (memory_limit && memory_limit <= crashk_res.end) {
 		memory_limit = crashk_res.end + 1;
+		total_mem_sz = memory_limit;
 		printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
 		       memory_limit);
 	}
@@ -186,7 +188,7 @@ void __init reserve_crashkernel(void)
 			"for crashkernel (System RAM: %ldMB)\n",
 			(unsigned long)(crash_size >> 20),
 			(unsigned long)(crashk_res.start >> 20),
-			(unsigned long)(memblock_phys_mem_size() >> 20));
+			(unsigned long)(total_mem_sz >> 20));

 	if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
 	    memblock_reserve(crashk_res.start, crash_size)) {
--
2.7.5

