Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82938529C52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 10:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2TjB2NY6z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 18:26:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MQWDYTtP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MQWDYTtP; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2ThS32XGz3bbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 18:25:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA458B816C7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 08:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 874D3C34100
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652775923;
 bh=/gw9hDORG9g8D1IQuJQzgH73IANkC0qeDzekluRzTOk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MQWDYTtPSLJIfB/qfKKnrLLTQHVU7hH4sjjq/cOXV0cELCD3pHBA0x64ak+Q4Kdt2
 GwH4Zcb8siZLSk+C4u8xMk5F8u1qSO1RKxoEeTk25qkL7WKIkirzv6SqXilTOtRGto
 b7EnXYOkNWJWM1PaDB1HKIsQFh05vW7+YjgMNVF0PVZPwGn8PCWEFy0NKjgEiZuhPL
 O2ubfUiAf25x6hjK8lNJwgPiEkhcyUlMcsE1EdVy47Lyn9OLJm/x4sdJUj869SYO2b
 Kzqip7bVitWYPPZNyzZkt6qBH/nR3JBpP1ycFHmXxzQkGVUHJVv24K5eRc72Q0HVbp
 SmPE6mY57u/Gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4F0D8C05FD5; Tue, 17 May 2022 08:25:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 17 May 2022 08:25:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-cS8TQvEQxl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #24 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Seems like with Inline KASAN your kernel is far too big compared to what we
support at the time being:

c2468000 T __end_rodata
c2800000 T __init_begin
c2800000 T _sinittext

c2801644 T prom_init

The init text section is behind the 32Mbytes boundary, it means that prom_i=
nit
and other functions are not called anymore directly but via a trampoline.

c000000c <__start>:
c000000c:       2c 05 00 00     cmpwi   r5,0
c0000010:       41 82 00 1c     beq     c000002c <__start+0x20>
c0000014:       42 9f 00 05     bcl     20,4*cr7+so,c0000018 <__start+0xc>
c0000018:       7d 08 02 a6     mflr    r8
c000001c:       3d 08 00 00     addis   r8,r8,0
c0000020:       39 08 ff e8     addi    r8,r8,-24
c0000024:       48 00 38 e5     bl      c0003908 <setup_disp_bat+0x30>
...
c0003908:       3d 80 c2 80     lis     r12,-15744
c000390c:       39 8c 16 44     addi    r12,r12,5700
c0003910:       7d 89 03 a6     mtctr   r12
c0003914:       4e 80 04 20     bctr


And it cannot work because at that time the kernel is not yet relocated to =
its
final location.

There was the same problem with PPC64 and it was fix by 24d33ac5b8ff
("powerpc/64s: Make prom_init require RELOCATABLE").

Don't know if a similar approach could work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
