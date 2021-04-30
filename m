Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F1537062E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 09:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXLQG62yjz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 17:26:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vR6mZSQ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.237.58; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=alexander.deucher@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vR6mZSQ0; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWx746fF0z2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 01:26:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbLzt7qaH47CQqkkCy/Pe42ZLOiSaiAhETjjmlqRPb/WX5Mb5TK/oo2INot8xg7CDi4HnEvQ+9vnbYZ7Dum8LBzKEcq6++Eo0ANf/qkNO0yHMDmigABvda3qBYs+cfUi+Xl6UGn8IJfexWT+QNkQ7EB5Tai/Mv8QnCJkJznT31d8s8zYlRgwMakalwX2PI91RbmSwm0954siIpav9HB9L9PpRMBLUn5Tn9LaK9uxiWVo1hvYdbnnwsQwvncctwOUnIalKJuV72/eN6IAqSD3mdr3ksTyCqb4mOfKvNy3QSdsTD+oJbMfpmEpuRAWTZ09uAFOWopzzj/NXEGRbRE4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xORyGQuXZzscPHxpGXTcywPNIX354jMXkN2BK+Rlvw=;
 b=Y+1Cgv49nrM4xHNo58NQctriX2UOCgd3/XaO7NoIDwxdgZJYXar6gHLQinfdCR3FqgtYt4Qh0nXBTHzKrf/Yld62JQyfa5+TPz9G7HEe8Kho26C3CFKZCfRAf5FGdxso8djhD34y2YM/pCkq+DQCSNMsoHLM/fjCQeX2/DfTvALVHABVZw1TFi/UuM1N1BmLlnLl2Y0PCaSFlHDaMx/mqmW+RmqKY98SbWSISamUYP+RZJ1dLYp7GZ0yx+GHpbr2X39IFQ9s1iuMs2p+AUYx4Pv3yFoxDjgySLbnxv3kX902gIpS3MjsKDHB5PGwn4DPGTgdFzRvzQrVY7NATrEWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xORyGQuXZzscPHxpGXTcywPNIX354jMXkN2BK+Rlvw=;
 b=vR6mZSQ0usAv8D/FT4qFeFvaOcSpu/q+0e3kqTypOpHBuh59N84R5UoE4dwnzPwRDRKuGM+cgR0txCZi3R6WC/xril4j5M7FKRyb5sQbclsb1mzvVkAL4L/49AFTHUxUycBsQbYzm7vNBfiHoKUy4gDfxCHf35UfaeMYL7E3vTY=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Fri, 30 Apr
 2021 15:26:45 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4087.026; Fri, 30 Apr 2021
 15:26:45 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
Thread-Topic: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
Thread-Index: AQHXPbiAnWSiVTTegkyJSA5KmHWDZ6rNLjVg
Date: Fri, 30 Apr 2021 15:26:45 +0000
Message-ID: <MN2PR12MB44881C5F5E24888E2590BF74F75E9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
In-Reply-To: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-04-30T15:26:42Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=a14eb64e-4d28-431e-be13-b53543c6c947;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: xenosoft.de; dkim=none (message not signed)
 header.d=none;xenosoft.de; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f00f9e02-04d7-4750-8d26-08d90bec5d4b
