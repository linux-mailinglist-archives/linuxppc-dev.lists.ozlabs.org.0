Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F581B44D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:49:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nfMpvJJU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnHk6mRxz3dVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:49:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nfMpvJJU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwnD70RdWz3wFg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:46:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U39Htl6H8t7OpZi0jEVAfeqLL81XB0DmZ2EwvgyTJljJLLudj2yhplia0SBNej0wT/BcN8PS/ipTHsHveJd9hgCA9TtQxUvtXsHn/qeSlAcN/FLoCAohiSZki1CdJClAeVqi+PZHZL7UQjyeyenxjuU0K30S6swuHj7aq8cDaA6OqY4NIQmaB2NSSPNo+iL7N19LB+2mtfGOorUCXUuuVD3SSNl1YYAZYkwW4ToWoGxens7c7ZyPHbTfgQVFSGErT1q7aPTZ1kwbUmmn3pN6hLUVbbvLjZ7O2dVKqaFeW6iTXRbf1SUjNVXxB5u4x71CJ+JRFERABhq6BjqZnLlrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKKOmbCh9WmAyJ4ryetIBhoLb9F2IyiJ56LRqnIpqtE=;
 b=SjHBSazG3fXyq3NzVARal38Tt7j6bilsIczO6VwlYZcnsfBbNhF/HVREz9oU7K8IE2IdI/JolqPFF4M1cT0nELDDqKIZaNE6PKW3HIIEO+1qRiu4tE8xyh5CHsneDBwea7BKU7Tw51RXI5I1oX7ds+HL4UfCXBIDtES90bUPhPelOMuFkA57HCRdAznEyUAzDmPosBg5kyNz9NcCtp4I3+pXrc83zhQF4BzRp9e/jRoeJEBD0go/+pC+PdecR7+UrxA7vRAN6WAAvSNHLTTblfm84auzZBHcnAoDusC3jIJIQAl4PooLEN4NkcKFCr2KUcb+4JI2oCs+mLORJbY6Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKKOmbCh9WmAyJ4ryetIBhoLb9F2IyiJ56LRqnIpqtE=;
 b=nfMpvJJU8yoGnggrN0aXd57Hz1y48NzCvrakq5Zn4G8vs7WROpEdCf9iNHpva0WtiY3nvS3kxgxGGGJH6Dg/s+r8KrZGk5nZbuBruZyhqTp7+Kq7XcvxIhE258AGyhzzUzITlXnA3JHM1zP6P1k+yFhRS8O1IGVdtVKM15AAPMBgr2axMJFAvkbP8kFrQSvMre2PYtoKjhubz3DAYHdOGbuVmFoFzY8JImtFVDRe16bCme9/D16p1jCp+UiWtQt30TRlLNpvNVKqRPumYlpewFEjZIogXNucC2bPhwaOMxTgv0KiExAY90vx9WR/h8vlgQj+YGN6K14h0PyVtEi01A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2096.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 10:46:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 10:46:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 6/9] powerpc/ftrace: Update and move function profile
 instructions out-of-line
Thread-Topic: [RFC PATCH 6/9] powerpc/ftrace: Update and move function profile
 instructions out-of-line
Thread-Index: AQHaKfSSFFbB72zM4keIX1bFln/D9rCzoeSA
Date: Thu, 21 Dec 2023 10:46:08 +0000
Message-ID: <e2e467a3-7283-4f22-8cd9-2d1875f60e92@csgroup.eu>
References: <cover.1702045299.git.naveen@kernel.org>
 <39363eb6b1857f26f9fa51808ad48b0121899b84.1702045299.git.naveen@kernel.org>
