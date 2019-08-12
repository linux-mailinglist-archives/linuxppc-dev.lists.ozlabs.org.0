Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A983E8A2F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 18:08:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466gkK74nLzDqFK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 02:08:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 466ggp2DCQzDqQ6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 02:06:14 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id C1C2528511
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 16:06:11 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id AA6E728520; Mon, 12 Aug 2019 16:06:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204479] KASAN hit at modprobe zram
Date: Mon, 12 Aug 2019 16:06:11 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Flash/Memory Technology Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@c-s.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: dwmw2@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204479-206035-z75WAkWKos@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204479-206035@https.bugzilla.kernel.org/>
References: <bug-204479-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204479

--- Comment #18 from Christophe Leroy (christophe.leroy@c-s.fr) ---
The Oops occurs at 0x3c8:

 3b0:   81 21 00 88     lwz     r9,136(r1)
 3b4:   13 67 dc c4     vxor    v27,v7,v27
 3b8:   7d 11 a8 ce     lvx     v8,r17,r21
 3bc:   11 5f 5b 06     vcmpgtsb v10,v31,v11
 3c0:   11 6b 58 00     vaddubm v11,v11,v11
 3c4:   81 41 00 8c     lwz     r10,140(r1)
>3c8:   7c 00 48 ce     lvx     v0,0,r9

This is because the value in r9 is most likely wrong.

r9 is loaded from the stack at 0x3b0

r9 was calculated and stored in the stack by the below code.

  70:   3d 20 00 00     lis     r9,0
                        72: R_PPC_ADDR16_HA     .rodata.cst16
  74:   3b b3 00 10     addi    r29,r19,16
  78:   39 29 00 00     addi    r9,r9,0
                        7a: R_PPC_ADDR16_LO     .rodata.cst16
  7c:   91 21 00 88     stw     r9,136(r1)

The value comes from .rodata.cst16

Two possibilities, either the value in .rodata.cst16 is wrong or the stack =
gets
corrupted.

Maybe you could try disabling KASAN in lib/raid6/Makefile for altivec8.o ? =
Or
maybe for the entire lib/raid6/ directory, just to see what happens ?

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
