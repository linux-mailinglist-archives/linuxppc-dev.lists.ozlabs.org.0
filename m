Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945990F61
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 10:12:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469XxM0lBWzDvrF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 18:12:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 469Xsy0P35zDrhR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 18:09:56 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C551D28A80
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 08:09:52 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B9B5128AA1; Sat, 17 Aug 2019 08:09:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Sat, 17 Aug 2019 08:09:51 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Slab Allocator
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@c-s.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204371-206035-OAgNGih3Ee@https.bugzilla.kernel.org/>
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

--- Comment #38 from Christophe Leroy (christophe.leroy@c-s.fr) ---
Le 30/07/2019 =C3=A0 20:52, bugzilla-daemon@bugzilla.kernel.org a =C3=A9cri=
t=C2=A0:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
> --- Comment #2 from Andrew Morton (akpm@linux-foundation.org) ---
> (switched to email.  Please respond via emailed reply-to-all, not via the
> bugzilla web interface).

Reply all replies to bugzilla-daemon@bugzilla.kernel.org only.


[...]


>=20
> cc'ing various people here.

Hum ... only got that email through the bugzilla interface, and CC'ed=20
people don't show up.


>=20
> I suspect proc_cgroup_show() is innocent and that perhaps
> bpf_prepare_filter() had a memory scribble.  iirc there has been at
> least one recent pretty serious bpf fix applied recently.  Can others
> please take a look?
>=20
> (Seriously - please don't modify this report via the bugzilla web interfa=
ce!)
>=20

Haven't got the original CC'ed list, so please reply with missing Cc's=20
if any.

We have well progressed on this case.

Erhard made a relation being this "Object padding overwritten" issue=20
arising on any driver, and the presence of the BTRFS driver.

Then he was able to bisect the issue to:

commit 69d2480456d1baf027a86e530989d7bedd698d5f
Author: David Sterba <dsterba@suse.com>
Date:   Fri Jun 29 10:56:44 2018 +0200

     btrfs: use copy_page for copying pages instead of memcpy

     Use the helper that's possibly optimized for full page copies.

     Signed-off-by: David Sterba <dsterba@suse.com>



After looking in the code, it has appeared that some of the said "pages"=20
were allocated with "kzalloc()".

Using the patch https://patchwork.ozlabs.org/patch/1148033/ Erhard=20
confirmed that some btrfs functions were calling copy_page() with=20
misaligned destinations.

copy_page(), at least on powerpc, expects cache aligned destination.

The patch https://patchwork.ozlabs.org/patch/1148606/ fixes the issue.

Christophe

---
L'absence de virus dans ce courrier =C3=A9lectronique a =C3=A9t=C3=A9 v=C3=
=A9rifi=C3=A9e par le logiciel
antivirus Avast.
https://www.avast.com/antivirus

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
