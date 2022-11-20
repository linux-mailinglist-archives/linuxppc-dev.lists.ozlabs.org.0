Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9863156F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 18:19:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFchh0mlJz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 04:19:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpI/mKzl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpI/mKzl;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFcgk5NTmz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 04:18:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BC207B8092B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 17:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D518C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668964733;
	bh=uoLVRyacUUZBRXMxv7WosWbFYR5+KdL5JUtPO6sHuJE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jpI/mKzlZTBRKbaiGfIj59K98rj7aY1jsMbIQOAob92VZ13ybreTUYwQL20VLC+m3
	 JnPEVOGUjB76qXGZOaUZEqFnv6sGU3CfyUo9r90D1h//1IMD8uU6e11TyltEO6VbeN
	 DFlsU5/Y+HQlYrtQ3ffDVxlgmhnoj00ee9iZhWf4VX9ZFkzMGuS92fxKZhLomm6UQL
	 7uMURYozO1SDbRSO/hWJVD5GB/4PTe45cmaqwIkk2sUqhbCPaCNwrot01KqajWZ/Yg
	 RCqFImTijzaFidFCn/em4EJCEO0erOV0kkZ33p55ei4dFNYLUMof0RdTUP1YaTqy6a
	 pqdIWi0jTedvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 253A9C433E4; Sun, 20 Nov 2022 17:18:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206203] kmemleak reports various leaks in drivers/of/unittest.c
Date: Sun, 20 Nov 2022 17:18:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-206203-206035-ZuygdhsOVn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206203-206035@https.bugzilla.kernel.org/>
References: <bug-206203-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D206203

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|OBSOLETE                    |---

--- Comment #22 from Erhard F. (erhard_f@mailbox.org) ---
As the kmemleak output pretty much the same and as it's the same PowerMac G=
4 DP
I reopened this bug. Seems some OF changes meanwhile lead to memory leaks
again.

This is 6.1-rc5:

[...]
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc140b820 (size 16):
  comm "swapper/0", pid 1, jiffies 4294877302 (age 1153.234s)
  hex dump (first 16 bytes):
    63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc140b2b0 (size 16):
  comm "swapper/0", pid 1, jiffies 4294877302 (age 1153.234s)
  hex dump (first 16 bytes):
    73 65 72 69 61 6c 2d 6e 75 6d 62 65 72 00 6b a5  serial-number.k.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc1470f20 (size 32):
  comm "swapper/0", pid 1, jiffies 4294877302 (age 1153.234s)
  hex dump (first 32 bytes):
    63 75 73 74 6f 6d 65 72 2d 73 77 2d 63 6f 6e 66  customer-sw-conf
    69 67 00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  ig.kkkkkkkkkkkk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
...skipping...
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<8e6fdf66>] kobject_set_name_vargs+0x34/0xcc
    [<0ebf4a99>] kobject_add+0x88/0x110
    [<21cfd1b6>] __of_attach_node_sysfs+0x94/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc17341c0 (size 16):
  comm "swapper/0", pid 1, jiffies 4294877309 (age 1153.314s)
  hex dump (first 16 bytes):
    64 65 76 69 63 65 5f 74 79 70 65 00 6b 6b 6b a5  device_type.kkk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc1739168 (size 8):
  comm "swapper/0", pid 1, jiffies 4294877309 (age 1153.314s)
  hex dump (first 8 bytes):
    72 65 67 00 6b 6b 6b a5                          reg.kkk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc17396c8 (size 8):
  comm "swapper/0", pid 1, jiffies 4294877309 (age 1153.314s)
  hex dump (first 8 bytes):
    70 68 61 6e 64 6c 65 00                          phandle.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc1739708 (size 8):
  comm "swapper/0", pid 1, jiffies 4294877309 (age 1153.314s)
  hex dump (first 8 bytes):
    6e 61 6d 65 00 6b 6b a5                          name.kk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
...skipping...
unreferenced object 0xc1405588 (size 8):
  comm "swapper/0", pid 1, jiffies 4294877302 (age 1153.234s)
  hex dump (first 8 bytes):
    62 61 73 65 00 6b 6b a5                          base.kk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<8e6fdf66>] kobject_set_name_vargs+0x34/0xcc
    [<0ebf4a99>] kobject_add+0x88/0x110
    [<21cfd1b6>] __of_attach_node_sysfs+0x94/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc1405568 (size 8):
  comm "swapper/0", pid 1, jiffies 4294877302 (age 1153.234s)
  hex dump (first 8 bytes):
    6d 6f 64 65 6c 00 6b a5                          model.k.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64
unreferenced object 0xc140b820 (size 16):
  comm "swapper/0", pid 1, jiffies 4294877302 (age 1153.234s)
  hex dump (first 16 bytes):
    63 6f 6d 70 61 74 69 62 6c 65 00 6b 6b 6b 6b a5  compatible.kkkk.
  backtrace:
    [<92345f14>] kstrdup+0x44/0x9c
    [<46e6ec0a>] __of_add_property_sysfs+0xb8/0x128
    [<d8832181>] __of_attach_node_sysfs+0xc0/0x170
    [<2592df33>] of_core_init+0xf8/0x23c
    [<e5e36822>] driver_init+0x4c/0x80
    [<9cac2ddd>] kernel_init_freeable+0x138/0x354
    [<fcc01e1e>] kernel_init+0x28/0x154
    [<0cec001f>] ret_from_kernel_thread+0x5c/0x64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
