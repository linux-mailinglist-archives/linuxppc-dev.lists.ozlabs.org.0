Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6C742931
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 17:14:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=JPHSRe4a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsMSb2762z3bvX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 01:14:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=JPHSRe4a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1a::618; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsMRj2vChz307V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:14:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+PxuzfSboXwRKpWBpSvqH2EkD+tdboisnK96KE02EmxqaAtHmfTaBGA6mSsIJj6ddPpj4Zn0WVEvhpI/IZX4NrCyUoXGjkQwLUGymsSfw+OjmRIiMj4f3/RU/1w/TAQC2FZyntmLcadnOeyANbWDbNKQEM0hNTHPXNZ+7PuX5nb1IDosaG00J4kYRTZuJUZOYUcxuCCk+Jp1bnfuX94pS5SR/krqNouY5/TbuzVnsoZjBXBqaLAqPKAjbEd4ypYmr9FOncr8bGpVK30aMxOHlPS6gnMr+Rhvuh2eJZGMs/XukKjn/ayI2Ys3hZnJprDLVOyU3h1wij1vj3Md3t81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4nz0LiUsG2Da4OXYI1AndBd6LZ7MY2MAcJH1xBxDz0=;
 b=aVO9ZbEbKCGXFQiihi5fBbgSTIg3BcDyIbUH8OSOfRyoBNj1fTcBH2q7vzcqsQKHD7ZjjUVkA6kPw1eneYEDH1ISqvXieK/wLd0FtrwagNVdZ+WyOVwVXlvkgVBYwmXKfpERsquPIGzOx4wxdOwZWNMscdXymaNF13NCA7MwqIck0F5Y2RBQpkzF9ecB8nry8ogSQDnzc1cKVgkDkJTOkCdsaxmHl6JM2vBOr2hy3yP+20/DUvw86b0G3l9UBhD75h5m38Qdu+GOsn2b4uQUwc0XlhQZ6OEoruwm2+qlrL7d7o+P/n6uqmkYs1UHwdHxSXz/0rasU/h2gkK5ZqKIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4nz0LiUsG2Da4OXYI1AndBd6LZ7MY2MAcJH1xBxDz0=;
 b=JPHSRe4aK7LV73Htm4AfyJERV5eMolC6YwdRgh4znoiPVdG1XuyQoDqHopEimYoYqNSCfehY6dE29WmyliEz3M8/G1FrB9NFm4KbCpD4TxWrMBSlNUT1FqtFP8NlWkcYZJqzjNbpsLsMZLwh86qTZZyc7J6KpsqRKyD0i5BXqs8=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by DBAPR04MB7288.eurprd04.prod.outlook.com (2603:10a6:10:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 15:13:44 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7aac:2f58:b7e3:2c24]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7aac:2f58:b7e3:2c24%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 15:13:44 +0000
From: Leo Li <leoyang.li@nxp.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: RE: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Topic: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Index:  AQHZqZi9K7bLkqeFik2hEi3PRtnNM6+gcHbggAAtAQCAABgTIIAAlCoAgAAuA4CAAG1lAA==
Date: Thu, 29 Jun 2023 15:13:43 +0000
Message-ID:  <AM0PR04MB6289FD7D57831D113BAAC8348F25A@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230628081511.186850-1-make_ruc2021@163.com>
 <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <f321287d-8156-b805-26fd-58acfa26e324@csgroup.eu>
 <AM0PR04MB628929736762F5DF46C55D708F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <7975b5bf-c8e0-237e-d6f4-98e641d39959@csgroup.eu>
 <2023062958-graffiti-skyrocket-cfee@gregkh>
