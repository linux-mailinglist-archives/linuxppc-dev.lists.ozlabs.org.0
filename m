Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA865F4205
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 13:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhbFL0CG9z3bjN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 22:33:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=4ll7vDv4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.74; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=4ll7vDv4;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120074.outbound.protection.outlook.com [40.107.12.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhbDK04MGz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:33:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0of++qeltmqz9YZmprnSk121Wp8m93g87SL3r5TRyE5bJqVi+RcNofgDDgjd0d6Jgf3wLY1jHWXDVhDzTMK46R59IbZVxbBmdiKpI5JL3xrq1hw1rZ0MWZAZ4Ndh5IhsWaaJ7xi+OA3JIbB7UhJ9ieKUKDls2AcID59+EHmWYjlqYU1eRQQh5w3vg0eT0OtUVmOXKHatUIU0JF6PTbbHhzn1EKV/aYalfGnpGHzXqkN1ZeZOHXogA6jDsjFxdZ5WKy+3YMIYUk7MXsqALI8/59tEr4KfhR6TjAI2nS9/ju8+PrE0i7pYDbkHkDWYY5AzTmvRsQ9ahV6CoSAy9AsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvjMvken60RcYLNcC7e72f96z38tpnU+zds6+ym+/LI=;
 b=m361r7mLAOmKlwwwxyKMHZFEniqrAtwwu+3lRmXjMvtOOHMc+mP18DdwSS0noShwYlSReFqkq+kCe6/hKVKrfEu60sdlEZhsZj2UnYWZs68D5fNr7iNfCH5X6P8QawVMZtM2ABUBO+eak+kbsgBVjqFF1kBuFlKSzwV5J7EdmzyWBv+M0r+miL/A9u+dJlrVD7bO9ZQ9Cer2QgZwonq02prOiPILlUWRXCNdXjkRWtbeCt8sdznGztgXjIWkYU67Qv1rbwVzvtdnUAUp2/aSmkYSXacFhnEmxYSD+hLfWEMXZyn/TPKvREs0EPPrB+ErdTeoIy+11AJpe5W4u2l7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvjMvken60RcYLNcC7e72f96z38tpnU+zds6+ym+/LI=;
 b=4ll7vDv4EO4LXCMsjU9eRZl6SqMYxjJfV9RRgLbV1XJsU7npf2cyZx8pYTsZkRJRJutvq4wTVgJMExF8cxmZB0ifWfx+hjMhkLxrpIFaBwGPvP3p7EAFZ02w4jwRufiUGrsZrGjQniZkPCdQOGVvZwxQFeh+NmW8Yu8lUmkpE7C5SxcfXhLJiM+yKifrx3LAxTUMQe0xs0CRPUcllESvm36dCqVC6RHA+eSzJLsuMssI2DRSD4qTx/fO/6Scyd0Mzp+SXZ4ZtywFzEaL7n5GEHJsnioNz7qAaNCm5BwMt9WJEWr2RipN5I39/cJTYgBWMmjeJIGHNklKb34S+FHHHw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2899.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:38::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 11:32:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 11:32:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 1/3] powerpc/32: Implement HAVE_CONTEXT_TRACKING_USER
 support
Thread-Topic: [RFC PATCH 1/3] powerpc/32: Implement HAVE_CONTEXT_TRACKING_USER
 support
Thread-Index: AQHY17s07MqlDE+Z0kSgcKJJjKvjD63+GpKA
Date: Tue, 4 Oct 2022 11:32:43 +0000
Message-ID: <c3f87f7b-c4f9-eca0-a8dd-acc6e7e9f02b@csgroup.eu>
References: <20221004063306.511154-1-npiggin@gmail.com>
 <20221004063306.511154-2-npiggin@gmail.com>
