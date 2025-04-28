Return-Path: <linuxppc-dev+bounces-8098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED8A9EF9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 13:49:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmMDT3LJqz2yrl;
	Mon, 28 Apr 2025 21:49:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745839013;
	cv=pass; b=UmYYlT/w4RsrotIbA4xbAspf/mx9cExpAPqmWOE+HoYC7G172J6R3ZkL6By2jeLSmSMYR+JDoTlCLl6bD3fsXDzI5184JxioUBvIXJpiafrKLLzDmNUe03GX+Wh0FP7mfN6SWeyeXKfuhi6i85SfVJX+Ti9cSow11Mrr7kMWzQrTdwsuTwm24xThmT7gofOmrMqiKJvaMe5JEsCuPi7UWKpqpTTsURm+MOGpSqSmGYE2TytlMIjNIK2SZZlVU6PbB7kOAHtAA0BqaF2+dBAxLOISuzXhZK5v69/zzot+7xsqsiaJqi73S2aJMQ9TnXt0OXYU68M7zuvVsxs2dv2AsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745839013; c=relaxed/relaxed;
	bh=wpAZMNaNs0jt9lObf+1omVws2WVneiqDW+F+h8u9HL0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XijgzSl68Gc9lDPErZNW2gxJrTjGhjzbDpu2nKQHalt+TmF5HTIVXb+pZ7T9rornI/07zTgFCcD6gOfOqHffSVykynPGxicZcpfCyDhdJD3QWcLmpaBstzWcF37q+GUhkN5omwWIrvEJNYCWdL1Xsq0xw0rFL8fHvZs3O2LiTpG+jQVXY0M3tmMFOSpdm6CWO0YAGrreRFxzSAKVC2pdfIBEx3buuyO2f6yxrcaJc5Bm80eRNfqmn+pm69/VprB9yELygEsFH0oXIOe8Kpv8moxXz6TOQpMhv+gtTTR8qgm8s8MK6H/Nu/5azZf4KLqIJkMxERXPqj8NJgVhjz/F9Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=hitachienergy.com; dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=l1yZalql; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=tomas.alvarez-vanoli@hitachienergy.com; receiver=lists.ozlabs.org) smtp.mailfrom=hitachienergy.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=hitachienergy.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hitachienergy.com header.i=@hitachienergy.com header.a=rsa-sha256 header.s=selector1 header.b=l1yZalql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hitachienergy.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=tomas.alvarez-vanoli@hitachienergy.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmLW74dKQz2xd5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 21:16:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOxiBmsNgaci8nO0Yv6qeCyOf8g7Hrgwuj7ouYeUDL9I0CoSt6E7Ee4KWeIZLaXL87lCglZZ0DNSe7fnLtnUiZ+ukZm/r1ex7nQg6G3UAHRWbIolQ0BarTyckPvhLpnDHAFN8BaoK9m3xRWaXqL+OdN3ldDnFHM2MZdPobrBd1UN+1ySQ1AMj4s1cgYFW0IHb9Nlh1JmYXGowzRfVKoeXXZkYcReVhHnv9/QGE5c9TXC/wM4thtZ6OKXtDPNmPWZ248Pzw525ynGXonbPtfhzy1GkOADf9jneeO8dLDEyPDVnOHV6V/27w5VfhC6gbxdn+wz7uHker7K4/4DATn1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpAZMNaNs0jt9lObf+1omVws2WVneiqDW+F+h8u9HL0=;
 b=rr1MVyXXEYfoxohTkecTVysbyob43DNQJIpH2OZuzXgUK1g4AL6jSkviCab1UScwQ38q5eXJNJL+YnGQPnRhlgubPrsAgpNVDQRS8/b6b/o6IPQ4jLHqlo9Yn3D1TEYsJkmxZQTLv/UgO8jOjklkBtvx3fO8WU0F2IidMPaPO4SZlgSugwk5q5EgIdfaH+O5MBNrMIU03XUf8wUEeYyzVF1IGEG9dneoPAYYdZ3Sv1UAJjIzU1ANEa2IP1R4hGv8x1YYchQxNSshFVB4Ii8sj4kGU3PamJXTjlxo+80zHIfHiLMspy6PPpnIq3dzsNc7dmImXMZqbst7kFVBzOmjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpAZMNaNs0jt9lObf+1omVws2WVneiqDW+F+h8u9HL0=;
 b=l1yZalqlGBuOuKCF13NTVPUk4OARPyuxCT5k1Wxh+gGG7uCx88V1ROTbGn0gm3tQPovTAznK7HR1Y1PsJEIE+E0fCRZyDnnVSWk4FlFsxbjIOW0yW+b7wM7PwmcZgWOkDuoolVYnnVuyfTO0ZhBsFAO52IFleYhAXEsORsOJGN9h2AiYguBTm1AdAYln+P4eJQ+IqkcYPzNabnvaT0Lc665zbZvksIxsaU7YZPrMIWw23SkewcyDqeC2+zTstv9nWVSIEELY9q5lfDYc6/rbM+4DhH7OhtX2TNJXYd3tG2lRaXZQqyHPzWYvBGxAiRuG9RejUCRq1voqxUcuMT+72Q==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by AM9PR06MB8231.eurprd06.prod.outlook.com (2603:10a6:20b:412::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 11:16:28 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::b9c2:ace6:6179:45d]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::b9c2:ace6:6179:45d%3]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 11:16:28 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: segmentation fault when stepping multi-threaded application
