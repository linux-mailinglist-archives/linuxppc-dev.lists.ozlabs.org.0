Return-Path: <linuxppc-dev+bounces-12787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB4DBD1644
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 06:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clPw71L8mz30M0;
	Mon, 13 Oct 2025 15:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760330839;
	cv=pass; b=bF1RCAecBtviHfkOB4QhkHMBDNO6Swh7xv2UzZU+jSFJ2DytVAwMwyqzp/rCpRNf4rp1hDTnnoovfZcT3isb5NHGGYV8kZrmfsv/SQY3oCSvCfRBQ//EBD3BWV4y82rutF+qD0pI5L3E0QNd6nmvHVIe8KXxIV+AT/NQ8niB4lXLgV1xMwu2eUxv6SHP3ByHyHtwY/b1RboSC4CKJISlVK1ue+EYjZlEr2KXvL324Q8JBj6jABM7UlHo1mstB8a1mv6ZAplgpuhoQyyRPnlpR7A2SszJe+DqcB38BbWJjPcPL4Ay7Se/5DvOjamKsu4lkxvwoG26a8lPArFzaBxqpw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760330839; c=relaxed/relaxed;
	bh=fZxToLjYnoS353OgzuhhmLgCZy7eCZMC/R02n7ti78c=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Io/uT1itFILf6ZWnEbNl1WVmsIf7WydXHFmFMV5hZD37isR4D+WNkKPNuMc5nKDKWLOwJScl+81xKnRgK4lbGu/Eblk3SKJiggP0ar7Va4B0gt3CBhhd/+iceRY/a+BqFNhCzcKQwrR51Erbcwz1c71wjlrC6w3Ee69UoJkB3xHHiv2LskfQdEaij7gm29b1MgDXkhpRQHyYUYRTWnUNxwUWK66KXpAP3qnyr+mjewYr4AL3iOBkwwOdyZt5Dt6xV4mMImr/qk39HvAc/yKiaFi+AoqETbel/Bw6y5wQ10lkWIf92+NXnaG6qcM907alZJXVPareNvwqh6S7GcN7Gg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZFXQUgOa; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZFXQUgOa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clPw412wSz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 15:47:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760330785; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ntccy0sy0hg9HwaKxQC5hSXVG7QYcmlmpYTjKmx/no6BHi3ws1mokKGIN68nPhWkuU
    f7qgpxXYcJhaRXCqlkSfoSj9Xzz8LYAkXqmsKSkIuMe68sSVF08H7T42KUs54yxdRm0e
    IpIUj12V2qHcN5rUv7ImsIuHitjdekt4ORyQ3K3Ro0JSL7aCnmok3FCppO6irS2eGEuQ
    TgSXKQ5qyTgDLWvDCZF0230IN2x8DUIQ+Bj9+IqpY3YHh9EPDekhMxR/dV9q92zr2zpu
    7zEp1sPYM/QiA1zV1jdpeELm4ZIEzjrxMSHtKU4NFlNlRp4ecIJKHf4jqECW/70Co8og
    xeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760330785;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=fZxToLjYnoS353OgzuhhmLgCZy7eCZMC/R02n7ti78c=;
    b=BrTyVuBWxP2HLFQxcOmsVBXOSBEkLHFYVbCPeAsAEhcOCB4H/u6GeZrlBADbUM2u6k
    ERS+gR6tYAt6ZohKsKlCvRu+AkoykERVn+CxdyzsHZq7bHhof0Ualmqm4W3s2fk8S0F5
    sunx6KHBp9n4UPgNnOt4Sy5UgQgNe1ogiuTU3v6NWx5q6+Dlu+kJIOSlmXps5i/kGAu/
    Pgo7AK/W4cw3z2Oh5FUEnC9Sq41yQxPCb7EdDARHS3dZ5dQGpfkCNvqw5yZtv2gslBGW
    mtQrPXD1y1nxSafStc3DDgYpRtss07HkjwOwjSIcjXEe9Qlpa8xLmGDROCpw994A0nGn
    vwBg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760330785;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=fZxToLjYnoS353OgzuhhmLgCZy7eCZMC/R02n7ti78c=;
    b=ZFXQUgOamnBtg8JQMgRsZfVbbGPDsqmHsUTESTBkXnrvclAtNnltdjwAKrYIPxpyWl
    voUdCUIBiM307ie638VjS1esWBTPC1cKe92Y949Q7hyJkSY+bCkyS+m2siadD//Hm8f8
    lXxxf7vB8jN029wDaYRB1/MpoB0r7oAwSTvjvalrIgd4De7dCV8vO64BfzO2jbIC9Nia
    CFnR/h24XwKSCTIv67Rn9aVSMCZPPSL+mhNtzihOkaxQHwmd1GkBy7hIw1MMAXOYENcU
    G9+RD8VRwmWddrbWvm9sfxclkfSooFnnQlr94e03xdn/V8O0PqSqKgS8D7z/tAOCOCnj
    z45A==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mws3+VAS+pE6REQPvdUsV9fT7R/x5YSqXopuk="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619D4kOKN9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 13 Oct 2025 06:46:24 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Date: Mon, 13 Oct 2025 06:46:13 +0200
Message-Id: <0BE6C5AD-8DFD-4126-9B18-C012B522B442@xenosoft.de>
References: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
In-Reply-To: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 11 October 2025 at 07:36 pm, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
>=20
> Hi Lukas,
>=20
> Thanks for looping me in. The referenced commit forcefully enables ASPM on=
 all
> DT platforms as we decided to bite the bullet finally.
>=20
> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even thou=
gh it
> advertises ASPM capability.
>=20
> Christian, could you please test the below change and see if it fixes the i=
ssue?
>=20
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..e006b0560b39 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_de=
v *dev)
>  */
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_=
l0s_l1);
>=20
> +
> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> +{
> +       pci_info(dev, "Disabling ASPM\n");
> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> +}
> +
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all=
);
> +
> /*
>  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>  * Link bit cleared after starting the link retrain process to allow this
>=20
>=20
> Going forward, we should be quirking the devices if they behave erraticall=
y.
>=20
> - Mani
>=20
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=
=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=
=8D

Hello Mani,

> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all)=
;

Is this only for my AMD Radeon HD6870?

My AMD Radeon HD5870 is also affected.

And I tested it with my AMD Radeon HD5870.

What would the line be for all AMD graphics cards?

Thanks,
Christian=


