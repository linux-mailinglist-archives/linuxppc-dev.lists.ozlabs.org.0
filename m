Return-Path: <linuxppc-dev+bounces-12935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B626BE15BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 05:28:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnD294hP2z30Vl;
	Thu, 16 Oct 2025 14:28:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760585329;
	cv=pass; b=cojBt3BPoWzYekY+Ib6ysFZA+zijl014OWqrfN6gfApd/f6FJ3rM+NkOb58ap9nTBAkLLRd/CexZOcQNWqsu/MXGcw/U/xeCvgIL3kppxpWVahfCFgdx/n2nSbmta4r5FQlkCmYtOOZDwvoqRMK4Dp7ADwkJVU7f4cTTdvt2c98B9NJf+Jt6OU1xqVNIaO7zVOljH33Rr/E2Bf0YXOSaObUQbS3JfaZZpxLJ3NBFZrs6UzDd8XwXjXg6E9zprTpTSy85/L0STSx74CFGXPH35zuYWr/o0/7tmjrGF0VKIDlFK6jUoSSXBwxSRZoU2w/hdP5RgmZgeVKc0fj0oWU1pg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760585329; c=relaxed/relaxed;
	bh=U1QVdd6JW1LVq5T13CF2TXWHmO7bdk1xu1u07tqkK8c=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=YViHpI8a5u7446VAQZ8mjDQuO+sF3EQ2HMiBHL2JqS4FVbq6Bg2n+MDYxzvapCIm79N+hWHirKpV8KdmS3tKc6JIp1tKZEw5FIEz5IeiS/WfPHnP5XJAouVsXqj3bycSC5cBDRFor7cv3NWYAiyZhq4HhGXxmqYJGzYYvEHtzI5Jp9vIMh1z5+1hce+VU1AKv3lPnDPmL/JCIkhdKs2c2n38EMshWH44uEShhNxsEq+Zqr/Qtgdss2YC9EmIfVtwBWg8ec/NFtHZ3s31ZMWMRFtWt/YMSrjs+WPmth7Yt6cjZKAHq8iWtL2lcvRU1yiE4OaHtHO9HWDz8PQP2CQogQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=R/5pbsqG; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=R/5pbsqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnD270QlSz2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 14:28:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760585320; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Du8SE+AQx70knP5bBVWvf1UyPfqlyTXouAxGiB/esD8HkuLeSlYHYBv04ucJY0jVGy
    rdfnon3jViq1DDUhDXSaMyi2dCZW5Sf8pStHcCHgjvYk0bfC2C61EqNM8xsBdzb9DPDw
    AwCo77hMK45hfe6haowVPZFJuhH7a1nWu6ZOY6BVF92BwoKZ69b5EPYl4HVHxvhFeTlz
    s49aQuMqbAZDOwvlMu4alOdTmrQQRpAyjYCaHmBEAbBgfsLXiA4dkYPXOFxQUyDQ5qSQ
    OvHUzQFzv9bMKwBpyI029hOSsaWoJkLuYy/PslIKmGLPkZX690zd6eP/CL8TLkZSb/am
    JR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760585320;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=U1QVdd6JW1LVq5T13CF2TXWHmO7bdk1xu1u07tqkK8c=;
    b=fqucTLmLVdqXoSwNWjy76LCF2XjZw7YF+oWRO2uUI79W/ObtXYTSUaN2s4UlXnch5Q
    NSqnNt/sYSbKkAGlomw+eyMhCP5OONJyExt2EHwQVKISz/s6Wl9H8/B1/sTY6NYWXOD7
    7C9ArjRhvjui/bNazzdalkjmNEOMERFknaxhh3Dq78Nl5lCNEobflh88jfLp2cS5Qjwq
    QHUZOY+2YKwDG/gA9Aviru2KUBg6u2c2W4wVOgtDBqFtE7iuxAPaQxtv1K9G0WD6KKCV
    Sx0+iUqr7WBBO2xkdlkNxS0oXK1zzQVSOPQEgGnZTIOVu0I7NqVmKLfXfaEQW/41E+rE
    DM2Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760585320;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=U1QVdd6JW1LVq5T13CF2TXWHmO7bdk1xu1u07tqkK8c=;
    b=R/5pbsqG+oRmSjcLn+iM6jCmmOEnRWvlpSCnbmbuEVjEhT4a41syRZ1QufiSG7cPhO
    Ucfyyuuxk+ZTwO6/5Wh7y70PFYMVKSAnZROx7FJtBJ9nwZwuVzUHY9eKVVjL5Z++117g
    bU4oIsOFBljq5csIwdBvKDWoSLdqQM+HGT96tfW7b0eScR4FaLLy9KPtKxGFu4gj10Bp
    xzHrSsMttCwLbnXsHU+27Tz1Bg314fJ7sNEy5ZrBWLbn6Mb1sQpRf4IJsOFncR8CKphk
    ZoY6SBFVF9mt/6O2jTjNBAvlwqfAAaTikYT3AXHZmweBPte0lOwsD2kyTNrC4AD3G3St
    cQsw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErql7iEPqvUkiut3rDMpXKOGwiWMRFXLr21cvQN8g=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619G3SdZOK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 16 Oct 2025 05:28:39 +0200 (CEST)
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
Date: Thu, 16 Oct 2025 05:28:28 +0200
Message-Id: <A1E3F83C-3AE8-43B7-9DCB-6C38C94F8953@xenosoft.de>
References: <20251015153442.423e2278@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251015153442.423e2278@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 15 October 2025 at 03:51 pm, Herve Codina <herve.codina@bootlin.com> wr=
ote:
>=20
> =EF=BB=BFHi Christian,
>=20
> On Wed, 15 Oct 2025 15:14:28 +0200
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>=20
>>> Am 15 October 2025 at 02:59 pm, Herve Codina <herve.codina@bootlin.com> w=
rote:
>>>=20
>>> Also when it boots, it is not easy to know about the problem root cause.=

>>>=20
>>> In my case, it was not obvious to make the relationship on my side betwe=
en
>>> my ping timings behavior and ASPM.
>>>=20
>>> Of course 'git bisect' helped a lot but can we rely on that for the aver=
age
>>> user?
>>>=20
>>> Best regards,
>>> Herv=C3=A9 =20
>>=20
>> I think I will revert these modifications for the RC2.
>=20
> I don't know what is the future of those modifications but maybe instead
> of fully reverting them, maybe you could perform calls to
> - pcie_clkpm_override_default_link_state() and
> - pcie_aspm_override_default_link_state()
> only if a new Kconfig symbol is enabled.
>=20
> Of course this symbols will be disabled by default but if you want some
> people to test behavior, it could be interesting to have the code
> available in the kernel.
>=20
> I don't know, this was just an idea.
>=20
> Of course, reverting the patch is simpler than adding this new Kconfig
> symbol.
>=20
> Best regards,
> Herv=C3=A9

Hi Herv=C3=A9,

Do you mean an option in the kernel config? If yes, then it is a great idea.=


@Mani
Could you please create an option in the kernel config that enable or disabl=
e the power management for PCI and PCI Express?
If yes, then I don=E2=80=99t need to revert the changes due to boot issues a=
nd less performance.

Just for info: Simon Richter wrote:

Intel B580 on TalosII has trouble growing the BAR with 6.18.

Power management changes should not affect PPC because it is broken anyway =E2=
=80=94 PCIe bridges are assumed to be managed by OpenFirmware, so the "pciep=
ort" driver is not registered, so bridges have no power management, so downs=
tream devices cannot enable it either.

- - -

Thanks,
Christian=


