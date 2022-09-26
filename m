Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0995EA8F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mblzg154rz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Wls1LcJ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Wls1LcJ+;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mblyy2LVdz2yQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 00:49:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9ePfEq22yLSyAqUpwdSt+arQczm12Au6X71BXJh66S6cxK+CzFi1fNwNGxeLVxcvxNCNhONWrkgVGvZ4akac0OVbA/E7WxFJUdfvzEtvIhTic+VaIV3IKxC47GzBgzS7nrsBeCGfO8o2VyF5g1je0QP9L7r9Z+cEdg2mwpxSMajRfmMxdkVDvcZU9yCApQ2DCpvG+Y1chx9mtU6atTrhbZN8tZwhqESna21eQ1ksYjBeN4JBrub4waaSeIYEjlGRmY5vNxn3TF1UN44+UO18kgxYJWZgmRqsb/khlAUW4oQv1gQuOvg7KVODz+Bds7qrRRXySErQ5sUOk1QPPrdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt9GTsy8F+bHnuQBheVs0v9VfhRNbKOeUP+q80mVcCg=;
 b=M8m+Tn7Q8nAaZ7+gJyOyzYyyNhtEAABwfLojNH0R07kaVA1/8jyxXdT4QtNgB1uKaEQsh+xBQW5mkaYXKWBDG8G5qan46eI2sNwVawf5pNUNPfwekvQubcOKY5tKpzHqNcLxuOf/jhVE4xlaP/S6ASBQ/7Uci2S85ka8e1TJbbWInaeV79jSzaa83xfmDb6Jp46UctI0Lt0qhQ3iarhBuFFhJ17gR6inffV9Zsj8QTFmkzxjd5rewuz6Jmxo7p+SLr752yWJ9n4sxxbs+Bidzd+OJGbg+LtfcUT0Gu8ItKqSKVgiWLV7F0arYHbtA0vpc9xzOpy0eN4HMRUYt5wokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt9GTsy8F+bHnuQBheVs0v9VfhRNbKOeUP+q80mVcCg=;
 b=Wls1LcJ+K3ZIcLF9gtcu3Rq+g2meOvPKQizF2C04qvoOWaXK99m+yb7bDZf/ZkUjeMsuun4T5KZ0Pd1LId2oKroe+Rcz8YlYSBtMDo6R5+jN0VdzYf4EfbtL1pzzHs2aQH43mXRxJVqCWMbjIgNdVpAfA46yHcdz6j9A4Aj8JflDvhJJ03h2dptLcxS8xYG2XM7qb9vDTv/+mL7WjcI34MkPbppaHijbjcG0hFspoB7VipUnps1QXRHcxgobCi6RreXnaiZtFegre/gnSlxeLuID8z8SCXcrfBmwJwLxXD2QDL/yuehVU0mFWW//k6/ATo96ZO6nbbwm+7exoKT0dQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2281.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Mon, 26 Sep
 2022 14:49:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:49:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 3/6] powerpc/module: Optimise nearby branches in ELF V2
 ABI stub
Thread-Topic: [PATCH v2 3/6] powerpc/module: Optimise nearby branches in ELF
 V2 ABI stub
