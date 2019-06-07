Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E179383D5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 07:44:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ks0V2xTNzDqB3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 15:44:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Kryq3PVrzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 15:42:42 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C0BEA28AC3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 05:42:40 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id B526628B0D; Fri,  7 Jun 2019 05:42:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203837] Booting kernel under KVM immediately freezes host
Date: Fri, 07 Jun 2019 05:42:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: paulus@ozlabs.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203837-206035-6C8tE9RdKJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203837-206035@https.bugzilla.kernel.org/>
References: <bug-203837-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203837

Paul Mackerras (paulus@ozlabs.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paulus@ozlabs.org

--- Comment #1 from Paul Mackerras (paulus@ozlabs.org) ---
I have tried but not succeeded in replicating this problem.

I have tried 5.2-rc3 in the host with the config I usually use, plus 5.2-rc=
3 in
the guest with that same config. That boots just fine.

With 5.2-rc3 in the host and my usual config, and 5.2-rc3 in the guest comp=
iled
with the config attached to this bug, the guest gets a kernel panic due to
being unable to mount root. It looks like it never manages to load virtio-b=
lk
for some reason.

With the config attached to this bug, I did once see the guest stop outputt=
ing
messages after the message about bringing up CPUs. The host was still runni=
ng
just fine, and top in the host showed the qemu-system-ppc64 process using 1=
00%
of a CPU, consistent with the guest being in an infinite loop.

I think we need more details about the machine where the crash is occurring=
 -
host kernel config, details of VM config (qemu command line or libvirt xml),
etc.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
