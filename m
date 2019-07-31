Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A77BC98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 11:07:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z6y70QNJzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 19:07:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z6sz0SLRzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 19:03:49 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id B780B28897
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 09:03:46 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id AC244288CF; Wed, 31 Jul 2019 09:03:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Wed, 31 Jul 2019 09:03:45 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Slab Allocator
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204371-206035-Nced1Tb5ip@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204371-206035@https.bugzilla.kernel.org/>
References: <bug-204371-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204371

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
On Tue, 30 Jul 2019 11:52:44 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> (switched to email.  Please respond via emailed reply-to-all, not via the
> bugzilla web interface).
>=20
>=20
> On Mon, 29 Jul 2019 22:35:48 +0000 bugzilla-daemon@bugzilla.kernel.org wr=
ote:
>=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
> >=20
> >             Bug ID: 204371
> >            Summary: BUG kmalloc-4k (Tainted: G        W        ): Object
> >                     padding overwritten
> >            Product: Memory Management
> >            Version: 2.5
> >     Kernel Version: 5.3.0-rc2
> >           Hardware: PPC-32
> >                 OS: Linux
> >               Tree: Mainline
> >             Status: NEW
> >           Severity: normal
> >           Priority: P1
> >          Component: Slab Allocator
> >           Assignee: akpm@linux-foundation.org
> >           Reporter: erhard_f@mailbox.org
> >         Regression: No=20=20
>=20
> cc'ing various people here.
>=20
> I suspect proc_cgroup_show() is innocent and that perhaps
> bpf_prepare_filter() had a memory scribble.  iirc there has been at
> least one recent pretty serious bpf fix applied recently.  Can others
> please take a look?
>=20
> (Seriously - please don't modify this report via the bugzilla web interfa=
ce!)

Hm, don't know whether this is bpfs fault.. I am getting this for other thi=
ngs
too:

[...]
Jul 31 10:46:53 T600 kernel: Object 442ee539: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
Jul 31 10:46:53 T600 kernel: Object 41b83bb9: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
Jul 31 10:46:53 T600 kernel: Redzone 720e193a: bb bb bb bb=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                ....
Jul 31 10:46:53 T600 kernel: Padding 0b116c89: 00 00 00 00 00 00 00 00=20=
=20=20=20=20=20=20=20=20
                ........
Jul 31 10:46:53 T600 kernel: CPU: 1 PID: 120 Comm: systemd-journal Tainted:=
 G=20=20
 B   W         5.2.4-gentoo #1
Jul 31 10:46:53 T600 kernel: Call Trace:
Jul 31 10:46:53 T600 kernel: [dd663b68] [c0628d80] dump_stack+0xa0/0xfc
(unreliable)
Jul 31 10:46:53 T600 kernel: [dd663b98] [c01984ac]
check_bytes_and_report+0xc8/0xf0
Jul 31 10:46:53 T600 kernel: [dd663bc8] [c0198fd0] check_object+0x10c/0x224
Jul 31 10:46:53 T600 kernel: [dd663bf8] [c0199964]
alloc_debug_processing+0xc4/0x13c
Jul 31 10:46:53 T600 kernel: [dd663c18] [c0199bc4]
___slab_alloc.constprop.72+0x1e8/0x380
Jul 31 10:46:53 T600 kernel: [dd663ca8] [c0199d9c]
__slab_alloc.constprop.71+0x40/0x6c
Jul 31 10:46:53 T600 kernel: [dd663cd8] [c019a014]
kmem_cache_alloc_trace+0x7c/0x170
Jul 31 10:46:53 T600 kernel: [dd663d18] [c02d6a5c] btrfs_opendir+0x48/0x78
Jul 31 10:46:53 T600 kernel: [dd663d38] [c01a9320] do_dentry_open+0x25c/0x2=
f0
Jul 31 10:46:53 T600 kernel: [dd663d68] [c01bc284] path_openat+0x814/0xaf0
Jul 31 10:46:53 T600 kernel: [dd663e38] [c01bc5a4] do_filp_open+0x44/0xa0
Jul 31 10:46:53 T600 kernel: [dd663ee8] [c01aa178] do_sys_open+0x7c/0x108
Jul 31 10:46:53 T600 kernel: [dd663f38] [c0015274] ret_from_syscall+0x0/0x34
Jul 31 10:46:53 T600 kernel: --- interrupt: c00 at 0x7eae14
                                 LR =3D 0x7eadf8
Jul 31 10:46:53 T600 kernel: FIX kmalloc-4k: Restoring
0x0b116c89-0x85f2eca1=3D0x5a
[...]

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