x-ms-traffictypediagnostic: MN2PR12MB4502:
x-microsoft-antispam-prvs: <MN2PR12MB450278C82E573FB8A530DEAAF75E9@MN2PR12MB4502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IEU8uackMPpvANx2MV0vPhaD36vQjo7ozrtlXNZMAd354uVKMUZdtzyk7HY1cXvmkI0o0+jGBR+r8sM3GcIeFDyLuRJh7sszHeLH+CWadKe8JCJHxVratVA+yMiQTofXl7FKMCWrb32yMBIOADQvWa/w6ig6EUjWL6+CuJfRESubDgKRVVRWVEg1Kb9M6tvA5jn6Sj5cRyyte6Gd0jkUy6Ujv2zo5fuYKWjlJAyr35sfybEcnf5dbHBxDTGf9hNdAJ+OIZqw+Lei3nQuZTE73B8ziPU1ddW69Ik7r47eKn7QMc3lEiM9XPy3toB0eUtPnpkAaPU4lg39RA9JIh0LT1hefRDV0HM52VQdniXSJU473XtmAlTEavYz+3BI8t3hPnHS1OjTtMZ/R/BSDUB+0cl0gtmKFClN2SpnOI0ukD3V3Q1s4ZtUaPRP/CWZyR7XdFv74h6iIzlcb3ia+rkLQ2pjLjrNNhSAZTqNzxsrlw0F8c+1ugJZVYmjut7Erauphd3gKj6XPPfQZy8onfDAxqcedZZ+9NE7rHJuU8fjlsoaYyo5oUuiucQIFwUK4XN1VuognFFdJjgUXpJla6RLQex3GoYod7Y/iZddgHoEJ2lO7lYk2feRcjdLTdBm7omEgls6YInsvdZefeUi9A0giBlyv2KcwoFl21+K8xWUUXW/aT7shUM+bQsnJJcUphuZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(316002)(38100700002)(110136005)(7416002)(5660300002)(64756008)(66946007)(55016002)(53546011)(26005)(122000001)(966005)(2906002)(66446008)(66476007)(7696005)(52536014)(54906003)(6506007)(4326008)(186003)(8676002)(478600001)(76116006)(45080400002)(83380400001)(8936002)(16799955002)(66556008)(71200400001)(9686003)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?48+cQoEHDOS1KhGE766hGBTWECzriWRb7HdeBVP8dHfUm6qFAWY4q5IBnf?=
 =?iso-8859-1?Q?0rU+CFPI/IomqWEyhodKhXwbm/6JU9aFGicbnZWjD4G3L+PF1eeCdVnzwn?=
 =?iso-8859-1?Q?YowlVk5dZJQi+5Gf6pE3YxqxV9cEA1shz39ErmW4hkz1UYcD5EvrmbYqT1?=
 =?iso-8859-1?Q?i3NhVKthPB++FS2m0v0aDV7Zjx0pKlri93EtvqnGlIGst6gGE+VXddgJwe?=
 =?iso-8859-1?Q?1hxhz3Na3WJZ54WdwV+yJtc79MO96VDh84xxqxBNa0wlSpiywUaIYtv8WV?=
 =?iso-8859-1?Q?CLG+KaGejjACtiCMwQB9DGTU5Hk0jLAdIp6jjiIzPJD/j+yRa4kbURl6xg?=
 =?iso-8859-1?Q?GX6VI4n9sxtZ0hi1Yf7WJOn0m2BGsKuXrpVM5+17riPIaIeaub+fjPYUIP?=
 =?iso-8859-1?Q?Xt//6vG8TM624ImYKXcaOaT1N/++G9Fec/4lIydMQtMnlP4jM+U1130Uko?=
 =?iso-8859-1?Q?BEfGWeA5dG62k4mN9G4Cmy9othWNMKfOQLSq8hovpcrdrfSZeQdVv0gnxv?=
 =?iso-8859-1?Q?PvSfk+MBtbddB0qoPYFVcgMxnlJ3OHO2VK6MW0c8e8t7vRNd2uayFaqQFv?=
 =?iso-8859-1?Q?/8ZIbpv4LzyovaD+4STOWX2qhNN8v6K3ByQztETri3LbtI96WNfw+6NRNc?=
 =?iso-8859-1?Q?m3CR6Zi2MPj9CDNe3OhEE3QEAR8RaAaGXraxFXMkh5G5OpL2QsGVnjvWJX?=
 =?iso-8859-1?Q?H/nyYwACoY9b1Dz2zKiPxy94Ov5zlhVWndu0wh2BRqIVtEt9bW8xhvheDz?=
 =?iso-8859-1?Q?o+FzgOsb+zC9b/Muij1WHMYQ7b8oKbO9uLbHv8J5pOvYOFzVOzHUxuh7Qg?=
 =?iso-8859-1?Q?7PbfqI+YwAcczV1c1Zmg9nitTP494UGU3zXthCxlENDNcoXS+qp/q1hp0f?=
 =?iso-8859-1?Q?yv6hfJUHqf4JTKTYduWWrjNwjt8NO0aEDDsjdMIFSd3Sxl5R8FfsGyPB8/?=
 =?iso-8859-1?Q?/St1iI/fpEwatXAinKT7O6aAp2Bz/XsxLWneHeBm8BIBqLEGUCQXIfW/gd?=
 =?iso-8859-1?Q?+IUYrqbwcnW+mFxi8CRyqgHjGId913P0brMgyPZp0q+YAa7LIOT7kxa+CA?=
 =?iso-8859-1?Q?l6PMgWPdNeYf4uNCm4ZzmVcNOMC4UJrmh96qBbuFVeaH8vK3zZEPEQ9Pu8?=
 =?iso-8859-1?Q?qgSkfXoXXm9HCUiLTyTomkImqEgK/TVfw1KLWINbJeuHo0OMTEiVJ0bEnK?=
 =?iso-8859-1?Q?LgKMb1vvAJT2PAFjmguEf8gvxHx803YnPLrlrxXJsZIjbBGATsgLf+qhva?=
 =?iso-8859-1?Q?4NkWKg21Ltf2oEXIRPVWRkzsA+OepaqdT0G/SJI3wBgxi2EtbpTnKwJ0GG?=
 =?iso-8859-1?Q?f56o7PQrccsNEu52sR9dQI06e4G5vbu7kaRyO4H5HhuleM3mUXwKE5tT6W?=
 =?iso-8859-1?Q?wEozCoXE0R?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00f9e02-04d7-4750-8d26-08d90bec5d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 15:26:45.4229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9Ytt5D29FDyRztctvoaEvyYPLLKozqyH7dvfwt0ObOaR75z58wY5p45M5Y9sXpvutORRKvtGp6gmFRbMb7jhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502
X-Mailman-Approved-At: Sat, 01 May 2021 17:26:03 +1000
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[AMD Public Use]

+ Gustavo, amd-gfx

