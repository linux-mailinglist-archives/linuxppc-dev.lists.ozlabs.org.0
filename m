Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E546FE37F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 19:54:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGjMy5Y9dz3fLF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 03:54:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ulH/82Bl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ulH/82Bl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGjM31M2gz3cf6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 03:53:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 477E96093C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 17:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABA06C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683741227;
	bh=RPlqqJdFGsjatsEiQ+qkII/XdBzg7co1a5g0SXBFTSc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ulH/82Bl0hCRktzyzB6F7rqoYd0/qceIyP/fRJRyz4R/gJTz04HHiCGiGjzmCRx6O
	 Webfmf/9+rvjrfUBz2n1RMqVO9aihY4Z9EVm+gUf8v9b0AfjsLRIK3KdvTKoohdB5u
	 35bUTxWgVm314uOpxZjTBnFgdmREPDWOgpOjpJ6DxPMc+93zi3tpAYKV7GJeb+Srk2
	 0buO6/TNhl9NtUf/KNou7o2SvxHmLqYjXnUruCxn+QsrjkMMGPGLDBdZ01lc3cxYf1
	 mHef0AguitD9xOoK/XMI6ccZtMsgGO/iQjP5VTpZECg5ZH+R8BS8IkdZFQSBl3eEBw
	 EzvzSXwQ9VxCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A637C43141; Wed, 10 May 2023 17:53:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217350] kdump kernel hangs in powerkvm guest
Date: Wed, 10 May 2023 17:53:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: clg@kaod.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217350-206035-Y9aIlUGC5u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217350-206035@https.bugzilla.kernel.org/>
References: <bug-217350-206035@https.bugzilla.kernel.org/>
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

--- Comment #2 from C=C3=A9dric Le Goater (clg@kaod.org) ---
Hello  Pingfan,

This was a large series. Did you identify the exact patch ?  It should be=20
related to the powerpc/pseries/pci or powerpc/xive subsystem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
