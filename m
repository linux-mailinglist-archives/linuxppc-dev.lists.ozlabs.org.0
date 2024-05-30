Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8D8D4E41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 16:45:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nWuutmm+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqpvM17TYz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nWuutmm+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vqptf393Dz3cbN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 00:44:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04AB96173D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 14:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC438C32781
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717080279;
	bh=UPFtw4gJMX0gDEHL0KlhmR5bzcMMmPPsHqXs2qHGyZE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nWuutmm+0xdvRijmbkilus9OxyFGboJweU0+4zf4yaTV83nZFRxYpTwDISryjjaCH
	 r4ZHvTPktNDhW2x3VWKYV5RtN6vm3hcsgnAPBLKHuMrU67sePoz483u7yUOgBoPWbh
	 wLSU2GEjyUEOX9jNwE2BsxxE4kEnUF1VpjY+dNMwL2xqEeP97MRd2PgsIzLXibHAHl
	 6xiE3Jewbps4ba9rarjGFO9zKjDJ+Sh3iRMHtxFe1GTQq6/ezEJMMEbc3k6vW4uGBO
	 bQ0U6tdudTPLSCQRbRDNzoLzWxz4ED+VuxQiaduJiAF/a9/nFf9y/ZomyyBhHHE9i3
	 rwv03WVtymbug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9F6DCC53B7E; Thu, 30 May 2024 14:44:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Thu, 30 May 2024 14:44:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: doru.iorgulescu1@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218858-206035-itBNueryph@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218858-206035@https.bugzilla.kernel.org/>
References: <bug-218858-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218858

--- Comment #8 from doru iorgulescu (doru.iorgulescu1@gmail.com) ---
I run linux kernel 6.9.3
root@mirela:~# ls -l /sys/class/block
total 0
lrwxrwxrwx 1 root root 0 May 30 10:55 loop0 ->
../../devices/virtual/block/loop0
lrwxrwxrwx 1 root root 0 May 30 10:55 loop1 ->
../../devices/virtual/block/loop1
lrwxrwxrwx 1 root root 0 May 30 10:55 loop2 ->
../../devices/virtual/block/loop2
lrwxrwxrwx 1 root root 0 May 30 10:55 loop3 ->
../../devices/virtual/block/loop3
lrwxrwxrwx 1 root root 0 May 30 10:55 loop4 ->
../../devices/virtual/block/loop4
lrwxrwxrwx 1 root root 0 May 30 10:55 loop5 ->
../../devices/virtual/block/loop5
lrwxrwxrwx 1 root root 0 May 30 10:55 loop6 ->
../../devices/virtual/block/loop6
lrwxrwxrwx 1 root root 0 May 30 10:55 loop7 ->
../../devices/virtual/block/loop7
lrwxrwxrwx 1 root root 0 May 30 10:55 sda ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda
lrwxrwxrwx 1 root root 0 May 30 10:55 sda1 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda1
lrwxrwxrwx 1 root root 0 May 30 10:55 sda10 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda10
lrwxrwxrwx 1 root root 0 May 30 10:55 sda2 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda2
lrwxrwxrwx 1 root root 0 May 30 10:55 sda3 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda3
lrwxrwxrwx 1 root root 0 May 30 10:55 sda4 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda4
lrwxrwxrwx 1 root root 0 May 30 10:55 sda5 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda5
lrwxrwxrwx 1 root root 0 May 30 10:55 sda6 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda6
lrwxrwxrwx 1 root root 0 May 30 10:55 sda7 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda7
lrwxrwxrwx 1 root root 0 May 30 10:55 sda8 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda8
lrwxrwxrwx 1 root root 0 May 30 10:55 sda9 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/target1:0:0/1=
:0:0:0/block/sda/sda9
lrwxrwxrwx 1 root root 0 May 30 10:55 sdb ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata3/host2/target2:0:0/2=
:0:0:0/block/sdb
lrwxrwxrwx 1 root root 0 May 30 10:55 sdb1 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata3/host2/target2:0:0/2=
:0:0:0/block/sdb/sdb1
lrwxrwxrwx 1 root root 0 May 30 10:55 sdb2 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata3/host2/target2:0:0/2=
:0:0:0/block/sdb/sdb2
lrwxrwxrwx 1 root root 0 May 30 10:55 sdb3 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata3/host2/target2:0:0/2=
:0:0:0/block/sdb/sdb3
lrwxrwxrwx 1 root root 0 May 30 10:55 sdb4 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata3/host2/target2:0:0/2=
:0:0:0/block/sdb/sdb4
lrwxrwxrwx 1 root root 0 May 30 10:55 sr0 ->
../../devices/pci0001:00/0001:00:05.0/0001:03:0d.0/ata1/host0/target0:0:0/0=
:0:0:0/block/sr0
root@mirela:~#=20
root@mirela:~# ls -l /sys/class/scsi_host
total 0
lrwxrwxrwx 1 root root 0 May 30 10:55 host0 ->
../../devices/pci0001:00/0001:00:05.0/0001:03:0d.0/ata1/host0/scsi_host/hos=
t0
lrwxrwxrwx 1 root root 0 May 30 10:55 host1 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata2/host1/scsi_host/hos=
t1
lrwxrwxrwx 1 root root 0 May 30 10:55 host2 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata3/host2/scsi_host/hos=
t2
lrwxrwxrwx 1 root root 0 May 30 10:55 host3 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata4/host3/scsi_host/hos=
t3
lrwxrwxrwx 1 root root 0 May 30 10:55 host4 ->
../../devices/pci0001:00/0001:00:07.0/0001:05:0c.0/ata5/host4/scsi_host/hos=
t4
root@mirela:~#=20
root@mirela:~# lspci -tv
-[0000:f0]-+-0b.0  Apple Inc. U3 AGP
           \-10.0  NVIDIA Corporation NV34 [GeForce FX 5200 Ultra]
-[0001:00]-+-00.0  Apple Inc. CPC945 HT Bridge
           +-01.0-[06]--
           +-02.0-[07]--
           +-03.0-[01]--+-07.0  Apple Inc. K2 KeyLargo Mac/IO
           |            +-08.0  Apple Inc. K2 KeyLargo USB
           |            \-09.0  Apple Inc. K2 KeyLargo USB
           +-04.0-[02]--+-0b.0  NEC Corporation OHCI USB Controller
           |            +-0b.1  NEC Corporation OHCI USB Controller
           |            \-0b.2  NEC Corporation uPD72010x USB 2.0 Controller
           +-05.0-[03]--+-0d.0  Apple Inc. K2 ATA/100
           |            \-0e.0  Apple Inc. K2 FireWire
           +-06.0-[04]----0f.0  Apple Inc. K2 GMAC (Sun GEM)
           \-07.0-[05]----0c.0  Broadcom K2 SATA
root@mirela:~#=20

Thank You
Regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
