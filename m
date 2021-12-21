Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDF47C701
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 19:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJQZ424xWz3081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 05:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FjboI/N/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FjboI/N/; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJQYL0JBgz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 05:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 621AB6175D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 18:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C863EC36AE8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 18:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640112722;
 bh=Hr/tvZ/uQC64tzCNQWu3aJs6xWJOhOK2UxGUIz7ujT0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FjboI/N/bVAGRBQDDNPIRo9x4S89TKMxe2pqKtVt3Ixgu9GueMw4WTw/yGyR6FV0T
 /W+RQVDVzH12VVPUVqALvU3lWL1DJ/TuDJj4sdQULIdJIQNhZFAN9RemmiDs3YQXrp
 hKvpbc7jTdVk9yGdgFzlXZ6jYMvXa19vMVxVrZRqiJS1gUgT7UAxDqLAV+P7gRP+bW
 Us5p+LWRJB26gDEG+KkcNJCGTYw83m4ErpEf/K4Pe5mTXDLgOgPxSvciJz+et1hBEG
 xA38+BdH2Ek8ItRNkZCc8KQ54WXeiaPvpDbnscdmtG2oLkf7mLS2TuDeHX1svNg8p7
 VjU8+EPKi9E/Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AE447610E5; Tue, 21 Dec 2021 18:52:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215381] BUG: Unable to handle kernel data access on read at
 0x6600cc00000004
Date: Tue, 21 Dec 2021 18:52:02 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215381-206035-QvqZXPKODu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215381-206035@https.bugzilla.kernel.org/>
References: <bug-215381-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215381

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300107
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300107&action=3Dedit
kernel .config (kernel 5.15.10, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
