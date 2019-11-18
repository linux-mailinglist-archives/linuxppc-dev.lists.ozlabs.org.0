Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24257FFD8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 05:30:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gbbh701qzDqXY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 15:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=35t7=zk=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GbYv0rLfzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 15:28:50 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205183] PPC64: Signal delivery fails with SIGSEGV if between
 about 1KB and 4KB bytes of stack remain
Date: Mon, 18 Nov 2019 04:28:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel@linux.ibm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205183-206035-Bms0y4w61H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205183-206035@https.bugzilla.kernel.org/>
References: <bug-205183-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205183

Daniel Black (daniel@linux.ibm.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |daniel@linux.ibm.com

--- Comment #1 from Daniel Black (daniel@linux.ibm.com) ---
Tom,

Thanks for the bug report. Appreciate it. Feel free to use the
linuxppc-dev@lists.ozlabs.org list.


Reproduced in 5.4.0-rc8

danielgb@talos2:~$ uname -a
Linux talos2 5.4.0-rc8 #5 SMP Mon Nov 18 13:27:11 AEDT 2019 ppc64le ppc64le
ppc64le GNU/Linux
danielgb@talos2:~$ gcc -g -Wall -O stacktest.c
danielgb@talos2:~$ ./a.out 1240000 &
[1] 2944
danielgb@talos2:~$  cat /proc/$(pidof a.out)/maps | grep stack
7fffc62f0000-7fffc6420000 rw-p 00000000 00:00 0=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[stack]
danielgb@talos2:~$ kill -USR1 %1
danielgb@talos2:~$ signal delivered, stack base 0x7fffc6420000 top
0x7fffc62f1427 (1240025 used)

[1]+  Done                    ./a.out 1240000
danielgb@talos2:~$  ./a.out 1241000 &
[1] 2948
danielgb@talos2:~$ kill -USR1 %1
danielgb@talos2:~$=20
[1]+  Segmentation fault      ./a.out 1241000


[ 6415.077590] a.out[2948]: bad frame in setup_rt_frame: 00007fffe4fb0010 n=
ip
000006a185d909fc lr 000077ecda3c04e8


I'll get someone to look at this soon.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
