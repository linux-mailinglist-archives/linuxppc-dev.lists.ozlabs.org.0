Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3545EA19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 10:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0pwm2LTrz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 20:14:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DxRD2FEP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DxRD2FEP; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0pw13jmsz2yMc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 20:14:09 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 21DC860F58
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637918047;
 bh=QJeH6/BfwdS/rbW9driNkIVCW2ZHLMQR5iw3rIrZnnI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DxRD2FEPfEdUod7jvWnmJCgyq/q9ZWj0CrvvVBLeVTVMJgT+mmJQWQWQaXBk0dlne
 giBLY8kDP0W5ImvCEmYmnqIiW86CchpfdDyew+GCv/uTIPG2WIimXqNMPxZOIzchtP
 G2IC9JEfMG+QfIwmXe2Cx/mkz9out6zQelBDwWTSNHrsCLWuTpHKmm/PmnsuriNQ9I
 gPuWsnP14jodt0ynB8OS52qul72Z1CmkXYXDWY61r0t/yGjNGHHSmyf8M53xIJpT+g
 yPV7wpch9ldhRB9qurU/0WaFyCdaOLLavmCdfup1BGoPyOe9Aqa1z6YUPENUJIa7cq
 fU8bnXWxcIxuA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1890960F6E; Fri, 26 Nov 2021 09:14:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Fri, 26 Nov 2021 09:14:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205099-206035-05YnCvmN97@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

--- Comment #38 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Looks like only x86 are arm implement this vmalloc=3D parameter:

[chleroy@PO20335 linux-powerpc]$ git grep 'early_param("vmalloc"' arch/
arch/arm/mm/mmu.c:early_param("vmalloc", early_vmalloc);
arch/x86/mm/pgtable_32.c:early_param("vmalloc", parse_vmalloc);

However, your vmalloc area has a size of 65M:

Kernel virtual memory layout:
  * 0xf6000000..0xfec00000  : kasan shadow mem
  * 0xf5bbf000..0xf5fff000  : fixmap
  * 0xf5400000..0xf5800000  : highmem PTEs
  * 0xf5115000..0xf5400000  : early ioremap
  * 0xf1000000..0xf5110000  : vmalloc & ioremap
  * 0xb0000000..0xc0000000  : modules
Memory: 1928984K/2097152K available (22288K kernel code, 2616K rwdata, 4868K
rodata, 1408K init, 8981K bss, 168168K reserved, 0K cma-reserved, 1310720K
highmem)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
