Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA885B5D16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 17:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR9V74jSHz3c6d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 01:28:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wt2lm+Qr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wt2lm+Qr;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR9TR0nPkz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 01:27:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEB9C61248
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CAABC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996469;
	bh=BInC1XwZ34qLm1xIMZrF60u0NhgrBL6UudhAPL1dd7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wt2lm+Qr1fxb00UnoTj5oy4ZJxlsAoq6RdLXcS6G8HQ9wYjqEio4VJMvxP0quKKuQ
	 xl+dZqNKlJVyp5TtjUoGfaAJ4n/e2yEpJvrt/gl7RYRH2euTd9O9ZrUGCBCgouwzPK
	 3oX+oKVoLi6kiblw8VTbRyb3pSilxP3kj/FV9ERoaXDpDJkxxGc22U4zRC/UbOoH6Z
	 8s8SsX/w+zR/JZUf7OZhSVZgabLU31ZijlJgGmOD7UB/oSkTYGdwO5BouKCgbX2AEA
	 b/CMC+MPJVabNDoCSflvgmv3fOwKWR2mogkczLntl/JPdzrRftQTd+NHQzn+cGh1HF
	 MNK8o16s2/0Iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E3F9C433E6; Mon, 12 Sep 2022 15:27:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208197] OF: /pci@f2000000/mac-io@17/gpio@50/...: could not find
 phandle
Date: Mon, 12 Sep 2022 15:27:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-208197-206035-Q3lw7KwGPE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208197-206035@https.bugzilla.kernel.org/>
References: <bug-208197-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208197

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #290191|0                           |1
        is obsolete|                            |

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301795
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301795&action=3Dedit
bisect.log

I was able to do my recently tried bisect (bug #208197) without skips and
narrowed the 1st bad commit down to: [c78c31b374a68be79cb4a03ef5b6c187f034e=
903]
Revert "Revert "driver core: Set fw_devlink to "permissive" behavior by
default""

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
