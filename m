Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 913CF6BDA47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 21:39:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pczdj3Mzdz3cj9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 07:39:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tUxTjQkQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.35; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=tUxTjQkQ;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pczcr1ZvKz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 07:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678999124; i=markus.elfring@web.de;
	bh=yRVNOUfOjIhUPee+fsAseodxf2S6OlCum8nReJFE93E=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=tUxTjQkQ7qmrjjTm3Aw0xyEHhXJrTo5Q0Jpe8B+Lls4cEwMQFkFEmvFIOWRaybNEw
	 kD8G01jFz/Fqer7ZvR9zY3Tl8YyMUN25gjSzeisPRBC5F8JnOGE4sq0YLqo8+/xUJm
	 fX0MYZZ8v0IlIIFctUjPBg/NiRScBCnZxCKcJq1Igi6GPslTuv3X4jBxLeCAuvk3mA
	 pCzCHefJwFe1q+e4m/sPvcyIrKw4usgLkyxfwYacya0FRGUDxEkj4FQnJkVmt1N2na
	 yh/IQTHJCNtcsom9Ky/kwEVRQUewYG87PIkW5yQuzB7LogY/ITYJvMupmQDRrjmoys
	 rkv5CyzdE4Vag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQPZj-1ppjyW2Y3V-00MLmY; Thu, 16
 Mar 2023 21:18:13 +0100
Message-ID: <349247ba-a539-2a36-0371-93a8f59d2975@web.de>
Date: Thu, 16 Mar 2023 21:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 4/4] powerpc/4xx: Delete unnecessary variable initialisations
 in four functions
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
X-Provags-ID: V03:K1:v5sxuo7kDJ5P/yxyZ+V2WDJ7myWWQ9vYnkaF7vGJ9Yc7F09yr6H
 1Nk7mYpmcD19JSqxExH7u01veIt3FvRCZZUh2fOvgQ8U2HviY84gTDL3SDZAzWVTFBJwETo
 ggL/fjNKn4DG/1/XkX8P+pQ6I+hTBhsHW3lEB2S2n22ktWlFqcTUq94vXV+P4HStmT90bN+
 J8oXcs3FZrMOSTkstHQqQ==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:wOhVZOuePdk=;FRPb3rW6EGgP/qav5XR+fbvmv3QEQ
 KxbJefXXdZPd50GcqK4okf/GhK9pCmbxNG1vRtsVknsagr+yPGfRLwa5IUvb1Vxb+tnK7GMfz
 zUB6bmgSHUdgl2QRQ1kp0G5vol8feM0hMfNzEMCni0oo4WNQsgUsxLKM/BPFk/feEc2SlPyR7
 Cb7lYql3UKYQacvCP4g5Zj70QfdOjkXANfm7qyHz4roXRzPzO6pDQNPeoA3Djw2MEeid+WmcU
 noVmfvyales7VfC04LqG8EfHwFxPRZrLq8lN6g+KWKWUyXldPPhdjl+UNFNT9Unuazy/zxMQl
 +Mk2cgf6gtv1BQbcARf512RsK9zdy8OlMj3nFBxM1oNZN0FaCIXgtkY3Rb+987IWSrqhOQlok
 pB0zyAjAdS3BGuueCNFW3NVme6GdrXNHj/JzZkYu0B0hhJrthkq498VSPsTx28lx8dCM1j57g
 IL7jfjDM8PstGLNv4ADsHsPQy7P/W5SJbygxH0Vul6zKbnrNnwiFM4Mtr5VrZGZdC1qLn4XaG
 SQOzPcARcxnbASpHbJ0pt3ubcJw4Ix5izXPWIHxxkdjisyBt8gQ3/NLmSzSKequCgVX9BoiMP
 OMxC6RWVWlfSSn10LRZ0zRqtW6x4/awbA4DZwEYDSGb5KehwNaBibuHy36ws/wfDPMpDWJUye
 bbScx8tra3Bts49AsfXC+2wPojN2uzZgf4nYCUeXHAbhwKaoidInlB/JMI6hW2HBfjS1qTYUe
 RMfM4m7/HZE/u1ADzOlScDxJCx8fj5hTw9otKt7JzrgKyPd+VEwSxwf9ToHnoouwsFJ9x7R77
 zpCpHzKHd8C9Bkv1Ts0xd1VStV9/kXBH3uiOHFpnR98w68i9779V/EpiiHcEknmT21fEaznir
 BZ+zKdxlh5O4ABfJAa1ebyrzYkv0oNMVULdz5ykgjoBS9nTtg5RWIcmrhuLma0PML3gOxfeX1
 LGrS237xyx1iU8S66A8Y85TlE30Q5Ov1sH9ggrwfgDDRBo66isT19WDrSABHjHvuVmv86Z/5O
 ngRHyZnkhaAZbSgg=
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

