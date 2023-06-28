Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A347416ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 19:05:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NuN7LKiM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrnyK3XMDz3bW4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 03:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NuN7LKiM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::616; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrnxN5myMz30Db
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 03:04:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VB91WYQXioLdf8W+AQZafGVj+rqVDON2BU6jZM9cU202IkQOcZ7Typo/rGBI5y5KrFh30trhhXnCRdvTXmdNr+LqnW6VyFN/km6QFyPzLdkiltPzpIqnhhU+RBp2REOrogsNNBw4fidP51cmbwi6iiEDgyeUayyScHwhJiC7jwWMP6JHcTOTxLKHaAS8GwDFpKtJ98LzDXqB4ptVPJQTCc4OzQgZryAzn8+iO0rn+wYXJjn9pl2l0kQPZrrvKoVS53EMgWkC7+DqTReypFsT0erVZOXvjsLjwIsSs2DAJZDKMoLxCkWy17aoUVR7u715mqKFACpqiKeQg09eAqVNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+cczLXYcAnZjvOlRPbJzqN0XQ/Y6oK/el+CjHob5hg=;
 b=AYzxUuWiTbvhdJFjMu3mCQiHO4dy/onEZt5ugCoOXjjC1sDuH5v4a8xTrOlFT6YaWsTYI5AfxgjpiU5uxA9jl9c4m3/uqILckpdSx8/zPPrIaMu8tFAiViYz/Pf7xQry1yfz7CY3Jx3YADWwlCByv+cChziG/JmubjK8+532zOpeOoureeJQzUGWq+yjmaUkpsR9wTHVBVk58IF5z56HM8ojF1BGGu0W/sfZMGVWIGQfaOJVcvteSE0eV1xwcEf027tlwio8elPcrTP82AEEBm3SoHWBXu2BJ5Ajp1wEqtyZwUwbHfAt2vTPJ8WX42fxnfTF+CepFCXFTvGEPsXHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+cczLXYcAnZjvOlRPbJzqN0XQ/Y6oK/el+CjHob5hg=;
 b=NuN7LKiMCAWD+URNvcsE2vMSpllEY/gSF25Ph40AfGGEY0LdqgQvMsySaH221x/9CkZuI/Ts+bSCptBqWmM0EGifguVy9g1e6Y5EoKSE1hq2SLE602sGWIfveEXuzgsf37vfr2pt0GVboDuYcoe3VVOmmIfz9a5P/pQpdL7n1Ao=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 17:04:00 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7aac:2f58:b7e3:2c24]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7aac:2f58:b7e3:2c24%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 17:04:00 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ma Ke <make_ruc2021@163.com>
