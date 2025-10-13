Return-Path: <linuxppc-dev+bounces-12788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B3BD1680
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 07:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clQGd3ldHz30M0;
	Mon, 13 Oct 2025 16:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.84 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760331801;
	cv=pass; b=ET8fnfK13+Tz/K2meUgPGhht/a/DOfmPCs3SQHjP6SNk2b1Y6kLB7sByUcfhfy/1878VLkJfX7zyarl/drs5LsefnccDLYSI4co05oDAbvhPe2xD5eddoSQ1F5OlcB10de5/k4gbWOGronbWpLA/zYLWBtFqo8WJn+PuOjr0C1iw5e7KWabKffHSlsAGvN5uZsLwKv/jn3vE38pjlV8OVVOBIGDymr6xsbhEkK+IKSt31rb7XJpYi7mTINsdbPQkt3h/BEnHqRTySU6JcUKumgpGiypOK3ZOg5SccWbgrFmmDo0WRYx6COzXkg80vPG/tz5orQKuE7JgFUOOBYLEtg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760331801; c=relaxed/relaxed;
	bh=ryGZqavNZb722eOgUiPZ5/ROVhbA5reqkn4KrrIkQbs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Vxjdx5p5iLimlx/1hEFq5fyTYsUHB7Sz6NiWVWH5vnQqLGPnp+kX9uvNdoP/b7Q9vccAavvPOBilOdmpUD38KweeYRyq9Z1/eTdK4QOUuBd7bd5aATOlkP9H43W5C+oIBfcbHOGbywzGNxbgQ9jieyNatcDXi7Mj+OW7pueCSaMI+wmXR/yTgd1ENEb1KGmcaA5zr0Er0zMzk9KFpgESSdZcx/em8W5a76iod2SqeYpuoG0XrV7PovcEEFDKs+qsxTdEB+ZxuezAS14VhyUdl//Lo3iX+qmkru1rW7GV3Vr+B6eA2CkXsjscLPkVcynalwGP2NQndOYp7dZAf/i37g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WYPoIPp3; dkim-atps=neutral; spf=pass (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WYPoIPp3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clQGb48HYz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 16:03:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760331750; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pYL37jmRrQ3gym3yRsuIYqvqKmlwLg30biYmsqMutMOqXCC8/2MYsFP5WJwFwYfMqh
    pJANmYkKn7L3viNGLV3+JMvj0UG+LkRVF9G/SiI8nsyVFSxjlMl+Qwaq6oIdo5v+t+7d
    6G4rSJk6l+4B7D+TeBU0a+UWCL2pq09SXd58LN7qGcki9pOd9q7jnrgazRn9Atvgb1oq
    f3xObDnv333CSOhYMjiw16swSUwBsXKCXfbZEzdIoi32ZglxaG/tK15CiSXfEOCAwITz
    13GAEg202J14iUWMIomlEkW5RtdqZ3xaszdWQLo2GHu0aAqwgtsDGxGDVlTgARia3s6n
    3EPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760331750;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=ryGZqavNZb722eOgUiPZ5/ROVhbA5reqkn4KrrIkQbs=;
    b=Gpc16gW1Asu1okQyxorpSctT1J1GvsIzwHxjXzKflfdl92+teWzPs5R6Xp8Wm0genF
    qLAWiwD990WJWGj1ujwGvoWKm321t9YmF1Z4XoEtEuYGX+kl9klZX/Vv/9u9V0RUEIf7
    YG4gbjDf3KL4WkRd/N//3hXBesA1LYFmGJEOE6diS+1Bso2EMWd+kuXLyWhr+Tn4myIh
    LOgMddWboIqjD6swUgiUyVlW0WwPnJVLLbDcLTNKpSBbuRCerD+DtVl9k0haqMoO/o4q
    3sK5N6KZk84Os7S/ndpa0q4O2nR+bs6rMMTyfX/MEzVk9zxeLbXrmmqJ+a6KH5bM5LD0
    aBmQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760331750;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=ryGZqavNZb722eOgUiPZ5/ROVhbA5reqkn4KrrIkQbs=;
    b=WYPoIPp3sX72EU1b+vgjEENgaAPgfBot/3MmDJIUVONG4FTyf0wK7Pe9qtCWeXg/P3
    9W/PbffX/yoeVztBIuA862CMMpNNgMrJiGz051JT515ZBZQu11RD2gamoz2QQ53Z2Nas
    Ge0boC9BA+oSyEiLJr8/eiI1Qd6EaY2AC2GKLjU4NDxPWSEJefcXd/NDu8bBnHdyLC0q
    kt9B+EAF4J0cleHBs0KM0Oz0Z+DN3fowHCu0oRk4YIYyBm36bVfOhXGxvcQW1+zsblQw
    2leeM5ef9BGUe9SCLBNYoLZNg7vhLokTFwMXnigWI6o+lM/T2v+xUrZ7dq5IELvCgeIo
    kjIg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mws3+VAS+pE6REQPvdUsV9fT7R/x5YSqXopuk="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619D52UKOY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 13 Oct 2025 07:02:30 +0200 (CEST)
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
Date: Mon, 13 Oct 2025 07:02:19 +0200
Message-Id: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
References: <0BE6C5AD-8DFD-4126-9B18-C012B522B442@xenosoft.de>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
In-Reply-To: <0BE6C5AD-8DFD-4126-9B18-C012B522B442@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 13 October 2025 at 06:47 am, Christian Zigotzky <chzigotzky@xenosoft.de=
> wrote:
>=20
> =EF=BB=BF
>> On 11 October 2025 at 07:36 pm, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
>>=20
>> Hi Lukas,
>>=20
>> Thanks for looping me in. The referenced commit forcefully enables ASPM o=
n all
>> DT platforms as we decided to bite the bullet finally.
>>=20
>> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even tho=
ugh it
>> advertises ASPM capability.
>>=20
>> Christian, could you please test the below change and see if it fixes the=
 issue?
>>=20
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index 214ed060ca1b..e006b0560b39 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_d=
ev *dev)
>> */
>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm=
_l0s_l1);
>>=20
>> +
>> +static void quirk_disable_aspm_all(struct pci_dev *dev)
>> +{
>> +       pci_info(dev, "Disabling ASPM\n");
>> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
>> +}
>> +
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_al=
l);
>> +
>> /*
>> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>> * Link bit cleared after starting the link retrain process to allow this
>>=20
>>=20
>> Going forward, we should be quirking the devices if they behave erratical=
ly.
>>=20
>> - Mani
>>=20
>> --
>> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=
=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=
=8D
>=20
> Hello Mani,
>=20
>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all=
);
>=20
> Is this only for my AMD Radeon HD6870?
>=20
> My AMD Radeon HD5870 is also affected.
>=20
> And I tested it with my AMD Radeon HD5870.
>=20
> What would the line be for all AMD graphics cards?
>=20
> Thanks,
> Christian

I see. 0x6738 is for the AMD Radeon HD 6800 series.

It could be, that your patch works because I tested it with an AMD Radeon HD=
5870 instead of an AMD Radeon HD6870. Sorry=20

This could be the correct line for the HD5870:

>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6898, quirk_disable_aspm_all=
);

There are some more id numbers for the HD5870.

Correct:

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
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all);=

DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6898, quirk_disable_aspm_all);
DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6899, quirk_disable_aspm_all);
DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x689E, quirk_disable_aspm_all);
+
/*
* Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
* Link bit cleared after starting the link retrain process to allow this=


