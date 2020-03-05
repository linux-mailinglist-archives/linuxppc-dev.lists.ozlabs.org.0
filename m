Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBFD17A535
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 13:24:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y91M4SpKzDqkj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 23:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y8yx0WMGzDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 23:22:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bGejFpEd; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Y8yv6fsmz9sRR;
 Thu,  5 Mar 2020 23:22:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583410968;
 bh=+OsquJtq3grVp9YA4QqA6DFjcAjE+NTDtO/i5VDINiA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=bGejFpEdUnYmJaCxy2Xd4CK00nKq8huiP4Gh2AmlGmXnNUbfKB+ZofUsg6ReKLW87
 zURP281v2rkDPyR0I2i4hJg8SK5SwI2/ygRmLGQ6vRueCbvChZ/g8yj+Ehe9D16mOW
 ZUkvom/vfya9W18i4KjbnLfb/2SkmImrEwheB0jgm9kLeGrbExXXi/3kuYJ+ky8aQz
 8JJY0nV2fIqMlFvW+hrmW50gob9YWQrA/3TTcefEBaMnPFTjTRSMXLpZml8C/5zMok
 r/Av7X3Dc7jBi9o00WX4SucGKSHOGNfVlQ2QndrK8gw4muj6CVwZpLCSLc1AVJfrNe
 E5Kq7bmvJLUvg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bug 206695] New: kmemleak reports leaks in
 drivers/macintosh/windfarm
In-Reply-To: <bug-206695-206035@https.bugzilla.kernel.org/>
References: <bug-206695-206035@https.bugzilla.kernel.org/>
Date: Thu, 05 Mar 2020 23:22:41 +1100
Message-ID: <87sginousu.fsf@mpe.ellerman.id.au>
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

Can you try this patch?

diff --git a/drivers/macintosh/windfarm_pm112.c b/drivers/macintosh/windfarm_pm112.c
index 4150301a89a5..a16f43a1def9 100644
--- a/drivers/macintosh/windfarm_pm112.c
+++ b/drivers/macintosh/windfarm_pm112.c
@@ -125,7 +125,7 @@ static int create_cpu_loop(int cpu)
 {
 	int chip = cpu / 2;
 	int core = cpu & 1;
-	struct smu_sdbp_header *hdr;
+	struct smu_sdbp_header *hdr, *hdr2;
 	struct smu_sdbp_cpupiddata *piddata;
 	struct wf_cpu_pid_param pid;
 	struct wf_control *main_fan = cpu_fans[0];
@@ -141,9 +141,9 @@ static int create_cpu_loop(int cpu)
 	piddata = (struct smu_sdbp_cpupiddata *)&hdr[1];
 
 	/* Get FVT params to get Tmax; if not found, assume default */
-	hdr = smu_sat_get_sdb_partition(chip, 0xC4 + core, NULL);
-	if (hdr) {
-		struct smu_sdbp_fvt *fvt = (struct smu_sdbp_fvt *)&hdr[1];
+	hdr2 = smu_sat_get_sdb_partition(chip, 0xC4 + core, NULL);
+	if (hdr2) {
+		struct smu_sdbp_fvt *fvt = (struct smu_sdbp_fvt *)&hdr2[1];
 		tmax = fvt->maxtemp << 16;
 	} else
 		tmax = 95 << 16;	/* default to 95 degrees C */
@@ -174,6 +174,10 @@ static int create_cpu_loop(int cpu)
 		pid.min = fmin;
 
 	wf_cpu_pid_init(&cpu_pid[cpu], &pid);
+
+	kfree(hdr);
+	kfree(hdr2);
+
 	return 0;
 }
 
