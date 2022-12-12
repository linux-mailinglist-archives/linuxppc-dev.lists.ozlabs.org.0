Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F227649992
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 08:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVtcB2Kpqz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 18:31:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yc0SnRZO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yc0SnRZO;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVtbC4pCwz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 18:31:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0A70FCE0E03
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 07:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46EA7C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670830259;
	bh=2NDast8UQOlkNy6yCucanqKI0+EsHyBhu+k9qFjXEKY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yc0SnRZOEq7F1f+149w1R6CWaMkyT/BnlsSX2FGqUC2jrrGNWNOlg/UNRccEh4Wo8
	 nvPXhTGIi7OtLWj7xxzuVmkBpEVWKTmrfh2bge1TyKOq+KXf2m1zY6QcZb5wIsqH3u
	 /3FAv4at6aqHHU0cPcuFRPbqSBfp5UbpYdqEdFz0w5ugithEBQYGqyE/ZAG3nOxC+Z
	 4lCVGiDgvtP697dDWeDj9HCcGV3gXRV9QXR9cqg9z4wojnzzHC2CF/flM04A0rKb3/
	 Apn1munSk2Jog1H7LtSO6jNdv9u8WBjdmA4ruLC3/GQHu/sNBncvIfbbMS7E79vCVN
	 /vXrtE8WDcZdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 31269C43142; Mon, 12 Dec 2022 07:30:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Mon, 12 Dec 2022 07:30:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-L4SJLvo7CX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035@https.bugzilla.kernel.org/>
References: <bug-214913-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

--- Comment #11 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Le 12/12/2022 =C3=A0 04:52, Nicholas Piggin a =C3=A9crit=C2=A0:
> On Sun Dec 11, 2022 at 11:19 PM AEST,  wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D214913
>>
>> --- Comment #7 from Zorro Lang (zlang@redhat.com) ---
>> (In reply to Michael Ellerman from comment #5)
>>> Sorry I don't have any idea which commit could have fixed this.
>>>
>>> The process that crashed was "fsstress", do you know if it uses io_urin=
g?
>>
>> Yes, fsstress has io_uring read/write operations. And from the kernel
>> .config
>> file(as attachment), the CONFIG_IO_URING=3Dy
>=20
> The task being dumped seems like it's lost its task->thread.regs. The
> NULL pointer is here:
>=20
> int tm_cgpr_active(struct task_struct *target, const struct user_regset
> *regset)
> {
>          if (!cpu_has_feature(CPU_FTR_TM))
>                  return -ENODEV;
>=20
>          if (!MSR_TM_ACTIVE(target->thread.regs->msr))
>                  return 0;
>=20
>          return regset->n;
> }
>=20
> On that regs->msr deref. r9 contains the regs pointer.
>=20
> The kernel attempt to read user page - exploit attempt? message is
> I think a red herring it's coming up because of the NULL deref I
> think (I thought we fixed that).
>=20

No we didn't fix that, my patch was rejected see=20
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8b865b93d25c15c8e6d=
41e71c368bfc28da4489d.1606816701.git.christophe.leroy@csgroup.eu/

The reason for the rejection was:

   The first page can be mapped if mmap_min_addr is 0.

   Blocking all faults to the first page would potentially break any
   program that does that.

   Also if there is something mapped at 0 it's a good chance it is an
   exploit attempt :)



Christophe

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
