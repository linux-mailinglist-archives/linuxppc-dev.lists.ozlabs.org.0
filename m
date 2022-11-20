Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDF631659
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 21:34:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFj1D1lphz3f2y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 07:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NgnZibW7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NgnZibW7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFj0F3fy6z3bdC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 07:33:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9544DB80B56
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 20:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56312C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668976406;
	bh=k6tewi5KG1Q58zXPDRG3j6NbifayUeaehfntVmqv7jI=;
	h=From:To:Subject:Date:From;
	b=NgnZibW7fFh81ZUvY8pp7JBlndN9O9klxR8D8cVxDwMZdWdSphP547s/H6rbDDj4f
	 ncz6HwJAg+e9445AOrkUsfxGCZkFdI7elczS0dSgeqbOUyIikqRyA7K272Krq/R0dc
	 Ce2PcxVq4ydw59F5HMzLGCYOgPurKRKvmNhRPpKc22CdwN+smhgfXqIQr0IRqvdWr9
	 SZoBF6c6gktSg0DLV8CZBNpB4q9Rrra5ZxwFU/yNjZUdmDb1jox+wjLpRj4pqDo1XC
	 OENpVbsWdjqXZGfSAtqmSUgc/bdT3PlKOtRFjIVxLHyoVtom+XtIz0TVYYE0k16/J9
	 mOTlRD6QiBwBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 35E31C433E4; Sun, 20 Nov 2022 20:33:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216713] New: BUG: Bad page map in process init  pte:c0ab684c
 pmd:01182000 (on a PowerMac G4 DP)
Date: Sun, 20 Nov 2022 20:33:25 +0000
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
Message-ID: <bug-216713-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216713

            Bug ID: 216713
           Summary: BUG: Bad page map in process init  pte:c0ab684c
                    pmd:01182000 (on a PowerMac G4 DP)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.0.9
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

Created attachment 303243
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303243&action=3Dedit
kernel dmesg (6.0.9, PowerMac G4 DP)

Getting this at boot sometimes, but not always (PowerMac G4 DP, kernel 6.0.=
9):

