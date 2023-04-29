Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C36F2359
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 08:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7fdm438hz3f5G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Apr 2023 16:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ui4lXTxb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ui4lXTxb;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7fcr2FmWz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Apr 2023 16:26:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxaJHJzHadrcyrhIuZ9wHFd4ULywjMSWZnvEgcLHgBJ+z6XslldLIZ6On+uV/BsDXtb6hFSFii0RvBhmEA0Bg9nL7GVNRzBYWvdphkBn7ipoPMGILh4Ce36aI0G0yJijTEV7oPOb3BTg69YFp5fjPLG95XAposFyFY2WucRHtGT+hrgnO8Zfyerawp9jKZSsI3p9+d4M7ywtGngOpXXLv1vGYYFuXesVrM/AtFfUCpUtpNJXDeKDjQTKPBvnfXBLKgAtSYSJcEbKpYmpF087BKNx3OdnlnxTCvtGPD8gpsD8MR1u65ZXsKRpPLNFZMdHVGRZX2Y/ggB7w7pktS5M1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gkjnd367YhatqNPMoQc7smYUWA0TXsAz5nQ2RNLARfA=;
 b=nudXBwnMWqutz6n28GepvDV+FqR7k2lmvPx1kCYqwMeRnrDpx4KDTnmMDv6W8gC8XBVQl0G3UcNNTKEkl7oKFU0PI5qWajM5WU6K/BJH7KPhaONgdlkfq38JSfTmdV83mCpJPKr4UXIhC4gXfEvtaReig3t+QdeoPF8oDzNS/yuh4zh9vbZy+WcMQGZAzI6dBdLzy11yuvKkqRTTOpPEeAIki2J9nkKMOiB9zz02PRxlEHt+FG7fMWM4K6lBR0xtMPwgYTSVGIwg6ougyvDXE/yIVY5euQf20qMeoAqzVIAY8R6C3YgrYTu00X+3psjo/naQF2nrs7781CZ93sswLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gkjnd367YhatqNPMoQc7smYUWA0TXsAz5nQ2RNLARfA=;
 b=ui4lXTxbr+kQUBOrUf7J1raVwHzH0SvYlYBmLf0P4vRyJKydkUiu3o/Clk2Xlh1+JgG98TZkxsPFa9uE+KUyGIMtCNLgDrDrf02Zj1LSOU60FwsoTk6WA6RBH0/Bt4tZ40JtaVIPGnfuV1srUyN2pAHRE67Miu1I1p/zJ6ZBiIWUpll8SgHrc6OuDMxEwVxCiizjAatRN+cQgU1Jbx0S2GpRRmmatdWwh3Mg36UrTNiU9NN4L9TC6FYhFAsMdifJepT99BkFg1/0RgexFIrWqNduAvJt9XHzngCEKx89YoUtZGL8zGOq6b8CWSTkZveYcjVi21igJOx2Lt6rtG4N1A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2063.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.26; Sat, 29 Apr
 2023 06:25:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6340.025; Sat, 29 Apr 2023
 06:25:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Tom Rix <trix@redhat.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: remove unneeded if-checks
