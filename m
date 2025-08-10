Return-Path: <linuxppc-dev+bounces-10787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF75B1FB57
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 19:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0Plg0tlbz3cbW;
	Mon, 11 Aug 2025 03:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754846687;
	cv=pass; b=UitjokuVClHjFrZ7B5w9x0gaGS1RTo8O+LDWXwpZqE2aiikCsTWIAS64DZxRoMJ2IvhUxAXYZ4EhxH2vmIr39KUdNMxLCkltXs6uATwuRqdDKS543N6+HN9t3Ihl7clFvJEWS7QDIn0iZBq/EtOZODiVs5e/J0vdRxUGqOfih32eU930SFhfxjPiqyhEfYMo4N8Yu63YF1vV+yHLizlElhB7zNvr/t7XxsPubRJvMbWiVk0EbHAX9AfuC1HhwG5PEGjBbHToSMC/yI4GQh6EIWNzlSyaQgJjBh3SuiNJYmBsA1IbW2sU2aErByG3we5T42qMFNLDOLUoBMVlBWatiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754846687; c=relaxed/relaxed;
	bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=HBfM+MFI+tPAmhhBgQfWOIg2YIeslmGWO3EMRzkuKUuH5M4SfOV1j5LYTW7DwrF05qkk4q95GjZMt+jubHuFxCG8NEgIrHiTfMqXile9Ayti701t//CWrI1EDYIAUTMWL92c4A/JoPdHhhD9u3BiR1X82mPDaD9Fc+15VMpyX2Bk2LF5pXCYRdKahHmYG/kI2npLj8D9eO4yuWGlX3JBcihaEC2bAyGHc86McCmcqXqn+Hj4eVM8RLN+sISySmABlZ6dQMYtR0IM3hV31mwuH81SXgnI9jGScy6LQCWSmzDVgTzvvwntgT3mHeXSM3umVPNT7pks8o9slO2sg2L9EQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ILd/QQV4; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=mSJwuAr+; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ILd/QQV4;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=mSJwuAr+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0Plc1pyPz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 03:24:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754846674; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oNQK5+PqY46CjrpH3e9xKbosYqvzGHDHJOCrtTdYZsylmeLu2LkzGff4ibmELE6kBV
    DKbaYrwGccaRjTRr+bzUc66XDFJt4QWAApm7rVcLw0OrTh02z55hFSTgzbebOzJC7IkD
    wIJYR6wH3YT9J3QZeimbyOpY846Q6/fgB44EPZ21RbLw5o5DA5LQadfzMMGJ0iUR5mqp
    btCvQ6IzyJCLHvnyy6K/hpgs2tX6Xnc68k9iu06pSTx1+8U53tjUUdK8RRWFkvxLir53
    wyS3OK/gVuOB9d1Y6zt1hZ/cX3xBT5mRLUaEAVb+r2zyOaBvbiYvvkTGMVEZJwLe85aH
    to3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754846674;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
    b=W03oy9GZLTGl3vloF1ixrRHuvs79MRpe+86SZdnv1CkaW5Gu2E+zgvd1bh8CR1Ah/h
    T64uHMU8XDzogLajAiv0VmWhVEIvIPOwxmbVI0G+Ttl715mojO34Cvuh14ZWYe3LCijg
    0WtaRinvTuDywExALe6mDg9bkDkmTDSSm+jLYV6O02pqRAN0z7y9+7sjwSyAbJcaYTlQ
    fqmOEs/KxpXg0VEPaqdMU6YR2X3p4ea80zUGMekcYkDxysne5yM3cjViIGGQcpVEA1GY
    QgIUDujxPzlwBXkLWVHWI04I0eCxCHnBhO8t+pKBM0gQsrRReBGckilclLKDU4on+W6Y
    oOCw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754846674;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
    b=ILd/QQV4cZDfLcSLjgDwN/c9wRrpygXoq3DUferRDJ3cZ28nNoWFOZ+oMqVQjVqEQO
    6lX4iPMjnKm7HSabDeR8IXJ+b1PrTEJzKgfIJzXJcXGN0sqWllo/0MH81LbO/LTqCOag
    vz6iC6URJ6m5L8YqZ/ujHR5ZjbyP86LbMPyuwEjr0Ye/ej9qe2iUODvMBSLpJAIjyP5K
    v89TftvJfuWAVjdRhKpnsYRXaNgXk0D2GRFcnoSgCQv4zH9SBOpcMmtFc0SSzE0P8sMi
    6icugAnJIpBXgbO66OG5307vq+aVpP0xWjDz9mXkj1ugPymhqpkNCw5R3v36t5dWnUn/
    AAiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754846674;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=AlLcLAB2Bc+btCm52X2KnQOXTAjmxdMUQsJMtGXkE9U=;
    b=mSJwuAr+tiGFIs9kC1GnW58AtUWjTNPfVNgYAmSCCw+AEMbZF5x8AYFSFlMXUaknHa
    zDH96AqJTm9A8HrQeyCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i0sy3CAXlxHvOrG7LvSTpFZn+iXGWfH4wQ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c17AHOXAl4
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 10 Aug 2025 19:24:33 +0200 (CEST)
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
Subject: Re: i2c-pasemi messages since kernel 6.16
Date: Sun, 10 Aug 2025 19:24:23 +0200
Message-Id: <EB646532-DE5B-46A9-80CC-42B5F6E0C5DB@xenosoft.de>
References: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Cc: linux-i2c@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
To: Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> On 10 August 2025 at 06:48 pm, Christian Zigotzky <chzigotzky@xenosoft.de>=
 wrote:
>=20
> =EF=BB=BFHello Sven,
>=20
> Since the kernel 6.16 we have the following messages during the boot.
>=20
> [    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
> [    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 0x0821=
0100 (xfstatus 0x00000001)
> [    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
> [    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 0x0821=
0100 (xfstatus 0x00000001)
> [    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
> [    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 0x0821=
0100 (xfstatus 0x00000001)
>=20
> What exactly do these messages mean?
>=20
> Thanks,
> Christian

Sven,

These are PCI devices.

[    0.166709] pci 0000:00:1c.0: [1959:a003] type 00 class 0x0c0500 conventi=
onal PCI endpoint
[    0.166750] pci 0000:00:1c.0: BAR 0 [io  0x870200-0x87023f]
[    0.166866] pci 0000:00:1c.1: [1959:a003] type 00 class 0x0c0500 conventi=
onal PCI endpoint
[    0.166901] pci 0000:00:1c.1: BAR 0 [io  0x870240-0x87027f]
[    0.167017] pci 0000:00:1c.2: [1959:a003] type 00 class 0x0c0500 conventi=
onal PCI endpoint
[    0.167053] pci 0000:00:1c.2: BAR 0 [io  0x870280-0x8702bf]

Cheers,
Christian=