[...]
Freeing unused kernel image (initmem) memory: 1328K
Checked W+X mappings: passed, no W+X pages found
rodata_test: all tests were successful
Run /sbin/init as init process
_swap_info_get: Bad swap file entry 24c0ab68
BUG: Bad page map in process init  pte:c0ab684c pmd:01182000
addr:a7891000 vm_flags:00000070 anon_vma:00000000 mapping:00000000 index:a7=
891
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 0 PID: 1 Comm: init Tainted: G                T  6.0.9-gentoo-PMacG4 #1
Call Trace:
[f1025810] [c0629064] dump_stack_lvl+0x60/0xa4 (unreliable)
[f1025830] [c0205054] print_bad_pte+0x1c8/0x254
[f1025870] [c02081d4] unmap_page_range+0x6a0/0x790
[f10258e0] [c0208794] unmap_vmas+0xf0/0x1d8
[f1025930] [c020f878] unmap_region+0xac/0x140
[f10259b0] [c02125c8] __do_munmap+0x1ec/0x540
[f10259f0] [c021425c] mmap_region+0x260/0x658
[f1025a50] [c0214924] do_mmap+0x2d0/0x530
[f1025a90] [c01ecab8] vm_mmap_pgoff+0x110/0x1a4
[f1025ae0] [c0211818] ksys_mmap_pgoff+0xa4/0x154
[f1025b10] [c0015b30] system_call_exception+0xc0/0x178
[f1025f30] [c001c1a8] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0xa7e2a9a8
NIP:  a7e2a9a8 LR: a7e10758 CTR: a7e20650
REGS: f1025f40 TRAP: 0c00   Tainted: G                T   (6.0.9-gentoo-PMa=
cG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24482288  XER: 00000000

GPR00: 000000c0 afea4910 00000000 a7890000 00381edc 00000005 00000812 00000=
003=20
GPR08: 00000000 afea4dc0 afea5020 a7e20650 0a574b24 00000000 00000003 00000=
000=20
GPR16: 00000000 afea4b58 afea4940 a7e55018 a7e53f08 00381edc 004e26ff a7e51=
760=20
GPR24: 00000003 afea4b20 00000000 00000000 00000002 a7e51790 a7e54fe0 afea4=
9f0=20
NIP [a7e2a9a8] 0xa7e2a9a8
LR [a7e10758] 0xa7e10758
--- interrupt: c00
Disabling lock debugging due to kernel taint
BUG: Bad page map in process init  pte:c1182089 pmd:01182000
addr:a7892000 vm_flags:00000070 anon_vma:00000000 mapping:00000000 index:a7=
892
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 1 PID: 1 Comm: init Tainted: G    B           T  6.0.9-gentoo-PMacG4 #1
Call Trace:
[f1025800] [c0629064] dump_stack_lvl+0x60/0xa4 (unreliable)
[f1025820] [c0205054] print_bad_pte+0x1c8/0x254
[f1025860] [c0206ee0] vm_normal_page+0x74/0x110
[f1025870] [c0207da0] unmap_page_range+0x26c/0x790
[f10258e0] [c0208794] unmap_vmas+0xf0/0x1d8
[f1025930] [c020f878] unmap_region+0xac/0x140
[f10259b0] [c02125c8] __do_munmap+0x1ec/0x540
[f10259f0] [c021425c] mmap_region+0x260/0x658
[f1025a50] [c0214924] do_mmap+0x2d0/0x530
[f1025a90] [c01ecab8] vm_mmap_pgoff+0x110/0x1a4
[f1025ae0] [c0211818] ksys_mmap_pgoff+0xa4/0x154
[f1025b10] [c0015b30] system_call_exception+0xc0/0x178
[f1025f30] [c001c1a8] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0xa7e2a9a8
NIP:  a7e2a9a8 LR: a7e10758 CTR: a7e20650
REGS: f1025f40 TRAP: 0c00   Tainted: G    B           T   (6.0.9-gentoo-PMa=
cG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24482288  XER: 00000000

GPR00: 000000c0 afea4910 00000000 a7890000 00381edc 00000005 00000812 00000=
003=20
GPR08: 00000000 afea4dc0 afea5020 a7e20650 0a574b24 00000000 00000003 00000=
000=20
GPR16: 00000000 afea4b58 afea4940 a7e55018 a7e53f08 00381edc 004e26ff a7e51=
760=20
GPR24: 00000003 afea4b20 00000000 00000000 00000002 a7e51790 a7e54fe0 afea4=
9f0=20
NIP [a7e2a9a8] 0xa7e2a9a8
LR [a7e10758] 0xa7e10758
--- interrupt: c00
BUG: Bad page map in process init  pte:648a5747 pmd:01182000
page:(ptrval) refcount:0 mapcount:-1 mapping:00000000 index:0x1 pfn:0x648a5
flags: 0x80000002(referenced|zone=3D2)
raw: 80000002 00000100 00000122 00000000 00000001 00000000 fffffffe 00000000
raw: 00000000
page dumped because: bad pte
addr:a7896000 vm_flags:00000070 anon_vma:00000000 mapping:00000000 index:a7=
896
file:(null) fault:0x0 mmap:0x0 read_folio:0x0
CPU: 1 PID: 1 Comm: init Tainted: G    B           T  6.0.9-gentoo-PMacG4 #1
Call Trace:
[f1025810] [c0629064] dump_stack_lvl+0x60/0xa4 (unreliable)
[f1025830] [c0205054] print_bad_pte+0x1c8/0x254
[f1025870] [c0207fc8] unmap_page_range+0x494/0x790
[f10258e0] [c0208794] unmap_vmas+0xf0/0x1d8
[f1025930] [c020f878] unmap_region+0xac/0x140
[f10259b0] [c02125c8] __do_munmap+0x1ec/0x540
[f10259f0] [c021425c] mmap_region+0x260/0x658
[f1025a50] [c0214924] do_mmap+0x2d0/0x530
[f1025a90] [c01ecab8] vm_mmap_pgoff+0x110/0x1a4
[f1025ae0] [c0211818] ksys_mmap_pgoff+0xa4/0x154
[f1025b10] [c0015b30] system_call_exception+0xc0/0x178
[f1025f30] [c001c1a8] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0xa7e2a9a8
NIP:  a7e2a9a8 LR: a7e10758 CTR: a7e20650
REGS: f1025f40 TRAP: 0c00   Tainted: G    B           T   (6.0.9-gentoo-PMa=
cG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24482288  XER: 00000000

GPR00: 000000c0 afea4910 00000000 a7890000 00381edc 00000005 00000812 00000=
003=20
GPR08: 00000000 afea4dc0 afea5020 a7e20650 0a574b24 00000000 00000003 00000=
000=20
GPR16: 00000000 afea4b58 afea4940 a7e55018 a7e53f08 00381edc 004e26ff a7e51=
760=20
GPR24: 00000003 afea4b20 00000000 00000000 00000002 a7e51790 a7e54fe0 afea4=
9f0=20
NIP [a7e2a9a8] 0xa7e2a9a8
LR [a7e10758] 0xa7e10758
--- interrupt: c00
_swap_info_get: Bad swap file entry 20c09b05
BUG: Bad page map in process init  pte:c09b0540 pmd:01182000
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
