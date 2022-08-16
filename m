Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F7B59495D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 02:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6BQw48tHz3dsb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 10:11:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bIp4WSqw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bIp4WSqw;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6BPk72NFz3c52
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 10:10:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5204FB80CFB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 00:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15366C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 00:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660608647;
	bh=nO2IIv/OrxuSU4K2Nf+2MzSFt7rWQkelYbIMK6NN6FU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bIp4WSqwuDxMB7ZWi7JxeVCyzXU8rdrjOBzLUUWpIYrfCcJCRITyq9toyZn8Oaz/l
	 Qx6s61wpYCLZAgOX+RAL/1/a41I+ObbQnV5XotBPuVLsIV74v7CedEzluhL41KKDJo
	 2BU6jdIjYHmpa0a8cVVBrCJEpJU+vAeN0Xs+kqpITNVFR4y+dwtGtnkmw1AE9n7SAJ
	 zRdbSpZgN3FUhkvxg52KLr+0ZApVsVRGbCsGxW8t3HY2fs8gcU9D9RpduOnHkwuSiX
	 5HQTOqMuyPguNBk3FNph/j+pqacmsLw3HiMLlbWpu6+wHEtmSZWtax0o/WUX5LX7A7
	 cszgH2uoBLYhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0216CC433E6; Tue, 16 Aug 2022 00:10:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] do_IRQ: stack overflow at boot on a PowerMac G5 11,2
Date: Tue, 16 Aug 2022 00:10:46 +0000
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
Message-ID: <bug-216368-206035-AImgtQtCeT@https.bugzilla.kernel.org/>
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

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301580
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301580&action=3Dedit
kernel .config (kernel 6.0-rc1, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
