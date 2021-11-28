Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C44606DF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 15:27:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J29mT2klsz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 01:27:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TYsMzHKk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TYsMzHKk; 
 dkim-atps=neutral
X-Greylist: delayed 367 seconds by postgrey-1.36 at boromir;
 Mon, 29 Nov 2021 01:26:40 AEDT
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J29lh46Lgz2yp0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 01:26:40 +1100 (AEDT)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57ADD61010
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:20:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BA59E60187
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638109225;
 bh=oZZcVbfksau0dUhZsIOPz4JpVmFRYLa2l/xGvpgnKfQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TYsMzHKkOVm5+LaNmPcEosCUjK6Y2jyZLV9x9Mle9ZAo7ycfxFS3zU6XgfTA0KO9o
 q5Eb+b+YbYLW3J89hh+nE5X6EjRd65spNfHlSQsgUFyHm+vVlqxYyT1mOt7NTnBe96
 4IMqG5lpqSquFAibR6JX0FICyeRAHKX6b7Z7EooEtomgB/Sx5wIKAR41E2NZDe7HQk
 ZtIvmHtF4s3YKscNIPENv0SruMLyQrICbIO91GVdtlR+zngB6gkLkJ1TynbXbK6rKW
 kaZO+2BwDBbAI//2L35WbzLDyNpVBFaoN5A4+vs1k7sKGHUJLShUZzXIkMKUVJhFxb
 zIFmFc7pT0YVA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A67EF60F4D; Sun, 28 Nov 2021 14:20:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Sun, 28 Nov 2021 14:20:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-i8LqeujfEW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #13 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299755
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299755&action=3Dedit
dmesg (5.16-rc2 + patch, PowerMac G5 11,2)

Still happens with with 5.16-rc2, but getting a slightly different error
message this time. Also this crash happened earlier, not at building distcc=
 but
at unpacking the to be built tar.gz archive with tar + pigz:

[...]
stack: c000000005b0e600: 00000000 00000003 c0000000 00105b2c  .............=
.[,
stack: c000000005b0e610: c0000000 05b0e6a0 0031faa1 bd74990f  .........1...=
t..
stack: c000000005b0e620: c0000000 00104f50 00000000 00000006  ......OP.....=
...
stack: c000000005b0e630: c0000000 05b0e6a0 0031faa1 bd74990f  .........1...=
t..
kernel tried to execute exec-protected page (c000000005b0bbe0) - exploit
attemp? (uid: 0)
stack: c000000005b0e640: c0000000 00000001 c0000000 022f2a08  .............=
/*.

The last 2 lines were not in the netconsole.log but only were to be seen on=
 the
screen of the frozen G5 so I added them manually.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
