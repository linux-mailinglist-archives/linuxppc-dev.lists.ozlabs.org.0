Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349645057D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 15:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhpMs0qPQz3bdJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 23:54:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O2XO/Lks;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O2XO/Lks; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhpM928k3z2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 23:54:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24DBC61280
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 13:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB052C385A8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650290051;
 bh=oIwD8Kss9mmcXuPzuNRkFOX7tWCMqb66ZVXNanIeQ3I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=O2XO/LksIX5H1mauP1Ukp1oAmyKQu3ouzoe9EbvAYNjmiW0XQJHUnmoAa7Wz3hLZs
 ypZAQLpQnHr48vR4lktJ6ABb876+lddE/7CwBuRZ5bEshwU++yOSlaBG7oPLTT2jAt
 vbPUv8xFmB90Hy5jZ3zCndv/8pRU+lPfvbOW4nsZZA38gHuGBZuSAsJWzQVwToNqks
 zD83zHk7ooWoISiicTAFiFZIIdChztUjXNyOyU/6mJGzlK/Y6drSt4wRPiNH8S24mQ
 azcx6zVSvAe3VTKfPssV8qm81uhAZS+Zpv5NrkJpqWislvOeJhrMBSrsv82OyhO8kH
 BYg/budK/WCcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CBF05C05F98; Mon, 18 Apr 2022 13:54:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Mon, 18 Apr 2022 13:54:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215389-206035-7cC7OSfyPY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300774
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300774&action=3Dedit
dmesg (5.18-rc3, PowerMac G4 DP)

Another try with running glibc-2.34 testsuite on kernel 5.18-rc3. Looks like
it's still a problem.

[...]
pagealloc: memory corruption
fffdfff0: 00 00 00 00                                      ....
CPU: 0 PID: 21222 Comm: install Not tainted 5.18.0-rc3-PMacG4 #5
Call Trace:
[f8085a70] [c06e8820] dump_stack_lvl+0x80/0xc0 (unreliable)
[f8085a90] [c02c0b2c] __kernel_unpoison_pages+0x1c0/0x204
[f8085ae0] [c02a4cb0] get_page_from_freelist+0xcb4/0xeb0
[f8085ba0] [c02a5754] __alloc_pages+0x184/0x11b4
[f8085c70] [c0230d50] __filemap_get_folio+0x224/0x598
[f8085cf0] [c0240ebc] pagecache_get_page+0x20/0x88
[f8085d10] [c04e2600] prepare_pages+0xf8/0x358
[f8085d60] [c04e4e54] btrfs_buffered_write+0x334/0x850
[f8085e20] [c04ea598] btrfs_do_write_iter+0x3a8/0x768
[f8085e80] [c02ee25c] vfs_write+0x364/0x488
[f8085f00] [c02ee52c] ksys_write+0x78/0x128
[f8085f30] [c001e1a8] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0x5c5d08
NIP:  005c5d08 LR: 005c5ce0 CTR: c0289c9c
REGS: f8085f40 TRAP: 0c00   Not tainted  (5.18.0-rc3-PMacG4)
MSR:  0000f932 <EE,PR,FP,ME,IR,DR,RI>  CR: 28022464  XER: 20000000

GPR00: 00000004 af820720 a7ced760 00000006 a77aa000 00020000 00000000 00000=
000=20
GPR08: 00120000 a77a9000 00000008 403d77ca 403d7497 0077fff4 00000000 00020=
000=20
GPR16: 00000000 af8208c8 00020000 00000000 00000000 af821d2b a77aa000 00020=
000=20
GPR24: 00000000 00000006 7ff00000 00000006 a77aa000 00020000 006c7ff4 00020=
000=20
NIP [005c5d08] 0x5c5d08
LR [005c5ce0] 0x5c5ce0
--- interrupt: c00
page:ef4c4ec4 refcount:1 mapcount:0 mapping:00000000 index:0x1 pfn:0x31069
flags: 0x80000000(zone=3D2)
raw: 80000000 00000100 00000122 00000000 00000001 00000000 ffffffff 00000001
raw: 00000000
page dumped because: pagealloc: corrupted page detail

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
