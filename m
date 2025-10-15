Return-Path: <linuxppc-dev+bounces-12921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE4BDEB1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 15:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cms4l09RVz3dDn;
	Thu, 16 Oct 2025 00:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.168 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760534086;
	cv=pass; b=GNmyvsH9MM03oTqF7gPinx59Afioo2Sy9yEfCNLThxO/S/iH5zfrLEI7ChPaZPIrQ5ikjobsRMALkm0WiNEigQ2EUr72e21h3O2NALQKc+/DuJ4b1t56rHnvAnnB24zipUM3kMED7zfCerkYSo5EfP/n72bgKDti04u5kHSrJRSXFTq6M5rbeHRJow9GbMf3AxMoyhmvYwqZYo1J0q1WEMsZtO8zUiFdMRcw5RY5KxQImpW8BXIGUxtZh4qFAteFAINd28wf2/Pba58b6PL9Nni7vJpDOzAC4yzUP6lR480IuNPt0Etl+d4mILTNvv/31dUSL7zk5n5XZ2UdJFLcrg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760534086; c=relaxed/relaxed;
	bh=4gZhHOekIBNe8Km4MXWFVpdrPZpkGqI4Kma6KtKws4c=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=GklSbs2bfQjdLVIEZwZB67sb1SMZS0G2M7yMpe3UMwRRDe14ao3nM6RMuQ7LBARsmc66nbrSazbPsbENRfJ+TTKL6AOofMB2OSMPKzLui5uaGwYEUFX/q78gMdZJQuMJ4E1kvnU7b4RwH0tbauLeX4LY/qhbhx231+rqEPE9kEz0OX0pM8IWhNT+8s5s3kRbuHcERumOKumCrUSb6PnJKXYpbyVSke6ObQJmeOCn1JFmau7yUZHtX3wVH1j18F0QYFJSkkQtjIbyoTkqxttv2J8tdKRUqPVkIE0zkVvGfYJLuS8SwaDpxjQAmGo2bRLLij579nXsFFADJvX15GPGeQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GqsCcY/0; dkim-atps=neutral; spf=pass (client-ip=81.169.146.168; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=GqsCcY/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.168; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cms4h4TPBz3d26
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 00:14:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760534079; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=T8zQl3ru2obgWOk/Ch2hUErLiAdBQNcwpbsfZ2rncPiaAEmgyDQt2mScC2/3j8XsbY
    BaI6k7nsZFJTpJEdV2HO0TC8BcbWOj8O0xhEIjsQKROKRY8utTaDbutWRo/oZ6Ouvw/I
    rEF3bmtkDnQwq5SapYKkRMOEXNFe7jVIpbQPSryRSTYTl9IrgPbNxjoxLds7U6z+iaDF
    UnlwQ8ffhxpkTajf/UBQhud0QWW8OTPayLsdeBuT4sY6P2M1izTOtrAtONEarmCfxwIz
    WVqHJl6DyAD26SS5vIElhDRIEdDmWc8heKWHfs3PTcrTjuYCmQoejR3JsXVaWy8AT4xD
    /svw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760534079;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=4gZhHOekIBNe8Km4MXWFVpdrPZpkGqI4Kma6KtKws4c=;
    b=rG8QbPf6go/RGby1XYbzEf0e3t2IzyQMOQ7i2/sXaiuqjhseVlhURX8fj2NNHwhlyu
    R/kfG85yoCj3ff/sFQvcMSTji9coLNgkIOeB5l8NpntU8nUgP6/HxI/XKKqDoD4ZJg7A
    zrFrhvmZXyJ2z5ChfD85EmiaijNdKAw0Jnxhb+MKp7eIz2F4o+R85TV2qmtevGUkIb9W
    wafd1LI0YS1rmqnxQYao+fzQYgRBtkN41QXxqBZl6PXCkBFpCy5fBPF4wbIqN+RC60lz
    MorC9UoPjLUTIbP9gQVzWHcqiyZlj2W8gM9D0Hp+PVSBv4/4ILu1l5vLDqfYtaHW1lYZ
    gYIw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760534079;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=4gZhHOekIBNe8Km4MXWFVpdrPZpkGqI4Kma6KtKws4c=;
    b=GqsCcY/0onXFnGXRISu0w3EO62KrAe+MLi30T9m43fOrLel2DMeNFbKGRHBhLnEH+h
    GUcvMLHE+EcjwHh2mwlr9oC/BRxYd0wnJFdzeQFYwb+I7XnUvUIdoOA1SXBus/twfm9v
    Q+dq5DqnOKbvFxxEL94vZUj+bqrVAlQriv8cfFrHYeo0hKF+AKoycYQLegpag5bA4OuV
    7XA485Ivv36E8alUUya7l9COOt1/H7BuPfzOVDfVQZTWAT0FzH9rTwWnM27HwOH5T4/H
    4+icyZ4rWJMaay+DWmdPw36cQ+ei0+ULYZubFlWtvYSdJcY61iGVboU6PhnwZFzX1R4e
    NuUg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5qwsy/HXXax+ofCi2ru+NWolPb67sCbW3uT"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619FDEdXZP
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 15:14:39 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-CFCB9707-47FA-4DB9-AEBC-A6874E0AE5FA
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
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Date: Wed, 15 Oct 2025 15:14:28 +0200
Message-Id: <76026544-3472-4953-910A-376DD42BC6D0@xenosoft.de>
References: <20251015145901.3ca9d8a0@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251015145901.3ca9d8a0@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail-CFCB9707-47FA-4DB9-AEBC-A6874E0AE5FA
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Am 15 October 2025 at 02:59 pm, Herve Codina <herve.codina@bootlin.com> wr=
ote:
>=20
> Also when it boots, it is not easy to know about the problem root cause.
>=20
> In my case, it was not obvious to make the relationship on my side between=

> my ping timings behavior and ASPM.
>=20
> Of course 'git bisect' helped a lot but can we rely on that for the averag=
e
> user?
>=20
> Best regards,
> Herv=C3=A9

I think I will revert these modifications for the RC2.

Patch for reverting: https://raw.githubusercontent.com/chzigotzky/kernels/re=
fs/heads/main/patches/e5500/pci.patch=

--Apple-Mail-CFCB9707-47FA-4DB9-AEBC-A6874E0AE5FA
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html class=3D"apple-mail-supports-explicit-dark-mode"><head><meta http-equi=
v=3D"content-type" content=3D"text/html; charset=3Dutf-8"></head><body dir=3D=
"auto"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br><blockquote type=3D"c=
ite">Am 15 October 2025 at 02:59 pm, Herve Codina &lt;herve.codina@bootlin.c=
om&gt; wrote:<br></blockquote></div><blockquote type=3D"cite"><div dir=3D"lt=
r"><span></span><br><span>Also when it boots, it is not easy to know about t=
he problem root cause.</span><br><span></span><br><span>In my case, it was n=
ot obvious to make the relationship on my side between</span><br><span>my pi=
ng timings behavior and ASPM.</span><br><span></span><br><span>Of course 'gi=
t bisect' helped a lot but can we rely on that for the average</span><br><sp=
an>user?</span><br><span></span><br><span>Best regards,</span><br><span>Herv=
=C3=A9</span><br></div></blockquote><br><div>I think I will revert these mod=
ifications for the RC2.</div><div><br></div><div>Patch for reverting:&nbsp;<=
a href=3D"https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/ma=
in/patches/e5500/pci.patch">https://raw.githubusercontent.com/chzigotzky/ker=
nels/refs/heads/main/patches/e5500/pci.patch</a></div></body></html>=

--Apple-Mail-CFCB9707-47FA-4DB9-AEBC-A6874E0AE5FA--

