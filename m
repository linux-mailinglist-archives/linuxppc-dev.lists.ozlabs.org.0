Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD559287B5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 13:19:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nuRR8hv+;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=m15218zr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFrdR68ZSz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 21:19:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nuRR8hv+;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=m15218zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFl004L9tz3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 17:05:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720163115; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ALE7toPJf8K9dDJBRiS5beFxxPU4vbGcIOExrWeRS+/b24qZ6cQOh0+IavuUBh2czi
    kDiR/sejECXkOQfDtRYcOCW3qMVRTOZvOqxgg0DZSID1Wwl3o2496FGkcQ5Bj0fI9FnX
    92FSwwMkkSr0ydgTqWs9cFaNDu/q4YJwjlsdPFJ+bxOreZzTMEbfRb/cdpdm9j7RLDJ7
    0P+Po/E8DNTW+FqAlil0kcH1BemKaxokzUBfxkv32WJvxcQBnrcfsKix7D7BWj75fuAh
    It1mRWUufFYy0uyIIDeR8zdMtsC6nDfDXJwfp+3CXLtsXQhRdcIpLGlbee8HnC3HDYO7
    Xpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720163115;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=uyEc37adm/3gn7AMv2T0HjnqTOY6bqfdoqeLNP4d6i8=;
    b=TCqyxlqVPRNxgjNcSRRvZcOYf0gGjw4qO2kccaWoNz2MFPr7dMGFhNHa3u6b4DT8Ks
    zsHlD68doFwP3OOXCuC/grdiZcG//u2rIuTZ9H7ZhNQMqiLJgbhLU+TklEAfRN6TXoRe
    g3vE5Iyxid8aUvw2zBw9zGR+EfqC814ZZhPLKsVkN00lcDnBFiJxADnwPDdRyjHF3wWA
    V2cZEq39iMjwwyFedLtOao8RU/3FmmrVr8Q5UlCpJwhOsHCfKNtudWcv/8XmobrAAenr
    jClqIzDjO/ZqgB9zX2YlKKDpHBXxFPVj7LzGm16LZ9aCeUTbrKcq5HtMtNdht0faYpWR
    T2tA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720163115;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=uyEc37adm/3gn7AMv2T0HjnqTOY6bqfdoqeLNP4d6i8=;
    b=nuRR8hv+s9ey0NeDc2TMn2Ras3wMBhq2gGwbadIiHQwOxu/mltyBQITBeMaQUXpd4J
    a7nkXhf8LdHXQcLzf+lYMkf+JGhNaX6kxoMYSMts+rgGd6FpUzuy5DgYy7fsiejlAPB8
    0YuT3PIMTvh1ITXo5YlO45wrfmbTgrENp7PaSXeMb4TEgG87JGi+rRP5+BHL6ZX/EO0N
    kivTwace14fRSvXcRd5ZpDSjOlDXc7Qc525/yurZnxmOGKWa1FqmikQnZCWdyCIzGOqk
    1SQ/jQo7B9trcm2kS4wyH/qSq2IFhu5lfsWtkLWhv7bCu4KRNg9thBbxSEtGAOVomQAc
    4lww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720163115;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=uyEc37adm/3gn7AMv2T0HjnqTOY6bqfdoqeLNP4d6i8=;
    b=m15218zriX7eWLMjfNVgJU92ZVPyvSoFxYub+Yc3MuYuoFa3y2tDd1oSPGxLo81qnX
    a7dfu8QGm8ILcIpEULAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m0s3zACH4zKZqEV93ynRnNbNQ9EJ4O1StAee0="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e0838906575FV8B
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 5 Jul 2024 09:05:15 +0200 (CEST)
Content-Type: multipart/alternative; boundary=Apple-Mail-2546CE87-8D21-47A2-B479-8C28BE9EF3F0
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives after the of/irq updates 2024-05-29
Date: Fri, 5 Jul 2024 09:05:04 +0200
Message-Id: <C2FBFAD0-DEEE-4906-80B1-5FA745CD9726@xenosoft.de>
References: <3c045b0e-70da-48af-9196-2f4225477a32@xenosoft.de>
In-Reply-To: <3c045b0e-70da-48af-9196-2f4225477a32@xenosoft.de>
To: Marc Zyngier <maz@kernel.org>
X-Mailer: iPhone Mail (21F90)
X-Mailman-Approved-At: Fri, 05 Jul 2024 21:19:03 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail-2546CE87-8D21-47A2-B479-8C28BE9EF3F0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

How about the other patch[1], which would be far preferable?

   M.

[1] https://lore.kernel.org/all/86ed8ba2sp.wl-maz@kernel.org

- - - -

Marc,

We will test the patch as soon as possible.

Christian

- - - -

Our tester has reported, that it doesn=E2=80=99t boot.

Link: https://forum.hyperion-entertainment.com/viewtopic.php?p=3D58627#p5862=
7=

--Apple-Mail-2546CE87-8D21-47A2-B479-8C28BE9EF3F0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div>How about the other patch[1], which wo=
uld be far preferable?</div><div><br></div><div>&nbsp; &nbsp;M.</div><div><b=
r></div><div>[1] https://lore.kernel.org/all/86ed8ba2sp.wl-maz@kernel.org</d=
iv><div><br></div><div>- - - -</div><div><br></div><div>Marc,</div><div><br>=
</div><div>We will test the patch as soon as possible.</div><div><br></div><=
div>Christian</div><div><br></div><div>- - - -</div><div><br></div><div>Our t=
ester has reported, that it doesn=E2=80=99t boot.</div><div><br></div><div>L=
ink:&nbsp;<a href=3D"https://forum.hyperion-entertainment.com/viewtopic.php?=
p=3D58627#p58627">https://forum.hyperion-entertainment.com/viewtopic.php?p=3D=
58627#p58627</a></div></body></html>=

--Apple-Mail-2546CE87-8D21-47A2-B479-8C28BE9EF3F0--
