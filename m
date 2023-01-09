Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3866224E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 11:02:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nr8cQ309kz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:01:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HANDvxVU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HANDvxVU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr8bP2XGFz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 21:01:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30060B80D5B
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 10:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1E34C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673258459;
	bh=BA+hOmAXK0bu8FIi9qI7gTqpHOLoySsvvXsdHKRskNo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HANDvxVUwu/keaiX5S4Y6itwy4qbM2xrU5GmJcuiI/vk+LTNMqIDsvoZkWT6ayg4M
	 PJR27xmdFnkncyxFdIoA8GfvdGNVIi5IxJe/fmyQjZ8hNPJTqITV2+y/jkZW8kdLdX
	 AdyoEicE6JeNe0UZ+Segp1alG31EUxzNmVDOlyAJXhG9NwB5x0nSEwaBWNwdU6oDnk
	 JfuHLY4nqizz059hQgy9vrHvmStjCs7v/74D3udzbtyZNpQRHrh3q60JR/NhmILkuc
	 zbhbxbatDLfqcGK8/qSZcHc6YHKk1Q7MFisD+sIQRG9SWl6cJL7wzw1fQDyBjXcUQJ
	 H5XkcLXz9Iosg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA3FEC43143; Mon,  9 Jan 2023 10:00:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Mon, 09 Jan 2023 10:00:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: msuchanek@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216095-206035-lJKmrs8LLb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

--- Comment #12 from Michal Such=C3=A1nek (msuchanek@suse.de) ---
Thanks for the DT dumps.

So you really do have two outputs but the problem is likely different:

The hardware-specific driver gets initialized earlier, and then the offb/of=
drm
driver cannot get the resources for the framebuffer because the native driv=
er
is already using them.

That should be fine but the message it prints is not exactly clear.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
