Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C425A00EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 20:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCYmz5dcBz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 04:01:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XqSFS8uP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XqSFS8uP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCYmK49H3z304n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 04:00:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E087F615AE
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CAFCC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661364029;
	bh=PuQzrju/K8itdtevL18WALFZyqa2qRTN+aD3Ho5xDbo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XqSFS8uP0qsXMqUUYjv37yuYWadbZ2gFddD7iB8pIeCjeg9Br8JrDuUmPuoWZ9/1n
	 HIJgZfNZOE4DB5kXQnrSfi7AyTiAANX9VAxWZ/IQxM20rC4SHQ987E58b7C74MobCv
	 8XNJzFiXi+jCzXngsQeb8cCbHhi506TPFOo60dHFLE+5CCD+1R2EvL3sipqCCT8ch8
	 q9fQCxDI61CTOs2Lq6IW4TI8X/zkCVWOOFaAGiKm/936pxBk81pse4kLnkeNmI+pCC
	 HSKf/LbGRuLMsjQHIu7238C8XApfjsgUZMZFrKA8FmTJiu5SKdyiiVFM0ykN/mOy7e
	 dKbwvze661wcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2C225C433E4; Wed, 24 Aug 2022 18:00:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216407] OF: unittest fails some tests on ppc and ppc64 (###
 dt-test ### end of unittest - 266 passed, 6 failed)
Date: Wed, 24 Aug 2022 18:00:28 +0000
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
Message-ID: <bug-216407-206035-gj0ADEri04@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216407-206035@https.bugzilla.kernel.org/>
References: <bug-216407-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216407

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301647
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301647&action=3Dedit
kernel .config (kernel 6.0-rc2, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
