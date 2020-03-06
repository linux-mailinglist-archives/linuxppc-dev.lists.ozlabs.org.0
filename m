Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A817B298
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:02:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YSVd3t45zDqtK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YSSp4YxbzDq6B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GmoDAw9h; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48YSSp0jDrz9sRR;
 Fri,  6 Mar 2020 11:01:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583452874;
 bh=WlXBUqQmdkGxqOxjxnV4+kKhMwBKP168l9EUjgM+UzA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=GmoDAw9hGMSiIOO5etxSMEo6P9QL86hEKFmHyT6FGqgny0c90mKarE86jj+hKH4od
 qsA1gr1B81/r6+HYnsIG0vj1WxgS/87YaZ2fiOLYdtrv0BD6W94gnf0UpK7BEMuD7e
 mLMrl4LzhsYZ8KjcrG6BE7LhvJ3yzaqh8llytKnX0JreCoby0MRD5SoTEp4GuhJiJE
 BxGdKcYQIFD4QL1hDF2qi9hBgre7yyBG3HydKWE5PTGXfOmLHYUBTH0zQDhBHxBkQ6
 dQpBHmIlLfTLgD020F+RQ9N2rcSVsFKkUjc4lMWLMlkWeWjf1XvbAcvKO8++boxk7t
 /aUSxHHuw0F7A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bug 206695] kmemleak reports leaks in drivers/macintosh/windfarm
In-Reply-To: <bug-206695-206035-HRb322afyL@https.bugzilla.kernel.org/>
References: <bug-206695-206035@https.bugzilla.kernel.org/>
 <bug-206695-206035-HRb322afyL@https.bugzilla.kernel.org/>
Date: Fri, 06 Mar 2020 11:01:08 +1100
Message-ID: <87o8tapd17.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=206695
>
> --- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
> (In reply to mpe from comment #3)
>> Can you try this patch?
>
> Applied your patch on top of 5.6-rc4 +
> https://patchwork.ozlabs.org/patch/1248350/ and let the G5 do a few hours
> compiling.
>
> Only getting those nice memleaks from bug #206203 but no windfarm_pm112 memleak
> any longer. So your patch works well it seems. Thanks!

Thanks.

Can you try this one instead, it changes the order of operations to make
the code flow a bit nicer.

cheers

diff --git a/drivers/macintosh/windfarm_pm112.c b/drivers/macintosh/windfarm_pm112.c
index 4150301a89a5..e8377ce0a95a 100644
--- a/drivers/macintosh/windfarm_pm112.c
+++ b/drivers/macintosh/windfarm_pm112.c
@@ -132,14 +132,6 @@ static int create_cpu_loop(int cpu)
 	s32 tmax;
 	int fmin;
 
-	/* Get PID params from the appropriate SAT */
-	hdr = smu_sat_get_sdb_partition(chip, 0xC8 + core, NULL);
-	if (hdr == NULL) {
-		printk(KERN_WARNING"windfarm: can't get CPU PID fan config\n");
-		return -EINVAL;
-	}
-	piddata = (struct smu_sdbp_cpupiddata *)&hdr[1];
-
 	/* Get FVT params to get Tmax; if not found, assume default */
 	hdr = smu_sat_get_sdb_partition(chip, 0xC4 + core, NULL);
 	if (hdr) {
@@ -152,6 +144,16 @@ static int create_cpu_loop(int cpu)
 	if (tmax < cpu_all_tmax)
 		cpu_all_tmax = tmax;
 
+	kfree(hdr);
+
+	/* Get PID params from the appropriate SAT */
+	hdr = smu_sat_get_sdb_partition(chip, 0xC8 + core, NULL);
+	if (hdr == NULL) {
+		printk(KERN_WARNING"windfarm: can't get CPU PID fan config\n");
+		return -EINVAL;
+	}
+	piddata = (struct smu_sdbp_cpupiddata *)&hdr[1];
+
 	/*
 	 * Darwin has a minimum fan speed of 1000 rpm for the 4-way and
 	 * 515 for the 2-way.  That appears to be overkill, so for now,
@@ -174,6 +176,9 @@ static int create_cpu_loop(int cpu)
 		pid.min = fmin;
 
 	wf_cpu_pid_init(&cpu_pid[cpu], &pid);
+
+	kfree(hdr);
+
 	return 0;
 }
 

