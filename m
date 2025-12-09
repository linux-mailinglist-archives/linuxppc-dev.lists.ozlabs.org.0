Return-Path: <linuxppc-dev+bounces-14699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23ACAF9F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 11:23:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQZh32VZNz2yD4;
	Tue, 09 Dec 2025 21:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.216 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765275827;
	cv=pass; b=WbLh5QHYtaRHx0CU1aDY7vo9LFFDR3Ifb18HPJjBXSSoos6H2mCAv3N8jzlcbqK1f/n1NUBqQic+AObNjOf8c0cd8HIiJnPXBCFBLyy4MW+RYBXesSxA7Qk2fi3YUZIdE2Ddj3gne03/dKTHqxGGRl7uQsCALyt+kMkrdarDjYxuKVgB1HnPhDFq/HWTgED/JZ3MqhozuWqL2HlboLDag3F9vuhPV0UtV6oSWSD1ETo4mrxeS45Q75VCB0LivcjTyCgHI0rgN3YlvzSJBWYQaNZC7fwvoj9ZRLjeeDHkQOrduprI1c8svvK3yt5qzW7EcWk2pkkazARQ3oXQ239oSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765275827; c=relaxed/relaxed;
	bh=24nBF+4UPWM1LyVXTCZX7fit72DdDwed1XXhw3xKTt4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=G81dZyX6USACZiU91tOz/HTEl6oKReQrZ64CqMiXxgxECxoJNS6K5/gfCYkanhuDgMGy0zOQ3yNMPGvjtQ5c4CdHuFdZY5J0Hq6bTiAge/zMpHeMZCW+Gd6Mffc/maz3yAQlibCHIhSLPLnypPVa6o5wGqQdeYXavASd792qY/amKbbIVed4bP6yeIrr5OJp1TYdYmBgRfTA4oJQtMcjkjIp3uxvlEtT2FtXx8GQxv+mv/8etCvbnH2SyZ2a694K80qRGipqqdfwIkAERNcd4GcbKoBaK+ML4aY8J1LSt5rU2Z/fRmz/uwUOAyGLQFJChOVBl1ws7b7AyZTt+qjjXA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QO1Ip5+w; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pxc4uL0G; dkim-atps=neutral; spf=pass (client-ip=81.169.146.216; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QO1Ip5+w;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pxc4uL0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.216; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQZh00X0wz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 21:23:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765275809; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WAp9dYegdKWKGLrV7HSC3SvXT6LORnIpYQ4lMJlNefYH+ABzjw46UuyhDfSnERczZP
    m5rbfLWJi/DUfscGas+1u2ZEeLywWOAIpcbMCDefQTWfWlwMcBmswQ4ODeNTcIiBIQRt
    4aBm3QvY323ICBgGw+ScaUEwxvIK7Yf2WQ2WhLBHYMxZ+G3EwKPzAKHLP4AN2f2Gxkdv
    K7FfyvubBk+JziRPjX8+SuV8BR2SQgcnxnQhTKSdd4hFAwI8PBYkZCtqYvlVHI6qEswN
    61mTZSi9rTwoUHLuVnMGnGdnOaGg8xh0rKZvhGlu668yuBjgztw7gohl8dg8lJCjW0e8
    fFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765275809;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=24nBF+4UPWM1LyVXTCZX7fit72DdDwed1XXhw3xKTt4=;
    b=Rdplr89IM36vB/U7LmcC8z8/+zYcd3Jf8rMiJGz6iY8bRt4/9A/5G3YMIUPokpdxex
    +Ray6K1WMlkYhAx6/hjyMJqZtSajzzzNdw4QTMT/GgvUISVT5tOkxzzfNPZjDEwUsSAW
    lgO/EXiZvaoLsYWJ7yaEbmmhvOz6D2BWKqPwPampCfCLbdK6NuqAFjiOke/QqR8ceNXe
    jgRKNP5BeIy/z9XnDc0W8xo5xHRjg/lLQver6LlnK6D00f1HP4S8ccOv5OBVlAr61nwC
    GdVs9H0JqbFoXqP0tKYcsJ9rY2+KoahHjwBGof40v6H4z60CjbeI5w3XfDFltMzTjPZa
    gJZA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765275809;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=24nBF+4UPWM1LyVXTCZX7fit72DdDwed1XXhw3xKTt4=;
    b=QO1Ip5+wCv6BSp+Ky5xDyrRqkXRiGUqU1WncK6nFv14QrLopuT08Ba/o+hkBR18Fi1
    sXo0tXeecYCBKga6a2wmjrAv2iHxaYc4lT9nZQ4vKYul+kezdpmI1QILX1dQelITG2dR
    SbVjWgHyzAHQZzIy+E5YfCcZ/qNBe1yhy1p3yhWl/RXqNNCaKiqQdJl8XvPA526yc/fn
    mUIqHattGt9m9IkMynCntG1gchWeH0VszwQfam6S57BDJvOPizM5p/Hi6eBmAO93m4uI
    r6pIXYRqzRCmG2iAWFM17rN2iQVZoxElFpNB7QIzNLr436HxUq3Bqgyqn7IiHnK7X1Xj
    L6pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765275809;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=24nBF+4UPWM1LyVXTCZX7fit72DdDwed1XXhw3xKTt4=;
    b=pxc4uL0GsCQnfnaQoDowRGGbvOgh9xt204cO0MYAzxJfS1PtmFpZuMziLD0BtndQSY
    qhx/Oabj4CBWmfTEbXCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mxsyjMXnXptmt6xq1TL1Rm/8PW4ZEn0pHPQv8="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id ed69d81B9ANTG7G
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 9 Dec 2025 11:23:29 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Tue, 9 Dec 2025 11:23:18 +0100
Message-Id: <3CA22041-688B-4237-BD85-B3B3CB523C75@xenosoft.de>
References: <12A4C332-4517-41A0-B3F4-103970E1B829@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <12A4C332-4517-41A0-B3F4-103970E1B829@xenosoft.de>
To: Christophe Leroy <chleroy@kernel.org>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 09 December 2025 at 10:03 am, Christian Zigotzky <chzigotzky@xenosoft.d=
e> wrote:
>=20
> =EF=BB=BFI bisected today.
>=20
> 1. git clone https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux=
.git -b powerpc-6.19-1 a
>=20
> 2. cd a
>=20
> 3. git log
>=20
> Output:
>=20
> commit 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f (HEAD, tag: powerpc-6.19-1=
, origin/next-test, origin/next)
>=20
> ...
>=20
> 4. git bisect start
>=20
> 5. git bisect good f850568efe3a7a9ec4df357cfad1f997f0058924
>=20
> Merge tag 'i2c-for-6.18-rc5'
>=20
> 6. git bisect bad 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f
>=20
> macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>
>=20
> 7. git bisect bad
>=20
> 8. git bisect bad
>=20
> 9. git bisect good
>=20
> 10. git bisect bad
>=20
> 11. git bisect good
>=20
> 2997876c4a1a5864baa13d7393c2b68cf5b51183 is the first bad commit
> commit 2997876c4a1a5864baa13d7393c2b68cf5b51183
> Author: Christophe Leroy <christophe.leroy@csgroup.eu>
> Date:   Thu Sep 11 14:30:12 2025 +0200
>=20
>    powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
>=20
>    Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
>    up return from interrupt") removed the inconditional clearing of
>    MSR[RI] when returning from interrupt into kernel. But powerpc/32
>    doesn't implement interrupt restart table hence still need MSR[RI]
>    to be cleared.
>=20
>    It could be added back in interrupt_exit_kernel_prepare() but it is
>    easier and better to add it back in entry_32.S for following reasons:
>    - Writing to MSR must be followed by a synchronising instruction
>    - The smaller the non recoverable section is the better it is
>=20
>    So add a macro called clr_ri and use it in the three places that play
>    up with SRR0/SRR1. Use it just before another mtspr for synchronisation=

>    to avoid having to add an isync.
>=20
>    Now that's done in entry_32.S, exit_must_hard_disable() can return
>    false for non book3s/64, taking into account that BOOKE doesn't have
>    MSR_RI.
>=20
>    Also add back blacklisting syscall_exit_finish for kprobe. This was
>    initially added by commit 7cdf44013885 ("powerpc/entry32: Blacklist
>    syscall exit points for kprobe.") then lost with
>    commit 6f76a01173cc ("powerpc/syscall: implement system call
>    entry/exit logic in C for PPC32").
>=20
>    Fixes: 6f76a01173cc ("powerpc/syscall: implement system call entry/exit=
 logic in C for PPC32")
>    Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed u=
p return from interrupt")
>    Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>    Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>    Link: https://patch.msgid.link/66d0ab070563ad460ed481328ab0887c27f21a2c=
.1757593807.git.christophe.leroy@csgroup.eu
>=20
> arch/powerpc/kernel/entry_32.S  | 18 +++++++++++++++++-
> arch/powerpc/kernel/interrupt.c |  2 +-
> 2 files changed, 18 insertions(+), 2 deletions(-)
>=20
> 12. git revert 2997876c4a1a5864baa13d7393c2b68cf5b51183
>=20
> After reverting the first bad commit, the kernel boots without any problem=
s.
>=20

I created a patch for reverting the first bad commit.

After patching, the kernel boots without any problems.

diff -rupN a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S=

--- a/arch/powerpc/kernel/entry_32.S	2025-12-09 06:57:20.681347393 +0100=

+++ b/arch/powerpc/kernel/entry_32.S	2025-12-09 10:24:37.357301725 +0100=

@@ -101,17 +101,6 @@ SYM_FUNC_END(__kuep_unlock)
 .endm
 #endif
=20
-.macro	clr_ri trash
-#ifndef CONFIG_BOOKE
-#ifdef CONFIG_PPC_8xx
-	mtspr   SPRN_NRI, \trash
-#else
-	li	\trash, MSR_KERNEL & ~MSR_RI
-	mtmsr	\trash
-#endif
-#endif
-.endm
-
 	.globl	transfer_to_syscall
 transfer_to_syscall:
 	stw	r3, ORIG_GPR3(r1)
@@ -160,7 +149,6 @@ ret_from_syscall:
 	cmpwi	r3,0
 	REST_GPR(3, r1)
 syscall_exit_finish:
-	clr_ri	r4
 	mtspr	SPRN_SRR0,r7
 	mtspr	SPRN_SRR1,r8
=20
@@ -180,7 +168,6 @@ syscall_exit_finish:
 	REST_GPR(0, r1)
 	REST_GPRS(3, 12, r1)
 	b	1b
-_ASM_NOKPROBE_SYMBOL(syscall_exit_finish)
=20
 #ifdef CONFIG_44x
 .L44x_icache_flush:
@@ -237,11 +224,10 @@ fast_exception_return:
 	/* Clear the exception marker on the stack to avoid confusing stack=
trace */
 	li	r10, 0
 	stw	r10, 8(r11)
-	clr_ri	r10
+	REST_GPR(10, r11)
 	mtspr	SPRN_SRR1,r9
 	mtspr	SPRN_SRR0,r12
 	REST_GPR(9, r11)
-	REST_GPR(10, r11)
 	REST_GPR(12, r11)
 	REST_GPR(11, r11)
 	rfi
@@ -270,7 +256,6 @@ interrupt_return:
 .Lfast_user_interrupt_return:
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
-	clr_ri	r4
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
=20
@@ -313,7 +298,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRE
 	cmpwi	cr1,r3,0
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
-	clr_ri	r4
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
=20
diff -rupN a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt=
.c
--- a/arch/powerpc/kernel/interrupt.c	2025-12-09 06:57:20.717347165 +0100=

+++ b/arch/powerpc/kernel/interrupt.c	2025-12-09 10:24:37.357301725 +0100=

@@ -38,7 +38,7 @@ static inline bool exit_must_hard_disabl
 #else
 static inline bool exit_must_hard_disable(void)
 {
-	return false;
+	return true;
 }
 #endif=


