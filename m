Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D466C8F08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 16:42:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkNc85hHxz3fSq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 02:42:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IbqTVxsD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IbqTVxsD;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkNbB0Gzxz3cM3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 02:41:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679758850; i=markus.elfring@web.de;
	bh=vxJeVMuug3pta5u7U+BXQXjVk22xErBl9rDMN3Qsnmg=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=IbqTVxsDWkQtAsS5xiPwW2cSwzjbjC+b9AaNL/knLSQD7NtJAT2aayvuSSKNzy5hW
	 Rwdqv6E/v+ZD8e7KojBkN2y++qfOiQQVxvcEX8QbEBEo/tVzRy/kEj6irS8oOwXCfS
	 XlweOe0XVWvIRgidhN5bxu7CkoqJokia8WSgYgWqEKm23SzyQNTk6jnmENg5+xCRJ3
	 s2mNvMn2/NUngk6fkrNNpnKGMvWNq3gSkz+2hXSm4JfptlAn1r5sioGbS5Vc3WvGRe
	 Okf6NQ49Dh+9GivyJ/D2936uOMizFdQOnmaa5D8PJoGImDzAXTtA1UCwkWidE9XSgX
	 jPlywfFeWCe3g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPKB7-1ppmH91gRp-00PfCE; Sat, 25
 Mar 2023 16:40:50 +0100
Message-ID: <5b217de0-398c-c3d5-1c9b-07517ae610c9@web.de>
Date: Sat, 25 Mar 2023 16:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 3/4] powerpc/4xx: Fix exception handling in
 ppc4xx_probe_pci_bridge()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Boyer <jwboyer@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Stefan Roese <sr@denx.de>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
 <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
In-Reply-To: <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CB+IOdGg3hyFDo0PPlZl0Eb3klmpd1neqi1rUBroa/iLvc9FReg
 tULI/hUKDULarYls56l7VAI/xZ/y5x78LVpZl3NxX0UD/M3+xdJTT34UjK/YbqKvQXmTvyU
 S/Eko7uAlZvNQs+KnbOAOKKAN2OQiL37eF3zfrhWmBPeCoaeuWzX96YlWlHMdqI/TeRbaYi
 cgby7EIrzPc4Go6FyiWOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rrRdGlGaDII=;ROurm/cF+sUxkF2qEvPOMK8mRGU
 ntOlOlUjU3a5V+WwkhTicA2Uo4g27L+vTk4Ab1s+ZN1SEVROiR6KHSjgR1mr5mHfpzBDvFWME
 JRsDcuY9y0msTTV+r1jAtQNl79pCXHxWOfHW2QR6j5KQz6QMZ3ZdL/az3rspP5BBhzTraVAGH
 rYwmSOF0Aw6ktB2yU72Tb19CKYNKpFhd56O1bXETVLVae2bwRhoNc9d/VTvGcA391ZB9APVuD
 PHDLamZZtI/i1aar8yYZeWVK+D1fWqPiPImB+wN5JB2KrExCW9rPJ8Vn2QQCX9rMr82QGzne0
 I27lSG2DVA+34iCVapDWqPt+4NlD56w0+n3AZd4duAAqe5P26Uu4NZUeo2eou5buc73Hgc+Jr
 XJEt+ztYA3X3Uwjga7ob9pZNY+mkeTJ90ot8mMPLH6BC24YJXwtRZpEfC6YRyVHbBG8OK5X6u
 cEJqZ1uLJ06HhbFo5Fv8/d88Vmn6llyJLwfdKw9PVin1k6keaRrTJ6Y6SHA5sQMJDVZU2qwIK
 5t6Gosu9QcUalmYM3UYoaWUg+LpkNd3tP2vfGr6hS2igki4ffncJwOpGGeUPgIShq81Yi24zB
 EVUsH3Wy4VvzjFT1qf9k45cAF4nu+ZCMZmilIx0yUOGrBv8VesvYnVYrUX2rWuqOmRe6hl8hL
 xfLMMATud52eZHGz3cT7xiYS8c7C5DdblCcxsVvPP5+lTm9zxXGO5pB49lPm5jjdeJcsGuX/6
 vcicT72QvUJ3AuOBh6bO1zqLus8r+kFokQbwobSoy9iTFfZ8sY4Odm+zeckSH/CCWi9+OnxRw
 t+Qjc2F3mv+8ellCgU+SVTspmRdPVzKI2dOznxj4R8P2QMUile+AZVfZ2BTHNPRMLcl+vIFiX
 5sJkHLjdRrnFkzmnZZFt3Hdtzp0t2roxVCGPozceahOppeZ+YJC/DPv5B
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Date: Sat, 25 Mar 2023 15:56:09 +0100

The label =E2=80=9Cfail=E2=80=9D was used to jump to another pointer check=
 despite of
the detail in the implementation of the function =E2=80=9Cppc4xx_probe_pci=
_bridge=E2=80=9D
that it was determined already that the corresponding variable contained
a null pointer (because of a failed function call in two cases).

1. Thus return directly after a call of the function =E2=80=9Cioremap=E2=
=80=9D failed.

2. Use a more appropriate label instead.

3. Delete two questionable checks.

4. Adjust the exception handling for another if branch a bit more.

5. Remove a return statement at the end.


This issue was detected by using the Coccinelle software.

Fixes: c839e0eff500af03de65e560c2e21c3831586e6e ("[POWERPC] 4xx: PLB to PC=
I 2.x support")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
V3:
A closing parenthesis (which was overlooked somehow) was preserved
for an if statement.

 arch/powerpc/platforms/4xx/pci.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index fdf13e12ca9d..46ba0a4e5b04 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -358,13 +358,13 @@ static void __init ppc4xx_probe_pci_bridge(struct de=
vice_node *np)
 	reg =3D ioremap(rsrc_reg.start, resource_size(&rsrc_reg));
 	if (reg =3D=3D NULL) {
 		printk(KERN_ERR "%pOF: Can't map registers !", np);
-		goto fail;
+		return;
 	}

 	/* Allocate the host controller data structure */
 	hose =3D pcibios_alloc_controller(np);
 	if (!hose)
-		goto fail;
+		goto unmap_io;

 	hose->first_busno =3D bus_range ? bus_range[0] : 0x0;
 	hose->last_busno =3D bus_range ? bus_range[1] : 0xff;
@@ -383,8 +383,10 @@ static void __init ppc4xx_probe_pci_bridge(struct dev=
ice_node *np)
 	pci_process_bridge_OF_ranges(hose, np, primary);

 	/* Parse inbound mapping resources */
-	if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window) !=3D 0)
-		goto fail;
+	if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window)) {
+		pcibios_free_controller(hose);
+		goto unmap_io;
+	}

 	/* Configure outbound ranges POMs */
 	ppc4xx_configure_pci_PMMs(hose, reg);
@@ -393,14 +395,8 @@ static void __init ppc4xx_probe_pci_bridge(struct dev=
ice_node *np)
 	ppc4xx_configure_pci_PTMs(hose, reg, &dma_window);

 	/* We don't need the registers anymore */
+unmap_io:
 	iounmap(reg);
-	return;
-
- fail:
-	if (hose)
-		pcibios_free_controller(hose);
-	if (reg)
-		iounmap(reg);
 }

 /*
=2D-
2.40.0

