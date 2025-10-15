Return-Path: <linuxppc-dev+bounces-12928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E8BDFD2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 19:16:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmyRH6456z3dTC;
	Thu, 16 Oct 2025 04:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.169 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760548571;
	cv=pass; b=MthAluHJbdcTIpyMrsM+VcGTe0UkEpA1i43ezF3wmvHGZCkYvwJ9XWQmPMchI/khXnIUdm3lhIxsMvSTIVnZfCExMs3gHjkCHowSyZw2vVn4wfQtaoh+w+iHcFE0rqNO3e6Uj50JkvEDFkw4n+Y5akpOSnyO5IQDjcxD9KjudjOQ/m6wX/Ef6qje1KNZ84nw2DWWzled7fVyLeij1hq2NtjBVg7rvmF3dmQQ1Z+qOg7mjru+4Uya3P/ugPghaUzmBBd8sHbZz4F3MjWP2ILNrzF3i/V5M6S822ddViXCigz60KJxgAtaOaegiW2u3Wx5fCPSt9NqV7423YEO6pJh2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760548571; c=relaxed/relaxed;
	bh=mN7F9fEBnozfv11Tt5u96tzW+BvAMVreqPKTX7UG8vo=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=a0qasC4WHign33Wta1BMt/TlO+WaZwUia85NEXmZ1Xp9snxAPo2Otr4kFQbzF2gngWpFqrkgNOmYWbTR8fYA2SKq/WfC/f6GdBtObFTyNelRMjPu53cwZk+o13r5zGPhF8VosUzZPP5gj9LvMM524GI22M0Ist8ywLoDYHp7vXsxSB3xpNUSIUaXxKZOkkMaLfpCXUONFMUb7u4tAZ/uQKSX67wkmWjoTA8EUo+JtkeYadBipn6e9cV3pU1ylVC5+K7L/lSFElfX5E70S52KW7TnYa1OX+Db/YvApTfqbyevFNJeGp9IIoPRx4DBZimWulAKifYGU+mRsbfTHuC0aA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XUVRtuVe; dkim-atps=neutral; spf=pass (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=XUVRtuVe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmyRC3Rl9z3dSl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 04:16:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760548562; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dw2JzGlArfW5XF0MlYkXghfQgL+saubV1wh+ECcZC/0PQhNgK2Fgs9AsZymdoWLMWK
    i00i6DICzpBi4l39CFu60dIB0PjuXKC1BmchzV4UUCyp+HBCO6Tp1MyJ9IcwxoOCX23g
    P6UhMPBli2eDs4l8vx/Dqquh2DCqqlsHsZsWQFOcIoZ6GAsNxenbvO/lKxQTrAPgor4g
    GeBDoG957i6Dxidn3EbRLdp3KPnaJDpNltoLwzmG2XkE0zAMnisLAlC0RXxth3v8rW9B
    Xgt0jFnFZ7ZynTnqqUIrmtdUDAFZF9a4xWhIYBnDZbh5lsdif67cJ29foERnyVx+2WVu
    zckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760548562;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=mN7F9fEBnozfv11Tt5u96tzW+BvAMVreqPKTX7UG8vo=;
    b=V64mkKEJxTQy0TcuY0A5rEhVi0wcwQwJq5ccMPCE7mN0dUubSj+cG/eFLD/h35VEDe
    MunyqXCJbPC14fPRhbNH7Bp3shP6PJ+BDDRNzjlbxBwyhmd/rMgnlEFKwGa3EfuA1q1/
    eWdEOBKGOtbX9/nYvOjk8ry3Adxc3GtotMzfAHaSYbTlByfa9eiAVZDtIYmll6Jyuxy9
    MZPIgE6dVyVyOVlGFx+GqnBJK3plZwwp9SBbktSHkRFXvOeeG4PQS8HW+WCdojOC0kHE
    esEejWTykiRXYZJrWZpIQCsgSm029Sm7jq753j/nKEfekQV3ugT+J+xeCzlOO7cbXmId
    rCoQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760548562;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=mN7F9fEBnozfv11Tt5u96tzW+BvAMVreqPKTX7UG8vo=;
    b=XUVRtuVe/N2UF+coE850spdKxjnk5mn2hfULUORgHdk30qOFmC4xlGcwJQfNXADNSm
    2Uk6s58wRGKoYs3p7iRWPtOAcWNqjtee1Ym3LOucdg90Nz3Rn99CZk7xRW7RJL/l3+zY
    Y0RjUSd+kgDuEgbbTwzvt5vf/mQYwdODk8IJjG42w4H3NgNdds/TNqDHxEhBG9enGu3g
    QvwCjpiJ+7zEfdjOAIZLlO3IW6qDynLLGFEzCRuZ3EGshZk/39iBJd5n5J3fN37gTDQj
    mXjdM3ekyxAvBWhQzTQp/q5mUURH+jy7V+0S/V9TmLBEe4EHMd8lT7cwyIgqpmyTAn7R
    1/Mg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5qwsy/HXXazq4HBi2zvo2F6xNGeYCT//RDyeg=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619FHG1YXz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 19:16:01 +0200 (CEST)
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
Date: Wed, 15 Oct 2025 19:15:51 +0200
Message-Id: <6A12CA6A-0798-49D3-A4AB-C2D5AD616F69@xenosoft.de>
References: <523e2581-9c78-4c37-9c97-578df079f008@xenosoft.de>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <523e2581-9c78-4c37-9c97-578df079f008@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Oh sorry, it was an old Mail from Bjorn but the lspci -vv and the kernel con=
fig below are new. I have used the search field and open an old mail.
I have very small time slots and try to work fast.

> On 15 October 2025 at 06:55 pm, Christian Zigotzky <chzigotzky@xenosoft.de=
> wrote:
>=20
> =EF=BB=BF
>=20
>     Bjorn wrote:
>=20
>     Sorry for the breakage, and thank you very much for the report. Can
>     you please collect the complete dmesg logs before and after the
>     pci-v5.16 changes and the "sudo lspci -vv" output from before the
>     changes?
>=20
>     You can attach them at https://bugzilla.kernel.org/ if you don't have
>     a better place to put them.
>=20
>     You could attach the kernel config there, too, since it didn't make it=

>     to the mailing list (vger may discard them -- see
>     http://vger.kernel.org/majordomo-info.html).
>=20
>     Bjorn
>=20
>=20
>=20
> Hello,
>=20
> sudo lspci -vv -> https://github.com/user-attachments/files/22931961/lspci=
_cyrus_plus.txt
>=20
> Kernel config -> https://github.com/user-attachments/files/22932038/e5500_=
defconfig.txt
>=20
> I have already posted some boot logs.
>=20
> Further information and boot logs: https://github.com/chzigotzky/kernels/i=
ssues/17
>=20
> Thanks,
> Christian
>=20


