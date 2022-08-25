Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62DE5A0EAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 13:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD0YD4Cfwz3c6X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 21:07:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvC7tmG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lvC7tmG3;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD0XT6P7yz2xGJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 21:06:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44722B82874
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 11:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E24C1C433B5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661425603;
	bh=dLMsKNZJqdLkrBfA+zBi8nPw+QOP60GZidXX34+VeWM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lvC7tmG3j7wMvqF1SNzYWguewxcrKNFMKvpd/Y2nfDXUacoTFXHmdNOVqiNrgufmm
	 fb2BomfDd1IbrnFI7JkeFT5H4IQm8Uzh1TBi2wJxi0Hz2OW5nNavnm0z+ohwBQ2F5B
	 CKVxz1wDqrLuZ4sPp+bSsZDNpVLMIW8ClSWfHE/fDJcFEr36UT9OGnHK58Kd4zUYdc
	 b+NPrRoVIgi+2F626JzDdevDYB5q179NHeO4xfyuIDuOP3xAcvSxvgbEXxLP6jgH9K
	 VBjABldRSrx86DKQM0yGZm/Z+4Zce632ae65D9GE0lNJjovOOXutAZYfsD42sRy8G1
	 wZRtoJYl/OMvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2A95C433E9; Thu, 25 Aug 2022 11:06:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] do_IRQ: stack overflow at boot during btrfs handling on
 a PowerMac G5 11,2
Date: Thu, 25 Aug 2022 11:06:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216368-206035-BTko10ogyh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216368-206035@https.bugzilla.kernel.org/>
References: <bug-216368-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216368

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Christophe Leroy from comment #3)

> It should be investigated with BTRFS team why the callstack is so deep.

Did anyone forward this to the Btrfs team? if so: where? If not I guess I c=
an
do that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
