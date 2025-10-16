Return-Path: <linuxppc-dev+bounces-12944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84361BE2E3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 12:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnPkm1NqTz3bjb;
	Thu, 16 Oct 2025 21:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760611568;
	cv=pass; b=D+d9kzNBFm2iMKtWJQuFNc2iyD0Su6+4+ZEirXLgpcjmWXH1tIc5oxoKdnE9blNpzKMq0IBHohN1zmF74vDTqsqT3OO40DZzgkC6QrPANUpkJMex267ZDFuYBKVHXITTvhA+ZtdklQm3ILTxtdEevWpls+I/1Bu8O7egjqiAYuVCgQVLKQ24pIX9Q1wInUxUa9lp6KL2XWHsaRYOJdt8nDVOWCNlgQ29Z7xFjlNWX3PRRd9BjcQATcMMdaDBIJKK+K7aBwmW46lHYVJPw5NBtD0PKWeptcnfTjkniPIdMi1+FFO9qU/RQ1vImaoQtHgg2wtYnoqy19jZTf+8sQ5Wgw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760611568; c=relaxed/relaxed;
	bh=0+Eri/TpZ9fsThEcu/LGojwEhPU/LNAxeQR1cKjLRUA=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=aq2WuFG76EYGbHL9k4FexRLzjMhShOCUsTlwj4rsOm9lT0FRL75/7717om+QHNaZnYW8TgiMKx4TqV82HfhZAQSqEWs5Qjx+QvYpX17Ma+EmzbfSgjaLOFmwc4Y95GerFKmMNcQ4jeeNqStUfldsq7cGWj9F/contRQrzt9sCoKhHQcCAT8aVGL2cVQzbHiAdaE119gaPRWUGjTig1VS5coDcW67sp0sCCjyCil6nMT8Hs2+Cx7GRP7pbvhV4RZTyIfcAfc6sHVujWKtgbrD6LfWsU+tvYkfCnONP7d46LjCplOdltwLVygr9d2JYF7pp1IorcUAVtkzh4mfG6N4Yg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Lb9Ayz1D; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Lb9Ayz1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnPkf0RMmz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 21:46:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760611511; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kgRmJhBY+/cZ7Zx+zFdReelCwqYh+oPrLOyMrge3zxrfpu45o1BOz86zaUaqoJRXIC
    3lXxFvnH/Y55RErTDlVn+ElU9kRHbgyHhx+gXy9zhsNnfeRB8NHtAWNRWNJCy0P27W1o
    TJGw27DxgXy8EvnWVAX67rTVaM9WgYbZNp/e8H2SFRUQhIwwsiFTHaFIZSjLYCIoN1dJ
    OjKCZEXSVmJl/IENHn4rLERSW993nU9YnCz1BCM6BwIn4ihV3Lfk1Up00uLEMXFIbHJF
    z34qaofNCUymv4H4BjS0Y6t3NES7DJEOlic2PvDoOS/pagbnQCgSr7nYwV0mj84c2X2S
    PsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760611511;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0+Eri/TpZ9fsThEcu/LGojwEhPU/LNAxeQR1cKjLRUA=;
    b=qdd19+QB1LWdk3ea2PbhmcA908TdutVqXmxQ+0+Y0ZAooa7ubQIGO++hpnXonoAegS
    ln6utpOa7Q2L/8GW76aRPoVyySGqhbK1j+6JqoSpjyn0Yy1z1Sbf6yGyj9SpO7goJmx1
    PvMMwE2kgYGKYEtGcXhaSQaWg2wHdCuPD1pVEKbD1nxlrQ9rJes23tUccyVwa7MdC42W
    k4wTX5G3viZqeCqB+CT4MUvBHIsov//XVENs6sd/EJez3yzeV1ExIWMRGI+hyDQ2PXD0
    RPrvJM3fkkMiIDJC0rNdtDzbg5yuBXoYX8mg6lIdy96fUrEsuDgmw1lbX0JQaLFW+0Az
    QEmw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760611511;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0+Eri/TpZ9fsThEcu/LGojwEhPU/LNAxeQR1cKjLRUA=;
    b=Lb9Ayz1DVj/joNBEgULbw3HzrTMSFSYEomV1P29D+NSRTNY4bYtuGbvhGnm48GEtPe
    2aYYVpYUmrG6BaVRk9rLMaRn109TIm+MVqUG8WMOhGg0WxCz8d/n69rRKQnMcPm2N3+d
    3fd3U0+rk05Cz+hHGDvfIPlPh7xOc7UWOqP9vXleI9SUXkAB7oJrVF7UL+2m9Jsx45UE
    sTNq5VQbQdAPsZb15qpGoQOuLHhGlzTPQOl+I6yeTj3MDdyXNQgwutI1Yua8KJf+F59n
    SrUXJmicTS/7JsnWISxHKhcyOR2wbJr4FAlAtbOrWyLEBs7fuk4nIGoEngCZfhV+V4Gt
    NIKg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5iys3LBXHQhT9oAbY5gi9kPmpZaJCQDfE3RBQ0="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619GAj9cdy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 16 Oct 2025 12:45:09 +0200 (CEST)
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
Date: Thu, 16 Oct 2025 12:44:59 +0200
Message-Id: <6E949EB0-CC46-4B08-80BA-706FBD23D256@xenosoft.de>
References: <oholvk65xtm5wlyfbx7vsi4zpmbuvih3kqblfcvt2yrw6qr5wo@zzpghtqp6cg6>
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
In-Reply-To: <oholvk65xtm5wlyfbx7vsi4zpmbuvih3kqblfcvt2yrw6qr5wo@zzpghtqp6cg6>
To: Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 16 October 2025 at 09:53 am, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
>=20
> =EF=BB=BFOn Thu, Oct 16, 2025 at 09:36:29AM +0200, Christian Zigotzky wrot=
e:
>> Is it possible to create an option in the kernel config that enables or d=
isables the power management for PCI and PCI Express?
>> If yes, then I don=E2=80=99t need to revert the changes due to boot issue=
s and less performance.
>>=20
>=20
> Wouldn't the existing CONFIG_PCIEASPM_* Kconfig options not work for you? T=
hey
> can still override this patch.
>=20
> - Mani
>=20
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=E0=
=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=E0=AF=
=8D

Hi Mani,

I will try it.

Thanks,
Christian=