Subject: RE: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Topic: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Index: AQHZqZi9K7bLkqeFik2hEi3PRtnNM6+gcHbg
Date: Wed, 28 Jun 2023 17:04:00 +0000
Message-ID:  <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230628081511.186850-1-make_ruc2021@163.com>
In-Reply-To: <20230628081511.186850-1-make_ruc2021@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|VE1PR04MB7295:EE_
x-ms-office365-filtering-correlation-id: 3c1f9392-3ca9-4c33-fe15-08db77f9ab14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vQkSYGjSvslc7M30XQPCdX92GTQnsp+4VrfvOJN0kKgqzTqAw6JWlEnE6ar2xYolh94R03fuSnQq0lc+HNi20/IkAaTKoCYGZv0fWLaVmlSEuDZtq0eaf1ov+vfwpGecRhpXfVaNk1E7rthVaCLRPxQVdsPUx9DzDDTK60Zfv9q1yS9ijmOrZQ1mnONABFS3XJ+3uVGviS/ObTwua4cjWNO88k+AIbp7PHqOwidr6fWPLqOfxc0+puE9EC0BX5wtHzQglj9O9Ve3fpNKcPRM1rj3RK7yNNGXgwktSCbVmnly/U4U63MU4W/XWhj1SIbdrYlxTdCbGt9C4PG43VREg5bI6HjBuQCG8WbNpseX6Z/8Jz0bFaHMSw4MG9y/+pEwEQgPK97n/UHLPMo3MLOQzAsmxoshlGu+Rkvs3brG4SUwoPS9zrNn8P+PRtdSDSLiSWJiX9Auj9gZNMT79V22pRt+/Z5/a9gsfbhbKnoyajGUAzE95OZY14W9uDtSOcP+8wvhfjrz0ErGCwOyaSBxEHFf5P7VgI5We3UZViNA2Ejr3bmC/jzNetFH6o9zc9dYSkOQf5fjEnb7y61nKWaFW6R1Ur4Qe3rpPZvh1VSeLCA0IUIpG2YTdgGvC8JWnMAs
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199021)(52536014)(7696005)(186003)(2906002)(26005)(66476007)(5660300002)(15650500001)(41300700001)(55016003)(8676002)(33656002)(6916009)(316002)(54906003)(478600001)(4326008)(86362001)(122000001)(38100700002)(71200400001)(38070700005)(8936002)(64756008)(83380400001)(76116006)(66446008)(66946007)(66556008)(53546011)(6506007)(55236004)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?4eHRxZb7/38lF7pPt2Hp3PGP48oSFRAlJGRYojkX+NRzbFZuTymEYMsxBWro?=
 =?us-ascii?Q?yFG3UBO3eqsrR6y+ENlm+mGjFtpfEdFQvLgA6J+Ua01hMENwSBwSTndNESnW?=
 =?us-ascii?Q?4HeTAxgvR6G9igQ/M1GJBIlNDysYvqL7V5HN0Jmlvwppo27eyj4TLlXsKZbG?=
 =?us-ascii?Q?RW4lQ0PJjo6LrK5QgqFr8UIuIi+u1SOum15TcbBBXosL1UxmspZQTugoTOq5?=
 =?us-ascii?Q?t4RD4zBfzp6xAyU1SWCzJvD10uyqMt7DUjLNmVKhApS1FiNwRU1SBEDGgssR?=
 =?us-ascii?Q?cDniFMaIS6KCo45FmtXR/owrkUnNjCHWbdnQsL+M6JacgNcH5dk+8QJWUWSE?=
 =?us-ascii?Q?08sHvysw620lz3Z+xdMutZtoFV7FGQHFdi2TJkz//D/EBB7Qd9grkGJWkRS6?=
 =?us-ascii?Q?JphJjFJs29sMyj9TyjclVS1mpuSAVguZXkDCKJiYq62l22gKDhyr7v2cmxyH?=
 =?us-ascii?Q?e6ys6q7OKdKqspdXzGwDQeA+hxD7/pJrD7W/NZZRC9z/yQKqGuSc4ham7eYz?=
 =?us-ascii?Q?5j7RQa6nYorPzsxTDg2FtcP382OU7Jn+X9yFkABVgSnyaJvZbSQa0dzBDzlv?=
 =?us-ascii?Q?eQGJcTlWyEQVfXrVYs0i7czicEmW0mS1i0J1tqrJhGrxwvP34Y/k9xh6uJNo?=
 =?us-ascii?Q?DJvuJYhbet9/dS5wVXCU/fQwfT/+3M7fsCTV2+BtTraWYuguSNd83fEVHW9M?=
 =?us-ascii?Q?ymHNLkbXzRBWhUTgP2kPoycslfOyESu3IXrBWlMHLCerBpf2BmOXUD6uv8uS?=
 =?us-ascii?Q?vvqpdog+CT+z0A9xz6QLaLGGrcif+LVV2BbKQrxS0I+sEeLw7VGErA8ETZHF?=
 =?us-ascii?Q?vkTQVjrioAODYGm7BKCyH/+uBUO+qBvFid3iB5ho7dTbsiV59qDYIZwDm0vR?=
 =?us-ascii?Q?Lpp2yEUY3MIlp7BbVFMxbnLgWALZ0Hq0FYFZRDGJgyKguIzIM4hCI+pPwy5n?=
 =?us-ascii?Q?3Jd8FWmJjaG6KypS8yFTj7HakX8E7nQJTt6kqb09W/66jhFRI80muTKiMB/n?=
 =?us-ascii?Q?CjNKwZr0qEdy5K4vzlJvMbqwfsmbJ9T5JJVZ8A6CwI+wCHm+0EmYsTPmdJ/B?=
 =?us-ascii?Q?W6sOERT3NDJJ3z3AuNvC6TLNtnHxxju9Rj5xQ7VBzq3a7myWkCAuMWleZ8UX?=
 =?us-ascii?Q?FXB0bVZDq/2+BnNevpwZwjAA00nAw2K+Jag5VkKwr49FM50QYETKmeLLbVxB?=
 =?us-ascii?Q?t+HnoBvmy/IMbBPaN3qts00hcBmDzzntZBTHP5E8eBsi26xXjGYbHw6SgWHq?=
 =?us-ascii?Q?w9Py5KChRjpxt+n01K/89AMJuSjkCI4LjS+K2Y3b/hwqUO+zjBbxZNaNMNcw?=
 =?us-ascii?Q?wx/2HEhkGmqej8bwch4QGnHvTAMXJe6/kgfh3/Xvt8l4CwlcwDSn/b574xQp?=
 =?us-ascii?Q?9f+CtOgoRC1kYlVlwJVtdXP0EZsKN+MtFYowfBV07dI7KMncAwVtHTouApU0?=
 =?us-ascii?Q?rrzTSmc6NVySJ3Y1nFJfugB060K5XLAAEDTh/zVPgj49me6JPavmsqLZLdmw?=
 =?us-ascii?Q?vufaf9wgMyMG1YiOR4fHJHdC6ycTouVIDu6BK2u0XGOUrDmW7cyBz5OdmirH?=
 =?us-ascii?Q?tDMG6SJqifCcuKvxc7c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1f9392-3ca9-4c33-fe15-08db77f9ab14
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 17:04:00.3449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ehTqAPjmEsBERMltFzR/3FdPXQuLkT32A4McmUomaX0tVD7Ehnw7NHd8v2C+tNHIri7UUFeNSeJPTg9zW/oCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Ma Ke <make_ruc2021@163.com>
> Sent: Wednesday, June 28, 2023 3:15 AM
> To: Leo Li <leoyang.li@nxp.com>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; Ma Ke
> <make_ruc2021@163.com>
> Subject: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
> udc
>=20
> We should verify the bound of the array to assure that host may not
> manipulate the index to point past endpoint array.
>=20
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  drivers/usb/gadget/udc/fsl_qe_udc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c
> b/drivers/usb/gadget/udc/fsl_qe_udc.c
> index 3b1cc8fa30c8..f4e5cbd193b7 100644
> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> @@ -1959,6 +1959,8 @@ static void ch9getstatus(struct qe_udc *udc, u8
> request_type, u16 value,
>  	} else if ((request_type & USB_RECIP_MASK) =3D=3D
> USB_RECIP_ENDPOINT) {
>  		/* Get endpoint status */
>  		int pipe =3D index & USB_ENDPOINT_NUMBER_MASK;
> +		if (pipe >=3D USB_MAX_ENDPOINTS)
> +			goto stall;

Thanks.  This seems to be the right thing to do.  But normally we don't mix=
 declarations with code within a code block.  Could we re-arrange the code =
a little bit so declarations stay on top?

>  		struct qe_ep *target_ep =3D &udc->eps[pipe];
>  		u16 usep;
>=20
> --
> 2.37.2

