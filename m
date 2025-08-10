Return-Path: <linuxppc-dev+bounces-10785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FFB1FB0C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 18:47:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0Nwv5FJMz3cZB;
	Mon, 11 Aug 2025 02:47:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.163 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754844463;
	cv=pass; b=A9rxtmYhQ1CIUcNqSt4Ggv+zsztoizkthzgwz5kAdYCNdlhrZpgX6yDCaV0Nnza/CKrCoJKyT8G+/DC83J9cWRIo/hzP3N4RDg5LZgFvOMgQRw8Q27cTFslaSaKM9aek7hZ2JPqX+2wUMA3vQXh2WgQFyopPNagKN+YpfR2eCHGB3VkWO08UYrTrMjBQpzT35nyziuxhk4IbugZOdpPBfcXzSLzf0WY5Gw6vvG71plYfTE7uJXZuhFc0ku6RpZEumsYLDJ+72CiFicwEConFrzJIoDUi6yH0r/zNZZ1mYrk9y2YxznQHFjoDDOuC2dKx8nB+qNp5tItpieANE6yTTg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754844463; c=relaxed/relaxed;
	bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:Cc:To; b=DynYd8Ha2g/HhctniwOmHMywx1g3SeyEuyZnqhVZQmEEoEIUrrVqF6PBsDokME/82YAB68aG/+S1d/4pzlmB6v739r8/EDsb8aVRCuF+QCMrhcBIXbCGr/+/aozDm0LqsBpRDmK0wbFH71kK3hmlHabJK2sr91QrQYfnAzTsm58uBEkQmhKmXmvdY9VAyodLg/pUAr/68GskmYlp5WOmy265QtSLuFOk1MeuIgTP5MgS6tao1nFwKhW3+CrmzTjPe1zU7Th2Y/hMZZLChLHTNAYWIvOkV5PfIpyhZj+VTFnpySQwfdOAM/dosqKCXaafQSLMN8UJU7sHjZxLnCqjMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i07nSyft; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ZdyWeubP; dkim-atps=neutral; spf=pass (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=i07nSyft;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=ZdyWeubP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0Nwr1S2Xz3cZ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 02:47:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1754844446; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VXz0zV/10okRV7NZRFQ3L4TxH1I4T+qVPDVojbrQwnzr6r+upDmrcl3f2ODdv71ryc
    ICw2UBJ+pBeP40ld+62fatwwLcs64Sj2BbpsMDOvr65NOz3dJIlhyQ70LOPLuBcJMA8M
    zCypae7pnuQYfI4G8x/EN2US6JI7lMSHlVRgXjxZjop5AaXsE9EA8hUoyraAj423AZzo
    0z9WhhYyCZ/BJnWbSfBCuXwbgbec74UF/x1cElKGK70Aqlt0ut69dYehWBCDoJ4+y0A5
    JXBmjJ7zVmLnv+R2Ku9YfsEP9wcyQkEoEdZ69jQlWmOKNjWtTvBG9qyVntfrLwW5yzse
    wSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754844446;
    s=strato-dkim-0002; d=strato.com;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
    b=n1PUK/YvBdWNBq1OAHS/wOavNvEjhe9IvqXEBml7GnqnNEjGHHcsFnjhY4V1OgAfGm
    LE+KW8Kl0LVIMsEY+lQNNGxj4zgKg/oxJeHLREwRz8GdtkjG5Z56xLMmUCg+HEssHnq+
    T4wTDGSTYMSR0UKZA5KXwuyRyuYABThBByHGi3BK/AlN1uwJZCRgqAbkGoo2QInNbbF6
    TqwM8xugXOEADbJ2U8mhJhUCh6Ra2UPROmgp6DSvQjb2ST8nhUi4G8XC+SPElSo+urqd
    E8cB6Ygfs9hi9M9co8uHBryX/U8N4EXOp5NEpaw7AwfFCondJA1dDghsiqC0CzIwDPgx
    6aug==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754844446;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
    b=i07nSyftgzRQ1n6gCY5Gumj2m/bT4oRp42V6WSgq12Y9n6yGxHlRwJrZM+sihHkmDS
    xg5KwOaFv8O9xfsa6iJ2zB2xIJAbz1zXqm1zlrFyMB2pQKQGwjhEzSQZseX1YV89sR+K
    2A8HKGtqDiDhPpvYUJqLWfRPFHNr2fXgGf+YoT5OMmfMOVCyT7FUY5HiDp/BMWk9gM+1
    93Dpw6LaZH16xvnUZowKi+nos7V75f9zX/hMhv8G7ntjCBUjL2UB+gy1zZW+KDN+Oo3O
    ef945ocJRCz5SkgQMG6Ifc2GBGT39cCjMVQqNAMdToRTlEk+VaQakn95p1w8ntLudYHr
    F6uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754844446;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=K8pt8WbN3XbRW6chuXyhwg2rF9l+Wdgb+Ie3sXEsGx4=;
    b=ZdyWeubP9kqqk+4WLh2X+4LmDERZFexOO1gR6oF1N5gDBMezkWAsVPBPHg35tHWir9
    3zHv2oKhXbwES5tTTQAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5i0sy3CAXlxGfGpTL+7TUpaIT1L8AmWoezzKas="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 52.1.2 AUTH)
    with ESMTPSA id e6066c17AGlQAhZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 10 Aug 2025 18:47:26 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
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
Date: Sun, 10 Aug 2025 18:47:15 +0200
Subject: i2c-pasemi messages since kernel 6.16
Message-Id: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Cc: linux-i2c@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
To: Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Sven,

Since the kernel 6.16 we have the following messages during the boot.

[    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
[    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 0x082101=
00 (xfstatus 0x00000001)
[    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
[    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 0x082101=
00 (xfstatus 0x00000001)
[    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
[    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 0x082101=
00 (xfstatus 0x00000001)

What exactly do these messages mean?

Thanks,
Christian=


