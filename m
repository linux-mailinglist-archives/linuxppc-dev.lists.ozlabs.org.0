Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1485A259A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 12:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDbJd0S09z3bkR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 20:13:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=A5SSmdZr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.81; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=A5SSmdZr;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120081.outbound.protection.outlook.com [40.107.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDbHr62NYz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 20:12:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evu5ULntdeA2iNAx271HXSmrB1eeqBdUpyDQ0y4/xHw7Mhr7jU2o0ieW3e7n5PBXXbeZPj5AEvwrcxFzAWtly+8pt83Yes08pFcvcF2FL5+8gAEKH+WVbbxZqVD+SlxxHQgGdUOIaMu2QvktxMBjoLjzU9Hv167e+79rwdJgFA9DkNipTj4OrJFTjwSXN+nOKNJJuc50kGtnv97OVceTAOHveYVWZLLAsofSXhlRGM938vMpi6sFpBANjBL4yrFhHsCIOV5kVugqbJSaMZ4MQzAf/5QQFhyxtiwpsTUpoeAgfP2X5cIfGiDqmUYryO04CQonBsLLzYd1hvoH5kkANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++x6hqOwQfcpAWJJleteRpp7IPJA2NzFiE0DmB7eHwY=;
 b=LCQ0sbBgeHedE0tHwqo8nsXejLNNSPjchnfwZgXKqarhE1OeeTne0oerc2W5vDub2r/hE4oZt+ieXEs2R0jCay4FzQVzoxHIzxUwQzdyCK5d1RZ4bbV9kfRCn+MMLtKTBcGAxvo+P3gFFVDMjye7aC8bPty4fUzQdr7wA2oJI6vo3E7KaYYwdyJNT/r8+pPpplX98hrlcuJ7ONCsekqvgxJM9sPwCI1lYkRAQdc1Ac5RC/EED2PS4R3WOTzbCnnQdPASVPmk8d8EzDI0ftpRFX5yIAs0nwnSPNUplmrss2aAlTvkZJoCvgSG+GQUaBSnK31OgtZxL5BBz0IiVToeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++x6hqOwQfcpAWJJleteRpp7IPJA2NzFiE0DmB7eHwY=;
 b=A5SSmdZrvrg8v3sVQtHdUC1YvBwfsDYinXIjwlfoyirRMO1esDCc1UHOR96x1eeRqnvuiPSctRywhs5eeWwhl6o3zrnk3suB93+kNk+e+9fd4CyzXm3V9eVBlNKl4IIXL46GVed2WNA4Fj+mMSGBnD8KdxykVyKWAHZXM0N/3GoD2lZpjajTVKNR1dzjGmlv42enGKxy1CRlrbvIQHXLCjoWPZCU8pdR6nHERQLnQhRNQ44FZFITMSPNxSHaUQpT/FPlrotW00uJaenkqc2JiI50nyTNcerJA3b9pgdQ7xQ/XSeOImi8gsxgHF89wkye7Tnpet0z3iwEvtqP2RfLQQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2974.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 10:12:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 10:12:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Topic: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
Thread-Index: AQHYuG3gJRoiq14gKku11kRUFzyUCa2/6mQAgAENeAA=
Date: Fri, 26 Aug 2022 10:12:35 +0000
Message-ID: <22016571-7fbd-4540-7f2c-aac305dc4b7d@csgroup.eu>
References: <20220624141412.72274-1-ubizjak@gmail.com>
 <1661422971.cqtahfm22j.naveen@linux.ibm.com>
 <20220825180806.GG25951@gate.crashing.org>
In-Reply-To: <20220825180806.GG25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ee3ce3e-7977-4df9-9d7c-08da874b7f2d
x-ms-traffictypediagnostic: PAZP264MB2974:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o9xpIVReLErkw640XyYWjMP7MM3r4DC0DWUYFncjLkLGJxQ8NOE/mxaBxKvvzVokIpcANvNE8cU0CN+bY+Mh0fLrRX+q2CgLZ61bE3PUJYAGCaiEjZuDJQq+KBNPPGsJFOJFQ0EariftCC3W1t/TJOSlX3JsV/zDEMMsbCQk4wmJtMpONEbYSW7CeopTV2YxMYheXz4PF6rb3CGVcofQ7R9tV8Gxston2sO+2jun+yxHEpg7lh49EmScmwEKFEZiA9UZTKU1uBQpIeRrOP4TTHL3emdpKCO38YTvxhlbCjAhQ0liNue1zswjybeqygUnw7hFPDKj5deLjs0qILzBul5it3uqn57/hRhYsL6bjrHIxQOkEHUM2tmQpQPQ7jMoz2v2TDn339dMk94H2sy5bEG71rywaEcWysCnjt1DjvzUYOyBKHpLXdEGOnyXcmcFkjcf1sJKe6GNky9d4TawtGzbka+XUZoEyJMBOWaTjTE0xeZSdD6fewwFZXtYSbC+IXu94q1z8UjEc0b3xJR70sIH7iK8lYz0AL9ru6Z+XsiHE+STX7x30Mg4XG94KlxRe5Ot+xmkGxmW1cNq9BeZkY21LDqVwAbp96WQAQERO6nyCCV6nsue4GRJVwYmedKvZ0HOXSb7ypveeSPdXe/a/Q8hl+bhnAaIm2tfGjV7tHFxDamoqE+uSqmDcbqVV5bsZbUw1S9UYvct0+p3TKetqfPHCiDWwM2grH5vqRL/josOThAavjFvEy4LoYNoaBWMJ8V9PAzH0gTPOhwb5GT57Zomt+fdWihELmf/ethb8fVpbgPeSaH4f3bdINK5atYcJtl/+KBDKxwAEbnl0NiSLoh4LUbAZ4MSUQpivfYODYo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(376002)(346002)(396003)(136003)(2616005)(83380400001)(64756008)(4326008)(8676002)(5660300002)(66476007)(66556008)(44832011)(186003)(66574015)(66446008)(966005)(31686004)(36756003)(71200400001)(6486002)(478600001)(26005)(6506007)(41300700001)(6512007)(38070700005)(31696002)(86362001)(122000001)(316002)(8936002)(2906002)(110136005)(66946007)(54906003)(38100700002)(91956017)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWZuRTNqSFhUUWc1QmJVUFljU254dmdYTmxkbUxDYzdxMld2OVN5UG8rbWZu?=
 =?utf-8?B?T0cxMjM0Y0NlY25QUHdVaU5RSklkekZvSjhENnNHY0pIZTVMcHhJUHpiaGhp?=
 =?utf-8?B?WHA1a3N6TU5KeSs2TUgrYjFmMFJONEJ3UjJ0MzI3bDVVdUJEVGVyQkU0NXVk?=
 =?utf-8?B?UXZlem1QdlhEcjlKRm5vR1E0dzd4bTBPblFDa2VJQkh5NFdra2kwN1FTMHVp?=
 =?utf-8?B?NkFCM1JxYjZiQjBqNTFIcHRzOTMzVHZldE5NQ1I5Zk9SZFBsZlNBd3lJWFNE?=
 =?utf-8?B?cDJack5sRzBGK1dTTktUVTJzSUt2a3d5VGdORjlUSFk2c1hvLzM4Q2ZYcGdw?=
 =?utf-8?B?WWpPcHM4NmxLWjlrNGtYZW83MVF2OENGYVJRZTJyZHpKOFpQM1RlV3o1a0Js?=
 =?utf-8?B?c2hNRmhHZ1FlZUx4dTY5MUE5NllOTWwyNnNVYU1ranhNbkI2NVE5ci84Skk5?=
 =?utf-8?B?TWQ1SzdQRGpjdVlLdzJqUmNsODliZnY1aTRtSUdQTjQ3SEpSWjRBT2Y4ZDQv?=
 =?utf-8?B?TTloNWZpSjZtQ3RFSzRYTHBZWE13dkdqZ2t4Yk1xcE5UeTN1SmhVZ1hQeWxK?=
 =?utf-8?B?ZzdKSzQ5ZE5hNmcyTzNZK0hLODFMUTdZeG1USjFGRzZVclN1dVBGYnJyaTFG?=
 =?utf-8?B?ajh5UEJUUU1CSDV1eHp2eW0xU0QyRW5DOVQvb3piQW5BV3ZwaXNZZ0U2ZVpL?=
 =?utf-8?B?WXF4S09ScWN4cmMwMTBRR0orQkVRRjhsUWVkMmZhVndQaHJiMHNiRU5xdjRx?=
 =?utf-8?B?MWNTRjVkL3V3ZEhHdm1KQTg5WTV2WlhjOVV0RWlsdjRFYUdrU3BaWDBEUXdH?=
 =?utf-8?B?MXQ0T010cDFmZFVHVjUrMmJZUDRxYlphU2JwT1dtTFUybDR5THNIand2cEZV?=
 =?utf-8?B?dm9BbldKSVp5WkgzbnQ4YmdzSmljZ3g2eDJmUHJsVEUrQ3RzcGZ3RWpRSjd5?=
 =?utf-8?B?M1N6bUROeGZRelk4L05XeWl1SHVhY2pFNzI5dFc4NDFReGVJQS9FVGowS25q?=
 =?utf-8?B?VThYVmZic3ZReDlPbzdtcmVZRExBTk5LbEcxRjI0SXhXd2hVMDgxQS9yR1R1?=
 =?utf-8?B?L2JCeE52b3Z5TWFzd1c0TnBnZnRwY1JDc3JBRFAybFgyVDVEZVVoRUc0VGli?=
 =?utf-8?B?Snh4am5yZWRTNFVBTXl3V0pZVm5EVXVoWmJDbm1nQnpyaW5UeG4xYnZpeXdF?=
 =?utf-8?B?VDhuakJFaHhGNXJWeGVXZ0krSWx3RXl4ZkR1Q0F1Q1llK052QUt6N29rZjdo?=
 =?utf-8?B?KzlyOGhVeSttQ3BHdVVIZ0pNYzhidHNVSTlDTFZqZVFHZHlYN0tYeTlnZmNQ?=
 =?utf-8?B?MDJmZUxaMUd0RWUySFFqWUd2WThQS0VjU0U1ZHZyK2xmSXFYOUNFYldXOGIy?=
 =?utf-8?B?WUVocDRvQXhuL3VhUTRTNys1UHh6dzJNb05jWU1KOGQ5OFdhQTR1bFc4L3Ba?=
 =?utf-8?B?SzBSd0t3MzlFZEQrOW5NeWlqQUhjZi93L0hPUll6RnVqVTdzbmQwSjhXQXdV?=
 =?utf-8?B?U0NmUTJLUC9ZcGdzb0tidzkrUVZnM2ZuZ3ZGWVFsajU4R1plYkNEbnE3Mjkx?=
 =?utf-8?B?ZGdlN2hMN2dreGdSeFo5ajRoSEw5VVdkNDBpSUFxRVJIMWczVktUbHc3R245?=
 =?utf-8?B?NXdHcEMxQ043Y1NUT3VBa2ZIYTMycmJQbmUrb0xqZ1Z2WjVRcWJ6Slpwb0hP?=
 =?utf-8?B?S0lnQ2k1bnNTYzFVUFNzQVdIbkZ3Si91NHQwL3dCUHNQbENwMG04c2ZIKzN2?=
 =?utf-8?B?UldSK1JTaXFOM1prdGtKeGYzMHk5aHAybjZMYlBDOFpOenBPamhqRmI3ajY0?=
 =?utf-8?B?TEhpQTNpNGpFODJLRWdwK1RMR2EvbTQ5L3RDblo1U2duaHFVdSt2UXluaXBR?=
 =?utf-8?B?VTFDOUNJWHhXVkhJNHhVMzZ5MWExTUZ0aVNibXNqbTZZMGZYZmFvQ0JvWTNa?=
 =?utf-8?B?ZU0rVEw0RStma3J0ZlVJaDdtcldrOW1qam9sMzF0ODFLdjFBb1d0cFJ0Tmsy?=
 =?utf-8?B?VVZkaHpVSmxTMFZ3V2VyaHVES1JYN0dDOGY0K2YxQnphQzRoUnJ6WFNLM0VI?=
 =?utf-8?B?VEhpOEFBc3h3Mk1TSkFxTUhrdGRFdEVsZmxUdTV4a0NzeG1YVXNYQndUTHBV?=
 =?utf-8?B?bjMzdlMvTTRoMnBWb3ovVFczYmR2NHVXbUY3YXUyOVJLdjVvN2UyOG96VnBU?=
 =?utf-8?Q?J0E0bLOi0BF7sCAvIdrXotA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04C62D81357EF14882CE02B7279702E4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee3ce3e-7977-4df9-9d7c-08da874b7f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 10:12:35.2183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFZiaG1YPNaIEoegySHtC4/h82BBwOVFTZepgQZsVdGt2tJMRhZ5ovaegRi96SuaKgqZhI7I2OiLRFFCK0KvUd1G08qvKHzKjEQcYGBc4RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2974
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
Cc: "x86@kernel.org" <x86@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sv@linux.ibm.com" <sv@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA4LzIwMjIgw6AgMjA6MDgsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIFRodSwgQXVnIDI1LCAyMDIyIGF0IDA0OjAwOjUyUE0gKzA1MzAs
IE5hdmVlbiBOLiBSYW8gd3JvdGU6DQo+PiBUaGlzIGlzIGNhdXNpbmcgYSBidWlsZCBpc3N1ZSBv
biBwcGM2NGxlIHdpdGggYSBuZXcgcGF0Y2ggcmVwbGFjaW5nIHVzZQ0KPj4gb2YgdW5yZWFjaGFi
bGUoKSB3aXRoIF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpIGluIF9fV0FSTl9GTEFHUygpOg0KPj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjIwODA4MTE0OTA4LjI0MDgx
My0yLXN2QGxpbnV4LmlibS5jb20vDQo+IA0KPiBXaGF0IGlzIHRoZSBjb21waWxlciB2ZXJzaW9u
PyAgSWYgdGhpcyBpcyBhIEdDQyB2ZXJzaW9uIHRoYXQgaXMgc3RpbGwNCj4gc3VwcG9ydGVkLCBj
b3VsZCB5b3UgcGxlYXNlIG9wZW4gYSBQUj8gIDxodHRwczovL2djYy5nbnUub3JnL2J1Z3MuaHRt
bD4NCj4gDQo+PiBkdXJpbmcgUlRMIHBhc3M6IGNvbWJpbmUNCj4+IEluIGZpbGUgaW5jbHVkZWQg
ZnJvbSAvbGludXgva2VybmVsL2xvY2tpbmcvcnRtdXRleF9hcGkuYzo5Og0KPj4gL2xpbnV4L2tl
cm5lbC9sb2NraW5nL3J0bXV0ZXguYzogSW4gZnVuY3Rpb24NCj4+ICdfX3J0X211dGV4X3Nsb3ds
b2NrLmNvbnN0cHJvcCc6DQo+PiAvbGludXgva2VybmVsL2xvY2tpbmcvcnRtdXRleC5jOjE2MTI6
MTogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IGluDQo+PiBwdXJnZV9kZWFkX2VkZ2VzLCBhdCBj
ZmdydGwuYzozMzY5DQo+PiAxNjEyIHwgfQ0KPj4gICAgICAgfCBeDQo+PiAweDE0MjgxN2MgaW50
ZXJuYWxfZXJyb3IoY2hhciBjb25zdCosIC4uLikNCj4+IAk/Pz86MA0KPj4gMHg1YzhhMWIgZmFu
Y3lfYWJvcnQoY2hhciBjb25zdCosIGludCwgY2hhciBjb25zdCopDQo+PiAJPz8/OjANCj4+IDB4
NzIwMTdmIHB1cmdlX2FsbF9kZWFkX2VkZ2VzKCkNCj4+IAk/Pz86MA0KPj4gUGxlYXNlIHN1Ym1p
dCBhIGZ1bGwgYnVnIHJlcG9ydCwNCj4+IHdpdGggcHJlcHJvY2Vzc2VkIHNvdXJjZSBpZiBhcHBy
b3ByaWF0ZS4NCj4+IFBsZWFzZSBpbmNsdWRlIHRoZSBjb21wbGV0ZSBiYWNrdHJhY2Ugd2l0aCBh
bnkgYnVnIHJlcG9ydC4NCj4+IFNlZSA8ZmlsZTovLy91c3Ivc2hhcmUvZG9jL2djYy0xMS9SRUFE
TUUuQnVncz4gZm9yIGluc3RydWN0aW9ucy4NCj4gDQo+IChGb3Igc29tZSByZWFzb24geW91ciBj
b21waWxlciBkb2VzIG5vdCBzaG93IGNvbXBpbGVyIHNvdXJjZSBjb2RlIGZpbGUNCj4gbmFtZXMg
b3IgbGluZSBudW1iZXJzLikNCj4gDQo+IFNvIGl0IGlzIEdDQyAxMS4uLiAgaXMgaXQgMTEuMz8g
IElmIG5vdCwgcGxlYXNlIHRyeSB3aXRoIHRoYXQuDQo+IA0KPj4gU28sIGl0IGxvb2tzIGxpa2Ug
Z2NjIHN0aWxsIGhhcyBpc3N1ZXMgd2l0aCBjZXJ0YWluIHVzZXMgb2YgYXNtIGdvdG8uDQo+IA0K
PiBDb3VsZCBiZS4gIFBsZWFzZSBhdHRhY2ggcHJlcHJvY2Vzc2VkIGNvZGUgKG9yIHJlZHVjZWQg
Y29kZSB0aGF0IHNob3dzDQo+IHRoZSBzYW1lIHByb2JsZW0gaWYgeW91IGhhdmUgdGhhdCAvIGNh
biBtYWtlIHRoYXQpLiAgVGhhbmtzIQ0KPiANCg0KT3BlbmVkIGh0dHBzOi8vZ2NjLmdudS5vcmcv
YnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTEwNjc1MQ0KDQpDaHJpc3RvcGhl
