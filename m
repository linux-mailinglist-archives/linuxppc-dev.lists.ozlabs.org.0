Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B846286A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 00:38:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J31xs5Jvzz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 10:38:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=PdHf7My5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::631;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=PdHf7My5; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J31x20nqGz2yns
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 10:37:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q053SO3dJELLGG1Jw9iI/mVMJxpcn73/z0CVSeiArPDoxlVPsNeSvLmiKnJzOcv+CHRB2gxpzbqdYuRqoGyvAaky+oCFtHUyC0t98wOe8ga1MCoMuaY9w+N3iEZxCuu2iHcYECBEsgT9c5egxmV0FBampMeClYc4LQ96abrii54rKkNOqrMfas934eETwjAAi8RtNKtLb6pp1cimYMhXvK2m6ijXg/ldh9GPZ8AZNoFOSoXghExWNToRTcAbDrOAaVTBdPX7Cgf+eJfAlXhk1xj8Dl3QshEcK4ij0/WSZ7IrKi5QAprmvCBWbgziBDQYhptvuFjFM+2V+ULUnKWajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p7UINnTLGsHpT0juEU2ln272Y+nt7jF7BzfWT0COJ0=;
 b=LDqGA7a3WXgRIDNdkU/RXC0nLSrWgF9h0CXjbQHkqWtlRJ0UWSdfOIkjal3IaU9Bl6FrwlYaqYsKLWp0n5nQmvoHQVRPvhLm1Dr1e7qYwkTboq0NrvzwRTxcQe7xLZ0SgkjMrEM1ZukVVsPu0eJzrhQH2iCPBBDrxMFDu4tu8eY/RCFS/5BrlRoy0OLsKymPIND2n7X0/4r1XhQqab5JxwnK++ybWTkAAktToErOHHdky/2ahcwM8TWEY7pOU31dDhRPc7UOSbgFbHNZ8/GrSHY/aFMz9odAsIN85IVEIPkUPQHzM76L6/p2fnK72EzLmPiDHIqTY1IVdBpABJPuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2p7UINnTLGsHpT0juEU2ln272Y+nt7jF7BzfWT0COJ0=;
 b=PdHf7My58aj/spOFjGV0/PpMiceCWU83bioncjyXQ5cLDuGVF/jnwvTdAPtJD2Ft1iiOjCUgGhqW9XzhjHmB8+IZIKasHTLO11/TDof6qPzJJ6IJv9l8RrxzRfmKaxEWAKFlNrlfok/j4a8VgdH/wlYF/WFMlhG7ShlpH7Kp1Mc=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS8PR04MB8497.eurprd04.prod.outlook.com (2603:10a6:20b:340::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 23:37:17 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b%6]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 23:37:17 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, "jocke@infinera.com"
 <joakim.tjernlund@infinera.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQ
