Return-Path: <linuxppc-dev+bounces-6586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C1A4A927
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Mar 2025 06:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4Ytj3njpz2yyT;
	Sat,  1 Mar 2025 16:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:d109::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740807885;
	cv=pass; b=bUheUWXMIgeYsGcW17KTBxkgrQ9OCW+/IWYYmo0Af+Y/cXOZEvkXWMN/sKGBDL34yi6jN5Q4KDDdH6OGXfVUXQ6PvaRc+2MSw5mLgGalIUliahDjqyFLMASXXm4OMjz5YXbni71IE6LyrWp8RMfrZt8hUddNj2Df9jIW8BQXlGrTHgvzU2UEU9uYU2TTM8OKnk6poBLJW25CPHDVjj6dci+v4gjpoizPqOD2AJ9RNtbId/TjDYNhToyIW6kvRTQr24F5Ub1J4vIHC8tHBk3NVjRrTRDXFfz4JQjWXHW7zGUXKAY2zvpz1iC1TiAt+pAD7PtOfCJIKLD1xdCuQYmbEg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740807885; c=relaxed/relaxed;
	bh=vYyiXmcDnv/w3cQNoBlwR4cmCzNdcpONc87Qz2xUshI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RqFgQbrqP7xpuwg0osOMm/Ffy1qAP7j2denwe+XzVxJHMqmKRa7H08cQWE9ENiA0sPrIm8FW/28O/VglUSU2LC4+wllHZJ86Mi7dzOU/gIIYXwLYDqEadNWh/KkkBU8Sw3Uydafj5jypTp5/stWumNivwAGvZqaFDZ2cGh92EwinNLdTCXrRvno7cER8NN+1DgxiN9Aa9EDpf/lxIcMEzsS0SM9vM6zf9pSVb1bnWPI4CVUKAErj2/jFmmS3Epc9TbxQwp5SGevWvEeUCEFyOOtvrd3vSzIyN+G5GFo/84Y7JKX1en5/iyf/GhX+tSqbGL30GrTAR9Y4ShPuYalhlQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dy9Uohw3; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:d109::; helo=bn8pr05cu002.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=dy9Uohw3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:d109::; helo=bn8pr05cu002.outbound.protection.outlook.com; envelope-from=mhklinux@outlook.com; receiver=lists.ozlabs.org)
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn190110000.outbound.protection.outlook.com [IPv6:2a01:111:f403:d109::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4Yth512Bz2yy9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 16:44:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnJY/kidPSGmeaRYLZ8bQAzwHbl2XzMZCXd/46P2dwFTHTpf0jjfn8M8JrUBnAO6U+CI2erCNGfKzbEiouecZUJfaEArccfXMix1/AnMb5NyEjT0pxaMctRG+yUhVQtj+cMuTNAo10hPoq9Tn8/j3OvEMhSxNQWhb9BIX/nr1L8fqV7sCkq/HOTjo2qgdmOsWzsJ8XptwqNEo9sbyDf+9OkyMM0ahOd4lTMofXjC9RvLKBlejmMU/zUdB+iCCmNRlUwl8e1LGZVUsBXw3Wty+JSNWVC5KBKqVJas1VMqvlNf9nOFr/rmxgVGxQouaCAN1PbAHBFTsVQOSdOkXW06fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYyiXmcDnv/w3cQNoBlwR4cmCzNdcpONc87Qz2xUshI=;
 b=muZe2qWIvYOqdjnprr8RXlyFQibWjA0aKnWL2WsHysTYaSbgUePTrflGslX54qrf6ilT5HbK8p4AlRG78Kodj+42HN+vUTNVix1qx0E3M36ehbenoKBixdJXUsx+VMd5Fplj/8Au4SznPU4nizMpvAd0idlkmnwRXs7YsNJUQuwwPU26okLGHCaXawgtv4lF+F99V3u3g9lySV0RCBCPRQ747+A/kkfN6nVQMDehdN5UVEc+2sTWhthsJzz7rgpugFRPXB1xht2K9Ku9yDb219KJ1tzUv5TQBVC1vG8KupslSWD342dLUoWPfZkkVDYoqOFsMSG77RRzJjynErpx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYyiXmcDnv/w3cQNoBlwR4cmCzNdcpONc87Qz2xUshI=;
 b=dy9Uohw34L1fxR11h8pEN1Fb7xwwfeamwNgl3KQe2IvgYzuojuuDWpuORBOcsW+67n2kXVFZw0Qjt3cHpR9L40vz8QkNCxz/eJm1+y6gSnZEYa9tIUISuRrN+Ev84Uc1STZC6aMpof2GUHXjAcrP8cruk4Y6b8rKysoSDHkHKLX7EER4sjtyNXeo/njm4NGNX9dFeR7pMPlSNCH5btFC63RqS4ElOjw7r/T3skjVED+RZ2055j/iESTRvQDu+xD1lBZzH3dHnBh4lsHwfPvUtLgB7ecY7c1aoXWj+J7M3qp0EhdO0mu0s9Qwk2c31C+t7+9ksabFaPPDvsaxPwiznQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH7PR02MB10037.namprd02.prod.outlook.com (2603:10b6:510:2f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Sat, 1 Mar
 2025 05:44:14 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8466.020; Sat, 1 Mar 2025
 05:44:14 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Kees Cook <kees@kernel.org>, Christophe Leroy
	<christophe.leroy@csgroup.eu>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Venkat Rao Bagalkote
	<venkat88@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: RE: [next-20250226]Build Failure
Thread-Topic: [next-20250226]Build Failure
Thread-Index:
 AQHbiLMFbXX/ZR+7zEKes5eJ8toCr7NaXxYAgACYQQCAADa1UIAABLCAgAHNMYCAAMf70A==
Date: Sat, 1 Mar 2025 05:44:13 +0000
Message-ID:
 <SN6PR02MB41576128AC493295131DAB06D4CF2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
 <20250227123804.5dd71cef@canb.auug.org.au>
 <14193c98-fb30-4ee8-a19a-fe85d1230d74@csgroup.eu>
 <SN6PR02MB4157A0C1B4F85D8A289E5CE9D4CD2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c68287f7-ad00-46fc-a92e-06e0c9074139@csgroup.eu>
 <202502280943.6558CAE@keescook>
In-Reply-To: <202502280943.6558CAE@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH7PR02MB10037:EE_
x-ms-office365-filtering-correlation-id: 621d4f41-2728-4ca3-b22b-08dd5884194f
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|15080799006|8062599003|461199028|10035399004|3412199025|440099028|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5fs80djApvibUVNzpQYpG9UmF+hXcSkFwEqEHC1NJjkHx7Wlcd2TMF47Qt?=
 =?iso-8859-1?Q?/8k6+3UtWW/RQ70NowtmyMQP7XXWQPYpA1UZ+X0v3/+EKzArMXIVst1LhI?=
 =?iso-8859-1?Q?omsc0FKnFcgXCCwNUwsiZ4ARQzAw/ZF+LV2/KItBt0d11akKJBlMkBivqm?=
 =?iso-8859-1?Q?JjTk1sFbLleaPtBwLb9ciuAJpHp/8l89JyvNy/qDEnnfNzJv4u5Cfrlhij?=
 =?iso-8859-1?Q?QlCTnRCiHXuv62AvsxDjhmILiADQXcL1bTppgUwz+q6UZptARPXcvRaeal?=
 =?iso-8859-1?Q?8KkR1Q0SIdPN7Q44OOaoN7wpRyItohQ6u5on2xcY6Sob9h1nGnEmnU1XY3?=
 =?iso-8859-1?Q?i0GlFLVrW/4LMn8VzszIf1mweQwk/AlkugimMDTL4mJ3Q69Oy7nffbBJXj?=
 =?iso-8859-1?Q?PGuvf7gvxE/oGh449rNBJv+WF9lo2VMuqJzUmmi0oKrXKSFKnXeFCgOPLr?=
 =?iso-8859-1?Q?zJ7ihmK/i8wActZd8+MNnxPFOkaijHXpnkeZihObuboNaN6iPd33EpkHmE?=
 =?iso-8859-1?Q?XZncbICvyX5pG/FwLu8GzGOPt4g9Z2o2fhY1WXvtAFWOCpTon2JYA4oAjj?=
 =?iso-8859-1?Q?YjuD6PwQFbHt+FmEe2HF4SLL53F8wUU7bTph/d87uDgbRLDuXlMKsx7Oh0?=
 =?iso-8859-1?Q?762mX31JNJzVVgHQ28KaSDRPEn2Z9AMGz9oVxMLkZS0cD9DI3JFb8veNUO?=
 =?iso-8859-1?Q?gDkts4vy7wtcjS7sqkj9N0EmVwyfJEKUez9olM4PG7LOU0/RoRhZKpRuoa?=
 =?iso-8859-1?Q?ym1SmZnsO+R8yULb8+7mybTjapBX+idxIqnwCzbJJoEL6bH3zzEqk6fBvA?=
 =?iso-8859-1?Q?nAcOFyPVhq4mzs/+UJbm/YvUuWNjSnMIiW6oKDZb9AdeIJdlSxS5WTcNwG?=
 =?iso-8859-1?Q?tMOyhC+p/JVx6dP2GIfw68XviIWkuwO/j/RID+/uf+Q55Zdz2scHFh4VPD?=
 =?iso-8859-1?Q?MQT10Y96fv1Prb4vNsCK2qOflxsmBZNNoWL69s3hh8OehLpghi7m1EafoG?=
 =?iso-8859-1?Q?JWWYg5NupJFfmiKs8jPsm8cacM31FJJMIvJsIVS3eWWmOSiJWB8MzYV6Sd?=
 =?iso-8859-1?Q?SL3FMI0QVl6HNwjySHlqljBowH700qWezQ7QzULob1s+A8O7ipjC+Bc9S0?=
 =?iso-8859-1?Q?DLF3xRorhCemZNJMeDaIdSKQA/7jv5CDnFl4e1nd+uvoXj0VAF+58jj7lp?=
 =?iso-8859-1?Q?iXxEzzuheIw/OyPMtKCRbHd02LylfLCJoo1DI6qRrmKq1fMvH8628QM7yk?=
 =?iso-8859-1?Q?5k+C72YDQ6BkbXZtCjlA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KmPeDqvhmX4BXMw6rbIFFbpGsYxo2NW9Vu8DGspTIm0Q6tD9hyCmpSJsYw?=
 =?iso-8859-1?Q?CNnaZkYhyrlS6mcVZmYl9PWbGlN4pQ4gfBZgt7wWXNq/BeelWTraerPgOj?=
 =?iso-8859-1?Q?h6td3/Mv3JNwQyj/DPq+Xa+W1lrSmpy6sm3arH4ceqmou6gz+7agz2NXzc?=
 =?iso-8859-1?Q?rNt6eegAOz5dfOG2JoXDhwHNKRo/D8LVRNf6NQfRdmHVzNrbQ4DNdVGuE7?=
 =?iso-8859-1?Q?LzWw78A8SwPmyrtPlUwMM1x5gEseql9rNcHSDn8aHXsTWeV+XHXMbjOYVs?=
 =?iso-8859-1?Q?RZkNgqYtCTunvbO9FEIWmxEX/1ooJKBUNEwcfPjIHNFRnuuQfqz7a8vXWI?=
 =?iso-8859-1?Q?NpzzMRBGLO4XBTIUZj7alB/Y1kkQrwYj0B79UYLBprSy0cJpoxgLkY3xZk?=
 =?iso-8859-1?Q?nmAwARVlQNquoe2Szlyg1lOi3gxyrN7Ca6eA05T9s2Mnw9Yd7IjsmzENnd?=
 =?iso-8859-1?Q?Qa3dMYWxPUFXRo54loqa7Mvq4ftY4Ubd6PYhylJaSewbmxSuSpxC4Ce3a0?=
 =?iso-8859-1?Q?to0H73o4BhcehUsVWcnF9woPacukm6sPNdLNJuNLk+q6BZRQZcRTwaoXvA?=
 =?iso-8859-1?Q?+NVQVAEBjVWs30s6UTXl+HBGfs4Iuy9dRdfqBgL7tlBWcOtbJ0j64TC3R2?=
 =?iso-8859-1?Q?E/dqVE1pzeD/4AzU2bhn+2tFKtDgzSlK6OavDtHpa8qzhQwORZZ7PSLGQz?=
 =?iso-8859-1?Q?/ULKBhHTQFGC0OUJa3BeRlbrDqcXms+sv+GHpdoNRZwHmFXjdTlQxA5dIW?=
 =?iso-8859-1?Q?9yubYZmTlcZGClvKqWvyX498sGvbmyoEcPDw1gKXTK93GHzFgaFhk5ANBt?=
 =?iso-8859-1?Q?OenJVAz2Qy41b8NZ8IZPH0e1uRGMHXw84SfTFScNvHOxMnBRHR9SaLKtvb?=
 =?iso-8859-1?Q?1GuGL5PQ7PpRiMaloqVIW2DImonVU89vQiPJ/zf7WCbKbZ/uQWFjgg2moo?=
 =?iso-8859-1?Q?BQCel/ZAjg8UjLDhM2RZEhARjUoTNdMeEzh3korVsKBkGN6ZGSEczo6g2Q?=
 =?iso-8859-1?Q?GNL6OIPbtC5StGLEvkc4Jr/qhMRPXdjObvrEnoQrlT5cw5eg79SrZOFthZ?=
 =?iso-8859-1?Q?WSIfAjLF0a4XkTmOx5OtXIkFODY595/5G89sbaUnr2YNggmzadV5ZipYGi?=
 =?iso-8859-1?Q?I0FtXrUlemN5iQZFVEOYfntlp4G7wZGe6FU2BDROjXsE4fxjBgtERjq5Hn?=
 =?iso-8859-1?Q?mr7r7WoSZ4PrzbiJjWsHLZBvlUzYu9nzVSsJUiWMhURnISU/QHx5/C34SR?=
 =?iso-8859-1?Q?p2rDvoa9XPQ9xhfRvVaEJKxGM7Mm/D/JFIjKs8dJg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 621d4f41-2728-4ca3-b22b-08dd5884194f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2025 05:44:13.9516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB10037
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Kees Cook <kees@kernel.org> Sent: Friday, February 28, 2025 9:46 AM
>=20
> On Thu, Feb 27, 2025 at 03:15:35PM +0100, Christophe Leroy wrote:
> >
> >
> > Le 27/02/2025 =E0 15:05, Michael Kelley a =E9crit=A0:
> > > From: Christophe Leroy <christophe.leroy@csgroup.eu> Sent: Thursday, =
February 27, 2025 2:43 AM
> > > >
> > > > Le 27/02/2025 =E0 02:38, Stephen Rothwell a =E9crit=A0:
> > > > > Hi Venkat,
> > > > >
> > > > > CC Kees Cook for advice.  This is a result of the tests added in =
commit
> > > > >
> > > > >     bbeb38b8487a ("string.h: Validate memtostr*()/strtomem*() arg=
uments more carefully")
> > > > >
> > > > > from the kspp tree.
> > > > >
> > > > > I note that the comment about memtostr() says "Copy a possibly
> > > > > non-NUL-term string".
> > > >
> > > > Can you tell more about your config and your environment ?
> > > >
> > > > I just tested with ppc64_defconfig and ppc64le_defconfig, with gcc =
12.4,
> > > > gcc 13.2 and gcc 14.2 and didn't get that build error.
> > > >
> > > > Christophe
> > >
> > > FWIW, I see the same build failures related to __must_be_noncstr()
> > > when building natively on x86 and on arm64. In both cases, it's an
> > > Ubuntu 20.04 installation with gcc 9.4.0 and binutils 2.34.
> > >
> >
> > Looks like I get that problem only with GCC 8.5 and GCC 9.5.
>=20
> Okay, I've figured this out, and sent an updated patch:
> https://lore.kernel.org/lkml/20250228174130.it.875-kees@kernel.org/=20
>=20
> This matches what you found, namely:
>=20
> > I don't get it with gcc 10.3 nor 11.3 nor 12.4 nor 13.2 nor 14.2
>=20
> These have both nonstring and __builtin_has_attribute()
>=20
> > I don't get it either with gcc 5.5 or 7.5
>=20
> These have neither.
>=20
> The problem was in the span of time when nonstring got introduced, but
> __builtin_has_attribute() hadn't been yet (GCC 8 and 9). I had accounted
> for having neither, but not for missing one. :|
>=20

The new patch solves the problem I was seeing with gcc 9.4.0 on
x86 and arm64.

Thanks!

Michael

