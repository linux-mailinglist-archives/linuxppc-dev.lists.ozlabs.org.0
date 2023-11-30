Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E57FE950
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 07:44:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NrenTh6Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgmrz6RQpz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 17:44:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NrenTh6Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgmqT46DDz3cRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 17:43:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9mIhlPMiyxRwOgw8YfrfKABjEjjXi8jYp6wrky7lH1gg2GIbhtwvbaPzfvJLjvAouPrsr/Zmir80lJY6qVyZxXjuvVownGo6urbHuT0jLhFFFm2z+jcHfOFoyOAH3A9sr4tcLEpl71aJPx6Gr7uAl47w8wjcw6T1NEpwyhheTtnCdWZ2I9130X0/S1IEXDEbrMVlo0RW5s1fpBvG+8JxEpFXUjZCO1CaTXmbnTSwFQ9qOn4Jas0GbzSpC7gD3NAd/D3RRRi0CamZcII3siNAuSHu50gIE+5C4YH7/Qy7XvmxCWGf1V+2EyDAMsMrF2zAARpW3/LC8tlx9v09DK4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7uvbF/ubbAOFajgcD5dp0bdDNm0s2kQDs5eu3Wg6q4=;
 b=cNRl8NgvYOXvQB8Y9ZAs8YZnucCpAmSdBaSzPKW3bwPs25jeK0DeWbcdPZJbPvW2UtBY2a4ju3ZMfzRzcBz6yR1BILMfUopyvd3cG977ge7AB2y/T1k7d6dlUFBC3iyB8G0bLV3tXQUACazt5orSBXqiM4Vhy+HiTZdV3/UjbAa35Xf1iJNvuYSmnwleegrWluhiwogRwCgltLNjmdQnZJ1Yy9YmrTlNtCLsYFl7d90vBzR+3f5ESkWFilQbHOR/1ekcTr1Nc+L0SKSViX2MylsG2aDrqf6+VVqKG8zvD/VFuRhE3EbmycQ0IqeeQgezCqT51263lr/bIM40p1UaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7uvbF/ubbAOFajgcD5dp0bdDNm0s2kQDs5eu3Wg6q4=;
 b=NrenTh6Qq+NXYkGLV1d9dvoCm9twnD+VSjlIf4d1XCn2qV89CK+Mvn6+j9/h6BfiMm/neRNgVLL0VyyZHh6PCQaN+nF7lwPW1LSh+NOqFJcGJ1bpvYSk0d3E7g8VSuFluie+UbqF/vcw+nnGXdX7VOt1XPym5+bZYdO4HDxMkSBkJKr5eP+VfjI1O1uA+UPQTkrzAbGX1Cz/KuOf8/W83fmXk9qNU0W4zFCyKHuulKGsleZwpX2yQtiSGWWmdh57V2XcYP1TA8E5fVpleD+rUHPe6kGN6iGvsID6IeOU2PD1ul609ZdQa19/fTNb7G2io1lHlyFulN9+kQL4sTOhpA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8; Thu, 30 Nov
 2023 06:43:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.011; Thu, 30 Nov 2023
 06:43:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 3/7] powerpc: mm: Add common pud_pfn stub for all
 platforms
Thread-Topic: [PATCH v9 3/7] powerpc: mm: Add common pud_pfn stub for all
 platforms
Thread-Index: AQHaIzipqG1qDUZ1IkSsrmYrqDN9frCSaomA
Date: Thu, 30 Nov 2023 06:43:14 +0000
Message-ID: <3318a4e0-114a-465d-b28d-627b11fdb35a@csgroup.eu>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
 <20231130025404.37179-6-rmclure@linux.ibm.com>
