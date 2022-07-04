Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE41565E94
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 22:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcHgJ0L5bz3brj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 06:37:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NMU/eX/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NMU/eX/3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcHfX5f1Pz3bXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 06:37:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73CA0616F8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 20:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7977C341CE
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656967024;
	bh=5U+PrR1MDWVfWAhgbieOgVSr8KORdHwT34UMh4ky7MQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NMU/eX/3nShdd1CjrC6NnpwRflg1rahnB+Jny6GFZVd+6pJ4Wg21NDNN0IKZ+rRQW
	 m4cZdej2gAZ/umAWBkO7R5QtANfvtH6YR2ObI3Nu9LUHCWzb2f3moZ7JmSWiPL23F3
	 8ij+nqqZPnDRGhslEuPs9hIdv7hcGmjb3M1ca952nnTPWY98UoORUPASEY3WNcMhzw
	 D76MA+AUKQB5GOTQ/r9FI94AbmVo20oSPCUm42wAvl3ANbPZS+1QIA2m48TeI8Wx6u
	 jl3f+1lHWzXJHqltjQhJWBRl/t2egqtZjD3mxBKf2Ep7rIGwYfXv+ZuF0bwJ51OQcH
	 BhTl5Q53+SFMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B6E02C05FD2; Mon,  4 Jul 2022 20:37:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213733] Kernel NULL pointer dereference on read (Oops: Kernel
 access of bad area, sig: 7 [#1]) at systemctl poweroff
Date: Mon, 04 Jul 2022 20:37:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213733-206035-nQEH4Rk3ot@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213733-206035@https.bugzilla.kernel.org/>
References: <bug-213733-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213733

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Have not seen this since quite some stable releases, nor on 5.19-rcs.

Closing for now as obsolete.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
