Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1275AD03F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 12:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlN00jmwz307C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 20:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IldKW+aq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IldKW+aq;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLlMH1YPjz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 20:37:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1548B81020
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 10:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B7FEC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662374229;
	bh=NMTy3oL7Cs+vSA//+6Py0v2WaPFevI1ghhnBjNGjJqg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IldKW+aqB4m55KtltyqTeWtoWhu1xtvdZfY6lxuMmphXJAgfwPM9/2O5Ug2GD4SGl
	 HE2Qt4GqLFCJcljQSiPdyYzYf34T53NCX17FrLP/bkYf2SU2aUW2cXcpGvX17Mwsgn
	 5tyu+VNiP286FLIcvzrGgqkNLJruCXrpZ4G+GXybWA42ctQgHbAg3/IyNZmkgUeHIW
	 p/0/ES2YuPhUoaSGWB2/pm7iP1rldLvIOED5yx2ahQaBTWdPwKN+bpbpX21NZJ/MA6
	 VqQqRUSIZZp+q7DioReT8K2u3yADW1XmCIQMSRJ5v++Z2my8NQT9LxRWR9JxmOZSSP
	 yya/4jVX12Kew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3950EC433E6; Mon,  5 Sep 2022 10:37:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216427] [bisected] OF fails to handle some PCI resources on a
 PowerMac G4 3,6 (e.g. OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not
 find phandle 1751474532)
Date: Mon, 05 Sep 2022 10:37:08 +0000
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
Message-ID: <bug-216427-206035-25eOMD1ctj@https.bugzilla.kernel.org/>
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

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301744
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301744&action=3Dedit
bisect.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
