Return-Path: <linuxppc-dev+bounces-14685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD640CAD0A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 13:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ11z1C7xz2ySV;
	Mon, 08 Dec 2025 23:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.163 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765195639;
	cv=pass; b=SGDuZozgeRkXtLMTgpJrtDeG/57H1oFdmnEdern1fkb+EB6sqxhGCvkH/2242lLWnsZL5uuNk8s2i97atzmGWnKQ5Kea9x9g7cNEuEpSXvUOBjmhxFci2ZMYo70ilvUcbNqCQJVJiwU+xCK6FrM42cFyWfz6QIPB2tP4otYhJAt/MCoEyCVjik7OMELkUEm2DWWRWW21A1eMD6XIJP1oa1PbAZNvXBsJuteTuK+eFaxz0hkYB/jD9iP3v8PLLjytrac3QN+WhPXmNZduLX2oDLJZDZ3ZYfmNgIbSK97NUHS6Aqdx5Jl/TaMEDDZTiU+X8VFl+ZK8MRv5qn6kV/bwiw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765195639; c=relaxed/relaxed;
	bh=iRfVRKGMWU/8v5lJ3CJFoeiF6tukm10n+2IuvTirtvc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=CCtzC0EsWhOQRWnRAKtO0423FBzvphWKA5e33jnNwh6+A+GC1lWrMp7uAtjm259SlzId4BUDs5R8UcRzxCg8u7ti1sP4UUlSOzY8ApWo/4d0AKhN75ywpIHfY0G+JR/qFY4rlG4LxLBq98U6RjUitQ/KeJ3y37gpxlw1k6BokoP0iB4dDnQdgGk/72CDs5c9bJZ04/sMDWeqxpq/FV6jFXGfbCmDbYJxtyfQb36uol4Iw4bdNCcchHOBXSjsKiMvMin+Dn4lXL5pixgSj/RYtKYBi6riN8s+kx2DKTMIWD7xzJvf2lFISHmLH4GCgjzuQ9HpMJ7pFr4/zRd2+8ZH9A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YstFes4p; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=h4Fr7C5E; dkim-atps=neutral; spf=pass (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=YstFes4p;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=h4Fr7C5E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ11v6XTBz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 23:07:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765195619; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dog3NxaqgB2LJEfATWYDMyjBfyZfrYtvwpxHu8Cj+CrwXXUGVr1BpjXgZQXWEHJ4rW
    0NjrOdRVTTge5YOqQeONkOEDsk+k+fKpUpXKmemkjLGjLJFGpQEVIJ8vIwGBeoTysjRV
    8+Jwp5r3pN8VgW6a5+dp7wTXqEtJ5WNxlMUKaGKJ4r2vCfI1MPvhGOtgANp35+W3e+8S
    TbRtxH0NAI4rlY08euUb6DodMwTLWwOgbU8opMh2DRHuNM/NiwgaMlujdQi3jTGy1BII
    oUG0voeq2a9YisuYamvfrO1K8Zf3pt45LscA6UejCNNLTkRjslW68IjwWp3EJ7ZKuIJV
    57ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765195619;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=iRfVRKGMWU/8v5lJ3CJFoeiF6tukm10n+2IuvTirtvc=;
    b=romAaJiFGHcTpMPW4yYtiGfFp11J0Ey2U6VZSOEwC4Pb47sKTGFcw0M7CvvEvgCKyc
    pOG773EbZED07aG1zvdy04olGJib4Pt4OOe/sDneBaDmfUJYOfevaBIyrNnN68H7C6Fw
    ZLb/OIjesIVlL2QUeMRfU6AA9aUAqKs5XVCD2X61YTX6ulk7Ge6nx9AQFpOyBlTmuQPR
    j7pNp2Wu4VHOcVVG/M6dTldk2wtZdQR1zy6C4dP9JP3chTmr2g5WJYbYQl8SJMGFERB2
    Lt2pYrFzQ6Kgv/GgiaUi/4rjeVYN8rCqY5vng3TESLJ6K+vFlGLPNMNlt0zInOIlx53A
    1zFA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765195619;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=iRfVRKGMWU/8v5lJ3CJFoeiF6tukm10n+2IuvTirtvc=;
    b=YstFes4pAtmBAVynGDoncd1wAwg5BOojJOyMjuwahzpvMLWbFtEDZ0MoEFiCPAz1TB
    /G048HcouH+fys0yigcBoRai1mhEzw0wSw+TFmW0HP8t7gJ+RlNcqLZRxXrbeqRhHILv
    G+OY4BHaXCCKQaTHS80pYPaYF9mbzVUiYqU2CcsS+sRzlZtQU0VKoytRfkwG7vaL7knT
    5DpdJKUgEgle3tEx+fvCnYU9hm1229jNVDLTAOagE72/DyMzaEhC9PooEQvPqmB45ktA
    Boe7798eRAdjHokBZJXGBI7N5Um+xLBXWNzAuisetLOCH3hS4O9frhVdJnrOgmEq9xCt
    5Hkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765195619;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=iRfVRKGMWU/8v5lJ3CJFoeiF6tukm10n+2IuvTirtvc=;
    b=h4Fr7C5EnZgMYnt0+gkGYWxIw3jqJf0yEMbz2moJhwiWqUn+vMfLFbnfb5n3kV/ysF
    hTkouw0iQ/J4046aTlBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5q0s37CXH2VZPiq48H/i2+1L88ixBiTBtCDvtI="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id ed69d81B8C6xCQO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 8 Dec 2025 13:06:59 +0100 (CET)
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
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Mon, 8 Dec 2025 13:06:40 +0100
Message-Id: <102879D6-E08F-4645-A2F6-DEA2C3E6C0D1@xenosoft.de>
References: <52ef7162-5578-4e73-9c46-2bae0be8df61@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <52ef7162-5578-4e73-9c46-2bae0be8df61@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08 December 2025 at 10:54 am, Christophe Leroy (CS GROUP) <chleroy@kernel=
.org> wrote:

=EF=BB=BFHello,

Can you provide more details on your problem, the full messages before the O=
ops, and your .config ?

Thanks
Christophe

- - -

Hello Christophe,

Here is the kernel config:

https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/configs=
/e5500_defconfig

[PPC] [e5500] Boot issues after the PowerPC updates 6.19-1 #18: https://gith=
ub.com/chzigotzky/kernels/issues/18

git revert ad952db4a865e96ec98d4c5874a4699fe3286d56 -m=20

After a compiling the kernel boots again.

Thanks,
Christian=


