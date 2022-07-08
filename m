Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F345C56BE82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 19:36:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfgSm6Jnlz3c6m
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 03:36:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JXNRTMiz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JXNRTMiz;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfgS05MKLz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 03:36:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALAH+pW2q6PrVsPfjqxoaZstbIA5NK8GWLLG3qOzCR8nCKu/bacMYPf6Gnclz77hWX6jK1jmUD/JBOuPH4nojcHd1PUeVm8i5K5wl74UtQowa5TCjbw5rsBSlzVVcyxbX4N2INLItitKOgLgcpMbWs9+4kXlu1UVuqIsjZPuEO1ZYi/2PZsBDvQVody28YSBQCewGysPGFYouLzhmWJAqme+6/3PT+m+kniZS36R/I7Jba6/Na1QgPvJG/TjYE/CGxM/HVxt/NeSaaqftRTKPA2T1UWRFuz3TI6tirFjS7DhymkYtAdsLigC2a7yvTAgjMNz+V8yzniXGmWnfo8aLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNyylepevTlqndHvHPP+PtEzXcqd9VdmxwOunAAFVQw=;
 b=b7BXZ87o/IoJd9A/EZp2aE01Sx9XSE25GUKu8dF+PvkjWeIGwszRVAjZZhhctwfiu7JuzBQnVCYVMd5WmWC5PqJPNCv+mCZJRtj2ZmeWe/UHNuPK23pd7W1nimoqcR4AdPKy1/y1X01AsfdX4/wR6HaT+HH8psb7u6banem7iWmwTJ9E/+XfRWshw58ddUDasOfpMj41pUCFerKaxypobTG57RdFfUl6egKhya+Y9yIdwp2FXkQpNosHC21RkJFDQea9kb2hWheRu28zq4khRsPa59MQDRjoPwrJMTu9iR1+krnwbHHT7GwgEaiFs0/ADD2lasnG0t71gTk5+ftSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNyylepevTlqndHvHPP+PtEzXcqd9VdmxwOunAAFVQw=;
 b=JXNRTMizAUpc1EdJXwS9cCvAZdp3uezWeXzIrFvdkBSd2u8ot2h1VArhO7ybb2xuHAoUR8MyqCIBWqA1xUFoxw89Ee5re7p3MLnxeOXZs2dyZk5Dr4XjFoYGjyo0kFON3uv630rDmS6IQykYwRhDV+9/e4zOPQNHO/TSqN3goEvmtEZ5WIh5DOuz1PSn+dDqOgRNUTnrE9LReWsNxvRvdEehXHBhskC2TWnGxavD7uiJ8rLSv+nR16ZzZg5j280Ua5L5c9I1BBkGOKjzYRUW8Ih2rpaIYuQjCE+2RnoYZkyXlyFoRn+saN3etfnQbd5faenHXUgbnVsa4m8LXGYyPg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1954.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 17:35:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 17:35:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH v3 03/12] objtool: Use target file class size instead
 of a compiled constant
Thread-Topic: [RFC PATCH v3 03/12] objtool: Use target file class size instead
 of a compiled constant
