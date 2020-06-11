Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BAA1F61E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 08:46:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jDs73W8HzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 16:46:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=e5uh=7y=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jDpW6zwkzDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 16:43:47 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205183] PPC64: Signal delivery fails with SIGSEGV if between
 about 1KB and 4KB bytes of stack remain
Date: Thu, 11 Jun 2020 06:43:44 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205183-206035-eCWfbfwVzR@https.bugzilla.kernel.org/>
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

--- Comment #4 from Daniel Black (daniel@linux.ibm.com) ---
Still broken.

danielgb@talos2:~$ gcc -g -Wall -O stacktest.c
danielgb@talos2:~$  ./a.out 1240000 &
[1] 494618
danielgb@talos2:~$ cat /proc/$(pidof a.out)/maps | grep stack
7fffcde80000-7fffcdfb0000 rw-p 00000000 00:00 0=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[stack]
danielgb@talos2:~$ kill -USR1 %1
danielgb@talos2:~$ signal delivered, stack base 0x7fffcdfb0000 top
0x7fffcde81427 (1240025 used)

[1]+  Done                    ./a.out 1240000
danielgb@talos2:~$ ./a.out 1241000 &
[1] 494677
danielgb@talos2:~$ kill -USR1 %1
danielgb@talos2:~$=20
[1]+  Segmentation fault      ./a.out 1241000
danielgb@talos2:~$=20
danielgb@talos2:~$ dmesg | grep a.out
[10617.616145] a.out[494587]: bad frame in setup_rt_frame: 00007fffdea30010=
 nip
000000011a0a09fc lr 00007fffa1c404c8
[10865.752876] a.out[494677]: bad frame in setup_rt_frame: 00007fffcc420030=
 nip
0000000135a70a3c lr 00007fff952604c8
danielgb@talos2:~$ uname -a
Linux talos2 5.7.0-rc5-77151-gfea086b627a0 #1 SMP Mon May 11 16:00:00 AEST =
2020
ppc64le ppc64le ppc64le GNU/Linux

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
