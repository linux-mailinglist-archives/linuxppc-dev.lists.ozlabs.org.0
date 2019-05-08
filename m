Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0B1824E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 00:39:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zrxf0tZhzDqGq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 08:39:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zrwP6CfFzDq99
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 08:38:13 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D56FE28725
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 22:38:10 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id C8F1028A09; Wed,  8 May 2019 22:38:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203125] Kernel 5.1-rc1 fails to boot on a PowerMac G4 3,6:
 Caused by (from SRR1=141020): Transfer error ack signal
Date: Wed, 08 May 2019 22:38:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-203125-206035-d4TKMVJpGZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203125-206035@https.bugzilla.kernel.org/>
References: <bug-203125-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203125

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 282679
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282679&action=3Dedit
bisect.log

Finally, the results of the bisect...

f7354ccac844da7b1af8cc4f09da330fa3e960e4 is the first bad commit
commit f7354ccac844da7b1af8cc4f09da330fa3e960e4
Author: Christophe Leroy <christophe.leroy@c-s.fr>
Date:   Thu Jan 31 10:09:04 2019 +0000

    powerpc/32: Remove CURRENT_THREAD_INFO and rename TI_CPU

    Now that thread_info is similar to task_struct, its address is in r2
    so CURRENT_THREAD_INFO() macro is useless. This patch removes it.

    This patch also moves the 'tovirt(r2, r2)' down just before the
    reactivation of MMU translation, so that we keep the physical address
    of 'current' in r2 until then. It avoids a few calls to tophys().

    At the same time, as the 'cpu' field is not anymore in thread_info,
    TI_CPU is renamed TASK_CPU by this patch.

    It also allows to get rid of a couple of
    '#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE' as ACCOUNT_CPU_USER_ENTRY()
    and ACCOUNT_CPU_USER_EXIT() are empty when
    CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not defined.

    Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
    [mpe: Fix a missed conversion of TI_CPU idle_6xx.S]
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

:040000 040000 c7a4d4ea7c2864b693e82a075f62e26dfcb82c84
a15e8516fdadda87981702d86b38b0e07672220b M      arch

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
