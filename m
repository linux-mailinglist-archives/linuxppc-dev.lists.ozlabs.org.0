Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DE74DC8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:31:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CA0PwrYr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09zN16dhz3cBZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=CA0PwrYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::606; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09yQ27Gxz3c2T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:30:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcosSPmg+or83YgDoS3VXfe2xgPpOnJZiUquMQ04xQ0L2RTtj5SY6NT3ynrmH1vu5te7xcYnUX7sZHZe1fGSQKwjqIwNcP0cPBb39nuZsqRrydrOA+MhHCeZvAp3sSz3g0g6o1zQd9fC/MSV7FHS2e41NLTr6+7KxdxwzDf/xNHa6MAirusiTmkLGDj5Pva6qPRj/G2JxvCE1OGkiQLmAIRXh2LvreKwmcyoW45HlEDzivglOnqyxziMwxkrtWLuwNuLj2mfYL7hYmP7K5zpC7Mtid8lTMEcfxDhSSDMaa6FODJuCQqy6gY1x/0KzMyaQ3en029RNXRN2CIE+c1teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9iI+w3MBOOZCJMP+zSz42gk7MYkZLe6f43MDXE0V3I=;
 b=MJh2Jx3KtqCI05PsIlkPNTmcgUAGBY27lnuBID7p39RGCAHdhVz36HyoNgmtX0UsgTSN5zQKVGez6B6bK6xYWendeVtj7U8c1vR4bdWeYt3kuWQtCUsbLeMk43Xm5Z3SqVbpaQr8UscJqx+y8j4FcyWl15qnAF7G7keNhhK0tB6CsbcOdSqAAh1OZ2cP7nCEsbZfu9AySaLAI5jIZqxpwD+mMhmjYeKE/uMenn2cQ4XFDKHNpEYDtNurlY4M31sXqenQUGP0y+Y2w87fwfPUV/eJYZWMCHQM0GDa9StDMnVOLlpAcnuvNgC1HIdx56vRJufPT6uogaJtFqZUohwrBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9iI+w3MBOOZCJMP+zSz42gk7MYkZLe6f43MDXE0V3I=;
 b=CA0PwrYrl/NfwsxGX5bMb2WrKgVprrwfkpeabDf+oTQsmfbUcm5+f4OwdlO+qQQuOLgAKkTnA78LYSZG+Ni4Xvol1TfAUogo4h52ulMZkBEpC4PqMtMjWzKKV0xEnZvwKZwkaIv2DLR5PiHhuyV0pGrf+r2VQj+ZTR7McYCuIYV8ogHNjBsVGjpJEy20IxJxK1/O59h7au6QKvPjo0mF2aFKafkeizM4oJ/t3QlFoiw6NZkywyMjgDRPm6+cH3wfZnoIm77nysqRsrhjZsnJ63IEdTTIEr8aQINyy1hhWdsxozwGmlbjNQxUiL0eNww8CGg6NZJNueL65xbAkxkPIQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:30:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:30:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/13] mm/huge pud: Use transparent huge pud helpers
 only with CONFIG_TRANSPARENT_HUGEPAGE
Thread-Topic: [PATCH v4 06/13] mm/huge pud: Use transparent huge pud helpers
 only with CONFIG_TRANSPARENT_HUGEPAGE
