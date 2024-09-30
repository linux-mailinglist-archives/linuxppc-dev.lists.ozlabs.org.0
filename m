Return-Path: <linuxppc-dev+bounces-1682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71598998A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 05:39:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH6Hh01LRz2yHj;
	Mon, 30 Sep 2024 13:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727667533;
	cv=pass; b=AVikLiUnSkJ6/Hom+/AAYZ91EecFs5wNPyq5vQN/DaQ84KkLLbZhGmgdmRv0zWlIhYaMtLJMcHG8SBMdeuWcVfqGOnXIJb2KRkYPn2iVqaYKQ4IsKa+K4k2/Ekvbb3XQuHqpXgV89MF9PYv/zx4C8gPb0hUZkOsBejW/FLxyJqhcCYO21yYt6E24J+qKSnjVl67HKDb9eZ2OcNHIPgj/hI7PForSjHEaDvTj0N5E2sfM727GT2+9WcIanfL+olu91hOtlQD3sziv9z2G8+XdD6KEOBlT7VwQve/5WXnT5wtRZpeUAUwv/bXJOIdj+2Hl32V7tFj9yjgPIafbuatqTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727667533; c=relaxed/relaxed;
	bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=PI//0UTPL3VHrkQWYKvDQqIKEvRCesi0xk4kr7Yrf3rHkBhetimtwoWvahWMijvElo10GvYGZgtM+IGgtt80tSC+ClPvmVyocW0ZiYJkd8njsH0/q8I+nY+PV7NnJ3skad44dNZrC57vH2QDQUFaBSdd2CnfNfb5Q83fYqLLzYmCR8TOqYW5gDEJtuayM9vFOWE/GOTxZ5zNGel0Nw8js4YttGwF5NtFFZw8bgDeo+KvBHWnSVAp/Eqoci3MoQyV7X8+MlQXU7Ez0U0S2fu4yhr/PvfUlh5QREY0LGxMGb5aq5XlR972Nrz1TOF6G4dbAMMj7c6l3vQWCjEZiX6tqw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QeQhHvEv; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=XOZkiOAM; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QeQhHvEv;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=XOZkiOAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH6HZ3hPnz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 13:38:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1727667521; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GXjItPiKT9uG7F08yrY3tHL9cf8Iw+odIT+nD6SFQw0B3FbG0K2WjyW2mXZkytucHI
    YmWCoF/Pf49JrpvCPzXw5blvr/eXEoaGGQ7yR1M8offoMH+uuTe3xDcWe2EEpZAyf9ut
    nCLdk6mnBQKd6AYErEf1+yJ+j481u8vbpGF10+eeG//NojMnoafd7egaxkC/iF8kL1W1
    gIy0E444xaps5uCq4FAGUyZMPZDOmZCc+o4jwqZq1rkxQh14V39o2ug9VwSHykl8dpX9
    9hyfgxV910Xo5/MM62rf1h8rmdfqwRSnLrdvodF6cBtM8U99Ysx5gI92wwBYineVUuZz
    Ox/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727667521;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
    b=EiP5bWNuYologHGOMgkBO2o2kmsv4Dlfo0ES4Lpdt02+0YO8vVpIQyNM8Se+w9QbOb
    mv9WPaXMmXijn4YFCb5vaC/8CRvea9TXTFaNrEXmudgDtQ/mjne91jXCdxlT4G9l85tk
    Svft+IbLrfwzzk7uv4DpQUdRUM1LsGPBKD4PNzIex2xxvXtLU5xAEOziWhFdkf4PM5bc
    PAC5r2lz656JGiN+761C0se9Yp5enpMQr0oy0wFTI4Mxm/XlIoBnBXo12HJwVYzzSAqi
    Fa6AAgeKlq9Kc0pedFwZoXAC51nlFI7TvBlTcfzcHFIsSwlMY4qGS7r86vRMHvd8jHF+
    4Vzw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727667521;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
    b=QeQhHvEvp0sPXfLgfyF1IahpjvVrn07IcpnAVPYy/+8Pi0jbk1xbKA4R653QTFdJfv
    nvoZsdlIbdSq6mTpQf/SI4cakwo7Def2B+ysg8570/LfXbyAvZqtVJ8nl3eLx1T0ux87
    35cndOEEZH1IYqNWo0v+kntB08Sg6ndUcjPuXnbDvI+eI3l1f0lDmAOjIrawKKoC/PGo
    geHt7bT1/ItXNtS2bMs2VO3mujyQzj1I8/xRq2KPcImmf1bd8mip1WKpYbcZmUi2B7Cc
    zz3UMUo9SQokQ662I1nen4LQ4iBbOfNh3M0dtclN/AtSa44KrSFjzI1yUpa1w9Vzps1z
    RWKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727667521;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
    b=XOZkiOAMGkCw9o07aivF08eQOZLL0o169+3DkRZCkyYtYAo+sJbvdCxNZwOdultNWO
    9Hlkmw/7ciEFmIu41rBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpq0s3mSXHagypRTj2U+/aY7GigIdl/mSHO/"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a08U3cePP6
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 30 Sep 2024 05:38:40 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Mon, 30 Sep 2024 05:38:29 +0200
Message-Id: <EAA3868D-0DC5-438B-ACD6-11EE3ECCA63C@xenosoft.de>
References: <396DA24A-85A6-419B-8E90-9A05EF608C41@xenosoft.de>
Cc: Maling list DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <396DA24A-85A6-419B-8E90-9A05EF608C41@xenosoft.de>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPhone Mail (22A3354)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	MIME_QP_LONG_LINE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On 26 September 2024 at 6:38pm, Christian Zigotzky <chzigotzky@xenosoft.de=
> wrote:
>=20
> =EF=BB=BFOn 26 September 2024 at 5:50pm, Alex Deucher wrote:
>=20
> Can you attach your dmesg output?  There was a regression in the dma
> subsystem what was fixed by this commit:
>=20
> commit b348b6d17fd1d5d89b86db602f02be
> a54a754bd8
> Author: Leon Romanovsky <leon@kernel.org>
> Date:   Sun Sep 22 21:09:48 2024 +0300
>=20
>   dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>=20
> Alex
>=20
> =E2=80=94=E2=80=94=E2=80=94-
>=20
> Hello Alex,
>=20
> This issue is gone.
>=20
> Thanks for the information,
>=20
> Christian

