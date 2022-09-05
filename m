Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F25AD03B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 12:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlM148q8z3bk4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 20:37:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EWB3odk/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EWB3odk/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLlLF0NXrz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 20:36:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33E6D611CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 10:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94BA2C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662374177;
	bh=2owjtFXm5Ro3QeG9TE8EabH1e9osbzaPr2rkpO7jBhI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EWB3odk/l7gmakKZyPcbp1QwEFez4FXaKNUVBYv/oo8F8d2FlfvwMewTfMlD/eB/q
	 c0meie9eTN/jtlQRKqbfuXn4l7AHQG8U59BC6zBumg3eIts6qXjYMaEt5NfQnJuF9f
	 v+Hqro7RjMZjyRFzru6XKDAAvOBv5L9bH2C3Pq8GUEaX4lWO1tu/yu9VybavBiRCsr
	 MMtT6jfukk6FR2fzkLy1VL0wtz/3BrD4v+zfj4mlGjiyrGsTkNOUltbliuhZgaUftf
	 9ZjLBgCJDSWZ1OaUJErjAQ7yrcLOtYvavo06cbhyjDs5cKtUR/fSgAk+ZfrvJNnT//
	 miXlJ1UMdCEBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4BB00C433E6; Mon,  5 Sep 2022 10:36:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216427] [bisected] OF fails to handle some PCI resources on a
 PowerMac G4 3,6 (e.g. OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not
 find phandle 1751474532)
Date: Mon, 05 Sep 2022 10:36:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-216427-206035-fBcAb8LjdK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216427-206035@https.bugzilla.kernel.org/>
References: <bug-216427-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216427

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|OF fails to handle some PCI |[bisected] OF fails to
                   |resources on a PowerMac G4  |handle some PCI resources
                   |3,6 (e.g. OF:               |on a PowerMac G4 3,6 (e.g.
                   |/pci@f2000000/mac-io@17/gpi |OF:
                   |o@50/gpio5@6f: could not    |/pci@f2000000/mac-io@17/gpi
                   |find phandle 1751474532)    |o@50/gpio5@6f: could not
                   |                            |find phandle 1751474532)

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Did a bisect which revealed this as 1st bad commit:

 # git bisect good
c78c31b374a68be79cb4a03ef5b6c187f034e903 is the first bad commit
commit c78c31b374a68be79cb4a03ef5b6c187f034e903
Author: Saravana Kannan <saravanak@google.com>
Date:   Tue Apr 28 12:20:05 2020 -0700

    Revert "Revert "driver core: Set fw_devlink to "permissive" behavior by
default""

    This reverts commit 18555cb6db2373b9a5ec1f7572773fd58c77f9ba.

    The reason[1] for the original revert has now been fixed by
    commit 00b247557858 ("driver core: Fix handling of
    fw_devlink=3Dpermissive"). So, this patch reverts the revert. Marek has
    also tested this patch with the fix mentioned above and confirmed that
    the issue has been fixed.

    [1] -
https://lore.kernel.org/lkml/CAGETcx8nbz-J1gLvoEKE_HgCcVGyV2o8rZeq_USFKM6=
=3Ds7WmNg@mail.gmail.com/T/#m12dfb5dfd23805b84c49f4bb2238a8cce436c2f7
    [2] -
https://lore.kernel.org/lkml/CAGETcx8nbz-J1gLvoEKE_HgCcVGyV2o8rZeq_USFKM6=
=3Ds7WmNg@mail.gmail.com/T/#m2408a6ce098b2ebf583ca8534329695923ae57fe
    Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
    Signed-off-by: Saravana Kannan <saravanak@google.com>
    Link:
https://lore.kernel.org/r/20200428192006.109006-1-saravanak@google.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