Thread-Index: AQHY0XNfLnJuuCOamku0i1jEkbuPba3xy3CA
Date: Mon, 26 Sep 2022 14:49:26 +0000
Message-ID: <44761b8c-f51f-ae32-b0f6-d9ab09670f9b@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-4-bgray@linux.ibm.com>
In-Reply-To: <20220926064316.765967-4-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2281:EE_
x-ms-office365-filtering-correlation-id: 18fe6d6c-1ebe-4884-906a-08da9fce4ed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lFKFs73PJ3FhjwhIcWqXxO6M577GnSMdUc064vFFGFZmYf/HjkowBhDGGCPq6D7GlIpYlYThcwhxmfnOQRKPVMXtT+WRC9kkfpIDxUTd+IyW9lCca+/fXD+C5kTLJGSFFJ/xoRd8g6mUhiMMLl6NB+tML2iRqSlWzHLAw97R7nl41W0QQ4rUO/m2351GX3Zsw/zxVbVSp80ZW+9NWbPDg/DgCRF5ix6Dd/9uDdGi5K9E5N0W5dFQV6kpcKmfM+FhvOXq7KZH1OIZuy5Pczcmu7xXsuryRRmBh8bpwDRbD/DeUqYhd8O7dC9mdh2xQgwgTxE/uFDXFnl8/760dtVEqgg0N5EvON6tNRoH6jlACtofR+L9Mn++0gFGyXJSE6W7cRrH1/Z0PmoqE0qrc/lF++b6YVE4IKZ1gJw8ytcKqXixJHRMuGG/saFrBULi8IVMiOzMzFVh7aCPE6Tbl9MOib6axuFLnSKuwS4QcRAVMjvMCUVE5gChumejtHWWHpYnvUYvSjwiWORx8wJvdpPtkgZH1oIFMMaqcPjhRZ4BCQAVTeuaBWUZRAFQxzrhHbRcACTm0rN6r9bpoxey7rCrUR4GZ2njXusCQEcGB+cVHR560ap7Vzlqi2rEjnaQT3NyD0R1UF/FJhjLPZ3hc3slrQHnVE6GNEiNBrDDx9RmDm7Cj/KA4fvsmXQTFSrzqXkJMM/9y2JDEykrsrJ85KMbXu893dck2Uv73RHTQhwszCd5CTBlBv73GiLVCDyfenipjshv0pYIiBlvSJSQPdsTFhj/nRAqJd8PMWSFzCrxLv8ZXGZQUvIqzlf/9GEyGI75qn6OSKIuetFiP1+OGhV7CQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(346002)(39840400004)(451199015)(8676002)(76116006)(4326008)(66946007)(66556008)(66476007)(66446008)(186003)(64756008)(6512007)(26005)(6506007)(110136005)(91956017)(54906003)(2616005)(36756003)(316002)(2906002)(5660300002)(7416002)(122000001)(44832011)(41300700001)(31696002)(38100700002)(38070700005)(86362001)(8936002)(71200400001)(31686004)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RmdsSldQeUxXekJHUjhDVTh4Q0hSOUErVnVDcjZkcWZRcG1JOWlhSHFGVkZM?=
 =?utf-8?B?QTJZRSs4RktWMzFFc0tTTGEybzdRMVFMTUZvZzBZK2dUS2x0MjVCN25BWEk1?=
 =?utf-8?B?cFE3UGJNUTB3MlJMdys4Ync1dVN1blpRMlFmY1Q2T1NSYWNXOXZHd2k4ZmNr?=
 =?utf-8?B?M1NDeUw0WVRjWjEyYUw5Y3ZmZjkrQ2JLbVFhdGdzc0lVaGhsOWR0dTh5MGJp?=
 =?utf-8?B?eTE2djdwT0pzcmVCQllqeEJmVnR1RStvUEVuVFBLVDZiTHc1MGE1WDB2TkQ5?=
 =?utf-8?B?M0Q5a3J5ZzhhYndEd0NFNXpsTHFiMTVLNTdFckJvS1BQWEE2NExsbVZhVkQr?=
 =?utf-8?B?WG5mdHRKRi9YMnBRa3VWRTBybHJwdVlicWc5QnJ1Vk9CQk94WS9KMSsrZzlv?=
 =?utf-8?B?M0dQUlUwSzRhVCtneGZ4cVZxQVI1K3BtUHFiSWMrTFF4MGkzdU5UclcrNFJQ?=
 =?utf-8?B?ajdhaW1JVHVHdXFjYmk3bGd5cTE4ajEranhmdFhjWEpkRmZhMEZFVHVPS3dN?=
 =?utf-8?B?akYwNTA0cUN3NnBZcG0wWjR6MUJGRS9EUzh1eTRsekRtUkx4SUFpMHE3T3lz?=
 =?utf-8?B?RC82TVh3NzFMczg5bWxPYWhkclNhMEI4d2xQZ2J3Z2NrNk1CZXpWOVB1V1FB?=
 =?utf-8?B?T1FVaDhCOXNKZlFOUVllTTNjankrV2dGZW8zZjR0ZUlzSlkrM21kSXlqWUZB?=
 =?utf-8?B?VXZYMVd4NkVITW52aExkcXF1TklVT0kwNENLd3JjRXBPd0VpSmsrbjFOZ2pD?=
 =?utf-8?B?WHNFcDFSektvb01CcFNXV214dlkzYTBXZE1QTlR0UWhDQVljazdKTlplK3BN?=
 =?utf-8?B?QjlsYi9UbUxUdCtLSDNYbUs0UVI2U3lTYkNDZmx1Tk81WWt3MmdJeTRPTjZD?=
 =?utf-8?B?VjFLQWIxU3VuTi9JSGZSdEtpYStOTnQ3QmFlWS9kSmNhTFVBSERSTkdIWlFD?=
 =?utf-8?B?S3FlVjhoMjczR0VIOXVpVFdTcERwaUd1bVJrc3RncG9mMkdkd3o3VFhTNTJs?=
 =?utf-8?B?eExUcEkwZEQ4cjFIbG5MQWFFUnltNkxibVBCbFJnVXc1WTZidGk2YTJCNGxI?=
 =?utf-8?B?cEdCL3dPNXVncitLMEJLQkQrazFLMHBrb3BjRzdEQVdzelU5Z3VtdlN4aG1j?=
 =?utf-8?B?REtxQm1YN0o2SFN6dTJIUUZpQU9mR3NwcHAzV3BDanEvbVJnR1U0TXI1NUp1?=
 =?utf-8?B?T1pyVGpkVEFTTHBsSTJkbmpheVJxa2dMWWdqUUNRa2luQUZWNVZ3ei9ZUHVD?=
 =?utf-8?B?NTBlbDVibnN3TE5rUDV5dkZ5R3h2MVhEUFdIMFQyM21JSnh3TVBKTUFha2FE?=
 =?utf-8?B?ei9WMVROZWFoc3ZzaU5rNkVMTDVCbis3Zit1ZEFJanVaWXp1M1U4WXl2SVhi?=
 =?utf-8?B?NkdtMEpMTldFSTV1YTNqWGFLRHVCQnIyTjFBUnUwOVM1MVZhTU5hOXFUWnBs?=
 =?utf-8?B?MGpBNGF3VGI1VUdvU3hheXRabWlPQm5JcWFnb00wbGdaeURYVDJ0L0hnN2Vo?=
 =?utf-8?B?SzNIcndlK0xmTlhpM1hoSWxZR0E0Q0VoeUNpQ1ZPSENCZVVqY1I0MmtlUXNx?=
 =?utf-8?B?NDhaYjBXZ050VUJDc0dIbkdBSm1rSCs1K25tWXljNmk4d1NkcHp3RWhoNmpO?=
 =?utf-8?B?dlEyOGU4eEdMWkpabkE2Vm5jSitJMDJXMlpvRDVLRTR5WVZ4eTZ0OFJBUVN4?=
 =?utf-8?B?VXV4bkhmMTVRYTlhWDBLcXZLazh4M2U3cTVBKytHVGNaaFJDaUNFTjdtT1Iy?=
 =?utf-8?B?TW16UGZSbVdsTnRHOTRzU0lMWGNoSjNPYUlsSERIQ3J6YzUzanVETG1xamdt?=
 =?utf-8?B?ZVNKYkpEcDhxTzZmWU0vWEdGd29IWWlYWmhHek85a1huVTI4WVZPZXZRZlhY?=
 =?utf-8?B?UURlaUpmeEo5MG5hN0Z1MndLZnZ1SXhTWGlaTExXNUJ0ZStKWjhMVVNMVkFU?=
 =?utf-8?B?NXNRa0tBUmVBWUNkc1VHekxSTFl5NUc2bUw1ZkZEOUZzLzM5T3hzQmJtMHdO?=
 =?utf-8?B?elBacis0R3o2R3dwalpLdGVQZFNEOFR1aVZzYytFckJkYXYwTTNCSWY0VDJG?=
 =?utf-8?B?ZTFJWmt0NnpXaVZJNnBCNEU5TmlEaFBjcTEzTFNaY0JmNUZ3dkwvcDZUNW8v?=
 =?utf-8?B?YllHb0ttcVhmdXl6RFVqNjBZZExEUFZMU0dvdURrWitiYzVrbEFOTFF5OWE4?=
 =?utf-8?Q?DQKhCqlaZDbB+zFf7Izhm8c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07380700447AC947AE4EA4B49E1CACB6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fe6d6c-1ebe-4884-906a-08da9fce4ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 14:49:26.0641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wcCkK+BFzxodJIecEP690YUkYnPLlNmmzVjF+kHqK3eCVALCh52i60qsxmlZkWzyvKdzi9lrgnNQQQ8/dMhMOXQB7ql1CEz6cVrkZJ+QnXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2281
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA5LzIwMjIgw6AgMDg6NDMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
SW5zZXJ0cyBhIGRpcmVjdCBicmFuY2ggdG8gdGhlIHN0dWIgdGFyZ2V0IHdoZW4gcG9zc2libGUs
IHJlcGxhY2luZyB0aGUNCj4gbXRjdHIvYnRjdHIgc2VxdWVuY2UuDQo+IA0KPiBUaGUgbG9hZCBp
bnRvIHIxMiBjb3VsZCBwb3RlbnRpYWxseSBiZSBza2lwcGVkIHRvbywgYnV0IHRoYXQgY2hhbmdl
DQo+IHdvdWxkIG5lZWQgdG8gcmVmYWN0b3IgdGhlIGFyZ3VtZW50cyB0byBpbmRpY2F0ZSB0aGF0
IHRoZSBhZGRyZXNzDQo+IGRvZXMgbm90IGhhdmUgYSBzZXBhcmF0ZSBsb2NhbCBlbnRyeSBwb2lu
dC4NCj4gDQo+IFRoaXMgaGVscHMgdGhlIHN0YXRpYyBjYWxsIGltcGxlbWVudGF0aW9uLCB3aGVy
ZSBtb2R1bGVzIGNhbGxpbmcgdGhlaXINCj4gb3duIHRyYW1wb2xpbmVzIGFyZSBjYWxsZWQgdGhy
b3VnaCB0aGlzIHN0dWIgYW5kIHRoZSB0cmFtcG9saW5lIGlzDQo+IGVhc2lseSB3aXRoaW4gcmFu
Z2Ugb2YgYSBkaXJlY3QgYnJhbmNoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3Jh
eSA8YmdyYXlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9t
b2R1bGVfNjQuYyB8IDEzICsrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxl
XzY0LmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5jDQo+IGluZGV4IDRkODE2Zjc3
ODViNC4uNzQ1Y2U5MDk3ZGNmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL21v
ZHVsZV82NC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMNCj4gQEAg
LTE0MSw2ICsxNDEsMTIgQEAgc3RhdGljIHUzMiBwcGM2NF9zdHViX2luc25zW10gPSB7DQo+ICAg
CVBQQ19SQVdfQkNUUigpLA0KPiAgIH07DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX1BQQzY0X0VM
Rl9BQklfVjENCj4gKyNkZWZpbmUgUFBDNjRfU1RVQl9NVENUUl9PRkZTRVQgNQ0KPiArI2Vsc2UN
Cj4gKyNkZWZpbmUgUFBDNjRfU1RVQl9NVENUUl9PRkZTRVQgNA0KPiArI2VuZGlmDQo+ICsNCj4g
ICAvKiBDb3VudCBob3cgbWFueSBkaWZmZXJlbnQgMjQtYml0IHJlbG9jYXRpb25zIChkaWZmZXJl
bnQgc3ltYm9sLA0KPiAgICAgIGRpZmZlcmVudCBhZGRlbmQpICovDQo+ICAgc3RhdGljIHVuc2ln
bmVkIGludCBjb3VudF9yZWxvY3MoY29uc3QgRWxmNjRfUmVsYSAqcmVsYSwgdW5zaWduZWQgaW50
IG51bSkNCj4gQEAgLTQyOSw2ICs0MzUsOCBAQCBzdGF0aWMgaW5saW5lIGludCBjcmVhdGVfc3R1
Yihjb25zdCBFbGY2NF9TaGRyICpzZWNoZHJzLA0KPiAgIAlsb25nIHJlbGFkZHI7DQo+ICAgCWZ1
bmNfZGVzY190IGRlc2M7DQo+ICAgCWludCBpOw0KPiArCXUzMiAqanVtcF9zZXFfYWRkciA9ICZl
bnRyeS0+anVtcFtQUEM2NF9TVFVCX01UQ1RSX09GRlNFVF07DQo+ICsJcHBjX2luc3RfdCBkaXJl
Y3Q7DQo+ICAgDQo+ICAgCWlmIChpc19tcHJvZmlsZV9mdHJhY2VfY2FsbChuYW1lKSkNCj4gICAJ
CXJldHVybiBjcmVhdGVfZnRyYWNlX3N0dWIoZW50cnksIGFkZHIsIG1lKTsNCj4gQEAgLTQzOSw2
ICs0NDcsMTEgQEAgc3RhdGljIGlubGluZSBpbnQgY3JlYXRlX3N0dWIoY29uc3QgRWxmNjRfU2hk
ciAqc2VjaGRycywNCj4gICAJCQlyZXR1cm4gMDsNCj4gICAJfQ0KPiAgIA0KPiArCS8qIFJlcGxh
Y2UgaW5kaXJlY3QgYnJhbmNoIHNlcXVlbmNlIHdpdGggZGlyZWN0IGJyYW5jaCB3aGVyZSBwb3Nz
aWJsZSAqLw0KPiArCWlmICghY3JlYXRlX2JyYW5jaCgmZGlyZWN0LCBqdW1wX3NlcV9hZGRyLCBh
ZGRyLCAwKSkNCj4gKwkJaWYgKHBhdGNoX2luc3RydWN0aW9uKGp1bXBfc2VxX2FkZHIsIGRpcmVj
dCkpDQoNCldoeSBub3QgdXNlIHBhdGNoX2JyYW5jaCgpID8NCg0KPiArCQkJcmV0dXJuIDA7DQo+
ICsNCj4gICAJLyogU3R1YiB1c2VzIGFkZHJlc3MgcmVsYXRpdmUgdG8gcjIuICovDQo+ICAgCXJl
bGFkZHIgPSAodW5zaWduZWQgbG9uZyllbnRyeSAtIG15X3IyKHNlY2hkcnMsIG1lKTsNCj4gICAJ
aWYgKHJlbGFkZHIgPiAweDdGRkZGRkZGIHx8IHJlbGFkZHIgPCAtKDB4ODAwMDAwMDBMKSkgew==
