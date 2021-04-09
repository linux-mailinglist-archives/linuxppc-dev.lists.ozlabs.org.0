Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284E35A23B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 17:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH2Zw1DY8z3c10
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 01:47:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HRdbX3ru;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HRdbX3ru; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH2ZT2LxWz3011
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 01:47:29 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B6B8610F7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617983246;
 bh=wbvJio/eZx6+QV7hi3gFB2VtiHKLqGIOwNyfkKu0Wms=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HRdbX3ruPp1ZjTx7pw4WwF6r5L7LvmID/2TxNxtQ8HTURc+fKuIPwxDyeSeJyYY0I
 H3ejcWB7nFl692fNBvJlkWTcVgiE0GyhBGbBvOJ/EOqUh8+wBv/rMVfE0Sh/5DfZPr
 mQ3XE0DK2oNbRXJQngZfIQPblaQzyS8lawfsW8IZv2ihpfPRa7SfLg7FXenQkrnkv7
 6wLqJHsMTHHV0FeOasdsYan9AOfnzGdOXnao3Z5e3dxcr74zB/ouxIHmxAfhIW6GXR
 e2mQYVF6WWy+AlMkYOI35UCjoehiyuMsLwNC+1oAnEshUnsoDMs0yUHIB8zE09V0Ho
 tqAlCAtRF465Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 872286113A; Fri,  9 Apr 2021 15:47:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 212631] Misaligned floating point loads and store occasionally
 fail
Date: Fri, 09 Apr 2021 15:47:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trevor_davenport@selinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212631-206035-4AmcpnzQzI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212631-206035@https.bugzilla.kernel.org/>
References: <bug-212631-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212631

--- Comment #1 from Trevor Davenport (trevor_davenport@selinc.com) ---
I can also reproduce this with kernel version 5.11.12.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