Unfortunately, the issue still exists.

dmesg: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log=

--Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><blockquote type=3D"cite">On 26 September 2024 at 6:38pm, Christian Zigotzk=
y &lt;chzigotzky@xenosoft.de&gt; wrote:<br><br></blockquote></div><blockquot=
e type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 26 September 2024 at 5:50=
pm, Alex Deucher wrote:</span><br><span></span><br><span>Can you attach your=
 dmesg output? &nbsp;There was a regression in the dma</span><br><span>subsy=
stem what was fixed by this commit:</span><br><span></span><br><span>commit b=
348b6d17fd1d5d89b86db602f02be</span><br><span>a54a754bd8</span><br><span>Aut=
hor: Leon Romanovsky &lt;leon@kernel.org&gt;</span><br><span>Date: &nbsp;&nb=
sp;Sun Sep 22 21:09:48 2024 +0300</span><br><span></span><br><span> &nbsp;&n=
bsp;dma-mapping: report unlimited DMA addressing in IOMMU DMA path</span><br=
><span></span><br><span>Alex</span><br><span></span><br><span>=E2=80=94=E2=80=
=94=E2=80=94-</span><br><span></span><br><span>Hello Alex,</span><br><span><=
/span><br><span>This issue is gone. </span><br><span></span><br><span>Thanks=
 for the information,</span><br><span></span><br><span>Christian</span></div=
></blockquote><br><div>Unfortunately, the issue still exists.</div><div><br>=
</div><div>dmesg:&nbsp;<a href=3D"https://www.xenosoft.de/PuTTY_P5040_U-Boot=
.log">https://www.xenosoft.de/PuTTY_P5040_U-Boot.log</a></div></body></html>=

--Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B--