Date: Mon, 29 Nov 2021 23:37:17 +0000
Message-ID: <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 018527b5-7a13-4f59-c0f8-08d9b3912e04
x-ms-traffictypediagnostic: AS8PR04MB8497:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AS8PR04MB8497BB427287E27A428EFA758F669@AS8PR04MB8497.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bwR2C7oQ/13mMm/KSYuNch6/C5Ik6sVZ1vRKphPAzHhEGeUs3VVGbz9jB5uNzFU4D+6REliERPlYW5iY5se+CVWKxMeNhpnmNU5tUzcCSIx1+6L7caeYlQ+ROLCO1tlWH011zwUUxZltaYm+4Io+gVXPMV5+Ci33/M258eYcwvlqobwaiMzGHxGmZuNt/VF9LNpVi2EBVQtUOzusoo3dTd7zuj+YVynvUL/P+cH+KG3zXjmYJEberMmKsyENz0D+jCjJPjNJ3VqoVAEcr0p9yYXin41bNmPcLsmMUG0FYnT5qfJc+Y7LUKkQoPHDTmo4fyfYGkGLFcbDQt2vVMQt6oLoX6xewJfAk9Al6TYWDGlyNKvMI5Voh6tieuouDDHILAhvR+3ZWStk1L/4hIIH/Z56L9E21hTYqP0rfjPRvy4PPVtKYmZLU0V1lDjx1fEvfahiKXYsn2rRsbm4hbYA0dMpXO7Xt+/yDqZKdObsCF9/vRO8fDGjv8xD29xgF8yj+JzyY2rSBNOkn5g6to/rg0q1py1y2qk5nq3vksrcIWLt3TOqtXrObASsSlTaZCv6LCjiss5bQGasQiEf61O8TnTYcXp6CVH3N6JjHNdhGWn3uqqUbg6Ca//5EPbNWzteTp0MTO0OhE7qGtoW9p+Gsrgq9lK88obF+q7BWYuYkpMqrANK2+M/0HQSHFfN6J2Qe4aqT5CNAMdKkjoeHpbDkV81uVapHDy293a5R6ExzMLtSJq7RoaxK9UOodenNGEim5ZGMOqwAyoIP1e1qY2d0YVflhHRfiIqNgXK7/cFd6ijdBacE6/NZo2zOKlWVvw5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(52536014)(8936002)(6506007)(8676002)(4326008)(53546011)(316002)(9686003)(83380400001)(54906003)(2906002)(33656002)(38070700005)(45080400002)(4001150100001)(71200400001)(508600001)(86362001)(5660300002)(19627235002)(66446008)(64756008)(66556008)(66476007)(186003)(122000001)(38100700002)(66946007)(26005)(55016003)(110136005)(76116006)(491001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BquO0Nd+yU7wNqINuhNlaMy3x9RYa7rYdzdbPEsea1syPNKTFsl1lI2zzn6W?=
 =?us-ascii?Q?RwMKGGuk8EAHzWUz8XzLjOPvcmrClb02AyMm22tECM72FQjSrovdnREyqRWO?=
 =?us-ascii?Q?vADmUVj8T1BRmN6Gy1+xggfPT3IYEiIT2SO0e52EaBd8edjsd6PBXX0roY9g?=
 =?us-ascii?Q?yplfla52tmPU61qvLDJ6axVv36MILmk71DNM+rIu33Cgf4iuIDtDAutx2cGM?=
 =?us-ascii?Q?Kq1ZjmxfA/5DVJmLCRDJLL25l2LZItw6iYlBInYhJvI3b8gq+kitlta0siQM?=
 =?us-ascii?Q?4SWUC3AQR1oRTugMdUO0gI3wvSUFmVlyRyYJUU7Np3VERfMNw4+u4ffPIz8A?=
 =?us-ascii?Q?sJ/8JD/w3oqZHWImN34VpX0hhB4wVMk0eMrGDT3+noC/Ki6F0Fq69f/AyaIk?=
 =?us-ascii?Q?tZ6TBnmCjpdxSHvccliqWazE5xP8LuGBq6QasqslT/RfniHJ1yl3R6bYOwhm?=
 =?us-ascii?Q?/1O6zllqHdyRUMAOC3Oe8zCBAeMPun/lNEFzhmM7szzCkULotdd18y1veDzA?=
 =?us-ascii?Q?ypBItlfe50t5/cUNHLpByizXPavI/VN58h9WnOGK2pC4kGOrXHX0jja2VUBg?=
 =?us-ascii?Q?UI/6x461MyUxd283JfsX89GG7JVUOMbL30OnDN5oPwyjzf7bGfD7wPUH088W?=
 =?us-ascii?Q?rzF9ogNGFZLeJHpzqD1RQ+LsrStTvITXUixmrIa+/rZk/XdTcSHTddi7hNV5?=
 =?us-ascii?Q?KgKN89NrTdim7SkongyYrDMJfw2vf+o2HmGUDuZRYG9yqbuz4d9etLQUNsHG?=
 =?us-ascii?Q?wihJAYCw/YQSrbw93bQPXNvJzWDlIDlARcj4S/hE0F46ko2UTB7o3NWcKBJN?=
 =?us-ascii?Q?iDQmlWapgV87KKwDENY2yloWpt70psw4nNwG4LaHdl2fHSkpkl/UKZ+PsDP8?=
 =?us-ascii?Q?wk9NzfKQn45AJEMW8Mtm/YHMvIWXE3M36hX4kB7IFAVqERhqUtXJYIRZTH8H?=
 =?us-ascii?Q?cBHsYQIJP/3NcxZt36OVg09QNjvEj8coRvcClbjz6iZaQTp7w3WjRqzCMc/c?=
 =?us-ascii?Q?pPuFerVINbm+vyoSsrcpWitECNGyyrVikaDqb0S+GyfMMaxrPmi49rJlbxuQ?=
 =?us-ascii?Q?KQrCC88HbxbcSH5TV91wHbxUhBlnlJGYOpT42l15p491akqrx6OiWZdP2D2D?=
 =?us-ascii?Q?tGxnA5PYMLKIgTVCtog5U1s9IGpqJAWxyMAcIlbbLaMKihBGzg9c7qcZyco9?=
 =?us-ascii?Q?oC8KudQplJtH6NBcvxvn5WJx3gBx/opFUK2iavDQXxOPwCK4e/OeEy+9e3z+?=
 =?us-ascii?Q?gScgNf7Z4BcP52AZij7qwrXZbK6L/8pGpahHAmlZ6Ggt07OWQOGkcWX4I8q3?=
 =?us-ascii?Q?QQwrAfuxFF6Ip+TspXpbswgovjeYtxEsYjX3xIZBQisDv/dwgQlN1JRKR2kC?=
 =?us-ascii?Q?nn2rwxjVFRTGxy08UjahJjkQWZIOhtLIb2XDSeNomRxsrMyYMPx/0Js/TmX/?=
 =?us-ascii?Q?o54KFzfg56jkppxhgDBPeQHnWyeywtjhm8nTsR/XTDt+3uUXlFiNMOsmN6o6?=
 =?us-ascii?Q?64M58rPrIVkRZDaYdI6u1XF8ApM9uc8cqdFG7ON6QSut3UtygkOgAZraqLW9?=
 =?us-ascii?Q?b3gnVxRbiovQfdeT+QSZ/VJV4dzjd/ooDQoOa3Cr0eCqB8qrY8UBjsYL1lB9?=
 =?us-ascii?Q?qQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018527b5-7a13-4f59-c0f8-08d9b3912e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 23:37:17.2303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwoZQFJhJcQToQmBvGCv8LS6AuyNa9xECx1nnqdZJosRxRebkeKg5b11vxGJOBrrzMk3vKRNZKmRLFCGqnHmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8497
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
> Sent: Monday, November 29, 2021 11:25 AM
> To: Thorsten Leemhuis <regressions@leemhuis.info>; jocke@infinera.com
> <joakim.tjernlund@infinera.com>; linuxppc-dev@lists.ozlabs.org; linux-
> usb@vger.kernel.org
> Cc: Leo Li <leoyang.li@nxp.com>; gregkh@linuxfoundation.org;
> balbi@kernel.org
> Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads =
to
> unrecoverable loop.
>=20
> The final result of our testing is that the patch set posted seems to add=
ress all
> known defects in the Linux kernel.  The mentioned additional problems are
> entirely caused by the antivirus solution on the windows box.  The antivi=
rus
> solution blocks the disconnect messages from reaching the RNDIS driver so=
 it
