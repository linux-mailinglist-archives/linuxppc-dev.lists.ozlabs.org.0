Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAAB279F47
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 09:25:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzccZ5dRqzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 17:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.21.59; helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=iG8J7s5J; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzcZk1PWMzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 17:23:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln7bkLkMYINmS9uh3jdP5NftLvhStRRSttISJyKvGefWh55ySWGcCdT72hVqO9LPqA3KYZKibpo6vWuML/1Cx1c3Bb/l+Fpu13n1XfIXv7V52Ps9cgCcqUe1VHocNmhKG7GJ+pBtqYtylt/Of+TFdOsfFj5YHhFAYnqCOWPhfDRTFycnrPwCz8rlIMhKOU7z1ZHthoY6RHxl5F0j0a2sT+VJeKYujpDhS361cNOC7yVRAC/CbIIst5v2V/yi7J54ApE3olE5kDEFSPnT/nteEQ2Cxg291ZDvr0xcFzWpZiVdybvaRoVt5u35tssFQC9G2a/P/5zboSSrMui+wUQUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EQUCnH15G4C7RAUfvGB7fSFaXMuI936jLUpAw7owcg=;
 b=cRbX58Q2opcmllKDzh1zxY9pOc5ltyl++gktYcr3d11TgX2tdxQN5clmUgkOiDZjTunCF2HWRtD0ilpCuy07EUHhP78uhxGDQJAP5pMDugwZIYmHEUkp/FS6r87k/ZgeCehLa6725W56up1kNBhSHYA70CoeN+jhD3Gl56NyvmAFitXST687psdUUGBmXnNf9ih2OhZEcW+OuyWTLGriqlMdF4nhs7Fky13nQ1PO5zy2+UGvdqHeByM+IgiRAcJSk7nSFC8LH+Quk7tsM52izmIPAax8zf5SjpRw/bZ0dON0ekP0T7qwt/DAYwGb8RyQHmDPEShRCnXTCpISNT1jyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EQUCnH15G4C7RAUfvGB7fSFaXMuI936jLUpAw7owcg=;
 b=iG8J7s5JKrpAN6sz/V89LWX+Ken3OgrSFcJPc8OuxTt56yKYKb0bA5djW44duqolp8mDoaLfSWjeWl4HFZPfv+kAebFd++qzLS4Os8FcGfgs4y4bAwhURUmICk5gAaXzol0Py/gwa06VbQDu1mJ4Uc4hg3ZtO/q8khyq98tCKQg=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB5206.eurprd04.prod.outlook.com (2603:10a6:20b:12::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Sun, 27 Sep
 2020 07:23:33 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3412.028; Sun, 27 Sep 2020
 07:23:33 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Topic: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Index: AQHWjAMgWpwpgcZEfEity8vaUHwtLKl1i48AgABEr6CABlVjYA==
Date: Sun, 27 Sep 2020 07:23:33 +0000
Message-ID: <AM6PR04MB5413C58E6BB5FB08DF980564F1340@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200923023234.GA3751572@bogus>
 <AM6PR04MB5413BB2F8D044B2312DAEC4FF1380@AM6PR04MB5413.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5413BB2F8D044B2312DAEC4FF1380@AM6PR04MB5413.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e2cacb3-af09-404f-b502-08d862b63dde
x-ms-traffictypediagnostic: AM6PR04MB5206:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5206A197222B88B2C5A089EBF1340@AM6PR04MB5206.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CNELaXIIw74b5CskT8OWns4k+gYU44HI6hcpGGjidJNMUQo62EP2hTKTugvDY4E/+iH2WEDXhENteLH0svdV8mH+HKRSSgiRm6U/iJ/6xFIDrNyxi+FdXGua2/ogv3i4ioZA78HukeE4NmMzlowtQeQUs1dPmrMfxNTVQoU6UkzJYo1pUttduJh4miiWbR685/IKamoJ0mQfiSHqEiMKfKfR22IOYokoRl5gXW7xlrX8zk5SzlZdipkZcBdPfT4TclETN8pHzQNF23+2Z3BFU6bbwXohY5zhCHTSoRKZFOXhBfM8ed6ab5Vr2fcCGAxBuuGCla7iZPb2WUKQ8rhh/hNzcO0CxHTpC/18WML8YcL29wlsylDku77+gYfc87dz+C2pkVlnjmy+e/RBUHqOtuzCBCDYZq837Cg+d5vbQJw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(4326008)(52536014)(8936002)(55016002)(8676002)(71200400001)(9686003)(66446008)(64756008)(6916009)(2906002)(76116006)(7696005)(86362001)(26005)(53546011)(6506007)(66946007)(83380400001)(33656002)(478600001)(54906003)(5660300002)(316002)(186003)(66556008)(66476007)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: z5QsRKz4uwjVt9uC7KC7Wb0K9TJbwKDQBXY1o665QIXn/DtCMtVWEzNSdqlDC7eGWpL9HG7oJX122hyjp1ZGTjQA/HMPXcqHwqQYjtRlYuEs4RT3sc9vax5wY2DesXNhAIxOsWSxhS3F11G0oNnsZ+b/ipg1OmHOUuxxijTy3YOAbqf7PW0UGxANTFvBrFCBBuQFqqTnxdgvpzWoRzOWScfqZcq3eb0b573Y/95wk/QT0ci8QyRKBAdtrfSP13KYpa8nZagB3l9S5ZV/OS14N+ohc+oqGO1V3j9EOyhJdjl8u+TngJxmb2bKZg+Pbr2NJsJE5mZFRCAT4QQP27s+Gy+LKqN/1O9CjiM10J4T4E7kGIKHblbUISuxFlW0TqVy0rKDAGrD+u4Yfb9GbRH00YqrDwRXP6vgPkbaKmLUnAFWLA79WWzEEtzyIcY1DEaM4565ZHGD/jhTjGHUkCt7H5zrzuMcsIMIv0RDg4e78jCbF3e5FOtwgPFq5C2C2mGv/ugYi/NfcyuVPtSq2hAbdvnognAalwpEtSeiky1HGv1K4Mzk/U4H+XRDr+R2o1kOMPx+KLe5FwwrqEUK0R9BO7rbb1PgXCSLB/qxHwp6yl0BNUvdfhhDo0sbhAppPw1h2f+pDmkakiSlmWWIN61rcg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2cacb3-af09-404f-b502-08d862b63dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 07:23:33.3880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTrTw2c8upL7VRqrOVk3fqmHDMLO9TogowTWSLlb3RFAaUDAmQzffbWTtpAcbghzmgkvSdxXWV270fY7QMCm/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5206
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

Hi Rob

Not sure whether you have missed this mail with my query.

Regards,
Ran

On Wednesday, September 23, 2020 2:44 PM Ran Wang wrote:
>=20
> Hi Rob,
>=20
> On Wednesday, September 23, 2020 10:33 AM, Rob Herring wrote:
> >
> > On Wed, Sep 16, 2020 at 04:18:27PM +0800, Ran Wang wrote:
> > > From: Biwen Li <biwen.li@nxp.com>
> > >
> > > The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata
> > > A-008646 on LS1021A
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 19
> > > +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > index 5a33619..1be58a3 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > @@ -34,6 +34,11 @@ Chassis Version		Example Chips
> > >  Optional properties:
> > >   - little-endian : RCPM register block is Little Endian. Without it =
RCPM
> > >     will be Big Endian (default case).
> > > + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware i=
ssue
> > > +   on SoC LS1021A and only needed on SoC LS1021A.
> > > +   Must include 2 entries:
> > > +   The first entry must be a link to the SCFG device node.
> > > +   The 2nd entry must be offset of register IPPDEXPCR1 in SCFG.
> >
> > You don't need a DT change for this. You can find SCFG node by its
> > compatible string and then the offset should be known given this issue =
is
> only on 1 SoC.
>=20
> Did you mean that RCPM driver just to access IPPDEXPCR1 shadowed register
> in SCFG directly without fetching it's offset info. from DT?
>=20
> Regards,
> Ran

