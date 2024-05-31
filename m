Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F215B8D61CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 14:32:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gC4Vffhy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrMvx1f5dz30ft
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 22:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gC4Vffhy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrMvF1lXfz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 22:32:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1747FCE1C61
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 12:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 367ACC32786
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717158723;
	bh=9t1oZimh1EOIqouUqz9RgguLj2ka71L1MiA0b+cR0/w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gC4Vffhy0Nz0+igGCNEfr9Ii8gFtgI6oBuQofNrDZSWcNvbNfUeHi3TuxRO2lbgxG
	 haIIdfXzik9LlnqSXlso/9e6CRdp6h4P8876JZn+yP3XQIalPLPh98RgOHQL+W92u/
	 eY0MIJHrjeFvN/3w2/KatnS5eA5/L0Q7N+L9u7qEHblSAtoY0JMV84GWb6a7W+ZQdo
	 QW1z5g5aXhcn+T+S2lNgSixoo1Cwyx+AyRm9VMn/vRI9f3BXQvfEwEXGCor2UitR8O
	 6kBjLmBRPKUqh8Bht/MPTv+5Ec0t+nuE2gzpNnfdvuwxVekCNx+Ptsv/rUQLYacbTL
	 VK2O/IihPS6aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 254F7C53B50; Fri, 31 May 2024 12:32:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Fri, 31 May 2024 12:32:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218858-206035-fI4moTCW5k@https.bugzilla.kernel.org/>
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

--- Comment #13 from Michael Ellerman (michael@ellerman.id.au) ---
root@mirela:~# lspci -tv
...
-[0001:00]-+-00.0  Apple Inc. CPC945 HT Bridge
                ...
           +-05.0-[03]--+-0d.0  Apple Inc. K2 ATA/100

sr0 ->
../../devices/pci0001:00/0001:00:05.0/0001:03:0d.0/ata1/host0/target0:0:0/0=
:0:0:0/block/sr0

So it's only your CDROM drive that is connected to the driver that's causing
the warning. Can you confirm that the CDROM drive works properly with the g=
ood
kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
