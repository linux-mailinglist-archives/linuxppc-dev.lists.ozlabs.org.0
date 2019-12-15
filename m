Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E446811F8B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 17:03:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bThl0wd2zDqd7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 03:03:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bTfd6ylSzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 03:01:29 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Sun, 15 Dec 2019 16:01:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205099-206035-kadYrjzlfY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Found out this is probably a cause for bug #205283. For doing some btrfs te=
sts
with 5.5-rc1 kernel I needed to disable KASAN in lib/raid6/Makefile
(KASAN_SANITIZE :=3D n) as btrfs pulls in raid6_pq.

btrfs gets modprobed seemingly ok the 1st time, but removing and reloading =
it
provokes bug #205283.

# modprobe -v btrfs
# modprobe -r -v btrfs
rmmod btrfs
rmmod zlib_inflate
rmmod libcrc32c
rmmod raid6_pq
rmmod zlib_deflate
rmmod lzo_decompress
rmmod lzo_compress
rmmod zstd_compress
rmmod zstd_decompress
rmmod xor
# modprobe -v btrfs
insmod
/lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/zlib_inflate/zlib_inflate.ko=
=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/libcrc32c.ko=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/raid6/raid6_pq.ko=20
insmod
/lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/zlib_deflate/zlib_deflate.ko=
=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/lzo/lzo_decompress.ko=
=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/lzo/lzo_compress.ko=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/zstd/zstd_compress.ko=
=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/lib/zstd/zstd_decompress.k=
o=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/crypto/xor.ko=20
insmod /lib/modules/5.5.0-rc1-PowerMacG4+/kernel/fs/btrfs/btrfs.ko

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
