Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8B04119B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 18:21:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCqYw0G2Jz2yPh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:21:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UonqQP4t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UonqQP4t; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCqY90khbz2yLq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 02:20:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0EB8460F70
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632154835;
 bh=VPlmxXIXBXIiNvvBXO+AQ/08tJbcfBj1cBjGvyoD8l0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UonqQP4tPY/dAJHBoQ02VCWqK9p6FdEb7O3yGlDGPZMqL22OSO0znhAxZjWTqUk8e
 vJSMPaxlBJZWjJo5s0F4k1HYp/LaK5qZ8pcBd5nnDIQRzBB4/cTiob+KF4Jf+cqEcQ
 lMYiu1MXDb0CP/FY3kTRJuDjTiOx81m1kne8Zlq/miDntJrBqcIAceJbGfXdrGrfmS
 XoZ0sPvDv6QYir4RKNpAsx0sqPsEMSsxEkV2jJ22p6q8nLDZEauwypC0pXIgzDEIxc
 4Iy5RkUmBQTEHThBAvgWCLS0TDMvQW9IY0YDhYIX8UFREQUPzWHm8+sjI9ce/0jYGh
 zvSYjgvVD8Cgg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0ABA560F42; Mon, 20 Sep 2021 16:20:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: =?UTF-8?B?W0J1ZyAyMTM4MDNdIEc1IGtlcm5lbCBidWlsZCAodjUuMTQtcmMy?=
 =?UTF-8?B?KSBmYWlscyBhdCBsaW5raW5nIHN0YWdlIC0gbGQ6IGFyY2gvcG93ZXJwYy9t?=
 =?UTF-8?B?bS9wZ3RhYmxlLm86IGluIGZ1bmN0aW9uIGAuX19wdGVwX3NldF9hY2Nlc3Nf?=
 =?UTF-8?B?ZmxhZ3MnOiAvdXNyL3NyYy9saW51eC1zdGFibGUvLi9hcmNoL3Bvd2VycGMv?=
 =?UTF-8?B?aW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaDo4MjQ6IHVuZGVmaW5l?=
 =?UTF-8?B?ZCByZWZlcmVuY2UgdG8gYC5yYWRpeF9fcHRlcF9zZXRfYWNjZXNzX2ZsYWdz?=
 =?UTF-8?B?Jw==?=
Date: Mon, 20 Sep 2021 16:20:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213803-206035-vMF9TU8O5D@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
The fix went into v5.15-rc2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
