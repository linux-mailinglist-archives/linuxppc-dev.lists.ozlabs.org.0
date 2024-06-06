Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB28FDCCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 04:34:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dowchelf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvpM61Fcfz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 12:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dowchelf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvpLQ3xhzz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 12:34:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D053061601
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 02:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7181AC2BD11
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 02:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717641239;
	bh=sgfZgKHXMwzUNMlpq8RR90/c7pr4oCTEND6iskGeHnQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DowchelfZuQi4umKQHBjHUVim6YfjT2lSDt9Ic5ihqo+gicsRFBDZSNi8+b5xa5DD
	 FC9TZWjFYONNYYqR5R0BnszsVDXwYM7SdB6uk05L22ytDjOpg5uiOgs2zcOZv6OMBM
	 +q8MsxusdKbMLa2FO7EXlHvJfaPWnXfLpqcIqymOaj9tqiizUY0SfGZ1dIvJevff1U
	 1GYffMjXV7oKNF4CQ+GnTANLl4JfZOTnYRoTwbeHaiHysVuroci23MWlUqpGjVUbd6
	 /h/S0uIVzHBPTLC1eBdYZKu3J5I75c5qkJv2r8sy56wNJVmjsq9bkHOjGtLgLFoVXS
	 Cgu/bFBhG0RoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A9EBC433E5; Thu,  6 Jun 2024 02:33:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Thu, 06 Jun 2024 02:33:59 +0000
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
Message-ID: <bug-218858-206035-9xLpm7tp4p@https.bugzilla.kernel.org/>
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

--- Comment #23 from doru iorgulescu (doru.iorgulescu1@gmail.com) ---
I am in compilation=20
When is finished I send to You the results
Thank You Very Mutch
Regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
