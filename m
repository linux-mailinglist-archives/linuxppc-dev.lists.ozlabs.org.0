Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618E5B940B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 07:51:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSmYC2dX6z3brL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 15:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=S0o/0mIk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.79; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=S0o/0mIk;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120079.outbound.protection.outlook.com [40.107.12.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSmXQ5QTDz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 15:51:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNaoYT1aA4Cj6Vj3dJefaZ/i5K0G4GkFQ7ZbGKvnWlD92zeDxd9eXTlFKqLztmhKzlxaHxOeTOrHlLsr89m2TE1PvqBwEhusUyIzzVCt3qnfoV9W7IH9qMHgmp/8bIJQO4/f2EmUO8rswyKsHjtjqCRBAdld1t1ahsjFB+4xN1U2xC4ogOhwSzpTV1+T0OV86Co1ftmrUn5fYckfNnVahr4AUWUT/JPSG+HSamwCF48COuNMxRNZ+9IvzCxjfXGNQLPUQQVCpVb7TC9c9nwZtoYQdIcfirbhKmv+FnZqMGo20Isx+mlDYcAfEuEVxe150ruCYHCtXxcXgDlDtKhl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uyS1oEZ1uoaNkLrnlFhY+XqcVjD8ICKDN0iTqK3ndU=;
 b=Q9T5dk3+dQSHwXRydON8HeJveISfbNLowwsVWXNbdeOmP7Dvqd+PvheD1ZrMPZ1WEd/VwsC90ZfBGsv/dkusJwRc5reK8/g0A948547bJbUckfGo1lV6RX4liHZzG7PoeGkHF4PmUmGpkd9R0WujOGE1utFy8dsIBrqq31ftWFU1KJ2SucFknpSbWjbSjfL08iauf1TT/usiIb3OcHr+qMM/j7yayCjXSpLU4kjerf3vJSyc/aHjTjgB8synYdwN9SMTA7IMRFMhOEw+/GONOmKI3pb6lpjjRaYfOBG7xKWxMoQFEBjAnTPg9uyiF8JvYMS9tQCoaCc/QV1Xcn7edg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uyS1oEZ1uoaNkLrnlFhY+XqcVjD8ICKDN0iTqK3ndU=;
 b=S0o/0mIkWl8NrWTEIKRvohvMQGcgOsq81HJksdrFBucp3KcrBxeINMfXVrmlcGVnOCy4gDx9D791IqRvlzDFkxig2gmdxTMZWYIxbr9uiLdFY52idfE6JdKeW9iwNKXcP3KPrj3IDJ+X6STS1IZSv9YB4u5lgLUO3U0SkBc0Ay+WGdRSuKc0jWzHJPkOQwfTWiXKBBhEphZ7iyJI9zxtLs33eJ4Jp5+RB08wT1Npi50/SS6Ld1xr7y4CqAsVkbUaW+yl4GkRZ+H7prB5rxqct4eR89eIeG5YNwwz0qgbarZ+BkWKP9lgCRRUrGLdBZelFTi21srtsfJXRN0/QVIG5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1970.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Thu, 15 Sep
 2022 05:50:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 05:50:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/7] powerpc: move __end_rodata to cover arch read-only
 sections
Thread-Topic: [PATCH 2/7] powerpc: move __end_rodata to cover arch read-only
 sections
Thread-Index: AQHYyFGZtL79mUdh3EmXR0its2IpVq3f/YmA
Date: Thu, 15 Sep 2022 05:50:41 +0000
Message-ID: <a81dba63-f012-abb4-700e-29622d5cb811@csgroup.eu>
References: <20220914154746.1122482-1-npiggin@gmail.com>
 <20220914154746.1122482-3-npiggin@gmail.com>
