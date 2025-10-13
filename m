Return-Path: <linuxppc-dev+bounces-12789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4BBD16EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 07:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clQkH42Wrz2xQ0;
	Mon, 13 Oct 2025 16:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.83 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760333031;
	cv=pass; b=AUVEn1IzubGIeinQfmmxXT2aTZ55ECH4nH9tpFvbQRihiFrEFIu6EW6lA6usNrc32gA/7ioom4ZzeUg+P/f1e+5/pD2g6WXiyBFzXiqC6/6ze424q7NdqU9HQdZuctxPfOs3X9iNXdOte8Fnn9m8L+iR7EF30dx6pjH7TG2nPu15VKyrjhFdAOeOKB6BF+oEdixOq7Y+qzB0eF3MucTRiPAFRIR4pKMNodwJNlNhaUGy12CpC8b2xMe5MyO2vkz+lik2N4eZFHfN+hcTL+1TAB6DSBjXpU11LmC2AKGUvWoAjffaI0eWlLuvybJyZmpiMWWnc94SEyBFTW5Agr0fQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760333031; c=relaxed/relaxed;
	bh=39jo6iHhEeNQVQFqXrBMkJyiskAoFnE5eOk14VPginY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=lO2OsiBs74YcgNAQge1kgSJ0qb0bnUOgUkA9gwQBr1DpQb7d+hKSXDqgohfx2kI27BtvU8DPKXIaINAmgjQwt29IoCAyTS2YhWlr/6Jk9GbnlTqiJ0CauP2XOaE9HchynAMieRdaeRq7fBuGMdu8r2JmhWXR8A4NjcXSTQVH036vqMI96bEhQnw0PLNhwCUUamNHnFnZvbz4TqbN/+lXLALH7GALRkKZfDqj5NJQhDSq7H2OuBCZaR6bYCM61r490aeRjz5vDM22SGMlEz26wBHuQeIaSKQIsNggQE5a/0IaI0aL8Fs3Q4zUaQgbdW818Mq0x2gjNa2LH2aV8EE8zw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MK1YpM8u; dkim-atps=neutral; spf=pass (client-ip=85.215.255.83; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=MK1YpM8u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.83; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clQkF4BYQz2xMV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 16:23:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760332991; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=T0a1VJ97tS9rLBZqm5UShvFwdcTqh3p/u05fEBKzTa4pu2zkLlBKY6+y+ZG80ol53W
    D91dG521BMz+OJqLhGUMbxx0uLAeY8FDy+H4tyMRxlJ8Q0CZw0g2sJjQC+6vFVqKBAq6
    xXEGzAyewzeuWvOIHb++k7G0cuZZX16zg4V68jGC7TJ+boM9y4MqL/DC91So3gCPKgEy
    0n4W26eQ+MWUpuDN7hqksWEitopI/zPQrkOeL3fMZA8QKxjb4OkaDrsW0MXPeWP2m/OJ
    i7BHrUrsCinSZH2lW1wI0eYBeKNSm4t+OMY5nRWcG2p9RQh1OeU5u3FoG5Tul9NpSAra
    54yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760332991;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=39jo6iHhEeNQVQFqXrBMkJyiskAoFnE5eOk14VPginY=;
    b=BrdfKZ0FH4dzzOtlfIvRu0jctkhB5F/Bkj0N3bDRZcHqtYTglt9B9XCEp3JBo6URhJ
    HD5V4ZWYl0IRUpgWwp+YNXWAUtbaK86QYJmADdUKOLeIk0d+SHDNAfN263vPnRG3kCUj
    oz+jEQg3BUO33Cq8gYXhCM9F9b50oyM0TC2wa8D2Be8luYYGLvKMZW5Pif+ANS3nKNep
    DXahy3RNPCarfbwVI/DsH7w/mSu2JTvXAYtC1YY0drJRpUcF/vozEnL5VnAn5qFT5CNG
    V72VnGeqT69jOp2WKyt/6CoxTPXPiuaRosGssI3+EpJfECjec2R/40NSTqsKu7icqm/x
    SAHA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760332991;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=39jo6iHhEeNQVQFqXrBMkJyiskAoFnE5eOk14VPginY=;
    b=MK1YpM8uXesh31A9HhikWQ5XvRFUpUi9Epkgk83Cb31tap6FMHf9rE+jptDvhYy0UB
    qfv5jEoV0iKmezpT+wJPrkOVXmLJQ3uz6voBpCiTq5WfnV7ESLQW0KpQnl2cv4ZCPJ+3
    z5tlECvOpfx+8oY9sfEi5YQ8+7WYgctqqLnWgB6gsuTLlTAVJxG7PYDl+FQJQqc36hNI
    txkcaa39iT6e1l9GtcY320X3qHJMRLfCYHdqiqYOlYtbbWfFZ/pb9XdeQwW12SwwIvvX
    zc9u8ZcBTNdhQeDjXTZGYtzBK5csBo4CuHNSutnyUicp4Ej3qEReIKUIk3oBugm0Ep/+
    tUgg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mws3+VAS+pQfdGEfuOCOWETzj1zszWa107enM="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619D5NBKT6
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 13 Oct 2025 07:23:11 +0200 (CEST)
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
Date: Mon, 13 Oct 2025 07:23:00 +0200
Message-Id: <7FB0AB81-AD0F-420D-B2CB-F81C5E47ADF3@xenosoft.de>
References: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
In-Reply-To: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 13. October 2025 at 07:03 am, Christian Zigotzky <chzigotzky@xenosoft.d=
e> wrote:
>=20
> =EF=BB=BF
>=20
>> On 13 October 2025 at 06:47 am, Christian Zigotzky <chzigotzky@xenosoft.d=
e> wrote:
>>=20
>> =EF=BB=BF
>>>> On 11 October 2025 at 07:36 pm, Manivannan Sadhasivam <mani@kernel.org>=
 wrote:
>>>=20
>>> Hi Lukas,
>>>=20
>>> Thanks for looping me in. The referenced commit forcefully enables ASPM o=
n all
>>> DT platforms as we decided to bite the bullet finally.
>>>=20
>>> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even th=
ough it
>>> advertises ASPM capability.
>>>=20
>>> Christian, could you please test the below change and see if it fixes th=
e issue?
>>>=20
>>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>>> index 214ed060ca1b..e006b0560b39 100644
>>> --- a/drivers/pci/quirks.c
>>> +++ b/drivers/pci/quirks.c
>>> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_=
dev *dev)
>>> */
>>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_asp=
m_l0s_l1);
>>>=20
>>> +
>>> +static void quirk_disable_aspm_all(struct pci_dev *dev)
>>> +{
>>> +       pci_info(dev, "Disabling ASPM\n");
>>> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
>>> +}
>>> +
>>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_a=
ll);
>>> +
>>> /*
>>> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain=

>>> * Link bit cleared after starting the link retrain process to allow this=

>>>=20
>>>=20
>>> Going forward, we should be quirking the devices if they behave erratica=
lly.
>>>=20
>>> - Mani
>>>=20
>>> --
>>> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=
=AF=8D
>>=20
>> Hello Mani,
>>=20
>>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_al=
l);
>>=20
>> Is this only for my AMD Radeon HD6870?
>>=20
>> My AMD Radeon HD5870 is also affected.
>>=20
>> And I tested it with my AMD Radeon HD5870.
>>=20
>> What would the line be for all AMD graphics cards?
>>=20
>> Thanks,
>> Christian
>=20
> I see. 0x6738 is for the AMD Radeon HD 6800 series.
>=20
> It could be, that your patch works because I tested it with an AMD Radeon H=
D5870 instead of an AMD Radeon HD6870. Sorry
>=20
> This could be the correct line for the HD5870:
>=20
>>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6898, quirk_disable_aspm_al=
l);
>=20
> There are some more id numbers for the HD5870.
>=20
> Correct:
>=20
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..e006b0560b39 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_de=
v *dev)
> */
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
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6898, quirk_disable_aspm_all)=
;
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6899, quirk_disable_aspm_all)=
;
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x689E, quirk_disable_aspm_all)=
;
> +
> /*
> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> * Link bit cleared after starting the link retrain process to allow this

Better for testing (All AMD graphics cards):

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..e006b0560b39 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *=
dev)
*/
DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0=
s_l1);

+
+static void quirk_disable_aspm_all(struct pci_dev *dev)
+{
+       pci_info(dev, "Disabling ASPM\n");
+       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
+}
+
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_a=
ll);
+
/*
* Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
* Link bit cleared after starting the link retrain process to allow this=


