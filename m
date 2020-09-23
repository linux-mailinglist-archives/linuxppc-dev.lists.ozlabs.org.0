Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED092751CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 08:46:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx7x10whVzDqKJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 16:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.59; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=mD4svKt9; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30059.outbound.protection.outlook.com [40.107.3.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx7v53Z3RzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 16:44:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItozPyyo/FH6ZFECJpkJB8Vztc2V4qVhMyku2qcymZzbx334LFZ1ZUJPe9yNGSRzmhPrAA8OdIyAN8se8gT6rsSkbJoMGqzBGa9fP5rPM5ovik11Ke8B40uM41K38aPcm5zlK+8qz0JgypceSyy8hA8UbeoYZrfrT8RpvbkgzGIuvKZku1/Tja2YDQOG/QdseSQMRti7eNhLX7yIoC1AoNZts7os0XGWZsAGslVYie5cVhJWIp8tjySOjMxUkH5rCNuIc7yQmLQ148CHPMMTvAGjnsSHMD4UZb7bCdpVsgB94IXVsTyodO6rZeFD3Qm23qs4gYjMcEMtGsivYJt3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqNiDz3DVqXA44dzIcUquHyHBbYkr1yiBR9LslF9F9s=;
 b=LplUxbnO/eT92VkfvsZyl77kN56pi/ZUMxv3P6cewNnPEMnBU2dLHKvHmk/neoRqgWC56jd292MNaFM0tr68+lHItww/UBxks+j8joBdg4brpkp8Rfl3I+pJO42y2t89RVjuFQH3PGvt/sfQDFFGFIzMKM/7FqqmzTWjXdOVOA3/vOa8Ndx2U6jpUBHagi4RQ4ZcOHl3LNrykPiu6jV5M9KsRp0UCBopKpUWgra6WEZJ2wBwEiPiBOnpeYtdMN8D7n3PkLHEjlGkslbOo1oxnK7aSDjrMyEiyb7w5GJbUgVgKkOLupkuiqmSsY/Ph1aU43YbEwgsMYWJUUuFOVjVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqNiDz3DVqXA44dzIcUquHyHBbYkr1yiBR9LslF9F9s=;
 b=mD4svKt9jO29MtlUNwrq4nrH+gMbpurOfA6MWLwzGQhb9nzNd62nfctqjpaYjNCAF+OFMZIklpk872bIZgB0e/aDBXsYDs6xbQJYkrds8NyOuMYjC6WT+9HZaJ12QjX2hlHY1WuxDBtLNIAeOyFFXNaUMdFkSFcYpCK4azuC5xY=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4968.eurprd04.prod.outlook.com (2603:10a6:20b:7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.24; Wed, 23 Sep
 2020 06:44:04 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 06:44:04 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Topic: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Index: AQHWjAMgWpwpgcZEfEity8vaUHwtLKl1i48AgABEr6A=
Date: Wed, 23 Sep 2020 06:44:04 +0000
Message-ID: <AM6PR04MB5413BB2F8D044B2312DAEC4FF1380@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200923023234.GA3751572@bogus>
In-Reply-To: <20200923023234.GA3751572@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d047ef28-77c1-45b4-9024-08d85f8c101a
x-ms-traffictypediagnostic: AM6PR04MB4968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4968E136B383FE8336405B52F1380@AM6PR04MB4968.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SQ7flo1GJ/vPX66/rNYvAesvtohKzmOx+PRGyivP29RY5QpWhLMppKQ4HviL/AfQn66BCrdT+E/l626EKl8uIj4rFGD7hj4Sph7of2LVmIGK5hHcyke/15NTzGzBK0M3NLgjEzNJPmWQWwsR4dVbhwJSb/mP8f6gBqDPWhSAdz8SY6Sk4w90gj4SR8V89jlPF21C9qyrZXmfv3154vMjBYEw8SlIrNlCRxJkIAhRK2MaaEhHYBH2yAhd/XkIkh5gCXi5SXuABibH6xfu17M5Rdukw65n1ssyYqfiwCOgHeofI6TXaaybUyio7y/pNuoXeIgOchGc/s6KVDZU8t5MPXbYcSpGMtEK0VAOIiPXj4AwYYlZoblz5qL9qtsH5crG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(4326008)(26005)(66946007)(186003)(53546011)(71200400001)(7696005)(83380400001)(316002)(76116006)(6506007)(66446008)(64756008)(86362001)(52536014)(66556008)(66476007)(5660300002)(8676002)(8936002)(9686003)(6916009)(54906003)(2906002)(33656002)(478600001)(55016002)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 07LsOgx+OkSyZt7t/+6DAOa05wYt3suI/bgc+dMWYQZACdrWRgY7WulQutZhsr4EE4XDs+wrQIQO234M03IYZVFTBwMnuWNzyiZUy35qb/5paojzVnMZ1sxShUGojHSVG+sbslFSe9X3fm6PDzDYC+cvryfAqUsUNRO9z/DxTPzJAuAH4II7bC55SbiBl4oqM5nU8RuqYbolVcI+4oODaZpjcYQKC3E+tP8hjP5HuPyWDhB2IzOuca9FVDhgY40f0tW2ZMVBiG1K16IKPaYWJH2ut90vvmiZSmMo/+vbEanvchRZfQaSV8bVRDSf8/Sjqwd/0dbCa8T73LAFmb9D5gxCa+dVuOupjuGFlJkejAU+xdENf/+eBQLTs2Y+qwlJmxkOKMEFb4fFY2twx3Zknd+JJaSNiXqcrCOZfH3sxqBGJNvBMeTE7CuGRcYUkx8+icP2M2au/KcUgS0jWFgLQ8FAfC/eUnnpFzEicLjUpYSYMlUSIbCtiPGQJYm8zMlwSGAYHPu3UjgO7h3Si23lzUw25RsqxYO2e9N+zVBBfShcQwh32V2kOEmobRvnh8n68QuxTRhlwSL0/z9BfGdf7ZXEFwvmLBYvClq7iZ6SkFeYJC2az+0z9q3kXCMx2q+msr4GlYBdlbj0OeesVtR+YA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d047ef28-77c1-45b4-9024-08d85f8c101a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 06:44:04.1802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LMRIRilXFrtWEwKTyodFZ1CXhQW26hTMY4fKYAoxIg1J1gIl4pyFp5EqQIVjHvJU69AorWeC88I7TYNWaTjmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4968
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Biwen Li <biwen.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Wednesday, September 23, 2020 10:33 AM, Rob Herring wrote:
>=20
> On Wed, Sep 16, 2020 at 04:18:27PM +0800, Ran Wang wrote:
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata
> > A-008646 on LS1021A
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 19
> > +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > index 5a33619..1be58a3 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > @@ -34,6 +34,11 @@ Chassis Version		Example Chips
> >  Optional properties:
> >   - little-endian : RCPM register block is Little Endian. Without it RC=
PM
> >     will be Big Endian (default case).
> > + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware iss=
ue
> > +   on SoC LS1021A and only needed on SoC LS1021A.
> > +   Must include 2 entries:
> > +   The first entry must be a link to the SCFG device node.
> > +   The 2nd entry must be offset of register IPPDEXPCR1 in SCFG.
>=20
> You don't need a DT change for this. You can find SCFG node by its compat=
ible
> string and then the offset should be known given this issue is only on 1 =
SoC.

Did you mean that RCPM driver just to access IPPDEXPCR1 shadowed register i=
n SCFG
directly without fetching it's offset info. from DT?

Regards,
Ran

