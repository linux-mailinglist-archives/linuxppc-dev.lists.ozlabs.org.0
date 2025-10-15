Return-Path: <linuxppc-dev+bounces-12915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B1BDE764
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 14:27:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmr2135x9z3d9H;
	Wed, 15 Oct 2025 23:27:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.169 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760531241;
	cv=pass; b=AZ58hv0VH0p6djZQNzr8fk1GTgnUCiKANGyqpsLzMHPOUPEHGAI+aLgy+Kjh4UeJoXgKck1EfSaehbQ+2R9k0QHo17CajKKFHqO/h00rzP0uxQpUifU4hjb1VYX+UQN9A4lsbyS36NaGssjDYI74XWZjofgv9mOoLMN1Wtq2lGdiYEKs3TWAHegjYgdguBg4fJIdEY36hpWZ+1QQ3W6YG0wCmDIX5+b+sZ+S1F8ObLJOp1Km3xQ4YSdt23b7wP7gGRDHWldOGrCYy5zcCeFLl2YFzRbADM0mWojX4gFtEjNc+tpxjWfGHTfHFWTecYEYrEhmeLAJAN4osBiPrffioA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760531241; c=relaxed/relaxed;
	bh=tnWL0EzTYcQKOAeh8uiCBudXcH8KwCu92OpKrg/ytAU=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=As9/IxY9I2sRDg1V4J+bN5aLVzd6VaUqKpAvZqej9hvdWqACaqVJsZqkSNVpuk5SY33klJhldi5J3Zypot1IYl7iDBwrCBssNGzNIKuwFbJi0JMPX3DPNyGWOZTg7WEUmuWCv/PhIZ2y/Gmwspsk+7ZUrgvFrfQb2Vlzz+YHK0a7BfIyJzckXPu/a9TMftzbn830ZneOFb3itbTwbNIrN2Mh0VYmtxFa50zbiijMX9CnQZ6/rZBgK1/SusbVGlZV1LMX/0MOLL6OLMj8zh7PADNjjoA+TukAhhoF1n2OmlZt4fHoHKZ2qfuN8gy7g7ruH09n1NvGpEajCIEnnw2Baw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i+gKJIIn; dkim-atps=neutral; spf=pass (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i+gKJIIn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmr1z2B6Tz3d8D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 23:27:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760531231; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HsaHGJnPBY5KeT2Q922JkuHmn32tGWgktfHa+mYVSaSQFtj21quZt+7p5K8vj3njz0
    30bToP7153RpL7Ju7kW/YZcGp5BohjMHqh9yUi8kcgu4RUolx6jaepJTlYKC4SZQ3GGI
    xIPkFz1NfRUjTrCi21CIveaecuTMVKFjHnvb+6RQnADj6d2f/NKmcxXQ4IENyXRPccsO
    CsPFRpd/K32IrcdwJ3nKOzLvCcNN8i1wpXYpKHXeWFYJTiDV6TZjH/GOmIFK4/LM7bZJ
    F7EiDf85kai7Zc5Irg9mqaUok1wZBcaaw022okWUbFGo2rZQbFNeFHlXjxq3WVu5Kohn
    DB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760531231;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=tnWL0EzTYcQKOAeh8uiCBudXcH8KwCu92OpKrg/ytAU=;
    b=LiY5ZwFMSXZzLr+uyjFA5B8O1xG1iA/Q4Xt9vxmx5G40ov3K4O8fGZKAis9DLE0WOA
    /4k/3TPNciISgKo3UhI406yCsnyn3QHwo6KhWDZOt22YWIvPvqN3d9Mxk8ZkfbU27uWG
    JqWQUaxe6AjSLbQMF0WQCOOor1Ld7/xjM/5p4Lzqj7F8tdmOqO/VY5/CWI0A25hAiKr6
    8zL+9G11vACP5GpSFyXdGod2zZdP65U83r4UT/tUyNPMeW4MzoAJWGjQqMuzr3aT8b2a
    uxWYMdd4oAygg9NIJJNp6QsoSP4q2BASVaDvMBu1+VWMTA9Bcae6/MuT9oiJclU7/4Uh
    0AvQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760531231;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=tnWL0EzTYcQKOAeh8uiCBudXcH8KwCu92OpKrg/ytAU=;
    b=i+gKJIIn6Dd+1mdS/xOri0W5DpfltH1fY00wJ5XwslvsXPnW7EuzfRnjhdgMQ3T/rP
    sO67KvPzn378ozoWOX5nyYjIc93VYtqr2QPTStKw6bUbISc5RCDgGvcOyPPDHI2Ow8qn
    7iNPkahTYgG7tKm6ngLlMa3d0A/OpzDjXQxtsJST0B/Za6Q4063Bf1P927RKUFqAN9X/
    GHBlyto2f9LynUs6eiq/A/mc/WsJZwxlboTBgDc/PnvIUlwjA3CVw15DA+Xf82tPxsb8
    Ac5SMwk1/zaR4+ti69oAAu75I+a9jrFPbcNbzhvq9ZbBQLw1tSKGKe7KaPv34bBLJ/8a
    RUCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5qwsy/HXXax+ofCi2ru+NWolPb67sCbW3uT"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619FCRBXHg
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 14:27:11 +0200 (CEST)
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
Date: Wed, 15 Oct 2025 14:27:00 +0200
Message-Id: <EF4D5B4B-9A61-4CF8-A5CC-5F6A49E824C1@xenosoft.de>
References: <20251015135811.58b22331@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251015135811.58b22331@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 15 October 2025 at 01:58 pm, Herve Codina <herve.codina@bootlin.com> wr=
ote:
>=20
> =EF=BB=BFHi Christian,
>=20
>> On Wed, 15 Oct 2025 13:30:44 +0200
>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>=20
>> Hello Herve,
>>=20
>>>> On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com>=
 wrote:
>>>=20
>>> =EF=BB=BFHi All,
>>>=20
>>> I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable a=
ll
>>> ClockPM and ASPM states for devicetree platforms") =20
>>=20
>> Thanks for reporting.
>>=20
>>>=20
>>> Also tried the quirk proposed in this discussion (quirk_disable_aspm_all=
)
>>> an the quirk also fixes the timing issue. =20
>>=20
>> Where have you added quirk_disable_aspm_all?
>=20
> --- 8< ---
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..a3808ab6e92e 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_de=
v *dev)
>  */
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_=
l0s_l1);
>=20
> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> +{
> +       pci_info(dev, "Disabling ASPM\n");
> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> +}
> +
> +/* LAN966x PCI board */
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, quirk_disable_aspm_al=
l);
> +
> /*
>  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>  * Link bit cleared after starting the link retrain process to allow this
> --- 8< ---
>=20
> Best regards,
> Herv=C3=A9

It is the same patch, I use for my AMD Radeon cards.

In my point of view we have to add a lot of other devices.

But if the computer does not boot, will the average user know that there is a=
 problem with the power management and their graphics card?
I am unsure whether I can deliver the kernel to average users later on.

Thanks,
Christian=


