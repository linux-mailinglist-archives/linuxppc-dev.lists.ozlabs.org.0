Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F38B405
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 11:23:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4676hx5LzczDqV6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 19:23:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4676cv4YBPzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 19:20:15 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id F12A42864F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 09:20:04 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id E54C928668; Tue, 13 Aug 2019 09:20:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Tue, 13 Aug 2019 09:20:03 +0000
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
Message-ID: <bug-204371-206035-P7rk3N1lrb@https.bugzilla.kernel.org/>
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

--- Comment #15 from Erhard F. (erhard_f@mailbox.org) ---
On Fri, 09 Aug 2019 12:31:26 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
# cat ~/bisect01.log=20
bin=C3=A4re Suche: danach noch 37903 Commits zum Testen =C3=BCbrig (ungef=
=C3=A4hr 15 Schritte)
[9abf8acea297b4c65f5fa3206e2b8e468e730e84] Merge tag 'tty-4.17-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
bin=C3=A4re Suche: danach noch 19051 Commits zum Testen =C3=BCbrig (ungef=
=C3=A4hr 14 Schritte)
[7c00e8ae041b349992047769af741b67379ce19a] Merge tag 'armsoc-soc' of
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
bin=C3=A4re Suche: danach noch 9762 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 13 Schritte)
[dafa5f6577a9eecd2941add553d1672c30b02364] Merge branch 'linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6
bin=C3=A4re Suche: danach noch 4644 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 12 Schritte)
[2ed9db3074fcd8d12709fe40ff0e691d74229818] net: sched: cls_api: fix dead co=
de
in switch
bin=C3=A4re Suche: danach noch 2319 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 11 Schritte)
[b219a1d2de0c025318475e3bbf8e3215cf49d083] Merge branch 'for-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/shli/md
bin=C3=A4re Suche: danach noch 1153 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 10 Schritte)
[85a0b791bc17f7a49280b33e2905d109c062a47b] Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
bin=C3=A4re Suche: danach noch 629 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 9 Schritte)
[10f3e23f07cb0c20f9bcb77a5b5a7eb2a1b2a2fe] Merge tag 'ext4_for_linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4
bin=C3=A4re Suche: danach noch 273 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 8 Schritte)
[575b94386bd539a7d803aee9fd4a8d275844c40f] Merge tag 'locks-v4.19-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux
bin=C3=A4re Suche: danach noch 136 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 7 Schritte)
[d7e8555b1dd493c809e56e359974eecabe7d3fde] btrfs: remove unused member
async_submit_bio::fs_info
bin=C3=A4re Suche: danach noch 68 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 6 Schritte)
[389305b2aa68723c754f88d9dbd268a400e10664] btrfs: relocation: Only remove r=
eloc
rb_trees if reloc control has been initialized
bin=C3=A4re Suche: danach noch 34 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 5 Schritte)
[d814a49198eafa6163698bdd93961302f3a877a4] btrfs: use correct compare funct=
ion
of dirty_metadata_bytes
bin=C3=A4re Suche: danach noch 16 Commits zum Testen =C3=BCbrig (ungef=C3=
=A4hr 4 Schritte)
[c7b562c5480322ffaf591f45a4ff7ee089340ab4] btrfs: raid56: catch errors from
full_stripe_write
bin=C3=A4re Suche: danach noch 8 Commits zum Testen =C3=BCbrig (ungef=C3=A4=
hr 3 Schritte)
[65ad010488a5cc0f123a9924f7ad26a1b3f6a4f6] btrfs: pass only eb to
num_extent_pages
bin=C3=A4re Suche: danach noch 3 Commits zum Testen =C3=BCbrig (ungef=C3=A4=
hr 2 Schritte)
[37508515621551538addaf826ab4b8a9aaf0a382] btrfs: simplify some assignments=
 of
inode numbers
bin=C3=A4re Suche: danach noch 1 Commit zum Testen =C3=BCbrig (ungef=C3=A4h=
r 1 Schritt)
[69d2480456d1baf027a86e530989d7bedd698d5f] btrfs: use copy_page for copying
pages instead of memcpy
bin=C3=A4re Suche: danach noch 0 Commits zum Testen =C3=BCbrig (ungef=C3=A4=
hr 0 Schritte)
[3ffbd68c48320730ef64ebfb5e639220f1f65483] btrfs: simplify pointer chasing =
of
local fs_info variables
69d2480456d1baf027a86e530989d7bedd698d5f is the first bad commit
commit 69d2480456d1baf027a86e530989d7bedd698d5f
Author: David Sterba <dsterba@suse.com>
Date:   Fri Jun 29 10:56:44 2018 +0200

    btrfs: use copy_page for copying pages instead of memcpy

    Use the helper that's possibly optimized for full page copies.

    Signed-off-by: David Sterba <dsterba@suse.com>

:040000 040000 87de10a38618c1655c3266ff5a31358068fa1ca6
d0a2612d260215acaff66adaa5183ebd29a4b710 M      fs

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
