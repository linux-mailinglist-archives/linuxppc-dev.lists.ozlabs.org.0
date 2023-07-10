Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DCA74DC8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:33:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AgCf4TPz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0B1446TGz3cGw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:33:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AgCf4TPz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::622; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0B0C18j3z3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:32:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP4BTOWrLM5jO+gn3YJxfiM3taU4gWFR3Vwo8yEg2N9q7nrJ3yMACkf9prj4hLBi9VOafqq34F9I0vwKhU9XQdm3ePXmzsdq4uc2Fbisgx6rnXrQhH0Ci3/oP+qq9YuY8kIS29JDr46B/mucfApyc7zVc9cd2+Ro/yDiNrc1tEn9g0in04QSvvprWUTJrLGWcVTd0sCPxFPNMGjr7Yd6X5R37wBrJ9go3OKypWFBPre/TxRJyXI6o7KRcwyo3dDa1jC5qxHKebaq6ydi2ONkcYPbDLGQt0nO+ezvvXw155TusKkswHkHr12gIgAr8R3Q5JIJujhG5OsORAB5zyf6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOQnlWUNYUB8qCtG2W8VlSKQsINru2OKRNGvUhldzMI=;
 b=ftOXgzMFFElwnT5uST+cUeMPp02u8tq5oUFM/+BiNAZydh3FJm0Vk5qu1zODSOWj8a13lhSwIaO0zhudtFZWuXgFOXFahcD/1pLdl9rKTO1yZmwdFISh5gQs06a+YMvlR68+lbNoGLaHTmdUheiVLXrHAjATxGdiaYh6oeMSK9pxJryMJfP/h4sztl5EUppqAiKVo2q+BYkWeAq9wuEjAKfZM6hwrAU32ymrqWdjqmHmfC5T2ERYj/pAcWhgYkiNuJ/yU3IxJpkSuimNbx3INwihGzYkHfNhcaZD7rW1gHO+uTJl0Z8MwQ7iTBXsNHupx0fRAzmep9buNyElygOm4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOQnlWUNYUB8qCtG2W8VlSKQsINru2OKRNGvUhldzMI=;
 b=AgCf4TPzeTASfsNRkznXBKpOgu/zSZd2zMoswZWStB2+pSZrGutZnjMIn6+WLF1pguJEC4d341//j68g82zDqB84k84WTSSqvciwPTd7MeX2KNNu1pA/joJaIAANMmA+OxCXfhWyYiNnCwVymt2cuRmdouZvXZC1gbOdIWSM7HJ8CBGmZ/Q244rYRy0PQyosDDCG24MkO1IJVPxG+XgK9UiYp9tZcAXF9MrIiZwa/brEaMUlGRV0CPDuOEE9dk86fAEc9R3OyXrXW6qv8KrMiReBeLYSQkp2l4PePn6cRUjUPqvnMwKvQEVDf14xCSzSp47BfBM37Eom+kaQ7xnq6A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:32:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:32:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 08/13] powerpc/mm/trace: Convert trace event to trace
 event class
Thread-Topic: [PATCH v4 08/13] powerpc/mm/trace: Convert trace event to trace
 event class
