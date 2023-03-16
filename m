Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11366BDA3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 21:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PczY244N1z3f4w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 07:35:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BJz5lzuJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.45; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BJz5lzuJ;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PczX800B8z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 07:34:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678998876; i=markus.elfring@web.de;
	bh=kRXnLO2ui0IMpfiwle1MqHNK3tspqGWzZeAWDMFraSw=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=BJz5lzuJ3qB5keYHNOeuvhlrXN16lNaWtfSCAOILB05SVlaYb7ajzIAOh4nKeFQve
	 JI4CPEG8S6+zFuRmhEznKP+CeKejwdrs8eNrovdUt/dxDaEvXh1eyd6EEX21QOBOTJ
	 undeOpZGL4uY5MIlmLZcmXG268CVruqLUmw6vJZX3ABgmhViXTA7vYk2VaaBFzMWZC
	 NAbHd1dJDkTUCJRaRYJUrYSfbgNgrvSDPq/Vuq2HbTgO00zjRm/pVhvnbOehJFNSDe
	 9oBzMOxpP2rpH92IJBA4gnbal2xWmmPbTcDjE177w2V9s03VOYwuC2Sehq7Yb9x72G
	 D33Bl1uaBEojA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJFhJ-1pvnmc23kh-00Ks64; Thu, 16
 Mar 2023 21:14:17 +0100
Message-ID: <1f1a8941-88a8-b2fa-b186-4e57e6809a10@web.de>
Date: Thu, 16 Mar 2023 21:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 2/4] powerpc/4xx: Fix exception handling in
 ppc4xx_probe_pcix_bridge()
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
In-Reply-To: <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W/SenVddO6zSi7R7Rvoxm8cJ3SoVMgH9Af2rTLPqG2yFnxWq16L
 lALK3qEjWhNkMr5Q+bZCVasFyA+Lu61a8VkpmFv4ko6aYzkQtGFta3Q15GKRhfwlW+qwpLm
 eTV9O3Run/B89N2pdscJ5zp/HKgmy/L7B1Lz+Eh4zhckFTWITYE4H3zoXNKTwBLVW0FoGlR
 6UWQ6XmM+Qc+qrXo4e5zw==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:Z7mm6Z7MOpM=;TF3t44fexcsM8LrgNc6WC8u3zaNcR
 kZOtg+30WtX9vRYjI7kfh2ywRiQSFVoYVrZga/y4GZmivLPh9jlUhvCjE23+297RfAODpQc9T
 fjZGkkccMsXdJSfFXUaQ1xjCidjt5/i53/g1bEItRblMaXkAo+t+fRkAo3wUzjJR1fgpV8gTN
 7YHqJ04xbBsbyXg9A+bYORPR6lUWUn55u0umnN3e/okjC0afvLm5sI2hI7eOfqzy/kecRze5e
 sOyj0o4pOq5DkRRlJGlegf5yrNCggADHF9nmiTJhx9mD+p5uqLLbVmTEQVdAYUnudybn6gnLQ
 tTmmnLmX8pNBUaa3I/SeFfuuHZVA4v1/BBRypqbSaJoJs1MBeEWR01Z8zjLlE8TWv+Zu0BtGk
 fmJCoRxal2ipMKDQo1k+vGQcAmnbjfCkZnO75lbnhMPJqcgA7zzDuKbs+U9P8tcfWJsi/o3qV
 lzGeAxNwMLrhHDD+cXq6O+QOMkX1uIyF/ynVSH1PvEX3J5j7Qwz/nMYxkjoIWAc38mJvPvJer
 jzFHSr4mhJdPfVTANjF870TRZQEa6AzdknVp6hv8hi5suQuZjt9lYpZ47G35E/zgmAt8bcFt0
 Qb9f6KKzh/NxAND9F1JExxrd8ifh/pr0fwMBALq+aMAe6tZx2aaZScBl3O9oTpnfKL5IRQj4b
 JpB0Ne49bna3Z51EFRRNCa0Zaj7RmTWnjCViEq8EjNOEDWH3edahHjmKFBuhKRcRo8Z4YKaCE
 dD7JyAUzT0wOgW6UIk8zpX2yEK/cbVPrghzJO806f+q9I76VrTEPlbewkHQKh7jp7mQ/w+AAm
 BbXAKcBKBwDGIXhgQuTh+fb4lUWgy9wBPZZAoTQsvfNYPOKo1cSiRPx/QAjuuzCb9Bh2hNKNN
 9VfzbDkGfZMTByJrk9T1+NzwD7vEoOHoH1M27Mj9lF6DywiC6+Y5jQ5SPlcVMnG7lvPhI0k3R
 6HUD++/Omwmyo0vwYzeGysC83PQ3wOBZtyYLMPjtKNpfzdeZX0mLa0bPEx4r7NPB6tzfcJdxq
 wujJwdfSs4M2YhW8=
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

