Return-Path: <linuxppc-dev+bounces-12919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469FBDEA4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 15:07:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmrwN4fgCz3chw;
	Thu, 16 Oct 2025 00:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.81 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760533652;
	cv=pass; b=loeRb8JmgwOdkNyqJxgpJTxtv1RfKlQEe8KlvpFLBL0MsoOkstYucTlxdY9jJAFHqqqvpEjpSoul0GUSPltD3pWF1GsrSivu4hhYdNCCVpjV1BOKfFy5aig3KxadxyuK048jyAWAZDYAmeCOyFCt6x6M8JBgv1qT5CZUbOttSiaqUZWbYqHN0ljLvW6t8my132GDtsDqd3bxg+5cnstKHPO6ZHS7qUFx0xuAv8vuacuSJXGdi3YVYs9YWS8XtVcF3S3rL1CXmApynvRl4ersQ1rsetCXSMT2wbu2Pi60mn1YhJCao7IRe7Fa5IczvAFZo7ReYviJNJaaIG+87vPt9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760533652; c=relaxed/relaxed;
	bh=v1C7tk4STIJuR6Ka/hKAWwPTTRpGtWDlQ5rgR26tzTM=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=KSpPkOUSrFfeQf6OIUo5LXY28q5zfNIw12mZMI9DsDg+qj5m4HqkbWryQLJtT7QAVsHAaP7qIXVyp+AC0Ksa+AdPE/8pe4UcviBzGiCIOwWtrFCmVi+kWiSgoztQniQcjjOmUhJD0DgFniT/cqjr1YqQZSTSrYWVk0oueJhl2zrTUiBl2bvpMRjF73vSc0UwYdWTZn1pTAWRoxyp/mXA1//plwOso2m/sAJoWshSrq7lfoBtYYjWdT+rzLxiMMMbCiNr6LdrtlNJ3RxQWOrR8vteILVSPg0xSBHvmSTyRac064+l92KrJU7g8fo0ddYe8LojpnAAHLVNO43owcY9nA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jquVtm2T; dkim-atps=neutral; spf=pass (client-ip=85.215.255.81; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jquVtm2T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.81; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmrwK6y1Pz3dC2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 00:07:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760533642; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=D7bTacsp2v5ox8lZubln24gC6mbqnC5dd411lfdWl8dbb/rxq3ckiJd3CG4bWjzzUi
    1KyorWLBNpMuUR1GGOW775pe1mcJsbmGwvF32h8ZPR6xtuHz1aKPJRrG6IAvZ0RhRyAH
    xuHwSTivqip8Ivw4T/P2HnY2ijUGxCJN0xsp34Owo9JyuS9sGwfkBQGvCYbiMS1DlcPt
    ZbZdLFRqTtchVW1twik3lt1CQnUKN/5a2YQgUoKXpMV8kaJe+Cwp8ygS6vZ42nN1r0KZ
    MmXYYd6dkfVmb7ehtWc+9o88BiXIcih1tlslJfVanfs27Ts14uQJmIPJzO/O7Z92vFBu
    HGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760533642;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=v1C7tk4STIJuR6Ka/hKAWwPTTRpGtWDlQ5rgR26tzTM=;
    b=UPEtm///WRDt1tUUc0+GTr4+0Dk7oqDhP/89M6vPeD6jJk4D55n6W93PVYEUgCKsEa
    afxxpDVV1iZdP2AIJGs+UskzzrFvUGqs9oMqEUIWIznhFXfPB+JqI/097kpjI7M3l5i5
    jtUHEncKH+J2O4TeAEYmc9jHCok+r5oc9XMqjLn6KwswwutkM3ILzviVjgnoVOOUZi3I
    vRRE2Lt9glaZU854cole9PI1D1vBEiqdWr/u8YpJonNq2+08SH8ElKW6BFODmnYAJauT
    UtlwVAjPSD2bi5Krl4xiabwQzvSKEo+eqpH0r614B3U8dLAKIDPEPJ9tbB5DTKS/rmfO
    vhuQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760533642;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=v1C7tk4STIJuR6Ka/hKAWwPTTRpGtWDlQ5rgR26tzTM=;
    b=jquVtm2T62hOL5WnOoH9g3vc+jmy9g60WGIQPO+JFzSIThDlv4oFA2tt3jFW0t/nwU
    j7wNPc8fjGsJ8OvAgif40eA4CcnZmm3qGzVSGCRmiShuo29IDVHM9RmrNOhRKWzzrs7V
    GpNKgzaPZRjeB/r+OagjeN9SsAK3NRS7UdlsvOvfadIOnMDQsLeqyl0TkQ64XAA6IxtE
    muKXScF/555XquaLlBWq8dkf61GnjQM2O/apJffB7hBybyHz9BsElolmLmXODllsROMl
    vVSIHyUE7zgdTcSA5zOJsNp78v0Mk+oRB5nIgJbU93WpzTqIxcXha4Z1S0d02km8PQUz
    Qdkg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5qwsy/HXXax+ofCi2ru+NWolPb67sCbW3uT"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619FD7LXTK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 15:07:21 +0200 (CEST)
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
Date: Wed, 15 Oct 2025 15:07:09 +0200
Message-Id: <CA1ADCB8-17B8-4903-8E1E-6451B8944657@xenosoft.de>
References: <EF4D5B4B-9A61-4CF8-A5CC-5F6A49E824C1@xenosoft.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <EF4D5B4B-9A61-4CF8-A5CC-5F6A49E824C1@xenosoft.de>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> Am 15 October 2025 um 02:27 pm, Christian Zigotzky <chzigotzky@xenosoft.de=
> wrote:
>=20
> =EF=BB=BF
>> On 15 October 2025 at 01:58 pm, Herve Codina <herve.codina@bootlin.com> w=
rote:
>>=20
>> =EF=BB=BFHi Christian,
>>=20
>>> On Wed, 15 Oct 2025 13:30:44 +0200
>>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>>=20
>>> Hello Herve,
>>>=20
>>>>>> On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.co=
m> wrote:
>>>>>=20
>>>>> =EF=BB=BFHi All,
>>>>>=20
>>>>> I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable=
 all
>>>>> ClockPM and ASPM states for devicetree platforms") =20
>>>=20
>>> Thanks for reporting.
>>>=20
>>>>=20
>>>> Also tried the quirk proposed in this discussion (quirk_disable_aspm_al=
l)
>>>> an the quirk also fixes the timing issue. =20
>>>=20
>>> Where have you added quirk_disable_aspm_all?
>>=20
>> --- 8< ---
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index 214ed060ca1b..a3808ab6e92e 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_d=
ev *dev)
>> */
>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm=
_l0s_l1);
>>=20
>> +static void quirk_disable_aspm_all(struct pci_dev *dev)
>> +{
>> +       pci_info(dev, "Disabling ASPM\n");
>> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
>> +}
>> +
>> +/* LAN966x PCI board */
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, quirk_disable_aspm_a=
ll);
>> +
>> /*
>> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>> * Link bit cleared after starting the link retrain process to allow this
>> --- 8< ---
>>=20
>> Best regards,
>> Herv=C3=A9
>=20
> It is the same patch, I use for my AMD Radeon cards.

I use

+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_a=
ll);

in this patch.

>=20
> In my point of view we have to add a lot of other devices.
>=20
> But if the computer does not boot, will the average user know that there i=
s a problem with the power management and their graphics card?
> I am unsure whether I can deliver the kernel to average users later on.
>=20
> Thanks,
> Christian


