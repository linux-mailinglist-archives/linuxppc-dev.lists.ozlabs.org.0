Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2795A7EFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:37:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHlbN6rbXz3c6p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=z2WnStE9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.41; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=z2WnStE9;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120041.outbound.protection.outlook.com [40.107.12.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHlZY43hqz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:36:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKIZhuvx+zz0bKPJFW/eSMs+gBzpyLuOMV7ewvLNDKLXng3lI7O5tWbgcrt99mhN1D+Udgm1O0WlOJ8GN6X8558nJKRLpHMODYvuOg17YxcFm/zmOfYk2sibYIHmrDwHVVQpJZNdhML798TStnvKLxDhCJsV5VwvP6XKHv9QTl+rhfPRzDw5Awo7jzXQN37sGm37e0a4uiTOSQ4JUYMn+t+2pPUR2Rn6BvpCF/fGD6erSSkSeaC1JxXFIYKiExnRe8gIEJqp0X7bJG1uCDtnjzMJ6w+/9zp7BsgjfPzBORzGn2IV4NFsQ1kKw5/C3hgostL1Y2YIERZi+jY96cBw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Il2ULaXMeBZotUPu9ex3B6E3IdILYJm7pqet7kGAs=;
 b=EnS9UYia87WdCU452DTvgSCoKgLmphwuf7ykbPb1w/IMODsbsZvfpma91spHYFcEbUB+6dmH8rTSyGrHk1RcRVPIl9nZ9yoa6LmmQX061Ixi31a2sy3a1rprMsFnQNBiq1eOmpabxEr9yxmJRs3PW1MSpy1Afc7QAutKBbMaavInClLUZnC5NY1URrr0lNFC/0su0gZHC+8LIjw/HsZEQmtESFt4aqL+7P3D/7JTG/JczAvmW+gN+M8D5KJJvrBsuq8svhL7JoHUFS1BsM3aACPIm4V8DRFlzTYgaYo8NQGcrzqO5uHpjyLRzbpS7ql7jDt9J14byDtCMOLNJ2qnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5Il2ULaXMeBZotUPu9ex3B6E3IdILYJm7pqet7kGAs=;
 b=z2WnStE9BOv/Y3zKQ0XtI4o4APbg5JTAFLjI2BmHJtF338QeQfQQnhRfTOHgiRezMXEsDuibZ21yNRIbgB/+q7b8Ov8vsVw9uodVbpvwsj9YMpGVWx4WFdgE+P89RdIcLUh05I7lzlwn2p5Sdbs4/L7Soq5TGJ2bIsRCuMfbY/FGAkJhoUmZYAiLKJdjGpxMITO21GlF50IQw6IP4Jokc5OD+XTICbgmGAEUIWtJ297PQ1O0S7htkiKcWzMvmQsTJDyuNnH9iWYHBNXR/GnPhNraa9bffWZSok114a3DXx8oWwqvq9IwpC7beIJDiHmV5UxPmG4sRjDHJNR3IjebDA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1576.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 13:36:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 13:36:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64s: add pte_needs_flush and huge_pmd_needs_flush
Thread-Topic: [PATCH] powerpc/64s: add pte_needs_flush and
 huge_pmd_needs_flush
Thread-Index: AQHYvTUPUjNJTXjYJk6vw8T8OJg8sq3JAt0A
Date: Wed, 31 Aug 2022 13:36:16 +0000
Message-ID: <1649eba7-1c04-41f3-34f1-4804138aecd8@csgroup.eu>
References: <20220831122649.1209126-1-npiggin@gmail.com>
In-Reply-To: <20220831122649.1209126-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9c0dc23-e168-4ae8-466e-08da8b55c7ab
x-ms-traffictypediagnostic: MRZP264MB1576:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gdqArkJ4C2564RenXcG36Fzt6jGiD9Il9gMJDpZVPTPWUDDwdW4oBf1kz0gdEVwJusKIwRWq6Hq5UGVjmP7TiQtV/vuSgNIDzszM3PYrhZKRGj3kR8z30+PBms23bCtKBMn3FO7MwWMReek19O0mGZNoS7JVzXX1VdondJVs8iL90qrlDCKUJepM52K4GW/2OWalgz6ceROAntLKmOBScpFjWPKkf18Ac2xjQtS+e60LZx5TskJToVsMwH7W/tPQbiQVhsuqFBfYSVsUcjdB89aHxX0YGuIp53EaYXV4sjfeLSudemnehNGBB8Fd/o+6rJCXqOLZCxnXWLM28TMYzHvNMPy0fjqnoP58x+bTq5S1VOmQft87QkIbuLbFIK/YQkonWNApsknIMoX13D8z5UyYWDkD46oO8KDNErK7Y3kt54KBrRbNUpCGuFcEwKCaNgOsH+w9lmhZ2aswObQka7xTNoCAQdjuq6Typ36uTcofVZXTPhkP6rkGBR3A2d1Qkmb9vayVQIXeqfUcPb7ImGQK5UyQ2y45gq29JlvxUwyq/xMSH765M8w7XlDfAHpgBtm3Rn4XH+oqA1Yon8L7rRH0yujC4eQqpQ8HHbD2vJRr68PtyJPZuaneCbD5hP+cNQxGM3hMj7g2dP1utw7vSbCjazjvtGt8tR4k70xVXmDWYf5huqLEYHBqfGUdJDPja2dZcwAGo1I3TZRWHFYJ2GEVFvGf3VFv8utba/SS2Lgsb769gxEkM/1cP2URpDjQFyiQ/Iqf4Dox1/Rez8BdRQ86mKJK17c3HZzoJG8Ix27rgqyj55IG4QnmZ0/1PEa4blKfHPRNHI2llEEexaFkKMe1L99P3rFOTz+8d8/Cc9zgDt+z0+IXAXmsvCU+AW9v
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39850400004)(136003)(376002)(76116006)(8676002)(41300700001)(6486002)(478600001)(66946007)(966005)(66446008)(66476007)(66556008)(64756008)(2906002)(83380400001)(66574015)(6506007)(5660300002)(26005)(6512007)(91956017)(8936002)(44832011)(31686004)(38070700005)(110136005)(316002)(71200400001)(86362001)(2616005)(36756003)(122000001)(31696002)(38100700002)(186003)(14583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c29EZ2FmR3lNREF2Z08zNHFYVHB6TkpXQ2Y2UVIwV2k0NDRtNUVpdElSbmxP?=
 =?utf-8?B?OFpPeFJDak5iaWVJKzR0dmxwZFozMS9OSEYyUUovMDhaeFdqKzAvS3JsSWF4?=
 =?utf-8?B?cjVTVUFIOXh6UUlZbm1tNHRzS2ZZWlpLWkE4R3dxNzN1Ym5Ha04waHZaQWJW?=
 =?utf-8?B?VXBpRWlyZm9kZ1B6TmpVNkxiRDdZZGdlN1dITkNhYzljQnQzd3Jnc0c0TEhI?=
 =?utf-8?B?N2pxbW1xaFpSQk5xQkc1U2JORDU2VHluYmdCaGNPOE5QU3laNlhEaXdFc014?=
 =?utf-8?B?aDhxc2JXWmJIU3pGMHJBdURQQnNsQ05PM0RDemgrc0w2UW44cEI1cnNEcVJG?=
 =?utf-8?B?dENCS1kvM0tHZXNmVVduOE5UdVNRVzBpZk5LYlYvRlN5Q2ttZHJJT1FpcVA0?=
 =?utf-8?B?eWJwMDBVZHFBUFAzdTNYdUVNdWhKa1htM0s5RnlUeHgwUU1LTjE1dUF1cnA3?=
 =?utf-8?B?dktadmIrVXRJS1dJajhibW43bUgwdU15NzBWcG53aXYzRUw1RzhyZXlmVndj?=
 =?utf-8?B?NjF3aVJoT2VVSFNnSlBscGFRZ0JRZithUHY2SG5mNHZwekJpQkE3SHMvUXBm?=
 =?utf-8?B?ZERRYTNvUmRnNlRXazhxRGRsUmhOLzY3bkdES1lOZHQ0VmVpVEZ4aVA4U2JY?=
 =?utf-8?B?ZDI4ZDNuNGc3dHM4TUN1SGZOa2p0cFVjMzZkTUt1bjJZUjBUbjh3SjFOTDBL?=
 =?utf-8?B?YVNaQXF2eGlWREJ4K05iYVI5dkUvQTRBWkdsR3ZLSzlLZ3JyREx0dWlDUTJx?=
 =?utf-8?B?WjNlc3hQT0E4QWNZMUpWNWlMN05vTnVpd08xb09BV2pEeE9lMGVPL3Z0RXhG?=
 =?utf-8?B?UTYveXZQZmhsZlJRa2FhSUUwcmIxVkk3WFkwSUdQdHVhaUdxcVU4aHc0UzBP?=
 =?utf-8?B?WENBUVp0ODR4eFBCNW1MbUxtUmVwNEhMYUFURnJaWkFDMlFaaDUxNEhaNzRK?=
 =?utf-8?B?Q3Nnalk1ZUtQQzhhWklOWms4OE5GM3JCM2NwT0VtajF6Vnh1a3dvM2RuVnUv?=
 =?utf-8?B?RDZzWE5YeDg1d2JiZjYxR3dGQUNxaS8xTmwvWDJlZXFkM256MysvKzBwZUN2?=
 =?utf-8?B?NURTRjVyZzNialF4MUpGUmN1aW9CUmN2R1RVOFo5WjVHMWdMYnlmQ2s0U2tn?=
 =?utf-8?B?OWozUnh0RjhrbkhsNnNINGJIVWhwNDBmS1U1YUZVMDhaei8wS3JrWXBlVzI1?=
 =?utf-8?B?RHR3cDZkd2dxYUcwQzdELzRRSEQ5RjlDTiszTjZISitsT1Y4ck8yYlRpUjRn?=
 =?utf-8?B?QjVMdCtqeHQvbHNMaS96ajF6bWRHemFpZEZhWjFqMWk2OVdOMWlmR3VPeEhS?=
 =?utf-8?B?VndHYTBNNWR4enQxVi9uN2lXWHlHTlJtVFhRd1p5NnlteDRudXNsdFFVaUJK?=
 =?utf-8?B?MXpwWnNmVmY3VWlWQnJLelh5NjQ3ZXd6ZVNWT3NURW1xQk9zRUlIZXBZa3NW?=
 =?utf-8?B?eFpucng1TnZsTGl4SWUvWVVZSi91ejJpeGg0YlpCdjdnbmJ2c3Z5eWFMM2pR?=
 =?utf-8?B?cFY1dUdLdEYrM2VSdEVYdGNpcjJqQmJ3OE9sK2ZMRWFBeEpDVkR0cmRuc2Zu?=
 =?utf-8?B?Y29QcGozR1lYV0ttbHN5OVVFcm5aREdnK1ZhazdneE8xNHBzZ092OEZjRVRO?=
 =?utf-8?B?THV3dXMyTklzc1VEN1huK09yM1hLU09idEEvVDdNTWdQNmhwRm9rQ1AwTzEx?=
 =?utf-8?B?OXlJTGJxd0QyamU3dHNYbFc2dW9tNUQwNWVGMWhRWU9oYXlNTm5oNTlEcmhZ?=
 =?utf-8?B?L0RCcnJLWHRNaWdPcDhRV21wSWE3bjhVTjY3cEMrK2ZDNDdRdjJGWlRJNE1x?=
 =?utf-8?B?dlpneDUrVUMxbFVlV0FlSEs4ZjFQTGliT0ZhcXVTS2Z4dmxjeXphcUFzRVkz?=
 =?utf-8?B?d3FRRlI4WTZqY1hQS0ljZGE5d2hOR09lMVM3NGNSNXNMRjBFc1d4ejJNbXJN?=
 =?utf-8?B?Y1V5d2ZYZk82TGNwbVU3MldlempUVnIrTzMvNXRRSFd2dWpsS3ZnSlRacC93?=
 =?utf-8?B?OXNMNDJ5Q0taUFRIOFZBaXRtT1BSaWN4V0Q0alBFOHE5em5xekp6K0VIVHZC?=
 =?utf-8?B?S0NZTjVjNFJ4V2QwZGMwM0Uxb1pVOUp3akJUY2VaRGoyYUg0Uy8yaGd1YmY5?=
 =?utf-8?B?VWZHbnZTSXVXa3ROOXpqemsybm5tQ2tWK2NpNE1WNU9aS1pZTFdCRDlCNnhV?=
 =?utf-8?Q?Uj4lAOMWFrRlLtFWTRPzsoQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A51E892050FFE40B15E9104AA55A34C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c0dc23-e168-4ae8-466e-08da8b55c7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 13:36:16.4249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGwbRcBtyJQkZ2BCf51xOXibZTvM4A80iClplhuJ6GZQXAZFokzX+PXiEY2SGNzebYjpQ1wLEH0ZyyPLLwHvukZD+BFiIZIjValQbWBkLeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1576
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

DQoNCkxlIDMxLzA4LzIwMjIgw6AgMTQ6MjYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBBbGxvdyBQVEUgY2hhbmdlcyB0byBhdm9pZCBmbHVzaGluZyB0aGUgVExCIHdoZW4gYWNjZXNz
IHBlcm1pc3Npb25zIGFyZQ0KPiBiZWluZyByZWxheGVkLCB0aGUgZGlydHkgYml0IGlzIGJlaW5n
IHNldCwgYW5kIHRoZSBhY2Nlc3NlZCBiaXQgaXMgYmVpbmcNCj4gY2hhbmdlZC4NCj4gDQo+IFJl
bGF4aW5nIGFjY2VzcyBwZXJtaXNzaW9ucyBhbmQgc2V0dGluZyBkaXJ0eSBhbmQgYWNjZXNzZWQg
Yml0cyBkbyBub3QNCj4gcmVxdWlyZSBhIGZsdXNoIGJlY2F1c2UgdGhlIE1NVSB3aWxsIHJlLWxv
YWQgdGhlIFBURSBhbmQgbm90aWNlIHRoZQ0KPiB1cGRhdGVzIChpdCBtYXkgYWxzbyBjYXVzZSBh
IHNwdXJpb3VzIGZhdWx0KS4NCj4gDQo+IENsZWFyaW5nIHRoZSBhY2Nlc3NlZCBiaXQgZG9lcyBu
b3QgcmVxdWlyZSBhIGZsdXNoIGJlY2F1c2Ugb2YgdGhlDQo+IGltcHJlY2lzZSBQVEUgYWNjZXNz
ZWQgYml0IGFjY291bnRpbmcgdGhhdCBpcyBhbHJlYWR5IHBlcmZvcm1lZCwgYXMNCj4gZG9jdW1l
bnRlZCBpbiBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nKCkuDQo+IA0KPiBUaGlzIHJlZHVjZXMgVExC
IGZsdXNoaW5nIGZvciBzb21lIG1wcm90ZWN0KDIpIGNhbGxzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gLS0tDQo+IA0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oICB8ICAzICsrDQo+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oIHwgNTMgKysrKysr
KysrKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3RsYi5jICAg
ICAgICAgICB8ICAxICsNCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcGd0YWJsZS5jICAg
ICAgICAgICAgfCAgMSArDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3Rh
YmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBp
bmRleCBjYjlkNWZkMzlkN2YuLmE1MDQyYmI5YTMwYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAgLTQxMSw2ICs0MTEsOSBAQCBz
dGF0aWMgaW5saW5lIGludCBfX3B0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcoc3RydWN0IG1tX3N0
cnVjdCAqbW0sDQo+ICAgICogZXZlbnQgb2YgaXQgbm90IGdldHRpbmcgZmx1c2hlZCBmb3IgYSBs
b25nIHRpbWUgdGhlIGRlbGF5DQo+ICAgICogc2hvdWxkbid0IHJlYWxseSBtYXR0ZXIgYmVjYXVz
ZSB0aGVyZSdzIG5vIHJlYWwgbWVtb3J5DQo+ICAgICogcHJlc3N1cmUgZm9yIHN3YXBvdXQgdG8g
cmVhY3QgdG8uIF0NCj4gKyAqDQo+ICsgKiBOb3RlOiB0aGlzIG9wdGltaXNhdGlvbiBhbHNvIGV4
aXN0cyBpbiBwdGVfbmVlZHNfZmx1c2goKSBhbmQNCj4gKyAqIGh1Z2VfcG1kX25lZWRzX2ZsdXNo
KCkuDQo+ICAgICovDQo+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9QVEVQX0NMRUFSX1lPVU5HX0ZM
VVNIDQo+ICAgI2RlZmluZSBwdGVwX2NsZWFyX2ZsdXNoX3lvdW5nIHB0ZXBfdGVzdF9hbmRfY2xl
YXJfeW91bmcNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvdGxiZmx1c2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1
c2guaA0KPiBpbmRleCBkMmU4MGYxNzhiNmQuLmJjZDdjYjU4NWQxNyAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0KPiBAQCAtMTQzLDYg
KzE0Myw1OSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVs
dChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAJCWZsdXNoX3RsYl9wYWdlKHZtYSwg
YWRkcmVzcyk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIF9fcHRlX2ZsYWdz
X25lZWRfZmx1c2godW5zaWduZWQgbG9uZyBvbGR2YWwsIHVuc2lnbmVkIGxvbmcgbmV3dmFsKQ0K
PiArew0KPiArCXVuc2lnbmVkIGxvbmcgZGVsdGEgPSBvbGR2YWwgXiBuZXd2YWw7DQo+ICsNCj4g
KwkvKg0KPiArCSAqIFRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBmdW5jdGlvbiBkb2Vzbid0IG1h
dHRlciBmb3IgaGFzaCwNCj4gKwkgKiBwdGVwX21vZGlmeV9wcm90X3N0YXJ0KCkgZG9lcyBhIHB0
ZV91cGRhdGUoKSB3aGljaCBkb2VzIG9yIHNjaGVkdWxlcw0KPiArCSAqIGFueSBuZWNlc3Nhcnkg
aGFzaCB0YWJsZSB1cGRhdGUgYW5kIGZsdXNoLg0KPiArCSAqLw0KPiArCWlmICghcmFkaXhfZW5h
YmxlZCgpKQ0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKw0KPiArCS8qDQo+ICsJICogSW4gdGhlb3J5
IHNvbWUgY2hhbmdlZCBzb2Z0d2FyZSBiaXRzIGNvdWxkIGJlIHRvbGVyYXRlZCwgaW4gcHJhY3Rp
Y2UNCj4gKwkgKiB0aG9zZSBzaG91bGQgcmFyZWx5IGlmIGV2ZXIgbWF0dGVyLg0KPiArCSAqLw0K
PiArDQo+ICsJLyogRG9uJ3QgZGVhbCB3aXRoIGtlcm5lbCBtYXBwaW5ncyBvciBub24tUFRFcyBv
ciBub3QtcHJlc2VudCBQVEVzICovDQo+ICsJVk1fQlVHX09OKChvbGR2YWwgfCBuZXd2YWwpICYg
X1BBR0VfUFJJVklMRUdFRCk7DQo+ICsJVk1fQlVHX09OKCEoKG9sZHZhbCB8IG5ld3ZhbCkgJiBf
UEFHRV9QVEUpKTsNCj4gKwlWTV9CVUdfT04oISgob2xkdmFsIHwgbmV3dmFsKSAmIF9QQUdFX1BS
RVNFTlQpKTsNCg0KTm8gbmV3IFZNX0JVR19PTigpIHNob3VsZCBiZSBhZGRlZCwgcmVmZXIgbGF0
ZXN0cyBkaXNjdXNzaW9uIG9uIHRoZSANCnN1YmplY3QgYXQgDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvQ0FIay09d2c0MEVBWm9mTzE2RXZpYWo3bWZxRGhaMmdWRWJ2ZnNNZjZnWXpzcFJq
WXZ3QG1haWwuZ21haWwuY29tLw0KDQoNCj4gKw0KPiArCS8qIE11c3QgZmx1c2ggb24gYW55IGNo
YW5nZSBleGNlcHQgUkVBRCwgV1JJVEUsIEVYRUMsIERJUlRZLCBBQ0NFU1NFRCAqLw0KPiArCWlm
IChkZWx0YSAmIH4oX1BBR0VfUldYIHwgX1BBR0VfRElSVFkgfCBfUEFHRV9BQ0NFU1NFRCkpDQo+
ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICsJLyoNCj4gKwkgKiBJZiBhbnkgb2YgdGhlIGFib3Zl
IHdhcyBwcmVzZW50IGluIG9sZCBidXQgY2xlYXJlZCBpbiBuZXcsIGZsdXNoLg0KPiArCSAqIFdp
dGggdGhlIGV4Y2VwdGlvbiBvZiBfUEFHRV9BQ0NFU1NFRCwgZG9uJ3Qgd29ycnkgYWJvdXQgZmx1
c2hpbmcNCj4gKwkgKiBpZiB0aGF0IHdhcyBjbGVhcmVkIChzZWUgdGhlIGNvbW1lbnQgaW4gcHRl
cF9jbGVhcl9mbHVzaF95b3VuZygpKS4NCj4gKwkgKi8NCj4gKwlpZiAoKGRlbHRhICYgfl9QQUdF
X0FDQ0VTU0VEKSAmIG9sZHZhbCkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gKwlyZXR1cm4g
ZmFsc2U7DQo+ICt9DQo+ICsNCj4gKyNpZm5kZWYgcHRlX25lZWRzX2ZsdXNoDQoNCldoeSB0aGF0
ICNpZm5kZWYgPyBJIGNhbid0IHNlZSBpdCBkZWZpbmVkIGFueXdoZXJlIGluIHBvd2VycGMgYXQg
dGhlIA0KdGltZSBiZWluZy4NCg0KPiArc3RhdGljIGlubGluZSBib29sIHB0ZV9uZWVkc19mbHVz
aChwdGVfdCBvbGRwdGUsIHB0ZV90IG5ld3B0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gX19wdGVfZmxh
Z3NfbmVlZF9mbHVzaChwdGVfdmFsKG9sZHB0ZSksIHB0ZV92YWwobmV3cHRlKSk7DQo+ICt9DQo+
ICsjZGVmaW5lIHB0ZV9uZWVkc19mbHVzaCBwdGVfbmVlZHNfZmx1c2gNCj4gKyNlbmRpZg0KPiAr
DQo+ICsjaWZuZGVmIGh1Z2VfcG1kX25lZWRzX2ZsdXNoDQoNClNhbWUNCg0KPiArc3RhdGljIGlu
bGluZSBib29sIGh1Z2VfcG1kX25lZWRzX2ZsdXNoKHBtZF90IG9sZHBtZCwgcG1kX3QgbmV3cG1k
KQ0KPiArew0KPiArCXJldHVybiBfX3B0ZV9mbGFnc19uZWVkX2ZsdXNoKHBtZF92YWwob2xkcG1k
KSwgcG1kX3ZhbChuZXdwbWQpKTsNCj4gK30NCj4gKyNkZWZpbmUgaHVnZV9wbWRfbmVlZHNfZmx1
c2ggaHVnZV9wbWRfbmVlZHNfZmx1c2gNCj4gKyNlbmRpZg0KPiArDQo+ICAgZXh0ZXJuIGJvb2wg
dGxiaWVfY2FwYWJsZTsNCj4gICBleHRlcm4gYm9vbCB0bGJpZV9lbmFibGVkOw0KPiAgIA==
