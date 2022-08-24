Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7185A00F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 20:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCYnx0WQtz3c9p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 04:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noUq2611;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=noUq2611;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCYnD6dT3z305P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 04:01:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C130661745
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 284F9C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661364078;
	bh=r3B3fIHJRjmfKlOIOrZ57cdNB/G5CtKexPjOg628wrc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=noUq2611PI2NL+2CIahdo78lL0Fe9hbFKW0pq1/4dmvBzcDPwzRr2z7lWxu8onUKX
	 NWrJyaVZx6NJXraDCk4pfqvqEs6CmubUnwl258xUaANeEIq1WzKe3E9WxYxbQusz0R
	 HmplXwBkXS19JDXhCl3RzwNSAwoE4n6vMuRXCBAbFpSXfDjebGo1KXhlkV4FhzHSGm
	 0eej6oDF/4+ADLrdD36ScabxFe7OQcEv7gwe3zSNNUei5uciNd4Nwkc0yNUUO3b4Kz
	 4NXrj88vPjnOGXVtbwtwZjKFs+tnacaqnxWGm0gnMBxU5x7xIEyc7evb7wNwOb5lfd
	 TYesVvyKDx+Pg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13874C433E4; Wed, 24 Aug 2022 18:01:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216407] OF: unittest fails some tests on ppc and ppc64 (###
 dt-test ### end of unittest - 266 passed, 6 failed)
Date: Wed, 24 Aug 2022 18:01:17 +0000
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
Message-ID: <bug-216407-206035-SQbMLrtlrw@https.bugzilla.kernel.org/>
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

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301648
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301648&action=3Dedit
kernel .config (kernel 6.0-rc2, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
