Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E690ADCFE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 22:18:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vy5w1362zDqjR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 07:18:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.89; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="evkfOJaN"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00089.outbound.protection.outlook.com [40.107.0.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vy453BtxzDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 07:16:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCspO0M3RrGmA87kuNkxogTwkieGkHQNugNq0SOd0RKJnNczTkDiFmtUn0mTs9mfQ3Oa5kEZ/3uLXNdvkdD8FpIi6DtuoI06nGAqJb16M3+SP6sQPKOvt0hDOdgnKdDUPH6Su/UucNdalDfGmvh6cEuisVvePL3SsdsdAYjkpFeSde8WopA+uLzDFuJqpDyt8AkStNyRNRFG/jQoKaMAauJcqPRkqacRCJbZjZGKFsOPt4Zz1gpFSAj8qSy3VZ8+ZQVWLsQFM2JULZJuhbZcfC5yVXvWDFkGp6IRlvme88MSALQiYHIn1aJNqEh9CdntK1hxJY8O9uEtjYr4LqDAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LypLTGCen3B/aXHTsoz3SA3fJ+BBotxHMPxkIKk1bZs=;
 b=Knlvmh9nPIW+uIFk8CEQpH8CYytphUuSljYuI0HFQAsXDKNz9DPtYZ9DiwjiQSRQU/T3Seja1jL8K6ekMkRQ6NYz3pBQaVyuQR8yRhRmMn2cEvMN0ysPORs7i4hIEcuONRyGOVTB+juVaepu5vaZnfxtn0xeKtoW5sQCR5/QKZCTc71iayqG6vnO7fv2YV01ylRc6yx4wGBXKvzG/sp3vImIT9nyaTg08oVO1zXgORudyQ267gPlPQ7ZD7Q0H2/berPrQmZcsAlYbOX8sIfkZZYgsN8AuZCYl5sDVoTC0Ul03v9ylze6uJP+lvIdi8QsnKvOokwAIHX1LOIBY7VxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LypLTGCen3B/aXHTsoz3SA3fJ+BBotxHMPxkIKk1bZs=;
 b=evkfOJaN6WgtUP/qgdrE8pGXSIntN+CU3HF7NIOLUqUKkEncG/BDCBISya3+w+vybyzLzgN/wKaJG37pTidDV9xm2gsp4svdM36QdcEYGlpYMBA2sf/c+xkqoMl4PMKYd370Zxf7rG7zaoghY43nSFZxrnSTftBj6J4W4r560to=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.234.30) by
 VE1PR04MB6446.eurprd04.prod.outlook.com (20.179.233.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 18 Oct 2019 20:16:42 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::c93:c279:545b:b6b6]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::c93:c279:545b:b6b6%3]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 20:16:42 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Qiang Zhao
 <qiang.zhao@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri
 Slaby <jslaby@suse.com>, Timur Tabi <timur@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>
