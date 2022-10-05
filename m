Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE55F5A8F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 21:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjPc133c9z3bYM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:22:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=apbTA5Z0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.54; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=apbTA5Z0;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120054.outbound.protection.outlook.com [40.107.12.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjPb438cyz2xHM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 06:22:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4ME+vulXq1jVvlqehBhCWW3ZIwfrpResYrh09wCVUbszuP82N+IjZ9Gb4Zx/LnO9nCVeuTMLGsxKjNsnyIDWueeRFInj+G+atHxIMmjjdblvyjxbvL30S2VU59CFJe9NeWGcIi3Qdn1hsmDIYaQXVzKU1KEjaROkDpaa3kPBgJlQoNfEsn399eID9KX8bbCcFSMCnrzXGBBp65eVOAIFyUco8OUA3Pxn8RRtlTPNkRQUjnsdCJK9WbyecEVbtHJkdymhBLLOZiqZkFOsuDVwtUQT/hv0ykNs5KKtyzHpUTiluFGUZHRKt4o9P+fvva41BazNW42alayUZUtrz6P4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzxcvKu+N0k1BNk3PxFdRUsuF2Wxq3t56s/NgPVJOvM=;
 b=EQODqEpxN+82MXQMUQZltqPipr3WtuVmyG3l3/Ex+TQTQSuZukn2yv5nNDs2WyKwDimtnECZ+U6LE4Htbaxi6u9mvFCXZc6MwlxJXYQzuI9g7ZxqebW7KNZe2e7OM+2MkMKrDMP3zNMXAzluv1RqJav7cw+tqXEH/4BMx2qH3sVtq1DxyC72qjXSNOokysdVTg00HIcVg10T7kGDweg1VbPdnuMQW7eRggRfkk9UiJKqGjp/sjh/SJt77R8GEm7vdbuYUB/FM/fZ0TXHMPPTuhRk2Q9mgXpMScyY7iFzlMixoJCZjwFi5L8hOfJCu6CZGUZ8OfisoLVV70iozoFb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzxcvKu+N0k1BNk3PxFdRUsuF2Wxq3t56s/NgPVJOvM=;
 b=apbTA5Z09fQY9YU1I++CL7mJGwoNTG11T1uCWWo5lL6HyfPFoJBpQUwIybuMUzEzzsg5uKisXnNhwAXyLzlSMSOmzDnyMJyIt9z3nSZq+aqUwwAXPLRonF3rGRG0HK3/W3xnZEMukxzMqaMxn3dngNCLs9XWpyZTIzUG+8YfbY/E6dFKaD4UBMYBDPhzKj0iKWj9elSppFjSHyxSw9XSUXlyjGddnCfFBlvZuXFlvNXE0UyPnzU55djoK0WuUPw1yQl6/OfZ2GjR0QBfog1UzihC6bSfuaHRDDTgIZ3Ug9ySpXmoqg7r9TF4j4larI+qqpDPCdhKU7NglGw0nnFk9A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1604.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 19:21:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 19:21:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 3/6] powerpc/module: Optimise nearby branches in ELF V2
 ABI stub
Thread-Topic: [PATCH v3 3/6] powerpc/module: Optimise nearby branches in ELF
 V2 ABI stub
