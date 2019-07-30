Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 877FC7B2B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 20:54:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ym2L0QkYzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 04:54:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ym0C6CgNzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 04:52:59 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 8852728704
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 18:52:56 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 7AA7328877; Tue, 30 Jul 2019 18:52:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Tue, 30 Jul 2019 18:52:54 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Slab Allocator
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: akpm@linux-foundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204371-206035-O9m4mwJN9f@https.bugzilla.kernel.org/>
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

--- Comment #2 from Andrew Morton (akpm@linux-foundation.org) ---
(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).


On Mon, 29 Jul 2019 22:35:48 +0000 bugzilla-daemon@bugzilla.kernel.org wrot=
e:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
>             Bug ID: 204371
>            Summary: BUG kmalloc-4k (Tainted: G        W        ): Object
>                     padding overwritten
>            Product: Memory Management
>            Version: 2.5
>     Kernel Version: 5.3.0-rc2
>           Hardware: PPC-32
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Slab Allocator
>           Assignee: akpm@linux-foundation.org
>           Reporter: erhard_f@mailbox.org
>         Regression: No

cc'ing various people here.

I suspect proc_cgroup_show() is innocent and that perhaps
bpf_prepare_filter() had a memory scribble.  iirc there has been at
least one recent pretty serious bpf fix applied recently.  Can others
please take a look?

(Seriously - please don't modify this report via the bugzilla web interface=
!)

> Created attachment 284033
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D284033&action=3Dedit
> dmesg (PowerMac G4 DP, kernel 5.3-rc2)
>=20
> Seeing this during boot with SLUB_DEBUG_ON enabled in the kernel. Happens=
 on
> 5.3.0-rc2, 5.2.4 is also affected. I did not test earlier kernels.
>=20
> Machine is a PowerMac G4 DP (3,6), ppc32 running Gentoo Linux.
>=20
> [...]
> [   17.499445]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [   17.508472] BUG kmalloc-4k (Tainted: G        W        ): Object paddi=
ng
> overwritten
> [   17.517521]
> -------------------------------------------------------------------------=
----
>=20
> [   17.535804] INFO: 0x(ptrval)-0x(ptrval). First byte 0x0 instead of 0x5a
> [   17.544986] INFO: Allocated in proc_cgroup_show+0x30/0x24c age=3D63 cp=
u=3D0
> pid=3D1
> [   17.554078]  __slab_alloc.constprop.73+0x40/0x6c
> [   17.563007]  kmem_cache_alloc_trace+0x7c/0x1a0
> [   17.571874]  proc_cgroup_show+0x30/0x24c
> [   17.580677]  proc_single_show+0x54/0x74
> [   17.589359]  seq_read+0x27c/0x460
> [   17.597919]  __vfs_read+0x3c/0x10c
> [   17.606352]  vfs_read+0xa8/0xf8
> [   17.614656]  ksys_read+0x7c/0xd0
> [   17.622875]  ret_from_syscall+0x0/0x34
> [   17.631064] INFO: Freed in proc_cgroup_show+0xbc/0x24c age=3D4294882542
> cpu=3D0
> pid=3D0
> [   17.639423]  kfree+0x264/0x29c
> [   17.647698]  proc_cgroup_show+0xbc/0x24c
> [   17.655819]  proc_single_show+0x54/0x74
> [   17.663730]  seq_read+0x27c/0x460
> [   17.671542]  __vfs_read+0x3c/0x10c
> [   17.679290]  vfs_read+0xa8/0xf8
> [   17.686990]  ksys_read+0x7c/0xd0
> [   17.694683]  ret_from_syscall+0x0/0x34
> [   17.702331] INFO: Slab 0x(ptrval) objects=3D7 used=3D7 fp=3D0x(ptrval)
> flags=3D0x10200
> [   17.710165] INFO: Object 0x(ptrval) @offset=3D21408 fp=3D0x(ptrval)
>=20
> [   17.725690] Redzone (ptrval): bb bb bb bb bb bb bb bb=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>   ........
> [   17.733495] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.741376] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.749151] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.756811] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.764402] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.771916] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.779354] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.786790] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.794226] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.801579] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.808819] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.815940] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.822914] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.829760] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.836547] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.843231] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.849810] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.856317] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.862758] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.869038] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.875111] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.881062] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.886893] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.892602] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.898248] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.903705] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.908980] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.914129] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.919216] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.924171] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.929013] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.933772] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.938444] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.942999] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.947394] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.951620] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.955736] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.959744] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.963697] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.967459] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.971032] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.974419] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.977616] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.980689] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.983620] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.986408] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.989118] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.991759] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.994377] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.996931] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   17.999437] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.001892] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.004302] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.006655] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.008848] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.010879] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.012846] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.014789] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.016669] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.018500] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.020282] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.022018] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.023696] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.025223] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.026609] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.027883] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.029062] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.030085] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.031108] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.032131] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.033154] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.034177] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.035200] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.036223] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.037246] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.038269] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.039292] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.040315] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.041337] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.042360] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.043383] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.044406] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.045429] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.046452] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.047475] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.048498] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.049521] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.050544] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.051567] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.052590] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.053612] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.054635] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.055658] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.056681] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.057704] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.058727] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.059750] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.060773] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.061796] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.062819] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.063841] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.064864] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.065887] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.066910] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.067933] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.068956] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.069979] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.071002] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.072024] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.073047] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.074070] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.075093] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.076116] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.077139] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.078162] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.079185] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.080208] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.081231] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.082254] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.083277] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.084299] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.085322] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.086345] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.087368] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.088391] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.089414] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.090437] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.091460] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.092483] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.093506] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.094529] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.095552] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.096575] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.097598] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.098621] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.099643] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.100666] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.101689] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.102712] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.103735] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.104758] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.105781] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.106804] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.107826] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.108849] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.109872] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.110895] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.111918] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.112941] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.113964] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.114987] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.116010] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.117033] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.118056] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.119079] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.120102] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.121124] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.122147] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.123170] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.124193] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.125216] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.126239] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.127262] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.128285] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.129308] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.130331] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.131354] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.132377] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.133399] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.134422] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.135445] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.136468] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.137491] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.138514] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.139537] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.140560] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.141583] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.142605] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.143628] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.144651] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.145674] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.146697] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.147720] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.148743] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.149766] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.150789] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.151812] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.152835] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.153858] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.154880] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.155903] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.156926] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.157949] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.158972] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.159995] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.161018] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.162041] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.163064] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.164087] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.165110] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.166133] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.167156] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.168179] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.169203] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.170226] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.171249] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.172272] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.173295] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.174318] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.175341] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.176364] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.177387] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.178410] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.179433] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.180456] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.181479] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.182502] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.183525] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.184548] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.185571] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.186594] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.187617] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.188640] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.189663] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.190686] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.191709] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.192732] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.193756] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.194778] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.195801] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.196825] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.197848] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.198871] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.199894] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.200917] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.201940] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.202963] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.203986] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.205009] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.206032] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.207055] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.208078] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.209101] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.210124] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.211147] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.212169] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.213192] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.214215] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.215239] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.216262] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.217285] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.218308] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.219331] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.220354] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.221377] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> 6b
>  kkkkkkkkkkkkkkkk
> [   18.222400] Object (ptrval): 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b=
 6b