> -----Original Message-----
> From: Christian Zigotzky <chzigotzky@xenosoft.de>
> Sent: Friday, April 30, 2021 8:00 AM
> To: gustavoars@kernel.org; Deucher, Alexander=20
> <Alexander.Deucher@amd.com>
> Cc: R.T.Dickinson <rtd2@xtra.co.nz>; Darren Stevens <darren@stevens-=20
> zone.net>; mad skateman <madskateman@gmail.com>; linuxppc-dev=20
> <linuxppc-dev@lists.ozlabs.org>; Olof Johansson <olof@lixom.net>;=20
> Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Michel=20
> D=E4nzer <michel@daenzer.net>; Christian Zigotzky <info@xenosoft.de>
> Subject: Radeon NI: GIT kernel with the nislands_smc commit doesn't=20
> boot on a Freescale P5040 board and P.A.Semi Nemo board
>=20
> Hello,
>=20
> The Nemo board (A-EON AmigaOne X1000) [1] and the FSL P5040 Cyrus+=20
> board (A-EON AmigaOne X5000) [2] with installed AMD Radeon HD6970 NI=20
> graphics cards (Cayman XT) [3] don't boot with the latest git kernel=20
> anymore after the commit "drm/radeon/nislands_smc.h: Replace=20
> one-element array with flexible-array member in struct NISLANDS_SMC_SWSTA=
TE branch" [4].
> This git kernel boots in a virtual e5500 QEMU machine with a VirtIO-GPU [=
5].
>=20
> I bisected today [6].
>=20
> Result: drm/radeon/nislands_smc.h: Replace one-element array with=20
> flexible-array member in struct NISLANDS_SMC_SWSTATE branch
> (434fb1e7444a2efc3a4ebd950c7f771ebfcffa31) [4] is the first bad commit.
>=20
> I was able to revert this commit [7] and after a new compiling, the=20
> kernel boots without any problems on my AmigaOnes.
>=20
> After that I created a patch for reverting this commit for new git test k=
ernels.
> [3]
>=20
> The kernel compiles and boots with this patch on my AmigaOnes. Please=20
> find attached the kernel config files.
>=20
> Please check the first bad commit.
>=20
> Thanks,
> Christian
>=20
> [1]
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fen.
> wikipedia.org%2Fwiki%2FAmigaOne_X1000&amp;data=3D04%7C01%7Calexand
> er.deucher%40amd.com%7C0622549383fb4320346b08d90bcf7be1%7C3dd89
> 61fe4884e608e11a82d994e183d%7C0%7C0%7C637553808670161651%7CUnkn
> own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPNSrApUdMrku20hH7dEKlJJ
> TBi7Qp5JOkqpA4MvKqdE%3D&amp;reserved=3D0
> [2]
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwiki.
> a miga.org%2Findex.php%3Ftitle%3DX5000&amp;data=3D04%7C01%7Calexander
> .deucher%40amd.com%7C0622549383fb4320346b08d90bcf7be1%7C3dd8961f
> e4884e608e11a82d994e183d%7C0%7C0%7C637553808670161651%7CUnknow
> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DB8Uvhs25%2FP3RfnL1AgICN3Y4
> CEXeCE1yIoi3vvwvGto%3D&amp;reserved=3D0
> [3]
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fforu
> m.hyperion-
> entertainment.com%2Fviewtopic.php%3Ff%3D35%26t%3D4377&amp;data=3D
> 04%7C01%7Calexander.deucher%40amd.com%7C0622549383fb4320346b08d
> 90bcf7be1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63755380
> 8670161651%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DTokXplD
> Tvg3%2BZMPLCgR1fs%2BN2X9MIfLXLW67MAM2Qsk%3D&amp;reserved=3D0
> [4]
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.
> k ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
> 2Fcommit%2F%3Fid%3D434fb1e7444a2efc3a4ebd950c7f771ebfcffa31&amp;d
> ata=3D04%7C01%7Calexander.deucher%40amd.com%7C0622549383fb4320346
> b08d90bcf7be1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375
> 53808670161651%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJC
> M4xvPEnWdckcTPbQ2Ujv%2FAiMMsFMzzl4Pr%2FRPlcMQ%3D&amp;reserve
> d=3D0
> [5] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -=20
> drive format=3Draw,file=3DMintPPC32-X5000.img,index=3D0,if=3Dvirtio -netd=
ev
> user,id=3Dmynet0 -device virtio-net-pci,netdev=3Dmynet0 -append "rw=20
> root=3D/dev/vda" -device virtio-vga -usb -device usb-ehci,id=3Dehci=20
> -device usb- tablet -device virtio-keyboard-pci -smp 4 -vnc :1 [6]=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fforu
> m.hyperion-
> entertainment.com%2Fviewtopic.php%3Fp%3D53074%23p53074&amp;data
> =3D04%7C01%7Calexander.deucher%40amd.com%7C0622549383fb4320346b08
> d90bcf7be1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375538
> 08670161651%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DRXfSlY
> A3bDEFas0%2Fk2vMWsl2l0nuhS2ecjZgSBLc%2Bs4%3D&amp;reserved=3D0
> [7] git revert 434fb1e7444a2efc3a4ebd950c7f771ebfcffa3
