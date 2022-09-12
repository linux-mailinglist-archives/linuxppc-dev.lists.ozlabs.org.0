Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005D5B5D09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 17:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR9MR2pbrz3c3T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 01:22:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NlW9K3QG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NlW9K3QG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR9Ln6FySz2yng
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 01:22:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71B6D61245
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC38FC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996126;
	bh=zysYFw5eXpL1ywRv9spHXrgf8GR8Uvr59SJ6YsUirzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NlW9K3QGmvWuWNiNSbW3UnY83+LntWV+EQijPsSoGajRrihoQ8Vm09e7myejGniey
	 q/pCVv/2ZWa+NK+WKyPVseq0I4AEuHjGnmcUDAMHmwUFzs3rpVsmut0MJfLgyXnDB5
	 +gUuBrNEiezuo6cvwTl8z80I2o2GXeIyV6R3tvKzYCuKjd3exZ0SiZYi0RAIOZhZ+o
	 qE4GqBo1SrXwWrY0lho5ZD2aM3jAlrlaMRAGG9PsExuecY7+DEqecMZvNxafNJqHl3
	 BLeq2i45neuFdsVdkJiBVSKQW5QKoWEWKu9SKbvoJuCQYJZMHCq9xImE56Pu72LvZT
	 tUMybTm81yMSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9BEDC433E4; Mon, 12 Sep 2022 15:22:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216427] [bisected] OF fails to handle some PCI resources on a
 PowerMac G4 3,6 (e.g. OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not
 find phandle 1751474532)
Date: Mon, 12 Sep 2022 15:22:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216427-206035-MGHIHzDt2O@https.bugzilla.kernel.org/>
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
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Looks like I already reported that one 2 yrs ago...

*** This bug has been marked as a duplicate of bug 208197 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
