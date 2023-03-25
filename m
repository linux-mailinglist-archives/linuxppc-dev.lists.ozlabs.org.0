Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15636C8F06
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 16:39:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkNYH3Tmmz3fV3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 02:39:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SRkAEFE1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=SRkAEFE1;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkNXN5wqzz3cHm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 02:38:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679758709; i=markus.elfring@web.de;
	bh=kGVqaXqBe7nnB6KlTFMTxkDCEKhsqhrzx/0lrJqo6FI=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=SRkAEFE19ino1XyXXmRbFkJd+p2BVpGiAQDlVJMWn6YCUyUppESqUqk8Puh5Uqip7
	 FZyaYzKDw2Kbr5fKohkNdt1E0ipSJCLrJUHnSD0OBbi3GjDVdpryuhvfxshp3g/gmQ
	 okSwb2rEfs2BSsFu1IMigfBhdlM9pBMHQNa9mFS/cuAzXPCm+43gnMZJhIaxKYqTds
	 HgHDv809BlwZntZU5eUlBfdErUsqhJoMCpcT+tTsxf2JGcFVcL7L9WpOnT5ZdvBCUR
	 1hvjyQ6zNn5ZwRYoYmyNDUt6/dqmNZc/B2GNG/VUPG1tDzhqJnSZeyzA1Etxrt8mir
	 n3EyHdEyRCXEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MlLA1-1qKh2n3gL7-00lkOz; Sat, 25
 Mar 2023 16:38:28 +0100
Message-ID: <d4e1fd7e-7c14-b89f-9018-2f215ddb7cdd@web.de>
Date: Sat, 25 Mar 2023 16:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 2/4] powerpc/4xx: Fix exception handling in
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
 <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
In-Reply-To: <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FuJ2T36n5Mx4iRJoOQfcaoWMbaE4fTlrFjbB20unG49TrSc4NTj
 MyyEsvXkQd+8j61oHeKywsK4x5Azcp4yy4kHRqW6zCMkIEahYUDyl6L9DfQLroc01dtCFDu
 31gpx8yHcyvBiZvQGKYRYdE8axSYc0WmsJknlnEVe5h34r5noNW6RG9Ej3EDIviFJL8McAF
 A3fy68t+6C0nXFfyEcydQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fQblvlT0JS0=;yWi4bUsU6M0XMS6VtTspfVUjaMc
 q88oQs5i0Fowjyrdti5bBCLDAq2chg890SUXADWXlC8awrHONHCVDmrvEaWa7jumAZ61C+96M
 E57CO6eBCSgqdzZ64Ta/BDE8bCcan4D3Ir2Gnseq+vgY+SSWNPioryv8iiF41ZvZeNXIIubEz
 BcJfNs81JuIMsfAwuTYmOeOMTQPZF4ixz0f1Cbw0Nm8+hPushz/Bl0OdZsW5e5Gh0NcInZn42
 vu+agrZP447/L0E4+JddDooGq2UGPIqjXSnH7jRtCNUAn/hTwbF9GOyi+JRElktr/vdryGZeI
 6DfJ8suB96yC0ynIfWdWdsSkPn9Ephoyb+6BMvOQZi4Dtu9ehDpGgDegP9XtnhUPuMRZaNwAE
 99XBDBJyCo2sGm6iSKrCFqYK7UINNVzRtTGrmvFyCKSb+gVxkv13Axn4EYYNv0iOjKsOmQzQP
 6/n3GLACj209qm8X8eF8XCtZZuWq+o4XeiE5mQnWbVxcIPpTZtAha3w/NH5Sm6KXaHKQyxe/m
 7DKNUYaEwZsjB2zkTl98fojambJxjaqGJ1ijUjKeP32T4/40hRj6Jw+jQqk3Fsl1rC5dKCFen
 MEs+NvGP+RS//tsLQqxi95i+GViECllDf3HuC2OFpP40p+vO0IqkmSty5GlQXMn4BU8AV14UE
 fr0kP8zYcKCPg9hebjm9YpdJPY49YJOGPKjkKjehztogW/zDF7aLus9x3vshWihdhwb5vnEXb
 xj/oL+3QSCGuo1HjLFdnVioZ8wwBc/09F2HIK4V4Uaop04dIiNvgz14P7NV7hW16sG/lQyX07
 9CrwaFxTJiWAeGil+s9+DrSFP/cZnnU18HMWq93h8afC95aHjJWt9KG+HbItMLB3LyzisXL9g
 viPGNQ5SnWnRiLxVMZJC1hZM2+5I37IVVT4Mg8y4U/RNYhtkT8HpdJXGt
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
 arch/powerpc/platforms/4xx/pci.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index 7336c7039b10..fdf13e12ca9d 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -564,13 +564,13 @@ static void __init ppc4xx_probe_pcix_bridge(struct d=
evice_node *np)
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
@@ -595,8 +595,10 @@ static void __init ppc4xx_probe_pcix_bridge(struct de=
vice_node *np)
 	pci_process_bridge_OF_ranges(hose, np, primary);

 	/* Parse inbound mapping resources */
-	if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window) !=3D 0)
-		goto fail;
+	if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window)) {
+		pcibios_free_controller(hose);
+		goto unmap_io;
+	}

 	/* Configure outbound ranges POMs */
 	ppc4xx_configure_pcix_POMs(hose, reg);
@@ -605,14 +607,8 @@ static void __init ppc4xx_probe_pcix_bridge(struct de=
vice_node *np)
 	ppc4xx_configure_pcix_PIMs(hose, reg, &dma_window, big_pim, msi);

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

 #ifdef CONFIG_PPC4xx_PCI_EXPRESS
=2D-
2.40.0

