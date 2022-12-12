Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5D649977
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 08:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVtNR1yL4z3cKj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 18:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9VHRhMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9VHRhMO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVtLR6sbVz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 18:19:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6066A60EA9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 07:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3066C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670829596;
	bh=V4HBr8xY+aZbPWguxi0Kt06cxttQ5cfgpdDm19JSz0g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=I9VHRhMO0Kz8wuyOMN/CbiLZW0s7/IT6O8RTBZWC7MmsX6dL+B1l4HN2sdnE36wkq
	 Tg4USqGQ1xXVpHNI50IJY5vfIV5zpcC7ssnyHYG7JStyBfyKsWc0Q5BkUMeQMRvCel
	 RgLzbDiClqrr022IiaQTBfrQGu+waWDhPfYyewFquC5qtnlYRkEQ3i7PtxAkbhQRF6
	 Lyotgp9L9dW/PdqTvY4pQtMoIhwYvZjf+acRr7LAs/pvZvjiDwNSOXrY3RKI6L/bjB
	 5Qe3TXaZ6z0/pv0nlFHqqrj/dlQnxVGlRqlIUiWccFKpRXCJvAXiR4IctsFXu3Ua5/
	 /c6F64ZAMaU0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A7670C43143; Mon, 12 Dec 2022 07:19:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Mon, 12 Dec 2022 07:19:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: npiggin@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-QBfF9VcPdT@https.bugzilla.kernel.org/>
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

--- Comment #10 from npiggin@gmail.com ---
On Mon Dec 12, 2022 at 3:57 PM AEST,  wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214913
>
> --- Comment #9 from Michael Ellerman (michael@ellerman.id.au) ---
> I assume it's an io_uring IO worker.
>
> They're created via create_io_worker() -> create_io_thread().
>
> They pass a non-NULL `args->fn` to copy_process() -> copy_thread(), so we=
 end
> up in the "kernel thread" branch of the if, which sets p->thread.regs =3D=
 NULL.

Hmm, you might be right. These things are created with the memory and
thread  / signal context shared with the userspace process.

Still doesn't seem like they should be involved in core dumping though,
pt_regs would have no meaning even if we did set something there. How
best to catch these and filter them out of the core dump? Check for
PF_IO_WORKER in the coredump gathering?

Thanks,
Nick

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
