Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714DE6498C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 06:58:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVrXS2lvHz3bgF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 16:58:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ6MxxVg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQ6MxxVg;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVrWX2YVcz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 16:57:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 50D5CCE0D07
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 05:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 950F2C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670824658;
	bh=30g2peFCHWqm55DFq5khJFnGn+8Us2F5UyKKM7j02Vs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QQ6MxxVgKjHWMPNEn3XaJRm7Kav+2bkEvkZl+yw6l7+SPtm0GLN9emMYHp1imjCP1
	 KFugFrABoCkkt1nvoR7fKN/5YlTQNt2zfx084t6LrhjcCQIjOk4QH1ULK5vufEIfMQ
	 90PXHNYjo/ONB9p3RzX191d98jDWLMTUSg6rY5sZlrOOAV4KnSMryfPkewsy9AP8Gl
	 Fc9RL5/Zuqnj3fucNKkY2w2bort55CzbbpQtZAq2c1uV8V8R5xitN5JRybLo0KMP0Z
	 tdo8ZETk6ZRV4pEh7PVyxGqDaa2rtKjCfF8V28YSaqzL0nnTueALl8lwG/u2t0hF9W
	 lFDdT/QNzU6Ng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 793A9C43141; Mon, 12 Dec 2022 05:57:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Mon, 12 Dec 2022 05:57:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-9pRSjAqPTs@https.bugzilla.kernel.org/>
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

--- Comment #9 from Michael Ellerman (michael@ellerman.id.au) ---
I assume it's an io_uring IO worker.

They're created via create_io_worker() -> create_io_thread().

They pass a non-NULL `args->fn` to copy_process() -> copy_thread(), so we e=
nd
up in the "kernel thread" branch of the if, which sets p->thread.regs =3D N=
ULL.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
