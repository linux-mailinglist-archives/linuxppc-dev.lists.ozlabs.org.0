Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F76550905
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 08:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQjxQ285vz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 16:46:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ajepMlT0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ajepMlT0;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQjwd15psz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 16:46:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntoe0Pb6M8fgG2/WaPtylKC6Sv8wxnQEwHwGPg9sGuHGYIz1Om/2vGtBagDVt4HRK4z+IiiNoRSmt8gjYlNfI7oeljXafZY6I579eThzJot7/47XlNp5Gr0LHQn/zHE5YRA/vJVYMU1krQ4LuxSo/LUUm7UhNZjTwg5/d59F+5JPhxQjHAigc5g+7nRPGBDE9AgCbugoFRnRDqh08hGuwv/2ZuAckmVMVGFIYDpNN0xkiDFXyUYzchHodhSS31dlOd6T2KInpdIGz3pGnMSrdPk+eAbhqpDLGTgKLO3roP7irLsqolg+9NGmcXxid5fa7ncaAdaDBC2dZwHD4a6N2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgmZxYMvkpGAYOAFiLDGn4V8sh+QcR/jhdFhdE4HnqQ=;
 b=iiSRS5KRYH0SF0RhlerxH84a1LY7Xh+ivV1WarWNNynfsZDtrfKc0FvkhsrjS5BBAnXC+TpXya/NmN6m7dpoOaGin2n5+cEl+qIKyOSnSSGnXEL/QgJzhqIZH7Q+DYfQ1F6c1lE9ZIsbv/SrD2Lf0sXtu7zTt/MPEFqSZepoI2TEFxO1OYNXfLSQDPf9BFOlJ/3j0DIyxWaUGUKZv3lLZHP14Kd0yVH8hmxtb9/YaRQxurvbKS+MuKdKTZmhVo1GEvswWOUwXAM9ulZqUCAeQgT1vPEfuUeEgm1eOtrOxA8orCYG2UyTvdZxP21c2jBMD8kPhLxX5gT9RtqbbSMk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgmZxYMvkpGAYOAFiLDGn4V8sh+QcR/jhdFhdE4HnqQ=;
 b=ajepMlT0sesowkREckk1EMQ4apD7V1oiWzUmCHIrxTJtbIKXFeeuZeMWiEN5rHAE8yt/jRmI8NUvkd/jbFGzfF1Y+pV/R4WHYrVTY//xhvMf61mlWCweut5fpWT2m0Y0aACgyv4Ddc+sEO6BpQHHhpLLXYSB0V2fwXvXI61RpTjxToitX4RAJeot/I959PNj30i1I3Zu+rdMT/O5INT5450VcEPn+pv3wqm6JxBtiWuuqNsx83zX8j0h8qehAwPrShjAVgKkA2gEXCpMd2Ur2X2CuynK1XC9Y8T9K0pNUEqEzlI/QvURb0Utnuc1IqqFO9GPCk+Y/W8LscsVI0PfSg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1622.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Sun, 19 Jun 2022 06:45:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.020; Sun, 19 Jun 2022
 06:45:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Guenter Roeck <linux@roeck-us.net>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/prom_init: Add memset as valid external symbol if
 CONFIG_KASAN=y
Thread-Topic: [PATCH] powerpc/prom_init: Add memset as valid external symbol
 if CONFIG_KASAN=y
