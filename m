Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0590B4961DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 16:14:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgNGD6tNnz3bWG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 02:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::627;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::627])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgNFk4Grnz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 02:14:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHCfQSBbsgLdUDQ7G3WLQdP7X8rH5Sz3AZvv8pY7sM55YIBiVj3+G8Mssl32gNQQxtqEXdl/5oLceuedrKnOSf51pDFCVpNbw/uguEvaDdvV7VtpBHdjKOxm6i6xSDGUEvxGJHLi6m1LPTVQrgl9/6LO++G6r4r3PTlplznQ14DqFrX4SO5cyPI+fyEXA5iXmBTx71AsMaNAxpVBtFFtAUh/epktcixhi2S8gRFPQkfTIW3EQWSPSMEw4EKCr3i6P513xwp+fXzIBWD6vHUr6l+pi+O4ZXOoqTQ/DjDC6sWWw24s88bh/fRPHf+nr+Gl4zkP9qm/PUF1gPtpEZ7Feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv0z9o6c1hw+CR7hkX5hKiJFTpDz55f1F4entgYHW+w=;
 b=kPPZB4dAiE8qO84Pvj8twpd2fIFHrxYEDN5286ytH/aly4JRP44M+LbNZPQ+++7Mttqkhdo1CaqHsydsdc26G1GIAsiWadpWdGFbrg8cRwN42OTXB7stjNdcR9hRtMrkfSUNqHCjQJHBOoeAKcUXhj/g6uSZLwRbd8a1MApyIETa0LXa3aX7RLWuzpEUQ0N8PXFLuMrJxTm4b4n1XeUQ63lyh4/ZeSCAhnyem/UQIgTLUWsPnSHFWWDYxwnmoJw26UI4mY6MQ9o43hMf0OvdcaYswdnroS9AETIxUeTRcp3LVV3qOMXUriF90zpPJACbRykbb2iK6K2mtPr3bOe8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3082.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 15:13:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 15:13:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Thread-Topic: [PATCH v3] powerpc: Add missing SPDX license identifiers
Thread-Index: AQHYDraAMVY9CjZ7JE+Gvd6Tqz9gGqxtiuEAgAAKrYA=
Date: Fri, 21 Jan 2022 15:13:50 +0000
Message-ID: <24829c2f-6855-c8d6-7ae4-17c5517f890d@csgroup.eu>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
 <YerEuE6XlslE3Goo@kroah.com>
