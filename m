Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889910773C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 19:23:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KPvS2xsszDrJB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2019 05:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c41;
 helo=mail-yw1-xc41.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PkayuhnQ"; 
 dkim-atps=neutral
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KPsQ26rFzDrHp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2019 05:21:59 +1100 (AEDT)
Received: by mail-yw1-xc41.google.com with SMTP id n82so2726934ywc.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=QPiSRimoGyyl9vtfh4vUcgqZC8EZ9fo2lheKdMoYbnk=;
 b=PkayuhnQ8bgpDLx8e1OjkwzXGGYVlSmDAwOsERf1dmZNzyXdBHwRKWKDF4ZzQbiJMJ
 Z3xbdf1PN17CHLMcyvZROd9pZdRGS7bV/IlpwNQzp94lkql8K5O34dBLbDqE7PkHpwlb
 wIDre7REgjUiHNUByio1jFNWLe1VV9DcOJPzS1mwl+bCn2yFYnYs+uA6Gk+LNlmcm4yQ
 EBt2nVchz7Sd1j1AYNsjGRe4TVNTv+j6RIdYAqMLmlBtOBuX7vD+CfSoeFNqF0E/TX68
 2Wt2F9rVwjv0KNT2aazxpr6tWIFLK6j2047qYyQ2nbIZQIVuDW5L+BsNzz8w3cW4hwUD
 mvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=QPiSRimoGyyl9vtfh4vUcgqZC8EZ9fo2lheKdMoYbnk=;
 b=gY7vKyGAsFf44oHegpFa04WY6VCazn2Mw3suINj2mYJ0mssW6jNq9AtIcvzScWWLsn
 RNTFigPXKXIngGUcdgzlrro4L1YbK8F0SPAeBuxBLyVgr3f3QKx8efwaQdz3bvdcOiNT
 eyTyVkqLPUea2LYt6dR5t1mS/x+E6iprrqdaWkXcyaBB5u1uhHAoQIYg2yIXqkdrpWnZ
 ktNFSrcdfdTFKYvYTZXbavLQVEqtAqJ6pgfQsnDKcPGsFURRvaVaPE4ypOotlVQmwOP7
 U4uEFbcsXlHu4pEVPyJjupJqy9wVDbD0yoapuXEeEuLP6fPqbEVqfJj12U8wSDCEsg0B
 N7AA==
X-Gm-Message-State: APjAAAXMKpmGl3yAeWNKcO36PVTtbp7Pk0xZOPoQRJMgkr9s4cy9i/CX
 K0tLzkgS+n5MisOD5VN9BA==
X-Google-Smtp-Source: APXvYqxXV/usJSEGZCjag//9I9PjIo2cacoQrlevslbDftpqzmFuIGJScuyiFlPnHjL8FBjKBzFQZw==
X-Received: by 2002:a81:3c55:: with SMTP id j82mr10687661ywa.163.1574446915355; 
 Fri, 22 Nov 2019 10:21:55 -0800 (PST)
Received: from serve.minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id u68sm370523ywf.18.2019.11.22.10.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 10:21:54 -0800 (PST)
Received: from t560.mvista.com (unknown [192.168.27.180])
 by serve.minyard.net (Postfix) with ESMTPA id 955D8180059;
 Fri, 22 Nov 2019 18:21:53 +0000 (UTC)
From: minyard@acm.org
To: kexec@lists.infradead.org, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Fix issue with missing registers in kdump
Date: Fri, 22 Nov 2019 12:21:44 -0600
Message-Id: <20191122182144.20633-1-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Corey Minyard <cminyard@mvista.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Corey Minyard <cminyard@mvista.com>

When powerpc saved the registers on an SMP system, it was doing so
correctly.  But after the crash, the register information was blank.
The issue was that the data was still in the CPU caches on the
CPUs, but once the jump to the crash kernel was done, the data was
never flushed to main memory, so that data was lost.

Add a cache flush after the CPU register notes are saved to fix
the issue.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
I found this problem on an older (3.10) kernel on a Freescale
T1042D4RDB system, and I couldn't find any discussion or change that
dealt with anything like this.  It appears to still be an issue,
though I'm not sure and I'm not sure this is the right way to fix the
problem.

I've tried reproducing on end of tree, but I've run into a couple of
issues.  The file
 /proc/device-tree/soc@ffe000000/fman@400000/fman-firmware/fsl,firmware
will only return 4096 bytes at a time (apparently it didn't in 3.10),
but the kexec command tries to read it in one big read in
kexec/arch/ppc/fs2dt.c:

       if (read(fd, dt, len) != len)
                die("unrecoverable error: could not read \"%s\": %s\n",
                    pathname, strerror(errno));

I hacked around that and now it hangs before printing anything in the
new kernel.  Since the above was broken, I doubt this has been tested
in a while, so no surprise, I guess.  

So I can't test this out on a current kernel, and I'm not sure what to
do at this point.  I have it fixed for our current use, but getting a
fix upstream would be good.

 arch/powerpc/kernel/crash.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/kernel/crash.c b/arch/powerpc/kernel/crash.c
index d488311efab1..f6e345b8c33d 100644
--- a/arch/powerpc/kernel/crash.c
+++ b/arch/powerpc/kernel/crash.c
@@ -24,6 +24,7 @@
 #include <asm/smp.h>
 #include <asm/setjmp.h>
 #include <asm/debug.h>
+#include <asm/cacheflush.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -75,8 +76,21 @@ void crash_ipi_callback(struct pt_regs *regs)
 
 	hard_irq_disable();
 	if (!cpumask_test_cpu(cpu, &cpus_state_saved)) {
+		char *buf;
+
 		crash_save_cpu(regs, cpu);
 		cpumask_set_cpu(cpu, &cpus_state_saved);
+
+		/*
+		 * Flush the crash note region data, otherwise the
+		 * data gets left in the CPU cache and then
+		 * invalidated, so the crashing cpu will never see it
+		 * in the new kernel.
+		 */
+		buf = (char *) per_cpu_ptr(crash_notes, cpu);
+		if (buf)
+			flush_dcache_range((unsigned long) buf,
+				(unsigned long) buf + sizeof(note_buf_t));
 	}
 
 	atomic_inc(&cpus_in_crash);
-- 
2.17.1

