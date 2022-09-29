Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73865EECCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 06:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdL6k56r9z3c6Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 14:31:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RNTVzLmi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RNTVzLmi;
	dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdL6551f1z2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 14:31:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1664425876;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=6OxSNxiL5E0Rlq7eQ7tf4zxYjli23PthxXBeqrvx6Go=;
    b=RNTVzLmi5l6vd06nSSGMuXVJCWkV+3aGHNeVOXkvPko01m8YCZOtlfHReiggtf97vo
    LLelwzdZswxUFv+vl5brPzbCDLkYBScOYUKsKvB41RVzLccOusfuc+ktZdjt+Mk5cRII
    bKCFy4oZO7L75VhmX/VSrnFoeRP56y9OwthO1fz5wANTstS9CSGMNBNAaa9HpagJ3cLQ
    tn3Y7nI08s6r80XckZjLtwBNMtgDJA+j1MWw61EMrmTve5W9CrEIr+vCdATn3tTPzpkF
    aOk7amTz1IbjeebXNVLvK/Om4L9ZcyxYgcK4TdzRJdiqZQeLbfelYOHqB190Q0qXavD3
    8bxg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2YgjLpixXbAYS6IJ6tfkBh7Sku8chjJ9Yin7hv8"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.1.3 AUTH)
    with ESMTPSA id 4958bfy8T4VF1M7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 29 Sep 2022 06:31:15 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: PASEMI: Wrong lscpu info since the RC1 of kernel 6.0
Date: Thu, 29 Sep 2022 06:31:14 +0200
Message-Id: <D358C452-0B3D-4FA0-9A14-C756D79507F9@xenosoft.de>
References: <5D6A3537-CF85-499C-97AF-ACF241DFF597@xenosoft.de>
In-Reply-To: <5D6A3537-CF85-499C-97AF-ACF241DFF597@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: iPhone Mail (19H12)
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Just for info:

The values have been fine again since the RC7 of kernel 6.0.

=E2=80=94 Christian

> On 7. Sep 2022, at 06:25, Christian Zigotzky <chzigotzky@xenosoft.de> wrot=
e:
>=20
> =EF=BB=BFHi All,
>=20
> I use the Nemo board with a PASemi PA6T CPU and some values of lscpu are w=
rong since the RC1 of kernel 6.0.
>=20
> =E2=94=8C=E2=94=80=E2=94=80(mintppc=E3=89=BFmintppc)-[~]
> =E2=94=94=E2=94=80$ lscpu
> Architecture:                    ppc64
> CPU op-mode(s):                  32-bit, 64-bit
> Byte Order:                      Big Endian
> CPU(s):                          2
> On-line CPU(s) list:             0,1
> Thread(s) per core:              2
> Core(s) per socket:              1
> Socket(s):                       1
> Model:                           1.2 (pvr 0090 0102)
> Model name:                      PA6T, altivec supported
> L1d cache:                       64 KiB
> L1i cache:                       64 KiB
> Vulnerability Itlb multihit:     Not affected
> Vulnerability L1tf:              Vulnerable
> Vulnerability Mds:               Not affected
> Vulnerability Meltdown:          Vulnerable
> Vulnerability Mmio stale data:   Not affected
> Vulnerability Retbleed:          Not affected
> Vulnerability Spec store bypass: Vulnerable
> Vulnerability Spectre v1:        Mitigation; __user pointer sanitization
> Vulnerability Spectre v2:        Vulnerable
> Vulnerability Srbds:             Not affected
> Vulnerability Tsx async abort:   Not affected
>=20
> =E2=80=94-
>=20
> One core with 2 threads is wrong. Two cores are correct. Each core has one=
 thread.
>=20
> Have you modified the detection of the CPU?
>=20
> Thanks,
> Christian