In-Reply-To: <20220914154746.1122482-3-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1970:EE_
x-ms-office365-filtering-correlation-id: d7eb64a0-8b31-4698-d707-08da96de39a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pv5+8fo3SCPDEKMa7TTkBXEjl8ZOozb8BgD9qmCfzkp6ltVT1/G8TZJhiqPIYi1dhrRzkSow/CiF92G0AVlj7oCUDMa4Og3DZQV9ygF7tnM7hB/05nZ5+mcGyJhGvp+2Eer5QQih7mdZ+uP66RHVF0vzO3c4RYikNOCSsOb6SUI+mx7XyfET/F8fjWkjssd6WtMMJaDQXSW1dPwGvRWU9uS3GxxdB0vrafG/uAlCbMFs8wgU8huXku9CdOcw3BhpYj2ZGtQewX6fLkq5/ommYoXau3Qwp5rKNI6MXImCUKwK0B9Xzws+Ijb4TIhNP794YKW1ATWFlVhhLMOE6oi7jD+ZsK3jZpFhbI5H2t0fzVKqehW+5wnScjPdCB8smBXaMKdwSKd4Hf0kIFhGxILJFuC1KLcDuefLZBuaJziqMAsMKjL0VgsKmVaiPcWOP5wKG2MgHHsKMytJLllGSnJtyNm5duW4SDdzHfOAlpVmq4ygiLRdA0pqANslD7Zhkdw4uCp8be0APIVAxfR44fNs5dmk1s3R8EDUDjRa4vJy793ckfjhetJJ26soZPYGlHVGcZ4ci62sf3P7JapQIrDTqYh/Jvvihfl1rWeAWAlsO0K7IAA6MAxprJiQFemuZj7yF/DHBfANQyC36Eo9GgV0IHdMpa974i07+fBP+ESEx3FUWdnzRi/3NyLbW7jj0bYToiry8zx+gbGI42NrVzio3fb42CkneSPeqGXeuO93VXFyHTMwfM1u8buGY9xE9Ms3a+D98EJoqp5xmWuQtBjP1p9VqLm20GcumNdC2atPzulFYm9/oy5KcEQeGsIMvu1jk8q75BN3d8Vjrt45e6D/FQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(110136005)(91956017)(31686004)(86362001)(31696002)(76116006)(36756003)(38070700005)(122000001)(186003)(2616005)(83380400001)(38100700002)(71200400001)(478600001)(6486002)(6512007)(66446008)(66556008)(64756008)(6506007)(66946007)(66476007)(316002)(26005)(41300700001)(8676002)(8936002)(2906002)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TUlBTERkSTVCQm51Q2Q1OHBSVGpRbmJFTlo0eTFxWHVvZWdndUVLRFFscEhF?=
 =?utf-8?B?TTZYcHU3VldvQ1lhcXlwVnJ0QWNtYTBraWUxM1NMSk5tYjJPeVJZejU2S3p6?=
 =?utf-8?B?MHpHZllIYzJNTFN0OWw5YXZUMzZzRFhpcVlxSXg5cnhVTXpTUWljc3hPZnBJ?=
 =?utf-8?B?dEpyTm04eGs4M3Zrb0pxNmd2dXdyRnNGMUdPZ25sWlRXck5rVjh5WXZjU2NR?=
 =?utf-8?B?dkNxR1V5MVE0RnFDZzdhR1pxU1E5L1lNVFVKOERDSWROb1dtejl4WVNPRUZW?=
 =?utf-8?B?ckczVC9PRFliSjFxNDNaRXRDai9HT3NKZjZPMmpFUEdYR2xaR3pORG43VEpS?=
 =?utf-8?B?WDJ2dEtJM294dXpxOHRCbkd1V1h3TTREcGtydXZUc2UzS0NqbW1ReUFmdG9X?=
 =?utf-8?B?M3VtKzRwYmZiQUdNUlpvamd1ZWVOSEljOGNJdWNBZ1BYNVhoZnBwMmRvbjlP?=
 =?utf-8?B?L2ZhNXNDWHJhTGljM3E0WEQ2bG05VFdCNHpraVh1VjhlcXIrcS95bnRkcS9H?=
 =?utf-8?B?OHN3dG45N054ckFwUkxvdjlBODhmaEJFMlNqTG1SblhwaTBIbDFxekQxTEFW?=
 =?utf-8?B?b3hPUVF0ZG5rZjlEZVlFZmRDY3RUemVRa3YzME54MThJYUpXZ0JPNlVzTEFF?=
 =?utf-8?B?a0FwMDlDeUpUTjZLVXR5cHRTVjUzanpvN0puRjlFdU9rUEs1OXRrUzNpR21x?=
 =?utf-8?B?YnpNT1lMMkdGMTBldUZHSWU4bS9JU29pdXdxRnFTeXFLbU1NVkp1QndrZVUz?=
 =?utf-8?B?SlBzdWcxNkR6TzU5ek9lSCtRMzA2dGtGMnJBRmtlV2dTWm1FNmVucWE0U0Q2?=
 =?utf-8?B?RUJEcDY4ZUpQQVFYaTlNeVRhamZvdGdVaXR5MFdGdjJIUWViNmhEV2pxVHQw?=
 =?utf-8?B?U1RFNXZXa3FlREtmb25aUkNuZmtZdWtwTFBQNGxYbGUyUCtlblcyUEs2bFJZ?=
 =?utf-8?B?WVZGQW44MXJxVysvZ3hyd2FTbTNxOHNQblo2NFZFeWl6WHdQblVGQ081WWNL?=
 =?utf-8?B?UVNuOWsrc2Y1Yy9ydnBBZHZWSjl6UW1PMzR1VXk3a003WE5IYWs2bXJsZXVs?=
 =?utf-8?B?NXVhOUtSRnRrOU90MVVpazAzNm95UzZET1BqdFRiZ0swWnVnajdneFZzYUJW?=
 =?utf-8?B?eDNqTjV0bHZkZ2wvQXZRR0tQY0FLL3h5Vk9GVHZaeTVLS21DUVoyUUhrRFUv?=
 =?utf-8?B?dGRzZ2lFZzFTU2l2WXRBVW9SQmY4OEhjRGE3Mm1Ha01lM0h1V1ZIUVM2b3U1?=
 =?utf-8?B?UmJFdkdpNWlUaFNZeWd0TjBJRXdhZHZ1U25SWC91ODZFR3BRYjREQkhxZXFa?=
 =?utf-8?B?L3MwTXgxYXhkS3VtMkdNT0VOSUxxeUQ3R3VENWJqZU9SZlp3ZFZ5bVgrcmg1?=
 =?utf-8?B?VERlbzFpODFsWjJ2MFhkZlorUU9DS1djN2hCdUk3NGpIYmllMko5Tmw5RkFl?=
 =?utf-8?B?ajRDR1FpTFk4LzdVSGlCUmtEZlZWUXI1VC8vbEtRWEw0WXVYampRaDVXYzQ0?=
 =?utf-8?B?bkZaWDdQelhlL21Qd2pXOGpZd1Bnc3RXSExyZFRpWUdUQkFjSytTOE9tZ3BM?=
 =?utf-8?B?THp4NWx5bmpwYnAzanRxa1pOcjlRd0gySlBZWW5YMWRQbkZiZU04RW80TFZx?=
 =?utf-8?B?bmo1S1NBdXl0VXE3UmNuYUN5V3RZU3I2SEdDS1phWHlVQ1MrcmZTSWxQNkpZ?=
 =?utf-8?B?Q3VsaU1VeEFqK2xyUzFHTE1yMHBMd2lvcXJmUGpKUHZqY0x2Z0YxOXozYytq?=
 =?utf-8?B?dzF5R25DTXBZbXBLRFBMdEJqS0JnZHgyTXRySXpXQ3hyTWtjVnVBSm1kbFU3?=
 =?utf-8?B?eU1YSm9tbjhFcUZJbHlXWWs1YlAwYlp0VEZpcWNnU1RyMklkN1hndFRQY0JE?=
 =?utf-8?B?ZmlaM0tabHYxMHBReFdzMEFmaGxTUnMxSURnZURsUEdPRUQxSDI0bnAyak9Z?=
 =?utf-8?B?VzMxR1ZBdGJmNGd1eFIyNDJwTXJhdVZ4dzdPbUVTditWRzdMRUdadkI4NkZy?=
 =?utf-8?B?bGRXd2pGMDhUdk9na1hldEFhd2NWR2l0Y3YzU3J4WGR4b1JsOVgrWUIxemRQ?=
 =?utf-8?B?dlM1ME0vWFh1L3RzZGNPS0FMcDFNYVJFaHVLYitQS2FuS01IdzhGSEh1d0hu?=
 =?utf-8?B?ZHg1TE84OXpKZFlQc2FubUMzYWhpYzM2aEM2TTNUZjBFdlU1Q3l0RjMrbGFC?=
 =?utf-8?Q?uXoQD89Jt7/BcHwOnKybW5Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5520BB5F312FC844A5FE5A886AD205C1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7eb64a0-8b31-4698-d707-08da96de39a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 05:50:41.9328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SlFxg4Bkc1r+fCi4MV2PHuwl8/9yUYpR6F8X+GdwA15rUbtDkok5kSW1n7JKgO0QkYWsSo0XedADMWYd2AAH3RqJTCY+UL1Ppovcv7f8psw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1970
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

