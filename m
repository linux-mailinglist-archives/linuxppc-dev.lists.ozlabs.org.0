Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737C6BD9ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 21:12:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pcz2C2BdTz3f56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 07:12:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=v8W0ye2f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.35; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=v8W0ye2f;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pcz1F5551z3cd5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 07:11:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678997455; i=markus.elfring@web.de;
	bh=NJehBpfANBOx/ezWyZUCAvWbKx1kcW7n4bvZoD8TpaQ=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=v8W0ye2fkugR4KgoOh9C4kdXIelfhmbRqeWLu9o27zkQ0a6wvBZXtZmI+/gw1Upwp
	 hR9Zy+aXAC7BefwNMzPDeV3mXz8vpW6J4nKryFAI8Q+m1c6/Msymldv+rNKDSvThNq
	 dyNNJ15rNqp9Zbii/uX6zzv1abBfEO5y7rOl65kFshDf2RPpto4qshF02EAHR1Bb0s
	 SQ0JemftNkm/ekVvYlwDOstoCIL2xz0JKQ3Iiry0MV1uqLyLVlxUMCm1QAsD7uX0x2
	 bknld3AOFXGG6/K9qjXDHQxaguYfic/KmZqO0hgZQZqsGYQPTwSiqd3jib6m+JmuNK
	 Ai9dTdz3ZcE8w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbTGt-1qEAUg2AlF-00bpK4; Thu, 16
 Mar 2023 21:10:55 +0100
Message-ID: <2e2fbd6f-e622-51b7-a19a-2662d8ca2d7f@web.de>
Date: Thu, 16 Mar 2023 21:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 1/4] powerpc/4xx: Fix exception handling in
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
In-Reply-To: <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AFPFzq0Hm3EampbJTO1eJVYq/TgVy94+UYS/xxmOuwBuye8QQtC
 wm1bNnk01LchWC7LsKHHHd8eeyyxt24VU+U/NugN+vVPVeBHp4rD6SLj/OqxfoCmYY9QHy9
 UidGfl0x69SE2CCUIhX9QjkK+TIjo7eAMKFm0V2g1VkUnvYVAAQ7hmCbTTVthvLp5N0T8dw
 XXgo0eGGxUTUpAIjVDf2w==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:LAZInxG/gXw=;emAv+Ik2TA2W2Joq7VsCNm2pjiSPt
 TmRShLIQ857l1AaALkhmRuRU3dyzOeHud9yDxCJv25WcZuFgjljtlbLubyIP4Z5IDwEKLf9tt
 PFIsUVgB/BsUo4B+TdpzcuH7+uINz3JcISG/09f7gUvRf0mqnmUP+bgf6gbpLkqjdmUnZoQBf
 gmkLUHxInC5Ka3bU0ehAGdZZsLBZHThopRpBE4go/ZEXaG09R1JtD9Em+cUPwO2l3tesGKkn2
 FugD9ZiRimJkoMxa5obmBcc0unKNxQu36Zjj/DM3J4P5zo62PCbjk7DSwce6Ctdxv+0jCYuBF
 i9M/MA6nB1T2wr41FbavCn7I9XGJQCBMW/9CSA2xT4bN3AzHr7Iozjcz6L1v/smdVqyDRwOtO
 A+A+OLBmuggULTdT6M6FO2XDj6pAeGeTUDSUpFlc0m1DBBxitr/pky4C7yWU+sRUNLaQ1RFpe
 dsOAEwSHHr7CIh46I6DaGL7jqXwyQjoFtU0GqgmmKZAPYaJde77E+8An2HDkKRAZULLDp4Ahh
 IX7qtJde5yrL2tmL/ii4SclEn4/fVv4ayYxgdlfGiUGWGmXEvjbxMiWHjclgnA/Ly+Kuj4nKY
 6oMAib6iYJ3bof4WBvE16Cnep5nXDG6E9x90zUrhzny5X3d9lPNACbTTsNVbJyMUpBhbG/dPu
 qjjMdbmfrxKqF3FwyctbNExptw3Xt9vQvOUhtUXUNPWKXaHELAyC/8uivZywQySGwirlIqcxg
 lVULjBl86WrYsiJv9jtNuGF8414PWSr59q/xNxjSzCwbQNxCVOIO0vyj3727PohVuHBbq36Qw
 bBO9VaF7Y8BFK0bY5dyMgQPvfoJzFR2LwZ59ToxpWy2i5VXPzY0vV22WZjZxNkkAr8BK5dg9d
 NC0JjJU8VVJc8UD2X9QyaL0Kr6BKbx8/2iMo10Dl3JneKTJcauNkwgTaXB34/AYbhTwUQDL6g
 ypOnpHcAmZ0wY2isJjGdXc0fartVufN7E9UJP5UNRW8f9k6DlTSlpNq3Hbww0kjB5w8/Fj95X
 YmW/jayRCvLX1FfU=
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
=C2=A0arch/powerpc/platforms/4xx/pci.c | 19 ++++++++++---------
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index ca5dd7a5842a..7336c7039b10 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1930,7 +1930,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
=C2=A0=C2=A0=C2=A0 =C2=A0/* Allocate the host controller data structure */
=C2=A0=C2=A0=C2=A0 =C2=A0hose =3D pcibios_alloc_controller(port->node);
=C2=A0=C2=A0=C2=A0 =C2=A0if (!hose)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* We stick the port number in "indirect_type" so=
 the config space
=C2=A0=C2=A0=C2=A0 =C2=A0 * ops can retrieve the port data structure easil=
y
@@ -1962,7 +1962,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (cfg_data =3D=3D NULL) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0printk(KERN=
_ERR "%pOF: Can't map external config space !",
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->node);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto free_contro=
ller;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0hose->cfg_data =3D cfg_data;
=C2=A0=C2=A0=C2=A0 =C2=A0}
@@ -1974,7 +1974,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
=C2=A0=C2=A0=C2=A0 =C2=A0if (mbase =3D=3D NULL) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0printk(KERN_ERR "%pOF: Can't m=
ap internal config space !",
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 port->node);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto recheck_cfg_data;
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0=C2=A0 =C2=A0hose->cfg_addr =3D mbase;
=C2=A0
@@ -2007,7 +2007,7 @@ static void __init ppc4xx_pciex_port_setup_hose(stru=
ct ppc4xx_pciex_port *port)
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Parse inbound mapping resources */
=C2=A0=C2=A0=C2=A0 =C2=A0if (ppc4xx_parse_dma_ranges(hose, mbase, &dma_win=
dow) !=3D 0)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto unmap_io_mbase;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Configure outbound ranges POMs */
=C2=A0=C2=A0=C2=A0 =C2=A0ppc4xx_configure_pciex_POMs(port, hose, mbase);
@@ -2064,13 +2064,14 @@ static void __init ppc4xx_pciex_port_setup_hose(st=
ruct ppc4xx_pciex_port *port)
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0return;
- fail:
-=C2=A0=C2=A0 =C2=A0if (hose)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0pcibios_free_controller(hose);
+
+unmap_io_mbase:
+=C2=A0=C2=A0 =C2=A0iounmap(mbase);
+recheck_cfg_data:
=C2=A0=C2=A0=C2=A0 =C2=A0if (cfg_data)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0iounmap(cfg_data);
-=C2=A0=C2=A0 =C2=A0if (mbase)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0iounmap(mbase);
+free_controller:
+=C2=A0=C2=A0 =C2=A0pcibios_free_controller(hose);
=C2=A0}
=C2=A0
=C2=A0static void __init ppc4xx_probe_pciex_bridge(struct device_node *np)
=2D-
2.39.2