In-Reply-To: <YerEuE6XlslE3Goo@kroah.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1714cfa-9a4f-45d2-f47f-08d9dcf0a119
x-ms-traffictypediagnostic: MRZP264MB3082:EE_
x-microsoft-antispam-prvs: <MRZP264MB30829547DDDD02776EC36D9BED5B9@MRZP264MB3082.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtACiHV4bNkrzCA74/drNu5uv4zJ+d2kqGCDP3TIRcnjOFNK6aXxrEecTJBlXrwSaITwPrWyvSO20eI+h9/E9l+185xaLZkYmwY6FOO4E9ubHxxoYYar3s+XJDKCrWfE9dLnyIuzY8pLtfhKk5nPOER2Yo3G57RklVHbedDm9ra/BREsRstHlN6Q7J6ndHJAHoTl54PpqrlaqyY/02fc4OndsDHhvShE2k9cQM0l7dfjsl2jCDtHhqYEemx+O+E/6oVzw+RxDFQqbbJpZ49O/h8IrA/SuLVM526EYHVqHiCVhS/2MxxX8gFUskwRfXBNzcYKZhp067BV/K1pGE2G8WNHWTQe9oidM94mwhJ8m7a9k1mDGJWFwwo7peXOZ51cECHtK2Bn1XGPkxCaq8TNPafFUo8KEd7PeUZOHZsb3q82fCqbm8z22jSb+PB/Cq4u3qqjDLhB8+4TDiCwznpdU4n+OB8oDkcZCsD+PB1CBtjLq/noGdY2XqK5ifHD/JBxlY86vwsxF1u6R2KaS6tx/EO/sXgnWAmzGHWjZqfgXjmxuGQ/z2tzNTfoWz92iJWosN/NHAE3QdPCKn65GloMm7RGw6GhOYNYHEQRAdTjVJ1PO5D/8RzE9c1WKDhxR2M8V3HBRmjKiQGbsZnsaSHHFkk7NM1foosmEI08cN2OCTWyGUlQJI9Sq/K1JhcqoClqXBBJqlqd3T7tqrIJMbcURu1ALpxlwT5tv69kzwS1P+ICvns7RXBxa0HPKWfyyvExl5td+eNGX1QWD4qQRvGEWeanK0TjwH8t1NI5534QMqo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(38070700005)(38100700002)(122000001)(8676002)(6506007)(8936002)(86362001)(6486002)(26005)(36756003)(186003)(4326008)(31696002)(6916009)(71200400001)(2906002)(66556008)(66476007)(66446008)(64756008)(91956017)(83380400001)(76116006)(66946007)(44832011)(54906003)(316002)(5660300002)(2616005)(508600001)(31686004)(66574015)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnYrbkI0NVFoRVpHWURqNk12aUltdFZJeVJWZFVWRmlZVXJ4Y2RmMDB2Qmh5?=
 =?utf-8?B?NzRWblFxakM4QWg4WFFBekovaUM3aWUzaENWYVhqQ0FMN0Q4K200RVRRR2R4?=
 =?utf-8?B?N3RUUWU0THErUVhveTkxSmR6ZTIyOWZ6K2tlMWxTdWQxcGhycndrTUplTFpC?=
 =?utf-8?B?c2k4Nm1PL21IMEZCQXVmUGdVN0Z5WHVQYVdua2xtanI4OXg3eUFTUVo2VFJ2?=
 =?utf-8?B?YnEwaXpFb1kwL1Y4R09lWTRzc3VHZ0NPWXhSSVpuYklQTUJWaWZSeXJJb25U?=
 =?utf-8?B?Qklta1ArUDQzdUx3aEJDK0VMZXRNMWJhMSs5d3N6ZzNYKzdwZkFJandadlRG?=
 =?utf-8?B?UlArZzc4QVA2YURHZk5KT1IzWXhvZEFUVlJ3V2Q3NlViWUJpdXJqWEF0TytY?=
 =?utf-8?B?VmN3c3F1b3JWZ1NRMzlWdFI0Ui9jOWEwSWFvNXdZeXJGcjlDUTVwWWNEaEpS?=
 =?utf-8?B?MGIzTGZ6OTU3WTFDS1JFOUh2R1ljWjBRS0pXbGxGOWR4MGVITW44Ri9mUFJY?=
 =?utf-8?B?ZHdoQlBXZGplNkUvclRTMFJOSTF6Ry9YK29TbFdwVEhoVWJPMExTNEh4NlBn?=
 =?utf-8?B?aVNOMmNuNDNZbndXdFdnTHlxbS9lTk56c0p2Zmo0OUpsUkpxS2Fib3l3Ti9x?=
 =?utf-8?B?Y3BQNDRhZkZEdDNiZlpFMkZDQ0xwQmxWZU1GUmlXVHc3LytFak8xaEhDYW8y?=
 =?utf-8?B?VWJHcllSVXIrM1FpeWlKQ1NnM0NDT1hGSUxRSU1jTzZ6WGZldXdSaEVVVEdu?=
 =?utf-8?B?bFZaSDRNM1lyL3JOMEdVQm9nNElIMENDUEQ4bnVMV2tERTZINDFOcStVQnhD?=
 =?utf-8?B?UFQ4RVB2dzBPUHB1d25lSGU0YTFTZnh2dGZHekZRM3dmVHFNVURXZmFRNjE1?=
 =?utf-8?B?aWgzRjErWjZJcWRPd21EeVZ1a3pWcHduWHk1TStaTlZ2eGJsYWxNclh6WFE4?=
 =?utf-8?B?ZGMya2RKSVVWbVNiRkxndHNyS0RwSXZrYVBHTzR0UTZLaGh6ZE5KeDZJbldG?=
 =?utf-8?B?cmh4OHVaR2dldDJCbHhMM0RrOVFvNXp3YzhtUTRCL1VIN1kvYjA1ODJoUyti?=
 =?utf-8?B?UzZPMmMrR3F5ZkR4TTlYMENwbERHeWp2MGZsZUEwUUNWSHdRbGhJdmRSeWlM?=
 =?utf-8?B?SjcxaWl2VkZ1QTZqRXducGJzNTdiVzhYOXVzQWJWbWRTK2NtYnFLK0NtdnFO?=
 =?utf-8?B?WXBOUzZjbHdDb09vcWcxZ2pIbTVzbUJEN1dLdTJtNlJNakdYYlNsQS9JQnhM?=
 =?utf-8?B?a0VCSVNHVVU0MmIxaTZWbU1KS1ErVDJsTm5vaGp0ajFmZ0JHeGtHQzBlQzNj?=
 =?utf-8?B?NVZPKzF4TlZWR0pwUHVmSHRqYXhjM2tmaGRBUDRMdm9sWlkvVUxvS09yNEdx?=
 =?utf-8?B?akNjZ2tMczVVQ09uSHhhM0VSYUhSY2lUR3BlT0ZocUkwT2pyRFhnMzM5Skdt?=
 =?utf-8?B?US9EV1Z0RDB4Y3BRdXhsbmRMYlN3alJGSTdMV0U4R3VOc2ExWU4zblRRR0lo?=
 =?utf-8?B?MHR0Z1J3a3N6bHFaWTFaQjNxZTBLYUhtcDU2d25GaEUyQjR5dFR1MDh4R2Qv?=
 =?utf-8?B?aWUwSE55ZlN4ZENLMnk5NzFsa1JkWmZjQ1VOVmtMSFdTUnZnOTFtS3VzTUZp?=
 =?utf-8?B?Tmt2QmxNcEp1VHNCTkR5ZlpWWEx2T0M0WjREak52SjJBZVVvL283UlJBVHJF?=
 =?utf-8?B?NHdCTmJIMHNKWHBLcGNWRDVuVTd4dUdINUY3UEYwalBpcmVENHJOcVB0cHln?=
 =?utf-8?B?bnNLMGMzZ1Z1OHlENkxxUVo2WU9seG91TWg3OTJRUTArb0xTSXEzbFNkalo2?=
 =?utf-8?B?WTFPa3hCbjNFVmhFcm9FWGNxRHJmb21SakQ0MmhlQUd2NHRxSUVGaWxkSHMy?=
 =?utf-8?B?OTFnd29PR2ExcitsNjBoK0tZZ3kybEY1b2pMOTNxNGVUT1ZUalMreGxhYVlG?=
 =?utf-8?B?bzJBeWdDQVdiOVVHaC9RMTJ2M0gwTitSR1E2eEJZUGJuRk1BMXhGMXdSaFRW?=
 =?utf-8?B?UmZKOVVtTDZZc04yRUI5L25uWHJqRmx0UklBZjkrdjZjK3hYSFR2eldIeWRi?=
 =?utf-8?B?TEJ4bStYT3lwaWVUSEZBb0JGS2ErdUdYbTNWaVVEaGxFRHljUU1NeHgrOTBh?=
 =?utf-8?B?dVZLN2VJaThYWjZLZFlSQ1dFbjF0djU5M3VjTWt3NDY2Mnh1c2pxZkN1NU9Z?=
 =?utf-8?B?eTlCOUZvUGZDc3dRTVRZMDJ1Z25WOEI5MWNRQ0l1RDZWODhVZmg3clZwOVMy?=
 =?utf-8?Q?ZsjcY8aKPvlc7QNUhmVwecaT2S6PksDnqZqsPHmdX8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4103F911905B34B8D362C80202EF862@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1714cfa-9a4f-45d2-f47f-08d9dcf0a119
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 15:13:50.1793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IwefvOTT4lpr+PJHLBlRvBHQu4OMIiXSqchAU1fGA5UjS4QGJkeFcJS8TzkIXFtnGxXlKSjEVQ7M95/ynMfLzAjDW2Ajv3psADdj6kKotZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3082
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAxLzIwMjIgw6AgMTU6MzUsIEdyZWcgS3JvYWgtSGFydG1hbiBhIMOpY3JpdMKg
Og0KPiBPbiBGcmksIEphbiAyMSwgMjAyMiBhdCAxMTowMzoyMEFNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4gU2V2ZXJhbCBmaWxlcyBhcmUgbWlzc2luZyBTUERYIGxpY2Vuc2Ug
aWRlbnRpZmllcnMuDQo+Pg0KPj4gRm9sbG93aW5nIGZpbGVzIGFyZSBnaXZlbiB0aGUgZm9sbG93
aW5nIFNQRFggaWRlbnRpZmllciBiYXNlZCBvbiB0aGUgY29tbWVudHMgaW4gdGhlIHRvcCBvZiB0
aGUgZmlsZToNCj4+DQo+PiAJYm9vdC9jcnRzYXZyZXMuUzovKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCsgKi8NCj4gDQo+IEFyZSB5b3Ugc3VyZSB0aGF0IHRoaXMgaXMgdGhlIGNv
cnJlY3QgbGljZW5zZSBmb3IgdGhpcyBmaWxlPw0KDQppdCBzYXlzICIuLi4gR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgLi4uIGVpdGhlciB2ZXJzaW9uIDIsIG9yIChhdCANCnlvdXIgb3B0aW9u
KSBhbnkgbGF0ZXIgdmVyc2lvbiIuDQoNCklzbid0IGl0IHdoYXQgR1BMLTIuMCsgbWVhbnMgPw0K
DQo+IA0KPiBBbHNvIHlvdSBkcm9wcGVkIHRoZSBhcmNoL3Bvd2VycGMvIHByZWZpeCBoZXJlLi4u
DQoNClllcyBJIGRpZCwgZm9yIGNsYXJpdHksIHRvIGdldCBzaG9ydGVyIGxpbmVzLg0KDQo+IA0K
PiANCj4+IAlpbmNsdWRlL2FzbS9lcGFwcl9oY2FsbHMuaDovKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCsgT1IgQlNEICovDQo+PiAJaW5jbHVkZS9hc20vZnNsX2hjYWxscy5oOi8q
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKyBPUiBCU0QgKi8NCj4+IAlpbmNsdWRl
L2FzbS9pYm1lYnVzLmg6LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgT3Bl
bklCIEJTRCAqLw0KPj4gCWluY2x1ZGUvYXNtL3NmcC1tYWNoaW5lLmg6LyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IExHUEwtMi4wKyAqLw0KPj4gCWt2bS9tcGljLmM6Ly8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjANCj4+IAlsaWIvY3J0c2F2cmVzLlM6LyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjArICovDQo+PiAJbW0vYm9vazNzNjQvaGFzaF80ay5jOi8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMR1BMLTIuMA0KPj4gCW1tL2Jvb2szczY0L2hhc2hfNjRr
LmM6Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExHUEwtMi4wDQo+PiAJbW0vYm9vazNzNjQv
aGFzaF9odWdlcGFnZS5jOi8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMR1BMLTIuMQ0KPj4g
CXBsYXRmb3Jtcy9wc2VyaWVzL2libWVidXMuYzovLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCBPUiBPcGVuSUIgQlNEDQo+PiAJdG9vbHMvaGVhZF9jaGVjay5zaDojIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KPj4gCXhtb24vcHBjLmg6LyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0xLjArICovDQo+Pg0KPj4gQWRkIHRvIG90aGVyIGZpbGVzIHRoZSBk
ZWZhdWx0IGtlcm5lbCBsaWNlbnNlIGlkZW50aWZpZXIsIGluIGV4dGVuc28gR1BMLTIuMC4NCj4+
DQo+PiBEVFMgZmlsZXMgYXJlIGhhbmRsZWQgaW4gYSBzZXBhcmF0ZSBjb21taXQuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1Pg0KPj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPj4gQ2M6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+PiBDYzog
bGludXgtc3BkeEB2Z2VyLmtlcm5lbC5vcmcNCj4+IC0tLQ0KPj4gdjM6IFJlbW92ZWQgbGljZW5z
ZSB0ZXh0IGFuZCBsaWNlbnNlIG5vdGUgaW4gdGhlIGZpbGVzIHRoYXQgaGF2ZSBhbnkuDQo+Pg0K
Pj4gdjI6IENoYW5nZWQgZnJvbSBHUEwtMi4wIHRvIGEgbGljZW5jZSBjb25zaXN0YW50IHdpdGgg
dGhlIGZpbGUncyBjb21tZW50cyBmb3IgdGhlIGZldyBmaWxlcyBsaXN0ZWQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLg0KPj4gLS0tDQoNCi4uLg0KDQo+PiAgIDkyIGZpbGVzIGNoYW5nZWQsIDEwNSBp
bnNlcnRpb25zKCspLCA0MjIgZGVsZXRpb25zKC0pDQo+IA0KPiBZb3UgbWlnaHQgd2FudCB0byBj
aGFuZ2UgbGVzcyBvZiB0aGVzZSBhdCBvbmNlLCBhcyB0aGlzIGlzIGhhcmQgdG8NCj4gcmV2aWV3
IGFzLWlzLg0KDQpPaw0KDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9ib290L2Ny
dHNhdnJlcy5TIGIvYXJjaC9wb3dlcnBjL2Jvb3QvY3J0c2F2cmVzLlMNCj4+IGluZGV4IDA4NWZi
MmI5YThiOC4uMjVlOTI0NDU5ZGNjIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Jvb3Qv
Y3J0c2F2cmVzLlMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9ib290L2NydHNhdnJlcy5TDQo+PiBA
QCAtMSwzICsxLDQgQEANCj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsg
Ki8NCj4+ICAgLyoNCj4+ICAgICogU3BlY2lhbCBzdXBwb3J0IGZvciBlYWJpIGFuZCBTVlI0DQo+
PiAgICAqDQo+PiBAQCAtNywxMSArOCw2IEBADQo+PiAgICAqDQo+PiAgICAqIEJhc2VkIG9uIGdj
Yy9jb25maWcvcnM2MDAwL2NydHNhdnJlcy5hc20gZnJvbSBnY2MNCj4+ICAgICoNCj4+IC0gKiBU
aGlzIGZpbGUgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
IG1vZGlmeSBpdA0KPj4gLSAqIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZQ0KPj4gLSAqIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkNCj4+IC0g
KiBsYXRlciB2ZXJzaW9uLg0KPj4gLSAqDQo+PiAgICAqIEluIGFkZGl0aW9uIHRvIHRoZSBwZXJt
aXNzaW9ucyBpbiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UsIHRoZQ0KPj4gICAgKiBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gZ2l2ZXMgeW91IHVubGltaXRlZCBwZXJtaXNzaW9uIHRv
IGxpbmsgdGhlDQo+PiAgICAqIGNvbXBpbGVkIHZlcnNpb24gb2YgdGhpcyBmaWxlIHdpdGggb3Ro
ZXIgcHJvZ3JhbXMsIGFuZCB0byBkaXN0cmlidXRlDQo+PiBAQCAtMjAsMTYgKzE2LDYgQEANCj4+
ICAgICogcmVzcGVjdHM7IGZvciBleGFtcGxlLCB0aGV5IGNvdmVyIG1vZGlmaWNhdGlvbiBvZiB0
aGUgZmlsZSwgYW5kDQo+PiAgICAqIGRpc3RyaWJ1dGlvbiB3aGVuIG5vdCBsaW5rZWQgaW50byBh
bm90aGVyIHByb2dyYW0uKQ0KPj4gICAgKg0KPj4gLSAqIFRoaXMgZmlsZSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLCBidXQNCj4+IC0gKiBXSVRIT1VU
IEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiAt
ICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAg
U2VlIHRoZSBHTlUNCj4+IC0gKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuDQo+PiAtICoNCj4+IC0gKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KPj4gLSAqIGFsb25nIHdpdGggdGhpcyBwcm9n
cmFtOyBzZWUgdGhlIGZpbGUgQ09QWUlORy4gIElmIG5vdCwgd3JpdGUgdG8NCj4+IC0gKiB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29y
LA0KPj4gLSAqIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSwgVVNBLg0KPj4gLSAqDQo+PiAgICAqICAg
IEFzIGEgc3BlY2lhbCBleGNlcHRpb24sIGlmIHlvdSBsaW5rIHRoaXMgbGlicmFyeSB3aXRoIGZp
bGVzDQo+PiAgICAqICAgIGNvbXBpbGVkIHdpdGggR0NDIHRvIHByb2R1Y2UgYW4gZXhlY3V0YWJs
ZSwgdGhpcyBkb2VzIG5vdCBjYXVzZQ0KPj4gICAgKiAgICB0aGUgcmVzdWx0aW5nIGV4ZWN1dGFi
bGUgdG8gYmUgY292ZXJlZCBieSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuDQo+IA0K
PiBMb29rIGF0IHRoYXQgInNwZWNpYWwgZXhjZXB0aW9uIiwgd2h5IGFyZSB5b3UgaWdub3Jpbmcg
aXQgaGVyZT8gIFlvdQ0KPiBjYW4ndCBkbyB0aGF0IDooDQoNCkknbSBub3QgaWdub3JpbmcgaXQs
IHRoYXQncyB0aGUgcmVhc29uIHdoeSBJIGxlZnQgaXQuDQoNCklzbid0IGl0IHRoZSBjb3JyZWN0
IHdheSB0byBkbyA/IEhvdyBzaG91bGQgaXQgYmUgZG9uZSA/DQoNCg0KQ2hyaXN0b3BoZQ==
