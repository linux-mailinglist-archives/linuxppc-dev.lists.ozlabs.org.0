Return-Path: <linuxppc-dev+bounces-12977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23FBE6712
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 07:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cntqL09gMz3cQx;
	Fri, 17 Oct 2025 16:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760679405;
	cv=pass; b=PoNDjRchIptoqlqHKyOs9WrXjNi0h6xm3qgLBxY077iiCLgEiKAwUbEfQrTkzgfZLlLfWGpU9I4GlcLQG4M5zAFd0lrLDnbtmK1NHzQ1qWi0LH3BQyPvVxnjRoNMVV44UcuNX1hwAuJcXM4ulN+cZSBZ1fUStABG7r6hkS39dgmVBBfdKGWK3dyvRtIClshjn+0ta1Q5fUDHGWJ3ofpbSsVd+f4hWaCcaTplc2t5bsrfS4AMwUJVkznjcJyRncRFkfVFFLKM52NJL2a11RJyk0SLFEzPhAtRJjvZDIT9eNx5/IC9Y4i4JajpLCcNARERa+/LDXsMToa7Z+Fhpu6s6w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760679405; c=relaxed/relaxed;
	bh=V1ftbw/xifrEz+CnZmZ9tWc6u8KjSUSp7/wj1ZCuhEc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=b9kFjw2fnffCeEpODYWbBtmNogP3JtG6XLkMu68YvblyWCNh00FDy5tiIVqluzqTX5mGPOyYEE2dF0ZTakzCGA5he4F+L3dlXz0OesLrG2CRzSJDNAJBPm3w5hsSmHdxPZNvdxZP6x1LnxLYo1DaVXbli1hP8gc/O0U6uCGyemOPNwO2TnQyG2ZS2v9mav8Swe9gi6odTjR8R3/qw1kNPX29b+EPDoGR4ALWWd6lY1Xi26wzmh5PzApGRpXKFbIXxdUNnmFNT5YX5sSBkihQr9T8Q6bisN9VWg2JbCiKoch1DHzkFMBg4pqXXr6TcdJuV+u2oVVLZTuPhgDgkgJHfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=p4asQUKS; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=p4asQUKS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cntqH08Rmz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 16:36:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760679367; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nhaG7J1bL5R3UVYFEqUMyRAXLvDeOGEBH0GwwStIKRzZmitjWzfSLves0X4yemOq87
    YZqJk1mkqE5kxr6z0514MIlwXBikvZ54t/iv81jO0s8ucf8V834VDayX9IUBmk442x0Q
    uxD6eo5d490H9ZOq2t4moBXoxmIc+HIeUBYSoS0JnkgXUY8/FcEINvlZ8WnGVm2JiblH
    ReMZB/Og5GDX47qHHJ1XiAwOIP5rywE5jpkuV0ZVmnV0xOXS2POt2Ogr9q372HHrZh7J
    nk2OzxYBin7HalI6pRKtJjwuOplT0CrMnk/1eZfwGUcJl8rnvpS4sra9yNf9jBpAE+0I
    jivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760679367;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=V1ftbw/xifrEz+CnZmZ9tWc6u8KjSUSp7/wj1ZCuhEc=;
    b=VD8MpKzJG0ZPaoQ+QS/m+C3DkxPsf+s3VSREIUyke9kOnWmzHbkczysz7kWH2BpdYz
    gQK5Y0/1QMfWE0/4UgomRUREobDn9yBNpKOk7YSfRb+sIfXW6yTykxfew0oKu80zZkxL
    LzbjeHtwIYYcJ0Q9PRvsIKBdi2uYyD+vsOgiScPiEgKSeGzbfMJ9MTXDDKqjrYF92xJW
    bCCJ4R/S/RJs3bO3Gc/qf1XDqqVDtuEJ2qo5AdoIRKRdrEWizM0OBTRqgFo213gFZNLv
    +LhlSdbnYC+7yx02yshw02AHZqe+RsLNYUNNk/t0TJy5C3l2CmiqWjCcZcE7yBKMCLRm
    YOsA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760679367;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=V1ftbw/xifrEz+CnZmZ9tWc6u8KjSUSp7/wj1ZCuhEc=;
    b=p4asQUKSpu5XH3qU789oDLxeuFzQF1kBnJlCSH87DZ2QghYoZVc3C8LR/rwDSn/QqS
    pCppXdOL699TmmGd2Eo49mJHjMPzYJA/xvRb7ur81NfidkYYNagDA/A1OMyqDZ/eIho+
    5mALXmcOKCC3vj0jnhP8PbqASVJa6ns27Oo5HOGf0lA45SetKR3Gzfv6dS2y0nqzZunq
    UD90Yn6Vhi2S1aVvSei29r1Bu60wQH56NVOCmUgQ2/JbrKWv1VS3H52cF6ub2Hr4DeOy
    xAMzhczzZKflh3T23PYK6udZN7mnUQiFvECvx9BMMgHfRbN0HDIDFVdnDvrzTPSeLXff
    0oIQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mysy6RDnaymUgyFB+wT2Hhua3CmtV3D8PNDg=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619H5a6eqB
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 17 Oct 2025 07:36:06 +0200 (CEST)
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
Date: Fri, 17 Oct 2025 07:35:55 +0200
Message-Id: <7110C357-F7D5-405D-895D-20DB5CBD3849@xenosoft.de>
References: <6E949EB0-CC46-4B08-80BA-706FBD23D256@xenosoft.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <6E949EB0-CC46-4B08-80BA-706FBD23D256@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 16 October 2025 at 12:45 am, Christian Zigotzky <chzigotzky@xenosoft.de=
> wrote :
>=20
> =EF=BB=BF
>>> On 16 October 2025 at 09:53 am, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
>>>=20
>>> =EF=BB=BFOn Thu, Oct 16, 2025 at 09:36:29AM +0200, Christian Zigotzky wr=
ote:
>>> Is it possible to create an option in the kernel config that enables or d=
isables the power management for PCI and PCI Express?
>>> If yes, then I don=E2=80=99t need to revert the changes due to boot issu=
es and less performance.
>>>=20
>>=20
>> Wouldn't the existing CONFIG_PCIEASPM_* Kconfig options not work for you?=
 They
>> can still override this patch.
>>=20
>> - Mani
>>=20
>> --
>> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=
=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=
=8D
>=20
> Hi Mani,
>=20
> I will try it.
>=20
> Thanks,
> Christian

Mani,

It works!

Thanks,
Christian=