Date: Thu, 16 Mar 2023 19:09:33 +0100

The label =E2=80=9Cfail=E2=80=9D was used to jump to another pointer check=
 despite of
the detail in the implementation of the function =E2=80=9Cppc4xx_probe_pci=
x_bridge=E2=80=9D
that it was determined already that the corresponding variable contained
a null pointer (because of a failed function call in two cases).

1. Thus return directly after a call of the function =E2=80=9Cioremap=E2=
=80=9D failed.

2. Use a more appropriate label instead.

3. Delete two questionable checks.

4. Adjust the exception handling for another if branch a bit more.

5. Remove a return statement at the end.

This issue was detected by using the Coccinelle software.

Fixes: 5738ec6d00b7abbcd4cd342af83fd18d192b0979 ("[POWERPC] 4xx: PLB to PC=
I-X support")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
=C2=A0arch/powerpc/platforms/4xx/pci.c | 18 +++++++-----------
=C2=A01 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index 7336c7039b10..fdf13e12ca9d 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -564,13 +564,13 @@ static void __init ppc4xx_probe_pcix_bridge(struct d=
evice_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0reg =3D ioremap(rsrc_reg.start, resource_size(&rs=
rc_reg));
=C2=A0=C2=A0=C2=A0 =C2=A0if (reg =3D=3D NULL) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0printk(KERN_ERR "%pOF: Can't m=
ap registers !", np);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return;
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Allocate the host controller data structure */
=C2=A0=C2=A0=C2=A0 =C2=A0hose =3D pcibios_alloc_controller(np);
=C2=A0=C2=A0=C2=A0 =C2=A0if (!hose)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto unmap_io;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0hose->first_busno =3D bus_range ? bus_range[0] : =
0x0;
=C2=A0=C2=A0=C2=A0 =C2=A0hose->last_busno =3D bus_range ? bus_range[1] : 0=
xff;
@@ -595,8 +595,10 @@ static void __init ppc4xx_probe_pcix_bridge(struct de=
vice_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0pci_process_bridge_OF_ranges(hose, np, primary);
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Parse inbound mapping resources */
-=C2=A0=C2=A0 =C2=A0if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window) !=
=3D 0)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window)) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0pcibios_free_controller(hose);
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto unmap_io;
+=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Configure outbound ranges POMs */
=C2=A0=C2=A0=C2=A0 =C2=A0ppc4xx_configure_pcix_POMs(hose, reg);
@@ -605,14 +607,8 @@ static void __init ppc4xx_probe_pcix_bridge(struct de=
vice_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0ppc4xx_configure_pcix_PIMs(hose, reg, &dma_window=
, big_pim, msi);
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* We don't need the registers anymore */
+unmap_io:
=C2=A0=C2=A0=C2=A0 =C2=A0iounmap(reg);
-=C2=A0=C2=A0 =C2=A0return;
-
- fail:
-=C2=A0=C2=A0 =C2=A0if (hose)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0pcibios_free_controller(hose);
-=C2=A0=C2=A0 =C2=A0if (reg)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0iounmap(reg);
=C2=A0}
=C2=A0
=C2=A0#ifdef CONFIG_PPC4xx_PCI_EXPRESS
=2D-
2.39.2


