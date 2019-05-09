Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC218889
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:52:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4509C43NZtzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 20:52:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45099g3rgRzDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 20:50:46 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1E27828A51
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 10:50:45 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 1CED628B01; Thu,  9 May 2019 10:50:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203125] Kernel 5.1-rc1 fails to boot on a PowerMac G4 3,6:
 Caused by (from SRR1=141020): Transfer error ack signal
Date: Thu, 09 May 2019 10:50:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@c-s.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203125-206035-3DCNusCTL2@https.bugzilla.kernel.org/>
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

--- Comment #7 from Christophe Leroy (christophe.leroy@c-s.fr) ---
On 05/09/2019 10:05 AM, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D203125
>=20
> Christophe Leroy (christophe.leroy@c-s.fr) changed:
>=20
>             What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>                   CC|                            |christophe.leroy@c-s.fr
>=20
> --- Comment #5 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> Apparently, MSR DR is not sent and DAR has value 0xc0090654, meaning that=
 a
> virt address tries to get accessed while in real mode.
>=20

Could you try the patch below:

diff --git a/arch/powerpc/mm/book3s32/hash_low.S=20
b/arch/powerpc/mm/book3s32/hash_low.S
index e27792d0b744..8366c2abeafc 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -539,7 +539,8 @@ _GLOBAL(flush_hash_pages)
  #ifdef CONFIG_SMP
        lis     r9, (mmu_hash_lock - PAGE_OFFSET)@ha
        addi    r9, r9, (mmu_hash_lock - PAGE_OFFSET)@l
-       lwz     r8,TASK_CPU(r2)
+       tophys  (r8, r2)
+       lwz     r8, TASK_CPU(r8)
        oris    r8,r8,9
  10:   lwarx   r0,0,r9
        cmpi    0,r0,0


Christophe

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
