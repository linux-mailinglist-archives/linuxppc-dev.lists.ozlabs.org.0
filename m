Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB817B2A3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:04:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YSXY3SSnzDq6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:04:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=n59e=4x=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YSSw3H4zzDqkx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:01:20 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206695] kmemleak reports leaks in drivers/macintosh/windfarm
Date: Fri, 06 Mar 2020 00:01:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpe@ellerman.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206695-206035-sj3epKGbHo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206695-206035@https.bugzilla.kernel.org/>
References: <bug-206695-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206695

--- Comment #5 from mpe@ellerman.id.au ---
bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206695
>
> --- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
> (In reply to mpe from comment #3)
>> Can you try this patch?
>
> Applied your patch on top of 5.6-rc4 +
> https://patchwork.ozlabs.org/patch/1248350/ and let the G5 do a few hours
> compiling.
>
> Only getting those nice memleaks from bug #206203 but no windfarm_pm112
> memleak
> any longer. So your patch works well it seems. Thanks!

Thanks.

Can you try this one instead, it changes the order of operations to make
the code flow a bit nicer.

cheers

diff --git a/drivers/macintosh/windfarm_pm112.c
b/drivers/macintosh/windfarm_pm112.c
index 4150301a89a5..e8377ce0a95a 100644
--- a/drivers/macintosh/windfarm_pm112.c
+++ b/drivers/macintosh/windfarm_pm112.c
@@ -132,14 +132,6 @@ static int create_cpu_loop(int cpu)
        s32 tmax;
        int fmin;

-       /* Get PID params from the appropriate SAT */
-       hdr =3D smu_sat_get_sdb_partition(chip, 0xC8 + core, NULL);
-       if (hdr =3D=3D NULL) {
-               printk(KERN_WARNING"windfarm: can't get CPU PID fan config\=
n");
-               return -EINVAL;
-       }
-       piddata =3D (struct smu_sdbp_cpupiddata *)&hdr[1];
-
        /* Get FVT params to get Tmax; if not found, assume default */
        hdr =3D smu_sat_get_sdb_partition(chip, 0xC4 + core, NULL);
        if (hdr) {
@@ -152,6 +144,16 @@ static int create_cpu_loop(int cpu)
        if (tmax < cpu_all_tmax)
                cpu_all_tmax =3D tmax;

+       kfree(hdr);
+
+       /* Get PID params from the appropriate SAT */
+       hdr =3D smu_sat_get_sdb_partition(chip, 0xC8 + core, NULL);
+       if (hdr =3D=3D NULL) {
+               printk(KERN_WARNING"windfarm: can't get CPU PID fan config\=
n");
+               return -EINVAL;
+       }
+       piddata =3D (struct smu_sdbp_cpupiddata *)&hdr[1];
+
        /*
         * Darwin has a minimum fan speed of 1000 rpm for the 4-way and
         * 515 for the 2-way.  That appears to be overkill, so for now,
@@ -174,6 +176,9 @@ static int create_cpu_loop(int cpu)
                pid.min =3D fmin;

        wf_cpu_pid_init(&cpu_pid[cpu], &pid);
+
+       kfree(hdr);
+
        return 0;
 }

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
