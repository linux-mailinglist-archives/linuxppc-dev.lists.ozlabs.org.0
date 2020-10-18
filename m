Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF9292090
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 01:11:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDwcn6jGxzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 10:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=q4u7=dz=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDwZw3yj8zDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 10:10:00 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 209733] New: Starting new KVM virtual machines on PPC64 starts
 to hang after box is up for a while
Date: Sun, 18 Oct 2020 23:09:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: cam@neo-zeon.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209733-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209733

            Bug ID: 209733
           Summary: Starting new KVM virtual machines on PPC64 starts to
                    hang after box is up for a while
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: >=3D5.8
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: cam@neo-zeon.de
        Regression: No

Issue occurs with 5.8.14, 5.8.16, and 5.9.1.  Does NOT occur with 5.7.x. I
suspect it occurs with all of 5.8, but I haven't confirmed this yet.

After the box has been up for a "while", starting new VM's fails. Completely
shutting down existing VM's and then starting them back up will also fail in
the same way.

What is a while? Could be 2 days, might be 9. I'll update as the pattern
becomes more clear.

libvirt is generally used, but when running kvm manually with strace, kvm
always gets stuck here:
ioctl(11, KVM_PPC_ALLOCATE_HTAB, 0x7fffea0bade4

Maybe the kernel is trying to find the memory needed to allocate the Hashed
Page Table but is unable to do so? Maybe there's a memory leak?

Before this issue starts occurring, I have confirmed I am able to run the e=
xact
same kvm command manually:
sudo -u libvirt-qemu qemu-system-ppc64 -enable-kvm -m 8192 -nographic -vga =
none
-drive file=3D/var/lib/libvirt/images/test.qcow2,format=3Dqcow2 -mem-preall=
oc -smp
4

Nothing in dmesg, nothing useful in the logs.

This box's configuration:
Debian 10 stable
2x 18 core POWER9 (144 threads)
512g physical memory
Raptor Talos II motherboard
radix MMU disabled

Unfortunately, I cannot test the affected box with the Radix MMU enabled
because I have some important VM's that won't run unless it is disabled.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
