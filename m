Return-Path: <linuxppc-dev+bounces-8244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7DAA6C99
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 10:36:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpkm81bH5z2yLB;
	Fri,  2 May 2025 18:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746174984;
	cv=pass; b=NCjg3mp6+uHcKi3gSws89iF1oq2bzc/25AxkCz0dhGcAZDbyMbCRLknDEufXBdQo7M/C91phM/WZhX1FV+p/b0mDJDOhmaTRWc7XsJSxpIw88SNiZhDbAoEbG32P3o8oF2e8co/nDQUIJx03EfxWsyKu+LiJOyIi+Xedf1zVQL7dexnjnkl6pmL4Whsz+MRJhgAcrwQSBJtHeLuUQT22l6ZxKWYgbmfKtaQlm5c7+tSoOaD+vUwuzLx9SrifgB5r1t5VxmXRMiEgpGIWdfvIChTszkiPNuCygGHobFlpvvrwyY2iEGrJaquANncdDpzOFMajUL6o6o5KDWaYQ9rzaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746174984; c=relaxed/relaxed;
	bh=p5/3rf0NioCLVghhz/EA2FPhH50Iq/GU+JyOeufehT0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gTl4jtdfimlPdKxyyHOsj/qG/ARG9n9x3TAwOckBjD5oQxt8YDppxxIB4jLg8Cf+lWfLESV8gTXzM5DFZSjY2vro0mbMOhdTCPLiFyDV4cSXEN/9VvbN+bc86h4fzt03xFJD2Hr6F8LpA56FpuC2NwtG9R7/KnKUlXaFoS+ii4NCZK0EaCisjcl/H/xTrJoKu/tBw71uaDa1pOJatwsbVUdyfbpIhdX/pPIX4KgmzAxX9yPblaEYnMujXBU89hUFhlpY2lG0uQhZ3872lly/8glQq0YltQIf1LoEOEkCyUYc0MTRb3xKu87ZzarZi8owEoL/SZ6FGMtGAuKITgqciA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=hitachienergy.com; dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=yrR29TYk; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=tomas.alvarez-vanoli@hitachienergy.com; receiver=lists.ozlabs.org) smtp.mailfrom=hitachienergy.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=hitachienergy.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=yrR29TYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hitachienergy.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=tomas.alvarez-vanoli@hitachienergy.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zpkm63gwLz2yKr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:36:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXcNIX2/IqnKHIXZ9sH9KwV2v4Ukz3A6vscoR4QbNEAZoee4Uo00T04aPIMaRLE2u8btl0fkvvLG75l7kBL+N6BTJiMNlR/Nm93DbkdN+JC7iQRHqx1daJOo+2vzML+uuXz/xO9sTNDgJrFtEViu1CST1sSCPLPkPaOjKBoqhLlgIMrMfaDa/abEPyir1h5CYHue7RWbANXbfRgvYi6ewTwd8sftStevP4guleQg150nh0sISTccfKh6MW5c1Mxp1kycU19eWif3e3odY6pljmn5OS3lIRSh7CDwKJjVGdkpo0hciEK561TVETq37+JXe3v8E7HyDp2Sw3m9+F9ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5/3rf0NioCLVghhz/EA2FPhH50Iq/GU+JyOeufehT0=;
 b=rl/uLcbQ8doQs67pThmmypGL2frreMvC1XJPmxBbH6AlN4IcHVKe3/Vo8V0gpHrZbafbQWww3SWKOe3jj5JnI8SV28ErzsED6nXzZhiAk70xcHYNbltMy6RUcVPuInjhdHz7I9bh9oCHWO1znln+1Xq6MDquU021ebweNYi+LJpkYEZmd48u3EL1EYxZTwvuCM6/Qmgva4ORgWgtFrJzoHoPpAcm3/anuktp42QcxdymR2kXvr7qMACNKBmNa704BrEQPpZHd2VipUo6RNOSTfdxjGjDN0+R+ySE9x/fzy8zAMQPSubcE6vj7rAx/bhBxiquywGQVgLkfHadnyGnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5/3rf0NioCLVghhz/EA2FPhH50Iq/GU+JyOeufehT0=;
 b=yrR29TYkFTfgUEbB2WpGkb8B5W7o8s6YLmniR5kWuZnyiK9nAyk8eKSla+C3OohPJ3JXIEGhFQprACveRoYbgAfT2RQaiYTWl6Ydl12scejUyCGlViQ0j4nBDZymmJDNmGIHeHLFl0wwcXaIDD92yZFk4lmCEeH9pXJcGwoY2WcI5YkHszKaxJ5wubyAO8XC9zmErXgjFQqudByg/zEsRONwsSAKphqBB4nTXPP/vYXzoGnxRMsQ2uPP9KLH5mZ7/+LOTGIeyOse8r0dscUliWrraXDfabOp9Sc1iDRlGGWM1n5zYxaVXJoLt8e3So1DuZ5popRE0dj7kTfNp63QAg==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by AS1PR06MB8539.eurprd06.prod.outlook.com (2603:10a6:20b:4dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 08:35:57 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::b9c2:ace6:6179:45d]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::b9c2:ace6:6179:45d%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 08:35:56 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: segmentation fault when stepping multi-threaded application
