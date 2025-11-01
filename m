Return-Path: <linuxppc-dev+bounces-13651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72532C27930
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 08:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cz95Z08GWz3bcf;
	Sat,  1 Nov 2025 18:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761983473;
	cv=pass; b=eg/4YLYwVue1Fu7eEP8k16pFHmT9rWnbqFqqkSr4AAUXJDl4HE/Dl1SNvB/ziZC3XnheuIqA1WX78oIqpUHa/W5GHqUOZa8QVD/yC3wgAqWxZ/PPtA3nUY7A9EVC2/EpShVHEAhaMnJxKfDgKXL9B6ki8JA4zwTp2cZpAlGColyd4TjG7P8qCiOIMf0HpXmMqiT8Yfx0i8QA0QcGzuZZoq5ZBQBZuGr7m6Vt1QbZFAiCrax4BMzypStOiN7gUhpIOykhQFakirwQMKqGdJGX7C+Z5AKTi4RiDaj+3u+rtXTFNVF662Ae96rwfQK0zmcZ1xlYbXVvmxpGYONFPkb5/A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761983473; c=relaxed/relaxed;
	bh=1poCaNFvyyPJmxRrJBkXnU/2/R3LB0yNi4W+8Zu9x9Q=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=fTVoeJFlTH4DS+dz4eoeHSRyTYZr3dM2s1QxzbGw2BZP9KGJv7D3oBEkm9Swjh+CZSxPMgbbkO8I/Ci/hS98CPHgVeFmGnYcy+6MgvoFlmK2P3Kl0+Q0sbDNjRAeUb5XUbiY6Rl/OXHcIAkhiYVj1eETsOJrHIb/EuOyV8skAWN4tv+S8nwtsROunlfXwQE2RrIimeOsHLh6BFJtmiKF6ROk1rJPwFL0MNFmq7nfEjuvYiVjI99ugcIEd5AmDPtwv8Ik1BicF69sbd16cFUzST/L21Gaje3/o8Avb9pZ+UwtXAfT67ItDJF1kRPDccxmm/1Ii68zgOszpglewhgF8w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=l0M3Nc99; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=l0M3Nc99;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cz95Q2SCvz30hP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 18:51:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1761983460; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hKoRx2e1Q9dKGZqKQaFUyhF96+yo7kiqqTiFXK/M9u6d6HNtdSh/kpHR1cxgie41Sv
    LIV882tvIkX0KeZaeb8OnOXG64nHGXipEMkTMj8LBRpvvtgDQxw1h9PaHts6u0cdvPli
    +MeI7Xu+shfPz6X4lYojaqm/NLMZD5Ekf5L9WERXWfIULSWTDEwW08SkMsJ/6ozCfuQX
    2w7JkftHhQbZF0BWWS5DsnrfeblHVoX85nVEnu6WZL44Co2iVjuk/GUib7Xne8X56oY5
    yEVisM8yVjni6zFCP0gv0Y0ij9eJr1/JFpZDn3DAC2S4MoiBTGMgOCCbEs5u5fNyLrst
    Uh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1761983460;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=1poCaNFvyyPJmxRrJBkXnU/2/R3LB0yNi4W+8Zu9x9Q=;
    b=awuSfu3HYKCeFJlzZ8QdZvdH+CNk3WR1psxFrEFPpfsaI5PLAdVIbZ+73W0M63zrto
    DPqJtqMVRwETVY/8hmGDM0mLoJ6gBdO9w1oQmyYIBBLLlEmGHNpGyhG34ol909ljm5gq
    ogm2sQloI9jNiyzCJcHGKgf5HvkzxQz8IDzJ8pVOIR1/oxAe96bWsWufxpmD4nqOXwtW
    xAr3QVhKfkiMKgBxcWBWdeyp8T/zmK6SUHtc/8cpfnbxATayK0vvRRZz9ucziioZIWxc
    2JpRwb65RlEp05fqFhxXxLkoNa+bEANjhP6TT4CVIIipokPto3HVeG+hQxtxI9CS95Yq
    Q5ZQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1761983460;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=1poCaNFvyyPJmxRrJBkXnU/2/R3LB0yNi4W+8Zu9x9Q=;
    b=l0M3Nc99Z0522i3fLAkMLTPOrJk/dPM7qKhtX0xPk0KOtDs2u3a54o3f5fj+fZuo+z
    +2ofGDl/Cwl0ri0xOaEIcH1ar1EvvrvreVNuoJgLT5ylF3Fv2bDP+aECpCwY12RIrz78
    ECKj146r45JngVtcmDdqPiyrTRciPWb526df+heGcoCNi5wzvKitbvpO2RaKvzrRPWwP
    pCURRGlf1P+asBVFTRKeDqOaK+NzPpqCi2qUbJPpY0rewSCI9fcR+Au1UeycMPLBgd4C
    cHjg7nnRsfH9Frp/cn9yx/ZSU0M6Qw1V4MBRrg9T6bsrK2fgQ/msGtSDzfM/Wjbj8tqp
    JUSg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VZi2s3yVXnhFqLkx1Gy5BXrtBsVfqVNFrP47WD4="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e288661A17oxX1g
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Nov 2025 08:50:59 +0100 (CET)
Content-Type: multipart/alternative; boundary=Apple-Mail-C2EE06DF-B277-4F92-B677-30F732480D6A
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: [PPC] Boot problems after the pci-v6.18-changes
Date: Sat, 1 Nov 2025 08:50:48 +0100
Message-Id: <494DC353-6878-4C5C-B2DF-C69E570E95B3@xenosoft.de>
References: <545ac5c9-580c-5cf7-dd22-10dd79e6aabf@xenosoft.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam <mani@kernel.org>,
 regressions@lists.linux.dev
