Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D266C8F0A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 16:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkNf26rzZz3fVP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 02:43:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fM/nPMwJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fM/nPMwJ;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkNd81Bbyz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 02:42:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679758955; i=markus.elfring@web.de;
	bh=EoRziNXExaeEEA1SaFMevNWF4aSIGRCu/s2BvgBaahM=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=fM/nPMwJS7AvoJElbwIW0H0kCO4DdN/lLaveWbJuRh+qaymmU20G5jrRw09QCzLvT
	 FPRvXnmeHgv21IhhKka6aSBRfbLT68i2oh1CdngFRvgcXS1tAPxuVp3GSKQq2a57BU
	 Qv8Jn4bzHf5ECXE7QhVJ6d2vlCr5BJNHT8BwGk1j3jNFaE2bDD05ALA6Z2akSV6yvE
	 nrJTv0B/lMZn5rSYQQNaclLNET2X3GypE98dCdetmDAs1al3q5Kp+7oZJcnSRLh8S+
	 ShkGiuH6m4Xg6sIGm8IRKJSrLEhcVrpzf4E+FnlpDWddOQ5bLruZi10wdv06zprqSK
	 hMHBd597sijuA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9Zdw-1paZjT1ZAa-005Wwk; Sat, 25
 Mar 2023 16:42:35 +0100
Message-ID: <80830e38-7088-301a-58d7-7e3ec332f765@web.de>
Date: Sat, 25 Mar 2023 16:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 4/4] powerpc/4xx: Delete unnecessary variable
 initialisations in four functions
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
X-Provags-ID: V03:K1:XnYB/hZgRJooVzYgr6ZJry5EE5pKliLp8xmZtGZKqmXjJFgX2sN
 UpoQLGvjV6T0hgPS3CmxNhs5slzFs7chA2lAt9Avdn94ChMgIDKtFpRmlgzZBo+uQQ2dq92
 8SqWvPrDRqcXbs+H5Pn7yclkBJg4Jpsp1VyuYsPlbCdb45CL7zDHbSNimDzn6oJUsllxewW
 CoMhoZ+v9AXVD9naZr4Cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TXstjKGD8nI=;5IhciEE7zgUVH144yHI8O773sfI
 GJs3PWdGfovuMaFyVSAV+nGI3ngGmgmbzLFq+aZAWtxeZGsPFnM7qbOgpU6YfpARZCfbuK8CI
 WZorr1IEi+6imADHlGh7bO2061x3I/E7t1QmrYXjqYXtrnIB6Nt+D8dZffIJCelo5pOyXCZCc
 3HOzt+N44cjwDk2xx6i5jS3UDLuIS1Yoq6pkB019QoKHpmf8lu5R7r2DLDiygSngK8Uf4FDWJ
 T7R+Ytq8Ch5PB667X13gFRLnMD03FheE06HIJFeUNmb2GZjRt5kPmt7E6y6P8S2Rj0RCQYGdb
 es+UXSxA901aA5soMm31w/zkooJQP/jFz6nAv2fmXkKYeHTSNmja6+ftYIHOZ95k/6LCmN3to
 9yaIjymALOtQGF2vsEr1P4v6rCs4ts2sfuSzsFNni6orxXfYfnt4RtDJEgg67W5nTvUG3WRA7
 BzNGz9b7VBqMMqVwuVkGfitW2MgazYHRm0oU1FyD5TuXST3WSH7zIEaKsj0mT2SsMrU6HIqwM
 HDJqDAU3qcofmR41xM6sdnmDytxKZYigTk0KFklwvg8tA04zE71UIIwDB5AeEH78PAGsXztzj
 qRi3GW2UYDapY/qwH0ScDM8MILUa8lFcnc93pDug+6a9+iNtv2OH/f8qYeZAFLnSfsLPPySSP
 qjKXGCYHGt0Ogn2mFoUIzZ7GPd/ex4zdUelNplA57EmZi4h9OA2GFibXq3ZFlGlzx4TA3rsWP
 NLl0lVgpR9eVed/ONaDSupx2qtGmI2tIS5qwRqnyd/VcaBz2mgXBnEzhaBswJviG7pvaDaAV5
 TKHHQO3m/cwo9KCisE3Q9PST5aT/0n00Vq0hxwEl/UtsCOMTLV5SC2F4vVGWxz6IZ2NdV4b9g
 CHeCAtZmNq4UTNy9vPz/fPZ/+r6MVVy+jLWhT5BviZMJ2cf1nN2qfnDhk
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

Date: Sat, 25 Mar 2023 16:00:36 +0100

Some local variables will be set to an appropriate value before usage.
Thus omit explicit initialisations at the beginning of these functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/4xx/pci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index 46ba0a4e5b04..6fb7f9c966a6 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -323,8 +323,8 @@ static void __init ppc4xx_probe_pci_bridge(struct devi=
ce_node *np)
 	struct resource rsrc_cfg;
 	struct resource rsrc_reg;
 	struct resource dma_window;
-	struct pci_controller *hose =3D NULL;
-	void __iomem *reg =3D NULL;
+	struct pci_controller *hose;
+	void __iomem *reg;
 	const int *bus_range;
 	int primary =3D 0;

@@ -523,8 +523,8 @@ static void __init ppc4xx_probe_pcix_bridge(struct dev=
ice_node *np)
 	struct resource rsrc_cfg;
 	struct resource rsrc_reg;
 	struct resource dma_window;
-	struct pci_controller *hose =3D NULL;
-	void __iomem *reg =3D NULL;
+	struct pci_controller *hose;
+	void __iomem *reg;
 	const int *bus_range;
 	int big_pim =3D 0, msi =3D 0, primary =3D 0;

@@ -1403,7 +1403,7 @@ static struct ppc4xx_pciex_hwops ppc_476fpe_pcie_hwo=
ps __initdata =3D
 static int __init ppc4xx_pciex_check_core_init(struct device_node *np)
 {
 	static int core_init;
-	int count =3D -ENODEV;
+	int count;

 	if (core_init++)
 		return 0;
@@ -1905,10 +1905,10 @@ static void __init ppc4xx_configure_pciex_PIMs(str=
uct ppc4xx_pciex_port *port,
 static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port =
*port)
 {
 	struct resource dma_window;
-	struct pci_controller *hose =3D NULL;
+	struct pci_controller *hose;
 	const int *bus_range;
 	int primary =3D 0, busses;
-	void __iomem *mbase =3D NULL, *cfg_data =3D NULL;
+	void __iomem *mbase, *cfg_data =3D NULL;
 	const u32 *pval;
 	u32 val;

=2D-
2.40.0

