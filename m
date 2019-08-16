Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7889040D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 16:39:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4695YR1cqnzDrRl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 00:39:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4695Tr5k1HzDrF0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 00:36:00 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 01A71289D7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:35:57 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id F403E28A4F; Fri, 16 Aug 2019 14:35:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Fri, 16 Aug 2019 14:35:55 +0000
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
Message-ID: <bug-204371-206035-DZemL6yJn5@https.bugzilla.kernel.org/>
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

--- Comment #33 from Erhard F. (erhard_f@mailbox.org) ---
On Fri, 16 Aug 2019 08:22:31 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
> --- Comment #32 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> I think first thing is to fix test_add_free_space_entry() :
> - replace the map =3D kzalloc(...) by map =3D (void *)get_zeroed_page(...=
) like
> in
> other places.
> - replace the kfree(map); by free_page((unsigned long)map);
diff --git a/fs/btrfs/free-space-cache.c b/fs/btrfs/free-space-cache.c
index 062be9dde4c6..ed15645b4321 100644
--- a/fs/btrfs/free-space-cache.c
+++ b/fs/btrfs/free-space-cache.c
@@ -764,7 +764,7 @@ static int __load_free_space_cache(struct btrfs_root *r=
oot,
struct inode *inode,
                } else {
                        ASSERT(num_bitmaps);
                        num_bitmaps--;
-                       e->bitmap =3D kzalloc(PAGE_SIZE, GFP_NOFS);
+                       e->bitmap =3D (void *)get_zeroed_page(GFP_NOFS);
                        if (!e->bitmap) {
                                kmem_cache_free(
                                        btrfs_free_space_cachep, e);
@@ -1881,7 +1881,7 @@ static void free_bitmap(struct btrfs_free_space_ctl *=
ctl,
                        struct btrfs_free_space *bitmap_info)
 {
        unlink_free_space(ctl, bitmap_info);
-       kfree(bitmap_info->bitmap);
+       free_page((unsigned long)bitmap_info->bitmap);
        kmem_cache_free(btrfs_free_space_cachep, bitmap_info);
        ctl->total_bitmaps--;
        ctl->op->recalc_thresholds(ctl);
@@ -2135,7 +2135,7 @@ static int insert_into_bitmap(struct btrfs_free_space=
_ctl
*ctl,
                }

                /* allocate the bitmap */
-               info->bitmap =3D kzalloc(PAGE_SIZE, GFP_NOFS);
+               info->bitmap =3D (void *)get_zeroed_page(GFP_NOFS);
                spin_lock(&ctl->tree_lock);
                if (!info->bitmap) {
                        ret =3D -ENOMEM;
@@ -2146,7 +2146,7 @@ static int insert_into_bitmap(struct btrfs_free_space=
_ctl
*ctl,

 out:
        if (info) {
-               kfree(info->bitmap);
+               free_page((unsigned long)info->bitmap);
                kmem_cache_free(btrfs_free_space_cachep, info);
        }

@@ -2802,7 +2802,7 @@ u64 btrfs_alloc_from_cluster(struct
btrfs_block_group_cache *block_group,
        if (entry->bytes =3D=3D 0) {
                ctl->free_extents--;
                if (entry->bitmap) {
-                       kfree(entry->bitmap);
+                       free_page((unsigned long)entry->bitmap);
                        ctl->total_bitmaps--;
                        ctl->op->recalc_thresholds(ctl);
                }
@@ -3606,7 +3606,7 @@ int test_add_free_space_entry(struct
btrfs_block_group_cache *cache,
        }

        if (!map) {
-               map =3D kzalloc(PAGE_SIZE, GFP_NOFS);
+               map =3D (void *)get_zeroed_page(GFP_NOFS);
                if (!map) {
                        kmem_cache_free(btrfs_free_space_cachep, info);
                        return -ENOMEM;
@@ -3635,7 +3635,7 @@ int test_add_free_space_entry(struct
btrfs_block_group_cache *cache,

        if (info)
                kmem_cache_free(btrfs_free_space_cachep, info);
-       kfree(map);
+       free_page((unsigned long)map);
        return 0;
 }

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
