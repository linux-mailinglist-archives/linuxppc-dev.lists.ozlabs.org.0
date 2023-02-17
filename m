Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C269A5AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 07:38:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ2F41XMhz3f61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:38:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=U1G6ngZa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=U1G6ngZa;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ2D368BLz3c6G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 17:37:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYkjHOrox+dbJrdmkONgSxG4r2f3Hhvis0sQC807DH5cL5Pui3TkQ8Tecl7q7EviJsTXFSIX3OXOi0g6CXa0zMHjMO5wTfHQ4atIicZgnKXancXZ6ns4oAKd2WI9NyfwYFvpYb7oCZ2/Med3Juisk7eyU52GATASJfNah1p0BC6QHYaZJi9v6/X+pGgpWXNhkWB84t9bpiI+Ic5tKKj5/kGFmXsEhZWAPSpJY8Rrp3HWZCcJ6/9o216xwGJk7piGY+QhfYsQ0ju/RQZMJGhXyP+P9Vly5FK8FxJBSaRWGzE7pRcWycrCKIihOYKKZVR+AndzPsg/j+TJnlGcMjCeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwN8exu51N9uf/jpsfYY96S36zgROmADgNEs9xP572M=;
 b=eJlz7+8ND0v/IrWPMhmM7dkvE0da3L661nELC34j2fQCknuzXqKBYZXXvz4rtHYFnLJz+VnAu0H4dXOu0PdwGNfEdmoeposhaQdOPTTHfJ1uTS5y5RTHh/ij6YnVLbYE3MXOcyggSBqj7Fn35E9UZLEgPTKCfalibvIfizYZV7bcMW8IESzdF+UVdhVBNKcVVVt5Pcw28RPG+apkY1eD39SkUXHQXf95znnAzwZiFVNSE/ysY8qBKQTGfNVA2/YMYXV/6apex85CUWsAH4knV5wfp6zYrkZcPfDxx1VcdZeTks64H+WZXFUOVCN2CrXXDrcN4Qj02/0GFaWEsomH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwN8exu51N9uf/jpsfYY96S36zgROmADgNEs9xP572M=;
 b=U1G6ngZaJu3iAb4DEc0i+y2UxYSLHLKLziN6U3peq3wQ8LzwMPRAb/W3sm/oMu6PfrouoOCR595+GluW13GZr40psFWyA+BE0qqLKymi6cAHyqLLC2aPTFchO78FQZRmqliQDm2ZiEjBiCm3bu0g6bckEl334d6z8wxKQQjDrxj9UKrFG/k633gnLwgSEaPKm9+ciOMGRpP6J8SkM5xRVC6mXHZi4EAzCdVftjtRxQcuRm+j1T1gBAsuPR6HkRX6GFhQ/1KAHJtd7ekG9dNrb9ubjK/i6gL9yIimEehHsHJc1XItRBYOmRyhtFZibl3n0cutLX7xJcgwLyddgJvZ6g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1554.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Fri, 17 Feb
 2023 06:36:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 06:36:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
Thread-Topic: [PATCH 2/2] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
Thread-Index: AQHZQcUHtgTtChsnuU68A5IHvgVhba7RKS6AgAEOmICAAHkagA==
Date: Fri, 17 Feb 2023 06:36:48 +0000
Message-ID: <ec61d8c8-b7e5-9a76-4400-47c513f92943@csgroup.eu>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
 <20230216050938.2188488-2-rmclure@linux.ibm.com>
 <319e4663-2732-4974-5642-f0c1ef98d08a@csgroup.eu>
 <9B8ABAF9-22DE-43A6-AADE-9B3165FD3522@linux.ibm.com>
