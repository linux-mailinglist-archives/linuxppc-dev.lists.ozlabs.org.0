Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5311F89C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 16:51:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bTQf5239zDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 02:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=nwxd=2f=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bTNV1vKpzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 02:49:13 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205283] BUG: KASAN: global-out-of-bounds in
 _copy_to_iter+0x3d4/0x5a8
Date: Sun, 15 Dec 2019 15:49:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: btrfs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: fs_btrfs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version see_also
Message-ID: <bug-205283-206035-i0ZRTHjXFs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205283-206035@https.bugzilla.kernel.org/>
References: <bug-205283-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205283

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.4-rc4                     |5.5-rc1
           See Also|                            |https://bugzilla.kernel.org
                   |                            |/show_bug.cgi?id=3D205099

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Re-tried with kernel 5.5-rc1. This is probably connected with bug #205099.

[...]
[   69.181890]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   69.182220] BUG: KASAN: global-out-of-bounds in _copy_to_iter+0x3c0/0x594
[   69.182472] Write of size 4096 at addr f15ad000 by task modprobe/233

[   69.182738] CPU: 0 PID: 233 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.5.0-rc1-PowerMacG4+ #7
[   69.183061] Call Trace:
[   69.183147] [eb7138b8] [c0783b44] dump_stack+0xbc/0x118 (unreliable)
[   69.183387] [eb7138e8] [c024454c]
print_address_description.isra.0+0x3c/0x420
[   69.183652] [eb713978] [c0244b0c] __kasan_report+0x138/0x180
[   69.183858] [eb7139b8] [c024551c] check_memory_region+0x24/0x180
[   69.184084] [eb7139c8] [c02435e8] memcpy+0x48/0x74
[   69.184255] [eb7139e8] [c045b5cc] _copy_to_iter+0x3c0/0x594
[   69.184458] [eb713ad8] [c045b984] copy_page_to_iter+0xac/0x564
[   69.184675] [eb713b38] [c01c6d84] generic_file_read_iter+0x5c4/0x7c0
[   69.184914] [eb713ba8] [c025b8dc] __vfs_read+0x1b0/0x1f8
[   69.185106] [eb713cd8] [c025b9e0] vfs_read+0xbc/0x124
[   69.185287] [eb713d08] [c025ba9c] kernel_read+0x54/0x70
[   69.185480] [eb713d38] [c0266514] kernel_read_file+0x23c/0x34c
[   69.185694] [eb713de8] [c0266710] kernel_read_file_from_fd+0x54/0x74
[   69.185929] [eb713e18] [c0111b1c] sys_finit_module+0xd8/0x138
[   69.186139] [eb713f38] [c001a274] ret_from_syscall+0x0/0x34
[   69.186340] --- interrupt: c01 at 0x56af78
                   LR =3D 0x6f8a14


[   69.186597] Memory state around the buggy address:
[   69.186766]  f15ad500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   69.187001]  f15ad580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   69.187235] >f15ad600: 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa fa
[   69.187466]                                             ^
[   69.187656]  f15ad680: 00 00 00 03 fa fa fa fa 00 00 00 00 00 00 00 00
[   69.187890]  f15ad700: 00 00 00 00 00 00 04 fa fa fa fa fa 00 00 00 00
[   69.188121]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   69.272710] raid6: altivecx8 gen()  2354 MB/s
[   69.329383] raid6: altivecx4 gen()  3200 MB/s
[   69.386055] raid6: altivecx2 gen()  2178 MB/s
[   69.442705] raid6: altivecx1 gen()  1975 MB/s
[   69.499549] raid6: int32x8  gen()   336 MB/s
[   69.556086] raid6: int32x8  xor()   200 MB/s
[   69.612793] raid6: int32x4  gen()   342 MB/s
[   69.669421] raid6: int32x4  xor()   224 MB/s
[   69.732733] raid6: int32x2  gen()   534 MB/s
[   69.796110] raid6: int32x2  xor()   414 MB/s
[   69.859399] raid6: int32x1  gen()   401 MB/s
[   69.922790] raid6: int32x1  xor()   310 MB/s
[   69.930418] raid6: using algorithm altivecx4 gen() 3200 MB/s
[   69.938166] raid6: using intx1 recovery algorithm
[   70.027661] xor: measuring software checksum speed
[   70.066059]    8regs     :   123.600 MB/sec
[   70.106036]    8regs_prefetch:   122.400 MB/sec
[   70.146029]    32regs    :   126.000 MB/sec
[   70.186045]    32regs_prefetch:   122.400 MB/sec
[   70.226030]    altivec   :   738.000 MB/sec
[   70.233653] xor: using function: altivec (738.000 MB/sec)
[   70.713528] Btrfs loaded, crc32c=3Dcrc32c-generic, debug=3Don

--=20
You are receiving this mail because:
You are watching someone on the CC list of the bug.=