Subject: RE: [PATCH 0/7] towards QE support on ARM
Thread-Topic: [PATCH 0/7] towards QE support on ARM
Thread-Index: AQHVhbLu+r0C+NWO3EyME7mfzv8ktqdg1Qrw
Date: Fri, 18 Oct 2019 20:16:42 +0000
Message-ID: <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e096d09-24d3-4fd3-0950-08d754081747
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VE1PR04MB6446:|VE1PR04MB6446:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB644681593788C7190C0625498F6C0@VE1PR04MB6446.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(13464003)(199004)(189003)(66946007)(66476007)(64756008)(66446008)(66556008)(486006)(76116006)(66066001)(99286004)(8936002)(256004)(2201001)(74316002)(305945005)(9686003)(229853002)(55016002)(5660300002)(7736002)(14454004)(52536014)(71200400001)(71190400001)(11346002)(25786009)(2501003)(33656002)(3846002)(6116002)(6246003)(6436002)(102836004)(8676002)(6506007)(53546011)(186003)(81156014)(81166006)(86362001)(76176011)(446003)(478600001)(476003)(316002)(26005)(2906002)(110136005)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6446;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1wMUnAHWVaVIDqef64/YQ+JDXfd5ZUk7x2rdG9fe8GoiebHsiqqkn0viqJuOO+jtmiexw9wVax3i39xLwRDq+QPmUqsuLehL8KGlbS3NEEuNQo9nfnDQg7v1yUOIs2x3Htjt7Ur9M2Fg52VY/FFWfLKItjb/fbV1LfQvuw3nrmGDq8CJWe2fyXRKJDjRIMK0G17JQ/pw+eHK9BoFUGzdDpVx/K/woPeve1B2LjHqftl8DGxFLZyhjDWtSX3Maz78BVgnoXFSuUwJ0EDmJxlaicSXtZtMWAcnrM/sOjCpt0rCguQpmpf2hjWLBsG7OPMwCjTzSJE5t8ZxdVYSJ7WvO98bo91yb1y7uCIdbhioXwJnSPHPMcllsWhpnhZBacETYRLLEd/xaHlTeVU6hkmg6l3sU/RA/aW32dxzHPQSm4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e096d09-24d3-4fd3-0950-08d754081747
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 20:16:42.2098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1QtZMERHmzxnb2ZwIxQG5kxur90oeuV0kkyEnXz0Hkx3G/CwuncZUXO9y9pLgxqPXcDai1kSQuqpMsjZAiUAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6446
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Sent: Friday, October 18, 2019 7:52 AM
> To: Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>; Greg
> Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby
> <jslaby@suse.com>; Timur Tabi <timur@kernel.org>; linuxppc-
> dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-serial@vger.kernel.org
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Subject: [PATCH 0/7] towards QE support on ARM
>=20
> There have been several attempts in the past few years to allow building =
the
> QUICC engine drivers for platforms other than PPC. This is (the beginning=
 of)
> yet another attempt. I hope I can get someone to pick up these relatively
> trivial patches (I _think_ they shouldn't change functionality at all), a=
nd then
> I'll continue slowly working towards removing the PPC32 dependency for
> CONFIG_QUICC_ENGINE.

Hi Rasmus,

I don't fully understand the motivation of this work.  As far as I know the=
 QUICC ENGINE is only used on PowerPC based SoCs.  Can you give an example =
on how is it used on ARM system?

>=20
> Tested on an MPC8309-derived board.

MPC8309 is also PPC based.

>=20
> Rasmus Villemoes (7):
>   soc: fsl: qe: remove space-before-tab
>   soc: fsl: qe: drop volatile qualifier of struct qe_ic::regs
>   soc: fsl: qe: avoid ppc-specific io accessors
>   soc: fsl: qe: replace spin_event_timeout by readx_poll_timeout_atomic
>   serial: make SERIAL_QE depend on PPC32
>   serial: ucc_uart.c: explicitly include asm/cpm.h
>   soc/fsl/qe/qe.h: remove include of asm/cpm.h
>=20
>  drivers/soc/fsl/qe/gpio.c     | 30 ++++++++--------
>  drivers/soc/fsl/qe/qe.c       | 44 +++++++++++------------
>  drivers/soc/fsl/qe/qe_ic.c    |  8 ++---
>  drivers/soc/fsl/qe/qe_ic.h    |  2 +-
>  drivers/soc/fsl/qe/qe_io.c    | 40 ++++++++++-----------
>  drivers/soc/fsl/qe/qe_tdm.c   |  8 ++---
>  drivers/soc/fsl/qe/ucc.c      | 12 +++----
>  drivers/soc/fsl/qe/ucc_fast.c | 66 ++++++++++++++++++-----------------
>  drivers/soc/fsl/qe/ucc_slow.c | 38 ++++++++++----------
>  drivers/soc/fsl/qe/usb.c      |  2 +-
>  drivers/tty/serial/Kconfig    |  1 +
>  drivers/tty/serial/ucc_uart.c |  1 +
>  include/soc/fsl/qe/qe.h       |  1 -
>  13 files changed, 126 insertions(+), 127 deletions(-)
>=20
> --
> 2.20.1