> has no idea the USB device went away.  There is nothing we can do to
> address this in the Linux kernel.

Thanks for the confirmation.

>=20
> I propose we move forward with the patchset.

I think that we should proceed to merge the patchset but it seems to need s=
ome cleanup for coding style issues and better description before submitted=
 formally.

>=20
> Eugene T. Bordenkircher
>=20
> -----Original Message-----
> From: Thorsten Leemhuis <regressions@leemhuis.info>
> Sent: Thursday, November 25, 2021 5:59 AM
> To: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>; Thorsten
> Leemhuis <regressions@leemhuis.info>; Joakim Tjernlund
> <Joakim.Tjernlund@infinera.com>; linuxppc-dev@lists.ozlabs.org; linux-
> usb@vger.kernel.org
> Cc: leoyang.li@nxp.com; gregkh@linuxfoundation.org; balbi@kernel.org
> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads =
to
> unrecoverable loop.
>=20
> Hi, this is your Linux kernel regression tracker speaking.
>=20
> Top-posting for once, to make this easy to process for everyone:
>=20
> Li Yang and Felipe Balbi: how to move on with this? It's quite an old
> regression, but nevertheless it is one and thus should be fixed. Part of =
my
> position is to make that happen and thus remind developers and maintainer=
s
> about this until the regression is resolved.
>=20
> Ciao, Thorsten
>=20
> On 16.11.21 20:11, Eugene Bordenkircher wrote:
> > On 02.11.21 22:15, Joakim Tjernlund wrote:
> >> On Sat, 2021-10-30 at 14:20 +0000, Joakim Tjernlund wrote:
> >>> On Fri, 2021-10-29 at 17:14 +0000, Eugene Bordenkircher wrote:
> >>
> >>>> We've discovered a situation where the FSL udc driver
> (drivers/usb/gadget/udc/fsl_udc_core.c) will enter a loop iterating over =
the
> request queue, but the queue has been corrupted at some point so it loops
> infinitely.  I believe we have narrowed into the offending code, but we a=
re in
> need of assistance trying to find an appropriate fix for the problem.  Th=
e
> identified code appears to be in all versions of the Linux kernel the dri=
ver
> exists in.
> >>>>
> >>>> The problem appears to be when handling a USB_REQ_GET_STATUS
> request.  The driver gets this request and then calls the ch9getstatus()
> function.  In this function, it starts a request by "borrowing" the per d=
evice
> status_req, filling it in, and then queuing it with a call to list_add_ta=
il() to add
> the request to the endpoint queue.  Right before it exits the function
> however, it's calling ep0_prime_status(), which is filling out that same
> status_req structure and then queuing it with another call to list_add_ta=
il() to
> add the request to the endpoint queue.  This adds two instances of the ex=
act
> same LIST_HEAD to the endpoint queue, which breaks the list since the pre=
v
> and next pointers end up pointing to the wrong things.  This ends up caus=
ing
> a hard loop the next time nuke() gets called, which happens on the next
> setup IRQ.
> >>>>
> >>>> I'm not sure what the appropriate fix to this problem is, mostly due=
 to
