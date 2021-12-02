Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049D466AD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 21:18:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4nMx2CRwz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 07:18:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=h6ixOwPH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.85; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=h6ixOwPH; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4nM64hHkz2xRp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 07:17:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4uyFenWY3mhUmzA3blDLFg/KeHqq7AF6bWb3RSjDU5KIZmWf6EaGbAEvQwTrIrYkK4KKX1u+OwzCKRRbXRM6CWuka0F4cDbuWr/DyBph6eMRxogaCGmT9vgnVD0ug03n5FqBX6LSt2S5zjNh1C5UKHR5N9BRWgWO7G8rRfbFg30A4j5VhmgVE+E3CWOTJOqWYiTQ9HSUdGAbfRTRvx1RSuio1iJSVkPYCmt3uluGx7gblnc2T51bPxrbXQVGo/tSaA+XdGbmIVp7memJhEFrTs5r/Cy+wCi90ct/c1NNZSN+eh8jfaM7QInG2u7m06ThpBUF51r8l+r2gGdflhcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ2sVFfrJgz3WAy1hv0XobNbuqbNT3pOrriCgv75Z3g=;
 b=ipeq8tQw/ls2WyDIzPtAbEyXZ1hQuJpQo9PHWIFokl/ORnDdb8f+u4OmrE4OMyZft3xhshizlxcy0tNXUxKpKJFtYbllHJKmRRVE7Av2div9TmHaUpncAkYykcvUZuodAmbLrpB1INCdp5OlWlFeilEZCx6bgGkN1BB0N0tqVGvr8mksb1oJT6MGyz4Lr29PWTlwN8GfQeQkCsfOypC+fIxpGV5Oi897ifIJhjQdUUKFgVSgxjs6tHP75zbK2ZIUvrOCF9DXnc3W1L2XgkBuu79AgjQPgKwaJ0Xvo0KJaNJQxXBRY9eMWLyDFeZtJOR9YBmYeXch+BnP83oP82BJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ2sVFfrJgz3WAy1hv0XobNbuqbNT3pOrriCgv75Z3g=;
 b=h6ixOwPHGlI84vxtoh0lIBtVvRCMU8cGhYFfCvLhivGxFoOXCKwZdmwlqznhAG2IxiHbarFp77HDVMMkUTB4pLOknH0RoUe2Ax4I7f4shnl6ZRfWh5/oYgQEFljC4HOmjVkLsPKo3k/IZJTVAgWYghjyT8Fnfpy3qUlzZ25Svq4=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 20:01:54 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 20:01:54 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
Thread-Topic: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
Thread-Index: AQHX1iIbcPueVtt/aUW4L8kSf69QdKwEfA2AgACzPECAAL+9gIALcuMAgA2xbnyAAK7ZcA==
Date: Thu, 2 Dec 2021 20:01:54 +0000
Message-ID: <AS8PR04MB894640E4FF4EB7D01604049E8F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
 <20211110105952.62013-3-andriy.shevchenko@linux.intel.com>
 <YZJExzxJ4j8g6jEY@smile.fi.intel.com>
 <AS8PR04MB8946B4800AE34258F7F2BA688F989@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <YZN7+UlXtJi8/i1L@smile.fi.intel.com> <YZ0WlMyS36Gj565C@smile.fi.intel.com>
 <CADRPPNT3yhr3jAPZm=hcON3nd97eLSrkWqFBV6kh6W5gf0w3Xg@mail.gmail.com>
 <YaiS2iHCrGkXgTdX@smile.fi.intel.com>