Thread-Topic: [PATCH] powerpc: remove unneeded if-checks
Thread-Index: AQHZeh6RKQ7wZixmRUGehV6V/r1g869B0qqA
Date: Sat, 29 Apr 2023 06:25:56 +0000
Message-ID: <880e9f47-352d-3028-f640-477a75a3888e@csgroup.eu>
References: <20230428221240.2679194-1-trix@redhat.com>
In-Reply-To: <20230428221240.2679194-1-trix@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2063:EE_
x-ms-office365-filtering-correlation-id: efa8398f-3f63-4042-5e9e-08db487a9750
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  e8G9vtj4xqz3yvb2I820TMcebH5okAFcOGyNThGULjuDemdxmPVDaD3u4JMDjpz6MN5c29K+NlkYXBHIzG6AH4OeaV+3ownMbb1dAVjL1D3sLXlegKX84j9buPUv5VMCQJQNOL/XkpdqvBOhH+LzsqvJMfzy3804v/+MYu7hEMqMmmpaUak9WmFY3F7WGtKdz+bPkh2I+j6X1D0bZ6I0D15h2iqElVFFfIXldF/AroDvydE6Ehvu28FX4GSw4XH0Nt4ol3baXEz3cspLvu7xNs75914roiyfi1OqXvvbOR95fetcDT4aLcKBZKi4fi/xSXS3wswozI+mo3STnje3M5hUTaTIazTlbMtKPH06HCnPXDJn65mrkQdj98S/kh+1gcj+A5Wz2s8XM9rk/SCwitpOWRmoVDDBDdc9vtPD3p+8v1yCrJj8AxQo05pHpzQPmpXqnUQ3U6yopAaUz5FK9GFUkn+5CZt8DqXE7gAn6shtygnf5Al5vXWHcxZBQ5VgQK6moRes8ahF2y0kPlSt6eWvQ+s0CiV5LeLwqVkYtsEYEq5HWme2frUANsLDpRXy47VS+TdDIXTaMZerdZzhURTXHVBtjVfmXrqwclMMJncXfT6++MEBcyHnCYbGugRiODzxhI9hP0YiZNxBhepQHzVjLMZZz6YiSyHKlSmn5zRwfYPax3ml0a0JYlVUXED0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(451199021)(31686004)(316002)(2616005)(6512007)(6506007)(4326008)(8936002)(44832011)(8676002)(38070700005)(31696002)(86362001)(5660300002)(66946007)(26005)(478600001)(76116006)(110136005)(54906003)(91956017)(186003)(83380400001)(66574015)(41300700001)(2906002)(38100700002)(36756003)(122000001)(66446008)(66476007)(66556008)(6486002)(71200400001)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZTdRRGFyQ0F2N29JZnVBWHQrRjVpbHpFRGJRbzdUNHZiWG55cWFGQ1dXWXN4?=
 =?utf-8?B?T2VsY2lwc3IvSER0aDlNb1hYTWZ1SGF6TjBmRHhDb0NNQXZYOTFPM1lEUytm?=
 =?utf-8?B?U3N2RW1sWFBKRWRsNmZJRS94Q0JuSG9rWlFXcTlhWUVOM0pnKy8zQnArcWxH?=
 =?utf-8?B?ZkhQc0FOYncrR3FrNldVcFFwYy96V3VEbVR1YmhKNjNzbDhYUTVBVlkybkxD?=
 =?utf-8?B?Ujh5M3pIMUhZd2VRaGRxVXpWZXl2Zit5em95MzVlN3pDQUdzTXRuQm1PSS8v?=
 =?utf-8?B?OWZSQi9EOW1qQ0lYSlp3TUdnS01HK0lVUERGeUgxOW5GQjhOdHJmV0p3S2ZV?=
 =?utf-8?B?ZDEvM2M5SVE4S3c1Nmh4aElrb1hxeTE4bms1U2huQzFuQ2pSQW8xTG5relZ6?=
 =?utf-8?B?VHlVZHRoWThjS25hSVVicGVTY2VQMk5NZXRHTDV3c3dvaTd6b0o0MXdHU1p6?=
 =?utf-8?B?VE90VDBhYXJrSVNUUHlTUWwyWWpnN0Z1ZUsyYzg5SGcxOTFSSU1OdFJ2SjI4?=
 =?utf-8?B?ZjJQdkVSaDZRVzZQcFFEd0EzT01sblY0ajk4ZFlCQmw1aTB3WDBvN3R5NXFT?=
 =?utf-8?B?cERIWEpPOVVKNVpKY21iVkJZQWIzbS92VEJFUE1tNWVXOENFM1QxOEVhMVFy?=
 =?utf-8?B?NE9VYmlaMStMUHc3RnlVVjNKWlhETE1NMU0wblYybkNxOUVxenVJK05aL1Bw?=
 =?utf-8?B?UGRxZldBTG9HZXA4QWtOR1JzamVoV3ZXVCtmOHJiY0R2SGFxYk5LeEs0YWo5?=
 =?utf-8?B?b0hWcHV5K3A4WDg4a2d2ZWdjaEV0K0RDRjV0bVcwL2F4TkoyWFJxSmdwbVVM?=
 =?utf-8?B?UFBvdERwV3lqZlJUZWpMWDQ5N2xXTWpIRXRheHBnTDcwZE90MTVnUmVib1Ay?=
 =?utf-8?B?Tno5WTlLSXZ6Z0tpd0dsaUxVNWE3SFBBRmsyVWVmQlRlbHVBNnc3Yy95N0pQ?=
 =?utf-8?B?SWFWaXpDK3dQb3VNVitjQllXQUxBSWs3Ukx1NjRvbHZqZkNaeVhBSGRpN2JY?=
 =?utf-8?B?Tm9samFUcFRYRHZVOHNMY3RxQnd0WGw0KzNqYUkzdUx4TlBEN05xejV6YXg2?=
 =?utf-8?B?UTZncktZbUlIWmNLcVpoUzlYS2VTS294YjNQMnpick5TNngvamZaM2hkUTJV?=
 =?utf-8?B?UUpBZ0V1Y3JFZUlqaml6bDBPZHNmdG96M0NHVTd0OEN5L3ZrZGt2MUc5bGhE?=
 =?utf-8?B?cmxPOW5La2hXZnlOTy9za0pJV2VtelpncUxMYkI4eVBoOHdQaGF5bmhIZXM0?=
 =?utf-8?B?SDhqd09wVnVGMlRrQzRqekJuWFFZSFEraWZ2YWNmcGZNMFlhUmxEOGZqL3Bh?=
 =?utf-8?B?YnUvV2JwdWNVWTM4L3BjZy83L3gyVFVOajBjYVQvaFlTaFg2NzNEcDBRcXZw?=
 =?utf-8?B?NnN6NVlrUTIrQjJ4WjcrSUFLU21mWEZ3MkJ4M0pjOGtvZC9tR2NIQ042QjNK?=
 =?utf-8?B?QThxWW9TK3orRmxSbnQzY2gyTXVUK1J3YXNoS0pzYmxhbjJzMW9NOElpQWtp?=
 =?utf-8?B?djlUY09KU05HeUo4enhjQzErbC83MWxJbTkyR1lHL0dQOW11bk9XSGlFdWdX?=
 =?utf-8?B?VnhrZUNqR0lxVEVHRFQvOXYvSkQwUUQ4VnI1ZnVkUEcvdll6ZVN5NDV0b1pj?=
 =?utf-8?B?V3BoYXhIbEJ2cnk3ck52TmVpSEh0M3EzL0s2ZUR3Zk0yNjd5RitHekVFMFEz?=
 =?utf-8?B?TXlQa3EzUEg5VGFBOGY3VnZjSVQvaWRpenY4M1ovUHIzVEVCczNaNWh3aSt4?=
 =?utf-8?B?bHlGOWdQWG1DY2Y0d2ZaWVRJTkQvTGYxeE5NYXpHVmNNRlpURGYxNUpZaVVr?=
 =?utf-8?B?RDlQNE9RRmFjd0NnbjY2dTE5OHVhT2t0QmFvRFJzSU5JeWcyWjB5amNPdEdN?=
 =?utf-8?B?TkQ5LzdCdWdFekl0eGZEaFhScTlXMUErejI3R0lncjhUOWdUSHpTaTdWZmxy?=
 =?utf-8?B?SmVIeGhNQWR1dG1NNTVGRXNEaXc2T29aRzJnNTlIWGxGbFdJV1NSUHltR0NI?=
 =?utf-8?B?TjRwOFJVeVREYjBQUTZFU01XcnUvUCs1OGVRZXpoY3dXMW5hY0xCN1lKU3pB?=
 =?utf-8?B?RkVFZVRuT2tNRVlhY3J3eVVxYVlEV2dCMGxTS1QvaW9ycXRVTllyYktiYWZy?=
 =?utf-8?B?Zm9wcGZJaEhjNnpqak5HT1RqQ2RGZSsyV01iWHZiTEtac3k1dy9UaU5uNFdQ?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <671B04944040E34F9C7C8C7523DCE3A0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efa8398f-3f63-4042-5e9e-08db487a9750
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2023 06:25:56.4643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1U4lG+mEYjYH9TgkgOJ05MluO4o4neiidZkIS8dKhzEIYkY+6vCHHPjEUZ1yXmATmR68FTMAr7ggyy1eNQZshkVv/LJGTYCDTpAdGr6hg0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2063
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA0LzIwMjMgw6AgMDA6MTIsIFRvbSBSaXggYSDDqWNyaXTCoDoNCj4gRm9yIHBw
YzY0LCBnY2Mgd2l0aCBXPTEgcmVwb3J0cw0KPiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwv
c3B1X2Jhc2UuYzozMzA6MTc6IGVycm9yOg0KPiAgICBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1w
dHkgYm9keSBpbiBhbiAnaWYnIHN0YXRlbWVudCBbLVdlcnJvcj1lbXB0eS1ib2R5XQ0KPiAgICAz
MzAgfCAgICAgICAgICAgICAgICAgOw0KPiAgICAgICAgfCAgICAgICAgICAgICAgICAgXg0KPiBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1X2Jhc2UuYzozMzM6MTc6IGVycm9yOg0KPiAg
ICBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1wdHkgYm9keSBpbiBhbiAnaWYnIHN0YXRlbWVudCBb
LVdlcnJvcj1lbXB0eS1ib2R5XQ0KPiAgICAzMzMgfCAgICAgICAgICAgICAgICAgOw0KPiAgICAg
ICAgfCAgICAgICAgICAgICAgICAgXg0KPiANCj4gVGhlc2UgaWYtY2hlY2tzIGRvIG5vdCBkbyBh
bnl0aGluZyBzbyByZW1vdmUgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBSaXggPHRy
aXhAcmVkaGF0LmNvbT4NCg0KRml4ZXM6IDY3MjA3Yjk2NjRhOCAoIltQQVRDSF0gc3B1ZnM6IFRo
ZSBTUFUgZmlsZSBzeXN0ZW0sIGJhc2UiKQ0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvY2VsbC9zcHVfYmFzZS5jIHwgNiAtLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL2NlbGwvc3B1X2Jhc2UuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9zcHVfYmFz
ZS5jDQo+IGluZGV4IDdiZDBiNTYzZTE2My4uZGVhNmYwZjI1ODk3IDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1X2Jhc2UuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL2NlbGwvc3B1X2Jhc2UuYw0KPiBAQCAtMzI2LDEyICszMjYsNiBAQCBzcHVf
aXJxX2NsYXNzXzEoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4gICAJaWYgKHN0YXQgJiBDTEFTUzFf
U1RPUkFHRV9GQVVMVF9JTlRSKQ0KPiAgIAkJX19zcHVfdHJhcF9kYXRhX21hcChzcHUsIGRhciwg
ZHNpc3IpOw0KPiAgIA0KPiAtCWlmIChzdGF0ICYgQ0xBU1MxX0xTX0NPTVBBUkVfU1VTUEVORF9P
Tl9HRVRfSU5UUikNCj4gLQkJOw0KPiAtDQo+IC0JaWYgKHN0YXQgJiBDTEFTUzFfTFNfQ09NUEFS
RV9TVVNQRU5EX09OX1BVVF9JTlRSKQ0KPiAtCQk7DQo+IC0NCj4gICAJc3B1LT5jbGFzc18xX2Rz
aXNyID0gMDsNCj4gICAJc3B1LT5jbGFzc18xX2RhciA9IDA7DQo+ICAgDQo=
