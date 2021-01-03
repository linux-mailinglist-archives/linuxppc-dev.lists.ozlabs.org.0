Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD02E89DD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 02:36:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7hDs0N1JzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 12:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.104;
 helo=mail-41104.protonmail.ch; envelope-from=skirmisher@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=S5fe+Wbb; 
 dkim-atps=neutral
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7hC42GDqzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 12:34:56 +1100 (AEDT)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41104.protonmail.ch (Postfix) with ESMTPS id 61DDB20021FE
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 01:34:53 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="S5fe+Wbb"
Date: Sun, 03 Jan 2021 01:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1609637681;
 bh=SbT7Lx6cXv5Gb9/haD538UbGC8gYxaNPkTQTRCdxw+k=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=S5fe+WbbGlg9ScYSBUPZ649qIa1XZCx/T4fOjHpm4+avnkgylG97I3PHzF4KB+V8T
 YlsULd2C6HzGGqFRE8l4CvCzTSIHsSNtP55Z4z487X3hDkMSO83UNUG/l23uWEOc9a
 o3NvehfhU6h/9HTevoV+KDXxGrYEDLW0iTRdgac0=
To: linuxppc-dev@lists.ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: [PATCH 1/2] powerpc: use kernel endianness in MSR in 32-bit signal
 handler
Message-ID: <2058876.irdbgypaU6@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Cc: eerykitty@gmail.com, daniel@octaforge.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joseph J Allen <eerykitty@gmail.com>

This mirrors the behavior in handle_rt_signal32, to obey kernel endianness
rather than assume a 32-bit process is big-endian. Without this change,
any 32-bit little-endian process will SIGILL immediately upon handling a
signal.

Signed-off-by: Joseph J Allen <eerykitty@gmail.com>
Signed-off-by: Will Springer <skirmisher@protonmail.com>
---
 arch/powerpc/kernel/signal_32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_3=
2.c
index 934cbdf6dd10..75ee918a120a 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -929,8 +929,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *old=
set,
 =09regs->gpr[3] =3D ksig->sig;
 =09regs->gpr[4] =3D (unsigned long) sc;
 =09regs->nip =3D (unsigned long)ksig->ka.sa.sa_handler;
-=09/* enter the signal handler in big-endian mode */
+=09/* enter the signal handler in native-endian mode */
 =09regs->msr &=3D ~MSR_LE;
+=09regs->msr |=3D (MSR_KERNEL & MSR_LE);
 =09return 0;
=20
 failed:
--=20
2.29.2