In-Reply-To: <YaiS2iHCrGkXgTdX@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0b4eccc-960f-46e4-91c6-08d9b5ce96dd
x-ms-traffictypediagnostic: AS8PR04MB8755:
x-microsoft-antispam-prvs: <AS8PR04MB875570CE4415D58E433773AB8F699@AS8PR04MB8755.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6zLjulN5ss239EQdGPdKKC0APbjZa34n7lCZDBafAtTW8vnq+nVsZKbkhw3IKHGGOEUFgAMnnTrvm4mZ/Sj5hDkpShgJADpT2ADry+9VVqS3qH/a1Su9I/QQnt7CS5wryws5h4SAoBqO1nFmPNdrtz4yJH7fMBpcfqc9TjHsOcwK/KOAepouHe1ZqNjXq+TQZfOH+cz+O7BIJ7EXxJsQv9+Orq+RgjmwbJ2v6B1Onx8z8fyNaxj4Elzwwmnh2Gb3wxMdXBvYmShSgedV002FFUyJNXKqaTELnVt80SQZXLsdFZHwtMvLwYXW3qJadJ5KkISYWcucpx0B5pNpuIV/iEmKgfwesXtxiGHv46IyZ5UmZpP0S7+Fjk7IRwvKu5hHJamsgJ2K9oiw3VXd8U+5HFCkx8EpkmORCMLRMhHN1STkXGW0Lup6w4C3XBxzLl6xW2bmxymPJof7jAyo6Ak42gaqrGbHot+415pS1KXrao4TJdNn+lh2hNJL+oUlxj5d5cYDz59lqzS2WyK9Ln/MdzQrWGvXrf9K7EQE5oX+Fp3Bc+HHrZVfUBzlpk64QJoYy4r3SB+oan+pSHYukRG6nZZCNV3HDyMI+Msdcbg5Wxq+Gs9t8lphaBwjAdb5iktjdmMguDdZd0Y1Xa+kUq2zozZlGKcQmXESTEcVzQEeKAEtSz//QUhOq0N1tbcsvyr4pr1CUPevYgvlt77EuvhlMrAsFxwvJRS4TmLTrgPpfQn8PxYF/uEAY3LWAc1QZYpO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(54906003)(52536014)(8936002)(86362001)(26005)(8676002)(122000001)(76116006)(71200400001)(6506007)(38100700002)(33656002)(316002)(83380400001)(5660300002)(66556008)(4326008)(508600001)(2906002)(6916009)(55016003)(9686003)(38070700005)(66946007)(66476007)(64756008)(7696005)(66446008)(186003)(341764005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UILr3pqI4S1Goa0hEXQ0hTE/RvpE1/pv78KTdpb5grfDKFwpQeQBmhKVZf/m?=
 =?us-ascii?Q?SpLIetAUiAMtBM7nI6r/8IFOa4I8lZsiYU2zZTkQB/xm8msjg+IRvqRmSFqe?=
 =?us-ascii?Q?c0GgMheFo9NoYO8moU30zdJEuUK0uKCzDNpgiBEYDbZjqsW/MCIECZBEV0vb?=
 =?us-ascii?Q?Q4JvkKqMaincSHFc6hj/HNpUdfHrpXWLDr3NJaNbkCzi7XBpfqDSAOaiP8V0?=
 =?us-ascii?Q?4h9PZ5ZE3Y1fH4MqYx1eZat+fMjuo4Et335RdYrXq0xnwpZglIuQn0v0bP+V?=
 =?us-ascii?Q?2zKo+I9ptzM03IWGz0wNOhRxV4P6LY5ixC3r/NuFCW8T+hS9s3R7KUeG0jxM?=
 =?us-ascii?Q?sQcmDIZaPlZ19+Uygqd/iUoKck9ep1wRBWzVIKGMsnAeVSfMAd83jMnE6/5f?=
 =?us-ascii?Q?XfQKoMv7HNw0jPV52XnkmmDokJuydSZIG4qg4iW5iX6nPY5pyhJlYE79Lbqf?=
 =?us-ascii?Q?f7plAmf8V9ij5qRIrn/tvka8pDnW1eNELLhGgxuJffXcMYrmkuAv1tEyBolh?=
 =?us-ascii?Q?n1T/yIZ7755Afq/6JqoFZzyZdQF2oC/dYvkkhmnrCujYeAfdyDc87MKEXePY?=
 =?us-ascii?Q?Q5h3h9buUGFcdE3lmp/rKcSi2m1YtM05qcqh+azFAXopID83sxKirK5V/U9f?=
 =?us-ascii?Q?9A41m4WDrl7IwuDTfB1Md1+adnYAX5XxawXRoTBiOAg+2ywMvN2U78OtfnEw?=
 =?us-ascii?Q?pcG5zLlKhRsKEXzCpQmKC+CHbnvN8ehANMVyxdovKxWw58GhNW2gN4MPcApc?=
 =?us-ascii?Q?rNRxRlVkmYVkf0EHy6bLq+eM9ygKpyWpGOxD74BRw31dHiFAvY9hQXcAUUPU?=
 =?us-ascii?Q?23g8yDYKp1JBmafYaUyctmV60UYWNJyKZLpaAuZoYSF0HdtrfCa+aHoJui7q?=
 =?us-ascii?Q?14WyjdmTrQ+wlf308gNi9OKF4jC+EO3ZJ0Z8ZkH2EL9Dy4eKCwA31G5yVvEQ?=
 =?us-ascii?Q?xp+iVIThi6hnilJxhxCK2aqeGQagv2tGVdmJjy07nbx2OmX/MJSED6I7YxKP?=
 =?us-ascii?Q?Ecq/uW04zUT8jbXCYBioAHAdm/TS/XphQmyBGwkOvcD+oVN6Clef8hRnthu2?=
 =?us-ascii?Q?cVWgFMKfOjxrAPOOZdc0Y7ByqDGhyycEqOX+KxalLtCdNulGdBoMkGrX0QNJ?=
 =?us-ascii?Q?Gl6Zjtlq6A2GN0XsGA0w8+H/AApYTAuKE3J+WDq11R0GAD+/g55aVGlLKZX4?=
 =?us-ascii?Q?iGy5obKq4VJ/lTYhGdCBi8hFKjaeyfagl7aFe457/CM7vrpk4jJzPT6vfejN?=
 =?us-ascii?Q?lQfGvFcXrcx+vT4OqtkmwT9bnHyTXU4+Qx4my9c4wYGOGS04XsmTjs5ZdK0p?=
 =?us-ascii?Q?jhNPbLP4ocDU6UebO4HwAPlYuV+FRfLOtjbxWLVH5Mxt4rO0wgIc4wVk7Mw5?=
 =?us-ascii?Q?lQx7/ABAXGiFJNmaCpPcMSpDF2B5fsSOQaaAj05lYqGybr73HQbA2gxbvvlO?=
 =?us-ascii?Q?upRyoI04cBQd81Qo9ScjDaN+8WIK5g0JfihqHlsdKguNRAtcMOoTgmNkakxo?=
 =?us-ascii?Q?SzxUp6qM7ITbWI8CQz2Ux8MMqrtpQDX5K2ea0YPj169WRg8e1zcZGLQmrkNN?=
 =?us-ascii?Q?+LIXoN1OsouELR9V7SXxHZmWIXaQnqto2F3ooJov6nn13Gc3oOV17+l2uV3q?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b4eccc-960f-46e4-91c6-08d9b5ce96dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 20:01:54.7554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oy8p+0eIhOUixv4IZlK4Qk8lRYInV6j02Q9tYrnXtCmzEkFcEqM8CcncJMP/dn0s+k2XofzihWN9Gq9naSGKgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Thursday, December 2, 2021 3:33 AM
