Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B147D62D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 19:01:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK1Mz1vqPz3c71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 05:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bulcy5QF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bulcy5QF; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK1MG46VCz2xnb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 05:00:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1BD73B81DA8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E03F8C36AE5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640196019;
 bh=4W/aQ3TUXya67G4uM5S4i+bh7/zTeP3oySf3ZUiq8+4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bulcy5QFNVv4FCT9GEfs120jJbn1vvr3PrUwI3jYO9B6z2fV77nzLyK1be84Nh3A4
 7B3kYG4vJLqgsAbGu5p643k6Yq9iOq8rlzPvyuZJYIMSBnIPHtM41kv6HBc29p/aII
 k9hk1++M9luiBzC9y5tGScxdDgi5OnRSNykQ5v/+CIFzrUXm9/6eZ3QbDaPgQvItbf
 WHo38oGPstRItIcloGMNERv4M+raDM8sOjLS6jYQYoo3pGAcfs9j6dZyv4P3aCyFJW
 n01FYxSme5ZsENpCncfnI7+jldm9YkVSTurAhqb8H+bGgfDOnZsj37OA2ON+QoRXsY
 bjuoeoHVWnyyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BFC7B61177; Wed, 22 Dec 2021 18:00:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Wed, 22 Dec 2021 18:00:19 +0000
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
Message-ID: <bug-215389-206035-6RgMRI3b9D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300115
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300115&action=3Dedit
kernel .config (5.15.10, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
