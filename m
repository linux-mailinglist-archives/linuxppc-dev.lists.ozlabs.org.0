Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5938145A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 01:45:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhlWX5HKXz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 09:45:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hy33Od71;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hy33Od71; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhlVv56wSz2yWP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 09:44:39 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 25E39613DE
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 23:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621035876;
 bh=CWZc3ohiRMti3T4+yMMXvwSQEQ86BE+8VaTPkNZKTjs=;
 h=From:To:Subject:Date:From;
 b=Hy33Od71VA+aK68l/i/1nISrKw//fujzElOUOFVjaFVRc5X0uirbCxYaob9LgMHZD
 QFiu9L6GQOy9c7Hjp/dj+f8H85E9/AQbnhDCBnY25HjXE2OMQbNCxdr6bTYSpIXsJS
 6HRGQzQ7q4BLknbspqANrun2foWCIWajJtAQG8KXYIowrzEwbq/u8vkqS2ppPApdjW
 TIS0TqMRgFAd+n1h3D+sSIK6TEjXIJiIaIJmft975rwSTQo8Sf+oa5MixVoz6sUK+O
 EeUwEDriXCpTNt625IQjI75cMiuNvEzXtV1uH/Hi2vb29ayALJSCKyQ8XvhqEDysak
 Z96agYEUR+f+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0FA776129C; Fri, 14 May 2021 23:44:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
Date: Fri, 14 May 2021 23:44:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213069-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213069

            Bug ID: 213069
           Summary: kernel BUG at
                    arch/powerpc/include/asm/book3s/64/hash-4k.h:147!
                    Oops: Exception in kernel mode, sig: 5 [#1]
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.13-rc1
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 296753
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296753&action=3Dedit
kernel .config (5.13-rc1, PowerMac G5 11,2)

Got this on my PowerMac G5 11,2 with v5.13-rc1 + few debug options on. The =
bug
was too early for netconsole to kick in so I took a photo and transcribed i=
t.

[...]
kmemleak: Kernel memory leak detector initialized (mem pool available: 1580=
5)
kmemleak: Automatic memory scanning thread started
debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page
table helpers
------------[ cut here ]------------
kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:147!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D4 NUMA PowerMac
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.13.0-rc1-PowerM=
acG5
#2
NIP:  c00000000003d6fc LR: c000000001024bc8 CTR: c0000000000f778c
REGS: c0000000025f7840 TRAP: 0700   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.13.0-rc1-PowerMacG5)
MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44002448  XER: 00000000
IRQMASK: 0
GPR00: c000000001024a5c c0000000025f7ae0 c00000000129f800 c0000000025f7b58
GPR04: 0000000000001000 8000000000000108 0000000000000000 0000000000000001
GPR08: 0000000000000000 0000000000000000 0000000000000008 0000000000000200
GPR12: 0000000024002440 c000000002366000 c00000000001003c 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: c0000000011b3388 c000000000b013e8 c0000000011b3108 4000000000000006
GPR24: 4000000000000280 00000000011b3000 0000000000000000 8000000000000105
GPR28: 0000000000001000 ffffffffffffff7f c000000000b01460 80000000011b3108
NIP [c00000000003d6fc] .pfn_pmd+x0x/0x4
LR [c000000001024bc8] .debug_vm_pgtable+0x3f4/0x51c
Call Trace:
[c0000000025f7ae0] [c000000001024a5c] .debug_vm_pgtable+0x288/0x51c
(unreliable)
[c0000000025f7bd0] [c00000000000fa58] .do_one_initcall+0x104/0x2c4
[c0000000025f7cb0] [c000000001003dec] .kernel_init_freeable+0x3d4/0x410
[c0000000025f7da0] [c00000000001004c] .kernel_init+0x10/0x15c
[c0000000025f7e10] [c00000000000bbf4] .ret_from_kernel_thread+0x58/0x64
Instruction dump:
4bffcd05 60000000 e9210078 e94d0370 7d295279 39400000 4182000c 487d3829
60000000 38210090 7fe3fb78 487dacf4 <0fe00000> 7c0802a6 f8010010 f821ff71
---[ end trace 21fc0fb84dac9a9b ]---

Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000005
Rebooting in 120 seconds..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
