Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 793948BDE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 17:59:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467HTx0R5QzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 01:59:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.b="IkibpDxr"; 
 dkim-atps=neutral
X-Greylist: delayed 339 seconds by postgrey-1.36 at bilbo;
 Wed, 14 Aug 2019 01:58:08 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467HS01BJ2zDqDl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 01:58:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1565711869;
 bh=r8daHHM9sX7KOhtmxSlr2nyM2WaTLCXTlGt9NpMKzKw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=IkibpDxrMnBD5NR8O0vSW+KAdtwZf74jyBadLIiQcI8atOwP0RmiVfmo7bXnw34XN
 HEAi2I6BEjBYKNwp8b0rgOe9ABLd+v8ELW1ND3ZEe6BHPrHZVXq3REdgH8aY1nIYB7
 eGmasG+89hjlbZ0eBDjTXk9ZSGpM+3cvPNWZ/s0U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1hidXR379S-00LaIT; Tue, 13
 Aug 2019 17:52:11 +0200
Date: Tue, 13 Aug 2019 17:51:52 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linuxppc-dev@lists.ozlabs.org, Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [REGRESSION] Boot failure with DEBUG_PAGEALLOC on Wii, after PPC32
 KASAN patches
Message-ID: <20190813155152.GH1966@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:tBykyESrGgsqTpyH4W2uzhd3duRUqeewRMSb2Z6wOuTt9SmDopu
 MPcpqSmrZ3WGhzLUwPSb0Kp9/oARKF7Q/qjqlIrSlD3Mh1WWx2hatDgI2CULANQWQfKGOl2
 sSVcdXbbQCFFvTxm/T963WlLh/F1z1PMiDf3nvEjmujnLFx0uGEmuSSKhq4A/y0HQAm2dOq
 IJCr6e3pOms2WFtTb9Yyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yfY3rNrOSHA=:l38pN152l89nqsp5OFltla
 8uelrk+iPP/4DG33E3jKKyGGRDkTnrjeASbHlEQDDTrzTVmkWsq5g8Cjz8dg268H+oythf0JX
 60sSzog7GlQjj7vgkh5QNzJjsQrloKwURrwXl0Av+mIOR0mhGnYPiOraTFHewU9wk0tuKmu6q
 XWR2q7XNwCqxm4j2RUUwnE6MBTdoE68yr6NZYMVM7hCG86AIaklTw3UmGvd9EsuH6FXy3x392
 A5ejvX/bYxyJRan6C1iYSgBdJNnTAHtfDSqDMbzOKr2A/yXQJJ7TCe3XSrBzEmkXHfaALRAGM
 JBbcHqso9+zGAGTT3cK8852YQgBYj8n7cXCRUy0V+TD0TKPaQ3NqpZss46DM4UewzN0KORM6I
 cPmLjMpxAbEzIGP3IUB5rgRcc5k5+xTigQ62EPKEjdnDOwhyYnd4ekJ8EjzUJx9Ix3GyS2ne+
 dqugAU1GR3wT3hhErMFXDyyIu5vJ2NAun9VsZTiMTBDV8Hnj53UUfPj9jxXQBjJfy0StJTZh0
 pkyh0wPOYOBwr/uP1/kZnJwhJoeUx1g2icXGsxC7N366PfUtEvctbm0fi3fS4QjesarNf77gw
 mLXYCB9Ogk3NbSVJfL3teknGWAobv7JI33c7sP6UxWktmIG/2JRx4YCkrkfb6htg1lFTuaB4X
 +GjkmX74z9sH5PJeU+LYqyM4HBjCP+OpsRt3X3alMNrc1GFukIK2VJ/inmRYQEI08P7nV/N7S
 v3T8IpDkylVnrK6T4oD+I6e495CgS8MIbhcO1YyE88bq+l1lRtoq2UJW53ZBzkw/oYQ3CXInZ
 jpsBIEeBIPF++en1dvvqUDcCtBNtZpsbZpbcepyxSQFmc060tM+9IzFbyi5kgvJS3KLZLXPRQ
 7yQOlRZ4Hxe0hADVsUKNpYU96xmEhgcdq26lGHGvuCVl4jhwPimFo19Qo3jZzEZkakNBN7ZF2
 hCRnjCif09+QM6kAXXVHfuV209FzMcLs7bGqNDiW0402tG98USrnArXqU3LpL3Z9Bj6ot4P4T
 af4/cvY2UGCmhNees0iKm847FTQnGKxPoVo6nLPJHuP3AOJB3Ms98H7P6wdJ7H4LuyVp+Lqok
 gSXoV+wJu0bX1t8oIj9CyrLn1k3KEt3ovWW+tvGEgLbqZdp8p2DPo+KtQ==
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


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that my Nintendo Wii doesn't boot with wii_defconfig plus
CONFIG_DEBUG_PAGEALLOC=3Dy and CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
on recent kernels. I get a splash like this one:

