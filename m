Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA45A0EE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 13:20:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD0qm57f5z3c4x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 21:20:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NPHq9C+i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NPHq9C+i;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD0q30G1Sz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 21:19:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIJlUK4BKF0RLunIkeENTIq+BO2SgyCkfcE4DpM8zZHnKXhQEq9503j4yRX9Mx0IQI0XzROmP3LzInXniiwCxIda+PkUOpn732GLFBKV96AX/Hxzyh4JITj8fUkd22zikh/rpc8Ig1NO2xerroNTXjxi+MM/p0x43nVoJsxGljxBMmCNOOj1UYxWZTPazaOcsFC372p3UJVfN+F/fy/GxjLde6tXKI+nKK0F9XhSSmlA2YfCZNqhM1OBMqnJk2BhkioHl/W28QBOOJbpvHTxJme0jWXq70dGQKiS7dz/dcbZF9k1flWCFLZ7xl1shkK1D1i2HI0IoF+nDz74toh2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcXY0gdT6xoLqkLKcKxfCVL/ZQxW5qGC7ZWf6J9PCuM=;
 b=G7YQRLQ4C1asp0cTxOKscALUZQAn6ZzzvgWW2m9ZKgudXcPv+nH+UAx1Kww9d44Td81r/Yr4sZ6Pnjaozt1T8SlHpXdno7n3VUdQ5LugRMRfVjsQznGo1umgiQqVBbgBWKTH0s2WOoF3Xs/ueSjWllTgRbQlDAv/qq+VI62SoCuJNN7dmp0v6z6kpoW9Q5vn/NhKqwAWOi32s4C3Ps7B4c0HYJwzjpP55C4SAQPTg3Fw1FVbULtPCtaPf8toOgXVCq8QWRoDgvspf2G8oN1tXU3582Mme1hh1AERPZN8mmc9n5isdiOAYKexrBhg3TdCRxjcyOR9P245SWiByfL5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcXY0gdT6xoLqkLKcKxfCVL/ZQxW5qGC7ZWf6J9PCuM=;
 b=NPHq9C+i+bvYeN9NHi0k7v5ZWslgbYCNAlGKfYk7por7SbCnNZxfvykBQ5GF3D+B7L3q6vwkDICWOebDytS7kOKsmCPCUGROBqIsUZBmxRZTeTdgSXCwQn5RL9J5IwW+J6s87/TMn2oHg2ZbNUkxMQ11fyEtwuPrsPifGCqHnM6AM4PxTH8HCRP0MyM7m6+YwskrApDG5IJ6MWjDQersvZqVFjuosisBPm9Eo5sio16xOX/NyagxhnbGbUWnUHigqj+hx2W0RnZMYEh/D5L19g+mYh+NQx8ie+CDxCNA+AdAvKnQ8g4Tc9SNiYzstL5RrVwLc9EojVEelcaBeAC4cA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3891.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 11:19:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 11:19:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Uros Bizjak
	<ubizjak@gmail.com>, "x86@kernel.org" <x86@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Topic: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Index: AQHYuG3gJRoiq14gKku11kRUFzyUCa2/eB2A
Date: Thu, 25 Aug 2022 11:19:06 +0000
Message-ID: <fd71c136-4c1c-5c4d-003f-20cb8c7cf17f@csgroup.eu>
References: <20220624141412.72274-1-ubizjak@gmail.com>
 <1661422971.cqtahfm22j.naveen@linux.ibm.com>
