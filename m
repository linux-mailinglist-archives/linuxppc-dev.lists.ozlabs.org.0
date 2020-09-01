Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B4258574
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 03:52:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgVSS1MJ8zDqJT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 11:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.59; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Jvbixwp1; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150059.outbound.protection.outlook.com [40.107.15.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgVQZ6twNzDqVJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 11:50:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDOqUCWEhR+rJZ/NcdaOdi/+cPz906t5Nreakppk7qaejF6yqIEZrUTXgWD4/0f70Z3SjMixWJ/2m+7kYFnauaawoMftrWXu5kK/c0X+BchVfuksni1USb6P792VXN0d5zmwtkVJ6u0oUHjLdi74mZGWQ2Jz+OIItDmB7nIDu0c8+bWbXifg1pSJEvnNWC4s8lhbPqk1h/98s/8b4lbebbzWxzQ6dY2gOaA8jDwk0TMVBjLwLhq/g5yb3gkI4tzi/tFmC8EmyQWOQpdqoY28SW9S/EV2/fcUO3aqat7Ftx0C4R+mHmBoNxPHk1fquo1oykW0f2T1IpurPF9l8BjwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IGtPGtQSPSUad9pe9gDVMY3Ofs/XcEeNWDZ2ST3Fkk=;
 b=Ag6OmsEramTB1KTeWugX17WwBwSXhk6HdH5IFQUFJ1fz0UXBdAL22p34Ue027Dc38V2tqdwXuDfxPf8wj51VrZ95rrNXc5oGEK15D3zHDI5s5eLuIzQuOugJEKhncxZt3ZXmL6z8Smp4F3B3PcJbzv8hUNgJVxNq0g1/HUaDiv1crCZMMNVTUiq4e+wa0f0XPuTgxQoNE3Dsf9kw5qWVDrzS2M12RYEuTYPO8dHMncRR9QcZdd4Fscu1kk8BL8+kv04bKAdqLZBk1d1c+jc3WxTuwF5I5SrYfHR2Gq6pJBoN5KC36yNiLtZGfQYXE1cmhK93EYSwx1f2myq+LGXW7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IGtPGtQSPSUad9pe9gDVMY3Ofs/XcEeNWDZ2ST3Fkk=;
 b=Jvbixwp1hMCufxX/T5MLnRtDW/6hZHPUnVLe8GvdYfwq00lka2tZMinPG/2T4Eip222wVKEbdstuzN4N2b6+mwI/aCllm37VuTF0hVdUXPyQIhd2feQX6OcKMwq7wLQZ3dycXWlggfIOVwMqI1eXJpewmaZKbQBzvwaW3+4Fogk=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR0402MB3808.eurprd04.prod.outlook.com (2603:10a6:803:22::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 01:50:38 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 01:50:38 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] soc: fsl: Remove bogus packed attributes from qman.h
Thread-Topic: [PATCH] soc: fsl: Remove bogus packed attributes from qman.h
Thread-Index: AQHWZnBiViLySLIncEWSQB7PZxn0f6lTJX9Q
Date: Tue, 1 Sep 2020 01:50:38 +0000
Message-ID: <VE1PR04MB6687FB075B9A6A0923F576978F2E0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200730125259.GA8948@gondor.apana.org.au>
In-Reply-To: <20200730125259.GA8948@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c00f2993-7c94-4b61-575c-08d84e196ced
x-ms-traffictypediagnostic: VI1PR0402MB3808:
x-microsoft-antispam-prvs: <VI1PR0402MB38087D03F3348C423D517EBC8F2E0@VI1PR0402MB3808.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 57J3d7D3Koqpt7XAnZRyMj550oVBqT6mB9DXCipPwQcgOJYboFOfgH/Q6KBMxHXOwpXDV2i8FJEmE+snR8N/J4e+qjdJC9rWWTGXzAMdkUPwl7yZCRHOctWPMRODY4471FkGYQ4IogjXlucwAQt1W0LdFyZ1Iy17E40RuW7WbTi4nyaO91tBVj9K2gwJtGt3Pz0VdK3q3StU4TYv5iaoTB3iX+6Phfv0RXHk42+t8bvLkepXbE2rtAQoJeNcVhftWjrjVQm2qkpSm2oweNcbzw8s1YNjQWna5G2LtCr8UhjJoytUiU+HOw3UGMJZoXOgCqrKF5iavIn2XP3o8eYJFNL/wttv/i64gb1vtK/QVJo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(9686003)(186003)(66476007)(66556008)(8676002)(316002)(71200400001)(7696005)(2906002)(66446008)(5660300002)(52536014)(64756008)(45080400002)(26005)(110136005)(8936002)(55016002)(83380400001)(86362001)(66946007)(76116006)(966005)(6506007)(33656002)(53546011)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zTeDQGI4o+DtbTlor0N29b9tS087MN5KOfNvF9bWuEENCP6j4f54+G8vgUxQIOGABlRD4EY3X9GR6Ll717IIYirQR+gmn14Ln7o3xOET1PGV2dLJTLDRO3PZcJ3bL7baFCc0OezEVxN647TsEWPjpr5cVT0I7GwFB+/SQ5xUgwPgNscoLjBcLHOvk8jc1xVz4PbKbNeR7QLzOC83hHCgXP477sAiS8pg+HyBmEDNNLaa5qiVij7v9I4G4w5DHCC14cmkM4xt6ewXCXf0u9MAASlwMaj9QeGJNPxxI8PNddfesxHUf69DP8474Q6VoDit2SkFhI8TDKUaepqY5QcSxvHjCnHhV5ZpDypnSoMNAsKWbGNoY6drRdpUAcXOfV9dlGSseIXfZ/+0o3gjYYCYn2CXwjzzYel+GcurHqbx/ZsKG+5gMNnsoWQviEpoXkJn4UdI8XBdSttelQMH3E1MY9+9HYGNvuCu9Xh+yTGkZskoXkUlRGCbuF5pjPAWnrfYv1gnjgCyTxZ+wlDGuKA4Vq74RBDU70D7SW/VJ7tngmDZkHDrTrAVOwYHG2KvIxzFtClie5mNIsFaziYi3r1L3XGJJz8Pb8ntsSYUfIqV6X4GzaOf6lrD1BXUx4oH9BC7SVCYgMfSbjbdV7EXsh2wEw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00f2993-7c94-4b61-575c-08d84e196ced
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 01:50:38.0848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqk+t1zCQS59BYk3VEuijZbxb2x50AXJ8bX2uZ+3M1hjhEyl7vodLhwD2lMIEswmqjbDIbKbgYsNRzbAyYRw2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3808
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
> From: Herbert Xu <herbert@gondor.apana.org.au>
> Sent: Thursday, July 30, 2020 7:53 AM
> To: Leo Li <leoyang.li@nxp.com>; linuxppc-dev@lists.ozlabs.org; linux-arm=
-
> kernel@lists.infradead.org
> Subject: [PATCH] soc: fsl: Remove bogus packed attributes from qman.h
>=20
> There are two __packed attributes in qman.h that are both unnecessary
> and causing compiler warnings because they're conflicting with
> explicit alignment requirements set on members within the structure.

Sorry for the late response.  I missed this email previously.

These structures are descriptors used by hardware, we cannot have _ANY_ pad=
ding from the compiler.  The compiled result might be the same with or with=
out the __packed attribute for now, but I think keep it there probably is s=
afer for dealing with unexpected alignment requirements from the compiler i=
n the future.

Having conflicting alignment requirements warning might means something is =
wrong with the structure in certain scenario.  I just tried a ARM64 build b=
ut didn't see the warnings.  Could you share the warning you got and the bu=
ild setup?  Thanks.

Regards,
Leo=20
>=20
> This patch removes them both.
>=20
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>=20
> diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
> index cfe00e08e85b..d81ff185dc0b 100644
> --- a/include/soc/fsl/qman.h
> +++ b/include/soc/fsl/qman.h
> @@ -256,7 +256,7 @@ struct qm_dqrr_entry {
>  	__be32 context_b;
>  	struct qm_fd fd;
>  	u8 __reserved4[32];
> -} __packed;
> +};
>  #define QM_DQRR_VERB_VBIT		0x80
>  #define QM_DQRR_VERB_MASK		0x7f	/* where the verb
> contains; */
>  #define QM_DQRR_VERB_FRAME_DEQUEUE	0x60	/* "this format" */
> @@ -289,7 +289,7 @@ union qm_mr_entry {
>  		__be32 tag;
>  		struct qm_fd fd;
>  		u8 __reserved1[32];
> -	} __packed ern;
> +	} ern;
>  	struct {
>  		u8 verb;
>  		u8 fqs;		/* Frame Queue Status */
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Fgondor.a=
p
> ana.org.au%2F~herbert%2F&amp;data=3D02%7C01%7Cleoyang.li%40nxp.com
> %7Cb69aca8dc53a4030b14b08d8348783a9%7C686ea1d3bc2b4c6fa92cd99c5c3
> 01635%7C0%7C0%7C637317103931120730&amp;sdata=3Dg3%2FJfa%2FNcuhLD5
> SYhbmhno65O1bxisVt2xltu2IMPjQ%3D&amp;reserved=3D0
> PGP Key:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp:%2F%2Fgondor.a=
p
> ana.org.au%2F~herbert%2Fpubkey.txt&amp;data=3D02%7C01%7Cleoyang.li%4
> 0nxp.com%7Cb69aca8dc53a4030b14b08d8348783a9%7C686ea1d3bc2b4c6fa9
> 2cd99c5c301635%7C0%7C0%7C637317103931120730&amp;sdata=3DuSS2C4cuAL
> XcCgIhpIORK4EZ1BHHj%2BqAW2Pu%2FLrFKPM%3D&amp;reserved=3D0
