Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A84543F17
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 00:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJMFZ0nVhz3c8M
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 08:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Td2tdE9Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Td2tdE9Q;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJMDp3vsGz2yL6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 08:23:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D4FB61632
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 22:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D50E1C34116
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654726982;
	bh=sy0BOvZM72VeFVcrkmFH+VeqIYAdkdPsbjEcMvNzvrc=;
	h=From:To:Subject:Date:From;
	b=Td2tdE9Q9EwxlIo0B6ii8bRg2YNMBUw33NARmzQY4cIe9zlUkfjw/oFqJy2UZlGUT
	 7YmkY7v/T973HzRu2rqOoYsZp2wzPndhjptM4ETx8HvNM/yjTdrRcQx+tewEl3U9bj
	 7tNS6+9W7KVfiDaZ/EsGvdraLXBAxHdRnbgQp7sMVb987KWBLgY/OEHhhFKerJYsaJ
	 5gQOAasbZiU/gg+UhvrZfzlHRCJ8AkgJw/L8VKKPOnaLHXNQc7gh/MyydScCC1DRcq
	 RZkchd05Ts2DWHv1CjDXn+uTR4oS0F5b6ufjd6gY335cNJyAnRP0++h7piWQqe85KN
	 vMRKwuwUFtdHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B50CBC05FD5; Wed,  8 Jun 2022 22:23:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] New: sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Wed, 08 Jun 2022 22:23:02 +0000
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
Message-ID: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

            Bug ID: 216095
           Summary: sysfs: cannot create duplicate filename
                    '/devices/platform/of-display'
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.19-rc1
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 301127
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301127&action=3Dedit
dmesg (5.19-rc1, PowerMac G4 DP)

[...]
sysfs: cannot create duplicate filename '/devices/platform/of-display'
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc1-PMacG4+ #3
Call Trace:
[e9025cc0] [c05984d0] dump_stack_lvl+0x60/0x90 (unreliable)
[e9025ce0] [c02f043c] sysfs_warn_dup+0x64/0x84
[e9025d00] [c02f05cc] sysfs_create_dir_ns+0xfc/0x118
[e9025d30] [c059ffa4] kobject_add_internal+0x114/0x2f0
[e9025d60] [c05a0790] kobject_add+0x80/0xf0
[e9025da0] [c064c3d8] device_add+0x114/0x94c
[e9025e10] [c06f197c] of_platform_device_create_pdata+0xb8/0x144
[e9025e40] [c0c43bb4] of_platform_default_populate_init+0x284/0x2f4
[e9025e70] [c0007a94] do_one_initcall+0x50/0x294
[e9025ee0] [c0c03ff0] kernel_init_freeable+0x228/0x334
[e9025f20] [c0007efc] kernel_init+0x28/0x144
[e9025f40] [c0019334] ret_from_kernel_thread+0x5c/0x64
kobject_add_internal failed for of-display with -EEXIST, don't try to regis=
ter
things with the same name in the same directory.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