In-Reply-To: <1661422971.cqtahfm22j.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a414fb1-c7db-4a5d-5797-08da868b9fa4
x-ms-traffictypediagnostic: MR1P264MB3891:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7UZ4G1/N/8zYKj539fzg911lFKoXXCzIx0+0PiUYgebIGplESv5e3rhDDtZD62hFJ6Emgo+6qlJpbzTB5X3j0C3lmDZvvc1iWnIh+w29QGo3KGldLiSl3/hrYsWyKF2OvBQWa4Joap4BJhH1pgnmcn3raJzIiNlaIVuhuDuweCavZiAbEDb6shkS/RMMyxGYTM+dojFRtnON/28LzkOMIMr6gJn4hzXcfueTTTqg/PkijP4A0V6QS3rStx2Eb94tbgXxEqYO5RFccOk/Q0gnEYn7ayl3CaLk4ZjkGe6lHcve5FCG6oumws9ixikoYjJ/IfhzjjPgb76JdJMukq7+jlaNgqnAinGf2/DXBEzq/sAY7h8kGlHeLg3ceBZV8hA3fbZ30Gpn3Af6OycQ9GEMegVonFVZlg0uMVSsvNIjFDoqyDu9f3Xq1ScjAbs8tB6fZe4XDV8p+svYPJqvf9dfdjoXiU3Nwn6aezVTeMQIPILH4jGtvyMdLNNBIBqMniS221PsN94Qj7ws3sZMcJTcF0X3dEDPdPuxsGIMaw1LvzqCE8DmFolkMlSrnr6fVcX/DllXrogV4WNbk4rL8H88AhIvGu7I280KF4C0jJnwOmQqM3tfoe9wae846XfAo2JDHvWrI4Q5f6s9F5j1QiYoDzw8xsD56fXhQOYl8q1jAo8BD4BCyUfIzkV9MPVuE5rOyOd8yD72gtNyTgATAW4nDL1pgWI/3MQKXePd5acMF38TTb3koKpiHmQd9aVQ/ybSdhniQIbxOgYR48otWua6DBJopBvo2hIkJRKtduh5vaPqgq9rzz+YX2sUYYoSUIH5LwjCQVAIJuZf4ZV1lfoVhWON9iGpEMbpfMhYacsa91tLYi5SlBbxaCIgPAzKjKJ/i8va/OpQtbnjIyklI0DYHg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(38070700005)(83380400001)(2906002)(8936002)(316002)(26005)(5660300002)(36756003)(6486002)(966005)(2616005)(71200400001)(31686004)(186003)(478600001)(66574015)(44832011)(66556008)(122000001)(110136005)(38100700002)(54906003)(66446008)(41300700001)(66946007)(64756008)(76116006)(8676002)(66476007)(6512007)(91956017)(6506007)(4326008)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V00wZXlSQnlLU0xpWlJBZDlob2dCdnRzNjJpQm9tRWhmTUNTWGpTVWdPZ1Rr?=
 =?utf-8?B?bnR2Kzk0MjhZOTB6RTNaY0FheTBFbGNINXI1cDE1VDJrZ2paLzcwdDRLOVZm?=
 =?utf-8?B?UDNkVm9OeXN2VVUrTG8vdEV3M1pUamFLNFBYS0M3SlNVOUlGSDZKUmFTcmhS?=
 =?utf-8?B?eVhhSHdlSUFVaW1JWkkzMmtvNi9ZRUJveStDeXRtVnFGRDAvY2p0VUkyMWV2?=
 =?utf-8?B?bFhQR01CeC9GM2RJdHNVb0l0YVY0UDQzVWhIbWZ5RFNUc0VPNk5YQVNQSzJr?=
 =?utf-8?B?a3dhTWZBRndOeUw0WVlzVXptSkdMamcrY3Z6Qmp6L2U0SXFtaUxXZG1hdVBm?=
 =?utf-8?B?ZHByNlg0VGhLOVRTdnEzS1cxWTB4TlNqdXdsZ2hkeExTVVFGUEZ1Z0hkNlVJ?=
 =?utf-8?B?SkphdFBkNkhob2YwNGdqL1hQRjFYVCt3RVBqOFFKUG5halVBOHFwUDhCQ3dV?=
 =?utf-8?B?T0FGTFBZM3dycDU4cGkwbzUwOFlWNmVWUEtrYUcreVluQjB6RWphRU1oZzQr?=
 =?utf-8?B?ZTl2bUlnbW96SDJDNmI4WmFpTGZWTHRQSWlEZGxYQXFDT2d6ZWZGaXBpS0ps?=
 =?utf-8?B?RnVYVjNwQS9md1JFSjkxeVRyd0k0dUpGd0hWUjBabURRdjdVVTZRQWlsZnRU?=
 =?utf-8?B?djY0cjhyWHcreWo5eFEyYWh2Z3M1Vm45R1hwR3V2UkpPTng1bjRUUHBHUjZv?=
 =?utf-8?B?N0NDSnNiZ29BVjVFcnJqWG1ZU0poL0Y2UlVUVDR2VXFCbWpWSEJ2ZWl3Z2NE?=
 =?utf-8?B?V1oxSWlpSFNGU3MvbGR0dnVISVd4S1FzSnJDLzJmREIrTEdsVnEvK3FOMWF1?=
 =?utf-8?B?VGtpZkE3K3QySnduQmd1QWt3K29xOVJlQ09jcmRNYW5qZGVIZnNmM3VTaDd2?=
 =?utf-8?B?MGpTazJDVm5WU0RtQ0JiZnBKcmFYN2lzd3E1d3pNZ3E4RWR6TXNkQllmbTRL?=
 =?utf-8?B?UEIvbnNmVVlEWHMxS3VuY2N5WEdmRjIvdDJ1aW1QdUJCbk5xTlVucmRxbzBm?=
 =?utf-8?B?ZVNLcmZwUmhvY3NpemVtN3pKZHlzdzBqUU5qQUVxRHAwVmFOUWJnSGF2OEtF?=
 =?utf-8?B?V3pjUXZPL1BPT2JvNUZoUDF5QkJjbS9helZ2VmVkeTJZdFlHcnprczltL2N3?=
 =?utf-8?B?L1NGSmFtNGNRVUJTTjRaVnc0UkRJYnBRNEgxUjk4UHJJcUZXbTdpU3pyOXZE?=
 =?utf-8?B?aUIxMzdTN1pHYkZCczZ0UDVlWnFDSmdzcFpjNGxXM2dMVWJEMVNuZ2dZdmZ3?=
 =?utf-8?B?eWROc2VncGUycFFLbll1NEdZMDh5VHNqamhrT1hCSEIzd0ZmeWxvcTRYYUdP?=
 =?utf-8?B?cXNIa3g5MytocEtCcG9ZUjA5OGMwVmVReS9wODJDaE43TDRBWUFtT2lmMkdL?=
 =?utf-8?B?ZDliRmp0amVaWHZaR2FETjE0ZnFOcTAxcjN2dExlV2Iwc3c5MnRPRWVEc01D?=
 =?utf-8?B?MlVXY2Z1Ky9tM1pmNU9DOGFpN3c0d2h0Vy8ybytwNmJwQ2RnVnMzaEgzek5L?=
 =?utf-8?B?MVM3V1FGcDVBYTdWc1Jaa0p1c2ZZNnpuTzlEMWNjTXpSMWsxZC83d0x6QnlH?=
 =?utf-8?B?bkxUMUlQQ0tTbmJoZXFIa04wQThEam5VR3J3VjM1MnFkNnZiZ3NJNFU0aGlF?=
 =?utf-8?B?aGNFTko1QU1JZUU2LzRUQVJONjhmN21pdi9zU25vdDM2VTRscFlqVm1jeHl1?=
 =?utf-8?B?Q2hVZlMrOUFqTGE0djZsNGdtT29HVk5RSzhUN3RrNWs2Z2dWVGU5NmlwTXZW?=
 =?utf-8?B?S3NWdGlTdzZaMUV1ZzZ5SlMrNHlmekNsY05GblFuZno3U2UyRU45S0dZaldS?=
 =?utf-8?B?VmpaQ2tlMGV3Y2xpblk3RzNueGZwcmRSS0k0RTRsc0Ewd2lHdngxVE8wdEoz?=
 =?utf-8?B?b1ZLUS9jTW03ZkVQUmhCVm9OemV5M1d1RVhUaWw2eGw0bTlRVTdGbGZ6Tndv?=
 =?utf-8?B?WnpsS2lGZ1AxL3p0K0tuSEh1VUdFWmxWS1ZuOVZVczNCRDVWOGlud2tKU2I1?=
 =?utf-8?B?dk5WaW9aM0c0K1pBVHp5bkRUSkZaWmZuOElFVHRMQ2lSKzhwYXZYNFJnZWhX?=
 =?utf-8?B?YkZkV0RwVTFTWUZEU0hCYnJBcUJlcUxTNFhTVldMNFo5ZkZ3bDZyKzRZQUJR?=
 =?utf-8?B?VnU4V3dyZDM3QmVvM3RzZm1WMkN1dDc3ZTUwME4xS1cySjBnQ2VVMzI4TGdJ?=
 =?utf-8?Q?8eblj2GK6my7Li81Q7wbLsw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F98BBD853D7C148BB6B7A350D23258B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a414fb1-c7db-4a5d-5797-08da868b9fa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 11:19:06.2957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RDrqINBZfajyQJJwNACbLP7AOf68JRrbxA+pSdnt51wx+cHL5yZmMKjsN2mecK7JDovz5iDyMKHz9JeuwZt4EW4oPDBC2ZVg61m+gYqYNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3891
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
Cc: "sv@linux.ibm.com" <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA4LzIwMjIgw6AgMTI6MzAsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
VXJvcyBCaXpqYWsgd3JvdGU6DQo+PiBUaGUgd29ya2Fyb3VuZCBmb3IgJ2FzbSBnb3RvJyBtaXNj
b21waWxhdGlvbiBpbnRyb2R1Y2VzIGEgY29tcGlsZXINCj4+IGJhcnJpZXIgcXVpcmsgdGhhdCBp
bmhpYml0cyBtYW55IHVzZWZ1bCBjb21waWxlciBvcHRpbWl6YXRpb25zLiBGb3INCj4+IGV4YW1w
bGUsIF9fdHJ5X2NtcHhjaGdfdXNlciBjb21waWxlcyB0bzoNCj4+DQo+PiDCoMKgIDExMzc1OsKg
wqDCoCA0MSA4YiA0ZCAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAweDAo
JXIxMyksJWVjeA0KPj4gwqDCoCAxMTM3OTrCoMKgwqAgNDEgOGIgMDLCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgKCVyMTApLCVlYXgNCj4+IMKgwqAgMTEzN2M6wqDC
oMKgIGYwIDBmIGIxIDBhwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9jayBjbXB4Y2hnICVl
Y3gsKCVyZHgpDQo+PiDCoMKgIDExMzgwOsKgwqDCoCAwZiA5NCBjMsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNldGXCoMKgICVkbA0KPj4gwqDCoCAxMTM4MzrCoMKgwqAgODQgZDLC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZXN0wqDCoCAlZGwsJWRsDQo+
PiDCoMKgIDExMzg1OsKgwqDCoCA3NSBjNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGpuZcKgwqDCoCAxMTM0YiA8Li4uPg0KPj4gwqDCoCAxMTM4NzrCoMKgwqAgNDEgODkg
MDLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgJWVheCwoJXIxMCkN
Cj4+DQo+PiB3aGVyZSB0aGUgYmFycmllciBpbmhpYml0cyBmbGFncyBwcm9wYWdhdGlvbiBmcm9t
IGFzbSB3aGVuDQo+PiBjb21waWxlZCB3aXRoIGdjYy0xMi4NCj4+DQo+PiBXaGVuIHRoZSBtZW50
aW9uZWQgcXVpcmsgaXMgcmVtb3ZlZCwgdGhlIGZvbGxvd2luZyBjb2RlIGlzIGdlbmVyYXRlZDoN
Cj4+DQo+PiDCoMKgIDExNTUzOsKgwqDCoCA0MSA4YiA0ZCAwMMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG1vdsKgwqDCoCAweDAoJXIxMyksJWVjeA0KPj4gwqDCoCAxMTU1NzrCoMKgwqAgNDEg
OGIgMDLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqAgKCVyMTApLCVl
YXgNCj4+IMKgwqAgMTE1NWE6wqDCoMKgIGYwIDBmIGIxIDBhwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbG9jayBjbXB4Y2hnICVlY3gsKCVyZHgpDQo+PiDCoMKgIDExNTVlOsKgwqDCoCA3NCBj
OcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGplwqDCoMKgwqAgMTE1Mjkg
PC4uLj4NCj4+IMKgwqAgMTE1NjA6wqDCoMKgIDQxIDg5IDAywqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbW92wqDCoMKgICVlYXgsKCVyMTApDQo+Pg0KPj4gVGhlIHJlZmVyZWQgY29t
cGlsZXIgYnVnOg0KPj4NCj4+IGh0dHA6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5j
Z2k/aWQ9NTg2NzANCj4+DQo+PiB3YXMgZml4ZWQgZm9yIGdjYy00LjguMi4NCj4+DQo+PiBDdXJy
ZW50IG1pbmltdW0gcmVxdWlyZWQgdmVyc2lvbiBvZiBHQ0MgaXMgdmVyc2lvbiA1LjEgd2hpY2gg
aGFzDQo+PiB0aGUgYWJvdmUgJ2FzbSBnb3RvJyBtaXNjb21waWxhdGlvbiBmaXhlZCwgc28gcmVt
b3ZlIHRoZSB3b3JrYXJvdW5kLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFVyb3MgQml6amFrIDx1
Yml6amFrQGdtYWlsLmNvbT4NCj4+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPg0KDQpJdCdzIHVubGlrZWx5IHRoYXQgYXNtIGdvdG8gYnVnIHdhcyBjb21wbGV0
ZWx5IGZpeGVkIGluIDQuOCBiZWNhdXNlIGl0J3MgDQpiZWVuIGVuY291bnRlcmVkIHdpdGggZ2Nj
IDQuOS4zIGFuZCA0LjkuNCwgc2VlIGNvbW1pdCAxMzQ0YTIzMjAxNmQgDQooInBvd2VycGM6IFVz
ZSBhc21fZ290b192b2xhdGlsZSBmb3IgcHV0X3VzZXIoKSIpDQoNCkNocmlzdG9waGU=