> my lack of expertise in USB and this driver stack.  The code has been thi=
s way
> in the kernel for a very long time, which suggests that it has been worki=
ng,
> unless USB_REQ_GET_STATUS requests are never made.  This further
> suggests that there is something else going on that I don't understand.
> Deleting the call to ep0_prime_status() and the following ep0stall() call
> appears, on the surface, to get the device working again, but may have si=
de
> effects that I'm not seeing.
> >>>>
> >>>> I'm hopeful someone in the community can help provide some
> information on what I may be missing or help come up with a solution to t=
he
> problem.  A big thank you to anyone who would like to help out.
> >>>
> >>> Run into this to a while ago. Found the bug and a few more fixes.
> >>> This is against 4.19 so you may have to tweak them a bit.
> >>> Feel free to upstream them.
> >>
> >> Curious, did my patches help? Good to known once we upgrade as well.
> >
> > There's good news and bad news.
> >
> > The good news is that this appears to stop the driver from entering an
> > infinite loop, which prevents the Linux system from locking up and
> > never recovering.  So I'm willing to say we've made the behavior
> > better.
> >
> > The bad news is that once we get past this point, there is new bad
> > behavior.  What is on top of this driver in our system is the RNDIS
> > gadget driver communicating to a Laptop running Win10 -1809.
> > Everything appears to work fine with the Linux system until there is a
> > USB disconnect.  After the disconnect, the Linux side appears to
> > continue on just fine, but the Windows side doesn't seem to recognize
> > the disconnect, which causes the USB driver on that side to hang
> > forever and eventually blue screen the box.  This doesn't happen on
> > all machines, just a select few.   I think we can isolate the
> > behavior to a specific antivirus/security software driver that is
> > inserting itself into the USB stack and filtering the disconnect
> > message, but we're still proving that.
> >
> > I'm about 90% certain this is a different problem and we can call this
> > patchset good, at least for our test setup.  My only hesitation is if
> > the Linux side is sending a set of responses that are confusing the
> > Windows side (specifically this antivirus) or not.  I'd be content
> > calling that a separate defect though and letting this one close up
> > with that patchset.
>=20
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports o=
n my
> table. I can only look briefly into most of them. Unfortunately therefore=
 I
> sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to te=
ll me
> about it in a public reply. That's in everyone's interest, as what I wrot=
e above
> might be misleading to everyone reading this; any suggestion I gave they
> thus might sent someone reading this down the wrong rabbit hole, which
> none of us wants.
>=20
> BTW, I have no personal interest in this issue, which is tracked using re=
gzbot,
> my Linux kernel regression tracking bot
> (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Furld
> efense.com%2Fv3%2F__https%3A%2F%2Flinux-
> regtracking.leemhuis.info%2Fregzbot%2F__%3B!!O7uE89YCNVw!aHa5_mLM
> nBeDjINlAtV19tBHm-
> He9jbusXucMA5h7oonHvNFwYpOHAaaqqewPOuGK9HAzJUz%24&amp;data
> =3D04%7C01%7Cleoyang.li%40nxp.com%7C859ce1560a7344729cea08d9b35d2e
> 67%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377380350721308
> 84%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DONQZyAKXNgok
> 6LgYvnaAL7LVY%2B5Wl7pXglZDqWUJZMc%3D&amp;reserved=3D0 ). I'm only
> posting this mail to get things rolling again and hence don't need to be =
CC on
> all further activities wrt to this regression.
>=20
> #regzbot title: usb: fsl_udc_core: corrupted request list leads to
> unrecoverable loop
