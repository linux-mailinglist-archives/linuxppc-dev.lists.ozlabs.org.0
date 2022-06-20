Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC9552857
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:31:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRmBJ3JNVz3cKp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:31:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u7eTf2HR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u7eTf2HR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRm9b129Jz2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 09:30:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F9C96154F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13618C3411B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655767856;
	bh=tX8PlnJ6QiHP7s2QOCQ5dk4gcMNM5qcRLlAZKcxFzJA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u7eTf2HR3cIFZSw2ye1iR+3ocQct2cbVQARE9H6a+jWVCCdAvcbMr8MuqT+gDgZv9
	 uyLdf4oqlwF2Oq0mWPHShSBDWMYOzsiMBw+Ehj50r+semcyv0O7eaImViaCo0BXo14
	 UCYSZns9QIo/k+YqJaJtWeLEJQUvYEYMAYGE4hV5NL7sp4k1ckaIhtwC8bxyvXsBqh
	 al8gtpl3g5Uci7wQpRhgj+qzMc2L5mzkPA1Oa0INE+7qx4O1q+QDlrUTMdoWgzbJNG
	 2E4JAdHIDMhw9XuEInDdT+7hAUqHIa5aEXh3gAUrT4oPQZUlTOyvoddTyfZ3SEEP8Q
	 9pwd6y4JONIYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E3E19C05FD5; Mon, 20 Jun 2022 23:30:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Mon, 20 Jun 2022 23:30:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216156-206035-tVK57pvPYO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301232
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301232&action=3Dedit
cat /sys/kernel/debug/kmemleak

Apart from that kmemleak shows a lot of hits.


Only this patch was applied on top of 5.19-rc3 to prevent bug #216095:

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 3507095a69f6..a70ff9df5cb9 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -556,7 +556,7 @@ static int __init of_platform_default_populate_init(voi=
d)
                        if (!of_get_property(node, "linux,opened", NULL) ||
                            !of_get_property(node, "linux,boot-display", NU=
LL))
                                continue;
-                       dev =3D of_platform_device_create(node, "of-display=
",
NULL);
+                       dev =3D of_platform_device_create(node, NULL, NULL);
                        if (WARN_ON(!dev))
                                return -ENOMEM;
                        boot_display =3D node;
@@ -565,7 +565,7 @@ static int __init of_platform_default_populate_init(voi=
d)
                for_each_node_by_type(node, "display") {
                        if (!of_get_property(node, "linux,opened", NULL) ||
node =3D=3D boot_display)
                                continue;
-                       of_platform_device_create(node, "of-display", NULL);
+                       of_platform_device_create(node, NULL, NULL);
                }

        } else {

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
