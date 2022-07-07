Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E26569FCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 12:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldt0K2DWpz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 20:28:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQV1leEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hQV1leEv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldszb6JHCz2xCB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 20:27:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 495FC6227A
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 10:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B03D8C341C6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657189639;
	bh=hZGjJUj62yOIWpPg7L8tyqKl6Z3NRAVS/hBW/JSlsOk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hQV1leEv58tb3FSzMqL9ZTNzdPzyTWMqSVr9eZqQbd7CYQ4WaIbmdVT8FMpLUaMNp
	 P3kSbqRr+uK8DlIkM8E0BBP+ZiaMonanDKVuOW3V+pBQPUwlBbG0/PPfAHjRD1Q9pF
	 lkLmNxDx3KknSFSEHXDNAVkqi8lN6GrD0P9wR+1ly37MOGYdcPlXna1qxw4mU42Bo9
	 pYZq/9ye9V5QrI3dsNwmQ3S3yWze5JR6Su7tFFPy0qRhHp1v4cBlwHJYHqThw6sFZe
	 UlcabMmJPONdDnCfi/HnFj1sO/RaV9cZBp//bH3Bx5ZiRB5Y4a1PmqN8DyqPLeNgnA
	 ncTD9kvZTofdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89A8FC05FD6; Thu,  7 Jul 2022 10:27:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] [bisected] "Kernel panic - not syncing: corrupted stack
 end detected inside scheduler" at building via distcc on a G5
Date: Thu, 07 Jul 2022 10:27:19 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213837-206035-6lFYFPHym9@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #21 from Erhard F. (erhard_f@mailbox.org) ---
(Luckily) I am no longer able to reproduce this. Re-tested on 5.19-rc5.

I'll keep an eye on it and will close here if it stays like that for the ne=
xt
few stable kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
