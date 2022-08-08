Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938558CA96
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 16:34:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1dxS32q2z2xbK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 00:34:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KzYaEotq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KzYaEotq;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1dwc502Yz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 00:33:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlP6ntoqfaMI7UMMaot5cexGG2ie8rZtI5UF6fPH/vzAf6U01LiKhkbsvb4odas5R9l7p+KbWGP0KS8lfPBFd1nFFGUFq7NcaEbnq8/MmD8wtHW5gL4cDtJrOYuXi2sd/c2nxBJeBUkwxPLO7kksGLFwGTl/t40tsdDetTJXadmpU0pGwzhCou8deTTkhzoiLWDQozERacn8Zd2eTdC1EoJOBNZWY0DG6VSTkCAR4WqfDhwUUlW4SxSrPFSUbmpyi/Rap9je5X5/YcRMEpLy5HdKw+zH/HdLS0RWXQW/SFS8EztNlOv6vQRnHUEcd+c5basc6EguzGkfiMuNIhVwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5EbHRWJA1jlh7IbUV6TjhoErG40k8qmb+Is84xv2VE=;
 b=BiphEJ+Cnx92CUeXuvbh85pgRmNyfHv1/sizY4PwAjPgJlP50atu7sz9RhWNFIeD0bR66X04UPO+owxxgKociOgNclxolMyadaK7JbsxHhIwUz0JHSxA8u2RUycAYYi3RohMfJ+rzE/9Pxpstz3/SmLj2TSdqD635aJs94Nlf4iFduD6RDJD7wDiHAvDq5idbuRKiq+M6J6OKqlOcuBcsCYEhtFHHjtKcVfP6F4HMkzTBFL+W/FEiYG54HrHOqAve7Qd+h6NS7rCo7LzvvsTeIX1L6p+MQXkzc4HFVChZ+7/W6qhayWVuPivSBtfwq6v4sSDJfLmKkrn1QamsdvEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5EbHRWJA1jlh7IbUV6TjhoErG40k8qmb+Is84xv2VE=;
 b=KzYaEotqfS1CI84XMYLZ0M82MlY8wVhvFycfYFWY+P4eBpS6cSoFPCSvPTISPbcMAmo9FhYU7Sw4IHRmS3QgCDD8oCTwLiwXOdS4Q8RnYezgxkinEjATczLeiS8K9TizBLFUiPH0sqy9tJtCW8ESY5N+Wnagwo9CZ5666WYktJBcVlenNrn2/SUPPd+Vcb4mHe58y/3/DTfTWIaxwL2grMOx+gXyc1g/++AKbZbAIwrJA3k2XhujBtbSeN/Z9D2LEm6eF7Zx0qRGQPLpKcoYzy03gKBD9Y0fzKFrghuR8jWV7qW37dq/kOKAo45RVBDvUmZw97Ui9qmJcbEPHySNMw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3739.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:184::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 14:32:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:32:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] powerpc/mm: Move vm_get_page_prot() out of
 book3s64 code
Thread-Topic: [PATCH v2 1/2] powerpc/mm: Move vm_get_page_prot() out of
 book3s64 code
