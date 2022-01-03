Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8263483429
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jan 2022 16:27:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSKPV3cVWz3bd0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 02:27:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VtnosKs8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VtnosKs8; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSKNh4Xftz2xDV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jan 2022 02:27:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDD8161151
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jan 2022 15:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50275C36AED
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jan 2022 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641223616;
 bh=ZNEQurURXQaA0+gLkfr22Kq1Op5pJ5v5XoK2Z6xgrkI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VtnosKs8IpwQV7rMj/Y/W6ZMKZ55FLylsTV6xA32zIOP6WQlYhniPT6OYgBQLMcvb
 u03VJZunS9dDRIQ+sv9iPpquk59n7HoXTpiW6RexiuDbPievVJzFuv4GMsNmx7X0/9
 x8HwMBqkgCpsYZgmbNlE7svoG4IW4RxPo9RZjKzQ+YLByw9X0dqy82aJyMtVbBMGO3
 vl3WafzG9fM9onQkFMEPJjomPZjtE2GnkTRi30LRHPPWP/uXgdei+La1U4EE5vEhXq
 BSr4zwxy/SSkEN7w1PJPhzqQJmrlkx5/gfsQ1fgcD+s6sG0fjuahUcf/O8bN3YIMjB
 FbJqTqfd2tZvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36F41C05FDC; Mon,  3 Jan 2022 15:26:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Mon, 03 Jan 2022 15:26:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215443-206035-7PA7vE3gdj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215443-206035@https.bugzilla.kernel.org/>
References: <bug-215443-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215443

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Alex Deucher from comment #2)
> does appending amdgpu.runpm=3D0 on the kernel command line help?
I doubt it as amdgpu is not even built (# CONFIG_DRM_AMDGPU is not set, see
attached .config).

The card in question is a Radeon HD 6670 using the radeon drm module. Sorry=
 I
forgot to mention that!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
