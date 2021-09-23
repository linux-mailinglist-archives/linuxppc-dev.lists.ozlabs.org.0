Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C927441635C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 18:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFgcj4HQ0z3bNk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 02:30:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mIn/kf4j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mIn/kf4j; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFgc03HcMz2xY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 02:29:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 53DD160F4C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632414573;
 bh=6oc49AygF4MdKCSC+x5iyXb0svZPo/FkEhYu3+8o8ps=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mIn/kf4jU4cTZlfD/+cNmRwSiz2wMaRoI2ry6Ld8YRqb71m/77S5AKs36ZODc/Vpb
 7XNfoFGUC9ygrrs3mW5EaevI8azQQUlFMs3lgKjbQHeS1vOyRAue1Bc0Av4bHRGqs3
 u9rnFo0f/Fi98F8tCqzERUelNitqznjRd87VxVdAqjNguvIU1f16XiW2hRKKJbVL3C
 Zrk85AxnerQBTnP/7b46ZMPd5gxMleZnseFTqbpy2Yae0Q3MolNQpwAo6cQpOatgsH
 JQnEZyu/0Rnk//45NrObArkBBu/IlIQX2Xvs7jJditFOq5XwCjH6/TDVORlxgYa4Wq
 KDVb2qq3/zWrg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4813460FC4; Thu, 23 Sep 2021 16:29:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Thu, 23 Sep 2021 16:29:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-0bgwdqcCIP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298933
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298933&action=3Dedit
System.map (5.15-rc2 + patch, PowerMac G5 11,2)

(In reply to mpe from comment #8)
> So it looks like you have actually overran your stack, rather than
> something else clobbering your stack.
>=20
> Can you attach your System.map for that exact kernel? We might be able
> to work out what functions we were in when we overran.
>=20
> You could also try changing CONFIG_THREAD_SHIFT to 15, that might keep
> the system running a bit longer and give us some other clues.
>=20
> cheers
Hm, interesting...

What I do to trigger this bug is building llvm-12 on the G5 via distcc (on =
the
other side is a 16-core Opteron) and MAKEOPTS=3D"-j10 -l3". As the G5 got 1=
6 GiB
RAM building runs in a zstd-compressed ext2 filesystem (/sbin/zram-init -d1=
 -s2
-azstd -text2 -orelatime -m1777 -Lvar_tmp_dir 49152 /var/tmp). Most of the =
time
the bug is triggered very shortly after the actual building starts via meso=
n.
At this time the build directory /var/tmp/portage occupies about 800 MiB.

Also sometimes I don't get a proper stack trace via netconsole but this:
BUG: unable to handle kernel data access on write at 0xc000000037c82040
BUG: unable to handle kernel data access on write at 0xc000000037c80000

Please find the relevant System.map attached. I'll do another kernel build =
with
CONFIG_THREAD_SHIFT=3D15 and see if anything changes.

Thanks for investigating this!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