> a5
>  kkkkkkkkkkkkkkk.
> [   18.223429] Redzone (ptrval): bb bb bb bb=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>   ....
> [   18.224584] Padding (ptrval): 00 00 00 00 00 00 00 00=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
>   ........
> [   18.225813] CPU: 0 PID: 140 Comm: (md-udevd) Tainted: G    B   W=20=20=
=20=20=20=20=20=20
> 5.3.0-rc2 #4
> [   18.227171] Call Trace:
> [   18.228478] [ed38bc88] [c063ec6c] dump_stack+0xa0/0xfc (unreliable)
> [   18.230033] [ed38bcb8] [c019cc98] check_bytes_and_report+0xc8/0xf0
> [   18.231675] [ed38bce8] [c019d794] check_object+0x10c/0x224
> [   18.233364] [ed38bd18] [c019e210] alloc_debug_processing+0xc4/0x13c
> [   18.235168] [ed38bd38] [c019e470] ___slab_alloc.constprop.74+0x1e8/0x3=
80
> [   18.237081] [ed38bdc8] [c019e648] __slab_alloc.constprop.73+0x40/0x6c
> [   18.239080] [ed38bdf8] [c01a1328] __kmalloc_track_caller+0xd8/0x1d4
> [   18.241162] [ed38be38] [c016013c] kmemdup+0x28/0x5c
> [   18.243286] [ed38be58] [c054dfd8] bpf_prepare_filter+0x5a8/0x688
> [   18.245533] [ed38bec8] [c054e254] bpf_prog_create_from_user+0xe8/0x114
> [   18.247882] [ed38bef8] [c00df0e8] do_seccomp+0x30c/0x700
> [   18.250288] [ed38bf38] [c0014274] ret_from_syscall+0x0/0x34
> [   18.252772] --- interrupt: c00 at 0x5292c4
>                    LR =3D 0x7521a4
> [   18.257881] FIX kmalloc-4k: Restoring 0x(ptrval)-0x(ptrval)=3D0x5a
> [...]
>=20
> --=20
> You are receiving this mail because:
> You are the assignee for the bug.

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
