Return-Path: <linuxppc-dev+bounces-17001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPWSBIwmmmnfZAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 22:41:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A316DF3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 22:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJLCr4Qnlz2xNT;
	Sun, 22 Feb 2026 08:41:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771694378;
	cv=none; b=P1/O3+XesQLKLOPCg/er2/5MK81lNqD4kzHTCEBwGUxTEA0xFdHyPx46bLtFrd9hmIIyjT7ZeA/TYNL4474vC5J5bW75xoG8siYB/X7lxB5xfBxVZoMqqTEvtkjUoT6ZysF1vbvVrwcGSWVP/keKoS/ULyIOY8SueAE/RL0iOfBzAHy37s7jfdZWmXUMTZlOVvlzim8oAxZk6s1A0NDH+OWF8DZfsF8nox0bzPimeh3PZz9w7V0IEH7MgrqrZUn/MDAENtyHimtZnoBB9rDpkR8hVXufwCzSYn0MP6gZ8VzlaOcRlg1XAkNAFNuUqzM+Fnr//H7CYtyHFnv2cuQ1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771694378; c=relaxed/relaxed;
	bh=dzEqgpRvX92Ph1mNyD7O8NkYWIGFUBJuEdNn1cp7f10=;
	h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:
	 In-Reply-To:Cc:To:References; b=De/Xgcuz9WVr3/rTtNBW4ZH1KXmk+aV6IpdtZc/XlasLPaRo6Tyj+RkzcDJ20/5U4BRrXxo0rmkZBDRjb3MGzyGzFIpyZzF1prINuTKNUYiW03ogqBXoC9q4MittOX02eeTKQAy4oW06Ntf9UJru6CEO05p6ETcF4O3EyoM4Pp/LGpOz2HWdWwAn+D2QLxCz5kFgq0EV6y0VVZXvxwzMQROHqckWVBDp0h5jfaOVJj/0m0u5evaqOTe8wxIWuuAT8O1eZ84fkZglqFXMh+kuD+M28qQw8prkhEoJGJg9aUfisBlcJ989wyM4hsJghG1X/7o5xKDR+mzaZBim1Ff7pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.25; helo=cstnet.cn; envelope-from=gaohan@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.25; helo=cstnet.cn; envelope-from=gaohan@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJDPj0X3Tz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 04:19:36 +1100 (AEDT)
Received: from smtpclient.apple (unknown [58.38.117.196])
	by APP-05 (Coremail) with SMTP id zQCowADXaQ0b6Zlp9bfQCA--.52886S2;
	Sun, 22 Feb 2026 01:19:24 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Message-Id: <D46A040A-F4BE-4540-9896-A557DF74DE50@iscas.ac.cn>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_2974C493-A06E-4DEE-BFCF-9B1CAEF6116E"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCHv2 2/2] sparc/pci: Initialize msi_addr_mask for OF-created
 PCI devices
Date: Sun, 22 Feb 2026 01:19:13 +0800
In-Reply-To: <20260220070239.1693303-3-nilay@linux.ibm.com>
Cc: Han Gao <gaohan@iscas.ac.cn>,
 linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org,
 sparclinux@vger.kernel.org,
 wangruikang@iscas.ac.cn,
 tglx@kernel.org,
 maddy@linux.ibm.com,
 mpe@ellerman.id.au,
 npiggin@gmail.com,
 chleroy@kernel.org,
 gjoyce@ibm.com,
 helgaas@kernel.org,
 davem@davemloft.net,
 andreas@gaisler.com,
 "Han Gao (Revy)" <rabenda.cn@gmail.com>
To: Nilay Shroff <nilay@linux.ibm.com>
References: <20260220070239.1693303-1-nilay@linux.ibm.com>
 <20260220070239.1693303-3-nilay@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.400.21)
X-CM-TRANSID:zQCowADXaQ0b6Zlp9bfQCA--.52886S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1fKrWktF17Zr4rAryfXrb_yoW8Aw18pr
	Z7uFn5KrWUt347Ga98A3WUZFyjqan8u343XrZ8Kw1Iqry09r10vrnrWryjkrWUXrsaka1F
	va9Yv3yUXw1DG3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0E
	x4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI
	8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l7480Y4vEI4kI2Ix0
	rVAqx4xJMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRi-txDUUUUU==