Date: Thu, 16 Mar 2023 19:56:21 +0100

Some local variables will be set to an appropriate value before usage.
Thus omit explicit initialisations at the beginning of these functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
=C2=A0arch/powerpc/platforms/4xx/pci.c | 14 +++++++-------
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index 0c0848f0c819..ebc030e12663 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -323,8 +323,8 @@ static void __init ppc4xx_probe_pci_bridge(struct devi=
ce_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource rsrc_cfg;
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource rsrc_reg;
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource dma_window;
-=C2=A0=C2=A0 =C2=A0struct pci_controller *hose =3D NULL;
-=C2=A0=C2=A0 =C2=A0void __iomem *reg =3D NULL;
+=C2=A0=C2=A0 =C2=A0struct pci_controller *hose;
+=C2=A0=C2=A0 =C2=A0void __iomem *reg;
=C2=A0=C2=A0=C2=A0 =C2=A0const int *bus_range;
=C2=A0=C2=A0=C2=A0 =C2=A0int primary =3D 0;
=C2=A0
@@ -523,8 +523,8 @@ static void __init ppc4xx_probe_pcix_bridge(struct dev=
ice_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource rsrc_cfg;
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource rsrc_reg;
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource dma_window;
-=C2=A0=C2=A0 =C2=A0struct pci_controller *hose =3D NULL;
-=C2=A0=C2=A0 =C2=A0void __iomem *reg =3D NULL;
+=C2=A0=C2=A0 =C2=A0struct pci_controller *hose;
+=C2=A0=C2=A0 =C2=A0void __iomem *reg;
=C2=A0=C2=A0=C2=A0 =C2=A0const int *bus_range;
=C2=A0=C2=A0=C2=A0 =C2=A0int big_pim =3D 0, msi =3D 0, primary =3D 0;
=C2=A0
@@ -1403,7 +1403,7 @@ static struct ppc4xx_pciex_hwops ppc_476fpe_pcie_hwo=
ps __initdata =3D
=C2=A0static int __init ppc4xx_pciex_check_core_init(struct device_node *n=
p)
=C2=A0{
=C2=A0=C2=A0=C2=A0 =C2=A0static int core_init;
-=C2=A0=C2=A0 =C2=A0int count =3D -ENODEV;
+=C2=A0=C2=A0 =C2=A0int count;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0if (core_init++)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return 0;
@@ -1905,10 +1905,10 @@ static void __init ppc4xx_configure_pciex_PIMs(str=
uct ppc4xx_pciex_port *port,
=C2=A0static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_=
port *port)
=C2=A0{
=C2=A0=C2=A0=C2=A0 =C2=A0struct resource dma_window;
-=C2=A0=C2=A0 =C2=A0struct pci_controller *hose =3D NULL;
+=C2=A0=C2=A0 =C2=A0struct pci_controller *hose;
=C2=A0=C2=A0=C2=A0 =C2=A0const int *bus_range;
=C2=A0=C2=A0=C2=A0 =C2=A0int primary =3D 0, busses;
-=C2=A0=C2=A0 =C2=A0void __iomem *mbase =3D NULL, *cfg_data =3D NULL;
+=C2=A0=C2=A0 =C2=A0void __iomem *mbase, *cfg_data =3D NULL;
=C2=A0=C2=A0=C2=A0 =C2=A0const u32 *pval;
=C2=A0=C2=A0=C2=A0 =C2=A0u32 val;
=C2=A0
=2D-
2.39.2