Thread-Index: AQHY2Hvv0lgaEGSftEemklfgjXZkA64ALnSA
Date: Wed, 5 Oct 2022 19:21:49 +0000
Message-ID: <5e10fcf1-0b83-5d9a-5610-956a5d39d81b@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-4-bgray@linux.ibm.com>
In-Reply-To: <20221005053234.29312-4-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1604:EE_
x-ms-office365-filtering-correlation-id: 8775599a-adb8-4152-b6f9-08daa706d9ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  FvMrkncy5gxowT/cl0th8hIiKXAy+14eDFmG2e6CT36yCyvKa81R1QSmcQSscMWrkH4dYTDIofZPG5urSa/GMESnlS1GnjAdBxRhpzbSDWjnEWznikmxLhHAPF/+VlIvpVDk7Pyielb6lkoG+QW57UqMj13kvmXzShLfggDmKQc3tMTHfYpZuwV3sJymttE7nbeOdPWRDR7zPTrI1mGoN3XUN1oazWum2OEqfR2+WTApeGLecG+KTb8yDFS+rNJDFa0Sbw4Q7HsRjwVm/2E8yx3VLnFcdto8mkQ3uKiK0KFk+gkpdDF56TyBVlVeaQSkZziDG3Rlz9dGsOG6NVQmynkSoCQEbhRcdHdDoaQhWu1qiHa6zy4vs9i8AKE9W+XgNA3jDYmQf2AMSRiE9fAnw9p0KqurUGbL57P7asTHd3oL36VIbxG5NIZaZdJ8aMvDxJH/7wvLjFfKSm7dDZw8fxqjv8XGRx2/iRVR+pkW+w0P0zZvZVxjwz088jUKjRyBSej6VKjzmDgEz1vrd//w/D08Rsjt9K1aMKIlslKGJzFMJc3EVyRfe+zoxecInKj0AArYNLgVX42bg+eDi+ijpTGLRDkCwyKxzsUoOc/tOWJnZaCtenCnT3IJM0arbpAiDuaApeyib5GvzUTbv9XJ5/uNaV2W0UXu4c8jbNjbSm8pLEor0XEmcC0wbZ7mD92y0ZJdw5I3TeqMvknPEamWzVzJsPE3QlGsw9doDbKSFnUP/WLEA2WNE13bumoJb+FKhup5vEunuNJXvqdO7N4eNur8bIdcsdZ8aZMLYs2f3yPOtLGFHHUkuSR2N1LaHb59WRbgUyDtzqjpRDbXtoIJ6g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(8676002)(41300700001)(54906003)(71200400001)(110136005)(66946007)(478600001)(6486002)(44832011)(36756003)(66556008)(66476007)(66446008)(64756008)(4326008)(91956017)(8936002)(76116006)(316002)(5660300002)(7416002)(38100700002)(38070700005)(122000001)(6512007)(26005)(31696002)(2616005)(6506007)(86362001)(186003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0x6Q25GdUc4ZG9CY01MUm5od0pSTUlpYzhqZHQxMDlLSVFQNXZqaUhXWElz?=
 =?utf-8?B?bHNUOGliL0NKWW80cHFGZFZwWWwzVUw2NGZFMU90SThyWEJqTWl3QnNhQVJJ?=
 =?utf-8?B?dGx5MU9wcWVLUzF6ajE0YlZrYkNFT2QyVVJJYlpEeUVDRzJsS3lGOWRwVWdv?=
 =?utf-8?B?UDdoNElhSUUzVzVqNWltTVZmTEhjSTZZK3hucHFEcHFwV2YraU9GMmpYR2I4?=
 =?utf-8?B?OHBLU1NoZzlzZ1RuQlNGT3VxZW5DS1dzd0ZocjNwUXcyaHMxZzdDbksvaGZJ?=
 =?utf-8?B?THBaNGp1VGh1YmVqNVlybExZeEZQcHU3MUpDMXp5VXA5dkFLRDdDZmpiVThk?=
 =?utf-8?B?eTFvd09uOXovTU42NDgrdHBjNmdIZTVZUzVVbmRJTm9LN3N0REJQOENSZGJR?=
 =?utf-8?B?TG9FcjduRURLSldVU3JBM0xPcFd6VDJKdVFHVU9jWkpCL0tnOFdoOXBBbTBX?=
 =?utf-8?B?Zi9HK3lEdHArV2FyVFhsdEZlTGlBQUFURGovTzFFM1N4MXA1NzJ4djg5NWRn?=
 =?utf-8?B?SUtUVmdwQTMrZlFPbDNZdEJ4ZXdqWTkvWGQzZXRLc2Y2Rk80WENDYTFtbm1i?=
 =?utf-8?B?eGJWNDBrY3BLbE4rUzl1d1hRQ3pJMXludkJ5eVRwWVJUdURpZnQrMmNnb21o?=
 =?utf-8?B?WSsxN2ZNMzZEYU1Qem1uZFVmSVZhZjdwQzBHYkNieFFHS25XMklTemx5K0dC?=
 =?utf-8?B?MDlGcDB2Wm9qT1JPRnpqNitIR0ZYNWF6V2kxalBMQUVJa2h3S2N1RjJZY012?=
 =?utf-8?B?RStEbFVxOHBOUk1CZkF4SVdHcFArT3FvSXVaTXdSeG5CQUdybnRmMEp0Q295?=
 =?utf-8?B?MGhObU43S0NFNCtnQjhKS1hmMEhudm90VVphZWxHTmdMWS90eGJnZG5XaTRK?=
 =?utf-8?B?bnI2eGlJU3E5S2o5VXJiUXNwb1RIQUZlQlk4dUxCQ2l4K1pTSEdnb2FLUDZ2?=
 =?utf-8?B?bDgycEtSanRpTGNFNjZqWWxrY3QyWlBJMFUyVXdiNExvMlBOWTVUcTdrVk5N?=
 =?utf-8?B?ZllGbHNPRVB0cEJZZVZSRTJDcUlhU2w5VjRXaGVuOVdpRTlRTC93OWxPNUI1?=
 =?utf-8?B?OFFTajhiN3BwUHdNSVNPbW4zVTVMOGQ2OWY0OVVkT2JsVDd2SjNnUk5pamp4?=
 =?utf-8?B?dWZjTVJpRWw2bytSVnE3LzNpT25BSjd3ZmxUcWtpU0R0a05tZnd0UGNTR0JT?=
 =?utf-8?B?dlpiN2JTREw1c3h6U0Z1YkxuQjhoayt5YXlzRFFtSHNrMlBHcjljd2pmclZr?=
 =?utf-8?B?cnl0N3FqVXFCTnFReVNNQTYyeTJKa2t3TXhKbXR1Wk1pbG94YlR5YjlIMC9Q?=
 =?utf-8?B?UkNJQkd3OUh5TEw5YiswMFpUcDBFN29GcUVpQ1J4SVp2MWc4TldpdlFGRUYx?=
 =?utf-8?B?RE1Mbis1UDFXR2Z4SXUva1IwTHI3eWlWM0VjOHJtdDczRmxvSWtHTGxHenps?=
 =?utf-8?B?VVBONkQ1Z3JGQ3lmY3V5YmprMmdUWUVrWlFGMkZFcWxXdGFQQW9lYXFQbVVR?=
 =?utf-8?B?UW5kU1J4WjRkcWs2eUYyVVpWOTJtcEhLcWhBWitaVFhYdXBzT1VGUmtaVTFu?=
 =?utf-8?B?QVBIV29WanhXYnNTdGZxMTVOM2RTUGV3MW5wWDlDMit0TnRNNUlTUlRMVmxo?=
 =?utf-8?B?aTVTc3hWdDgxdXI3SmpoekU2dkx3UVF6U3dxd3pMMThjZ09mSEhnNFlOd2c1?=
 =?utf-8?B?LzZjUWRhN2RBSnhxUDd3MnpwOTJpemZOTFloaVVJZU9JbGVEK2tjbGh2N3Zr?=
 =?utf-8?B?WDVIVW9WQkxNb21MYm5LWFFseERvR2ZUYUxMS0ZuVlNnamt5WE5EOWtRUW8x?=
 =?utf-8?B?VFRNUG5zMWZ2TTRvZm1EWW81MmxGbUlTQWFCdFNoVFlrZHBCSXRJdStqcjlD?=
 =?utf-8?B?TnBDTDVXR3J6VE1XaDhVVjFIaWZyOXRIUVpnLys0SFdvSWNmd0x1T2gycGRG?=
 =?utf-8?B?ZVpCRGUyY3BWcnMvV2l6ZjQzejQzdmw4bTlXUjRBWUdUem4yWFVlblFGRXVZ?=
 =?utf-8?B?bStrZmt6aXhYV1V0blRVVW5zOXZPUXh5U1Jnd2haYUQ3YmRXMEszcEcvVWkv?=
 =?utf-8?B?ZW1VSndra2ovL0tKbWVDejNBdUxEb3ZjVCtrUXJkbzkzTHdQS1BVSStEcTdw?=
 =?utf-8?B?T0l4ckxvSWt5RDhjK214TUE4WXhlVTUwNXpzTmxLbFQ1QU9odlI1Z0pNUzdy?=
 =?utf-8?Q?ZifYDTosPX6RTAa308FlWQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0546FE5AD69A3D4F9AFD80421F073602@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8775599a-adb8-4152-b6f9-08daa706d9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 19:21:49.3599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cu27axVvXaUCtIdvGrADICXvzSOgTO7NmLnHxkjZ8PWyqqnp5hA6DqKah4xsl7GPYw0GO2bJZxMR5IdgJ5a759ubzQF+4g44MB8VeETcsDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1604
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzEwLzIwMjIgw6AgMDc6MzIsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
SW5zZXJ0cyBhIGRpcmVjdCBicmFuY2ggdG8gdGhlIHN0dWIgdGFyZ2V0IHdoZW4gcG9zc2libGUs
IHJlcGxhY2luZyB0aGUNCj4gbXRjdHIvYnRjdHIgc2VxdWVuY2UuDQo+IA0KPiBUaGUgbG9hZCBp
bnRvIHIxMiBjb3VsZCBwb3RlbnRpYWxseSBiZSBza2lwcGVkIHRvbywgYnV0IHRoYXQgY2hhbmdl
DQo+IHdvdWxkIG5lZWQgdG8gcmVmYWN0b3IgdGhlIGFyZ3VtZW50cyB0byBpbmRpY2F0ZSB0aGF0
IHRoZSBhZGRyZXNzDQo+IGRvZXMgbm90IGhhdmUgYSBzZXBhcmF0ZSBsb2NhbCBlbnRyeSBwb2lu
dC4NCj4gDQo+IFRoaXMgaGVscHMgdGhlIHN0YXRpYyBjYWxsIGltcGxlbWVudGF0aW9uLCB3aGVy
ZSBtb2R1bGVzIGNhbGxpbmcgdGhlaXINCj4gb3duIHRyYW1wb2xpbmVzIGFyZSBjYWxsZWQgdGhy
b3VnaCB0aGlzIHN0dWIgYW5kIHRoZSB0cmFtcG9saW5lIGlzDQo+IGVhc2lseSB3aXRoaW4gcmFu
Z2Ugb2YgYSBkaXJlY3QgYnJhbmNoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3Jh
eSA8YmdyYXlAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMv
a2VybmVsL21vZHVsZV82NC5jIHwgMTIgKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L21vZHVsZV82NC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGVfNjQuYw0KPiBpbmRleCA0
ZDgxNmY3Nzg1YjQuLjEzY2U3YTRkOGE4ZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tl
cm5lbC9tb2R1bGVfNjQuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5j
DQo+IEBAIC0xNDEsNiArMTQxLDEyIEBAIHN0YXRpYyB1MzIgcHBjNjRfc3R1Yl9pbnNuc1tdID0g
ew0KPiAgIAlQUENfUkFXX0JDVFIoKSwNCj4gICB9Ow0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19Q
UEM2NF9FTEZfQUJJX1YxDQo+ICsjZGVmaW5lIFBQQzY0X1NUVUJfTVRDVFJfT0ZGU0VUIDUNCj4g
KyNlbHNlDQo+ICsjZGVmaW5lIFBQQzY0X1NUVUJfTVRDVFJfT0ZGU0VUIDQNCj4gKyNlbmRpZg0K
PiArDQo+ICAgLyogQ291bnQgaG93IG1hbnkgZGlmZmVyZW50IDI0LWJpdCByZWxvY2F0aW9ucyAo
ZGlmZmVyZW50IHN5bWJvbCwNCj4gICAgICBkaWZmZXJlbnQgYWRkZW5kKSAqLw0KPiAgIHN0YXRp
YyB1bnNpZ25lZCBpbnQgY291bnRfcmVsb2NzKGNvbnN0IEVsZjY0X1JlbGEgKnJlbGEsIHVuc2ln
bmVkIGludCBudW0pDQo+IEBAIC00MjYsNiArNDMyLDcgQEAgc3RhdGljIGlubGluZSBpbnQgY3Jl
YXRlX3N0dWIoY29uc3QgRWxmNjRfU2hkciAqc2VjaGRycywNCj4gICAJCQkgICAgICBzdHJ1Y3Qg
bW9kdWxlICptZSwNCj4gICAJCQkgICAgICBjb25zdCBjaGFyICpuYW1lKQ0KPiAgIHsNCj4gKwlp
bnQgZXJyOw0KPiAgIAlsb25nIHJlbGFkZHI7DQo+ICAgCWZ1bmNfZGVzY190IGRlc2M7DQo+ICAg
CWludCBpOw0KPiBAQCAtNDM5LDYgKzQ0NiwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBjcmVhdGVf
c3R1Yihjb25zdCBFbGY2NF9TaGRyICpzZWNoZHJzLA0KPiAgIAkJCXJldHVybiAwOw0KPiAgIAl9
DQo+ICAgDQo+ICsJLyogUmVwbGFjZSBpbmRpcmVjdCBicmFuY2ggc2VxdWVuY2Ugd2l0aCBkaXJl
Y3QgYnJhbmNoIHdoZXJlIHBvc3NpYmxlICovDQo+ICsJZXJyID0gcGF0Y2hfYnJhbmNoKCZlbnRy
eS0+anVtcFtQUEM2NF9TVFVCX01UQ1RSX09GRlNFVF0sIGFkZHIsIDApOw0KPiArCWlmIChlcnIg
JiYgZXJyICE9IC1FUkFOR0UpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICAgCS8qIFN0dWIgdXNl
cyBhZGRyZXNzIHJlbGF0aXZlIHRvIHIyLiAqLw0KPiAgIAlyZWxhZGRyID0gKHVuc2lnbmVkIGxv
bmcpZW50cnkgLSBteV9yMihzZWNoZHJzLCBtZSk7DQo+ICAgCWlmIChyZWxhZGRyID4gMHg3RkZG
RkZGRiB8fCByZWxhZGRyIDwgLSgweDgwMDAwMDAwTCkpIHs=
