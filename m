Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6429B06E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 04:53:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TNd66Ng5zF41X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 12:53:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqdDS0wG"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TNYN096fzF3Wv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 12:50:31 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y72so14925378pfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 19:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=n/i15lJyb1MzXE9Xx1fUJC902Nl0QInmyFCR0lCRTMc=;
 b=nqdDS0wGbqMrWUPRFMolZBANx6Jdtdr/9okl4vUBbW/htGbGHF5Rg9b6f3aW9twGzI
 Bbr+r3bAp5I1JTV9dcg1YVRU/rESw6UuSqqF4099WOAb+yUuiT+juZLPuA1zSu9QiSgL
 xuv5aeljBMJe2L6AxLbh08tdsz6EUDHJUa1gfLlhrbdCcmbBnCl5Wl3rb3YNDXth3onD
 AXb1wrgoVjFw9F+vq5n8teiD7fpHFec8lu2kttyNqMDxbsQci0vf6bEFORfJdMpV4S8m
 ri/JuJ3HxAz0vDSo8Hrxwlc1+1/mbG9IRdTLkT4PtmAS5OmFb5a96gF9DysqZyrLW1MD
 gFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=n/i15lJyb1MzXE9Xx1fUJC902Nl0QInmyFCR0lCRTMc=;
 b=he0qIbAR6ktF5KOQbGT11DmdNMiNOWnz9NOph62O7sFMhGelyPhh4/+pjfyEBKmaAN
 MrdKB3IN2Z4dXGSDS8SEfqpO53P6T3+/wnnOu/rfvPkd2Ev5/LEeUc1cE4Fp/AdqfDLe
 2WYq3oEHLSTDvzXWHcRQqt7q4NB4kHHv1PDwdxWt7/iaPrCs0KmO+9gJeQcyTdTC10PY
 0ewqMR7lVlLegyjWPcB9qthwBQf6whMxFM1XWgB8QH/zm1Qs99nxCImkn5BdUl+jbf4R
 TsdirG37lbLsNXe9NLnxMQ9BTbO9Wo2LlV7ASfGH9ja0fj+yYu8BhDoNfoZQ8SxOVdRA
 NkTA==
X-Gm-Message-State: APjAAAVjLP1eTsAOZf+QDx6BzYtqeqQ6B7hHHSHXejw02d7FpcknbxDk
 HuCgW+MtNmadvUPMsSYth86ifkU=
X-Google-Smtp-Source: APXvYqxnNNlE+dNVdrA8nJZlW1tAILdx8x/6LvSTwROPZkE5AthrtZidbLN7o1J73lVFBdmJxC627g==
X-Received: by 2002:a17:90a:33c1:: with SMTP id
 n59mr2376589pjb.20.1568256628925; 
 Wed, 11 Sep 2019 19:50:28 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d22sm4835412pfq.168.2019.09.11.19.50.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 19:50:28 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/crashkernel: take mem option into account
Date: Thu, 12 Sep 2019 10:50:17 +0800
Message-Id: <1568256617-14030-1-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'mem=" option is an easy way to put high pressure on memory during some
test. Hence in stead of total mem, the effective usable memory size should
be considered when reserving mem for crashkernel. Otherwise the boot up may
experience oom issue.

E.g passing
crashkernel="2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G", and
mem=5G on a 256G machine.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
---
v1 -> v2: fix the printk info about the total mem
 arch/powerpc/kernel/machine_kexec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
index c4ed328..eec96dc 100644
--- a/arch/powerpc/kernel/machine_kexec.c
+++ b/arch/powerpc/kernel/machine_kexec.c
@@ -114,11 +114,12 @@ void machine_kexec(struct kimage *image)
 
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
@@ -185,7 +186,7 @@ void __init reserve_crashkernel(void)
 			"for crashkernel (System RAM: %ldMB)\n",
 			(unsigned long)(crash_size >> 20),
 			(unsigned long)(crashk_res.start >> 20),
-			(unsigned long)(memblock_phys_mem_size() >> 20));
+			(unsigned long)(total_mem_sz >> 20));
 
 	if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
 	    memblock_reserve(crashk_res.start, crash_size)) {
-- 
2.7.5

