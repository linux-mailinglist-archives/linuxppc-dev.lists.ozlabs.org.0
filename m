Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5C3DE217
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 00:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdsZT5Ppbz3bXm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 08:08:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GXMiPWq4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GXMiPWq4; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdsZ31Ntrz2xfP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 08:07:38 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 606B760F48
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 22:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627942056;
 bh=IkrImeaiLqrCc9Iuv2ShFvD/5+ZB6VZ9eWlI0DAabq4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GXMiPWq48InKBlB2TitW+3rNS5iHTQmrp/u7o44kMVEDipYlv5N+83Rv5dC5xuGFA
 8sM6LFD645FnCGb2/ChGVlTClLTQcsz9394uVUN61Q2jxiUcwytDoKgGL7VkMNNI4e
 mIZkKeqC0N9GA3Z/9MiYNhjVRfgbeAW0MIzD2disUUAv4iVbrHRZPG9TNt8zyDZNlv
 vN/R67+VEBDIYR2PHfbXTBnc8l/8mJC6gVmfXL+TMh/VlzxvxrE33k4fJSb+nWYSsR
 eJ+6IksPJN4hds2V9tue+26s3iwweqC+Sq4laCM1tajbIBwzCgCFwUVs7IZImkXUCn
 XJ5NdqBHX7kVA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4F81860E4E; Mon,  2 Aug 2021 22:07:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: =?UTF-8?B?W0J1ZyAyMTM4MDNdIEc1IGtlcm5lbCBidWlsZCAodjUuMTQtcmMy?=
 =?UTF-8?B?KSBmYWlscyBhdCBsaW5raW5nIHN0YWdlIC0gbGQ6IGFyY2gvcG93ZXJwYy9t?=
 =?UTF-8?B?bS9wZ3RhYmxlLm86IGluIGZ1bmN0aW9uIGAuX19wdGVwX3NldF9hY2Nlc3Nf?=
 =?UTF-8?B?ZmxhZ3MnOiAvdXNyL3NyYy9saW51eC1zdGFibGUvLi9hcmNoL3Bvd2VycGMv?=
 =?UTF-8?B?aW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaDo4MjQ6IHVuZGVmaW5l?=
 =?UTF-8?B?ZCByZWZlcmVuY2UgdG8gYC5yYWRpeF9fcHRlcF9zZXRfYWNjZXNzX2ZsYWdz?=
 =?UTF-8?B?Jw==?=
Date: Mon, 02 Aug 2021 22:07:36 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213803-206035-uE9kzJAMn6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213803-206035@https.bugzilla.kernel.org/>
References: <bug-213803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213803

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Still a problem in v5.14-rc4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
