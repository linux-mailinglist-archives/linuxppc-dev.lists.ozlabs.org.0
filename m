Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EA84ECFD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 00:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTMH42SCHz30FH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 09:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kXuDa67d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kXuDa67d; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTMGM2z6yz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 09:55:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34F0DB81D46
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2E6DC340F3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648680917;
 bh=/9DUXDve/1vY/geH3cRgtbd0W7lebtdL7dqQweNfTcs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kXuDa67dgl/tQnQdH9BK6h9hhwfWoCU92USFVi01UnL9ZVcxB0OkvN/iqM+nz00G0
 k1feRy1WJmE6ue3/ijoUtz49GQu2mHlzA05+K9Jmg0uiiJLsMl+FKZMdreXG3SrPCO
 MreWxo8HfmLm0rbDlLJCH9Kr7DWCRCA7ADQkwXgNIwdgo5sEMP0rV2CvCqcKkZGfC/
 WnZOZCAPPA8xSJE754DMalbz6+w0zPFdCEOpxQGejeVFN9KSWUmPTFCnOSPe6QF01O
 hgcQnPZllVn363wpUc5jz26mf3pwwRVHDGhnzcxeRfjwH57C/n3HkA6XzioDuj4WWk
 7CDV7496EMWtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BF29FC05FD0; Wed, 30 Mar 2022 22:55:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215781] Highmem support broken on kernels greater 5.15.x on
 ppc32?
Date: Wed, 30 Mar 2022 22:55:17 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215781-206035-jvSNyIOLJk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215781-206035@https.bugzilla.kernel.org/>
References: <bug-215781-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215781

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300666
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300666&action=3Dedit
kernel .config (5.16.18, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
