Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B3F28C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:12:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477x352D0vzF4ZZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.49; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="rcCKqK5Z"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30049.outbound.protection.outlook.com [40.107.3.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477wdG2pzBzF1Hr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 18:53:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ot6KtDEIaBB26gGvxMlr6fjoZPvwaL1QHMLgBcuI4NQD+ecxeEcPQ7XNDAsDAxtdmYy7C4lWg3rR2doe/Qt6zTlleKxNmQTnyid6LHmbsh+PJSgGUdMknbSUuBrec2t66ssp9lqbZFLjxdJaqHEWX8cMtrzeFjUx0b8+EegMgrFB5OWu+5T/pMnREDVdDFbgxr0w/b0Hxd9nOzbRVbrpCMxRjnqdw8l9ywUHMS5uYrbRTwvJaW/SnfiyhZT0CT43MbIhLh1SN09cqFzul7Ekv4CMfYO6Lq9Ds1hNt841mDaMNTS5HyU4Byp4dvxyV3J0f6nxfkWKsWuVNzFvVTnw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msFlGiKfaJwHoMxesxTXiLzxrZHaTCBWlBSEl36KY+I=;
 b=OPVFUTvCJPIcRp2A8qtP1dSzjvxx8x6oHkZOGL7s3fW7qaziYcfN6y9NlApr7aCqFZYwoQ833Lv5KbCTtq/RvFE1SgnQmsjl7SADPhBsE2Sl3CXjL5WgFhCj9gat7coUZcyaVr9daEjtV8EtAqVyUZcEKW98xxAZL52ohcg6uWwefl/HhhFuWHhTM++kk1mk13R7p+fCaj04jlDaxswcXAL4N4nNfuvav5n4DHBnXjjE/OcVpSPzgU83CEWRWHXb4S056uYqZyJsfwgRWlQ3/UyF1bDLSrrBSaDqlOY3fCvaYocrS9pAVBtKBHd+4/8gdAHU0EnzQV8rtZHq21PIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msFlGiKfaJwHoMxesxTXiLzxrZHaTCBWlBSEl36KY+I=;
 b=rcCKqK5ZPZw1uhN+L9ax24M+NemLTGhFVFo9FnNvKPZEmWOYbf5SgrcL7CRL07Z6WxfY1qGSR+hjWxu1uVxWL8UDkgSxIkVvLPd+Ik8AvCEDQXzaulS8XknrTR4W2UcMI9CePX9gQO0ZKQNusB5T6zBsI3OIL0RqAWFleprbVSg=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.254.214) by
 AM0PR04MB5490.eurprd04.prod.outlook.com (20.178.115.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 07:51:19 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7%7]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 07:51:19 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add compatible string
 for imx8qm
Thread-Topic: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add compatible
 string for imx8qm
Thread-Index: AdWVP8IifFfTCEP2RpqREdYX4F5jzg==
Date: Thu, 7 Nov 2019 07:51:19 +0000
Message-ID: <AM0PR04MB64687210E053B6ECE90C860DE3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a974b462-1ec3-49b0-a903-08d76357468a
x-ms-traffictypediagnostic: AM0PR04MB5490:
x-microsoft-antispam-prvs: <AM0PR04MB549041657A3E54828C428181E3780@AM0PR04MB5490.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(66476007)(256004)(64756008)(33656002)(66446008)(8936002)(66556008)(7416002)(76116006)(4326008)(316002)(102836004)(6246003)(2906002)(3846002)(26005)(66946007)(5660300002)(6116002)(8676002)(6436002)(7696005)(52536014)(14454004)(55016002)(9686003)(229853002)(54906003)(186003)(71190400001)(14444005)(86362001)(6916009)(476003)(6506007)(486006)(66066001)(74316002)(478600001)(25786009)(81156014)(305945005)(7736002)(99286004)(81166006)(71200400001)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5490;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYF7YZkKjc6AkWWhtQphLbiKkEqRiBxbRerpzWvNHaIVW9jDsmZYFDl1XMMQZVEKrGR4weR6MKQe/ZBCse4y/ImgP+r30EgVDiIa09Yf/vj3q8WwKDKJEdraEly38k4paqr6LacaqkjWI5hZCA3DBOTbDu1cewbqYSNvNo8hSVxGuCH/+JStE8kYgngYfF7hrL5s15rV2d0PFi6vc3kSaDPZUA34kFKMYZnWocTuFtyZlY2KxRMISqyMPMPwcvlNhb4pQ9dC1BoDfCuKXje3XgosAsAyi5woLHaFHTcvh5pXlczSWtNkNj6Gv7xCjGAvmfkCiHTOLbxuCTt4LQMBAh4ZsyzYoffrkN5V1aHxDOYbCK/I60w3hGhSO2ni1kh6I1qGb7/ATYegjEKPU7vBlaksrR/MGPbOk/szQnK8fNI4b0NUkpVDJBd+U+OoxhbH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a974b462-1ec3-49b0-a903-08d76357468a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 07:51:19.2341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwmEDG5SOPXnPhbGYXHnC/lRZmZOMeql6MrBDMXKQbjhc5MahvS2XNxO9j5RFME1VlSGjSB3n9zluQWGQDeWvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5490
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob
>=20
> On Wed, Oct 30, 2019 at 07:41:26PM +0800, Shengjiu Wang wrote:
> > In order to support the two asrc modules in imx8qm, we need to add
> > compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"
>=20
> Are the blocks different in some way?
>=20
> If not, why do you need to distinguish them?
>=20
The internal clock mapping is different for each module.

Or we can use one compatible string, but need add another
property "fsl,asrc-clk-map" to distinguish the different clock map.

The change is in below.

Which one do you think is better?=20

Required properties:

-  - compatible         : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
+  - compatible         : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
+                         "fsl,imx8qm-asrc".

   - reg                        : Offset and length of the register set for=
 the device.

@@ -35,6 +36,11 @@ Required properties:

    - fsl,asrc-width    : Defines a mutual sample width used by DPCM Back E=
nds.

+   - fsl,asrc-clk-map   : Defines clock map used in driver. which is requi=
red
+                         by imx8qm
+                         <0> - select the map for asrc0
+                         <1> - select the map for asrc1
+
 Optional properties:


Best regards
Wang shengjiu