In-Reply-To:  <39363eb6b1857f26f9fa51808ad48b0121899b84.1702045299.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2096:EE_
x-ms-office365-filtering-correlation-id: cbdb66f1-85ea-451e-5c80-08dc02120a07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4DKZljucAPEHvjJx0aT4vgs0cjUXLfRdTSaFinqWjv5KVz0dKhL8bFfG/FPhJncUATJq0p1IDU4imGaIeeG9sBdIncHECUaqm8jMJSySjMeBLgCKz1rygIDAgM9K8VSc8gn6U8S+nR0HK7xnyI9LGKUgONelUzobThnfVBwwPrsB972NTt1VYO7GrJMdkmSXyhFYJ3hh2Aadrtxhi+8ajgTOn0UeCAPlkHxZ6FKLQyfte+SQHedxflZWgaPlejrDfsIXiP8WM2nCAsP+RciuMBEjXehQONe7Zk1O0HB64jPeMUP4y9PfZOepRUK6lZibAHC15m0rzPkwUl+XvntSyzbwr2PtT++9jf98YESd1N6qw3lZ9Q6CNyzoXKwCS17HIM70gK6RjkWsjrHGJktzIJJM4bqTXJUQ5XfvJ6aXiZWtuWjHT/pm9GdxryYRtSn2IlGzfcw8t7wXwVmx2GKTkYft+pXuIy4GS/7CjQ2QGyoPPRF3XXVjaA3UEEtDHRWv8vxAu0E1Z9eAdkq6nA76LuLU4tgtj/JDdYN4BaSEDMymCbsP7FVYQiwJIl28ng8XZvaIbVoLMb8FP7FCd1XE8RTJkf2DBt9JofU6bCok+bbLdftCMsdegOH6kRwtq3pD5w36hITcmHCDLPzU+6fQ60hUtGk9Mcs9qQtykTkI7CIEphJoSGu1FDV5SVUkNxcD
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(15650500001)(7416002)(2906002)(44832011)(86362001)(31696002)(122000001)(38100700002)(41300700001)(66556008)(91956017)(110136005)(66946007)(76116006)(64756008)(66446008)(66476007)(2616005)(54906003)(26005)(66574015)(71200400001)(316002)(36756003)(6512007)(6506007)(6486002)(31686004)(478600001)(38070700009)(8936002)(8676002)(83380400001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aGRMaW94dGcvNjZCQzBPS3JhZlFHbDY3MmIwZU9RRHAxcHpkSG5JUzBCVFVX?=
 =?utf-8?B?bS9KYUkxRW1jVkc0QXhQVkFxU1BHeUNmQmhCbnBmRU1DdTV6bEg2Vnh1WDE3?=
 =?utf-8?B?VnZSUWhWK0l0RzU3eFM3MC84OVV0WDdmNVgyb1JMOVhpR05TMFQ3Y2tiaUtK?=
 =?utf-8?B?LzNJSlNDejRmOUZKYnA4bzYySUtrSDJRU0c4Z2NBYTY5VndpTHBzdStBcURJ?=
 =?utf-8?B?T0IxV3hzMFFPUWo4dEEyU05TRkJSUkRtMXgxbXpvMDM0SXhWdU9oODV1Y1Mz?=
 =?utf-8?B?NGZTaGxTUHBCMWYwWWdpbHN6SkJQdkFLcC9kMU16RGdVTDFsQ3c5aG1ub2Zh?=
 =?utf-8?B?RkVKbDZEUm4yZFJGYXFQUzFoa282c09WK0NJclFHMFBhMjRVWTVlMVprb3k4?=
 =?utf-8?B?WFJwbWtsNWd2TzlvSVVOaVh0bUlVdG5QakZMM1k2TWQ3L2c2NlM0c09EVzUx?=
 =?utf-8?B?dWNxT255anYxZDl3VzVUdWlmRWdmeUhrN05tNlJBeENmeVpGallBUk9oczBR?=
 =?utf-8?B?UGdrK1kvTEZhOTYyLzhtS3dIL0V6cDFGZ293dUZlMXFJcmNwcWRxSWU5VHk3?=
 =?utf-8?B?bEpHU1NHbGhUVGZtNDY5Zms2dkxsUkRSeUpueXhuOUtFMmVlSnVBUmZaNzJR?=
 =?utf-8?B?SWFsOXpGakRQMUFhcW5DNXlkczFKT0QydHVxK3JJRzFETWZZNXdvcGV5RCt3?=
 =?utf-8?B?dlBadWZuM2lseWtUaWx4TS8wbyttUXZyT2V6Z0NBdkpia1N5Vkx1WXZEQ20w?=
 =?utf-8?B?Qk1Wcy9XQS90aUpDUHpDdWNma1l3VmF2OE5kbDFjNlFsemtCSHZ5RjBud3E3?=
 =?utf-8?B?SlcvYnBMVVRYU1NwTWkrVm9VSExuVFVkanZZU0txWXIxSUlnM3pmN25tRmdn?=
 =?utf-8?B?enRXelEreWlvZmtDWDMzM1dJTlgvcDBRTmNyaHFyTlcydHVZZ0RHQzBZOW4w?=
 =?utf-8?B?MlJkYW1pYVRnU08rYjM2bjZGR21YbWJVbXNkZ0lzcHJmQitGcGVJZ1Nmdjl6?=
 =?utf-8?B?eU52VGQ2cTlLTzFJc3hKTXpMWTVsV0VGM2t4UndwbXV2RTRyb3VnSWNCSXEr?=
 =?utf-8?B?RlZaUS9PK2hwOC9rbHpvUUlPb2Q2QWY2RDBuS01Seml3M0N2MDVSL1k0YXZp?=
 =?utf-8?B?clZlSUJLa05pQnBsVndlR3N5NVA2Z1c4ckZrS3F1MnRiSnBqcXJZblVDOGRZ?=
 =?utf-8?B?UGttV3R1OU1FcW1yUU8vR0Q2TzJMalZPdmMrTUFtWEI4blA2dzRVV3V0TjJK?=
 =?utf-8?B?dG1SZzNXdTdLMWZGQnE4b2JZNXJmYjVwellDYUdrdENhcHRveGQ1c011U0dI?=
 =?utf-8?B?ZlJtZFNqdE5KRzRxYVBtYzY2ckV1ald5ZkpLb2k4T2krUXR5QU1nMjU3WGxi?=
 =?utf-8?B?UldhOXloQ0xrQS9PaVNhVzM0bHNmd2dXQzYvQUhSZEE0ZEJsSTBDdFNNNjdM?=
 =?utf-8?B?OG1UZ2wzMUo5V3IyV2pSaWljd05Fa1p0c0Y1WEtZaStEdUZoS0NsS3owUTh5?=
 =?utf-8?B?bGJWV2t4ZU16VDhxd05UeThkaGxHayt6VzRKaFdOV2c5bXZYcDZrZ2NsMjVE?=
 =?utf-8?B?d3dxbFlEaFdXa0tOY3dKZUJrbzJIbUFvZWFnVTFxOXB6SWpQdnFqa2RWTlZL?=
 =?utf-8?B?S0FIbEx0U0wvYXJvaXNiNUhDUnozOGdKMVlobHdocU12UnhBTDRUVnpyT1d5?=
 =?utf-8?B?eHJIdlpxQkJyZHFZVC9oWkVpdEE3MGpEOEpaSExlc29YUXIxRy9qbk1EVmdL?=
 =?utf-8?B?VVZvQTQ1MmNNMEQ1MW9oUGVtVDYvalNUbWtaYjZOakhLTTZmd0NIM05lS1Q5?=
 =?utf-8?B?MGNHaHJOVDNwYTg3QkIzYW5UWk4zTHlYU2M0UDdXbGNMV0hqWEo5d1A5bjUr?=
 =?utf-8?B?NjJtclFBdmhrNDBZOXcrV2lTWUVTLzBiSElBaU1ISndsNTU4SlYwcjliTEdu?=
 =?utf-8?B?Z1pKTGF6Tm1RdlhqcHgrT3F1eE1QWE5ZRk0xVFZBMnpYOCt6TFphc2Jac05j?=
 =?utf-8?B?LzNid2hGNFh6TTM4bTBSZHpBRmJXTERHbUpxRGtFdGtmTFJkekp2RVdESzFJ?=
 =?utf-8?B?NHo1aVVyYjU0ZjJ0SjJqVFovV2h4R3BTYWRReGQ2RjRJRHJ6MUJEWGMwRnMw?=
 =?utf-8?Q?zzaS0KxSQzHVWJFGGoYfVCd2L?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15325E9B79CB67448DA0FA70A17DD5EA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdb66f1-85ea-451e-5c80-08dc02120a07
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 10:46:08.0457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AU8gEIvVigCwCSHeAhDW9sfZ8JRasBLCLZcvCXtRYll7TNGhvzllkB7mWRKs0KMziyqPSB5e0kHfBox5bBktmj4/STkEAZxz4syIJh80pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2096
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzEyLzIwMjMgw6AgMTc6MzAsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBG
dW5jdGlvbiBwcm9maWxlIHNlcXVlbmNlIG9uIHBvd2VycGMgaW5jbHVkZXMgdHdvIGluc3RydWN0
aW9ucyBhdCB0aGUNCj4gYmVnaW5uaW5nIG9mIGVhY2ggZnVuY3Rpb246DQo+IA0KPiAJbWZscgly
MA0KPiAJYmwJZnRyYWNlX2NhbGxlcg0KPiANCj4gVGhlIGNhbGwgdG8gZnRyYWNlX2NhbGxlcigp
IGdldHMgbm9wJ2VkIG91dCBkdXJpbmcga2VybmVsIGJvb3QgYW5kIGlzDQo+IHBhdGNoZWQgaW4g
d2hlbiBmdHJhY2UgaXMgZW5hYmxlZC4NCj4gDQo+IFRoZXJlIGFyZSB0d28gaXNzdWVzIHdpdGgg
dGhpczoNCj4gMS4gVGhlICdtZmxyIHIwJyBpbnN0cnVjdGlvbiBhdCB0aGUgYmVnaW5uaW5nIG9m
IGVhY2ggZnVuY3Rpb24gcmVtYWlucw0KPiAgICAgZXZlbiB0aG91Z2ggZnRyYWNlIGlzIG5vdCBi
ZWluZyB1c2VkLg0KPiAyLiBXaGVuIGZ0cmFjZSBpcyBhY3RpdmF0ZWQsIHdlIHJldHVybiBmcm9t
IGZ0cmFjZV9jYWxsZXIoKSB3aXRoIGEgYmN0cg0KPiAgICAgaW5zdHJ1Y3Rpb24gdG8gcHJlc2Vy
dmUgcjAgYW5kIExSLCByZXN1bHRpbmcgaW4gdGhlIGxpbmsgc3RhY2sNCj4gICAgIGJlY29taW5n
IHVuYmFsYW5jZWQuDQo+IA0KPiBUbyBhZGRyZXNzICgxKSwgd2UgaGF2ZSB0cmllZCB0byBub3An
b3V0IHRoZSAnbWZsciByMCcgaW5zdHJ1Y3Rpb24gd2hlbg0KPiBub3AnaW5nIG91dCB0aGUgY2Fs
bCB0byBmdHJhY2VfY2FsbGVyKCkgYW5kIHJlc3RvcmluZyBpdCB3aGVuIGVuYWJsaW5nDQo+IGZ0
cmFjZS4gQnV0LCB0aGF0IHJlcXVpcmVkIGFkZGl0aW9uYWwgc3luY2hyb25pemF0aW9uIHNsb3dp
bmcgZG93bg0KPiBmdHJhY2UgYWN0aXZhdGlvbi4gSXQgYWxzbyBsZWZ0IGFuIGFkZGl0aW9uYWwg
bm9wIGluc3RydWN0aW9uIGF0IHRoZQ0KPiBiZWdpbm5pbmcgb2YgZWFjaCBmdW5jdGlvbiBhbmQg
dGhhdCB3YXNuJ3QgZGVzaXJhYmxlIG9uIDMyLWJpdCBwb3dlcnBjLg0KPiANCj4gSW5zdGVhZCBv
ZiB0aGF0LCBtb3ZlIHRoZSBmdW5jdGlvbiBwcm9maWxlIHNlcXVlbmNlIG91dC1vZi1saW5lIGxl
YXZpbmcNCj4gYSBzaW5nbGUgbm9wIGF0IGZ1bmN0aW9uIGVudHJ5LiBPbiBmdHJhY2UgYWN0aXZh
dGlvbiwgdGhlIG5vcCBpcyBjaGFuZ2VkDQo+IHRvIGFuIHVuY29uZGl0aW9uYWwgYnJhbmNoIHRv
IHRoZSBvdXQtb2YtbGluZSBzZXF1ZW5jZSB0aGF0IGluIHR1cm4NCj4gY2FsbHMgZnRyYWNlX2Nh
bGxlcigpLiBUaGlzIHJlbW92ZXMgdGhlIG5lZWQgZm9yIGNvbXBsZXggc3luY2hyb25pemF0aW9u
DQo+IGR1cmluZyBmdHJhY2UgYWN0aXZhdGlvbiBhbmQgc2ltcGxpZmllcyB0aGUgY29kZS4gTW9y
ZSBpbXBvcnRhbnRseSwgdGhpcw0KPiBpbXByb3ZlcyBwZXJmb3JtYW5jZSBvZiB0aGUga2VybmVs
IHdoZW4gZnRyYWNlIGlzIG5vdCBpbiB1c2UuDQo+IA0KPiBUbyBhZGRyZXNzICgyKSwgY2hhbmdl
IHRoZSBmdHJhY2UgdHJhbXBvbGluZSB0byByZXR1cm4gd2l0aCBhICdibHInDQo+IGluc3RydWN0
aW9uIHdpdGggdGhlIG9yaWdpbmFsIHJldHVybiBhZGRyZXNzIGluIHIwIGludGFjdC4gVGhlbiwg
YW4NCj4gYWRkaXRpb25hbCAnbXRsciByMCcgaW5zdHJ1Y3Rpb24gaW4gdGhlIGZ1bmN0aW9uIHBy
b2ZpbGUgc2VxdWVuY2UgY2FuDQo+IG1vdmUgdGhlIGNvcnJlY3QgcmV0dXJuIGFkZHJlc3MgYmFj
ayB0byBMUi4NCj4gDQo+IFdpdGggdGhlIGFib3ZlIHR3byBjaGFuZ2VzLCB0aGUgZnVuY3Rpb24g
cHJvZmlsZSBzZXF1ZW5jZSBub3cgbG9va3MgbGlrZQ0KPiB0aGUgZm9sbG93aW5nOg0KPiANCj4g
ICBbZnVuYzoJCSMgR0VQIC0tIDY0LWJpdCBwb3dlcnBjLCBvcHRpb25hbA0KPiAJYWRkaXMJcjIs
cjEyLGltbTENCj4gCWFkZGkJcjIscjIsaW1tMl0NCj4gICAgdHJhbXA6DQo+IAltZmxyCXIwDQo+
IAlibAlmdHJhY2VfY2FsbGVyDQo+IAltdGxyCXIwDQo+IAliCWZ1bmMNCj4gCW5vcA0KPiAJW25v
cF0JIyA2NC1iaXQgcG93ZXJwYyBvbmx5DQo+ICAgIGZ1bmM6CQkjIExFUA0KPiAJbm9wDQo+IA0K
PiBPbiAzMi1iaXQgcG93ZXJwYywgdGhlIGZ0cmFjZSBtY291bnQgdHJhbXBvbGluZSBpcyBub3cg
Y29tcGxldGVseQ0KPiBvdXRzaWRlIHRoZSBmdW5jdGlvbi4gVGhpcyBpcyBhbHNvIHRoZSBjYXNl
IG9uIDY0LWJpdCBwb3dlcnBjIGZvcg0KPiBmdW5jdGlvbnMgdGhhdCBkbyBub3QgbmVlZCBhIEdF
UC4gSG93ZXZlciwgZm9yIGZ1bmN0aW9ucyB0aGF0IG5lZWQgYQ0KPiBHRVAsIHRoZSBhZGRpdGlv
bmFsIGluc3RydWN0aW9ucyBhcmUgaW5zZXJ0ZWQgYmV0d2VlbiB0aGUgR0VQIGFuZCB0aGUNCj4g
TEVQLiBTaW5jZSB3ZSBjYW4gb25seSBoYXZlIGEgZml4ZWQgbnVtYmVyIG9mIGluc3RydWN0aW9u
cyBiZXR3ZWVuIEdFUA0KPiBhbmQgTEVQLCB3ZSBjaG9vc2UgdG8gZW1pdCA2IGluc3RydWN0aW9u
cy4gRm91ciBvZiB0aG9zZSBpbnN0cnVjdGlvbnMNCj4gYXJlIHVzZWQgZm9yIHRoZSBmdW5jdGlv
biBwcm9maWxlIHNlcXVlbmNlIGFuZCB0d28gaW5zdHJ1Y3Rpb24gc2xvdHMgYXJlDQo+IHJlc2Vy
dmVkIGZvciBpbXBsZW1lbnRpbmcgc3VwcG9ydCBmb3IgRFlOQU1JQ19GVFJBQ0VfV0lUSF9DQUxM
X09QUy4gT24NCj4gMzItYml0IHBvd2VycGMsIHdlIGVtaXQgb25lIGFkZGl0aW9uYWwgbm9wIGZv
ciB0aGlzIHB1cnBvc2UgcmVzdWx0aW5nIGluDQo+IGEgdG90YWwgb2YgNSBub3BzIGJlZm9yZSBm
dW5jdGlvbiBlbnRyeS4NCj4gDQo+IFRvIGVuYWJsZSBmdHJhY2UsIHRoZSBub3AgYXQgZnVuY3Rp
b24gZW50cnkgaXMgY2hhbmdlZCB0byBhbg0KPiB1bmNvbmRpdGlvbmFsIGJyYW5jaCB0byAndHJh
bXAnLiBUaGUgY2FsbCB0byBmdHJhY2VfY2FsbGVyKCkgbWF5IGJlDQo+IHVwZGF0ZWQgdG8gZnRy
YWNlX3JlZ3NfY2FsbGVyKCkgZGVwZW5kaW5nIG9uIHRoZSByZWdpc3RlcmVkIGZ0cmFjZSBvcHMu
DQo+IE9uIDY0LWJpdCBwb3dlcnBjLCB3ZSBhZGRpdGlvbmFsbHkgY2hhbmdlIHRoZSBpbnN0cnVj
dGlvbiBhdCAndHJhbXAnIHRvDQo+ICdtZmxyIHIwJyBmcm9tIGFuIHVuY29uZGl0aW9uYWwgYnJh
bmNoIGJhY2sgdG8gZnVuYys0LiBUaGlzIGlzIHNvIHRoYXQNCj4gZnVuY3Rpb25zIGVudGVyZWQg
dGhyb3VnaCB0aGUgR0VQIGNhbiBza2lwIHRoZSBmdW5jdGlvbiBwcm9maWxlIHNlcXVlbmNlDQo+
IHVubGVzcyBmdHJhY2UgaXMgZW5hYmxlZC4NCj4gDQo+IFdpdGggdGhlIGNvbnRleHRfc3dpdGNo
IG1pY3JvYmVuY2htYXJrIG9uIGEgUDkgbWFjaGluZSwgdGhlcmUgaXMgYQ0KPiBwZXJmb3JtYW5j
ZSBpbXByb3ZlbWVudCBvZiB+NiUgd2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIGdvaW5nIGZyb20g
NjUwaw0KPiBjb250ZXh0IHN3aXRjaGVzIHRvIDY5MGsgY29udGV4dCBzd2l0Y2hlcyB3aXRob3V0
IGZ0cmFjZSBlbmFibGVkLiBXaXRoDQo+IGZ0cmFjZSBlbmFibGVkLCB0aGUgcGVyZm9ybWFuY2Ug
d2FzIHNpbWlsYXIgYXQgODZrIGNvbnRleHQgc3dpdGNoZXMuDQoNCldvbmRlcmluZyBob3cgc2ln
bmlmaWNhbnQgdGhhdCBjb250ZXh0X3N3aXRjaCBtaWNvcmJlbmNobWFyayBpcy4NCg0KSSByYW4g
aXQgb24gYm90aCBtcGM4ODUgYW5kIG1wYzgzMjEgYW5kIEknbSBhIGJpdCBwdXp6bGVkIGJ5IHNv
bWUgb2YgdGhlIA0KcmVzdWx0czoNCiMgLi9jb250ZXh0X3N3aXRjaCAtLW5vLWZwDQpVc2luZyB0
aHJlYWRzIHdpdGggeWllbGQgb24gY3B1cyAwLzAgdG91Y2hpbmcgRlA6bm8gYWx0aXZlYzpubyB2
ZWN0b3I6bm8gDQp2ZHNvOm5vDQoNCk9uIDg4NSwgSSBnZXQgdGhlIGZvbGxvd2luZyByZXN1bHRz
IGJlZm9yZSBhbmQgYWZ0ZXIgeW91ciBwYXRjaC4NCg0KQ09ORklHX0ZUUkFDRSBub3Qgc2VsZWN0
ZWQgOiA0NCw5aw0KQ09ORklHX0ZUUkFDRSBzZWxlY3RlZCwgYmVmb3JlIDogMzIsOGsNCkNPTkZJ
R19GVFJBQ0Ugc2VsZWN0ZWQsIGFmdGVyIDogMzMsNmsNCg0KQWxsIHRoaXMgaXMgd2l0aCBDT05G
SUdfSU5JVF9TVEFDS19BTExfWkVSTyB3aGljaCBpcyB0aGUgZGVmYXVsdC4gQnV0IA0Kd2hlbiBJ
IHNlbGVjdCBDT05GSUdfSU5JVF9TVEFDS19OT05FLCB0aGUgQ09ORklHX0ZUUkFDRSBub3Qgc2Vs
ZWN0ZWQgDQpyZXN1bHQgaXMgb25seSAzNCw0Lg0KDQpPbiA4MzIxOg0KDQpDT05GSUdfRlRSQUNF
IG5vdCBzZWxlY3RlZCA6IDEwMCwzaw0KQ09ORklHX0ZUUkFDRSBzZWxlY3RlZCwgYmVmb3JlIDog
NzIsNWsNCkNPTkZJR19GVFJBQ0Ugc2VsZWN0ZWQsIGFmdGVyIDogMTE2aw0KDQpTbyB0aGUgcmVz
dWx0cyBsb29rIG9kZCB0byBtZS4NCg0KPiANCj4gVGhlIGRvd25zaWRlIG9mIHRoaXMgYXBwcm9h
Y2ggaXMgdGhlIGluY3JlYXNlIGluIHZtbGludXggc2l6ZSwNCj4gZXNwZWNpYWxseSBvbiAzMi1i
aXQgcG93ZXJwYy4gV2Ugbm93IGVtaXQgMyBhZGRpdGlvbmFsIGluc3RydWN0aW9ucyBmb3INCj4g
ZWFjaCBmdW5jdGlvbiAoZXhjbHVkaW5nIHRoZSBvbmUgb3IgdHdvIGluc3RydWN0aW9ucyBmb3Ig
c3VwcG9ydGluZw0KPiBEWU5BTUlDX0ZUUkFDRV9XSVRIX0NBTExfT1BTKS4gT24gNjQtYml0IHBv
d2VycGMgd2l0aCB0aGUgY3VycmVudA0KPiBpbXBsZW1lbnRhdGlvbiBvZiAtZnBhdGNoYWJsZS1m
dW5jdGlvbi1lbnRyeSB0aG91Z2gsIHRoaXMgaXMgbm90DQo+IGF2b2lkYWJsZSBzaW5jZSB3ZSBh
cmUgZm9yY2VkIHRvIGVtaXQgNiBpbnN0cnVjdGlvbnMgYmV0d2VlbiB0aGUgR0VQIGFuZA0KPiB0
aGUgTEVQIGV2ZW4gaWYgd2UgYXJlIHRvIG9ubHkgc3VwcG9ydCBEWU5BTUlDX0ZUUkFDRV9XSVRI
X0NBTExfT1BTLg0KDQpUaGUgaW5jcmVhc2UgaXMgYWxtb3N0IDUlIG9uIHRoZSBmZXcgMzIgYml0
cyBkZWZjb25maWcgSSBoYXZlIHRlc3RlZC4gDQpUaGF0J3MgYSBsb3QuDQoNCk9uIDMyIGJpdHMg
cG93ZXJwYywgb25seSB0aGUgZTUwMCBoYXMgYSBsaW5rIHN0YWNrIHRoYXQgY291bGQgZW5kIHVw
IA0KYmVpbmcgdW5iYWxhbmNlZC4gQ291bGQgd2Uga2VlcCB0aGUgYmN0ciBhbmQgYXZvaWQgdGhl
IG10bHIgYW5kIHRoZSBqdW1wIA0KaW4gdGhlIHRyYW1wb2xpbmUgPw0KDQpPbiA4eHggYSBOT1Ag
aXMgb25lIGN5Y2xlLCBhIHRha2VuIGJyYW5jaCBpcyAyIGN5Y2xlcywgYnV0IHRoZSBzZWNvbmQg
DQpjeWNsZSBpcyBhIGJ1YmJsZSB0aGF0IG1vc3Qgb2YgdGhlIHRpbWUgZ2V0cyBmaWxsZWQgYnkg
Zm9sbG93aW5nIA0Kb3BlcmF0aW9ucy4gT24gdGhlIDgzeHgsIGJyYW5jaGVzIGFuZCBOT1BzIGFy
ZSBzdXBwb3NlZCB0byBiZSBzZWFtbGVzcy4NCg0KU28gaXMgdGhhdCBvdXQtb2YtbGluZSB0cmFt
cG9saW5lIHJlYWxseSB3b3J0aCBpdCA/IE1heWJlIGtlZXBpbmcgdGhlIA0KZnRyYWNlIGluc3Ry
dWN0aW9ucyBhdCB0aGUgYmVnaW5pbmcgYW5kIGp1c3QgcmVwbGFjaW5nIHRoZSBtZmxyIGJ5IGFu
IA0KanVtcCB3aGVuIGZ0cmFjZSBpcyBvZmYgd291bGQgaGVscCByZWR1Y2UgdGhlIGZ0cmFjZSBp
bnNucyBieSBvbmUgbW9yZSANCmluc3RydWN0aW9uLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBO
YXZlZW4gTiBSYW8gPG5hdmVlbkBrZXJuZWwub3JnPg0KPiAtLS0NCg0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaCBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmgNCj4gaW5kZXggODRmNmNjZDdkZTdhLi45YTU0YmI5
ZTBkZGUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNo
aW5nLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaA0K
PiBAQCAtMTg1LDEwICsxODUsMjEgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHBwY19m
dW5jdGlvbl9lbnRyeSh2b2lkICpmdW5jKQ0KPiAgIAkgKi8NCj4gICAJaWYgKCgoKCppbnNuICYg
T1BfUlRfUkFfTUFTSykgPT0gQURESVNfUjJfUjEyKSB8fA0KPiAgIAkgICAgICgoKmluc24gJiBP
UF9SVF9SQV9NQVNLKSA9PSBMSVNfUjIpKSAmJg0KPiAtCSAgICAoKCooaW5zbisxKSAmIE9QX1JU
X1JBX01BU0spID09IEFERElfUjJfUjIpKQ0KPiArCSAgICAoKCooaW5zbisxKSAmIE9QX1JUX1JB
X01BU0spID09IEFERElfUjJfUjIpKSB7DQo+ICsjaWZkZWYgQ09ORklHX0FSQ0hfVVNJTkdfUEFU
Q0hBQkxFX0ZVTkNUSU9OX0VOVFJZDQoNCkNhbiB5b3UgcmVwbGFjZSBieSBJU19FTkFCTEVEKCkg
Pw0KDQo+ICsJCS8qDQo+ICsJCSAqIEhldXJpc3RpYzogbG9vayBmb3IgdGhlICdtdGxyIHIwJyBp
bnN0cnVjdGlvbiBhc3N1bWluZyBmdHJhY2UgaW5pdCBpcyBkb25lLg0KPiArCQkgKiBJZiBpdCBp
cyBub3QgZm91bmQsIGxvb2sgZm9yIHR3byBjb25zZWN1dGl2ZSBub3BzIGFmdGVyIHRoZSBHRVAu
DQo+ICsJCSAqIExvbmdlciB0ZXJtLCB3ZSByZWFsbHkgc2hvdWxkIGJlIHBhcnNpbmcgdGhlIHN5
bWJvbCB0YWJsZSB0byBkZXRlcm1pbmUgTEVQLg0KPiArCQkgKi8NCj4gKwkJaWYgKCgqKGluc24r
NCkgPT0gUFBDX1JBV19NVExSKF9SMCkpIHx8DQo+ICsJCSAgICAoKCooaW5zbisyKSA9PSBQUENf
UkFXX05PUCgpICYmICooaW5zbiszKSA9PSBQUENfUkFXX05PUCgpKSkpDQo+ICsJCQlyZXR1cm4g
KHVuc2lnbmVkIGxvbmcpKGluc24gKyA4KTsNCj4gKyNlbmRpZg0KPiAgIAkJcmV0dXJuICh1bnNp
Z25lZCBsb25nKShpbnNuICsgMik7DQo+IC0JZWxzZQ0KPiArCX0gZWxzZSB7DQo+ICAgCQlyZXR1
cm4gKHVuc2lnbmVkIGxvbmcpZnVuYzsNCj4gKwl9DQo+ICAgI2VsaWYgZGVmaW5lZChDT05GSUdf
UFBDNjRfRUxGX0FCSV9WMSkNCj4gICAJLyoNCj4gICAJICogT24gUFBDNjQgQUJJdjEgdGhlIGZ1
bmN0aW9uIHBvaW50ZXIgYWN0dWFsbHkgcG9pbnRzIHRvIHRoZQ0KDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC90
cmFjZS9mdHJhY2UuYw0KPiBpbmRleCAyOTU2MTk2Yzk4ZmYuLmQzYjQ5NDkxNDJhOCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPiArKysgYi9hcmNo
L3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQoNCj4gQEAgLTIxNywxNSArMjc0LDYyIEBA
IGludCBmdHJhY2VfaW5pdF9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1Y3QgZHluX2Z0cmFj
ZSAqcmVjKQ0KPiAgIHsNCj4gICAJdW5zaWduZWQgbG9uZyBhZGRyLCBpcCA9IHJlYy0+aXA7DQo+
ICAgCXBwY19pbnN0X3Qgb2xkLCBuZXc7DQo+IC0JaW50IHJldCA9IDA7DQo+ICsJaW50IGksIHJl
dCA9IDA7DQo+ICsJdTMyIGZ0cmFjZV9tY291bnRfdHJhbXBfaW5zbnNbXSA9IHsNCj4gKyNpZmRl
ZiBDT05GSUdfUFBDNjQNCj4gKwkJUFBDX1JBV19CUkFOQ0goRlRSQUNFX01DT1VOVF9UUkFNUF9P
RkZTRVQgKyBNQ09VTlRfSU5TTl9TSVpFKSwNCj4gKyNlbHNlDQo+ICsJCVBQQ19SQVdfTUZMUihf
UjApLA0KPiArI2VuZGlmDQoNCkNhbiBpdCBiZSBiYXNlZCBvbiBJU19FTkFCTEVEKENPTkZJR19Q
UEM2NCkgaW5zdGVhZCA/DQoNCj4gKwkJUFBDX1JBV19CTCgwKSwgLyogYmwgZnRyYWNlX2NhbGxl
ciAqLw0KPiArCQlQUENfUkFXX01UTFIoX1IwKSwgLyogYWxzbyBzZWUgdXBkYXRlIHBwY19mdW5j
dGlvbl9lbnRyeSgpICovDQo+ICsJCVBQQ19SQVdfQlJBTkNIKEZUUkFDRV9NQ09VTlRfVFJBTVBf
T0ZGU0VUIC0gTUNPVU5UX0lOU05fU0laRSAqIDIpDQo+ICsJfTsNCj4gKw0K