DQoNCkxlIDE0LzA5LzIwMjIgw6AgMTc6NDcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBwb3dlcnBjIGhhcyBhIG51bWJlciBvZiByZWFkLW9ubHkgc2VjdGlvbnMgYW5kIHRhYmxlcyB0
aGF0IGFyZSBwdXQNCj4gYWZ0ZXIgUk9fREFUQSgpLiBNb3ZlIHRoZSBfX2VuZF9yb2RhdGEgc3lt
Ym9sIHRvIGNvdmVyIHRoZXNlIGFzIHdlbGwuDQo+IA0KPiBTZXR0aW5nIG1lbW9yeSB0byByZWFk
LW9ubHkgYXQgYm9vdCBpcyBkb25lIHVzaW5nIF9faW5pdF9iZWdpbiwNCj4gY2hhbmdlIHRoYXQg
dGhhdCB0byB1c2UgX19lbmRfcm9kYXRhLg0KDQpJIHNlZSB0aGUgaWRlYSBhZnRlciBsb29raW5n
IGluIG1vcmUgZGV0YWlscyBpbiB0aGUgZ2VuZXJhdGVkIGNvZGUsIGJ1dCANCkkgdGhpbmsgdGhp
cyBjb21taXQgZGVzY3JpcHRpb24gbmVlZHMgdG8gYmUgbW9yZSBleHBsYW5hdG9yeS4NCg0KSW4g
bW0vcGd0YWJsZV8zMi5jIHRoZXJlIHdhcyBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkgX19pbml0
X2JlZ2luIGlzIA0KdXNlZC4gSSB0aGluayB5b3UgbmVlZCB0byBleHBsYWluIHdoeSB3ZSBkb24n
dCB3YW50IHRvIHVzZSBpdCBhbnltb3JlIA0KYW5kIHdoeSB3ZSBjYW4gbm93IHVzZSBfX2VuZF9y
b2RhdGEuDQoNCj4gDQo+IFRoaXMgYWxzbyBhZmZlY3RzIGJvb3QgZG1lc2csIGlzX2tlcm5lbF9y
b2RhdGEoKSwgYW5kIHNvbWUgb3RoZXIgY2hlY2tzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlj
aG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICAgICB8IDMgKysrDQo+ICAgYXJjaC9wb3dlcnBjL21t
L2Jvb2szczMyL21tdS5jICAgICAgICAgICB8IDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaGFzaF9wZ3RhYmxlLmMgIHwgMiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9yYWRpeF9wZ3RhYmxlLmMgfCAyICstDQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIu
YyAgICAgICAgICAgICB8IDUgKystLS0NCj4gICA1IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL3ZtbGludXgubGRzLlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3ZtbGludXgubGRzLlMNCj4g
aW5kZXggZmUyMmQ5NDA0MTJmLi45MGFjNWZmNzNkZjIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvdm1saW51eC5sZHMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Zt
bGludXgubGRzLlMNCj4gQEAgLTIxMCw2ICsyMTAsOSBAQCBTRUNUSU9OUw0KPiAgIAl9DQo+ICAg
I2VuZGlmDQo+ICAgDQo+ICsJLiA9IEFMSUdOKFBBR0VfU0laRSk7DQo+ICsJX19lbmRfcm9kYXRh
ID0gLjsNCj4gKw0KDQpJIHRoaW5rIHRoaXMgd2lsbCBsaWtlbHkgYnJlYWsgYmxvY2sgbWFwcGlu
ZyBvbiBQUEMzMi4NCg0KSXQgbmVlZHMgdG8gYmUgYWxpZ25lZCB0byBTVFJJQ1RfQUxJR05fU0la
RSwgbGlrZSBfX2luaXRfYmVnaW4gaXMuDQoNCg0KPiAgIC8qDQo+ICAgICogSW5pdCBzZWN0aW9u
cyBkaXNjYXJkZWQgYXQgcnVudGltZQ0KPiAgICAqLw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczMyL21tdS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczMyL21tdS5jDQo+
IGluZGV4IGE5NmI3MzAwNmRmYi4uZTEzYjg4M2U0ZTViIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzMzIvbW11LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczMy
L21tdS5jDQo+IEBAIC0yNDAsNyArMjQwLDcgQEAgdm9pZCBtbXVfbWFya19yb2RhdGFfcm8odm9p
ZCkNCj4gICAJZm9yIChpID0gMDsgaSA8IG5iOyBpKyspIHsNCj4gICAJCXN0cnVjdCBwcGNfYmF0
ICpiYXQgPSBCQVRTW2ldOw0KPiAgIA0KPiAtCQlpZiAoYmF0X2FkZHJzW2ldLnN0YXJ0IDwgKHVu
c2lnbmVkIGxvbmcpX19pbml0X2JlZ2luKQ0KPiArCQlpZiAoYmF0X2FkZHJzW2ldLnN0YXJ0IDwg
KHVuc2lnbmVkIGxvbmcpX19lbmRfcm9kYXRhKQ0KPiAgIAkJCWJhdFsxXS5iYXRsID0gKGJhdFsx
XS5iYXRsICYgfkJQUF9SVykgfCBCUFBfUlg7DQo+ICAgCX0NCj4gICANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9t
bS9ib29rM3M2NC9oYXNoX3BndGFibGUuYw0KPiBpbmRleCBhZTAwOGI5ZGYwZTYuLjI4MzMyMDAx
YmQ4NyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2hhc2hfcGd0YWJs
ZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9oYXNoX3BndGFibGUuYw0KPiBA
QCAtNTQxLDcgKzU0MSw3IEBAIHZvaWQgaGFzaF9fbWFya19yb2RhdGFfcm8odm9pZCkNCj4gICAJ
dW5zaWduZWQgbG9uZyBzdGFydCwgZW5kLCBwcDsNCj4gICANCj4gICAJc3RhcnQgPSAodW5zaWdu
ZWQgbG9uZylfc3RleHQ7DQo+IC0JZW5kID0gKHVuc2lnbmVkIGxvbmcpX19pbml0X2JlZ2luOw0K
PiArCWVuZCA9ICh1bnNpZ25lZCBsb25nKV9fZW5kX3JvZGF0YTsNCj4gICANCj4gICAJcHAgPSBo
dGFiX2NvbnZlcnRfcHRlX2ZsYWdzKHBncHJvdF92YWwoUEFHRV9LRVJORUxfUk9YKSwgSFBURV9V
U0VfS0VSTkVMX0tFWSk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcmFkaXhfcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3Bn
dGFibGUuYw0KPiBpbmRleCA2OTgyNzQxMDljOTEuLjIzMDVmMzRiY2MzMyAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYw0KPiArKysgYi9hcmNo
L3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jDQo+IEBAIC0yMjgsNyArMjI4LDcg
QEAgdm9pZCByYWRpeF9fbWFya19yb2RhdGFfcm8odm9pZCkNCj4gICAJdW5zaWduZWQgbG9uZyBz
dGFydCwgZW5kOw0KPiAgIA0KPiAgIAlzdGFydCA9ICh1bnNpZ25lZCBsb25nKV9zdGV4dDsNCj4g
LQllbmQgPSAodW5zaWduZWQgbG9uZylfX2luaXRfYmVnaW47DQo+ICsJZW5kID0gKHVuc2lnbmVk
IGxvbmcpX19lbmRfcm9kYXRhOw0KPiAgIA0KPiAgIAlyYWRpeF9fY2hhbmdlX21lbW9yeV9yYW5n
ZShzdGFydCwgZW5kLCBfUEFHRV9XUklURSk7DQo+ICAgfQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL21tL3BndGFibGVfMzIuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzMyLmMNCj4g
aW5kZXggM2FjNzNmOWZiNWQ1Li4xMTJhZjhjNTQ0N2EgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9tbS9wZ3RhYmxlXzMyLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIu
Yw0KPiBAQCAtMTU4LDEwICsxNTgsOSBAQCB2b2lkIG1hcmtfcm9kYXRhX3JvKHZvaWQpDQo+ICAg
CX0NCj4gICANCj4gICAJLyoNCj4gLQkgKiBtYXJrIC50ZXh0IGFuZCAucm9kYXRhIGFzIHJlYWQg
b25seS4gVXNlIF9faW5pdF9iZWdpbiByYXRoZXIgdGhhbg0KPiAtCSAqIF9fZW5kX3JvZGF0YSB0
byBjb3ZlciBOT1RFUyBhbmQgRVhDRVBUSU9OX1RBQkxFLg0KPiArCSAqIG1hcmsgLnRleHQgYW5k
IC5yb2RhdGEgYXMgcmVhZCBvbmx5Lg0KPiAgIAkgKi8NCj4gLQludW1wYWdlcyA9IFBGTl9VUCgo
dW5zaWduZWQgbG9uZylfX2luaXRfYmVnaW4pIC0NCj4gKwludW1wYWdlcyA9IFBGTl9VUCgodW5z
aWduZWQgbG9uZylfX2VuZF9yb2RhdGEpIC0NCj4gICAJCSAgIFBGTl9ET1dOKCh1bnNpZ25lZCBs
b25nKV9zdGV4dCk7DQo+ICAgDQo+ICAgCXNldF9tZW1vcnlfcm8oKHVuc2lnbmVkIGxvbmcpX3N0
ZXh0LCBudW1wYWdlcyk7
