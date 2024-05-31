Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156478D6312
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 15:34:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZJe2E3V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrPHd2NfDz3cYf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:34:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eZJe2E3V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrPGt0Mhkz30WL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:34:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B2A562C5E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 13:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EC2FC32781
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717162451;
	bh=pE1Z7Nn17cjs6GOXnWUpYEPc1fK/k9O3BQ52SHBSNrE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eZJe2E3VUzkXmIxiPYeS4Tp4AiqTum41n/nkRXfXdzI2wnyczHsodC5q1u1CV2M91
	 PiBiGc+5rkyBhmj1kldlLeyeeexzbyZ/sppxXc5/icqXqbldKLU/SwdkRt0MEjUk0b
	 T/ONb67/fkhKNSyTjyFbCrcIy4uC2xGv4C8jjMoS2ZVb98Q1nIk0mcAEynynXqv1uA
	 nuoooefHgJXhGTa+GNWh5tTJ/e5AfHfZ5DHGRTpjZgpHVPGB1gkacEP8eASG05mF1i
	 02z7thSPmdTmatsS6H9/apJFXNwBzoiegg0fuGaKD+QedPzVLG+JLUNF9XdGyBpFXe
	 OAPNqiwq2zTew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DAA2C53B7E; Fri, 31 May 2024 13:34:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Fri, 31 May 2024 13:34:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218858-206035-pcHuoSmV5w@https.bugzilla.kernel.org/>
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

--- Comment #15 from doru iorgulescu (doru.iorgulescu1@gmail.com) ---
Created attachment 306389
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306389&action=3Dedit
hdparam-I.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