Thread-Index: AQHYh/jnnydsv0r4QECyYWeSolz8GK100miA
Date: Fri, 8 Jul 2022 17:35:56 +0000
Message-ID: <e51d2b09-3531-3c43-d9dd-7c518b9ebefc@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-4-sv@linux.ibm.com>
In-Reply-To: <20220624183238.388144-4-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91074068-fb8a-420a-4a49-08da6108507c
x-ms-traffictypediagnostic: MR1P264MB1954:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  e2kDIIC61Q7t82ZLZBxli6Sn+Jwd3ddDBjHGkmY8Od478qc/4VjfrDGGUYe5vHsuArkjIu0jjbc42ITnSQLvcg5An0QQW+NptCOqPHmCve8fmU1FWQbFcIYudq5U/IgKjUhOo4MLz2m4MTBopwwKQoU85Z/QkAryo9h6HVuIKD5Q6VEYBz83bt7o9RJTPS+oYNC81oPAjjNYkS9PGeXpmXhAwBl7Ifa5vxs2ayzWFrnu/lJxC2c+Eu5dPSFHV8j/MCGQlcH3mamwxiyfY5K4hKHK8YHe8QyD8W/YHhT2V80Ah7kd2uGctvc1c8ZPCiJWuQHAXfDYqH7foWU89rS72kloLVmNvxjPk1cs9iPcXrSzfI2rcWY47x/4UgijQNItWXGSSQBaZXvYk2WKjeyp8ojPA5tujPXwM4WChEX6Y4lMQP8ChtI+M9ZwNJxZKPflHaDTrujal2EP6Tgl4T5n7OZR+qiBvq5RD8pWfJz+NZ+mzuALpgrlR34cmNMOCjLzsQVl9/vYEpUuHQVu9SzS7aZr8CUiCuo2/rRlK0FNcoi7yNo6O1rzT4a96XXGX01lMtFjjC+QXIQ5q7dOhLVb8wClBucoK6rDjC+43hyfwrGgPPuxaSW9CiK9/rUaUmmgC3xtZVJNN/peijvxr7AMgC9A6nj+IZwkS5UiTF6Rw4COHw4xlwBKsxYUqpkcuRrV7JBa6ZIwhZem+9//82AvrKjaTURLlIqxarIwevURYlI6lzeYlzMLoE9s9x4ktYKAwg/ubUud2R4EbcKoZI+/RPDE8wScYUb1fvAPOVCK7iHQzHdaRqIf1eFoVTNOwD+f/O0K30R5q0Py1gtq0sFmJBbSw7Yqh7xwmwJ3ngQWNyaOkjO5AksYr0PnnzpozOzJ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(71200400001)(66476007)(4326008)(64756008)(83380400001)(122000001)(478600001)(8676002)(66946007)(91956017)(5660300002)(66574015)(66446008)(86362001)(110136005)(66556008)(6486002)(44832011)(31696002)(186003)(38070700005)(6512007)(8936002)(26005)(31686004)(38100700002)(7416002)(41300700001)(6506007)(54906003)(2616005)(2906002)(316002)(76116006)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RHk4bzgxNGI4VkRBTm5wbzR3Y2hFaXhCVTU2R1c4SDl3U3RWOS9DeWFvNlF1?=
 =?utf-8?B?d285aUtJWXZXekN4OVZ2bmhCaWZHYStkTHVtQXZrbElLRWZvTnhJZ3prRlVZ?=
 =?utf-8?B?QkNFVkFZcWpiZy9iTWQzc29Cb1dTVkRVVW0wWEJJUGJWYUhIeXdSSHJobUdm?=
 =?utf-8?B?M1NMcFBTVkZDZE1LVVJLM3Y5VXdiMUpUWXR3MzBYQVFlRzcrbHVyR3didUo0?=
 =?utf-8?B?bVBQSzVtYnNmRDB2SkhEU2Y0eUt3MXVKY0s4bkJmVER4M0hvTVJndEpLUE5a?=
 =?utf-8?B?Sm1tRlUvbkNwckRBWkpYeGovVUhWUVRqVHN0eDYzK1VtekhMMlNnWUtKUzdE?=
 =?utf-8?B?NUd0SVRxVVM5enVmMkpkMElMSHM3N3MwUUl1UDViREdRZEozK3ZXWENQNkVn?=
 =?utf-8?B?VjNYU1VBbUdOUnBIbk50SXc1NW9ra1dSSHlBVzNpOUdCRG0vKzFNMFFhZVFm?=
 =?utf-8?B?R25FTHlqMmpEQm5vMElGeGZ0NVNaTFlTbFMrR2UvWFBzOUk5dDF4ODhGeHVY?=
 =?utf-8?B?WnRTNDlNVlhEQlJ2Q2JLT01wWUNrb01Pd3BxU2lUOXZoL1BtcHFGQXJrOUVP?=
 =?utf-8?B?RkxwbUxsZCs2R3MxbXYzbEJXZCtjMTJVc1hYYXRTbW5STkNuOWhhb2JJZnpp?=
 =?utf-8?B?ODZkVUxYemt1Ui9yZUh5OFErSHBTaWdjSkdpOUxQS0NRSXp4YXR2YVZCdjdu?=
 =?utf-8?B?NUhZSE9DbElCOGxWdzYwMHJkbEt0ZXc2dkVWb3I5bG4wWEw3T2I0Y0hGL0xI?=
 =?utf-8?B?OGg1ZFhmMC9GMHQyU1B5TXdTaFg2KzcxVGZscGxkbFBDakhzQ1lOdnZJWmVU?=
 =?utf-8?B?YlFPSjZJYW50UXpiYmRmdmRabnh5cFh2anV2NTNDcTZKeVEzRFNTaUpSQXZY?=
 =?utf-8?B?RXUybVhYSk9NRDNLM09HdW5uTFdPVkRBVFI1UGZnQ245U0FHLzA5Q1lvQlI0?=
 =?utf-8?B?OGZvNHM1WExlSitHTDV5QTc3Y3RsMGtoMnFCMkR1RlFEc1I1SXYxdk5ySkRP?=
 =?utf-8?B?bkIzaER4WWJtZDZMdUthWnZ2eVg0bmhLOUhaS0RXZ1dUMDczeXppRlF3eVU3?=
 =?utf-8?B?b2tmV1hTTWZqVk1CM3VUTlFaZlA2d2Y4QUxvMFRGNWkzc0QyNUZ0c1NWdEVM?=
 =?utf-8?B?b2NyR1JmeS9vckFpWjZNT1pIOW5zZklwVzJXUE1zb0dQVTRibzM4V2hidjBt?=
 =?utf-8?B?dHNwaWJPVlViaWtONnF1YTR1ZFF5OHF3UGVDM0VwZTdXYWJubHdOeXM1ZnpV?=
 =?utf-8?B?Zlo3cFlXODlPeEFIMGFUKzh0cWlHVmJhNHN4dzhUZDYzY1hEcitQcFUwZ2VW?=
 =?utf-8?B?MTd5S1E0VFVHVHZQc3ZvNkNZdmNVcTJhY1F4d2YyREZBeUxUUzdjUitDVnhG?=
 =?utf-8?B?NGl2c0FiQVlVUDBxanFzd3dYUHc1SWkwVW5BZEdaWDd5T3hyVk93NjMvWngz?=
 =?utf-8?B?aTZ6Q2dZdnVORG5ia0lQckNjVC9kSVViTmNLc2UyVjFyZlhDNC82dDBkWmxo?=
 =?utf-8?B?RlVqMWpYK3pRbk0rTTJRSXUvZHJXak52QWE1NkdrSnFpbUk3MXU4K0lXZVVq?=
 =?utf-8?B?cDEwL3N3ZFAzSm96c0xIQWJnbFJGeERRMnJqZ0syeDdXMGFRQUNacXVpem9K?=
 =?utf-8?B?Wm05ckdESTkyOEZ5R0Z2ZzlNREtaUnp3bUZYTk1SQWNyRThFRHB1TkZhS0hB?=
 =?utf-8?B?Y0o2dFJJZjRCT3lyelRlc3JkWFpLa24wZStUT24wcUZxcTE5UDBGR2VtU1JV?=
 =?utf-8?B?b2h0S2d2NU1SNE9WV2E2aDRvcnBGOEtLcDJBR2FXbnkxejQ0cEI3aE1yUlda?=
 =?utf-8?B?OE43bWlPM3pBeXFERG45eldUbkRSYURoQzBxWVJ2ejJvWW9mTmRXVUluWXBL?=
 =?utf-8?B?RHg0RUFIaytNQjAxdkl4OEJOS1lYM1dGNGtOVjVYV293VVo4Y3AyRGJFUkJV?=
 =?utf-8?B?OW1aK29jYmtGMUhTOHJ5YUNvRjNhWDVaMXg5ODY5ZnIwRkFiaEVPeHVINlcr?=
 =?utf-8?B?RHZOa0prM3A1dy9XTVVvSllNMXVEWlJxR0EwWUQ3aWtPOU0yVzJIWngxMyt2?=
 =?utf-8?B?d2VRTU9Ua1BSb2h6S2hSanh5RlBXWHlpMFJIREdZS2xzSmxzdXJoN2Nqcnl4?=
 =?utf-8?B?anVlelE3UVEzRXdzR05ZblJoWkxLaHg0cGsrNXVqT0kwQ2xnSC9DemhQVm00?=
 =?utf-8?Q?jIkzguzjeMXPz259AbZBYXE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FFAA62F3DC3E64C9FF9661F8C8A1F6F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91074068-fb8a-420a-4a49-08da6108507c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 17:35:56.3989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stRgLZUmfW5M1YNduIMp+lTKgKNs6pCGHj8iwfHN1kxs1l/A/ocKKgovAorjZMjs+0LDvWGACGjqlr/sknVO3q/RWuso9sl4RrsBKvt5c8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1954
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMjA6MzIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBGcm9tOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+
DQo+IA0KPiBJbiBvcmRlciB0byBhbGxvdyB1c2luZyBvYmp0b29sIG9uIGNyb3NzLWJ1aWx0IGtl
cm5lbHMsDQo+IGRldGVybWluZSBzaXplIG9mIGxvbmcgZnJvbSBlbGYgZGF0YSBpbnN0ZWFkIG9m
IHVzaW5nDQo+IHNpemVvZihsb25nKSBhdCBidWlsZCB0aW1lLg0KPiANCj4gRm9yIHRoZSB0aW1l
IGJlaW5nIHRoaXMgY292ZXJzIG9ubHkgbWNvdW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiAtLS0NCj4gICB0
b29scy9vYmp0b29sL2NoZWNrLmMgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKy0tLS0tLS0N
Cj4gICB0b29scy9vYmp0b29sL2VsZi5jICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKy0tDQo+
ICAgdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvZWxmLmggfCAgOCArKysrKysrKw0KPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMgYi90b29scy9vYmp0b29sL2NoZWNr
LmMNCj4gaW5kZXggY2VmMWRkNTRkNTA1Li5mYWJjMGVhODg3NDcgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL29ianRvb2wvY2hlY2suYw0KPiArKysgYi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4gQEAg
LTgwMiw5ICs4MDIsOSBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pYnRfZW5kYnJfc2VhbF9zZWN0aW9u
cyhzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlKQ0KPiAgIHN0YXRpYyBpbnQgY3JlYXRlX21jb3Vu
dF9sb2Nfc2VjdGlvbnMoc3RydWN0IG9ianRvb2xfZmlsZSAqZmlsZSkNCj4gICB7DQo+ICAgCXN0
cnVjdCBzZWN0aW9uICpzZWM7DQo+IC0JdW5zaWduZWQgbG9uZyAqbG9jOw0KPiAgIAlzdHJ1Y3Qg
aW5zdHJ1Y3Rpb24gKmluc247DQo+ICAgCWludCBpZHg7DQo+ICsJaW50IHNpemUgPSBlbGZfY2xh
c3Nfc2l6ZShmaWxlLT5lbGYpOw0KDQpTaG91bGQgYmUgcmVuYW1lZCBhZGRyc2l6ZSBhcyBwZXIg
TmF2ZWVuIGNvbW1lbnQuDQoNCj4gICANCj4gICAJc2VjID0gZmluZF9zZWN0aW9uX2J5X25hbWUo
ZmlsZS0+ZWxmLCAiX19tY291bnRfbG9jIik7DQo+ICAgCWlmIChzZWMpIHsNCj4gQEAgLTgyMCwy
MyArODIwLDI1IEBAIHN0YXRpYyBpbnQgY3JlYXRlX21jb3VudF9sb2Nfc2VjdGlvbnMoc3RydWN0
IG9ianRvb2xfZmlsZSAqZmlsZSkNCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeShpbnNuLCAmZmls
ZS0+bWNvdW50X2xvY19saXN0LCBjYWxsX25vZGUpDQo+ICAgCQlpZHgrKzsNCj4gICANCj4gLQlz
ZWMgPSBlbGZfY3JlYXRlX3NlY3Rpb24oZmlsZS0+ZWxmLCAiX19tY291bnRfbG9jIiwgMCwgc2l6
ZW9mKHVuc2lnbmVkIGxvbmcpLCBpZHgpOw0KPiArCXNlYyA9IGVsZl9jcmVhdGVfc2VjdGlvbihm
aWxlLT5lbGYsICJfX21jb3VudF9sb2MiLCAwLCBzaXplLCBpZHgpOw0KPiAgIAlpZiAoIXNlYykN
Cj4gICAJCXJldHVybiAtMTsNCj4gICANCj4gKwlzZWMtPnNoLnNoX2FkZHJhbGlnbiA9IHNpemU7
DQo+ICsNCj4gICAJaWR4ID0gMDsNCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeShpbnNuLCAmZmls
ZS0+bWNvdW50X2xvY19saXN0LCBjYWxsX25vZGUpIHsNCj4gKwkJdm9pZCAqbG9jOw0KPiAgIA0K
PiAtCQlsb2MgPSAodW5zaWduZWQgbG9uZyAqKXNlYy0+ZGF0YS0+ZF9idWYgKyBpZHg7DQo+IC0J
CW1lbXNldChsb2MsIDAsIHNpemVvZih1bnNpZ25lZCBsb25nKSk7DQo+ICsJCWxvYyA9IHNlYy0+
ZGF0YS0+ZF9idWYgKyBpZHg7DQo+ICsJCW1lbXNldChsb2MsIDAsIHNpemUpOw0KPiAgIA0KPiAt
CQlpZiAoZWxmX2FkZF9yZWxvY190b19pbnNuKGZpbGUtPmVsZiwgc2VjLA0KPiAtCQkJCQkgIGlk
eCAqIHNpemVvZih1bnNpZ25lZCBsb25nKSwNCj4gKwkJaWYgKGVsZl9hZGRfcmVsb2NfdG9faW5z
bihmaWxlLT5lbGYsIHNlYywgaWR4LA0KPiAgIAkJCQkJICBSX1g4Nl82NF82NCwNCj4gICAJCQkJ
CSAgaW5zbi0+c2VjLCBpbnNuLT5vZmZzZXQpKQ0KPiAgIAkJCXJldHVybiAtMTsNCj4gICANCj4g
LQkJaWR4Kys7DQo+ICsJCWlkeCArPSBzaXplOw0KPiAgIAl9DQo+ICAgDQo+ICAgCXJldHVybiAw
Ow0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9lbGYuYyBiL3Rvb2xzL29ianRvb2wvZWxm
LmMNCj4gaW5kZXggYzI1ZTk1N2MxZTUyLi42MzIxOGY1Nzk5YzIgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL29ianRvb2wvZWxmLmMNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9lbGYuYw0KPiBAQCAtMTEy
NCw2ICsxMTI0LDcgQEAgc3RhdGljIHN0cnVjdCBzZWN0aW9uICplbGZfY3JlYXRlX3JlbGFfcmVs
b2Nfc2VjdGlvbihzdHJ1Y3QgZWxmICplbGYsIHN0cnVjdCBzZWMNCj4gICB7DQo+ICAgCWNoYXIg
KnJlbG9jbmFtZTsNCj4gICAJc3RydWN0IHNlY3Rpb24gKnNlYzsNCj4gKwlpbnQgc2l6ZSA9IGVs
Zl9jbGFzc19zaXplKGVsZik7DQoNClNob3VsZCBiZSByZW5hbWVkIGFkZHJzaXplIGFzIHBlciBO
YXZlZW4gY29tbWVudC4NCg0KPiAgIA0KPiAgIAlyZWxvY25hbWUgPSBtYWxsb2Moc3RybGVuKGJh
c2UtPm5hbWUpICsgc3RybGVuKCIucmVsYSIpICsgMSk7DQo+ICAgCWlmICghcmVsb2NuYW1lKSB7
DQo+IEBAIC0xMTMzLDcgKzExMzQsMTAgQEAgc3RhdGljIHN0cnVjdCBzZWN0aW9uICplbGZfY3Jl
YXRlX3JlbGFfcmVsb2Nfc2VjdGlvbihzdHJ1Y3QgZWxmICplbGYsIHN0cnVjdCBzZWMNCj4gICAJ
c3RyY3B5KHJlbG9jbmFtZSwgIi5yZWxhIik7DQo+ICAgCXN0cmNhdChyZWxvY25hbWUsIGJhc2Ut
Pm5hbWUpOw0KPiAgIA0KPiAtCXNlYyA9IGVsZl9jcmVhdGVfc2VjdGlvbihlbGYsIHJlbG9jbmFt
ZSwgMCwgc2l6ZW9mKEdFbGZfUmVsYSksIDApOw0KPiArCWlmIChzaXplID09IHNpemVvZih1MzIp
KQ0KPiArCQlzZWMgPSBlbGZfY3JlYXRlX3NlY3Rpb24oZWxmLCByZWxvY25hbWUsIDAsIHNpemVv
ZihFbGYzMl9SZWxhKSwgMCk7DQo+ICsJZWxzZQ0KPiArCQlzZWMgPSBlbGZfY3JlYXRlX3NlY3Rp
b24oZWxmLCByZWxvY25hbWUsIDAsIHNpemVvZihHRWxmX1JlbGEpLCAwKTsNCj4gICAJZnJlZShy
ZWxvY25hbWUpOw0KPiAgIAlpZiAoIXNlYykNCj4gICAJCXJldHVybiBOVUxMOw0KPiBAQCAtMTE0
Miw3ICsxMTQ2LDcgQEAgc3RhdGljIHN0cnVjdCBzZWN0aW9uICplbGZfY3JlYXRlX3JlbGFfcmVs
b2Nfc2VjdGlvbihzdHJ1Y3QgZWxmICplbGYsIHN0cnVjdCBzZWMNCj4gICAJc2VjLT5iYXNlID0g
YmFzZTsNCj4gICANCj4gICAJc2VjLT5zaC5zaF90eXBlID0gU0hUX1JFTEE7DQo+IC0Jc2VjLT5z
aC5zaF9hZGRyYWxpZ24gPSA4Ow0KPiArCXNlYy0+c2guc2hfYWRkcmFsaWduID0gc2l6ZTsNCj4g
ICAJc2VjLT5zaC5zaF9saW5rID0gZmluZF9zZWN0aW9uX2J5X25hbWUoZWxmLCAiLnN5bXRhYiIp
LT5pZHg7DQo+ICAgCXNlYy0+c2guc2hfaW5mbyA9IGJhc2UtPmlkeDsNCj4gICAJc2VjLT5zaC5z
aF9mbGFncyA9IFNIRl9JTkZPX0xJTks7DQo+IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2lu
Y2x1ZGUvb2JqdG9vbC9lbGYuaCBiL3Rvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL2VsZi5o
DQo+IGluZGV4IGFkZWJmYmMyYjUxOC4uYzcyMGM0NDc2ODI4IDEwMDY0NA0KPiAtLS0gYS90b29s
cy9vYmp0b29sL2luY2x1ZGUvb2JqdG9vbC9lbGYuaA0KPiArKysgYi90b29scy9vYmp0b29sL2lu
Y2x1ZGUvb2JqdG9vbC9lbGYuaA0KPiBAQCAtMTQxLDYgKzE0MSwxNCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgaGFzX211bHRpcGxlX2ZpbGVzKHN0cnVjdCBlbGYgKmVsZikNCj4gICAJcmV0dXJuIGVs
Zi0+bnVtX2ZpbGVzID4gMTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGludCBlbGZf
Y2xhc3Nfc2l6ZShzdHJ1Y3QgZWxmICplbGYpDQoNClNob3VsZCBiZSByZW5hbWVkIGVsZl9jbGFz
c19hZGRyc2l6ZSgpIGFzIHBlciBOYXZlZW4gY29tbWVudC4NCg0KPiArew0KPiArCWlmIChlbGYt
PmVoZHIuZV9pZGVudFtFSV9DTEFTU10gPT0gRUxGQ0xBU1MzMikNCj4gKwkJcmV0dXJuIHNpemVv
Zih1MzIpOw0KPiArCWVsc2UNCj4gKwkJcmV0dXJuIHNpemVvZih1NjQpOw0KPiArfQ0KPiArDQo+
ICAgc3RydWN0IGVsZiAqZWxmX29wZW5fcmVhZChjb25zdCBjaGFyICpuYW1lLCBpbnQgZmxhZ3Mp
Ow0KPiAgIHN0cnVjdCBzZWN0aW9uICplbGZfY3JlYXRlX3NlY3Rpb24oc3RydWN0IGVsZiAqZWxm
LCBjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQgc2hfZmxhZ3MsIHNpemVfdCBlbnRzaXpl
LCBpbnQgbnIpOw0KPiAgIA==