In-Reply-To: <9B8ABAF9-22DE-43A6-AADE-9B3165FD3522@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1554:EE_
x-ms-office365-filtering-correlation-id: 34a1c79f-86b9-4f82-8286-08db10b15871
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hoScpP7lt8uGqt3M+UcfuvumMKmyGT8eK3SVJp89iHNKhhCkW0hlEuMAaoRT4cE748aWltATl9c6SXgj3+Tv+xu/ZdH95l+ealuF61aT1RzrS5LNZVFJpN0Jb7acxAW+2miNZTJ4njsvol3B0MLF/qlmB7QRmFVow1obBWFaFG1iAjLX+tKkoVnORp9VwdH2yj1KrGlkJE60A2MLpMgH6QDu6w9yvBEBWsY76+IWwTkspEvgpoP59KcJ4/J3XPBaxFLnZSlhXWJE6sW6NhFBNjK/LD3BB6/5WPcJwHdAhkkL6xgg4+IDfsw0ygWxrQJ11wJOHWXwDsE2WmjuU6cMu982CXtL4Anj8Zy+aE4oeKKJnAKx0q8Rr73lev5Fx9S/w7Mz6Y1IWqNa0ydRFpZG185j74QzjfCJ2PI+AOHKy+XhDrze3nEBIXshKt2Oz9R+VWDrwED9iNCl7n8CnS2OVbvo/9lDgNbccmkkxTTBSmTMHwVhowG4ILQLfOlqqGR6YXz2D7Qsx3U/tFhcMxPYdYK07+6aTx1AX4CFUMcTJt/9zF2K8HQPtJmsluMT903F7vjor9qBLWc78nMftQc7J5AUDjtGWjs/JkedCI+w82mhkzc3oNUQ9JL5NzbeFXWwMryU2Ko/aaAxZh8KH9P1xOu3S6sxRoLjXSZ/XzltF3l+uznj7QdkPRpfGBZnhT9gCWdOLvJX+gwvUgJEsqJyW1dA+vlVs0kN26poSMjjrVw4hIJdutkexJf59W70kzMW
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199018)(5660300002)(31686004)(44832011)(41300700001)(2906002)(6916009)(4326008)(64756008)(76116006)(91956017)(316002)(66556008)(66476007)(8676002)(66946007)(66446008)(66574015)(478600001)(71200400001)(966005)(6486002)(2616005)(53546011)(6506007)(26005)(186003)(6512007)(8936002)(36756003)(122000001)(31696002)(86362001)(38070700005)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OTNYMllWbDl6MjUxdWtNc0VRczlNL2dDbDZPbVJBOGxZdzRqY0M4Z1pPOGZy?=
 =?utf-8?B?dm4vZCtoMVREYmlWTHp6dlZ0ZVpPSTBzbXlwSVN1QmpUUHIyTVZlR1U4ejFO?=
 =?utf-8?B?bkE2OGZBZ2xRa1ZJZXI2M2RMcUNYaTlPdDlvaDdTaTV5V3N6VmluM29MZTc5?=
 =?utf-8?B?YytwOHBJeFIyTmpITkZ3ellMM3R3cVh6cloyeFVZWDZsRDlFaTNjQjFlOTVC?=
 =?utf-8?B?NHdZTEVvMHVYbnlTSGtsVVVYeHIrcmtpMGRSSkZaVk8xeFNnVGNNTUhld1pz?=
 =?utf-8?B?ZTh0RkI0a0crVnQ2ZXhDUzhkTENCUHAyT2p2YzdTOUxWQTZTOGorNXY0NFdU?=
 =?utf-8?B?bTU1ZmloM09JcmhpdmxvSGo2dmhHYkszZnhkTnJJWWJPYk5CSm5Rd0Fac09Q?=
 =?utf-8?B?UnJwNFIwdVF5MjZrYkdTbTA4RG5xbzgxR3hiNWNEaXNMZFBkeXA2dndkR3V1?=
 =?utf-8?B?UzlUTndOTlBNMHoweXRlTDRDTUoxSXE1RVRFWDdVVEVpRkc0bDdKa21RRjBD?=
 =?utf-8?B?Z2laYWgvQXpUUlIvNklVRGN2Wm85K05haEFrSWlxQ1N6YmJ1UmFRenJBZUYv?=
 =?utf-8?B?QXdyeGdpYWg0WjFESytmV2lTNEI1VWxJWUtEUktBVVRkbVBqWFBjMWI0ZDJ0?=
 =?utf-8?B?TEVxRmVDNjFnM3p0OWFxb0dXQ3kyc0R4dGdMdVYralRwVDlVVm04RW1CeTBE?=
 =?utf-8?B?K1BPVEgwT1RqWWp4QXRyeWk2NXppYTNUc1BzdnZObEprQmZia3ZmV3V0dHU4?=
 =?utf-8?B?YUxjc3JFblgxS0FWdFEvWkhhOUQyNms0NnRZYk11cmVxTGNiUk84b25ndjVj?=
 =?utf-8?B?Ky9KYWgzMTlMT3BzcEtlTWpnRVlUVklLM2F5R1hGNDN0MTVjbmJWUElhRmVj?=
 =?utf-8?B?Mk45anFKbzhGTFc4S0dkck1uKzBiV1JwUGVoLzQ5UjluazNIOWJHQjZSUFJy?=
 =?utf-8?B?MVA1bVRxVGF5ZDA3MXlHTVFlZXlDdmQrOE0wZ1lZNDNOa2svT0hEUHlJZDBa?=
 =?utf-8?B?MytVS1VWK3BkQlk2R2hEREdzYytKU3dNcmFzTENCdzFMVy84aFlkZkZ3TkNT?=
 =?utf-8?B?cjZpa1ZKd01IQ0JKWDRzWVF4T2lRZVh4QTlmNFE1Z3NpN3UxZ0diUG51UnJI?=
 =?utf-8?B?bDVSSDZDZ0hpSWx6TTlOdGQrbEtQNEZ0UDJpQmw2clYrSU82MGxPbzhVTXI4?=
 =?utf-8?B?VTRKNGFIeVB1bXJyWGxvZy9WODNYQk1adlhnY1JSaGlKRGNSZHArWTkyY3VC?=
 =?utf-8?B?S1FDbUR6SWozYS8raTMyamtHcXJnQ3BuMGwzR3BSZ1JlS0VTT2ptVGNESEhX?=
 =?utf-8?B?T2YrdnRWMHJkZGllam4ydHRGeTVQbXdHcU1rUVJkdS9kMlZ0WFkvbENmTnlB?=
 =?utf-8?B?bk5Mb2pnaXB4cVFiUHk5RVFOK1UrTmRYb2trS2tNVkd5VkswMTRkVytHelBx?=
 =?utf-8?B?Z052QjZ1bms2ZmI0cE85STdkR3FGZzZNTW1JODVOZ1NuZDAvQ1RHcmR0N3BS?=
 =?utf-8?B?V0o5aHZxMjZneVpzSFQ0WEJ4N0ZkL1N6ZVVmSmRtY29ERjhHRkJDeDlWQUUz?=
 =?utf-8?B?L29XUk5rMlRrSkc3Z2dwUkxHUkdCZ0cwU0JCbGdmT3l1NE5DbWhmTG1xNUdu?=
 =?utf-8?B?REVCVGRpckhmOTB0VUZHV01pUllOeUZJeUVicXJWZS9CRE1VODlqRmEzODlJ?=
 =?utf-8?B?c3Y5dkttL3hsblFtNWZDenEycWxJVVNna0VnbXVVdFc1dWF2eGNweGJlbWFK?=
 =?utf-8?B?Rmw3UDhQY2JxcU90LzBOT0xuQjVYU0JneXByT2E1WGl3RU53VWhLSS8wcm9U?=
 =?utf-8?B?WUNRTEZnUm0zaW51YUR5b2xGeEN0cURHRFNjVTR2VC9BRDczSTFPWVd5amNC?=
 =?utf-8?B?RGVqS25Zd1NyYkh1R3BHVG1weiswZktVaE9YTUNaSkZENlZlYTliMVdMMzdw?=
 =?utf-8?B?UjNVUTRPMHZROWhqaHl4RTdXcTU5K0N1V21uV2JabCtTZmlQQkVDU2FzMDRH?=
 =?utf-8?B?WldLL2FJUDhNeFNtZkphdGltWng0RDU0M0tld3VCUXkvZmdoVG5XaklnVWZT?=
 =?utf-8?B?MFZOcUlmR3ZuTWkzWVhvRlJBQS9weVhkYVpXam1FZyswRTcyWFpycFEvR3dC?=
 =?utf-8?B?Zmc2dW1idUJNWVVSdE1QT1BaaGlGZEcwZlQ4aXdFdE5Lb1NDL21aK0FPMHBZ?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB37629F108D7542AEFEAE58C139445A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a1c79f-86b9-4f82-8286-08db10b15871
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 06:36:48.1990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgIZ7uBV72zcDcWvy2swXI8Nm20oT084TZgkm5MDh7JOs2Psw6y4Ve8l1sPaM5RrBqO3ZpVKEoOXbI9XsboLdk370CgCjqSgwf8geiKbFHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1554
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAyLzIwMjMgw6AgMDA6MjMsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPj4g
T24gMTYgRmViIDIwMjMsIGF0IDY6MTQgcG0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pg0KPj4NCj4+DQo+PiBMZSAxNi8wMi8yMDIzIMOg
IDA2OjA5LCBSb2hhbiBNY0x1cmUgYSDDqWNyaXQgOg0KPj4+IEVuYWJsZSBIQVZFX0FSQ0hfS0NT
QU4gb24gYWxsIHBvd2VycGMgcGxhdGZvcm1zLCBwZXJtaXR0aW5nIHVzZSBvZiB0aGUNCj4+PiBr
ZXJuZWwgY29uY3VycmVuY3kgc2FuaXRpc2VyIHRocm91Z2ggdGhlIENPTkZJR19LQ1NBTl8qIGtj
b25maWcgb3B0aW9ucy4NCj4+Pg0KPj4+IEJvb3RzIGFuZCBwYXNzZXMgc2VsZnRlc3RzIG9uIDMy
LWJpdCBhbmQgNjQtYml0IHBsYXRmb3Jtcy4gU2VlDQo+Pj4gZG9jdW1lbnRhdGlvbiBpbiBEb2N1
bWVudGF0aW9uL2Rldi10b29scy9rY3Nhbi5yc3QgZm9yIG1vcmUgaW5mb3JtYXRpb24uDQo+Pj4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4N
Cj4+PiAtLS0NCj4+PiBOZXcgcGF0Y2gNCj4+PiAtLS0NCj4+PiAgIGFyY2gvcG93ZXJwYy9LY29u
ZmlnIHwgMiArLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNo
L3Bvd2VycGMvS2NvbmZpZw0KPj4+IGluZGV4IDJjOWNkZjFkODc2MS4uNDU3NzE0NDhkNDdhIDEw
MDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+Pj4gKysrIGIvYXJjaC9wb3dl
cnBjL0tjb25maWcNCj4+PiBAQCAtMTk3LDcgKzE5Nyw3IEBAIGNvbmZpZyBQUEMNCj4+PiAgICBz
ZWxlY3QgSEFWRV9BUkNIX0tBU0FOIGlmIFBQQ19SQURJWF9NTVUNCj4+PiAgICBzZWxlY3QgSEFW
RV9BUkNIX0tBU0FOIGlmIFBQQ19CT09LM0VfNjQNCj4+PiAgICBzZWxlY3QgSEFWRV9BUkNIX0tB
U0FOX1ZNQUxMT0MgaWYgSEFWRV9BUkNIX0tBU0FODQo+Pj4gLSBzZWxlY3QgSEFWRV9BUkNIX0tD
U0FOICAgICAgICAgICAgIGlmIFBQQ19CT09LM1NfNjQNCj4+PiArIHNlbGVjdCBIQVZFX0FSQ0hf
S0NTQU4NCj4+DQo+PiBTbyB0aGF0J3MgYSBmb2xsb3d1cCBvZiBhIG5vdCB5ZXQgcG9zdGVkIHZl
cnNpb24gdjUgb2YgdGhlIG90aGVyIHNlcmllcyA/DQo+PiBXaHkgbm90IGp1c3QgYWRkIHBhdGNo
IDEgaW4gdGhhdCBzZXJpZXMgYW5kIGhhdmUgS0NTQU4gZm9yIGFsbCBwb3dlcnBjDQo+PiBhdCBv
bmNlID8NCj4gDQo+IFNvIHRoZSB2MyB3YXMgYWNjZXB0ZWQgdXBzdHJlYW0sIGxpa2VseSB0byBh
cHBlYXIgaW4gNi4zLiBUaGlzIHBhdGNoIHNlcmllcyBpcw0KPiBqdXN0IHRvIGV4dGVuZCBzdXBw
b3J0IHRvIG90aGVyIHBsYXRmb3Jtcywgb25jZSBrY3NhbiBzdXBwb3J0cyB1cy4NCg0KSHVtIC4u
LiBPay4NCg0KSSBjaGVja2VkIGluIGNoZWNrcGF0Y2ggYmVmb3JlIHdyaXR0aW5nIHRoYXQgbWFp
bCBhbmQgc2F3IHRoYXQgdjQgd2FzIA0KZmxhZ2dlZCAiY2hhbmdlcyByZXF1ZXN0ZWQiLCBzbyBJ
IGRpZG4ndCBub3RpY2UgdjMgd2FzIGFjY2VwdGVkLg0KDQoNCg0KPiANCj4gTGluazogaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9jb3Zlci8yMDIzMDIw
NjAyMTgwMS4xMDUyNjgtMS1ybWNsdXJlQGxpbnV4LmlibS5jb20vDQo+IA0KPj4NCj4+PiAgICBz
ZWxlY3QgSEFWRV9BUkNIX0tGRU5DRSBpZiBBUkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQw0K
Pj4+ICAgIHNlbGVjdCBIQVZFX0FSQ0hfUkFORE9NSVpFX0tTVEFDS19PRkZTRVQNCj4+PiAgICBz
ZWxlY3QgSEFWRV9BUkNIX0tHREINCj4gDQo+IA0K