> To: Leo Li <leoyang.li@nxp.com>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; linux-ar=
m-
> kernel@lists.infradead.org; Qiang Zhao <qiang.zhao@nxp.com>
> Subject: Re: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
> inclusions
>=20
> On Wed, Dec 01, 2021 at 01:41:16PM -0600, Li Yang wrote:
> > On Tue, Nov 23, 2021 at 10:32 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Tue, Nov 16, 2021 at 11:38:01AM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 15, 2021 at 10:24:36PM +0000, Leo Li wrote:
> > > > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > Sent: Monday, November 15, 2021 5:30 AM On Wed, Nov 10, 2021
> > > > > > at 12:59:52PM +0200, Andy Shevchenko wrote:
> > > >
> > > > ...
> > > >
> > > > > > > v2: updated Cc list based on previous changes to MAINTAINERS
> > > > > >
> > > > > > Any comments on this, please?
> > > > > >
> > > > > > I really want to decrease amount of kernel.h usage in the commo=
n
> headers.
> > > > > > So others won't copy'n'paste bad example.
> > > > >
> > > > > There seems to be no problem with the patch although I didn't get
> time to really compile with it applied.
> > > > >
> > > > > Will pick them up later after build test.
> > > >
> > > > Thank you!
> > > >
> > > > Note, it has two fixes against MAINTAINERS which may be sent, I
> > > > believe, sooner than later to Linus.
> > >
> > > Any new so far?
> >
> > The build test is good.  I have applied it for next.  Thanks.
>=20
> Thanks, what about MAINTAINERS updates? I don't see them neither in next
> nor in your tree.

I am ok with these MAINTAINERS updates.  I thought you want to send them di=
rectly to Linus.  I can take them if you like.

Regards,
Leo