Thread-Index: AQHYg5AjYpavzJqm60aq8xWIBiiY661WSUmA
Date: Sun, 19 Jun 2022 06:45:48 +0000
Message-ID: <9b2952c9-d6d7-b4c2-f5d6-cec8722decc8@csgroup.eu>
References: <20220619035246.2633538-1-linux@roeck-us.net>
In-Reply-To: <20220619035246.2633538-1-linux@roeck-us.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5a462d6-3c36-4aac-ce7a-08da51bf581d
x-ms-traffictypediagnostic: MRZP264MB1622:EE_
x-microsoft-antispam-prvs:  <MRZP264MB162260017341E4F7C1A5CA27EDB19@MRZP264MB1622.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PpZRMQwS5ir3qrIKkJULVqN8fWgo9eBGH1YmT98lpimgqXCIVoK1udQjkpj8+3x/0/bKcNEs4TSTMaUNhIqtzIkXMgeICwx4mTMr7MhmG0iVUDMGntZsurwGgoSrXpNFBb0SxfAyyCiXxFnYeIvEJwP+iRBP3Ir2kle2GgIMVSbWfurs5MY+woa8yX4McMxSg5tHKyNuT85fVouB0ADWzj0H1PBzsUWKIEAGvALf8VhCgS1+SJ14daeMAOIpm5RQVOY/OIQ7i1knw3DR8YswaZGK+SyyJnSzxo/yCcWP/b+JTusfnowlInmP3ORD7122eRF+u9zP6q+soOtAYIN8FmSW4YvH+KmflloWq4Fb9VqtTOaw5VQup1dz4XwehRxevp1767n7ScAoub7FY5vBlekJILY5FtHnpYjzhxJpKjtCfoCCuAXD/hLfNd1C+qntdRCNgxFCfa3VH6/42XLEViihrye3Yp7QUrBx6ow+eJ83U2mqFcCOzDSw93KWAC7ER9/bhocAoa6xQLmc0SlAakQ2roZjTSxOB1RNbkB/fXkAQYbYyqV7rCeEaHhvaIYNyMlVkVvUIUyrBbV4ibofFnUf5YxS1jtdN0LVagI5HmiZwNgJ1zet/mMy4HUH74sjnzRIJt8snZB0vSmyGT1LubTwR35WHMivgeio8YcU4GQ5Rd3q2xG0BlzZQLyRYpPvhZk4VfFTiCBL58Hy1cTWyZ8dx6k8Q/J2gocY4M3flcom2zFLPwnTiqB9MhhpqstbYc/BF1rK04dN0rfO+RoBmOZcgQZtV9oRZ/2XKRw/+mgKvNmFkwUS5gziAAOEACVatCPjn3pVjZ4SYq0R4PR60CZtSjcjAMLXz56XgR2cbS0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(71200400001)(110136005)(8936002)(6506007)(54906003)(498600001)(122000001)(83380400001)(6512007)(86362001)(2906002)(66556008)(66446008)(8676002)(66574015)(38100700002)(6486002)(966005)(66476007)(91956017)(36756003)(76116006)(4326008)(316002)(66946007)(2616005)(186003)(5660300002)(38070700005)(31686004)(31696002)(44832011)(26005)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NERJU2NZRDBTRkJXcnRLOWtBRzBnK00wSWFkWUdWeldIZkNuekM5Z3F5d3Nl?=
 =?utf-8?B?SFhuYlAwSmFDbHljVmdLOWNSZkxQa1RhSDc0b3hrWFR5RWdTR3NOWHYyeEFu?=
 =?utf-8?B?czNKK2ozbUxtWjZzV3VqK3Y2WTRwUHg4ZE5BMmwxOC9zQ1JLaTRmU0QydCs5?=
 =?utf-8?B?RkVsdEcrSWZ2UHRjYllVLzFYSHlYcVF4akJqZllKaTIrZklUOXdGakxDcnhj?=
 =?utf-8?B?dU9hcHU4SEtkMDgrZytzeWpiQ3BWYmphbHhJbXUvM29seENVbmpGVi9zNk5M?=
 =?utf-8?B?bThlTVBLVytxelpOUEVrRFNhbGg5Sm5GZmFQcTJ2NEhzOGZsZnlTUHJDZVRj?=
 =?utf-8?B?TFBVaDBoUGEyclh0VGQvWlArNHhjUE1rbTlsUHBYa3dEaWJJcVRRc3BEU0xp?=
 =?utf-8?B?N3h0TlhmMmtWeExpUVBUWklsOHZLQWdXdXhGUFlZRUMvckFINCt3dkhQZkFW?=
 =?utf-8?B?UWFvbllRUjQ4bkVxVTE3K01jRVpIMWU2S0pnbHdtVjU2U2l6MklvVkZmZmFP?=
 =?utf-8?B?VUh3TGVKVFhuTFMxMDZIeCtPemw1ZCttK21jaVFZck5ZSEZVR3B5RGpoeVVR?=
 =?utf-8?B?cFYvcllNYXNCbnlzVFpEckVOYU9hZElKVmhvcW5XcmVXUTRVeU8vUzcxaGhU?=
 =?utf-8?B?SFVJQlpid2RzQUFWZFQxYmxlUHZrU0lySEIyVkJ5V0d5bmk0K0xtNDdqSDlJ?=
 =?utf-8?B?ejh6M0ovcEJlVGY0cm16clRSNnF1UXgxaGpMWmJqVE1EeWRtUnROcXI1aUI0?=
 =?utf-8?B?SkdkSmk1b3dDNExoem41OHM5aDhZQldOYVJYdmtiaGdERG5mRkgreDR6eE9x?=
 =?utf-8?B?TG4wZkpVYXVzN0NDcXZjT1pDa0F0QmRFMkNUYk8vL01JdnVzTkVvYkRZSFBr?=
 =?utf-8?B?azFyemdzdU1wTk9ZTE9FS1RDdTdNQlB4OVNQS2F2NU9mR2lUakYxa0hIcHV3?=
 =?utf-8?B?cEpjNzVEclQwelRlNjA4Z1ptNEw3Y3p4MFppb1JEVVBVSWgwUlM2cGxaUG52?=
 =?utf-8?B?Wm5meGUyWHloU04rUHJMZ2VIN1B2REluOTJ3WlB5RjhtOWtKVXdzamdRYmt6?=
 =?utf-8?B?bjRtd2FWWFdEMXhzMU53V2hDVjNlQlIxNHArVTIzVHJscEpOSDVOaUpCTGlI?=
 =?utf-8?B?dnlnejRBdkVyRzRJeGJxamhVZmFSN3Q5UGF2dTl3MXVVOCtPMktvY3JSUjUw?=
 =?utf-8?B?STN3WDhQbllsVStndzZpUmlKck9VRUlzK1E4RjdPWkRpVzc5S2NOLzU0TW5r?=
 =?utf-8?B?dXpjaTFOU3RQZHZNSUJGTVRCZHUrSk5rTjN3ckh2Q0NHME8yYTlNaUtncFlP?=
 =?utf-8?B?Lzlsa1R5NVhGZlZ1SEdLb3FQUk55UXloRFRGV3JSZUY4QmFaKzJvTlBYZ0JF?=
 =?utf-8?B?cDBXc210cUNlS29rQndyVkdEbUUxcnloZkQ1aHNOUEdIVkg3YWZncEQ1TnVK?=
 =?utf-8?B?UmpDaFJ3K2RoVWVnWStkS2xQdVdzWUFQclVaQlB4cTVOcUtXaHY5c1RYK0tJ?=
 =?utf-8?B?TWp1ekV3akc4SW0zRWFuVnBKZjJiY1N4YUkrcFZiNHRFRi8vYzhRQmNtUlg5?=
 =?utf-8?B?NE5pVGFFNlNFZVg0RW1MbU1VUmRQOUlIbXZPUGphQzlET3VteTZlNVBhUGRo?=
 =?utf-8?B?c3JaSjd5eHkwMkswTVJUSkJoRVZLdFZQR0xyRERpVGhpeGd3K0FidHQ4LzIr?=
 =?utf-8?B?MUlyTHh0SjM3ZFZtUldGMW11TXNWZ3hhTEhLeVU3cnBzdkFPYzJqTGMxSjdG?=
 =?utf-8?B?VDNkcExKTnpaSWRoNXhISmJlN2pTMUF1TXN1OGVYUEE2ZzJ6NStLdXdMTGUy?=
 =?utf-8?B?TmFOMFZsdmRqUDlCOFgvWGpWeWgxdzJHRlhPNWN1bGMxbVhOdENpOVRQUUNz?=
 =?utf-8?B?c2JjT0RHMlFyczhkSUVrbFI5VXZNQXV4d202ejU0WFFwem9HdzE2ZkRHWm80?=
 =?utf-8?B?MDRtZTVRTHRFNWF1bUc3RlQxdkVENVd2SEZBV3k0VE1HNXpGNGF3VjUyc1RX?=
 =?utf-8?B?MWtZZ0NMUU9aa3FvQ1F1eXhBMFVJLzZycGY3dFpTekMwQjZ4dlBwbE9JOE1K?=
 =?utf-8?B?d3dYU21vclN1S09mNnViU1JBTm5JbVFxRzg2U0VuUTl5TFA5WUVIeGtWSzIz?=
 =?utf-8?B?UjltQmRmTDJ5bjJ3UFZ5Ynh6SEdvbEUrMFB6QUJ1YXgzYWRTM210OXU0aDcy?=
 =?utf-8?B?MjNvY1BqV3lHVGJ3VzZrVTRvNEd0N0E5aDQxYklFVk1BNlhJbmYxNHFtcDR5?=
 =?utf-8?B?UEpYUGZ2RkZ5azdKYWxnVWhPNExNVmdQVEYrM0Jkd0djMmVHa0grak9wOEZt?=
 =?utf-8?B?V1MrZ2JGa0owQXkrZTV0QXplU1BWcjFIWFJGR2JQd1ZiWUFIZjVSa3pqakhh?=
 =?utf-8?Q?1qI7x+XGocdpBVhBWBullFyn5rRYhG8pq2e8E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E79F43C4FE02449BCCD97F742B9D85@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a462d6-3c36-4aac-ce7a-08da51bf581d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2022 06:45:48.4985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nGCQv3PVdI4vFYYgREaoWSolCgZfqyzrmvzMuLSbTzvSbGhpghT4PRCkEKEJBX+5qlTnBGac4QqtdAqjD2pF8UOBrE0Mk2Z46rvrp9xQM7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1622
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, ul Mackerras <paulus@samba.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjIgw6AgMDU6NTIsIEd1ZW50ZXIgUm9lY2sgYSDDqWNyaXTCoDoNCj4g
SWYgQ09ORklHX0tBU0FOPXksIHBvd2VycGM6YWxsbW9kY29uZmlnIGZhaWxzIHRvIGJ1aWxkIHdp
dGggdGhlIGZvbGxvd2luZw0KPiBlcnJvci4NCj4gDQo+IEVycm9yOiBFeHRlcm5hbCBzeW1ib2wg
J21lbXNldCcgcmVmZXJlbmNlZCBmcm9tIHByb21faW5pdC5jDQo+IA0KPiBUaGUgcHJvYmxlbSB3
YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCA0MWI3YTM0N2JmMTQgKCJwb3dlcnBjOiBCb29rM1MN
Cj4gNjQtYml0IG91dGxpbmUtb25seSBLQVNBTiBzdXBwb3J0IikuIFNvIGZhciwgd2l0aCBDT05G
SUdfS0FTQU49eSwgb25seQ0KPiBfX21lbXNldCB3YXMgYWNjZXB0ZWQgYXMgdmFsaWQgZXh0ZXJu
YWwgc3ltYm9sIGluIHByb21faW5pdF9jaGVjay5zaC4NCj4gQWRkIG1lbXNldCBhcyB3ZWxsIHRv
IGZpeCB0aGUgcHJvYmxlbS4NCg0KTm8gd2F5LiBJdCBpcyB3YXkgdG9vIGVhcmx5IHRvIHVzZSB0
aGUgaW5zdHJ1bWVudGVkIHZlcnNpb24gb2YgbWVtc2V0KCkuDQoNCkRpZCB5b3UgdHJ5IHdpdGgg
dGhlIHBhdGNoIEkgc2VudCA/DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9saW51eHBwYy1kZXYvcGF0Y2gvMzgwMjgxMWY3Y2Y5NGY3MzBiZTQ0Njg4NTM5YzAxYmJhM2Ez
YjVjMC4xNjU0ODc1ODA4LmdpdC5jaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUvDQoNClRoYW5r
cw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBGaXhlczogNDFiN2EzNDdiZjE0ICgicG93ZXJwYzogQm9v
azNTIDY0LWJpdCBvdXRsaW5lLW9ubHkgS0FTQU4gc3VwcG9ydCIpDQo+IENjOiBNaWNoYWVsIEVs
bGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IENjOiBEYW5pZWwgQXh0ZW5zIDxkamFAYXh0
ZW5zLm5ldD4NCj4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMu
bmV0Pg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdF9jaGVjay5zaCB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdF9jaGVjay5z
aCBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0X2NoZWNrLnNoDQo+IGluZGV4IGIxODNh
YjljNTEwNy4uNzg3MTQyYjVkZDI2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb21faW5pdF9jaGVjay5zaA0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5p
dF9jaGVjay5zaA0KPiBAQCAtMTYsNyArMTYsNyBAQA0KPiAgIGdyZXAgIl5DT05GSUdfS0FTQU49
eSQiIC5jb25maWcgPi9kZXYvbnVsbA0KPiAgIGlmIFsgJD8gLWVxIDAgXQ0KPiAgIHRoZW4NCj4g
LQlNRU1fRlVOQ1M9Il9fbWVtY3B5IF9fbWVtc2V0Ig0KPiArCU1FTV9GVU5DUz0iX19tZW1jcHkg
X19tZW1zZXQgbWVtc2V0Ig0KPiAgIGVsc2UNCj4gICAJTUVNX0ZVTkNTPSJtZW1jcHkgbWVtc2V0
Ig0KPiAgIGZp
