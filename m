Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222517BAF63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 01:41:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t8H9luS6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1p4K6RzJz3cl3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 10:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t8H9luS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1p3Q5Mm8z3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 10:41:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD32ECE2494
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 23:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECB95C433C9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696549264;
	bh=oOOyajYEKtGlLo5e7jnns0BCjbiUx4fwv1OfkDeUNNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t8H9luS6KOrGiXmuU7NjbV4tbXxmv+ThPrBtfZwCMyPaIYgYgqnHL3UKDUvyj3Gr0
	 1JyuhCnJHqIY6gIECap3o8HxvW+qtBMhh5AZE2NIGmrom3sj/54kSjlNJd4fMzquz4
	 NiKERpAXgAa54xZsgrfI3OXlgtOYYiKctM8oDVzMBo4hJmUm0rANX46q8DnMiLDKUH
	 ZYwZs4XvOmLJAx0T6BcFK6DcZjnQD/sPkMZbHZpzGvb5wBnON29OTePMQiRXHwldJZ
	 pzgG5E28l9WtsWLLO+M9wE+Sg1Gqk2kRAptV6CuTLATK3/V2INTSalE5pVgEsVf+uA
	 cNtEe9nYnqjbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA200C4332E; Thu,  5 Oct 2023 23:41:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] [bisected] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Thu, 05 Oct 2023 23:41:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-216156-206035-9mQgxTI3Kz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|kmemleak: Not scanning      |[bisected] kmemleak: Not
                   |unknown object at           |scanning unknown object at
                   |0xc00000007f000000          |0xc00000007f000000

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Finally had some time to bisect this issue.

 # git bisect bad
23c2d497de21f25898fbea70aeb292ab8acc8c94 is the first bad commit
commit 23c2d497de21f25898fbea70aeb292ab8acc8c94
Author: Patrick Wang <patrick.wang.shcn@gmail.com>
Date:   Thu Apr 14 19:14:04 2022 -0700

    mm: kmemleak: take a full lowmem check in kmemleak_*_phys()

    The kmemleak_*_phys() apis do not check the address for lowmem's min
    boundary, while the caller may pass an address below lowmem, which will
    trigger an oops:

      # echo scan > /sys/kernel/debug/kmemleak
      Unable to handle kernel paging request at virtual address
ff5fffffffe00000
      Oops [#1]
      Modules linked in:
      CPU: 2 PID: 134 Comm: bash Not tainted 5.18.0-rc1-next-20220407 #33
      Hardware name: riscv-virtio,qemu (DT)
      epc : scan_block+0x74/0x15c
       ra : scan_block+0x72/0x15c
      epc : ffffffff801e5806 ra : ffffffff801e5804 sp : ff200000104abc30
       gp : ffffffff815cd4e8 tp : ff60000004cfa340 t0 : 0000000000000200
       t1 : 00aaaaaac23954cc t2 : 00000000000003ff s0 : ff200000104abc90
       s1 : ffffffff81b0ff28 a0 : 0000000000000000 a1 : ff5fffffffe01000
       a2 : ffffffff81b0ff28 a3 : 0000000000000002 a4 : 0000000000000001
       a5 : 0000000000000000 a6 : ff200000104abd7c a7 : 0000000000000005
       s2 : ff5fffffffe00ff9 s3 : ffffffff815cd998 s4 : ffffffff815d0e90
       s5 : ffffffff81b0ff28 s6 : 0000000000000020 s7 : ffffffff815d0eb0
       s8 : ffffffffffffffff s9 : ff5fffffffe00000 s10: ff5fffffffe01000
       s11: 0000000000000022 t3 : 00ffffffaa17db4c t4 : 000000000000000f
       t5 : 0000000000000001 t6 : 0000000000000000
      status: 0000000000000100 badaddr: ff5fffffffe00000 cause:
000000000000000d
        scan_gray_list+0x12e/0x1a6
        kmemleak_scan+0x2aa/0x57e
        kmemleak_write+0x32a/0x40c
        full_proxy_write+0x56/0x82
        vfs_write+0xa6/0x2a6
        ksys_write+0x6c/0xe2
        sys_write+0x22/0x2a
        ret_from_syscall+0x0/0x2

    The callers may not quite know the actual address they pass(e.g. from
    devicetree).  So the kmemleak_*_phys() apis should guarantee the address
    they finally use is in lowmem range, so check the address for lowmem's
    min boundary.

    Link:
https://lkml.kernel.org/r/20220413122925.33856-1-patrick.wang.shcn@gmail.com
    Signed-off-by: Patrick Wang <patrick.wang.shcn@gmail.com>
    Acked-by: Catalin Marinas <catalin.marinas@arm.com>
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

 mm/kmemleak.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


And indeed if I revert 23c2d497de21f25898fbea70aeb292ab8acc8c94 (on top of =
5.19
as mm/kmemleak.c differs too much in later kernels) the "kmemleak: Not scan=
ning
unknown object at 0xc00000007f000000" is gone.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