In-Reply-To: <545ac5c9-580c-5cf7-dd22-10dd79e6aabf@xenosoft.de>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail-C2EE06DF-B277-4F92-B677-30F732480D6A
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 01 November 2025 at 06:40 am, Christian Zigotzky <chzigotzky@xenosoft.d=
e> wrote:
>=20
> =EF=BB=BF
> > Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > Oops, I made that fixup run too late.  Instead of the patch above, can
> > you test the one below?
> >
> > You'll likely see something like this, which is a little misleading
> > because even though we claim "default L1" for 01:00.0 (or whatever
> > your Radeon is), the fact that L0s and L1 are disabled at the other
> > end of the link (00:00.0) should prevent us from actually enabling it:
> >
> >  pci 0000:00:00.0: Disabling ASPM L0s/L1
> >  pci 0000:01:00.0: ASPM: default states L1
> >
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..27777ded9a2c 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_d=
ev *dev)
> >  * disable both L0s and L1 for now to be safe.
> >  */
> > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_asp=
m_l0s_l1);
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable=
_aspm_l0s_l1);
> >
> > /*
> >  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrai=
n
>=20
> Hi Bjorn,
>=20
> Thanks for your patch. I patched the RC3 of kernel 6.18 with your new patc=
h and compiled it again. Unfortunately the FSL Cyrus+ board doesn't boot wit=
h your new patch.
>=20
> Sorry,
>=20
> Christian
>=20
> --
> Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-a=
nd-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)
>=20

What about with=20

+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_l=
0s_l1);

?

- Christian


--Apple-Mail-C2EE06DF-B277-4F92-B677-30F732480D6A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html class=3D"apple-mail-supports-explicit-dark-mode"><head><meta http-equi=
v=3D"content-type" content=3D"text/html; charset=3Dutf-8"></head><body dir=3D=
"auto"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br><blockquote type=3D"c=
ite">On 01 November 2025 at 06:40 am, Christian Zigotzky &lt;chzigotzky@xeno=
soft.de&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div d=
ir=3D"ltr">=EF=BB=BF<span></span><br><span>&gt; Bjorn Helgaas &lt;helgaas@ke=
rnel.org&gt; wrote:</span><br><span>&gt;</span><br><span>&gt; Oops, I made t=
hat fixup run too late.&nbsp; Instead of the patch above, can</span><br><spa=
n>&gt; you test the one below?</span><br><span>&gt;</span><br><span>&gt; You=
'll likely see something like this, which is a little misleading</span><br><=
span>&gt; because even though we claim "default L1" for 01:00.0 (or whatever=
</span><br><span>&gt; your Radeon is), the fact that L0s and L1 are disabled=
 at the other</span><br><span>&gt; end of the link (00:00.0) should prevent u=
s from actually enabling it:</span><br><span>&gt;</span><br><span>&gt;&nbsp;=
 pci 0000:00:00.0: Disabling ASPM L0s/L1</span><br><span>&gt;&nbsp; pci 0000=
:01:00.0: ASPM: default states L1</span><br><span>&gt;</span><br><span>&gt; d=
iff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c</span><br><span>&gt;=
 index 214ed060ca1b..27777ded9a2c 100644</span><br><span>&gt; --- a/drivers/=
pci/quirks.c</span><br><span>&gt; +++ b/drivers/pci/quirks.c</span><br><span=
>&gt; @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci=
_dev *dev)</span><br><span>&gt;&nbsp; * disable both L0s and L1 for now to b=
e safe.</span><br><span>&gt;&nbsp; */</span><br><span>&gt; DECLARE_PCI_FIXUP=
_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);</span><br>=
<span>&gt; +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_=
disable_aspm_l0s_l1);</span><br><span>&gt;</span><br><span>&gt; /*</span><br=
><span>&gt;&nbsp; * Some Pericom PCIe-to-PCI bridges in reverse mode need th=
e PCIe Retrain</span><br><span></span><br><span>Hi Bjorn,</span><br><span></=
span><br><span>Thanks for your patch. I patched the RC3 of kernel 6.18 with y=
our new patch and compiled it again. Unfortunately the FSL Cyrus+ board does=
n't boot with your new patch.</span><br><span></span><br><span>Sorry,</span>=
<br><span></span><br><span>Christian</span><br><span></span><br><span>-- </s=
pan><br><span>Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/We=
b-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)</span><=
br><span></span><br></div></blockquote><br><div><div>What about with&nbsp;</=
div><div><br></div><div>+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_=
ID, quirk_disable_aspm_l0s_l1);</div><div><br></div><div>?</div><div><br></d=
iv><div>- Christian</div></div><div><pre class=3D"notranslate" style=3D"box-=
sizing: border-box; font-family: var(--fontStack-monospace, ui-monospace, SFM=
ono-Regular, SF Mono, Menlo, Consolas, Liberation Mono, monospace); font-siz=
e: 11.9px; margin-top: 0px; margin-bottom: var(--base-size-16); tab-size: va=
r(--tab-size-preference); overflow-wrap: normal; padding: var(--base-size-16=
); overflow: auto; line-height: 1.45; color: rgb(240, 246, 252); border-radi=
us: 6px; caret-color: rgb(240, 246, 252); -webkit-text-size-adjust: 100%;"><=
code class=3D"notranslate" style=3D"box-sizing: border-box; font-family: var=
(--fontStack-monospace, ui-monospace, SFMono-Regular, SF Mono, Menlo, Consol=
as, Liberation Mono, monospace); font-size: 11.9px; tab-size: var(--tab-size=
-preference); padding: 0px; margin: 0px; white-space: pre; background-image:=
 none; background-position: 0% 0%; background-size: auto; background-repeat:=
 repeat; background-attachment: scroll; background-origin: padding-box; back=
ground-clip: border-box; border-radius: 6px; word-break: normal; border: 0px=
; display: inline; overflow: visible; line-height: inherit; overflow-wrap: n=
ormal;"><br></code></pre></div></body></html>=

--Apple-Mail-C2EE06DF-B277-4F92-B677-30F732480D6A--

