Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C22417DB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 00:18:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGRJ60VvCz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 08:18:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S9iynpOn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S9iynpOn; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGRHM6hC3z2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 08:17:51 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id B1345610D1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632521869;
 bh=r5tnA1MT7J6GTjMgKvVizUW3rBq+IIMciI8SHxSAAKU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S9iynpOn/ohuNBROJUF0C2QKxGM22TeNx5YLPT+RMYDzGn6PP/xBS7+uVnWPlZk5n
 TQ/1o0aXZO4OX4QEzjgrXFzRSubuc71G8LmvmNjpxi+puSwoAMr+ehVnOBoRQ+9NnF
 hU1ePASDzFf1FWL8AQge9YdqIvuf2umb+QhjY3P2Hu9yLjDkU30W105QoEsmVLhi/Y
 RwalzTtmKw+gaOzLM33Kmsj5Nk9YgERrpB3JN+df0jFereCpO4DHQjbwqFzXJi+Ctl
 XQ7zzP53HuFav+wskiFJo4Vw1lfNGwRLCQLuOhwOi2HR7HmXmpPFPp0D03MbuYVhHb
 PnNy5bpWrLy+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A9B5660FED; Fri, 24 Sep 2021 22:17:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Fri, 24 Sep 2021 22:17:49 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-EuY3U8kDRR@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298961
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298961&action=3Dedit
System.map (5.15-rc2 + patch + CONFIG_THREAD_SHIFT=3D15, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