In-Reply-To: <20221004063306.511154-2-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2899:EE_
x-ms-office365-filtering-correlation-id: b89b2898-29f8-4336-829c-08daa5fc278a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xI9mfRpTDo0d/BCNSRTZdUDVO4PVcvlnYcWbMse9/16FVEq2SPZnGqx4zIs3fw8TcpqJmY87ghZ3L7/WeQUxLM1SpA1YErcrlydcB5ZGT0/ImhBezEb/X9R5FqOJqfKQ8ujuIcLkjkrMi53VEoKfVFYWRV1QDrGz3B5Al9RE0lfQBeUk57IgI/AE+HSCyV82/h4SE2uGEssPw6BhJtM7zpW6wjdVcjlCCflboJkh6pSb3m2FCYVGPIH8Pidp5OIktW1gD+gyN8j3dy6bq7wJjb3GAK6/BW/XM+iMe4kiHuFhQeLNAnzUSrUUVFo36vg9QTfOWPoziyRGoXBTnwFFe/PzB2Y+/XHFYmUcF6Om/6GGykR8AmDXi+ewmFNKXs84f6vI9cln9+Aw/9LM8jMitjWQhARAZp7338KFmuGFt60JKKS85ibii8nBQl77Mk4C6wBTsgL9vX9+QCDAyBTe4jCLvalXZkMsOhr/cWJJkKtSf2OiaqQtSVevAlpl22VVnbgCuNT2YuKvLgxkH8dHCS2j13wNVZGW4k6ypm0LRM3VeOUWPjWv2qFpssMBPApqF0QxfWZxHskpfIpFuoTWZHjPjj2gMx8Xzm9xeKfTccX0PChHfAeatm4oDpSL9c1M5G3/+MeA9JA4Cx7jc0VXhQgXqkw2EOC+/3z9MZhnynn15H2v5VS7FeYKJl50weZ7YTWQS3kVSU0NaXXk6BEM60MsfctSYgfYGNxIj0XmGWkTXOfiisLIFDDlCBRvo+GD4Oz/nJxOEQDYZQBYmakc1kGaYy4RGMO3pnCDey5Ke1jcnljC+FEoTqRJPNO+6yugC5ONa2Kahemw6bEGcCibLw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(366004)(396003)(346002)(451199015)(83380400001)(26005)(6512007)(6506007)(2616005)(186003)(478600001)(31686004)(66574015)(6486002)(8936002)(41300700001)(86362001)(44832011)(38070700005)(110136005)(2906002)(71200400001)(36756003)(122000001)(316002)(31696002)(5660300002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(38100700002)(8676002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aDB3bTRiWlhhZkpPN2ZldnR4K2N6S0IrRjljREpKcDNBcUxtdkt6U3Q1aW5F?=
 =?utf-8?B?NlFkK1RyMEJKTmw3MDJsU0syR3NWN2tZSXlzRDNFQW1DV3JacjlvZGhwMnVD?=
 =?utf-8?B?QjhsMjRaSVNrVHRkM01TK1JjYUR2eWFGY3dHWW1abW9TMlZHbmk5VkdwMmI2?=
 =?utf-8?B?c3k3WENTWnBNOFZoKytlWXFveGY5bTR2VFNDMHlDRnNoMS9wbFlIUU5qeTUr?=
 =?utf-8?B?V3NOVGxaQy9VdDFCRExmTHZSWjRYTVZVWnFKNitIM0FCRTJwZHg0Z09jc3N2?=
 =?utf-8?B?VjBIUHhjVE5TTFZWSndyc2JGM0hOVzBiOTkzVE94aU40VEZaVGEzNEN6Yy9H?=
 =?utf-8?B?dUNnWGpWdGdhdENBd2VVL2wrL1A5UWxBTDVKaWR1MEZkU045SWJqYTRKenZt?=
 =?utf-8?B?Q2YxNGZDUWI5aHdNWjkvQ28zQk1NdEl3bEFJTktHUDUzTElRbUE5a0tPS2Y5?=
 =?utf-8?B?OVREcFluZzJCVFArMHJjVS9VTDdzbk9YcHpLUVZiSllaZ3QrVU9yUDNubXdD?=
 =?utf-8?B?YmFzQWR0Uk1VUDg5RWxTTGtOREd5S2JzUkRubnh3MGkvT29PSTdqd2pMNVNN?=
 =?utf-8?B?UG9aeDN3SnlyOVRBbDZCdkNlemY4MHFOWDRQVXF1enBqVitLM2Q4WUc1K0ZV?=
 =?utf-8?B?MkgzeFJja3R1UHFiRml1N2NvZitJa0pVSWZqVDVNYjFEbCswVDc4a0xTMysv?=
 =?utf-8?B?a1NOalhLU3k1a04vL0FpZFlTYVY4WXNzZHlzbDF3OWx0ZVFDSm9qRGVCMHAx?=
 =?utf-8?B?NTNySVhvcDBETlBRYVBlaW9nZXQ1aGhtYUpSZGdyM3dzU1lGdWlOQ1NIbW1L?=
 =?utf-8?B?MnJyTE03ZjdSSzF0K2tZN0hvbWFpa2ZBNGFzL3o2bndnNEJHRHQxQjFCT0lJ?=
 =?utf-8?B?NTZkK2c4MjBuWHc5TWNrcFdkR3BOdEhRVGRUWXFzU1hDa012QkR2SDNZTUw4?=
 =?utf-8?B?ZTlZUWFKaEZBN0NWUVd0QjNsakpMbXh3eDlXOTA0MXkxQmdUdHlmWGhCQ3VE?=
 =?utf-8?B?VjFlV3BvMFpjMlNWOXQ3ejBSQjFZdkNNSEJTYjdHWmJwSHVWQWcxdnZ1MUpv?=
 =?utf-8?B?eURhRXF5QXl0NXQvV0tYQW5MSUlKbWlFT1VQd1ZlMElvaUhCOVlmcEVTZEdR?=
 =?utf-8?B?d2RCcUM5UUJWU2R3dVlmcWJ1R0xZd2JXeVVCSHNaRzBLSUl3UW9uaXB6TGQr?=
 =?utf-8?B?OTlEeXhjZFNMWDR3d09nVVFtWXpNR3JQZDgrb2xYOUllV3hpbzhXT0dQSHhk?=
 =?utf-8?B?UERHNGRFejNiNHM5a0tZbVhHeEU4L291TlE3dGtXZkpXZGFBNkp5Rkk1OXh1?=
 =?utf-8?B?S0pFUjJlWnNNSzhoWEV4NHM1bGxhWTA0RkxwOW5tczdkRTBacTR5MkJYMjE5?=
 =?utf-8?B?S0ZISVQyWnl3VWNhd3Uxc3NqMjNTejYrRmJQS2p3N3ExclB0K1hwelo4T3Fl?=
 =?utf-8?B?eDloNUlDbGtJTStCOGJ5di9TT3BseGl3UXRUakJQQXE2STJJcmdaN0ozbXVr?=
 =?utf-8?B?cHNFM0RHRkRReHNueHBhQVA0amJMQVptTlNMdUxHcEIvY0FuOVd4Z2VzNGdn?=
 =?utf-8?B?MWxjOGNGdmFvQVpDRFM0eVZwbVlmOGVlbzdXQnlzNFp0QzJBTlhkZ3lDMG5z?=
 =?utf-8?B?RWdLeDAyWnZpNkZudDBIOFpuTFVRdTBhRUVwcm5vSlg4bVFqOE5VamhHSVRv?=
 =?utf-8?B?WHkrS1krUG9DbHc0NXpOaWdtekNKZHNQWXJJUFFpVWt6eGxmNExKVkJaNS9Y?=
 =?utf-8?B?NnNpZGN4NENpYlhneEJYN2p4U3ZhRnZGai9pcHJFTXhvMFJveFQvajV0SkxM?=
 =?utf-8?B?aWg2aVF2ZkZKemE0L2E4K2FEaGlPajFhZ2FlT0h2ZVlPRTNBb1FOVE1jblVt?=
 =?utf-8?B?WWRISlpnYnF2V1Zoc2dRTXg4WlMwbUY2a3diUlNQMWYrY1pyaG05emFsYmFN?=
 =?utf-8?B?VEhDTS9VcXdKOTZDK1JrbkFuNmw4bUo3dzc2RmJyNUFnVTRmSVh4VEMxZVh4?=
 =?utf-8?B?ZDdXNmZzeDRBTVlxdHI3dWxEYTU4UmJ6STVyVlVEUzdjN2pOYnY0MmN6Y0pR?=
 =?utf-8?B?bDkzYmF4RVEwYmNVVUNYZWpnZWRqbWRBRmRSanEzdTlCYTlsN0RJKzlMdk9Y?=
 =?utf-8?B?QXdveC9QUUJLb3VQeGM4aGFUQUpyYjREK0tCRDd2SVo2TXBscU52YkJpTjhU?=
 =?utf-8?Q?wvLTUFJssKSD/kNq6eL2HiA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D6FE641F5C91C4A989DFCD1BEF19FC2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b89b2898-29f8-4336-829c-08daa5fc278a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 11:32:43.9764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQASqZck3lApZ8kHcYK+6fI16xJqungkxEXDXnwufEhoGJ3Qkhl0keXnmnJn7N4NRl1gtYoMMqpACaT5rCf1mRg36rPUx0FigTkC7R54NG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2899
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

DQoNCkxlIDA0LzEwLzIwMjIgw6AgMDg6MzMsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBDb250ZXh0IHRyYWNraW5nIGludm9sdmVzIHRyYWNraW5nIHVzZXIsIGtlcm5lbCwgZ3Vlc3Qg
c3dpdGNoZXMuIFRoaXMNCj4gZW5hYmxlcyBleGlzdGluZyBjb250ZXh0IHRyYWNraW5nIGNvZGUg
Zm9yIGludGVycnVwdCBlbnRyeSBvbiAzMi1iaXQuDQo+IEtWTSBhbmQgaW50ZXJydXB0IGV4aXQg
YWxyZWFkeSBoYXMgY29udGV4dCB0cmFja2luZyBjYWxscy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93
ZXJwYy9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2ludGVycnVwdC5oIHwgMjEgKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4g
aW5kZXggODFjOWY4OTVkNjkwLi5mNjY3Mjc5ZWM3NGMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IEBAIC0yMDQsNyAr
MjA0LDcgQEAgY29uZmlnIFBQQw0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX1NFQ0NPTVBfRklMVEVS
DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfVFJBQ0VIT09LDQo+ICAgCXNlbGVjdCBIQVZFX0FTTV9N
T0RWRVJTSU9OUw0KPiAtCXNlbGVjdCBIQVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNFUgkJaWYgUFBD
NjQNCj4gKwlzZWxlY3QgSEFWRV9DT05URVhUX1RSQUNLSU5HX1VTRVINCj4gICAJc2VsZWN0IEhB
VkVfQ19SRUNPUkRNQ09VTlQNCj4gICAJc2VsZWN0IEhBVkVfREVCVUdfS01FTUxFQUsNCj4gICAJ
c2VsZWN0IEhBVkVfREVCVUdfU1RBQ0tPVkVSRkxPVw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lu
dGVycnVwdC5oDQo+IGluZGV4IDQ3NDViYjk5OThiZC4uODg2MGEyNDZkNTFhIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0LmgNCj4gKysrIGIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oDQo+IEBAIC04NSw2ICs4NSw4IEBAIGRvIHsJ
CQkJCQkJCQlcDQo+ICAgCSAgICAodXNlcl9tb2RlKHJlZ3MpIHx8IChUUkFQKHJlZ3MpICE9IElO
VEVSUlVQVF9QUk9HUkFNKSkpCVwNCj4gICAJCUJVR19PTihjb25kKTsJCQkJCQlcDQo+ICAgfSB3
aGlsZSAoMCkNCj4gKyNlbHNlDQo+ICsjZGVmaW5lIElOVF9TT0ZUX01BU0tfQlVHX09OKHJlZ3Ms
IGNvbmQpDQoNCkhlcmUgeW91IGNhbiBqdXN0IGRyb3AgdGhlIGlmZGVmIENPTkZJR19QUEM2NCBJ
IGd1ZXNzIGluc3RlYWQgb2YgYWRkaW5nIA0KYW4gYWRkaXRpb25hbCBlbXB0eSBtYWNyby4NCg0K
PiAgICNlbmRpZg0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfUFBDX0JPT0szU182NA0KPiBAQCAt
MTUyLDE5ICsxNTQsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYm9va2VfcmVzdG9yZV9kYmNyMCh2
b2lkKQ0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnRlcnJ1cHRfZW50ZXJfcHJlcGFyZShzdHJ1
Y3QgcHRfcmVncyAqcmVncykNCj4gICB7DQo+ICAgI2lmZGVmIENPTkZJR19QUEMzMg0KPiAtCWlm
ICghYXJjaF9pcnFfZGlzYWJsZWRfcmVncyhyZWdzKSkNCj4gLQkJdHJhY2VfaGFyZGlycXNfb2Zm
KCk7DQo+IC0NCj4gLQlpZiAodXNlcl9tb2RlKHJlZ3MpKQ0KPiAtCQlrdWFwX2xvY2soKTsNCj4g
LQllbHNlDQo+IC0JCWt1YXBfc2F2ZV9hbmRfbG9jayhyZWdzKTsNCj4gLQ0KPiAtCWlmICh1c2Vy
X21vZGUocmVncykpDQo+IC0JCWFjY291bnRfY3B1X3VzZXJfZW50cnkoKTsNCj4gLSNlbmRpZg0K
PiAtDQo+IC0jaWZkZWYgQ09ORklHX1BQQzY0DQo+ICsJYm9vbCB0cmFjZV9lbmFibGUgPSAhYXJj
aF9pcnFfZGlzYWJsZWRfcmVncyhyZWdzKTsNCg0Kbml0OiBZb3UgY291bGQgYmUgcHV0IHRoaXMg
YXMgYW4gI2Vsc2UgdG8gdGhlIGV4aXN0aW5nICNpZmRlZiBDT05GSUdfUFBDNjQNCg0KPiArI2Vs
c2UNCj4gICAJYm9vbCB0cmFjZV9lbmFibGUgPSBmYWxzZTsNCj4gICANCj4gICAJaWYgKElTX0VO
QUJMRUQoQ09ORklHX1RSQUNFX0lSUUZMQUdTKSkgew0KPiBAQCAtMTg4LDggKzE3OSw5IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBpbnRlcnJ1cHRfZW50ZXJfcHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAq
cmVncykNCj4gICAJfSBlbHNlIHsNCj4gICAJCV9faGFyZF9SSV9lbmFibGUoKTsNCj4gICAJfQ0K
PiArCS8qIE9ubHkgY2FsbCB0cmFjZV9oYXJkaXJxc19vZmYgd2hlbiBSST0xLCBpdCBjYW4gY2F1
c2UgU0xCIGZhdWx0cyAqLw0KPiArI2VuZGlmDQo+ICAgDQo+IC0JLyogRG8gdGhpcyB3aGVuIFJJ
PTEgYmVjYXVzZSBpdCBjYW4gY2F1c2UgU0xCIGZhdWx0cyAqLw0KPiAgIAlpZiAodHJhY2VfZW5h
YmxlKQ0KPiAgIAkJdHJhY2VfaGFyZGlycXNfb2ZmKCk7DQo+ICAgDQo+IEBAIC0yMTUsNyArMjA3
LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGludGVycnVwdF9lbnRlcl9wcmVwYXJlKHN0cnVjdCBw
dF9yZWdzICpyZWdzKQ0KPiAgIAl9DQo+ICAgCUlOVF9TT0ZUX01BU0tfQlVHX09OKHJlZ3MsICFh
cmNoX2lycV9kaXNhYmxlZF9yZWdzKHJlZ3MpICYmDQo+ICAgCQkJCSAgICEocmVncy0+bXNyICYg
TVNSX0VFKSk7DQo+IC0jZW5kaWYNCj4gICANCj4gICAJYm9va2VfcmVzdG9yZV9kYmNyMCgpOw0K
PiAgIH0=