Thread-Topic: segmentation fault when stepping multi-threaded application
Thread-Index: Adu4Ll9wBWFRSggERdine9fbQKY53ABoDtqAAAC267AAC31DgABPbFrQ
Date: Fri, 2 May 2025 08:35:56 +0000
Message-ID:
 <DB9PR06MB7849EA44280A99C9AABF959FC28D2@DB9PR06MB7849.eurprd06.prod.outlook.com>
References:
 <DB9PR06MB7849819F8C6A43108E66C610C2812@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d8911b8a-94a4-4ede-8e58-8de3afeccf3f@csgroup.eu>
 <DB9PR06MB78494431B8D974B1BF69A077C2832@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <222574fc-42b2-4925-8ce5-f60e926f7d0c@csgroup.eu>
In-Reply-To: <222574fc-42b2-4925-8ce5-f60e926f7d0c@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.21.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|AS1PR06MB8539:EE_
x-ms-office365-filtering-correlation-id: b0713401-f0ba-4cd8-ff40-08dd89545bdf
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elVWUE9zQzYrNWNVMXY4NFBuVUd4RUZ4ZGtabUJaeUREd2dtcE5OK3ZIMmpQ?=
 =?utf-8?B?RUsweEE5NW5sU3VydmhEZnlac0EvSzBoWlN6Z2ptVDVaclJkYXFDUlNhRWJr?=
 =?utf-8?B?aGhZZU1RcjQ4WCtDQUE2TjJ6TlAyS3lvSVF2SHBsalM1ai9HcDhMQlByZkR1?=
 =?utf-8?B?SUtJbFh3YmNUeDRTekQrbGVEdUExT015NFRWbmt5WG1hbW95dys5b0lrZCta?=
 =?utf-8?B?Z2hQbE1xQjdWOXExdkxoK2dua0xkUmlaMTJyeTVoWHNVTTZKUjR6Q2pvRVR3?=
 =?utf-8?B?L0hEZnExdjlJL2pJL2tVNlN1TGpkOGs0QUJtZTNHNWRnaFJscGMrRnFFQ3ps?=
 =?utf-8?B?dTVHaTM1OTFuMVpHYUJ2UmRidVB6QUFINGhENmRxVWVMdTNONFQwajF4Y1dT?=
 =?utf-8?B?RXZUZlNyOEpJbnZkL09UY1o5RVd1UjVaR25FV01hLzM0QThLc0xWY0lVbzdu?=
 =?utf-8?B?T2RoNklHRldLQktSdWkvMENON1NCcThHSHZHNUtIcEt5ZmFOd1pEMUVhTU8r?=
 =?utf-8?B?aGxZQnE0T1ptOTh3cER6cFN4WlRUdnVxclhaQlQrRVY3SlJQemw1N2hvUUJi?=
 =?utf-8?B?RFh2MFExd1RpMTF3NGlFa1kzMER2blFodFpyYWVuc0ZmWWswV1ZVWXJBWDhR?=
 =?utf-8?B?bDJ2SDdzZVZOK2ZNVkhVU2d4UDUwbUxqVG5TV1dSQi9TbEllRzdZSWpMTWp1?=
 =?utf-8?B?RTFpZWpXbFpSRFBhd0c1SURVcm9xQnF6ZUxINmdSTjkraUw1ZEdVOTNLUUtn?=
 =?utf-8?B?TlFhMjRETjAxdHRwb1JqRlkrUmJLSTZBMVZjVDZQZnlLNGZweGY3aUJ5Ym9I?=
 =?utf-8?B?ejloc2gzK05ETDgwcnVxUG83QzFFMDNiMkZ6SnhzbjBFTkgwUVRGRUNKWW5R?=
 =?utf-8?B?dDJPNUdmV1BPZkhNV3BrVk9zWGlSMGVjTzVaaFkya2lpQWRvSUFjb3dkMFdo?=
 =?utf-8?B?by9SNGlDZlNiOHA1MnF2dzNodHA2djdYamxvdkpGZmpRN09FbzAxSTluZjBS?=
 =?utf-8?B?MDBpR01VTlVGZXFqRGttdmRxb1A2eHFsQS96cVFQY0xISzhPM1VyOEkxUDZV?=
 =?utf-8?B?QXIvZUV3UzRZQXhOaWpqQzJWZkdWM1B2NndNZDk4b0hTRzNRMFozMVQxYzZl?=
 =?utf-8?B?UE5rNzNpcHNRYllLRDgwdjF1RzNQZzVuN2IybWttVFZucExYaTUzUnBtS3k4?=
 =?utf-8?B?Y1k5VVFoQkNscTVacjg2dUV6cXBoQmtoNWdqT2VKMFloOHpnTCtuTzZNYndX?=
 =?utf-8?B?OEE5V1c3N1RaTUNLWkFWME1JZWtDOTJDTDBZVVgwVHBRa0hhNzZOQklVQjU5?=
 =?utf-8?B?bjFnRlRDS244Z1RyQjBWS3RzWEZVb3VJMm1MaDdRdHMvdm5YSGNwd0RUdkJK?=
 =?utf-8?B?OW16S2RsWDgvREt5WHRKZFdNU3pVMTU5RlQ2M1B4dUdvcHpaUFZDSW5sMVNL?=
 =?utf-8?B?OG5RVmJFRmNvV1BXM3lZZ0FzZEg4WE1lWkJxbVlaK083NVR5Z1ZkblB3K3hn?=
 =?utf-8?B?bVQ3NDB5dVNtaVZnNUhma2RZdEp4ZXBxTDd1ZGphMmdCdHhSVC9EbUJYZytH?=
 =?utf-8?B?V2R0RUxUR0QydkJkbzQvR2l0WDlvcVpxTkxsU1M2NjMwUXIyVXk2MlRuNFcw?=
 =?utf-8?B?TVNsR1p3dzg1WHZ4bjE2WWZ0QURzR1diZUV1NVFXbWtRTGJHUGRYc20zd1dz?=
 =?utf-8?B?b0xDR1Exb1VlbE9JblFGWm9LQXliZWI5eEZuaWZnT1BBZ3piSXdKdFVlR0Vz?=
 =?utf-8?B?K1AyekozUzZFQ1pzZUtxU1J5ODVXL01maGFxQ1pOdnpGbDFFT1BKVGNHMXp1?=
 =?utf-8?B?c21hb1dpNVUvaGdJaDQ5bDVrT25TbGdJSHVQTVVJZEk4Sm43SCtTZ24raDVp?=
 =?utf-8?B?UWU3cUQ0NG13NUFSWVpldGc3aTBHcW52NWpiMjBZeGRtVERNSWdYM0RSYzlz?=
 =?utf-8?B?Q1FvWDV0dnhGNHBSazVZbU9QWWtyMWs5SGJSRUpSbUFQL3JiaVAzK3dMWjAx?=
 =?utf-8?B?aGQ5aS81Y1l3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnNCWDJPeGxDOGluNVZZWWhaUG1PNGhIWVZObXIxdHh6Y2xPV0QyVmg5UFE2?=
 =?utf-8?B?d1lhYlBWbXh4U0l1bm1BcWsvL01peTJ1bG4xbC81eHo5dFNWaHpHODNuazMz?=
 =?utf-8?B?NUZCZWtmdXh6NVI0blMyTVA4Z0dpNEd6NkRRTU9pbDVObmova3RtbE5Tc3FV?=
 =?utf-8?B?Z01PVUxRVHJXckNiWnJib011QjBWR2RnelptWG9qQWpSN0NvNGltckpmOHln?=
 =?utf-8?B?YzdJWXBDbTF2N2c3a3hGNExRWmRVZmxqQnU0OEk2dkp6eTc2VUR2d2NmOE1h?=
 =?utf-8?B?MFBiVXgzcExxMGxsRC9OTk9pQnhSV2FxanRYZmdQNUIwbDdWNWJjemJwejYw?=
 =?utf-8?B?alZlZURyQ0ZYMU9iVkZucXl2bmNCN3QrOHRVaUpQNEZrdkE1NFNEeGhpTjkv?=
 =?utf-8?B?bDNYSnpteVEvTmwrNW4rNkxZVFpKUkhwanE3eFdPdVlJTTdXL0lWb1VBK1Nl?=
 =?utf-8?B?U2JZWDl0Z1FnOU8yZ3N5YVdmZC9LUWtqcW5icEpkcXptWTBmcnpRRndrL1VJ?=
 =?utf-8?B?US9jMlpYNXduS0t1SExBOU5GYU10TWZ2WWdpWHVMYjhhUXIrdnpwMk9jUW5U?=
 =?utf-8?B?a0V2SEFndlp5VHZLVzNSQVhhdlJvTDdFYjUyeS9wSUljeHNidzk0WTRtVVpR?=
 =?utf-8?B?Wjg2NUc4RytoNnhsdVdPS1huTWgwNEZPR01yQjBTL1lWYW9UL1VJZ1p1d0Jn?=
 =?utf-8?B?T0o4N0RkbUJMZTNOeHg2QjhEa3Nnb1FrekRTV01Ea2ppSllYNys4NlVvMkVL?=
 =?utf-8?B?VXlKdkQ4N0pmQ242NUltbnBDV2EyY2JuOU8wcWdUNGwxQWdBaTNIM291MCsr?=
 =?utf-8?B?M1F1YS94OXl3KytzRTRJTTFZM04rbEZPUFRGdmd1ZUVucXZhQWVrS1Q1ZzM5?=
 =?utf-8?B?TFVUUUExdjllSTZPQTU2SGw5VmovbjRkcDI0NDVqcXZCMUVjOVNqQU5CWXFy?=
 =?utf-8?B?bUlUMXJCVTFZN0dOYWJJKzA2K2tVSG82WTloTEVqZGY3THg4ZlVsYVBoRUxs?=
 =?utf-8?B?aHhKek9IVmZoSW1VVzBjMkc0ZGYzemZXQ2RTZlphVUdlQVU0Tk9NYWFLelNn?=
 =?utf-8?B?czBPa0YwR0p0cW1MVVhlZzZqUkM2QmJsOFFwd3E0dm92YnVWclVhZ0RPSFM3?=
 =?utf-8?B?b2lERXRlOXdjRlZGT3drWHZENzlhdGI4S1YweWdsVXdOTnVkbjZ0Z054dkQv?=
 =?utf-8?B?bEVwcCtVWXNxdUlsTEFIVXBhUWZhZXRHTnZMNDdsWEVOWk0yT2pGV1RjMVdS?=
 =?utf-8?B?WTJieHZ1NEo3Qy8xNUVTcWEvS0tRa3FZaDZjcXV6ZWNBNERISGRqTG5ibytW?=
 =?utf-8?B?cnBrR2x2alM0TkRtRUJ2Q25TYi95N0ZDNitvT0pnQzUxY1JzYzJxTkJJVDUw?=
 =?utf-8?B?d0o2cGFMUERsMmxQSFpKODkzNThBS1ptWEFtQldmYXp0clpPdHAyaTBOcm5n?=
 =?utf-8?B?UnpTYTYwa1dYTFFnbThFbUp6UjQ2N3lKZWNIWXFrS1ArbkZqZUxSKzJYdnFT?=
 =?utf-8?B?S3B4Y0RzNGt4VFpOQ2J4bndIVTVZQ3hJRVppM3NKQVlZbjNtQ1FROUIweGJZ?=
 =?utf-8?B?YnpqMkpLM0hVRnM1MDZleWxPV1o0ZCtHbHpHQWYxZTR0K0J2YkN0SjR3SFNm?=
 =?utf-8?B?bVV2UXFnMitqN1daekl4c0pwMXIvMFNGZW5pdWJVV2Q5ZDMvWERXd1loWDFv?=
 =?utf-8?B?L2tPV2w0SG93ZGJjejRwRWErajh2WUUya0x6ajcya1dDckpUZmVFVzZhVFdj?=
 =?utf-8?B?U0c4NVp3NklwdGphNytKRHcrUC92bStuRFBBczh6cTdpSllzR2FQUE1DWDN6?=
 =?utf-8?B?bW16S0UyNmsyNWxEeU9pemlDZk5MTU5XdkZpQ3BCYlErTzJleWdQTVZsakdp?=
 =?utf-8?B?cWlFbkVHUkJ3NEZ3WlMvS2V2ek9vWWp4WTJNeUt3bnRrczRQb25SRXd4TG1P?=
 =?utf-8?B?Y1U2RnQwODFmekoxd0VVQjdWWTZqbFN0N2pBZGZoZlJ6NVdxTWNvZUhNMGVq?=
 =?utf-8?B?aURzWUhCaVZTc3JuNGl3VUVvcWpCZlRMZ043VHd4cUFJZ3FYaSswQWx6cDFR?=
 =?utf-8?B?M0hOUUpwa2JxanJwczhVZDluNlh6SnlyVlNpNFJYUnlla05nL2l2dmhjaitr?=
 =?utf-8?B?RmhvdGZVOTFpVkxvV0pwWFhCQ25PRnU1MTJpdlBtNFUwVVJ6aGs1UmQ5c2Nk?=
 =?utf-8?Q?iHhTy96MMj3k6gNTxzBG57U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0713401-f0ba-4cd8-ff40-08dd89545bdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 08:35:56.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOILJH9YczZiy6RX4RUIZ6K0d74ruHhFKHJX07JZhNxGu8yy3seFOmIOiUgVKr4uf9BHala2CD8C/pJIyV+9gzmy/McWqNZFakMrvsAm7bNt0w7P9vBbxipIfcICP5Pi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR06MB8539
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQoNCj4gSXMgaXQgb25seSB3aGVuIHVzaW5nIGdkYnNlcnZlciwgb3IgZG9lcyBpdCBhbHNvIGhh
cHBlbiB3aGVuIHVzaW5nIGdkYiBkaXJlY3RseSBvbiB0aGUgYm9hcmQgPw0KDQpJdCBhbHNvIGhh
cHBlbnMgd2hlbiB1c2luZyBnZGIgZGlyZWN0bHkgb24gdGhlIGJvYXJkLiBIYWRuJ3QgdGVzdGVk
IGl0IGJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZSBnZGIgaW4gdGhlIHRhcmdldCwgYnV0IEkgaW5jbHVk
ZWQgaXQgYW5kIHRoaXMgaXMgdGhlIHJlc3VsdDoNCg0KKGdkYikgYnJlYWsgLi4vc3lzZGVwcy9w
b3dlcnBjL3Bvd2VycGMzMi9kbC1zdGFydC5TOjMyDQp3YXJuaW5nOiBjb3VsZCBub3QgY29udmVy
dCAnLi4vc3lzZGVwcy9wb3dlcnBjL3Bvd2VycGMzMi9kbC1zdGFydC5TJyBmcm9tIHRoZSBob3N0
IGVuY29kaW5nIChBTlNJX1gzLjQtMTk2OCkgdG8gVVRGLTMyLg0KVGhpcyBub3JtYWxseSBzaG91
bGQgbm90IGhhcHBlbiwgcGxlYXNlIGZpbGUgYSBidWcgcmVwb3J0Lg0KTm8gc291cmNlIGZpbGUg
bmFtZWQgLi4vc3lzZGVwcy9wb3dlcnBjL3Bvd2VycGMzMi9kbC1zdGFydC5TLg0KTWFrZSBicmVh
a3BvaW50IHBlbmRpbmcgb24gZnV0dXJlIHNoYXJlZCBsaWJyYXJ5IGxvYWQ/ICh5IG9yIFtuXSkg
eQ0KQnJlYWtwb2ludCAxICguLi9zeXNkZXBzL3Bvd2VycGMvcG93ZXJwYzMyL2RsLXN0YXJ0LlM6
MzIpIHBlbmRpbmcuDQooZ2RiKSBydW4NClN0YXJ0aW5nIHByb2dyYW06IC9ob21lL3Jvb3QvdG9t
Y2xpIA0KDQpCcmVha3BvaW50IDEsIF9zdGFydCAoKSBhdCAuLi9zeXNkZXBzL3Bvd2VycGMvcG93
ZXJwYzMyL2RsLXN0YXJ0LlM6MzINCndhcm5pbmc6IDMyICAgICAuLi9zeXNkZXBzL3Bvd2VycGMv
cG93ZXJwYzMyL2RsLXN0YXJ0LlM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCihnZGIpIHMN
CjM1ICAgICAgaW4gLi4vc3lzZGVwcy9wb3dlcnBjL3Bvd2VycGMzMi9kbC1zdGFydC5TDQooZ2Ri
KSBzDQozNiAgICAgIGluIC4uL3N5c2RlcHMvcG93ZXJwYy9wb3dlcnBjMzIvZGwtc3RhcnQuUw0K
KGdkYikgcw0KX3N0YXJ0ICgpIGF0IC4uL3N5c2RlcHMvcG93ZXJwYy9wb3dlcnBjMzIvZGwtc3Rh
cnQuUzo0MA0KNDAgICAgICBpbiAuLi9zeXNkZXBzL3Bvd2VycGMvcG93ZXJwYzMyL2RsLXN0YXJ0
LlMNCihnZGIpIHMNCjQxICAgICAgaW4gLi4vc3lzZGVwcy9wb3dlcnBjL3Bvd2VycGMzMi9kbC1z
dGFydC5TDQooZ2RiKSBzDQpfZGxfc3RhcnQgKGFyZz0weGJmZmZmZDgwKSBhdCBydGxkLmM6NTM2
DQp3YXJuaW5nOiA1MzYgICAgcnRsZC5jOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQooZ2Ri
KSBzDQo1MzggICAgIGluIHJ0bGQuYw0KKGdkYikgYw0KQ29udGludWluZy4NCnRvbWNsaVsxNTNd
OiBVc2VyIGFjY2VzcyBvZiBrZXJuZWwgYWRkcmVzcyAoZGZmY2ZmMTApIC0gZXhwbG9pdCBhdHRl
bXB0PyAodWlkOiAwKQ0KDQpQcm9ncmFtIHJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLCBTZWdtZW50
YXRpb24gZmF1bHQuDQoweGI3ZmU1ZGQ4IGluIF9kbF9zeXNkZXBfcGFyc2VfYXJndW1lbnRzIChh
cmdzPTB4YmZmZmY5ZjgsIA0KICAgIHN0YXJ0X2FyZ3B0cj0weGRmZmNmZjEwKQ0KICAgIGF0IC91
c3Ivc3JjL2RlYnVnL2dsaWJjLzIuMzkrZ2l0L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2RsLXN5
c2RlcC5jOjgwDQp3YXJuaW5nOiA4MCAgICAgL3Vzci9zcmMvZGVidWcvZ2xpYmMvMi4zOStnaXQv
c3lzZGVwcy91bml4L3N5c3YvbGludXgvZGwtc3lzZGVwLmM6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkNCihnZGIpIGJ0DQojMCAgMHhiN2ZlNWRkOCBpbiBfZGxfc3lzZGVwX3BhcnNlX2FyZ3Vt
ZW50cyAoYXJncz0weGJmZmZmOWY4LCANCiAgICBzdGFydF9hcmdwdHI9MHhkZmZjZmYxMCkNCiAg
ICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8yLjM5K2dpdC9zeXNkZXBzL3VuaXgvc3lzdi9saW51
eC9kbC1zeXNkZXAuYzo4MA0KIzEgIF9kbF9zeXNkZXBfc3RhcnQgKHN0YXJ0X2FyZ3B0cj1zdGFy
dF9hcmdwdHJAZW50cnk9MHhkZmZjZmYxMCwgDQogICAgZGxfbWFpbj0weGI3ZmU3ZjcwIDxkbF9t
YWluPikNCiAgICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8yLjM5K2dpdC9zeXNkZXBzL3VuaXgv
c3lzdi9saW51eC9kbC1zeXNkZXAuYzoxMDcNCiMyICAweGI3ZmU3MDVjIGluIF9kbF9zdGFydF9m
aW5hbCAoYXJnPWFyZ0BlbnRyeT0weGRmZmNmZjEwLCANCiAgICBpbmZvPWluZm9AZW50cnk9MHhi
ZmZmZmE5MCkgYXQgcnRsZC5jOjQ5NA0KIzMgIDB4YjdmZTc3MjQgaW4gX2RsX3N0YXJ0IChhcmc9
MHhkZmZjZmYxMCkgYXQgcnRsZC5jOjU4Mw0KIzQgIDB4YjdmZWMyNDAgaW4gX3N0YXJ0ICgpIGF0
IC4uL3N5c2RlcHMvcG93ZXJwYy9wb3dlcnBjMzIvZGwtc3RhcnQuUzo0MQ0KKGdkYikNCg0KVG9t
YXMgQWx2YXJleiBWYW5vbGkNClImRCBFbWJlZGRlZCBTb2Z0d2FyZSBEZXZlbG9wZXINCg==

