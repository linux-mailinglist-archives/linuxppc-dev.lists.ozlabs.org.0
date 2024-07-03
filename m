Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB592587D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:27:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=NlYiDjUJ;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HnKQGAsQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbYw3c45z3d28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:27:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=NlYiDjUJ;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HnKQGAsQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbY92q5Mz2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:26:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720002389; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pNni1aDpo97idlHxjXEYnr6cXufqQ1jfdjKSGUt64RdiIJ3hZ/VMc5U4O2R+3KRJF8
    eVmiPsIvVrA0xoR4cJTO4201shWC308D3zA4CDnlKcIQYMqsB0TXJRc67yQvQpD/hAd+
    fHbh4Qr7pFcE1wRbur2SCH1S52UJB6VStAy1IFJIHRDPiPO908GpHMxldhfba3x26afW
    bIHaFkvr+u5BZtgJbCQT9zd/d09jSRpRqXunOn90L4f4P4kTUzWzIc1+gc8UTFKkdS96
    NRPSAecnwQamLoLUza+pl5T0OdIHZ72zCckgnFqGDUJDZPqMfk2aST9N8vgOicsIlThO
    mfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720002389;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=gsB15KylrTss2Q22K6/8fTOKkDDS/+PxBfNc7RDie7Q=;
    b=UG+n1195gUiIEu7LB4gqzxjZecdaYprqZt2a6tpLjGHWBrJIdFUZwLVExUdocJMM9d
    uBSh4p9xwzF1tHgOf4imCEd4OTLjUVac6xO5wjDXQXKbPt6pbS8yJWEX1EZC8dQtnNOG
    zgg03J5KUOO5A0GhTvk/OSu26BePtiGjfupk42zzUJdhuB5ZGBHY1r6zD4kucH95ABd1
    8qkb9oxfZtkWjI/bYwO6g9Kjk7/tkgvjqs8Tqill2DVX9WSANCjV8MGNh7Hf0b3SEjDM
    yynHmklLA51dGl9oLInAbFyqsgrQtQWoP3adSeOnnrn2lZBNC0HQUENFyFKefxkpuSO8
    RTfQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720002389;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=gsB15KylrTss2Q22K6/8fTOKkDDS/+PxBfNc7RDie7Q=;
    b=NlYiDjUJmvVFgMtRhTdc3b/gD4AkDu0mBIay4tIzGxAIfULvTCZX93yP2uZuKH92hD
    ym+q8FC9qBTAV/T+hylgajPy2bpxTozICiH7EEMmfiyuqZHvxAZAsOJ5sDJs/AydDtms
    vWXdJLqUU8UM84jICH+D8aL1tGhIp1faiEBb+/PW5AN1uC3T/zGBxh5E8VBi0Jtd1Inw
    sOX7qLvDbwNf/lqhCENApB6yOtZBq4Pic/I9F1OZ2b5C2dY0r/KgIALFT1Xpif5bJANo
    AXeTzJbEig/pt+z+QKvxLntcTQssOKxKOok5Oz+Ix/dlvXACziytvv40ek1POdJkmTI6
    CYcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720002389;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=gsB15KylrTss2Q22K6/8fTOKkDDS/+PxBfNc7RDie7Q=;
    b=HnKQGAsQRUJcpMBsv1E/ZPqnTqey+uXtiTQTlOFjnyEkHRAWmJZAj2ew7Elq+gaeFp
    lhwKcR1ItlZ1bX9h07AA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5jgsyqQXntn0mkb0Dnz0PBqI1iVaDzyFx0Z7Dc="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e08389063AQSOWH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 Jul 2024 12:26:28 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives after the of/irq updates 2024-05-29
Date: Wed, 3 Jul 2024 12:26:17 +0200
Message-Id: <B550D4C4-6F82-409E-B5A8-E7D123ACB93D@xenosoft.de>
References: <86cynv9dx7.wl-maz@kernel.org>
In-Reply-To: <86cynv9dx7.wl-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
X-Mailer: iPhone Mail (21F90)
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

On 3. Jul 2024, at 08:40, Marc Zyngier <maz@kernel.org> wrote:

This isn't a DTS. This is a listing of all the nodes, not something I
can use to feed the kernel. I explained how to generate it.

Download the compiled device tree for the Nemo board:
http://www.xenosoft.de/fdt-nemo-board.zip

No, thank you.

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94

You know already the device tree: https://lists.ozlabs.org/pipermail/linuxpp=
c-dev/2021-November/236587.html=

