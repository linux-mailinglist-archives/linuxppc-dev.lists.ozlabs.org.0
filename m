Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1306BDA45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 21:37:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pczb10Jf9z3f4V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 07:37:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fsCsB/xy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.45; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fsCsB/xy;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PczZ65QMlz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 07:36:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678998984; i=markus.elfring@web.de;
	bh=wEB5ErETjmtlUGuUHVx9sABUc+9Jv6PEUoAIprRd7Fk=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=fsCsB/xyQYku6rIQzocNYY8nitDA+v9SDG2puVWbzrfrMtFVb9npyaCEkKzjXXyQX
	 33YvM0fExBThOZVVxRSkvU0cSOXqkGL9l5RTO3k+OyuuB2e6DjrQsVBYVmZa6k0i8S
	 0+wQRCoMcMzlPvzXNoBENo8T6Gm7/unJQMsx1vEbGivgK/7oq4RJ9Kpl2JESUDow8k
	 z6HxjQ/Ko16449E1DkWWUYXDAtPfHiQ8gxtdoBx+yKWFrJG9ErysX5C3tQd30F2k08
	 okxZfc0amgWyfqUl1e3/GIaYvvAz3yrd6/DtbShspnDDIwONzbJ6m5wBqzsfLNZREq
	 Cy3B4JxmDonRg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M4bUq-1pdSW62KJi-001pWF; Thu, 16
 Mar 2023 21:16:08 +0100
Message-ID: <4aa9785d-5992-91c0-c0ba-700192749f78@web.de>
Date: Thu, 16 Mar 2023 21:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 3/4] powerpc/4xx: Fix exception handling in
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
In-Reply-To: <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pWV71kn+c5dWxe51sgQahx/fm6J1XSXSZMsibRW9PN+PZ8Herh3
 AclVr+svcQxcHz5td5Qy4z+rYMf8uro3mfabBDgkpSnI6KLsOdBnBd5wi02pYqg8VYFfHDv
 TwYWWDHPB+qri9hVt9bOB3GTXlE2dk5gmFuSQacb85iruV/7STQP1wXhF1nOM+PNF8GRazH
 zV1iV+SO3/sg24xzup+hw==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:9kVJwgAcnB0=;IKNYr5CIVzcNpejTmGpz5L4ly2cQd
 mFUJuik5L1FR3yura230II+9X7Ehi8Qrq6RAl1ImkmpWDxPnFbFIBu6KGifaovV0ZzvvA0MbQ
 bREx9wvolEmUBPa+ocfJyPQDL72FzQ/AObU8TqaccVzpM33x2TW+XqPbrXlrdkEqJ+Mq8dZC9
 UXbyaxh/q6mMPKwoGy51gdAStGqANyg1gsl11OUQNId2WSnG8zmJAaQGIcKCsjq9x//lfX0ZD
 8giGJw1h7qtyrnQmWQWoFr/XAOq2lpow/o5Pl7tOF1/cqxsB7aVpAUjUjHIqwxDHgKw7Usn7q
 1d1NCDuJY3eJU1mUcCe7SxY912rvcoalWSRoyixtIB8xa52fgvQpAyjvbtSFZsKxpC5sV4BZd
 XwFb/xzgrPJAoQqwguMni/rM6qWwNFWJEwI3qciVV2MXadvt4aVakV3Hhg/SUwegod9t75+iU
 Gz9ErCN772yiuHnTsCsm3arVaUTK33z+q6k6Uq1l6PrQ9OeoStv2jTEoMcLbrIeFYDgFiraO6
 07q+kD04vlCLBw7HJvalnb/1cXsyfEUrJ06izW2XCjCJ42cQWBTcibJ5CHSEprhafxHRYtEO3
 86MwWdVdF8/aitVEymoWEK9w/+OEp7cc9N3Vu256+5QjHD4uALcSkPlOBa2dtRBL2in7b4gw8
 GRmDoBpGwW733J95qMTFMyWYA6cKLveiFXoqZfsx4grAHvCizOhIvbIms0PzBEoh66V4K6hI4
 zbI6v+6IcjGysIp4skeHRiYnXEPIv4Jcp6HbagERbVVKdBouq9K0Ay/czJfkDhNfqkh7MY0fm
 q3YJE0sSOjOeAFn5sc0L49MF8i0VyI5W0kEd3E+EBbpvgqBb+dP77+oYUKgwXAWjD+kwL57TG
 fIZwFJ5GYfJdKh4LjxJXKK1TTF89akj4LbsW4F2oGSckWCt17h6u6DDrklSgesikHppRlsHRm
 lvCK40vACTg+Sbq12PrlHuv+D5AqiW9dnSgafihLldmPSbDBFCrKP1i1IGGthaBb46ZiutkkF
 ccPgV4Qxg+6iyjlE=
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

Date: Thu, 16 Mar 2023 19:12:10 +0100

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
=C2=A0arch/powerpc/platforms/4xx/pci.c | 18 +++++++-----------
=C2=A01 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx=
/pci.c
index fdf13e12ca9d..0c0848f0c819 100644
=2D-- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -358,13 +358,13 @@ static void __init ppc4xx_probe_pci_bridge(struct de=
vice_node *np)
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
@@ -383,8 +383,10 @@ static void __init ppc4xx_probe_pci_bridge(struct dev=
ice_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0pci_process_bridge_OF_ranges(hose, np, primary);
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Parse inbound mapping resources */
-=C2=A0=C2=A0 =C2=A0if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window) !=
=3D 0)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto fail;
+=C2=A0=C2=A0 =C2=A0if (ppc4xx_parse_dma_ranges(hose, reg, &dma_window) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0pcibios_free_controller(hose);
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto unmap_io;
+=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0/* Configure outbound ranges POMs */
=C2=A0=C2=A0=C2=A0 =C2=A0ppc4xx_configure_pci_PMMs(hose, reg);
@@ -393,14 +395,8 @@ static void __init ppc4xx_probe_pci_bridge(struct dev=
ice_node *np)
=C2=A0=C2=A0=C2=A0 =C2=A0ppc4xx_configure_pci_PTMs(hose, reg, &dma_window)=
;
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
=C2=A0/*
=2D-
2.39.2