Thread-Index: AQHZs0j1uKYBppkQ5UmQJhrZd+pTNq+zQlUA
Date: Mon, 10 Jul 2023 17:32:07 +0000
Message-ID: <9d80dbf8-261a-b6a4-dccb-3ced5a81da26@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-9-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-9-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2046:EE_
x-ms-office365-filtering-correlation-id: 412f7838-996f-41cd-a9d9-08db816b95f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PDLMGQHhWg3rRUI2w//aaJggpGzA1YK8n0ZuJX+SoTYG8yyM6ww1i7qC8hF3LoUbBJBVaB48o+ScSR71h6CT+5bR5MfKvhpdFQhZqrSkLZpDJ4rYrV/lz+uWgM8AxRd6adBcbEDgOSBDmLR2fHDUyTzJIfyXBEa0BB5dfnS6DJHI3VEGJdeARNyI8KeON5QzIpcw0Gb2gspKL46xb+51/vZSOwfvt2XcjvUjaGZbnZ0JnYRC3AC6nSetloCXqli3ZTdGmHbMLuVAE9tliLYsac6Q6k/2Tw8BR6DaP0V3gHcKtkGiM51PwTHvK+PtVqzMoTtEe0UPHhX2gmSl+ijhEbljLAq5C3c8dLogQzMmnXIoUwOsmKtqCwk1hWMSsYx4FkDNRMK/U8o2t6QKe1zNcPUSWQeNKv5Rmm0hAU0WQKXaMe81/qEwYNyZPG2uCNKcyab7TL2mgVNt4Uze+cn0BntC0ckAHE0RACwZmUcvx8/9+2SlSFpZoDJ3rya1Tt43beLHVPIqkxE1CdL9JhG8NhPvvgCUUgqH8PrsApdMG/sn3irD4AZ1FdBwYoSKeRqRyAbkbD7eS1CzF4liNJ3fEDeqCxjTElUM79b6or0cF2Y3Cnpf+lGdKp4+7r7+ixaDF445HNv3YWzg8IxrQwQDMx6H3hMb9nLcToboeGXfZqpYOOHNY++b2pLjgiwqJ2O4
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(44832011)(66574015)(83380400001)(41300700001)(4326008)(64756008)(66446008)(66556008)(316002)(2906002)(7416002)(5660300002)(66476007)(8676002)(478600001)(66946007)(8936002)(6486002)(54906003)(76116006)(91956017)(110136005)(71200400001)(36756003)(122000001)(38100700002)(31696002)(86362001)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WHNUTkE5L2tIS0FGaXBHbmtBSHlPdk9zMTBsR1NiUkpURjdpSExhNDVtK3hP?=
 =?utf-8?B?Sm85TGN5U090ODFrN01EV2xvczVTK3NCOHBBb2lteloyWjR0eEFMSTRwWitS?=
 =?utf-8?B?RENUMW5ESWd0TXFkM1RCeWYwZTFUa2UyN3ZTck5PNVE5S0Ixb0l5RWhtVDRz?=
 =?utf-8?B?SmJVMEt3dkpzTHEwOVIxOVAvT3BTRkdMaEkycGdRYjh5MWFtT3hDMlB0MVBm?=
 =?utf-8?B?Q3RqeGhNK0d2bFk5eVVHWkg1dFhNUTY5TEZRQkVHR3htTzhXQ1J2bUJsZHFu?=
 =?utf-8?B?cXkwc0k0QUVWWVEydmt0N2pYLy9KemREMzB2b0NlQ2cxQlBXRFJaR0tyVFcv?=
 =?utf-8?B?R1NIb1V2SC92WENsYXhlKzBIL2hkdjFVQk1TMVVSaFAxQncrN3dDN09mQ2tx?=
 =?utf-8?B?N3RINHAyZlFxdVU0QW0wMElGWUpBcDNLOWdzL3hsSWNzbXlSV3pjbi9qYnFM?=
 =?utf-8?B?SWgxMDlDT1Z6dCtUN3ZFeDBpRG5YOG9QcU5lbDJOQ0NlRjdUZHRLM2Ivd2J4?=
 =?utf-8?B?WWFvZlhWRVlPcStXWEVFVW5PeFIrNGlwSzZmR1dQenNlM3hIVEJaVldVVDcy?=
 =?utf-8?B?ajUxU3Fidk1UWDdtbUJCdm1vajRheFlyODdvUXdtOFY2YjdFSGZ5M0FoWFNC?=
 =?utf-8?B?VmlqUURqTHp4cVpad3FTZjhLS1FRWGN1b1RFdWRzOUx2UWhIamVnUEEyODBZ?=
 =?utf-8?B?aXBRVnRNTXVQTmw5UDdpRUhYbEJEVFBKTitOaVN6MGphbXNqRWNhYkR1NWVn?=
 =?utf-8?B?YlBKTXJJNFBBMURlY2Q0L2FoK3M5UUd4RG5KV0hTVWRMSHFkcXNwRU85Y2U4?=
 =?utf-8?B?U0wwdG5vUGwxR0xscGtyckwwMzFMcEVHYlNPYzJkbDhuZXlVWlFqdWNGNVZj?=
 =?utf-8?B?bzJpcEx4eG5oeW43b3pWQmFhUFNWTWhZd3ZjSHd1WVd5dDE3VXFyUkhWd0t6?=
 =?utf-8?B?WmpXS2lzdFIxNkZqTHZLVVd2SlhCd0FNeC9SRy9yeFp5eWUvME1ENVBUVmxQ?=
 =?utf-8?B?ZWp2Qm5oVHV0UDMwVXpBUTQ5Y1FVRjlyNGp4TGVmZWk3dG1jZDZZSmdYZlNN?=
 =?utf-8?B?aVZPVzdsM01zK2hUZnhvbkEvd2FJT3pEbVV1dHJaQnBXbHRwODY1Z3ZxaVJm?=
 =?utf-8?B?WFYvUjZ2clRGUFpEQ2gvYUlCUi96WWR3aXJrcXpEVzVZaE1FdWJkWGZUU09G?=
 =?utf-8?B?bUZwSCt6Z2Z5VzhZVThmN29FZzZ4bkRKdU1FRThabkpvNkRhc3J6aVBqYys3?=
 =?utf-8?B?cVdWKzVHcHJVVVF4dCszckVsNEttZjhTbDl3cjliNm8wc0hGNDY2Wm5XVks2?=
 =?utf-8?B?MEQzWFFtaXVESU54QzlTNkgvOUVoa3EvZXVFQXpmei9pWU85WklmMG1iZ2U2?=
 =?utf-8?B?V3o3MElvSTl3MFl2bmR6MUZFKzhGcWliVVhmRThPMWhZVVlrMUI4NG0rUkw1?=
 =?utf-8?B?U0ViTkZ2QVAxdjlTUUo2NWgzYnNjWDBnMHFTTUF5YXA1VUl4WEZrSkZZdDRL?=
 =?utf-8?B?aVJhUEN5eEVzL1RTQ2JRL2c5T0ZNVzJlbUgzL1dnN3hSdEJjeWsrak1DM3oz?=
 =?utf-8?B?UExyZmFBKzg1S3NnN1E2RG1DU1NUMVExWHdweGNqc0N5MmUzakdyYjBaa1RJ?=
 =?utf-8?B?OWIyeUQrNDFOQmxRTDFxOXhCb1JWdGtEZ3RtcGV5aGZDRmVvUTJPbGJ5UFZj?=
 =?utf-8?B?VTg3Q2tOWWV0c3Nya2dvd0xCK0lMM2tRQkw5d21URVo2OWZWSnd6eEl6bS9K?=
 =?utf-8?B?ZGhUL0wvZDJ0amNLMEV6NjVRT1VaaitnTUgrVUJnT1JBM2tDV2VCZmpwaDJl?=
 =?utf-8?B?WnkvaWxTeUpQL2xPbDNPRnU5U1NpejdmMDhxSkE4a2hxbXFucmZtQlRNRUh5?=
 =?utf-8?B?ZW9rWlFQTlpYeU0wUVErdDl5OXJKa2V4eFR5OUh1UE9UcS9WR1dRVTRmN25u?=
 =?utf-8?B?dlBSOUY2eHM0Vk1kTHRORFVPYnVLQ21PZWhpYitzd1JTd3RtTkY5NE9lRkVO?=
 =?utf-8?B?VjREUS9zbGhReUFaT0ZCekRQRHo2RW5KZ29PYVk4RHJsSlNGQThoLy9YMDBY?=
 =?utf-8?B?cUtEMFV4NjZOdGhZYllueDkwTHU1bUt3L040WU5pWjc0OWcwTW1VajFpaDYz?=
 =?utf-8?B?dGFQcmZ4SVBnMVY2eHpDZ3dCTk1RU0phUDgxV2tTYVp0SjZCMGRUcUkveEpG?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D4555874553D144BA4788FFF181220E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 412f7838-996f-41cd-a9d9-08db816b95f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:32:07.9957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bi6UGSW4k7eXnzbgBxPHuNNtWZjPPmktPoEvUM9rwRQ5yHfyQhj1yfj7+Atk23+7whZy2SH9t+nUdQ7FaXZgM8F/JCZ/J6/Qwpnus/CGkhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2046
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMTg6MDgsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gQSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCBhZGQgYSBwdWQgdmFyaWFudCBmb3IgdGhpcyBzYW1l
IGV2ZW50Lg0KPiBVc2luZyBldmVudCBjbGFzcyBtYWtlcyB0aGF0IGFkZGl0aW9uIHNpbXBsZXIu
DQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbiB0aGlzIHBhdGNoLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+DQoN
ClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAu
ZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfcGd0YWJsZS5j
ICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYyB8
ICAyICstDQo+ICAgaW5jbHVkZS90cmFjZS9ldmVudHMvdGhwLmggICAgICAgICAgICAgICB8IDIz
ICsrKysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9t
bS9ib29rM3M2NC9oYXNoX3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNo
X3BndGFibGUuYw0KPiBpbmRleCA1MWY0ODk4NGFiY2EuLjk4ODk0OGQ2OWJjMSAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfcGd0YWJsZS5jDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3BndGFibGUuYw0KPiBAQCAtMjE0LDcgKzIxNCw3
IEBAIHVuc2lnbmVkIGxvbmcgaGFzaF9fcG1kX2h1Z2VwYWdlX3VwZGF0ZShzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyDQo+ICAgDQo+ICAgCW9sZCA9IGJlNjRfdG9fY3B1
KG9sZF9iZSk7DQo+ICAgDQo+IC0JdHJhY2VfaHVnZXBhZ2VfdXBkYXRlKGFkZHIsIG9sZCwgY2xy
LCBzZXQpOw0KPiArCXRyYWNlX2h1Z2VwYWdlX3VwZGF0ZV9wbWQoYWRkciwgb2xkLCBjbHIsIHNl
dCk7DQo+ICAgCWlmIChvbGQgJiBIX1BBR0VfSEFTSFBURSkNCj4gICAJCWhwdGVfZG9faHVnZXBh
Z2VfZmx1c2gobW0sIGFkZHIsIHBtZHAsIG9sZCk7DQo+ICAgCXJldHVybiBvbGQ7DQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jIGIvYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYw0KPiBpbmRleCBlN2VhNDkyYWM1MTAu
LjAyZTE4NWQyZTRkNiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3Jh
ZGl4X3BndGFibGUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0
YWJsZS5jDQo+IEBAIC05NjIsNyArOTYyLDcgQEAgdW5zaWduZWQgbG9uZyByYWRpeF9fcG1kX2h1
Z2VwYWdlX3VwZGF0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGQNCj4g
ICAjZW5kaWYNCj4gICANCj4gICAJb2xkID0gcmFkaXhfX3B0ZV91cGRhdGUobW0sIGFkZHIsIHBt
ZHBfcHRlcChwbWRwKSwgY2xyLCBzZXQsIDEpOw0KPiAtCXRyYWNlX2h1Z2VwYWdlX3VwZGF0ZShh
ZGRyLCBvbGQsIGNsciwgc2V0KTsNCj4gKwl0cmFjZV9odWdlcGFnZV91cGRhdGVfcG1kKGFkZHIs
IG9sZCwgY2xyLCBzZXQpOw0KPiAgIA0KPiAgIAlyZXR1cm4gb2xkOw0KPiAgIH0NCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL3RocC5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMv
dGhwLmgNCj4gaW5kZXggMjAyYjNlM2U2N2ZmLi5hOTVjNzhiMTA1NjEgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvdHJhY2UvZXZlbnRzL3RocC5oDQo+ICsrKyBiL2luY2x1ZGUvdHJhY2UvZXZlbnRz
L3RocC5oDQo+IEBAIC04LDI1ICs4LDI5IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3RyYWNlcG9pbnQuaD4NCj4gICANCj4gLVRSQUNFX0VWRU5U
KGh1Z2VwYWdlX3NldF9wbWQsDQo+ICtERUNMQVJFX0VWRU5UX0NMQVNTKGh1Z2VwYWdlX3NldCwN
Cj4gICANCj4gLQkgICAgVFBfUFJPVE8odW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25n
IHBtZCksDQo+IC0JICAgIFRQX0FSR1MoYWRkciwgcG1kKSwNCj4gKwkgICAgVFBfUFJPVE8odW5z
aWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHB0ZSksDQo+ICsJICAgIFRQX0FSR1MoYWRk
ciwgcHRlKSwNCj4gICAJICAgIFRQX1NUUlVDVF9fZW50cnkoDQo+ICAgCQkgICAgX19maWVsZCh1
bnNpZ25lZCBsb25nLCBhZGRyKQ0KPiAtCQkgICAgX19maWVsZCh1bnNpZ25lZCBsb25nLCBwbWQp
DQo+ICsJCSAgICBfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIHB0ZSkNCj4gICAJCSAgICApLA0KPiAg
IA0KPiAgIAkgICAgVFBfZmFzdF9hc3NpZ24oDQo+ICAgCQkgICAgX19lbnRyeS0+YWRkciA9IGFk
ZHI7DQo+IC0JCSAgICBfX2VudHJ5LT5wbWQgPSBwbWQ7DQo+ICsJCSAgICBfX2VudHJ5LT5wdGUg
PSBwdGU7DQo+ICAgCQkgICAgKSwNCj4gICANCj4gLQkgICAgVFBfcHJpbnRrKCJTZXQgcG1kIHdp
dGggMHglbHggd2l0aCAweCVseCIsIF9fZW50cnktPmFkZHIsIF9fZW50cnktPnBtZCkNCj4gKwkg
ICAgVFBfcHJpbnRrKCJTZXQgcGFnZSB0YWJsZSBlbnRyeSB3aXRoIDB4JWx4IHdpdGggMHglbHgi
LCBfX2VudHJ5LT5hZGRyLCBfX2VudHJ5LT5wdGUpDQo+ICAgKTsNCj4gICANCj4gK0RFRklORV9F
VkVOVChodWdlcGFnZV9zZXQsIGh1Z2VwYWdlX3NldF9wbWQsDQo+ICsJICAgIFRQX1BST1RPKHVu
c2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBwbWQpLA0KPiArCSAgICBUUF9BUkdTKGFk
ZHIsIHBtZCkNCj4gKyk7DQo+ICAgDQo+IC1UUkFDRV9FVkVOVChodWdlcGFnZV91cGRhdGUsDQo+
ICtERUNMQVJFX0VWRU5UX0NMQVNTKGh1Z2VwYWdlX3VwZGF0ZSwNCj4gICANCj4gICAJICAgIFRQ
X1BST1RPKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBwdGUsIHVuc2lnbmVkIGxv
bmcgY2xyLCB1bnNpZ25lZCBsb25nIHNldCksDQo+ICAgCSAgICBUUF9BUkdTKGFkZHIsIHB0ZSwg
Y2xyLCBzZXQpLA0KPiBAQCAtNDgsNiArNTIsMTEgQEAgVFJBQ0VfRVZFTlQoaHVnZXBhZ2VfdXBk
YXRlLA0KPiAgIAkgICAgVFBfcHJpbnRrKCJodWdlcGFnZSB1cGRhdGUgYXQgYWRkciAweCVseCBh
bmQgcHRlID0gMHglbHggY2xyID0gMHglbHgsIHNldCA9IDB4JWx4IiwgX19lbnRyeS0+YWRkciwg
X19lbnRyeS0+cHRlLCBfX2VudHJ5LT5jbHIsIF9fZW50cnktPnNldCkNCj4gICApOw0KPiAgIA0K
PiArREVGSU5FX0VWRU5UKGh1Z2VwYWdlX3VwZGF0ZSwgaHVnZXBhZ2VfdXBkYXRlX3BtZCwNCj4g
KwkgICAgVFBfUFJPVE8odW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHBtZCwgdW5z
aWduZWQgbG9uZyBjbHIsIHVuc2lnbmVkIGxvbmcgc2V0KSwNCj4gKwkgICAgVFBfQVJHUyhhZGRy
LCBwbWQsIGNsciwgc2V0KQ0KPiArKTsNCj4gKw0KPiAgIERFQ0xBUkVfRVZFTlRfQ0xBU1MobWln
cmF0aW9uX3BtZCwNCj4gICANCj4gICAJCVRQX1BST1RPKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5z
aWduZWQgbG9uZyBwbWQpLA0K
