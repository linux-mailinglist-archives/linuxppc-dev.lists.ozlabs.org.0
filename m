Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555F141221
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 21:12:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zsfq3pjMzDqyq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 07:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=idof=3g=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zsd22DHrzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 07:10:45 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205283] BUG: KASAN: global-out-of-bounds in
 _copy_to_iter+0x3d4/0x5a8
Date: Fri, 17 Jan 2020 20:01:41 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205283-206035-LsxJn3gAPG@https.bugzilla.kernel.org/>
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

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Applied your patch series on top of 5.5-rc6. CONFIG_KASAN_VMALLOC is not
non-selectable but forced on by default.

Current situation is that the hit does not show up with KASAN and btrs modu=
le
unloading/re-loading.

 # grep -i kasan .config
CONFIG_HAVE_ARCH_KASAN=3Dy
CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
CONFIG_CC_HAS_KASAN_GENERIC=3Dy
CONFIG_KASAN=3Dy
CONFIG_KASAN_GENERIC=3Dy
CONFIG_KASAN_OUTLINE=3Dy
# CONFIG_KASAN_INLINE is not set
CONFIG_KASAN_STACK=3D1
CONFIG_KASAN_VMALLOC=3Dy
# CONFIG_TEST_KASAN is not set
CONFIG_KASAN_SHADOW_OFFSET=3D0xe0000000

 # modprobe -r -v btrfs
rmmod btrfs
rmmod zlib_inflate
rmmod raid6_pq
rmmod zlib_deflate
rmmod lzo_decompress
rmmod lzo_compress
rmmod zstd_compress
rmmod zstd_decompress
rmmod xor
rmmod blake2b_generic
 # modprobe -v btrfs
insmod
/lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/zlib_inflate/zlib_inflate.ko=
=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/raid6/raid6_pq.ko=20
insmod
/lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/zlib_deflate/zlib_deflate.ko=
=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/lzo/lzo_decompress.ko=
=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/lzo/lzo_compress.ko=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/zstd/zstd_compress.ko=
=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/lib/zstd/zstd_decompress.k=
o=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/crypto/xor.ko=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/crypto/blake2b_generic.ko=
=20
insmod /lib/modules/5.5.0-rc6-PowerMacG4+/kernel/fs/btrfs/btrfs.ko

--=20
You are receiving this mail because:
You are watching someone on the CC list of the bug.=
