Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B61A5A5701
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:20:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGlJJ1SLZz3gYF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fdtNz6x7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fdtNz6x7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGlHX5p8Kz3fxq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 08:20:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B1BCB8119A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC5FEC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661811603;
	bh=CWai/hbryelRST8v2wq2cxFVuU5p1PJMO8nVgth1CV8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fdtNz6x7l4jdmtjBH4qFkCcTxxLxxYjlCj842Wc83tnY2c9LWwu1kxLiDpbd77AHC
	 QVRnCMFXxUfH19EylLKwFymOzMc+Kh7d4CpEz4RElIH2PrYWXQGmzV36Ue9eIYdw0z
	 M3c7kmFS3JeMFFC3mXhRFC+E/GcBNkKpK9X2LGRpeBWvsvanP4swljPRpPul/6oZG6
	 z2McO7SZCVJFHwvZMTr/gBtILR7wZ6LtM0jTLPM6E87fS2wPDXHj6GiD8SkxVpXuSq
	 FGyJQawh0k/f26qFooUEdEqmJ801+/z5Ar3hMh63mZDaT0/u48U7GXnS+2S7EKpsdm
	 LLh8w/v/aUgeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B919FC433E4; Mon, 29 Aug 2022 22:20:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216427] OF fails to handle some PCI resources on a PowerMac G4
 3,6 (e.g. OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find
 phandle 1751474532)
Date: Mon, 29 Aug 2022 22:20:03 +0000
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
Message-ID: <bug-216427-206035-LClmjrQMLj@https.bugzilla.kernel.org/>
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

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301699
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301699&action=3Dedit
kernel .config (kernel 6.0-rc3, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
