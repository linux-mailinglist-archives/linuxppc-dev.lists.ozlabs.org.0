Return-Path: <linuxppc-dev+bounces-12913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7ABDE452
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 13:31:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmpnB4c79z3d0n;
	Wed, 15 Oct 2025 22:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760527870;
	cv=pass; b=k+imYlT4ufqz75MfWQ01noU0dpoyZkyRQaHqsGucz+GSP7JY7MBbAAWLIgC92p6jSKUQwjRyYz+Qs8/K917U0MfFaUB3GZJUnEywMM6IfaVXSNu1KPYjmvuilLcVknY2OrN1Be4AyrTVuXWkjfF1GiQopjgZjR8dxElH7NonPwSXRg1OG8j7JemrKObSUUap7+Fy2pgWefaJxEqBDE7HXvKSqK1XqZjgDkQFsDCjKLQQ4EuX9D0M6jNMCnzT9dwRT9Li70m4PKs44WCHR3N4AzuJhUBBZVc/azVkyQz5dhA8Qe9K3UtCTPuUgKx0hd5XaKVre5v0VEEaTDbGXdyDFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760527870; c=relaxed/relaxed;
	bh=tiU1hck8P6+rhjduHLx572kUy9K4fLqigLL2LLhKmuw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=o1UeP6fFgAtjh+RsHh+Q5LoBmapY78cPfLANajEY3pgRH7PuQBdYcsS0TGPnOOZGWUo2D3Dvyz1wEwuLbSLAzyovasdrCBuLiDcOHzI3Wis/ykbNVvZd+6/tA5QAX252f/RIablhdcQJRvnQdRbqQP6Zo7qz/GKvr9pIoIrMlx9h+ugdfTQ5h3vZK+J0hEfF2aaSPOZZzgWbbUq9r5nFdlmEwwnh9jtLsrlmxqgY0ifdrHWXNv2FKLx9oDYoTS1rzE6XalrH/YBpUBrmENIgjO96jgNxoxiIkRJOfP6UD4gG9xffAvAxu4fqSGCqYlOeVwol2QJhcyT3za8fYt+Y8g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jygzf2T8; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jygzf2T8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmpn42Y5nz3cyf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 22:31:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760527855; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=n/AEa3oZ9e4Gvabi/neXFnxSHRtgC57wuGH+ZkzJVjISSptuqAyfjZqCMLss6sEYDc
    O490O6bXBAM6854dy+bWw2j2LFEdOTJHSjRNgVMnoSCSACwthAe7j2raRq/NdVW/IqwF
    dRIPq4pTK2g6HdNU+cNb5tLe1M3mNlwHhhsFmHkhT6z4tQWljTW2JhvG6jxlShEqngkX
    SE36iG2xznvkhbkXhOllvHHEYtSu/ah5XrkftAd5kLoL5IaRLMxuxz/urKAF6qttQLta
    hBSCRQOYiiuknFY1FIpTtL5Z1OalD3NKSa7rcxf88FBqdXapCRQ8hS93DIDznd9iZmdv
    RPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760527855;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=tiU1hck8P6+rhjduHLx572kUy9K4fLqigLL2LLhKmuw=;
    b=slth2aItOdCwsc91y8hIBPyf4VtCnynhFsdCD7LPSUsCYDJUXx4owp+vgc6kImEFEp
    xg8Il3D3Azwc+TYAS7w5k/5j1pFEbGvZYx4zRTvIJhoTFMzfu0/qmfYpSj7timQz0xse
    l1rzNbIdTqIFliqRx5lge1sM5ReYX0EYRkfNJ1pAmE57nOkgIIltJpj8SDaTy8d6kR4U
    rRInuVncmDPyusd58pyBFHtFwQ6jBkCdJUghbOW+P8XXMP6zKO/f2its4KEw6mj3ZSQ0
    OhVQpceI5BM8wzexQkY/eEuVSW83UK+2255hHV6L9W/e5wIc42gT6+sR5evykfwRe6wv
    SxYQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760527855;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=tiU1hck8P6+rhjduHLx572kUy9K4fLqigLL2LLhKmuw=;
    b=jygzf2T81XXxJeng1TAhAvfneo8m/Z2JARbCqv3s/KHuTTrgGm9SvnqaJ74SAaSlIE
    jpUUFejdR0J6u+Noym1+2tKLHws5rEiNp1+KQlyiVZDqbsyC3+njBtU1cGaZqIP5qMJI
    szo5pxuRS53A3yKNMOtMIxcN3gzIYPmINZwYmgnYd/IL5azia+fUkKwL1Xc4zSFUY5vy
    NP1piqUUwdyZAa36kNFVRbTaLXzYe7M0a/OwDTwNrWFC2mX5+Bd44Cl0ObXTEpwkKnW5
    cYYUZH659rVV23P1vmL+4xBR+Zw0VAbzabR6UWUY/k4hsbFj/3tiFnkJCBQ0gzNmvH4b
    B7dA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5qwsy/HXXayq4HHiz7trzKpc/q6JeX5UCXsvg=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619FBUtX2E
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 15 Oct 2025 13:30:55 +0200 (CEST)
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
Date: Wed, 15 Oct 2025 13:30:44 +0200
Message-Id: <A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
References: <20251015101304.3ec03e6b@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251015101304.3ec03e6b@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Herve,

> On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wr=
ote:
>=20
> =EF=BB=BFHi All,
>=20
> I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all=

> ClockPM and ASPM states for devicetree platforms")

Thanks for reporting.

>=20
> Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> an the quirk also fixes the timing issue.

Where have you added quirk_disable_aspm_all?

Thanks,
Christian=


