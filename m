Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6D87A48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 14:37:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464lBL6nfMzDr7C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:37:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 464l3P6XKNzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 22:31:29 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id CCD7428CB7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 12:31:26 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id BDA0B2883A; Fri,  9 Aug 2019 12:31:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Fri, 09 Aug 2019 12:31:26 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Slab Allocator
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpe@ellerman.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204371-206035-aODna6RrYz@https.bugzilla.kernel.org/>
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

--- Comment #11 from mpe@ellerman.id.au ---
bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>
> --- Comment #10 from David Sterba (dsterba@suse.com) ---
> In my case it happened on 5.3-rc3, with a strestest. The same machine has
> been
> running fstests periodically, with slab debug on, but there are no slab
> reports
> like that.
>
> [ 8516.870046] BUG kmalloc-4k (Not tainted): Poison overwritten=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.875873]
> -------------------------------------------------------------------------=
----=20
>
> [ 8516.885864] Disabling lock debugging due to kernel taint=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.891312] INFO: 0x000000001c70c8c9-0x000000003cd1e164. First byte 0x=
16
> instead of 0x6b=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.899717] INFO: Allocated in btrfs_read_tree_root+0x46/0x120 [btrfs]
> age=3D1769 cpu=3D7 pid=3D8717=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.908544]  __slab_alloc.isra.53+0x3e/0x70=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.912861]  kmem_cache_alloc_trace+0x1b0/0x330=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.917581]  btrfs_read_tree_root+0x46/0x120 [btrfs]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.922737]  btrfs_read_fs_root+0xe/0x40 [btrfs]=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.927552]  create_reloc_root+0x17f/0x2a0 [btrfs]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.932536]  btrfs_init_reloc_root+0x72/0xe0 [btrfs]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.937686]  record_root_in_trans+0xbb/0xf0 [btrfs]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.942750]  btrfs_record_root_in_trans+0x50/0x70 [btrfs]=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.948340]  start_transaction+0xa1/0x550 [btrfs]=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.953237]  __btrfs_prealloc_file_range+0xca/0x490 [btrfs]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.959003]  btrfs_prealloc_file_range+0x10/0x20 [btrfs]=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.964509]  prealloc_file_extent_cluster+0x13e/0x2b0 [btrfs]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.970447]  relocate_file_extent_cluster+0x8d/0x530 [btrfs]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.976305]  relocate_data_extent+0x80/0x110 [btrfs]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.981469]  relocate_block_group+0x473/0x720 [btrfs]=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> [ 8516.986711]  btrfs_relocate_block_group+0x15f/0x2c0 [btrfs]=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20

So this is looking more like it could be a btrfs bug, given you've both
hit it using btrfs but on different platforms.

cheers

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