In-Reply-To: <2023062958-graffiti-skyrocket-cfee@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|DBAPR04MB7288:EE_
x-ms-office365-filtering-correlation-id: fdeef337-1a1c-43e1-8558-08db78b36dbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ada/y+xxr8skz7N4pnKCcHNX28rUAzMUmAYyc0QrMugULPQHHCZyqhUqjReZLOeBoj7P0/GZJE6qvbdmxOLMSdg6JcPEbTQWqT6z7YL6BTHS7XgxQSUuz5heNvLIOAI0AcTLXOoELZVmpiFp6EWh2htc66tQh0pp919Hi6gRrDa81YB6ctlnrT39eSDKq6WEdYNJTRHmKL1MbR6XrfpTE/j0hqdA250QDhPKkOgWeDCshCOxxZ4osu9p/6A/A5u3WrDVl0/C34mx/gGofjmPFYQ64t1oX24uxntKdIxYeD3KiYbGn3Ksa8rtGxCH6bDdWPvUdJ7N3kiqD/dnWMXzOZ4TYJGk/EY4bnOde5dN2fLAiyuPCFIwWNAKEb2WfKCoL3IL6P7XJKjEVlHYHSaHlRx5u7EftIyXDiRg5eiYvzXevhZU2LMi3nMWxKd/ybjeyKiXD/eUQh/JDwhxm9YSYHpEoTbAKRz8XldAyRec9sUSwtp9eYtJZK6xYD15NYEQ14e5/UwRnXDYKppVijKjPaxLpKVDd1W21UEqyEsqQrF21DkZFq6tdu0ZQiTemdOE/0jcnrvb4VKaXPvHeNE91/NGQtdzBJfpH/Od5fmMUOTPk6h5OFNMXtmz6Oy7bKiQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199021)(66574015)(7696005)(53546011)(2906002)(9686003)(71200400001)(83380400001)(38100700002)(122000001)(26005)(6506007)(186003)(55236004)(55016003)(41300700001)(110136005)(86362001)(54906003)(4326008)(38070700005)(5660300002)(478600001)(33656002)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(52536014)(316002)(15650500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?ftnVbHFV5h1nBYnX4YKJmCd5AisGNlYGb1MSOql3xVVWnPOXBZDLwkw8VO?=
 =?iso-8859-1?Q?vDGxL78e5SyNXTemVv5UPd4G/Td3PrnlQKQrQxzNedeyRn9Rtjs3q4G6a1?=
 =?iso-8859-1?Q?xAb2g9D5bQXHEXSiMWlx7GpFQAkf9Dg1qln6t2FtFvDk/BddpUoHM3axtc?=
 =?iso-8859-1?Q?3dlutVyYf+nNi4eRNLkO8U2haVc6/4kJgBZ39b/0C4pnzcHR8gLwRBNtfB?=
 =?iso-8859-1?Q?8Pr82z6lYmR59nkCgxJd3b5lVKKDib2BwvDXEn7B5aevhZJzJwvEQVkWsg?=
 =?iso-8859-1?Q?njyD0MgPOq0ovFyWX7RAIBXc7pNQ0xuoDyp3XO0iigBVWgnoVH2wqUrC8m?=
 =?iso-8859-1?Q?12D2G48EXDCMGchrRXVtxJq4UW/j5GfOwFLn/NMW9B848c3mcqOM72yEwr?=
 =?iso-8859-1?Q?06N9AYeRwvIqwVBXIYtpqL0ApYFf3dTgXTiWG359Gn8S4761K7lRlvXPhW?=
 =?iso-8859-1?Q?IyDPlWA2ZvaU/Zvz6IIm2hF6hU2dByRKRk9J7viB4YHqzPMiA9HttY+nBO?=
 =?iso-8859-1?Q?CSfgFt3L8dxnlgzQmcqw28Vk/CvOVoRC0lkZbgvOKcJFbkq0Np25PyI+bY?=
 =?iso-8859-1?Q?3jbL+KlfgzlnY3oNvs9AgZZjXANTY8i3Rk3eBPYADpeA9T+zvcCKwDxR84?=
 =?iso-8859-1?Q?Oc8WPGwwSsXOO5WT6tXcfjR6fByJXq/L1tsfM4l1CSYA6nySIrFkJZ2NEc?=
 =?iso-8859-1?Q?VVumbLp4YhYVOuhAxec/yEt/UU1ihiNS1v0/RpBZsBgs8wlAQRoPclhpaO?=
 =?iso-8859-1?Q?kfg6wbUdHH2OyZh98mIdG6L/aKBM92USO5wgcs5upHhRVlINWvU9rc6Ade?=
 =?iso-8859-1?Q?cFWaBPKvuOkFuZVIOhvZBSkTH7AptZACpO8LpHpzhoirUmJZlW5ebeLAgF?=
 =?iso-8859-1?Q?vwa+fsNjZcXJHswA+Fz0/qnzfGOwvBeazV3Fsy9w4NpyX6q5Y8z8gAqNSI?=
 =?iso-8859-1?Q?ScW7nqGV3KZGceUcCxVh/Y6A4WZg4499pi/GlOIWqq3scs7ythz7QElhhV?=
 =?iso-8859-1?Q?+Nany+pO2EF20bts3qhpl7+VFMUXJsM6RjDoLVJkgi2vBTOgnT4omAfKk6?=
 =?iso-8859-1?Q?hQHImjEM1XD+MJXm9OUGg3c2MxqybctG93qN3qjh6qE3j2swrrDIT5KK6C?=
 =?iso-8859-1?Q?l0Mn5Lo2Ntep1a1IyGs1zBgGxjuogbqX+TOfbiJlvm08nBwe8nsfDpJMIn?=
 =?iso-8859-1?Q?BZQJt5XQzy7MTGeBZV4cWtJzJhDMHIO726JcoB1/zj5VkgntNiJAxFSYGt?=
 =?iso-8859-1?Q?J1jAOraTLzV+aJGSToXSkrh0PBUhfwPmYwz8Ea4BqaFoem8gONZ/VuQjiX?=
 =?iso-8859-1?Q?YlsTMMa4+xjymrey9I+5nWECotF+37WnJhx4/8eX8wU9ffPuWPWzRZEn3F?=
 =?iso-8859-1?Q?TTqY3HnEdJe35OwvTjPVoP+k2izs4RKgj5T7aaaInZgp+J45HKE0LGomrQ?=
 =?iso-8859-1?Q?JpEyysBawzVXMNiCMwuSJsOe/R1sHDmeYD1pQyekCFKjuTzTQcd3UZmQhL?=
 =?iso-8859-1?Q?v2blujPpYD4++vVZxaGM4sAgmRlkwC5R02AngSvXEUC93X+oZIfPrjEV2h?=
 =?iso-8859-1?Q?f3DF5XWhBh8dnyvJj4GFNAaJKN0Wf4hG5aDGa+c4VK/F9RK87r2mB74YRY?=
 =?iso-8859-1?Q?4bpkN6yup2/ZA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdeef337-1a1c-43e1-8558-08db78b36dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 15:13:43.8240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8uSpbHMY06YLhPI2du2k9MhYoLerBdrEeN7KrQsblLxYhUuJrY0FQybR7GxS4FQolLbuP00WX1veFEBCvvjzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7288
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ma Ke <make_ruc2021@163.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> Sent: Thursday, June 29, 2023 3:41 AM
> To: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Leo Li <leoyang.li@nxp.com>; Ma Ke <make_ruc2021@163.com>; linux-
> usb@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for
> ch9 udc
>=20
> On Thu, Jun 29, 2023 at 05:56:30AM +0000, Christophe Leroy wrote:
> >
> >
> > Le 28/06/2023 =E0 23:10, Leo Li a =E9crit=A0:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> > >> Sent: Wednesday, June 28, 2023 2:40 PM
> > >> To: Leo Li <leoyang.li@nxp.com>; Ma Ke <make_ruc2021@163.com>
> > >> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > >> linuxppc- dev@lists.ozlabs.org; linux-kernel@vger.kernel.org
> > >> Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint
> > >> index for
> > >> ch9 udc
> > >>
> > >>
> > >>
> > >> Le 28/06/2023 =E0 19:04, Leo Li a =E9crit=A0:
> > >>>
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Ma Ke <make_ruc2021@163.com>
> > >>>> Sent: Wednesday, June 28, 2023 3:15 AM
> > >>>> To: Leo Li <leoyang.li@nxp.com>
> > >>>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > >>>> linuxppc- dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; Ma
> > >>>> Ke <make_ruc2021@163.com>
> > >>>> Subject: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index
> > >>>> for
> > >>>> ch9 udc
> > >>>>
> > >>>> We should verify the bound of the array to assure that host may
> > >>>> not manipulate the index to point past endpoint array.
> > >>>>
> > >>>> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> > >>>> ---
> > >>>>    drivers/usb/gadget/udc/fsl_qe_udc.c | 2 ++
> > >>>>    1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c
> > >>>> b/drivers/usb/gadget/udc/fsl_qe_udc.c
> > >>>> index 3b1cc8fa30c8..f4e5cbd193b7 100644
> > >>>> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> > >>>> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> > >>>> @@ -1959,6 +1959,8 @@ static void ch9getstatus(struct qe_udc
> > >>>> *udc, u8 request_type, u16 value,
> > >>>>    	} else if ((request_type & USB_RECIP_MASK) =3D=3D
> > >>>> USB_RECIP_ENDPOINT) {
> > >>>>    		/* Get endpoint status */
> > >>>>    		int pipe =3D index & USB_ENDPOINT_NUMBER_MASK;
> > >>>> +		if (pipe >=3D USB_MAX_ENDPOINTS)
> > >>>> +			goto stall;
> > >>>
> > >>> Thanks.  This seems to be the right thing to do.  But normally we
> > >>> don't mix
> > >> declarations with code within a code block.  Could we re-arrange
> > >> the code a little bit so declarations stay on top?
> > >>
> > >> But we are at the start of a code block aren't we ?
> > >
> > > But they were at the beginning of a { } block which is compliant with=
 the
> C89 standard.  I know gcc is more relaxed from this.  But it is probably =
still
> good to stick to the standard?
> >
> > Sorry I misread the patch and failed to see that the declaration block
> > was continuing after the change.
> >
> > So yes don't interleave code with declarations. Leave declaration at
> > the top of a block with a blank line between declarations and code.
>=20
> This is fine as-is, no need to change anything.

With the approval from Greg, I have no objection to the patch.

Acked-by: Li Yang <leoyang.li@nxp.com>

Regards,
Leo