Thread-Index: AQHZs0jxvV15NEHdNk6u/GFcpEoZkK+zQeaA
Date: Mon, 10 Jul 2023 17:30:35 +0000
Message-ID: <850cf0cd-d156-283e-c1fd-572dcdc9c673@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-7-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-7-aneesh.kumar@linux.ibm.com>
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
x-ms-office365-filtering-correlation-id: 4bec3fb7-9681-4b1b-f166-08db816b5e9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HbQJZFtehkxhFciV3vrOrsuFYDOXA0wBXoR8wlgL97xexMr4KNGq6dUKDSxoZZ0e6p99NtGiX5xiKUAPsi164c2BNJ1+uxPmZkX1TiOvbokTfbfl8pdh2bNWZqjgX+hzKTHI01Y4teYrp+F5Kpq20GO7nXTo9kc/zjsfHhT+7ecdGpnUQs45GGrkQ3a+HI5m5I2h2TVK2B/508aKJJFZV3n6Kisdh13TtBVm42XIGTGDf93mVEjwtCK63yuCnFbQ6J37Xbav9btuMRkt/kNcQCsquDvN6YdSQZF4yGHKYk6Kv1wTrqvQFROCgmOmHQ6GHseW05wUBLg5CgWhC3pWBHmNXDyFeJDXdJyoF/4JsdBgtJYV/YpsAFgI6LLlXZjRl8SIoCapVoQrU8I+uKRkUr0NJqLXIqv1eKCKSssD28g996/4Qzjtw2/qNKKZOL5UOobMoedvrTRgpgXxdYA0xCWL6GLOmwympJRSDJ4WImK7YtNt0U0x39ujWu2o3ln6TJF/G87XR7EI9KIC9QdoX8qpWhPrCp+xz7A5fcP8oT9tV4/rCfPeLA1xk418dVm4zbKKsZ5zZIP+MoBy81i7eTk1G67p6iCTg/e9Do7UhW301mTc8Orn2znxoyinl2gF58KUZqBt58vV92QpElcBzU4V7kOZwIRiWHkRBz3Vj/iZXT3IL4p1IasJgpVvGyIzW9GaVcz7hBK5fu/qlk3rFw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(44832011)(66574015)(83380400001)(41300700001)(4326008)(64756008)(66446008)(66556008)(316002)(2906002)(7416002)(5660300002)(66476007)(8676002)(478600001)(66946007)(8936002)(6486002)(54906003)(76116006)(91956017)(110136005)(71200400001)(36756003)(122000001)(38100700002)(31696002)(86362001)(38070700005)(31686004)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZUs1RGtIMEMzSTFrZUtRZDNHQWRJZ25lRVhCd1hvUEVvT2YwMWNjS01NRGNR?=
 =?utf-8?B?eVFxMGtPZG5waDVaYWlKdlpXK051Wm04M0k2MGMzbk00QURuMmFDZW9MNW1V?=
 =?utf-8?B?NkhkT1BMa25rZGZ0WVlGQXNwNnc4SUpxTkEzQmhSQnNIc204SEtjUTlJZFpi?=
 =?utf-8?B?NlZHU1lydTZ6eVR4akdldW9OUSsrK1NUbnphcDdsajBneGJWck5wTlVERThC?=
 =?utf-8?B?Sm5pZHdueWo2VVhDNzN1elQrdkFzZnBGay90MFRmL1BDTzVySlVha1dIZjBO?=
 =?utf-8?B?NkRidEdtTGtMYlBiTWhxQ0xNOG5TbjVjMVdvRVMyVnhXbkNoQjdXaEVjRGZE?=
 =?utf-8?B?MzN4OEk3WGl0ZkxxaVptYUNpUE9qeWtoWDA0WFV1OGE3R0REUVR4MjhpaWJn?=
 =?utf-8?B?NHEvT1hNdkpjQ1RhbDJsQXB3L1pDekJzblltMitjRHY0QjBPMlhBaGRlM0tr?=
 =?utf-8?B?YXJ4S0xqSDVxTW84ZkNpTm01U05aVXA0YnpSc09HQktBRnRyU0Ixb3c5WUhi?=
 =?utf-8?B?dWhGUXgxZ2NWbVRSNHIwV3g2ejYzMk1XcVhlMk10UnBMZTdYQVJqUVBSaGpJ?=
 =?utf-8?B?R250Wkp2UUZUSGhvaTdoWjNHeWNwZlFGRE5zZkdDUURUNnBqKzdYTXF6MWhZ?=
 =?utf-8?B?aVR0VzJ4c1B5elNvei90V29XSzRjTGIvM3YxVzAzUERUR1N6Z1F1T2U0OVFH?=
 =?utf-8?B?MlkyL0VrTnVqNHNZUWY4dmJveUsyanFIMzZhZXZIQWNzQzJwcWFVOFRJaXIr?=
 =?utf-8?B?cC9FemdkNHRlcy9vUEZQU0JRTVp4VWdDZ0VDK1FhcjlabWEyeFY2SVNNZ0lX?=
 =?utf-8?B?MFBaQ2tpZVJSY3R0VHJOSm5pOGQ5SE1RMjRSUnJhbkc5RU1PTkFYZDdrY296?=
 =?utf-8?B?eG5DZmhDek1YcXh3T2I4Vlp3U3hmMktmM1hEZGRRWHV4WVk2ckZXbG45U1Z3?=
 =?utf-8?B?akpwTjhlL0dSWDB3ZVFpV1NkUUJCbm9oUnlrN3dHamJvSGQrcDdrV0V0dzMv?=
 =?utf-8?B?dXhtUnVuVFd0VTdQdWRoZUN5TTUxRG1YdHBITEpkTXg5QVg4V2lFMEpJY0x0?=
 =?utf-8?B?K1NPOFFQTm1HU0VKZCtNbmR0YjMzam9yeU41eis3MG54d3o2OGJBME1CNHl5?=
 =?utf-8?B?bFVyVFpweGRuNzEwRWpTSFBmR2dVMnBFM3EwdVhxZVlGOTV1TlYrdWJPZ1Zv?=
 =?utf-8?B?c3NvOUVkNnowS3Y0R2ZVMFhTc1RkYXZZZ3JzRFlGMlZJeEI0aVRMbUhMQTBN?=
 =?utf-8?B?ZS9tNjZOL0t2Z2N5UFJUY2pnNmRHeVNtMDJIRm95RkdiNDA0OVgweTJrZUZJ?=
 =?utf-8?B?RFJVcWMwcGVLYzZZQk1LencvaHN4Z1VyOWtEb21NRmdrN2NYbi8vOGtqYWo3?=
 =?utf-8?B?cVE1Ny9tRVBNQVVVREtXTkZETmNpT3VMbmc2dUI5NXJBclVDODJHUnZFTmlN?=
 =?utf-8?B?Qjh2b3c0NEl6Rm5jNE5QZkM4eVZRTXBlUm5HWmwxT1FtaVBGRmVzUHp3MGJJ?=
 =?utf-8?B?aUx4Q3FyWThqTmY5ZzhFN3RVcDM5LzlVdTRSSUZGcW9ONFFBZEFuMUs1Sm9q?=
 =?utf-8?B?cE5XbGVMTE03L1o4RGE2TnhOYjlWcEx5bEFGcmh6cGRhajJoUTdtdWxaR0ZS?=
 =?utf-8?B?c1pvWXdKVSsxamxkY3Fhb3p4aXV2d0hwcSttYTZVR2xhRzFob2JkYzROTVFD?=
 =?utf-8?B?NElIUTBVWi9BV21POVhPSUV0bmxOR3phWUdFTFVrM0JKVjhvNTY0Ui9xbjJ5?=
 =?utf-8?B?WVRiOGJQdG43aFpCMlRZazdmZndyRHJReWtwaGFHWnFobm81bzNMendrbCto?=
 =?utf-8?B?VWZYQ1pNQWgxNDFaYk1kdXpYUjN1THpnbGhaaGVkSTZ4cnQzbURITUZqbllC?=
 =?utf-8?B?VWdTN3BBQkpKSldMVUhnYWFrS1VkWFNQRUhuT0o3TEN6d3FOK29ZTjJxVEU5?=
 =?utf-8?B?UTRFcjV5c0lCYnhmamR0N3ZJSWpienhialZpUWR2VGg5SDFpWHJJZGpCbThp?=
 =?utf-8?B?VzNFdlRteWpNYjNodVM0UlVOZGtZdUZMSnhFM2hlbXUvdlVoeE5Yb0xjbjQ1?=
 =?utf-8?B?N2pYRHhNTUFyV3ptb0FlVGZtL1c1RFpTc1FjRGdLVkpEbXBKeHBtY0k0NUlD?=
 =?utf-8?B?NUdPMjBEcHpjVG1QcnFMQnk4dzY5Y2Z4cklIQUM1aVFBN3czRDlMaWtNTGZB?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB33162E4BC77A4790A9AD86BFFD0BD3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec3fb7-9681-4b1b-f166-08db816b5e9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:30:35.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WXNr1h30sI7dx/eAnhqpPm0BziVc33WGVU1TWnY9iqx5tHLr141Ro8JooaOgbxvTxg3D/f1cBbmZQ+PCJGTGYKnVoVMhlz8o3sH6VNUGBU=
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
Cj4gcHVkcF9zZXRfd3Jwcm90ZWN0IGFuZCBtb3ZlX2h1Z2VfcHVkIGhlbHBlcnMgYXJlIG9ubHkg
dXNlZCB3aGVuDQo+IENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSBpcyBlbmFibGVkLiBTaW1p
bGFyIHRvIHBtZHBfc2V0X3dycHJvdGVjdCBhbmQNCj4gbW92ZV9odWdlX3BtZF9oZWxwZXJzIHVz
ZSBhcmNoaXRlY3R1cmUgb3ZlcnJpZGUgb25seSBpZg0KPiBDT05GSUdfVFJBTlNQQVJFTlRfSFVH
RVBBR0UgaXMgc2V0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVl
c2gua3VtYXJAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4
L3BndGFibGUuaCB8IDIgKysNCj4gICBtbS9tcmVtYXAuYyAgICAgICAgICAgICB8IDIgKy0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3Rh
YmxlLmgNCj4gaW5kZXggOTFkZWYzNGY3Nzg0Li5iNWFmM2UwMTQ2MDYgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5o
DQo+IEBAIC01NTgsNiArNTU4LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBtZHBfc2V0X3dycHJv
dGVjdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gICAjZW5kaWYNCj4gICAjaWZuZGVmIF9fSEFW
RV9BUkNIX1BVRFBfU0VUX1dSUFJPVEVDVA0KPiAgICNpZmRlZiBDT05GSUdfSEFWRV9BUkNIX1RS
QU5TUEFSRU5UX0hVR0VQQUdFX1BVRA0KPiArI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRQ0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwdWRwX3NldF93cnByb3RlY3Qoc3RydWN0IG1t
X3N0cnVjdCAqbW0sDQo+ICAgCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHVkX3Qg
KnB1ZHApDQo+ICAgew0KPiBAQCAtNTcxLDYgKzU3Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBw
dWRwX3NldF93cnByb3RlY3Qoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+ICAgew0KPiAgIAlCVUlM
RF9CVUcoKTsNCj4gICB9DQo+ICsjZW5kaWYgLyogQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdF
ICovDQo+ICAgI2VuZGlmIC8qIENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0Vf
UFVEICovDQo+ICAgI2VuZGlmDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9tbS9tcmVtYXAuYyBiL21t
L21yZW1hcC5jDQo+IGluZGV4IDExZTA2ZTRhYjMzYi4uMDU2NDc4YzEwNmVlIDEwMDY0NA0KPiAt
LS0gYS9tbS9tcmVtYXAuYw0KPiArKysgYi9tbS9tcmVtYXAuYw0KPiBAQCAtMzQ5LDcgKzM0OSw3
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBtb3ZlX25vcm1hbF9wdWQoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsDQo+ICAgfQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAtI2lmZGVmIENPTkZJR19IQVZF
X0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0UpICYmIGRlZmluZWQoQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVO
VF9IVUdFUEFHRV9QVUQpDQo+ICAgc3RhdGljIGJvb2wgbW92ZV9odWdlX3B1ZChzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBvbGRfYWRkciwNCj4gICAJCQkgIHVuc2ln
bmVkIGxvbmcgbmV3X2FkZHIsIHB1ZF90ICpvbGRfcHVkLCBwdWRfdCAqbmV3X3B1ZCkNCj4gICB7
DQo=