X-Originating-IP: [58.38.117.196]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAUFDGmZycsguAAAsq
X-Spam-Status: No, score=-0.0 required=3.0 tests=HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17001-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[gaohan@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:gaohan@iscas.ac.cn,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:sparclinux@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:helgaas@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:rabenda.cn@gmail.com,m:nilay@linux.ibm.com,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[iscas.ac.cn,lists.ozlabs.org,vger.kernel.org,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaohan@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1E2A316DF3C
X-Rspamd-Action: no action


--Apple-Mail=_2974C493-A06E-4DEE-BFCF-9B1CAEF6116E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Tested and passed on SPARC Enterprise T5220.=20

Without this patch, the e1000e would use intx.

Tested-by: Han Gao <gaohan@iscas.ac.cn> # on SPARC Enterprise T5220

> On Feb 20, 2026, at 15:02, Nilay Shroff <nilay@linux.ibm.com> wrote:
>=20
> Recent changes replaced the use of no_64bit_msi with msi_addr_mask,
> which is now expected to be initialized to DMA_BIT_MASK(64) during PCI
> device setup. On SPARC systems, this initialization was inadvertently
> missed for devices instantiated from device tree nodes, leaving
> msi_addr_mask unset for OF-created pci_dev instances. As a result,
> MSI address validation fails during probe, causing affected devices
> to fail initialization.
>=20
> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
> of_create_pci_dev() so that MSI address validation succeeds and PCI
> device probing works as expected.
>=20
> Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag =
to a DMA address mask")
> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
> ---
> arch/sparc/kernel/pci.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index b290107170e9..a4815d544781 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -355,6 +355,13 @@ static struct pci_dev *of_create_pci_dev(struct =
pci_pbm_info *pbm,
> 	dev->error_state =3D pci_channel_io_normal;
> 	dev->dma_mask =3D 0xffffffff;
>=20
> +	/*
> +	 * Assume 64-bit addresses for MSI initially. Will be changed to =
32-bit
> +	 * if MSI (rather than MSI-X) capability does not have
> +	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> +	 */
> +	dev->msi_addr_mask =3D DMA_BIT_MASK(64);
> +
> 	if (of_node_name_eq(node, "pci")) {
> 		/* a PCI-PCI bridge */
> 		dev->hdr_type =3D PCI_HEADER_TYPE_BRIDGE;
> --=20
> 2.52.0
>=20
>=20


--Apple-Mail=_2974C493-A06E-4DEE-BFCF-9B1CAEF6116E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dus-ascii"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><div><p style=3D"margin: 0px; =
font-width: normal; font-size: 13px; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;; font-size-adjust: none; font-kerning: auto; =
font-variant-alternates: normal; font-variant-ligatures: normal; =
font-variant-numeric: normal; font-variant-east-asian: normal; =
font-variant-position: normal; font-feature-settings: normal; =
font-optical-sizing: auto; font-variation-settings: normal;">Tested and =
passed on SPARC Enterprise T5220.&nbsp;</p>
<p style=3D"margin: 0px; font-width: normal; font-size: 13px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
font-size-adjust: none; font-kerning: auto; font-variant-alternates: =
normal; font-variant-ligatures: normal; font-variant-numeric: normal; =
font-variant-east-asian: normal; font-variant-position: normal; =
font-feature-settings: normal; font-optical-sizing: auto; =
font-variation-settings: normal; min-height: 15px;"><br></p>
<p style=3D"margin: 0px; font-width: normal; font-size: 13px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
font-size-adjust: none; font-kerning: auto; font-variant-alternates: =
normal; font-variant-ligatures: normal; font-variant-numeric: normal; =
font-variant-east-asian: normal; font-variant-position: normal; =
font-feature-settings: normal; font-optical-sizing: auto; =
font-variation-settings: normal;">Without this patch, the e1000e would =
use intx.</p>
<p style=3D"margin: 0px; font-width: normal; font-size: 13px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
font-size-adjust: none; font-kerning: auto; font-variant-alternates: =
normal; font-variant-ligatures: normal; font-variant-numeric: normal; =
font-variant-east-asian: normal; font-variant-position: normal; =
font-feature-settings: normal; font-optical-sizing: auto; =
font-variation-settings: normal; min-height: 15px;"><br></p>
<p style=3D"margin: 0px; font-width: normal; font-size: 13px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; =
font-size-adjust: none; font-kerning: auto; font-variant-alternates: =
normal; font-variant-ligatures: normal; font-variant-numeric: normal; =
font-variant-east-asian: normal; font-variant-position: normal; =
font-feature-settings: normal; font-optical-sizing: auto; =
font-variation-settings: normal;">Tested-by: Han Gao &lt;<span =
style=3D"color: rgb(21, 154, 255);">gaohan@iscas.ac.cn</span>&gt; # on =
SPARC Enterprise T5220</p></div><div><br><blockquote type=3D"cite"><div>On=
 Feb 20, 2026, at 15:02, Nilay Shroff &lt;nilay@linux.ibm.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><div>Recent =
changes replaced the use of no_64bit_msi with msi_addr_mask,<br>which is =
now expected to be initialized to DMA_BIT_MASK(64) during PCI<br>device =
setup. On SPARC systems, this initialization was inadvertently<br>missed =
for devices instantiated from device tree nodes, =
leaving<br>msi_addr_mask unset for OF-created pci_dev instances. As a =
result,<br>MSI address validation fails during probe, causing affected =
devices<br>to fail initialization.<br><br>Initialize =
pdev-&gt;msi_addr_mask to DMA_BIT_MASK(64) in<br>of_create_pci_dev() so =
that MSI address validation succeeds and PCI<br>device probing works as =
expected.<br><br>Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean =
no_64bit_msi flag to a DMA address mask")<br>Signed-off-by: Nilay Shroff =
&lt;nilay@linux.ibm.com&gt;<br>---<br> arch/sparc/kernel/pci.c | 7 =
+++++++<br> 1 file changed, 7 insertions(+)<br><br>diff --git =
a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c<br>index =
b290107170e9..a4815d544781 100644<br>--- =
a/arch/sparc/kernel/pci.c<br>+++ b/arch/sparc/kernel/pci.c<br>@@ -355,6 =
+355,13 @@ static struct pci_dev *of_create_pci_dev(struct pci_pbm_info =
*pbm,<br> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>dev-&gt;error_state =3D pci_channel_io_normal;<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>dev-&gt;dma_mask =3D 0xffffffff;<br><br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/*<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * Assume 64-bit addresses for MSI initially. Will be changed to =
32-bit<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> * if MSI (rather than MSI-X) capability does not have<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * =
PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
*/<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>dev-&gt;msi_addr_mask =3D DMA_BIT_MASK(64);<br>+<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(of_node_name_eq(node, "pci")) {<br> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* a PCI-PCI bridge */<br> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>dev-&gt;hdr_type =3D PCI_HEADER_TYPE_BRIDGE;<br>-- =
<br>2.52.0<br><br><br></div></div></blockquote></div><br></body></html>=

--Apple-Mail=_2974C493-A06E-4DEE-BFCF-9B1CAEF6116E--


