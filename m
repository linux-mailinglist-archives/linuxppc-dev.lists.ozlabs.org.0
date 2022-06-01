Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861F539B21
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 04:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCXgL1mRRz3bmt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 12:10:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=S4+SSTWL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=S4+SSTWL;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCXff6Flqz2xrS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 12:10:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1654049409;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=PejTb7qqL8A+3fq/zmYUzlXvjpEQH4ImNn6KURSI4Bc=;
    b=S4+SSTWL9wQkyiwmBeJVhSvMTJozEs67h91yOzug1CBzhxzOFlruEG4yzkCUMNBDrk
    OOm2l3JYwz39NREKSpagZz7ojs5RFQDrkRcggynt5wKnCNI7DrbvDtdo/Bwq1jc5e1HW
    ZzUqJiH+BVMuZz790lc4TQsoiylWuDWlusWKJSqfnqllmeDkM/kBGM0JP4X/0+f27IHn
    yiv5Wy0sa2/K+OJmC5pmU9BP/xmnxiTpcPNhnhcpSdaaJzURvFgVAMhCbFnQi6vsIere
    tz0OHAo6XBJmEtqqTdxQYje/O5v63HOcU1ZC6z9txyDNSBvSYpUo7+XlZceXBKeFjIoL
    wYyA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdyjbowwH7c8C2Z2K+7E1uylhWIoA8F4n9O30S0"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y512A8sIG
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 1 Jun 2022 04:10:08 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the devicetree updates for 5.19
Date: Wed, 1 Jun 2022 04:10:07 +0200
Message-Id: <84D1E144-6BC4-4320-8F68-0701E263A398@xenosoft.de>
References: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
In-Reply-To: <CAL_JsqK+OqML54Dfs_JNeM1_od9EBGf-eMH_4sXgpjqs2R-iYQ@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (19F77)
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31. May 2022, at 15:46, Rob Herring <robh@kernel.org> wrote:

Do you have a dmesg log?

The other way to fix is creating a IRQ resource and adding it to the
child device resources.

Rob

=E2=80=94=E2=80=94

Rob,

Do you mean a dmesg from the boot loop?
The other way is a good idea.

Cheers,
Christian=

