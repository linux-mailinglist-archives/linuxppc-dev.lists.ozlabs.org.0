Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3C4BD620
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 07:55:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2Ck95Mf6z3cTG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 17:55:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RNTfXsV+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RNTfXsV+; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2CjN5HtRz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 17:55:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BC5860F16
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 06:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4A86C36AE3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645426500;
 bh=OpquIPX0Il55Vv+XGJt0o+FP1AghfJWmzZ5szpGoTGQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RNTfXsV+HOh1N1+910KiEn7PsLFCPJUQDz2Y+7eS5NHpmDMahDA2r0O0vaaCnegSX
 i3nECdj+KnxXjygkqJEiQpPJPN8OV7staLocuT3OMw803Z5wCVrbYehtob5q+wnzax
 /Fk9Cln+p+frn9xGea8nC8JwliQtCjknediSAb9qudVYGVQkyS21EQYdW7P0hC/iv0
 noK9pZbXbDbWqkUw34Yo3DqcCubtVJN/G6Dm2hbM4JWI7xnZf0RsU4N7ZXAPcnINoV
 xX21RayaINr79cviPZrFyVnS8kKAMO9aYgwHLvf2Qj/KNj9groQXK7mpqWA3uFAxkW
 U+rGLFv7IOO6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A710BC05FD4; Mon, 21 Feb 2022 06:55:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215621] Warning: Unable to mark rodata read only on this CPU.
 (PPC970MP)
Date: Mon, 21 Feb 2022 06:55:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215621-206035-DhTDy7M9pT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215621-206035@https.bugzilla.kernel.org/>
References: <bug-215621-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215621

--- Comment #4 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
It is up to you to unselect CONFIG_STRICT_KERNEL_RWX.

The kernel is usually built to boot on any PPC64 processors, so we can't fo=
rbid
the selection of CONFIG_STRICT_KERNEL_RWX.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
