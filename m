Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1A56C8F03
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 16:37:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkNW13Mc9z3fTT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 02:37:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IFfqcAnB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=IFfqcAnB;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkNV34N8Gz3cHm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 02:36:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679758582; i=markus.elfring@web.de;
	bh=3T3x2IiqtePG6a2K2YwrZN0zdBtVdk10Z/2w/+1ZNX8=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=IFfqcAnBptR45OruH46cjNFBy9TnpqO2/+0uYI2nbggCjqq6LZqAq6/iRJZ13BSWO
	 TfKpepyr2ibZ8X9/SebJau2ztI9ORLhuPCnnH9a+LjMi3o5WxEjkMDXZY0nvLma2IS
	 JOiN593yefpPP6e2e4MxQWujtrM0V7IKOZpbpMbZli2C1Lkoc/OL60KDHY/PHKW1zz
	 FENZ8h5iB52s2zypKhG9opV/grXjAUyv9se36TEE6oW1HtyWc6ojdc6JVoTDbnI7fh
	 J+JTSuFJ2hmq9ypgbGn9JUvq2EGAsRISldVszUJW8pyESnOkq1PXSvnNxZIuihZRlJ
	 8WLtSTulercdQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnG2C-1qN9us2BAS-00jHDw; Sat, 25
 Mar 2023 16:36:22 +0100
Message-ID: <e68a714b-32f2-de9f-066e-99a3f51a264f@web.de>
Date: Sat, 25 Mar 2023 16:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 1/4] powerpc/4xx: Fix exception handling in
 ppc4xx_pciex_port_setup_hose()
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
X-Provags-ID: V03:K1:ktlSQ5xHwcIT9HhmqAcovoQ6C+E1PCS8pcrBNmY/zwI3O0DE6kp
 fbFTLAvYePWbZt/Pq8SVkSs2sT6nRsL0QIs3LgR6IObXvnX38qwcuRwmeE2+haB8ysYUuq7
 WXQFADTm6n5evGFpxvYbhrBa2uTdLtFQUKZOUqT2dFlRoAf6l0NYNDEK/rTC2IDHmMh14BG
 YaDbNeElwWVPsVwGSsWUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vs4lXJFFUoQ=;vaUVJv0AaACH4LlSg7rQ0M/GepR
 y6XMdPCXTDoNeLUiAzTt4jPbAvkfUc0BGO1i7LYzzpnx7/nDX6KahYMy50hWapK+83tmGYZhk
 uAKx/yEpSyGz6cgNjxrV9W/bCO0BmPRqwpghVnVtwlZxSP7fWd928fmtQV4hZyumR01vIeL9C
 FsKmlLRiDBScEch5QEPazr30RtO5qbwPme/6djmCd7lKSn8gNaiKnNjiP8oRuGe7cjz1inDf1
 /WUlIdpE1SVEb1zSkduBpxYDX2vTKOjXyns6ycNdnxFfBoj7VqIcvn/iBTqujXyXuVnpEigcX
 DxIJAJ2WQ0j5qqkY3AgPjb/qhpZkgHuh63vsg7kjku429kAIFH93S3XaUHKk0rqPTWFAW/NoH
 AuC3InyCHXZ0NNT9obi+Dbb23/iWLJdWJGNgpA1q2l4y6t396Esv3bQZNkJIVCADQ6Q5hdKlA
 x0UuO17Tc8pb87QbBrOa0sRXXJ0oI1K3vPwKnL5X1gIh+F8Oq8xFsEU4brjfBzUHpboCmpvij
 NJGELK42/dtHfuj4TqJlFGlY0J1H7PpADn6CRfFJILUkSdXaN1DIs9eeNv2RBucuR3vZlpDrn
 u6PDDzPryV74Dy0hTmJQxtY9WZkLttnNc0SY/zDJfNfCRQ230/0l+pwdrBmeBQZhW8G5dGFh+
 dR4xkeZjG9y5EqsAYYctP4DxDIaa8uqzoKMZ986Sb45j8FVly0ANwm54Dh/QnHRbhcrh0YoCt
 yO6iI2lLaRFdcN6YtqRKMcwl+mXM8CgGB+yJ4/kPAMz19pBSH1pyqBpdMtihWtbMWPxfKg4UV
 mM4cnBbOK9uoaSrPHNlnNjRtS7vnr9xuHpeY4z6WnLn2jXXNxtAZwz3AiOy35w7zNMc4Drg1f
 Orqxra6mc+PcR1hOp/i6NfSJRZN0Q1TtfER5/gCBhuT0yMNN8Ryil1ylu
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

Date: Thu, 16 Mar 2023 19:00:57 +0100

The label =E2=80=9Cfail=E2=80=9D was used to jump to another pointer check=
 despite of
the detail in the implementation of the function =E2=80=9Cppc4xx_pciex_por=
t_setup_hose=E2=80=9D
that it was determined already that the corresponding variable contained
a null pointer (because of a failed function call in three cases).

1. Thus return directly after a call of the function =E2=80=9Cpcibios_allo=
c_controller=E2=80=9D failed.

2. Use more appropriate labels instead.

3. Reorder jump targets at the end.

4. Delete two questionable checks.


This issue was detected by using the Coccinelle software.

Fixes: a2d2e1ec07a80946cbe812dc8c73291cad8214b2 ("[POWERPC] 4xx: PLB to PC=
I Express support")
Fixes: 80daac3f86d4f5aafc9d3e79addb90fa118244e2 ("[POWERPC] 4xx: Add endpo=
int support to 4xx PCIe driver")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/4xx/pci.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index ca5dd7a5842a..7336c7039b10 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1930,7 +1930,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
 	/* Allocate the host controller data structure */
 	hose =3D pcibios_alloc_controller(port->node);
 	if (!hose)
-		goto fail;
+		return;

 	/* We stick the port number in "indirect_type" so the config space
 	 * ops can retrieve the port data structure easily
@@ -1962,7 +1962,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
 		if (cfg_data =3D=3D NULL) {
 			printk(KERN_ERR "%pOF: Can't map external config space !",
 			       port->node);
-			goto fail;
+			goto free_controller;
 		}
 		hose->cfg_data =3D cfg_data;
 	}
@@ -1974,7 +1974,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
 	if (mbase =3D=3D NULL) {
 		printk(KERN_ERR "%pOF: Can't map internal config space !",
 		       port->node);
-		goto fail;
+		goto recheck_cfg_data;
 	}
 	hose->cfg_addr =3D mbase;

@@ -2007,7 +2007,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)

 	/* Parse inbound mapping resources */
 	if (ppc4xx_parse_dma_ranges(hose, mbase, &dma_window) !=3D 0)
-		goto fail;
+		goto unmap_io_mbase;

 	/* Configure outbound ranges POMs */
 	ppc4xx_configure_pciex_POMs(port, hose, mbase);
@@ -2064,13 +2064,14 @@ static void __init ppc4xx_pciex_port_setup_hose(st=
ruct ppc4xx_pciex_port *port)
 	}

 	return;
- fail:
-	if (hose)
-		pcibios_free_controller(hose);
+
+unmap_io_mbase:
+	iounmap(mbase);
+recheck_cfg_data:
 	if (cfg_data)
 		iounmap(cfg_data);
-	if (mbase)
-		iounmap(mbase);
+free_controller:
+	pcibios_free_controller(hose);
 }

 static void __init ppc4xx_probe_pciex_bridge(struct device_node *np)
=2D-
2.40.0

