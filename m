Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677DF6E6598
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 15:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q148k2YMmz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 23:12:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MnK8nL2a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MnK8nL2a;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q147s5hFFz3cS4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 23:11:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD6546286C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 13:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 300FFC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681823510;
	bh=SNTrR7HxRYpp2xaH8LREU9KKdrSnGkM8A+wDgWYlmBg=;
	h=From:To:Subject:Date:From;
	b=MnK8nL2alNTov2DPqpkH4uES3H08nShbTY2q6T0c13U3y62utCeApbWhOuadtJa88
	 LfqIQrO3a78QRP9hikvCnDwLaD1QZP9oG1YHvR5DPTPMeY0niC42IZvJ2KwyO8qIxM
	 oE1bM8QoVeCocYWefpeg51LpJvpJPq1G1Hro/GcrzGkAkMm8oCfPIUjRO1kU81jw/C
	 +JtntoPtqV56vzgO/cRtNqGCiEEGMZWkraL8X8RELkn/8K5tHiCSKs1Jt7oyPbS5wv
	 tgOqAAtbExxiAOw92P1N7qoNt0Xij3iRq7aug5NkpJcxntAD60m9am9iKEdU8LLU+1
	 MLfDFQKWlL/Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 128B2C43142; Tue, 18 Apr 2023 13:11:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217350] New: kdump kernel hangs in powerkvm guest
Date: Tue, 18 Apr 2023 13:11:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: piliu@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217350-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217350

            Bug ID: 217350
           Summary: kdump kernel hangs in powerkvm guest
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: PPC-64
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: piliu@redhat.com
        Regression: No

Created attachment 304157
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304157&action=3Dedit
The xml to configure the virtual machine

This bug has been observed at least since kernel version 5.19.

The kdump kernel command line:
[    0.000000] Kernel command line: elfcorehdr=3D0x22c00000  no_timer_check
net.ifnames=3D0 console=3Dtty0 console=3Dhvc0,115200n8  irqpoll maxcpus=3D1
noirqdistrib reset_devices cgroup_disable=3Dmemory
     numa=3Doff udev.children-max=3D2 ehea.use_mcs=3D0 panic=3D10 kvm_cma_r=
esv_ratio=3D0
transparent_hugepage=3Dnever novmcoredd hugetlb_cma=3D0=20


Finally, the system hangs:
    [    7.763260] virtio_blk virtio2: 32/0/0 default/read/poll queues
    [    7.771391] virtio_blk virtio2: [vda] 20971520 512-byte logical bloc=
ks
(10.7 GB/10.0 GiB)
    [   68.398234] systemd-udevd[187]: virtio2: Worker [190] processing
SEQNUM=3D1193 is taking a long time
    [  188.398258] systemd-udevd[187]: virtio2: Worker [190] processing
SEQNUM=3D1193 killed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