Thread-Index: AQHYqycXx9GGaCplTkelFJdWUjfH+K2lETQA
Date: Mon, 8 Aug 2022 14:32:59 +0000
Message-ID: <95e380d0-f681-4c6f-d70b-2b5fdf911fa8@csgroup.eu>
References: <20220808130109.30738-1-ruscur@russell.cc>
In-Reply-To: <20220808130109.30738-1-ruscur@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b6ac1b2-943f-4b3e-ed74-08da794ae457
x-ms-traffictypediagnostic: PR1P264MB3739:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  x4rPQNP8eyVeYrKtDHH9ouRks3pK2UipeDdyXDAeL/sy2jKcsh/YW4synDjqXrYj6p+GYcBhyJJpdc8zkCKC1afI4BmK7yA/g1yam1eHIfVzwLAeRcI2DfPsdo7Gm8EpjQd7mBqSE6RihF0jtI0GJBcqT/G89vKgqeH0cn/XoBEPjyTB/igj3kaSgTOesBMxaEO65H73otaztcH08eHYCl2/NdltcWi6M56dToXG9ZhWx6Giz/kgvg1n+WBO2hhruyd7GAhU9c003DuxlkEN/7gZL7XZ0/FE55at9WyR5kPZCgsnqiP6n1mmusBFax1xgMEeVlrvfN1GSEMXyReFv3v2uF0jW36Hr0GOTDerRuZXiWU0og6lMwWFZbuXqzBZ90K7N2bUsJUZeKYCKxDLYe88CcsqYywiOKwvnW0IuFwqmUFWBWL2WmWn4kA7ID8IxYCiPXYqG0SmRqr2UUIihnnyrrapLFqN8QJlo1Sv/tuEytyg/CNuPZc+zSEYP0OUIQZ7w9gB10gp/1rAv3cfu4ItcPYnUl0fTrLnOYSId2wI0R8nC6tkz/PcFPSoSCbsA9nL4scOgxFqz1I24hJyxJsw6OHNftJX6VNSHElwuEB67ehUGgwC/vMGxgoviLfeUUXRVSUiSC0xbvsxbWflYGf7HAspDwa7ggM8DyWcUj2f/e3Hyfvh04d0jkputkiKK3OrKXszkgEmrea0E05IaH8FQdG3KFGdQqbzJLg3t4K7UnamOYcQi4VhrL6qO34aSfyKPeAd4C8gJG/c/1hzm+KyeXu0NGQ2cSYBX/jND18se3HxzMc/U3wQ42OUC7QEoydVfnHFq+zGFpQRwuI8Z+r2ue4xePKwQ2D2ucj298XUNKexbukiAC47vXVuejqq
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(396003)(39850400004)(136003)(31696002)(26005)(86362001)(6512007)(6506007)(122000001)(41300700001)(38100700002)(38070700005)(8676002)(91956017)(83380400001)(2616005)(186003)(4326008)(64756008)(66446008)(66556008)(66476007)(66946007)(36756003)(44832011)(2906002)(5660300002)(8936002)(31686004)(76116006)(6486002)(71200400001)(110136005)(478600001)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZHBodmZIRTZkOGpLL0VvR1VhY2EyWU9BUUw1S0gvSTY3VXNZT2dmWGQwbjRZ?=
 =?utf-8?B?bU5NcWI4c2J6K05EUUVBZW1rdTlhY3F4bWZNUURnRHNNUmFpT1M1TnBYN01O?=
 =?utf-8?B?Q0YrS3pXbXJ3d042UEtVVXlKNVUzRzQwYWFOSmJTb2tUNEVPQ0tJRlZoV2xi?=
 =?utf-8?B?dXBQdS9Uc2Ywc0hTQTV3T0pPeU9vWUNFcW5UdUN3ZUlSZk1zd2NNY2J2OUJm?=
 =?utf-8?B?T1NyR2FSQk9GcjZWWXhwSjJRaXpqdHkxTEhQRkRPbnVEK05mNnpvRmxRS3ZM?=
 =?utf-8?B?MTNXT2pQaW9mT2VacHRCTTQ3MTl1bnNBRi9aeUNFSnhsd0Y3bU8xaDBVTEFS?=
 =?utf-8?B?bFNZZC9RdXNIdElWd3NMTFQwUndxNVluUGFITUJPazhPTWx5ZzRRTlB0WDY3?=
 =?utf-8?B?TkpwOVpubWZhQ1VRQjVxRGZmYlI4RC9yY1lGNWFJelFsbVhXTjFadTUwTnZW?=
 =?utf-8?B?SUhFbjQwVmRJdnQ5TnFUQURpOVE3cURKSGVZK0lSN0EydnhlcTR4TkUvNHJX?=
 =?utf-8?B?MllTdE9MeDVReDRleERybDNRMXRPclcxMTdpWXA4dDNhQjhydEJ1M3Y5dkdl?=
 =?utf-8?B?WkVzYVljQm9BSThudW5nWFc5YWhqcjlaYzZvOWE2NHl1dzZWallyUkM2MmQ4?=
 =?utf-8?B?dVczRFBaMWFXRjNuZnBndGRPSVBlb1lvdDYvaExINjBsb1JwYysyY1R2NjNo?=
 =?utf-8?B?MWVLUDJvbjNpemJNMTd4VHhHREpxWldRSWhsa3hHNmx0Y3NOcmtTZEllVC8r?=
 =?utf-8?B?dXUvbG5aRlFGQVdkOFhXTjNweUs1ZG54Q2tlY1NEVTc5R01QU1JvQzJ3WlRj?=
 =?utf-8?B?MklxTHhsQ2hUQnBtd2kyNlVBZzdYbExiRHR3bzVSQitZSG5ONlRqTndUVjhq?=
 =?utf-8?B?Y0ZiM0lHb0hYcFRyWEZrNS9hZVlucjZQU0UrakZMSktGaElZZzRBaVhBei9W?=
 =?utf-8?B?d0p5SzgxVE84UzdOODZYRUVwbnE3S3BUU3ZyVzBOcFZLMXNVSHozd3NtYklp?=
 =?utf-8?B?c3NZQ2RVdTNHTDR2ajFCczRrMk92a2paeG9NZTNiTVNVUXRBUytjdkUwT3VC?=
 =?utf-8?B?aFc5YmpJbWRBR24xM2I0UDdYL3crUUhXekUwS0dZWmduNFNPNVdhZVFwMTRo?=
 =?utf-8?B?RkxubFBhUDBsaFB5YVhhMDRzaTJVTHZQNTliY0FRLzEwSDRoZEN2aEpOV1Yw?=
 =?utf-8?B?Nm5DTlB0L1RLRjhRZzZpcENsN0w5Sy9rTGlRN2paaXZodytjbW0vYkVGbng1?=
 =?utf-8?B?TU1aSG1FU0N1cG1mY296R2VRS1dDL0xEMjhYS3ZZSUlFMlZMSWpwYWI1dEtL?=
 =?utf-8?B?ejhzd0ppTDZoOS9EM2NTQ1U3L05IN3JoTXhyOWhyTEdWZTkvSnVmYVBZNFk3?=
 =?utf-8?B?d0ppOVF0MExHTXIxY0M3TmVBOXBXM0xxYUp3OVlvQU05S3Z2SkJleW1tNjRu?=
 =?utf-8?B?eW1JbzVUU1NDd1A5cXFxazlQbkJPdkVxL1IvTlErUnRQdGNpVDRubXdKRFNn?=
 =?utf-8?B?U0VSK1pzWW14OXp6Wm8yZ2JMaUtHbjJWZlNwWEpodTUyZ3M3ek1ZSkVUYjha?=
 =?utf-8?B?bzQwQnB1TkZWOFBMc1dtQlBKbDBQQkZ5RnovbVcrTTdwM3ZQS1luMmJwRnNM?=
 =?utf-8?B?dzA0YkFBS0VyNEprbXZKTmllU2RYOTN1cDRiQW12VjlOdGREa0F5bWpKYis1?=
 =?utf-8?B?eVpwajBlTG9rNzNpWm8wM25LdFRIVXhzRy96UFNwNUl6US82NkRsL2w4TFo0?=
 =?utf-8?B?VEQxc3QybTdIcW5zQ3lkbTlPSFQ5VjAvQm1kL2Q3RmNGMUo2aFNqVDU1VjVz?=
 =?utf-8?B?YWVTSDVRNTNGNTRmbzU0bEgveUc3YVBGWkhDWUpKWkVnSWVIdldOZzBFcjBv?=
 =?utf-8?B?WDIxUUNlZzdxKzdWa3Z2aWx1eTBObE9ZMEJidTBPb2FGR3p5VGFFNklvdTk3?=
 =?utf-8?B?YUcxKzQyTXBnTmNlVnpSRWIwUkJna1ZMQjNmb1RrKzFsZlkrN09lVE9rdm5m?=
 =?utf-8?B?WXJXdk1OSVEzSUpLamo5Zy9jQ3JHcDBwbSs4SmZKR25GL2FmTGhabExtazd1?=
 =?utf-8?B?cWsxRExWaHdpeDNvckk3YVpuRVdHVzcxaUt3M25iZ2NGbDdzd1JucFZJV2JI?=
 =?utf-8?B?SEhZN2VaOWExSDg1c3FSelovL25oWVRnb1hjNVQybDJQSGdST2ZoeCt4R0t6?=
 =?utf-8?Q?9Ndp4fzIj3RhnsZuHnlOU1M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93E27D6A1CFC504B8DFC72C79448A479@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6ac1b2-943f-4b3e-ed74-08da794ae457
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 14:32:59.1386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4MyihbkIPxnYnItPgxz6LIfe4HNCYvb6d79itKFmmb7CV7Fqrw/6oxgOhMloTJII/nnKyjAUGcnMtAVur7i+Gx1KwbDEduX807JOLEXXnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3739
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
Cc: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA4LzIwMjIgw6AgMTU6MDEsIFJ1c3NlbGwgQ3VycmV5IGEgw6ljcml0wqA6DQo+
IHByb3RlY3Rpb25fbWFwIGlzIGFib3V0IHRvIGJlIF9fcm9fYWZ0ZXJfaW5pdCBpbnN0ZWFkIG9m
IGNvbnN0LCBzbyBtb3ZlDQo+IHRoZSBvbmx5IG5vbi1sb2NhbCBmdW5jdGlvbiB0aGF0IGNvbnN1
bWVzIGl0IHRvIHRoZSBzYW1lIGZpbGUgc28gaXQgY2FuDQo+IGF0IGxlYXN0IGJlIHN0YXRpYy4N
Cg0KV2hhdCdzIHRoZSBhZHZhbnRhZ2Ugb2YgZG9pbmcgdGhhdCA/IFdoeSBkb2VzIGl0IG5lZWQg
dG8gYmUgc3RhdGljICA/DQoNCkNocmlzdG9waGUNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUnVz
c2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPg0KPiAtLS0NCj4gdjI6IG5ldw0KPiANCj4g
ICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcGd0YWJsZS5jIHwgMTYgLS0tLS0tLS0tLS0tLS0t
LQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgICAgICAgICAgfCAyMSArKysrKysrKysr
KysrKysrKysrLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9w
Z3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcGd0YWJsZS5jDQo+IGluZGV4IDdi
OTk2NjQwMmIyNS4uZTJhNGVhNWViOTYwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0v
Ym9vazNzNjQvcGd0YWJsZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9wZ3Rh
YmxlLmMNCj4gQEAgLTU1MCwxOSArNTUwLDMgQEAgdW5zaWduZWQgbG9uZyBtZW1yZW1hcF9jb21w
YXRfYWxpZ24odm9pZCkNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwobWVtcmVtYXBfY29t
cGF0X2FsaWduKTsNCj4gICAjZW5kaWYNCj4gLQ0KPiAtcGdwcm90X3Qgdm1fZ2V0X3BhZ2VfcHJv
dCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQ0KPiAtew0KPiAtCXVuc2lnbmVkIGxvbmcgcHJvdCA9
IHBncHJvdF92YWwocHJvdGVjdGlvbl9tYXBbdm1fZmxhZ3MgJg0KPiAtCQkJCQkoVk1fUkVBRHxW
TV9XUklURXxWTV9FWEVDfFZNX1NIQVJFRCldKTsNCj4gLQ0KPiAtCWlmICh2bV9mbGFncyAmIFZN
X1NBTykNCj4gLQkJcHJvdCB8PSBfUEFHRV9TQU87DQo+IC0NCj4gLSNpZmRlZiBDT05GSUdfUFBD
X01FTV9LRVlTDQo+IC0JcHJvdCB8PSB2bWZsYWdfdG9fcHRlX3BrZXlfYml0cyh2bV9mbGFncyk7
DQo+IC0jZW5kaWYNCj4gLQ0KPiAtCXJldHVybiBfX3BncHJvdChwcm90KTsNCj4gLX0NCj4gLUVY
UE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvbW0vcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPiBpbmRleCBjYjJk
Y2RiMThmOGUuLjBiMmJiZGU1ZmI2NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL3Bn
dGFibGUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jDQo+IEBAIC0yNyw2ICsy
Nyw3IEBADQo+ICAgI2luY2x1ZGUgPGFzbS90bGIuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2h1Z2V0
bGIuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3B0ZS13YWxrLmg+DQo+ICsjaW5jbHVkZSA8YXNtL3Br
ZXlzLmg+DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPiAgICNkZWZpbmUgUEdEX0FM
SUdOIChzaXplb2YocGdkX3QpICogTUFYX1BUUlNfUEVSX1BHRCkNCj4gQEAgLTQ5Myw2ICs0OTQs
MjIgQEAgY29uc3QgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdID0gew0KPiAgIAlbVk1fU0hB
UkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JPSBQQUdFX1NIQVJFRF9YDQo+ICAg
fTsNCj4gICANCj4gLSNpZm5kZWYgQ09ORklHX1BQQ19CT09LM1NfNjQNCj4gLURFQ0xBUkVfVk1f
R0VUX1BBR0VfUFJPVA0KPiArI2lmZGVmIENPTkZJR19QUENfQk9PSzNTXzY0DQo+ICtwZ3Byb3Rf
dCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpDQo+ICt7DQo+ICsJdW5z
aWduZWQgbG9uZyBwcm90ID0gcGdwcm90X3ZhbChwcm90ZWN0aW9uX21hcFt2bV9mbGFncyAmDQo+
ICsJCQkJCShWTV9SRUFEfFZNX1dSSVRFfFZNX0VYRUN8Vk1fU0hBUkVEKV0pOw0KPiArDQo+ICsJ
aWYgKHZtX2ZsYWdzICYgVk1fU0FPKQ0KPiArCQlwcm90IHw9IF9QQUdFX1NBTzsNCj4gKw0KPiAr
I2lmZGVmIENPTkZJR19QUENfTUVNX0tFWVMNCj4gKwlwcm90IHw9IHZtZmxhZ190b19wdGVfcGtl
eV9iaXRzKHZtX2ZsYWdzKTsNCj4gICAjZW5kaWYNCj4gKw0KPiArCXJldHVybiBfX3BncHJvdChw
cm90KTsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7DQo+ICsjZWxz
ZQ0KPiArREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9UDQo+ICsjZW5kaWYgLyogQ09ORklHX1BQQ19C
T09LM1NfNjQgKi8=
