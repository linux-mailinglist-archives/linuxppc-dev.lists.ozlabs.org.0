Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C84ED3D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 08:22:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTYB46Hmfz2yxx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 17:22:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u6A5NV4F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u6A5NV4F; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTY9K2DjPz2xrs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 17:21:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C363BB81EF5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 06:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91DDDC340F0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 06:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648707695;
 bh=mce+9fHcLeDGne1Ai9pjfJU8rLJyUTjY7QxLMWF0AXI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u6A5NV4FG+YfOzahennPWl1mDm0BzyGOxBf+rExWNaJZ6OikWDjshIviD+YcjmyDg
 aAMMsLMkp8WcIV96JADYCKdiDQblz769b49x31j3rdAHBTAeoVjsNiDMh+Z6Uje2fG
 IPq5w9Bl21rw8mJe27WTjVRrRZ3NDtewti+BR7Gq9MP5QXnIOWeuSV8v0kT0wafK7w
 AKZ71DLNrM/EdY23ao7lvgR2ZIOgEqXhmltc6D5L+9rvLA4V4UIEBFnSStLZD9wr6h
 CB6dROXVULqc0Y/1qwsVgUNIjURU6ykzDNFYUCFKr8hv9MdeOw6Ws1mtRvX8RMsmb+
 v+v65/phBxmMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7C2E7C05FD2; Thu, 31 Mar 2022 06:21:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215781] Highmem support broken on kernels greater 5.15.x on
 ppc32?
Date: Thu, 31 Mar 2022 06:21:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215781-206035-HXyJlD9XCE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215781-206035@https.bugzilla.kernel.org/>
References: <bug-215781-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215781

--- Comment #4 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
This problem was introduced in 5.15 by commit 602946ec2f90 ("powerpc: Set
max_mapnr correctly")

A similar issue has been opened at
https://github.com/linuxppc/issues/issues/399

Following series should fix it:
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?state=3D*&series=3D=
286464

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
