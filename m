Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981F4ECFD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 00:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTMCj2j9Jz2yXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 09:53:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MaAaUm7R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MaAaUm7R; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTMBx0HK0z2xT8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 09:52:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60335617DB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF150C340EC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648680740;
 bh=9x/vbxvO2V/n0az2vCzCS5jCtIMwId2+eabB4iOKq24=;
 h=From:To:Subject:Date:From;
 b=MaAaUm7RY0VtkyANgdBnO883bAFRJ8g0LhBW9vTCQSLt0/V6wTOnt0h8/OetYqW66
 fkmWv9TAHSMa5muRLaERITccyav4gXWPGn8XJyxefGgzwZ/UgY4hT28eBIzqhg+iJC
 NVJyBaOYQxWmQWBVqp2pEPpUwt9TwTaHK+o3QXhOq6Hg3VMgNpLppEGr1o0l9aFVmu
 8PVak9szK3/JFtpq6gLEfzmOg5XGYLBOTR+Ok/MtWObiOXRhxpf6JYQHjeV5HmWmJO
 Xb4P7cf8PzYu+/vz8zqDXyEugVMkLeupiG+wIxQa6ZOzNpxAVduK/qkGG69p9XNiGO
 b3nMsR28JfUmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A0639C05FCE; Wed, 30 Mar 2022 22:52:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215781] New: Highmem support broken on kernels greater 5.15.x
 on ppc32?
Date: Wed, 30 Mar 2022 22:52:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215781-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215781

            Bug ID: 215781
           Summary: Highmem support broken on kernels greater 5.15.x on
                    ppc32?
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.16.18
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: Yes

Created attachment 300664
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300664&action=3Dedit
dmesg (5.16.18, PowerMac G4 DP)

Noticed my G4 DP ran a bit sluggish... Turned out it uses only 614664K of
2097152K RAM. Happens on both kernel 5.16.18 and 5.17.1. Kernels 5.15 and
before work as expected.

It seems to be a problem with highmem as 5.16.18 and 5.1.7.1 show 0K highme=
m.
CONFIG_HIGHMEM=3Dy is of course set.

Kernel 5.16.18 says:
[...]
Top of RAM: 0x80000000, Total RAM: 0x80000000
Memory hole size: 0MB
Zone ranges:
  DMA      [mem 0x0000000000000000-0x0000000027ffffff]
  Normal   empty
  HighMem  [mem 0x0000000028000000-0x000000007fffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000007fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
percpu: Embedded 12 pages/cpu s19404 r8192 d21556 u49152
pcpu-alloc: s19404 r8192 d21556 u49152 alloc=3D12*4096
pcpu-alloc: [0] 0 [0] 1=20
Built 1 zonelists, mobility grouping on.  Total pages: 522848
Kernel command line: ro root=3D/dev/sda5 zswap.max_pool_percent=3D16
zswap.zpool=3Dz3fold slub_debug=3DFZP page_poison=3D1
netconsole=3D6666@192.168.2.5/eth0,6666@192.168.2.2/70:85:C2:30:EC:01=20
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
mem auto-init: stack:__user(zero), heap alloc:off, heap free:off
Kernel virtual memory layout:
  * 0xffbbf000..0xfffff000  : fixmap
  * 0xff400000..0xff800000  : highmem PTEs
  * 0xff115000..0xff400000  : early ioremap
  * 0xe9000000..0xff115000  : vmalloc & ioremap
  * 0xb0000000..0xc0000000  : modules
Memory: 614664K/2097152K available (8828K kernel code, 488K rwdata, 1664K
rodata, 1316K init, 381K bss, 1482488K reserved, 0K cma-reserved, 0K highme=
m)
[...]

On kernel 5.15.23 I got highmem as expected:
[...]
Top of RAM: 0x80000000, Total RAM: 0x80000000
Memory hole size: 0MB
Zone ranges:
  DMA      [mem 0x0000000000000000-0x0000000027ffffff]
  Normal   empty
  HighMem  [mem 0x0000000028000000-0x000000007fffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000000000-0x000000007fffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x000000007fffffff]
percpu: Embedded 12 pages/cpu s19404 r8192 d21556 u49152
pcpu-alloc: s19404 r8192 d21556 u49152 alloc=3D12*4096
pcpu-alloc: [0] 0 [0] 1=20
Built 1 zonelists, mobility grouping on.  Total pages: 522848
Kernel command line: ro root=3D/dev/sda5 zswap.max_pool_percent=3D16
zswap.zpool=3Dz3fold slub_debug=3DFZP page_poison=3D1
netconsole=3D6666@192.168.2.5/eth0,6666@192.168.2.2/70:85:C2:30:EC:01=20
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
mem auto-init: stack:__user(zero), heap alloc:off, heap free:off
Kernel virtual memory layout:
  * 0xffbbf000..0xfffff000  : fixmap
  * 0xff400000..0xff800000  : highmem PTEs
  * 0xff115000..0xff400000  : early ioremap
  * 0xe9000000..0xff115000  : vmalloc & ioremap
  * 0xb0000000..0xc0000000  : modules
Memory: 2056460K/2097152K available (8688K kernel code, 488K rwdata, 1644K
rodata, 1316K init, 377K bss, 40692K reserved, 0K cma-reserved, 1441792K
highmem)
[...]

For testing I used the kernel .config from 5.15.32 for 5.16.18 via make
oldconfig and selecting =3Dn for all questions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
