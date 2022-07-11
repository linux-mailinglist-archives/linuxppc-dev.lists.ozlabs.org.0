Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0E57099A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 19:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhWmN4KcXz3c5V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:56:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GX557Cxw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GX557Cxw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhWlb3gZ6z2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 03:56:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FDCC6145D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 17:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D3E2C341CB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657562166;
	bh=kfQaaMC6/WfzB80MfN+2pDXpskDK/swDyRJprA8rvwI=;
	h=From:To:Subject:Date:From;
	b=GX557CxwUb/TVeZZdkqmekFovW1nw4em5PPqZcsdMdetcCS9CXtr33AM5mr4wcHkV
	 dUGcCm3TIOApRrd+7VqFaK8Nhgo4i4aGD7gV9k557CZ++4EKPngH3ECiOii3nNfV44
	 WFwt60EhwCjShP5AnGekJDgPqWRNDItASb9yqqI3dBOohT+AmiGmKEkDTNCaxeA1eZ
	 JJU7WNhTl6/kVyX9/zkiAUW5LAMUC29+H7IbKqnkRFoq8vCSYFRJkKr8tsjyc0jki9
	 O075qJrdlWSAMG3S4+pSzrbobN6JC2GgMv7RK8dOIRucZ1V7nKgytz7I6olAOoLrUC
	 PxM23OzBdqf5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 612C2CC13B0; Mon, 11 Jul 2022 17:56:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216238] New: Kernel 5.10.129 fails to boot on a Talos 2 with
 HASH MMU (PPC_RADIX_MMU not set) with CONFIG_PAGE_POISONING=y
Date: Mon, 11 Jul 2022 17:56:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216238-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216238

            Bug ID: 216238
           Summary: Kernel 5.10.129 fails to boot on a Talos 2 with HASH
                    MMU (PPC_RADIX_MMU not set) with
                    CONFIG_PAGE_POISONING=3Dy
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.10.129
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 301393
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301393&action=3Dedit
kernel dmesg (kernel 5.19-rc4, without PAGE_POISONING, Talos II)

Found that out during investigating bug #216183 closer.

On kernel 5.10.x LTS the Talos 2 boots fine with HASH MMU used. But the same
kernel .config fails to boot when CONFIG_PAGE_POISONING=3Dy is set and used=
. I
get no netconsole output then, only a reboot after a while.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