[    0.022245] BUG: Unable to handle kernel data access at 0x00006601
[    0.025172] Faulting instruction address: 0xc01afa48
[    0.027522] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.030076] BE PAGE_SIZE=3D4K MMU=3DHash PREEMPT DEBUG_PAGEALLOC wii
[    0.032917] Modules linked in:
[    0.034368] CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0-rc3-wii-00151-=
g9a634f40158a #1337
[    0.038318] NIP:  c01afa48 LR: c0195fd0 CTR: 00000000
[    0.040707] REGS: c0c15e78 TRAP: 0300   Not tainted  (5.1.0-rc3-wii-0015=
1-g9a634f40158a)
[    0.044531] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 84000844  XER: 00000000
[    0.047708] DAR: 00006601 DSISR: 40000000
[    0.047708] GPR00: c0919998 c0c15f30 c0bad460 c0bad434 00000000 00000000=
 00000000 01010101
[    0.047708] GPR08: 00000002 00000001 00000002 00000110 44000842 7b67efdb=
 b3a9f2fa 7763f327
[    0.047708] GPR16: f5bff97f 797ebc55 3aafa378 e76bacd3 af931fb0 00000000=
 013de444 00d009b0
[    0.047708] GPR24: c0951504 c0c30000 d3efdcc0 c0951504 c0951500 00000000=
 c0878fe0 c0878fe0
[    0.065470] NIP [c01afa48] fs_context_for_mount+0x8/0x1c
[    0.067988] LR [c0195fd0] vfs_kern_mount.part.6+0x24/0xb0
[    0.070540] Call Trace:
[    0.071699] [c0c15f40] [c019404c] get_fs_type+0x98/0x14c
[    0.074214] [c0c15f60] [c0919998] mnt_init+0x16c/0x264
[    0.076645] [c0c15f90] [c0919594] vfs_caches_init+0x7c/0x94
[    0.079283] [c0c15fb0] [c0900c34] start_kernel+0x41c/0x480
[    0.081878] [c0c15ff0] [0000346c] 0x346c
[    0.083731] Instruction dump:
[    0.085135] 7d005028 31080001 7d00512d 40a2fff4 2f9a0000 419e000c 387a00=
54 48195e99
[    0.088805] 935f000c 4bfffef4 9421fff0 7c852378 <80066601> 00725100 3880=
0000 38210010
[    0.092568] ---[ end trace 7373e1c0f977bdb3 ]---
[    0.094750]
[    1.083137] Kernel panic - not syncing: Attempted to kill the idle task!

(Without CONFIG_DEBUG_PAGEALLOC I haven't noticed any problems.)


'git bisect' says:

72f208c6a8f7bc78ef5248babd9e6ed6302bd2a0 is the first bad commit
commit 72f208c6a8f7bc78ef5248babd9e6ed6302bd2a0
Author: Christophe Leroy <christophe.leroy@c-s.fr>
Date:   Fri Apr 26 16:23:35 2019 +0000

    powerpc/32s: move hash code patching out of MMU_init_hw()

    For KASAN, hash table handling will be activated early for
    accessing to KASAN shadow areas.

    In order to avoid any modification of the hash functions while
    they are still used with the early hash table, the code patching
    is moved out of MMU_init_hw() and put close to the big-bang switch
    to the final hash table.

    Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>


I can revert this commit, and then 5.3-rc2 (plus a patchset adding a
serial driver) boot again.

Christophe, is there anything I should test in order to figure out how
to fix this properly?


Thanks,
Jonathan Neusch=C3=A4fer

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl1S3I8ACgkQCDBEmo7z
X9tbNg//Y+guvXw9Jz3+FL+p5afKYx7htYH2KwL5aoNfUZ28TKpsJ1jxuHYRw/zw
R+DXNo8iqqwNuSx/1yMNRMNZxJwU/fgYlNoXGi7Qo84vPf+kKA4xvhTtLr46tbny
5MCs3TXV0fSB6SCLdKSA0wBYtCSvIxkPPFdaJDMFBtsv7A+GDJT3B+isHNqDxoah
YXfmuwgGAV0mMUeds6mpsys/vkTPd3ZJ9TZ5dUCi4JIcflgHPauz7GW8N567/OLI
CvXp6ZES9S35nxQ4yRHdm1ZusmxGx49tTkLrCCECB/boE1pcG3BpYI7LMLD1EZmh
BKlOlwXhrx/BndHJ+prTgrJNggPmnErNlJA/EWwTgmd/LoCXkTIryybdrfGP2/HG
iLd4Q7/XA00/LF/ZBWWAfVOXmhHn3u/u1S5Vaz+L4LZT6QQ02O/oJPwHr+L9+MrL
+tLCj3GQJy2RzOYVnNBqAhhDvhBVrF/Oh3IiN0GvtoN7alr/N6PSeJmGTOGzqQaQ
10hcRrOO6OCe22cy//iepG/Y6VxAF+f8FkrsjzPuQbLZTbGZaR05EJXQ5CmGTN9M
ftVrmtECeDljFuNCNMRILPjLbrtolpDP5uPzThXhbs4ZvAo1g4mRN9tpP/7BGmTb
BPOnrY02rnQB0W2k+bJUYHqeIRzIc1fa4OKWYwYepQ0qT5W+pI0=
=6bYG
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