In-Reply-To: <20231130025404.37179-6-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3086:EE_
x-ms-office365-filtering-correlation-id: 91c31754-d022-4aa0-2725-08dbf16fa0af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8NFg1tFgSV1S0TW+n2XJNK9KpR44RW8tOJ9/e/80mjBCVRDseEEYr2gusNe3ioBrtTJxux1Iz79HQdvpl8ngE7UnQdUZU6hzMY0anS/t5Tn4H5sI2GecmJJYTJDomw6g5WzXSzcj3e0a+x69yoYn2YGP30wVIBqKjW6eEwnEZEeYWwrliqjgr7IROIu/eDMxDINa9250Is84SOJqJuQLvA+Wm59jgs3q3o/n51sCuOGsNcN5SG89tvR4A5me19XXHKmUK85NwdEydf877JxRhQRAOxTOrTgEprUtel6DWc80JQZDlGrNh+invC+h1kf/4m/9GWsOfOScZ3E61xNzsmBkIHaZcW/AxQ+fYotB+uPCHoW/YsnzETRk1UkRv849rxPEwQxIV6UfHjgEh7x7g6UqDzawPsIYf7kPEZzPCwW0BUIGPcrwO7MmSg2TwGIfRoPFfMgFtX8lenlka/5KSQw/1bErsisN3Zd1JAz5bHTNBC7XCMGHrrjnz4oaKJMUpRgIVOTMXuHjStl+iJ8LNUKpHF5cTOeQPV95dfMO6KAJcoe1VhsbSjqeq4RkJRA+9Lr1gcE2c2Gf/2eMAKkGYv6jOJgNaJMSqRpEABnxg+ywioWkgrbOoNXrDtHHepdSGb5xBvDEQJbECGNqB5otlAWdIlsNVH84VwpfoLl8UsDb3eRi/ifwIpNYntHM+TqryPwT2vCejGs/obDKv4/in4EOcwLZvyjhlsCvJNUAMDE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(44832011)(4326008)(6506007)(26005)(2906002)(6486002)(478600001)(71200400001)(31696002)(5660300002)(66946007)(8936002)(66556008)(8676002)(31686004)(76116006)(6512007)(66446008)(66574015)(2616005)(316002)(66476007)(64756008)(86362001)(91956017)(202311291699003)(110136005)(36756003)(41300700001)(122000001)(38070700009)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d3hkRHlCZmhsTElLMEhuU2RtOFE1OFlWSEZMUng0d0xoY01lQkl2NVpBR3VT?=
 =?utf-8?B?MWJRR2NPWXBSWFpSQXQ1bHZXalBjeWlrN3ZyRGxYekZjeUIyN2xrUmx0b0Ju?=
 =?utf-8?B?SDR4U2xqNGdFOTZnaUZ2NWJoR0V5dVZ2ajFPVDcxTWxENS9HM1FKbEVlcDVG?=
 =?utf-8?B?MVBxTGJxcXp2T3RZdEZRTTlhclVtVDd2QWZ4WnhIT2xsZmIzQVlXUDluYjNp?=
 =?utf-8?B?WGk2eWhGek5VWGpoRFRvNmcrVXhmUFR4a1QzYkNoUWtsNjg4RkVQcUg0eDdI?=
 =?utf-8?B?N2NsRE9WcGZhTFFlbDJjaHJkMXlVNUt3Qk4yZ3pjU3FiRmhDTGZUQlpJQk9x?=
 =?utf-8?B?cXNEbWJBRXpoM0FmdGdIYmtXT1FLVk5KUWpMdmFsWlVBMnF6WldWcFdMa0VN?=
 =?utf-8?B?dWhXMTFicDJRTS9KSlZ4NmNQS3FXaG9vMXRnUEJQQVNtVjM3N052QnB5MEJl?=
 =?utf-8?B?SzMrcHY5L2xpY1d5dUhFenNWTDZKdDNIbnlQVnZ6UGNZM2dHM2RBNjFhUmYx?=
 =?utf-8?B?UDZzYU82WTltUll0NzJnTnNqT2xSMSt4WkNVWXF4WWtCYi8yRzBOR0JvdGh0?=
 =?utf-8?B?RVpCcU5ZS2haejI0aEcybnZTOFZYWFJIRlQ3WE15ODRGckhzVVpVSmx4a3hK?=
 =?utf-8?B?NmFHSVBWSm5sV1U5a3kyOUg0Y2pWWkdrcmt3ZGVoN2szeE9Qa1dxM0piWXJj?=
 =?utf-8?B?VzN3cnVyVHlxdm5BRkZvVnR3L1J6c3FlTkp2MFRMUnJiSkJQNUYwb2JxM0tP?=
 =?utf-8?B?bElVblZ2WVpmZ3lKaDdqa2EveHJ4bG1md1FodVEzazdMMWhlTVVTalRWMnU5?=
 =?utf-8?B?RUV6eVhaVFV4OUV3VVljZEJJeXpqRklCVHN3NEoySk9MYVVaam9Od0s2M1ZB?=
 =?utf-8?B?NnJkam9JVXgxQzJtSzUyYUxxb0lLMUFTMFJGM2JLUlYwam01dHJpV0pLUzVo?=
 =?utf-8?B?ZWUrcEQ5Y1YxTEgwcFRmUE5oTzNMSVJxQWtGSERIUmxhQ0JTSU84aFlDR0xv?=
 =?utf-8?B?aUhEK1RxTTJGRmNFclJWenVpUFVoK1gzdEVRVjd3MzQ2bDh1TW1yRytTNkl6?=
 =?utf-8?B?dnpFem5EVDl6ZkhPZTIvdmVFTW1keXgvd3ZLcC9FelZJMFA3M3pNaU1zWnR0?=
 =?utf-8?B?cDBhZHZPU1ZQOFVQYmoxRlR5RmJzMU1TNG43WkU0SVhrY0RxWFhheDcvTVhB?=
 =?utf-8?B?TTdydzdLTHpTU0dUMzh0OFlKMGZtbFpLRXVqcTA4dHJGTFF1MWR3UW9mRnBX?=
 =?utf-8?B?VXBJN3NxYjc0c1IyempnOFVrdEs0Nnp5U0NBVTBqVkhWZGl1WG93US9ZZzg3?=
 =?utf-8?B?a3dXVEJ4WVV2c1JlQ3dOK0FVVlByYVUrZkxKdFR6UHVzaFZWeXkzdzlZSGRp?=
 =?utf-8?B?VmVhRk5yY291TEFGdmQwczhrdUFYeE15MmNJOG1QQ3ptemNXMnlGNWtsVFkr?=
 =?utf-8?B?VjhiS1JTUmd0L3J2YWlWQnZDQW50d1p1dGR4di9Qd1VMbkllNjZKbUdLODMr?=
 =?utf-8?B?aWNSd3RoOUlpY0dvNitLbFNrRTNWWHNYdkNaNEI4Q1hJR1BLemlVUzQ3b2lW?=
 =?utf-8?B?Q3ZkVEpKaTUvamRiODFBWTFURG9ISS9veWc4WWRIcWVqaGp4akFUaTRSWHd4?=
 =?utf-8?B?eXNzTkJpNjlwcUdrODg4QTZFSlFBd1ZmdElLVjhUaVVUbjAxd1RPb0tOaDdK?=
 =?utf-8?B?eUxjS3dGZmxwby9wc1ZjdVdoNllrUytXbFdnV2NKSWZvUjQzYWZ1ZDlUYzk5?=
 =?utf-8?B?bk1rMHJxSmhRaExXQWRsSzVmekhIKzBucW54bmZJS2E0eStpRGErMGRBaHV0?=
 =?utf-8?B?R1dmeERqZi9MUkVJYzBrckxQTEZvZmpWSVM2RHB2NEFBUjlJbGxoYTcvbmJ0?=
 =?utf-8?B?bFBNWktCU1VqTWtEdEo3TTc3bWRkYjZ3UDB5SG5QTXZMWFJjeVptczd0aHBD?=
 =?utf-8?B?aXRYVHlZUThITjgvNy9mY2VoSytjSE16MThjQWFKWTNqVmZLaktoL0c5MjVX?=
 =?utf-8?B?RUlhYW9DbmRVeE81VVNwamhYQklVZXpia1lyNkxiZEkvS21XY3I3SERtUHBJ?=
 =?utf-8?B?SldRcDk2QVc4V2pJcjl3Zzljb3A3NnlTOHV0VkU0ZVhqTTJreUQ1eU5rZlBT?=
 =?utf-8?B?MVYvMU9qVHAxTXU3N2dGdUk4NXJFU1kvSWNGRytXWU5OeGNJODgzc3J4VTB4?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A58A0845368FB4FAA4E08451435B779@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c31754-d022-4aa0-2725-08dbf16fa0af
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:43:14.2106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BUbb/67zpnjZxCuLJRqWrVrpZhw9IkxxAFGDW7tX5wfStWyY9DSB1e7/QcbzaxDj7jLoDjBTQOQgulHq3C1ll8DMlBkdbzKDAt6NmTDJbVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3086
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzExLzIwMjMgw6AgMDM6NTMsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBQ
cmlvciB0byB0aGlzIGNvbW1pdCwgcHVkX3BmbiB3YXMgaW1wbGVtZW50ZWQgd2l0aCBCVUlMRF9C
VUcgYXMgdGhlIGlubGluZQ0KPiBmdW5jdGlvbiBmb3IgNjQtYml0IEJvb2szUyBzeXN0ZW1zIGJ1
dCBpcyBuZXZlciBpbmNsdWRlZCwgYXMgaXRzDQo+IGludm9jYXRpb25zIGluIGdlbmVyaWMgY29k
ZSBhcmUgZ3VhcmRlZCBieSBjYWxscyB0byBwdWRfZGV2bWFwIHdoaWNoIHJldHVybg0KPiB6ZXJv
IG9uIHN1Y2ggc3lzdGVtcy4gQSBmdXR1cmUgcGF0Y2ggd2lsbCBwcm92aWRlIHN1cHBvcnQgZm9y
IHBhZ2UgdGFibGUNCj4gY2hlY2tzLCB0aGUgZ2VuZXJpYyBjb2RlIGZvciB3aGljaCBkZXBlbmRz
IG9uIGEgcHVkX3BmbiBzdHViIGJlaW5nDQo+IGltcGxlbWVudGVkLCBldmVuIHdoaWxlIHRoZSBw
YXRjaCB3aWxsIG5vdCBpbnRlcmFjdCB3aXRoIHB1ZHMgZGlyZWN0bHkuDQoNClRoaXMgaXMgbm90
IGNvcnJlY3QgYW55bW9yZSwgdGhhdCB3YXMgY2hhbmdlZCBieSBjb21taXQgMjdhZjY3ZjM1NjMx
IA0KKCJwb3dlcnBjL2Jvb2szczY0L21tOiBlbmFibGUgdHJhbnNwYXJlbnQgcHVkIGh1Z2VwYWdl
IikNCg0KDQo+IA0KPiBSZW1vdmUgdGhlIDY0LWJpdCBCb29rM1Mgc3R1YiBhbmQgZGVmaW5lIHB1
ZF9wZm4gdG8gd2FybiBvbiBhbGwNCj4gcGxhdGZvcm1zLiBwdWRfcGZuIG1heSBiZSBkZWZpbmVk
IHByb3Blcmx5IG9uIGEgcGVyLXBsYXRmb3JtIGJhc2lzDQo+IHNob3VsZCBpdCBncm93IHJlYWwg
dXNhZ2VzIGluIGZ1dHVyZS4NCg0KWW91ciBwYXRjaCByZW1vdmVzIG5vdGhpbmcsIGl0IGp1c3Qg
YWRkcyBhIGZhbGxiYWNrLCBpcyB0aGF0IHN0aWxsIGNvcnJlY3QgPw0KDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDE0ICsrKysrKysrKysrKysrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3BndGFibGUuaA0KPiBpbmRleCBkYjAyMzFhZmNhOWQuLjljMGYyMTUxZjA4ZiAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC0yMTksNiArMjE5LDIwIEBAIHN0
YXRpYyBpbmxpbmUgYm9vbCBhcmNoX3N1cHBvcnRzX21lbW1hcF9vbl9tZW1vcnkodW5zaWduZWQg
bG9uZyB2bWVtbWFwX3NpemUpDQo+ICAgDQo+ICAgI2VuZGlmIC8qIENPTkZJR19QUEM2NCAqLw0K
PiAgIA0KPiArLyoNCj4gKyAqIEN1cnJlbnRseSBvbmx5IGNvbnN1bWVkIGJ5IHBhZ2VfdGFibGVf
Y2hlY2tfcHVkX3tzZXQsY2xlYXJ9LiBTaW5jZSBjbGVhcnMNCj4gKyAqIGFuZCBzZXRzIHRvIHBh
Z2UgdGFibGUgZW50cmllcyBhdCBhbnkgbGV2ZWwgYXJlIGRvbmUgdGhyb3VnaA0KPiArICogcGFn
ZV90YWJsZV9jaGVja19wdGVfe3NldCxjbGVhcn0sIHByb3ZpZGUgc3R1YiBpbXBsZW1lbnRhdGlv
bi4NCj4gKyAqLw0KPiArI2lmbmRlZiBwdWRfcGZuDQo+ICsjZGVmaW5lIHB1ZF9wZm4gcHVkX3Bm
bg0KPiArc3RhdGljIGlubGluZSBpbnQgcHVkX3BmbihwdWRfdCBwdWQpDQo+ICt7DQo+ICsJV0FS
Tl9PTkNFKDEsICJwdWQ6IHBsYXRmb3JtIGRvZXMgbm90IHVzZSBwdWQgZW50cmllcyBkaXJlY3Rs
eSIpOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gICAjZW5kaWYgLyog
X19BU1NFTUJMWV9fICovDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxF
X0ggKi8NCg==
