Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1BE5FDCF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:17:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpCnW6kcRz3dqv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NdIHEh6K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NdIHEh6K;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpCmY2VXqz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 02:17:01 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 129so1819970pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 08:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3muSUxsl7gIAR7obFzVLQslVUiZJdpmNankO01J9Tos=;
        b=NdIHEh6KYVOlc+TlKUUCJsoLvVTYWxus2PEFtEoV2Pw6KeBbhBQiaI+GyJrdn3JQnk
         1v2v0+B0kejmf8xIJnw5CaUSGz7lH4MMlTS9gEI08eVzDCMs3Eioqspboj3aw5NwbDOf
         oPSwfC53bCjwcBUaaDeGVYTHI6Yod9AlHZ13+QMaOzvrrqAizUppqUNRBM3kA/xWGRkW
         6aEPy2ibAXn0IR+gby7Z8Hfg+7CSsqxnpw4oYr/+JPSPHDuup3RDNUeWcx44ZavvMr+B
         UHVF/bfFeiGMxmsH2kx48hI5qg9S1veZ7swHTnpsUMDIV/B7yHvkbMI/X7CB+Pe7w/jY
         G6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3muSUxsl7gIAR7obFzVLQslVUiZJdpmNankO01J9Tos=;
        b=VhynC9uYXhT7UroZpOA0J6UkV1JMC8QxyzamawEdgtMWjxuCNjxMMXLgcMBpAE+pBf
         VD9H8OJ3jOq9rhcLaCeT4JcsdcIuVRzknM5kK2QfoFC83bEh76bjVCaN5X/DHXmXS+p3
         eLcqEHetJsQZyce2Mr5j2widhZMMpwtIZFIK5f4/Ldc5eANteJV7yhhRgD1NvS3glqM6
         hnSnp/8Zd2N93C/IrmDIyhT9hdCmV3qi41Zz/TN+CVokz3lStNVTlrU6yoQ/gsFov0Mi
         Es0SdMJC//Z2t9g8F4yiyh+eRuHCRX/+/aSYo86TpxsOIt/gIWdogdfZeD2T8+Z3j7mD
         Cruw==
X-Gm-Message-State: ACrzQf3/nkVDQDtkeRrGNNaQL3KrKpRX7y95T2aEAYZrFS+oQ077hZaB
	FOwrDE8X1CXdJgC69HMELhSl3nD9ETk=
X-Google-Smtp-Source: AMsMyM4jgw3zC1hoGCz2v4uaPpJHmR8To/GUFY8VP0fMMsPXCGBbaJZEqJj4955TFXassTND9ivMgw==
X-Received: by 2002:a63:91:0:b0:461:f509:2a31 with SMTP id 139-20020a630091000000b00461f5092a31mr347408pga.108.1665674218867;
        Thu, 13 Oct 2022 08:16:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id i15-20020a056a00224f00b00543a098a6ffsm2070977pfu.212.2022.10.13.08.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 08:16:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s: Fix hash__change_memory_range preemption warning
Date: Fri, 14 Oct 2022 01:16:46 +1000
Message-Id: <20221013151647.1857994-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013151647.1857994-1-npiggin@gmail.com>
References: <20221013151647.1857994-1-npiggin@gmail.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

stop_machine_cpuslocked takes a mutex so it must be called in a
preemptible context, so it can't simply be fixed by disabling
preemption.

This is not a bug, because CPU hotplug is locked, so this processor will
call in to the stop machine function. So raw_smp_processor_id() could be
used. This leaves a small chance that this thread will be migrated to
another CPU, so the master work would be done by a CPU from a different
context. Better for test coverage to make that a common case by just
having the first CPU to call in become the master.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_pgtable.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 747492edb75a..51f48984abca 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -404,7 +404,8 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
 
 struct change_memory_parms {
 	unsigned long start, end, newpp;
-	unsigned int step, nr_cpus, master_cpu;
+	unsigned int step, nr_cpus;
+	atomic_t master_cpu;
 	atomic_t cpu_counter;
 };
 
@@ -478,7 +479,8 @@ static int change_memory_range_fn(void *data)
 {
 	struct change_memory_parms *parms = data;
 
-	if (parms->master_cpu != smp_processor_id())
+	// First CPU goes through, all others wait.
+	if (atomic_xchg(&parms->master_cpu, 1) == 1)
 		return chmem_secondary_loop(parms);
 
 	// Wait for all but one CPU (this one) to call-in
@@ -516,7 +518,7 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
 		chmem_parms.end = end;
 		chmem_parms.step = step;
 		chmem_parms.newpp = newpp;
-		chmem_parms.master_cpu = smp_processor_id();
+		atomic_set(&chmem_parms.master_cpu, 0);
 
 		cpus_read_lock();
 
-- 
2.37.2