Thread-Topic: segmentation fault when stepping multi-threaded application
Thread-Index: Adu4Ll9wBWFRSggERdine9fbQKY53A==
Date: Mon, 28 Apr 2025 11:16:28 +0000
Message-ID:
 <DB9PR06MB7849819F8C6A43108E66C610C2812@DB9PR06MB7849.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.21.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|AM9PR06MB8231:EE_
x-ms-office365-filtering-correlation-id: 036df2ff-fa7b-4569-aabc-08dd86461f54
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1VrTkg3ZFYzNVZVZU9HcmVjeFl2QlhicVd1bU5hYkhzMzcvK2t5Znd5c0NT?=
 =?utf-8?B?L2p2V2lZTUxMM0J3NW9HQXpydHpFUUU2Skc5bWplMDRaVElIV0wvN2dncHU0?=
 =?utf-8?B?cDFMMUJXNzdieEd3WU9mUmt0UFBoRGpRaDBzOW5yUTlsd1RYdi82TWE0MmxI?=
 =?utf-8?B?T3pyTkpsOFVKZHh1OWRyYSs4cmV2SGdnY1dBNW5YVE9TVHg5UzIyWEF5KzJO?=
 =?utf-8?B?VW1uMFFhbXpEc0phMWMySUNuMDAxZFNwcTVwMjlsMmg4VFREbG5xZFhVQ3Ra?=
 =?utf-8?B?VG5kTUg5cDduY3V0QVEvZ2JzNDR4bndJV3dHU1I5L2FFZHVYT2twaGxoYWlJ?=
 =?utf-8?B?eGRZVFFoVXlwbW54ajdXQ0RNTThqUFQwOHJZa0lEYVJ2ZHNvVlBaV1phMDk3?=
 =?utf-8?B?L2l0NHhDR09LeFBVTFAvTzBzbjdlVE02dzVLSm1EblBKMWMvNnhGWUFrcU82?=
 =?utf-8?B?VGc3ZENQa09Cc0t2VHZuMFJRVnhDbWJXbkg5b2dUUjRCWWlsVkRqUisyU0dB?=
 =?utf-8?B?UG1YR3JER0VsMDZHREVRQTJ3UmFrU2gyN25YZTcxa3J0ZkRSZkRDZFh2dE5l?=
 =?utf-8?B?akVoYmdPTThtZWpmTDI0Njl5ZThVN0I4R09uUjNXa0MxdWxtUVMxblYwQ083?=
 =?utf-8?B?TTVTS3VqcUhoQWRvaGRjTjNpTTZ4c2FGdHROZjhqa2RNa0N0djA0WVc3Tmg1?=
 =?utf-8?B?cWhkZEJHYmNaVzFTZ25nbjl0aDJBSXV1dERPazJtTDZMOWFZeTFCTUNGR3Nw?=
 =?utf-8?B?VFY4eWt2ajN6eFV4bS9kSkxzYTdsY0lXMGlqby84U3d5eHVxdU13THU3ZE5i?=
 =?utf-8?B?YXN6QzI1Yy96bVRYaUtQUU9rdFI4OWdBbjhKdG1SOVNia1BlOWh0aGFUbDJQ?=
 =?utf-8?B?WElqdkJPNENja3hMM0x0Yi9LZk9XSFlRZFR2aDFnbUU5V3pLa3RKdUlsaTlO?=
 =?utf-8?B?bG45My9JOVBlOXVQR3p3T3AxaUJTalN1NXZEcEJtVkNoSlowK1k5ampsRWdx?=
 =?utf-8?B?YUZ4TlJXYmJ2YjM0YWMwQklKRmZ4bkR5c1E0RXFmeWJOZ2dSSUZNVi9KRm85?=
 =?utf-8?B?cmpvNTRQUVVyTTZkMDhPeUc4NjcyNjNhZnRZRVdLNVNaSXV0ZndqZTk3d0Z1?=
 =?utf-8?B?dDR4ZlB2SG1MaGNPM0pDSkErZ0hucmhpY3Q2U3Jrd3lKS2ZPYnZrYzlJOXNT?=
 =?utf-8?B?SGRsMU9PMGhkRGQ5RU5ENTg5VHpQaWcrLzBmWTg4ZEJuOFJmV0o5SmY3d3BP?=
 =?utf-8?B?RjcrMVFmS0JJVnhkNW5kODhpNStDbGhHTmJHM1lpMy9mYzFRQTdlaHFKNFZS?=
 =?utf-8?B?YUk0WUFnMDhHUDFlYTdjdEl6K3A2dVhOa21XWkhKUEpJdWZDcjlsMGFuY3JD?=
 =?utf-8?B?SlJzOFV0SFdiUjhhSENCeTRTczZRQTBDdzBSVG1BSTdIZjVLUTVNa3FiN0Vo?=
 =?utf-8?B?VkkyWGQ1YVc1WmNyQ1RuRzU5ODlzd0dkaUVrMkY4ajZkd1BwMTdUWEFiUmdp?=
 =?utf-8?B?aDBLQ0lib3JERjZMOWFwdUwrM0IzOEtDS1paSEVQdGdaak55dEpZNlptM3l4?=
 =?utf-8?B?WVVlNEZBMGdJYWpxUWNVYVZwbGRqY0RrWUdKWkgzRmV2RWpDOFhqaU1qbEwz?=
 =?utf-8?B?QUlyMk93SmJzSjREN3VDVDZzQ0FTWDJjU3MzQTNhNWhsdUlOeFdQQWFNVFZq?=
 =?utf-8?B?OXU1elpwYmRrbVh1ZTN2cGU5YlpMVGRPNzdweklKRncrR2JvVGp1VnFnV2wy?=
 =?utf-8?B?cVZxTEFHZVoyR1dvZ2haaWwwY1dkeTFvTXNPT0RnMGF5bWFVb0RYSjMzK2tx?=
 =?utf-8?B?cndtaFk4RENTSzQyWGZ1U2tXaFRRVjFyR3B5M1FSQVFVSm9mRDJ3UXBoOEZx?=
 =?utf-8?B?MnQ0anB5aU00aUN1ZzN6VElrRXkvRjlheXBoT0xXaE5WZndSOWNRZE5BSGtK?=
 =?utf-8?B?c055ck9oNmVoZXZaalUwdUw1QVFxbE1oM0VDdmEzbktNWi9jdTFuSkFPbXBT?=
 =?utf-8?Q?FcWmKPJhG3UsAcRW+J+4LSPGG1wPNo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFJHeEUvdDVFZmlmMXZEakNFVkZMLzJUeHRrQ3IrN2Y2M2drbnM2aTZVQTJK?=
 =?utf-8?B?dkVlS1EyYm5lLzE2TFlFbms4bjJWMnBLd2w1MWM3VGxrcE0vcXc2RXpZSVpu?=
 =?utf-8?B?Z0tPNFZVKzd1UEE3ZC8wcmF5Vm9nR2YreFh4L1RHNGpIdW5xcW13bHJlWCtY?=
 =?utf-8?B?aEpOMk1HR20zUnNCWVgwMjE4dTF0UkJjZmcyamR3NGNCZkhFVFpualRVaTFB?=
 =?utf-8?B?MWdUUi9UcVdHQ1A3TXo5UzJoT0xMVmdGTmZQbFIrMkppQ2cxNXQ0T3A1eWEz?=
 =?utf-8?B?ekZnRnBDVmRLaTdYbHNqZy85bjlXVDI3V0loNWl6aVMxK1MvdHJXNVVuYXdT?=
 =?utf-8?B?SzN3emxKWlI5V0dzZ2F4UHFpTi9MNTJwTEt4blF4dStKVmFjclB2S2JNSWln?=
 =?utf-8?B?cGJGNkI1MXA2KzVYMGFkMzUrYzNmMnd3U292UTJ3NUROano4S0Zha0xyd0xC?=
 =?utf-8?B?b1lHRUc0UUpKNmN6WnlNdXNBVkJ2VElVRUJEWUUzZTdwcVlPOW1vSDNmTkp3?=
 =?utf-8?B?YXlMMW5UT08xOTV1Y2Z0c1BleEdYTmJhYTNydXRpSG56UXJZMzdOZGZtTzU1?=
 =?utf-8?B?OEtnbGUxanRUQ0xaRzlFb053a29jRHZWUGpSREFSNjdnN00zZDQrVE1GcUdK?=
 =?utf-8?B?MWE3OWoxeWhRZG9qUnJEUXhzUTZ0QmpZVGpqVUdua3o3WkFJendyd2RtZS9s?=
 =?utf-8?B?T2dSeWVLN1IxaVJWUW4weFF5OWhFbGVaWmNyTDJ4dU9vd1oxbEJlYkh6c0tZ?=
 =?utf-8?B?WlI1UDIyK0MrbEwybjRDaEw0aFZkQnEzNUx4eDZMck5UaDhuenp2SEFTNWFz?=
 =?utf-8?B?K3NrUmcwaXVjaG1IUG93Z3NYNElUQzl0cWppWnJ2WDdvVFVqdmFSTFJ5QjJs?=
 =?utf-8?B?bUd0MWM4RXhCWHFVUG4zQXFvdnViTUNlS0Ntdks1elhjdTlPaWg5MHZ3YS9r?=
 =?utf-8?B?LzlHLytFNWg0SzFmNXJLUzdQMFpMbXJTWWlLYjVxeXRPcHRpQTV1U2hGSEdZ?=
 =?utf-8?B?RFhqb2FrWDlaM0lwYXhvRnpoeWZYUkRBeWRqRUVCemNlM1B5ZFRnSWZDdmx4?=
 =?utf-8?B?WEtpRGZnR3AwUGRhTlR5NTBhbVEzbnRFeWlDWXM0S3pDVGZFdk1xSU5neGtF?=
 =?utf-8?B?UXlZNkJ4aEtmN2RJSUJlWEsxVHRUR2M0ZkFZYm5EK2RPV0RXV0NPNkt5OEt0?=
 =?utf-8?B?L1VhQ0hLOHVPZXlvQ0RUcWxRdllKejh1cGJCNE5GRlpYTmg2YThNMUtqNDFq?=
 =?utf-8?B?MS96VUg2TlUwSnhLZ3FIanpVeVdBbVJGZndtSU5XUUhrb3pGV0pQMXhGOXU1?=
 =?utf-8?B?WnZxVTFxY3NTTTR3TVN2RU5ybjAxdHNZd3hkTnMwUUkzTnErWHJTWG1OR2Vi?=
 =?utf-8?B?T1hCRGI1MmVOTThISCtPRTNKc04va1JwWHVlNk4zVXVqemh3Q2MzNlZkSUdp?=
 =?utf-8?B?Ym1CM3pqcm9uNXhVNE82c2REZzBSRzBDazRIWUxuQnNPWHF2Z2hNTU55VE9l?=
 =?utf-8?B?S1hlR0d3WENwYVcrL3VyOXg5RVZPQ1VYQTFrUDNCbTcrWFpkL1FxWmVyRFNZ?=
 =?utf-8?B?VEY1UkNRU1FsNUh1TUhLVlVRRkEwOUFBdmw4TlRPRCt1SWVJS3RwMEd1ekhS?=
 =?utf-8?B?Qm1JSEtMQ0dRM0NlOTZ2dXl1Q0FocGVFd3FyRE5vSW8xNHdBM1hJaTNtbm03?=
 =?utf-8?B?VjlqK1FIc1I1UVFIK21aQUhVZHIzcDFqVXRwSURKa0Zra2ZmOEtrN3o1a3lT?=
 =?utf-8?B?RFhCQzMxK0pRYnhPRGoyVUx6MnZkb2EybmUrcUprUEhsV092TUVOR0pYVE9P?=
 =?utf-8?B?NHExdWlJVDZPRmxYZWkxdnFoTm9wRmR0Q0tvTmtNMFJOcWlGcnQ0TjFTdkdq?=
 =?utf-8?B?cHB5TDZ1cm9aUExmL20zaFJab1luL1VqSUJQV00zbDR3R2VJSERQSkcxME8z?=
 =?utf-8?B?dGtZbXhGNFMxZU9TdXBRcVNWQXp2dmFoTEllcGVRQkJIYjQ5MFRvdVZFNTV3?=
 =?utf-8?B?aGNSQ2FPMjBybUxPdHROTElxT3k0Ty8rNitoQWh6alRjTXdJdngrODYxV0gx?=
 =?utf-8?B?bTRzY3RPMkhvRytxRUNRQWJnWk1YeWI3MUpEdjh4Rng5TTRCVnN5S3NFSTVD?=
 =?utf-8?B?K0xLZGVwZFZMNkVwSnN6LzhqUWx1bjZGanZRd0lxWUk0d3krYzExNWJxQi9t?=
 =?utf-8?Q?JySpjXDQwv5qPR+5XB8mwu8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 036df2ff-fa7b-4569-aabc-08dd86461f54
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 11:16:28.7836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFfyh3lT9rNoR7jdH3kLIEybrnHNRvkfh1RlKfDomZOoQlE7VQdJgTW/pxF78UK0KO/uSDhmdZbu0Krq3ePnjVctzJAGupO15jvzz5jjUQXJw33HQdLd/VmpQ3d3+EkS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8231
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGVsbG8sIEkgYW0gd3JpdGluZyBiZWNhdXNlIEkgaGF2ZSBhIHNlZ21lbnRhdGlvbiBmYXVsdCB3
aGVuIHJlbW90ZS1kZWJ1Z2dpbmcgYSBQUEMgMzItYml0IHRhcmdldCB3aXRoIGdkYnNlcnZlci4N
ClRoaXMgaXMgdGhlIHNhbWUgcGxhdGZvcm0gZGVzY3JpYmVkIGluICdodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eHBwYy1kZXYvZGMzOGFmZTktNmI3OC1mM2Y1LTY2NmItOTg2OTM5ZTQwZmM2
QGtleW1pbGUuY29tLycsDQphbHRob3VnaCB0aGUgYnVnIGRvZXMgbm90IHNlZW0gdG8gYmUgdGhl
IHNhbWUgYW5kIHRoZSBwb3NpdGlvbiBvZiB0aGUgdGhyZWFkIHN0cnVjdCBkb2VzIG5vdCBhZmZl
Y3QgaXQuDQoNClRoZSBzZWdtZW50YXRpb24gZmF1bHQgbWVzc2FnZSBpcyB0aGUgZm9sbG93aW5n
Og0KDQp0b21jbGlbMTM1XTogVXNlciBhY2Nlc3Mgb2Yga2VybmVsIGFkZHJlc3MgKGRmZmJkZjEw
KSAtIGV4cGxvaXQgYXR0ZW1wdD8gKHVpZDogMCkNCg0KDQpnZGJzZXJ2ZXIgaXMgc29tZXRpbWVz
IHVucmVzcG9uc2l2ZSwgYWx0aG91Z2ggc29tZXRpbWVzIEkgYW0gYWJsZSB0byBraWxsIGl0IHdp
dGggQ1RSTCtDLg0KVGhlIGNvZGUgSSB1c2UgdG8gcmVwcm9kdWNlIHRoaXMgKHRvbWNsaSkgaXMg
dGhlIHNhbWUgYXMgbXkgY29sbGVhZ3VlIHNlbnQgYmFjayBpbiAyMDE2Og0KDQotLS0gc25pcCAt
LS0tLQ0KI2luY2x1ZGUgPHB0aHJlYWQuaD4NCiNpbmNsdWRlIDxzdGRpby5oPg0KI2luY2x1ZGUg
PHVuaXN0ZC5oPg0KDQp2b2lkICogdGhfMV9mdW5jKCkNCnsNCiAgIHdoaWxlICgxKSB7DQogICAg
IHNsZWVwKDIpOw0KICAgICBwcmludGYoIkhlbGxvIGZyb20gdGhyZWFkIGZ1bmN0aW9uIDEpXG4i
KTsNCiAgIH0NCn0NCg0KaW50IG1haW4oKSB7DQogIGludCBlcnI7DQogIHB0aHJlYWRfdCB0aF8x
LCB0aF8yLCB0aF8zOw0KDQogIGVyciA9IHB0aHJlYWRfY3JlYXRlKCZ0aF8xLCBOVUxMLCB0aF8x
X2Z1bmMsIE5VTEwpOw0KICBpZiAoZXJyICE9IDApDQogICAgcHJpbnRmKCJwdGhyZWFkX2NyZWF0
ZVxuIik7DQogIGVyciA9IHB0aHJlYWRfY3JlYXRlKCZ0aF8yLCBOVUxMLCB0aF8xX2Z1bmMsIE5V
TEwpOw0KICBpZiAoZXJyICE9IDApDQogICAgcHJpbnRmKCJwdGhyZWFkX2NyZWF0ZVxuIik7DQog
IGVyciA9IHB0aHJlYWRfY3JlYXRlKCZ0aF8zLCBOVUxMLCB0aF8xX2Z1bmMsIE5VTEwpOw0KICBp
ZiAoZXJyICE9IDApDQogICAgcHJpbnRmKCJwdGhyZWFkX2NyZWF0ZVxuIik7DQogIHdoaWxlKDEp
IHt9DQogIHJldHVybiAwOw0KfQ0KLS0tIHNuYXAgLS0tDQoNCg0KVGhpcyBjYW4gYmUgcmVwcm9k
dWNlZCBhbHdheXMgYnkgc3RhcnRpbmcgdGhlIGRlYnVnIHNlc3Npb24sIHN0ZXBwaW5nIDUgdGlt
ZXMgYW5kIHRoZW4gaXNzdWluZyBhIGNvbnRpbnVlLg0KU29tZXRpbWVzIGp1c3QgYSBjb250aW51
ZSB3aWxsIGRvLg0KVGhpcyBlcnJvciBpcyBhbHNvIGhhcHBlbmluZyBzcG9yYWRpY2FsbHkgd2hl
biBydW5uaW5nIG91ciBtYWluIGFwcGxpY2F0aW9uIHVuZGVyIGdkYnNlcnZlciwgd2UgZ2V0IGEg
c2VnbWVudGF0aW9uIGZhdWx0IGluIGRsX2ZpeHVwLg0KSXQgbmV2ZXIgaGFwcGVucyBkdXJpbmcg
bm9ybWFsIHJ1bnRpbWUuDQoNClRoZSBhZGRyZXNzIHRoYXQgdGhlIGtlcm5lbCBjb21wbGFpbnMg
YWJvdXQgaXMgY29taW5nIGZyb20gcHRfcmVncy0+Z3ByWzNdLiBUaGlzIHZhbHVlIGlzIHB1dCBp
biB0aGUgcmVnaXN0ZXIgaW4gYSBjYWxsIHRvIFBUUkFDRV9TSU5HTEVTVEVQICh2YWx1ZSA5KS4N
Cg0KSSBwb2tlZCBhcm91bmQgdGhlIHB0cmFjZSBjb2RlIGEgYml0LCBzZWVpbmcgaWYgdGhlcmUg
d2VyZSBhbnkgcG9zc2libGUgb3ZlcmZsb3dzIGJ1dCBJIGNvdWxkIG5vdCBmaW5kIGFueXRoaW5n
LCBzbyBtYXliZSBJJ20gYmFya2luZyB1cCB0aGUgd3JvbmcgdHJlZSwgYWx0aG91Z2ggaXQgZG9l
cyBzZWVtIHRvIGJlIHJlbGF0ZWQgdG8gcHRyYWNlLg0KDQpJIGFsc28gYWRkZWQgYSBkdW1wX3N0
YWNrIGJlZm9yZSB0aGUgImV4cGxvaXQgYXR0ZW1wdCIgbWVzc2FnZToNCg0KQ1BVOiAzIFBJRDog
MTM1IENvbW06IHRvbWNsaSBOb3QgdGFpbnRlZCA2LjEuMTMzLTAwNTY0LWcwYzMwMmIyNmEyYzQt
ZGlydHkgIzANCkhhcmR3YXJlIG5hbWU6IG5hbWUscHJvZG5hbWUgZTU1MDAgMHg4MDI0MTAyMSBD
b3JlTmV0IEdlbmVyaWMNCkNhbGwgVHJhY2U6DQpbYzJiZjVlOTBdIFtjMGFkZmRlOF0gZHVtcF9z
dGFja19sdmwrMHg0Yy8weDZjICh1bnJlbGlhYmxlKQ0KW2MyYmY1ZWIwXSBbYzAwMzJlYzhdIF9f
X2RvX3BhZ2VfZmF1bHQrMHgxYzgvMHg2YjANCltjMmJmNWVlMF0gW2MwMDMzNDBjXSBkb19wYWdl
X2ZhdWx0KzB4NWMvMHgxNTANCltjMmJmNWYwMF0gW2MwMDAwOTFjXSBEYXRhU3RvcmFnZSsweDE1
Yy8weDE4MA0KLS0tIGludGVycnVwdDogMzAwIGF0IDB4YjdmZTVkZDgNCk5JUDogIGI3ZmU1ZGQ4
IExSOiBiN2ZlNWQ3OCBDVFI6IGI3ZmVmYjUwDQpSRUdTOiBjMmJmNWYxMCBUUkFQOiAwMzAwICAg
Tm90IHRhaW50ZWQgICg2LjEuMTMzLTAwNTY0LWcwYzMwMmIyNmEyYzQtZGlydHkpDQpNU1I6ICAw
MDAyZDAwMiA8Q0UsRUUsUFIsTUU+ICBDUjogMjAwMDAyMDggIFhFUjogMjAwMDAwMDANCkRFQVI6
IGRmZmJkZjEwIEVTUjogMDAwMDAwMDAgDQpHUFIwMDogYjdmZTcwNWMgYmZmZmY5NDAgYzI3YzM0
ODAgZGZmYmRmMTAgYjdmZTdmNzAgMDAwMDAwMDAgYjdmZmRiZGMgYjdmY2EwMDAgDQpHUFIwODog
YjdmZmZhNzggYjdmZmRiYzggZmZmZmZmZmYgZmZmZmZmZmMgYjdmZWVkODggMDAwMDAwMDAgMDAw
MDAwMDAgMDAwMDAwMDAgDQpHUFIxNjogMDAwMGZmZjEgYmZmZmZkNDAgYjdmY2EzMzAgMDAwMDAw
MDAgMDAwMDAwMDAgMDAwMDAwMDEgYmZmZmZkNDAgMDAwMDAwMDAgDQpHUFIyNDogYmZmZmZhYjAg
YjdmZTdmNzAgYjdmZmRiYzggZGZmYmRmMTQgZGZmYmRmMTAgYjdmZmYwMTAgYjdmZmVmZjQgYmZm
ZmZhNzAgDQpOSVAgW2I3ZmU1ZGQ4XSAweGI3ZmU1ZGQ4DQpMUiBbYjdmZTVkNzhdIDB4YjdmZTVk
NzgNCi0tLSBpbnRlcnJ1cHQ6IDMwMA0KdG9tY2xpWzEzNV06IFVzZXIgYWNjZXNzIG9mIGtlcm5l
bCBhZGRyZXNzIChkZmZiZGYxMCkgLSBleHBsb2l0IGF0dGVtcHQ/ICh1aWQ6IDApDQoNCg0KRmlu
YWxseSwgaGVyZSdzIHRoZSBHREIgc3RlcHBpbmcsIGNvbnRpbnVlIGFuZCBiYWNrdHJhY2UgYXQg
dGhlIGNyYXNoOg0KDQooZ2RiKSB0YXJnZXQgcmVtb3RlIDE5Mi4xNjguMS42ODoxMjM0DQpSZW1v
dGUgZGVidWdnaW5nIHVzaW5nIDE5Mi4xNjguMS42ODoxMjM0DQpSZWFkaW5nIHN5bWJvbHMgZnJv
bSAvbmZzcm9vdC9wYmVjcW9yaXFfcHBjMzIvcHJvZG5hbWUvbGliL2xkLnNvLjEuLi4NClJlYWRp
bmcgc3ltYm9scyBmcm9tIC9uZnNyb290L3BiZWNxb3JpcV9wcGMzMi9wcm9kbmFtZS9saWIvLmRl
YnVnL2xkLnNvLjEuLi4NCl9zdGFydCAoKSBhdCAuLi9zeXNkZXBzL3Bvd2VycGMvcG93ZXJwYzMy
L2RsLXN0YXJ0LlM6MzINCndhcm5pbmc6IDMyICAgICAuLi9zeXNkZXBzL3Bvd2VycGMvcG93ZXJw
YzMyL2RsLXN0YXJ0LlM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCihnZGIpIHMNCjM1ICAg
ICAgaW4gLi4vc3lzZGVwcy9wb3dlcnBjL3Bvd2VycGMzMi9kbC1zdGFydC5TDQooZ2RiKSBzDQoz
NiAgICAgIGluIC4uL3N5c2RlcHMvcG93ZXJwYy9wb3dlcnBjMzIvZGwtc3RhcnQuUw0KKGdkYikg
cw0KX3N0YXJ0ICgpIGF0IC4uL3N5c2RlcHMvcG93ZXJwYy9wb3dlcnBjMzIvZGwtc3RhcnQuUzo0
MA0KNDAgICAgICBpbiAuLi9zeXNkZXBzL3Bvd2VycGMvcG93ZXJwYzMyL2RsLXN0YXJ0LlMNCihn
ZGIpIHMNCjQxICAgICAgaW4gLi4vc3lzZGVwcy9wb3dlcnBjL3Bvd2VycGMzMi9kbC1zdGFydC5T
DQooZ2RiKSBzDQpfZGxfc3RhcnQgKGFyZz0weGRmZmNmZjEwKSBhdCBydGxkLmM6NTM2DQp3YXJu
aW5nOiA1MzYgICAgcnRsZC5jOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQooZ2RiKSBzDQo1
MzggICAgIGluIHJ0bGQuYw0KKGdkYikgYw0KQ29udGludWluZy4NCg0KUHJvZ3JhbSByZWNlaXZl
ZCBzaWduYWwgU0lHU0VHViwgU2VnbWVudGF0aW9uIGZhdWx0Lg0KMHhiN2ZlNWRkOCBpbiBfZGxf
c3lzZGVwX3BhcnNlX2FyZ3VtZW50cyAoYXJncz0weGJmZmZmYTE4LCBzdGFydF9hcmdwdHI9MHhk
ZmZjZmYxMCkNCiAgICBhdCAvdXNyL3NyYy9kZWJ1Zy9nbGliYy8yLjM5K2dpdC9zeXNkZXBzL3Vu
aXgvc3lzdi9saW51eC9kbC1zeXNkZXAuYzo4MA0Kd2FybmluZzogODAgICAgIC91c3Ivc3JjL2Rl
YnVnL2dsaWJjLzIuMzkrZ2l0L3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2RsLXN5c2RlcC5jOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQooZ2RiKSBidA0KIzAgIDB4YjdmZTVkZDggaW4gX2Rs
X3N5c2RlcF9wYXJzZV9hcmd1bWVudHMgKGFyZ3M9MHhiZmZmZmExOCwgc3RhcnRfYXJncHRyPTB4
ZGZmY2ZmMTApDQogICAgYXQgL3Vzci9zcmMvZGVidWcvZ2xpYmMvMi4zOStnaXQvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvZGwtc3lzZGVwLmM6ODANCiMxICBfZGxfc3lzZGVwX3N0YXJ0IChzdGFy
dF9hcmdwdHI9c3RhcnRfYXJncHRyQGVudHJ5PTB4ZGZmY2ZmMTAsIGRsX21haW49MHhiN2ZlN2Y3
MCA8ZGxfbWFpbj4pDQogICAgYXQgL3Vzci9zcmMvZGVidWcvZ2xpYmMvMi4zOStnaXQvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvZGwtc3lzZGVwLmM6MTA3DQojMiAgMHhiN2ZlNzA1YyBpbiBfZGxf
c3RhcnRfZmluYWwgKGFyZz1hcmdAZW50cnk9MHhkZmZjZmYxMCwgaW5mbz1pbmZvQGVudHJ5PTB4
YmZmZmZhYjApIGF0IHJ0bGQuYzo0OTQNCiMzICAweGI3ZmU3NzI0IGluIF9kbF9zdGFydCAoYXJn
PTB4ZGZmY2ZmMTApIGF0IHJ0bGQuYzo1ODMNCiM0ICAweGI3ZmVjMjQwIGluIF9zdGFydCAoKSBh
dCAuLi9zeXNkZXBzL3Bvd2VycGMvcG93ZXJwYzMyL2RsLXN0YXJ0LlM6NDENCihnZGIpIA0KDQoN
CkkgdGVzdGVkIHRoZSBleGFjdCBzYW1lIGtlcm5lbCBhbmQgdG9vbGNoYWluIG9uIGEgZGlmZmVy
ZW50IHBvd2VycGMgcGxhdGZvcm0gKG1wYzgzeHgpIGFuZCB0aGUgcHJvYmxlbSBpcyBub3QgcHJl
c2VudC4NCkkgYW0gbm90IHN1cmUgaG93IHRvIHByb2NlZWQgb3IgaG93IHRvIHRlbGwgaWYgdGhl
IHByb2JsZW0gaXMgdGhlIHZhbHVlIGJlaW5nIHB1dCB0aGVyZSBvciB0aGUgY29kZSBwaWNraW5n
IHVwIHRoYXQgdmFsdWUgdG8gZGVyZWZlcmVuY2UgaXQuIEFueSB0aXBzPw0KDQpUb21hcyBBbHZh
cmV6IFZhbm9saSANCg==

