Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5334F221A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 06:38:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXZds4HBsz3bp0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 14:38:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BQO6lJyz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BQO6lJyz; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXZd365Xqz3bbT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 14:37:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 313C56145A
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 04:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96298C340F0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Apr 2022 04:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649133460;
 bh=eIU7e6IHH5m91KnYiK3NIVmA+abBouC8/zDWozGQ0J0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BQO6lJyzsQtcAFGptLYr6Z1xDJVTAq5J1q+L/1ttP12tMuHF0v5smXXSsDvvme7Vr
 oEfMz61pL9555h91W/rH+eUFLJpxUhv3ymu3PAy8nReK5AFPEUcKYwZK5vWdYyneIf
 K5TP5iTo2t2FsO38BKFSR61Tmo7YN8rpZXyaCv7Ma9jT/W3B7KLxH27ew+Fx8TN3qr
 HyVInMNs9ebDkm8wISlqq9ogOL09+W7SEugl9I712IMFJsJ1dCV9mpbvHWbk6npXm6
 yr56VoFv6Ibs6pp3nsU50RqM4lTzXkDOrWr8CX+OQAhNfjomnSfNIIJhQsnUayCgpW
 WEm6a1HEs9b1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 82AF3C05FD2; Tue,  5 Apr 2022 04:37:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215803] ppc64le(P9):  BUG: Kernel NULL pointer dereference on
 read at 0x00000060  NIP: do_remove_conflicting_framebuffers+0x184/0x1d0
Date: Tue, 05 Apr 2022 04:37:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215803-206035-JphAY5Y1xZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215803-206035@https.bugzilla.kernel.org/>
References: <bug-215803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215803

--- Comment #1 from Zorro Lang (zlang@redhat.com) ---
Created attachment 300697
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300697&action=3Dedit
kernel .config file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
