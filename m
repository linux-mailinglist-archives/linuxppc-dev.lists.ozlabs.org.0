Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F35C04BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 18:53:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXkxl1mGmz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 02:53:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=H3C2OKtZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.77; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=H3C2OKtZ;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120077.outbound.protection.outlook.com [40.107.12.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXkwg5FZJz3c3Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 02:52:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsy0IR2xJLLmMyt12HheGeE2XeNj41EfTXR98LrAM3KCFvciOuTrrEYCmyx49eGt/AI8E6U9fylhjlcRaIPeAPDZ0jEy4tpnCNN8FCXHlT8hTGmLBApT29FdpVRrPLBlQE3nURexg8E3fIEieNvazHv7JM8f7Bd01/HeIfkfN3OBkaCZQH/nnmu8VNbznOnukg0UL//XAw/qAyCjZDeWBgMHyA8mdJ5kp1Jgs6gQLfkuntI6xkuP1HSv1GaKh3Yq+ctN5iLc3uCO6jVwkT1PTsReQxRJSAJp4xf5qIDs2LsENzVhnj0Y6teV51VjN9SW8vJOTAvcC1GC7bqkr3YssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZ868kxT6RCG52X1eVvO/fuqRUZD2d+olsAfzLQhnwU=;
 b=bNBaGPB5K6XXHDP1N1CIDXHGIoMSjb151Rz6DRt4KRL0ef43epPP0pm8ApObBloiYijiVp5bLEOS+kUP3VWv94rKuWhoyDHIc/09uVv8vqOVTCxnb7eGQrjPslMyJNIMEXrim+IqiACNgwdS9BXggPyhTelheVICmOUP0sZnIEifJxnCKQKH1pqELb3K3NHF7atGYUf9KBwFgGIsjgM2JrqmxaIS8tygQUgCiOPwnEOFlZc3qckRpd6HokJJY5U1nf4yIwI0x/9DQYvP4epIvQHYWX/SP4sLzCnuG0xwO0HdFmfaWnpKiPsqU+uH7h00tOSgplsmpwMsIh+9tv2p/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ868kxT6RCG52X1eVvO/fuqRUZD2d+olsAfzLQhnwU=;
 b=H3C2OKtZWep4mVWFqCl1RbLmze2uVS9+y5Y6NP/CuT0h+oe6abj/x3cKqtNzacWS5X0LE75LeuxGftHXwabi9IOiJhqw9RhTYfG5t0Tp81GqJ5moSxPmyiI0pAvbfMQVMPykB8stKvBokPSchWGhNR70gOoc3ykD85OwUpY78HI29pq5UPMcSUCwQI3wTb343uarDZj3/inO/SfnGoqavxBOViKxyc8tfzqlbUv84SkalNRKjPaS8jyrW7JcUHAUeD2BvaoOYofaAozACQGbOuAMrQHTnE/FOD0oXeEq1dZfbnml848lVopOXgIeaA/BIUuOBi9O2PCGqb0oJFY4dQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3325.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Wed, 21 Sep
 2022 16:52:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.024; Wed, 21 Sep 2022
 16:52:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 3/7] powerpc/64: provide a helper macro to load r2
 with the kernel TOC
Thread-Topic: [RFC PATCH 3/7] powerpc/64: provide a helper macro to load r2
 with the kernel TOC
Thread-Index: AQHYzDC333jmN43R3EOMyKykF5AuIq3qHI6A
Date: Wed, 21 Sep 2022 16:52:02 +0000
Message-ID: <1e68b172-fbc5-835d-f91e-0f256acfe4c7@csgroup.eu>
References: <20220919140149.4018927-1-npiggin@gmail.com>
 <20220919140149.4018927-4-npiggin@gmail.com>
In-Reply-To: <20220919140149.4018927-4-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3325:EE_
x-ms-office365-filtering-correlation-id: 16ac4602-3fc9-4d20-3a36-08da9bf19b66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6D41p9M5kB7TAmXX1bBTVocNawm4iWjE8emyCR64qhobDzAYjTuZ1wUWQ6OokZLpcl3UtVe2F+mqShsoBoYt2Im10niiUbQdzlp+4cPsofEhA2rMv6fxJ0eYnoBmPfBH0ZfAyELyEqLJfYogJjfhneQLAzFjMvRRHa9oC5tDf20CibjzeV92F9oo1RoUGSuVhxvVIsxowa0lXPbH6IIDTtQ/KeD+MMYvE35Xr6WDQdWLFV1s7f+EKnnnIFOJjCqKTIGSp7DuvdRO9IxFCBhttjWSH+A8OiSiR3uQoILLahAAWP3QbueSPZ+SNgJcMSvJkW1pHPA8eDG1Txco7YhZifnfAPdWd/pHg1mrKBxWk4V7s3/cjlyKkd/BZxyEknwyYqzpCln5EKX7MmuCufYuShseuCnYTd3ji8h9fAlwpAS4g0OjK1k07GJYYkTdsumo0UgMym9F4ZxZfvidg7vNBCxC5eFnz8VqJrcJRRls3xG3xZl8eknGXuodPo3WjNQNetmFiKKu8bQGLiYYyzUBYv36RwnNq4HsH/YWuA9y2hcRMLHLPZsxjdCSIbg3re1TwnUFh9DLMk12NO8f14/PysymC0q9V25sy/dsMMTYoeq+8ig7Pzf50PYJ81lLik1LkWi1WQx6UJYS1ozxmc4pn92qNlm3nV/IcMve62IdiGIYWjHPSp/FH6gH6O+8MjQmz8Xm3u+V6WPuoVeSL1tViomiQdvO2Z+kzhCvgWVUXx0zcvpB88lNUG/7Q5AYRMY1Ew/BECSrbX0khS84VMtAD05qG270iztbFNyumr63AfFU7/RHu2FbxsUwJ+iYYrageop/pZQQYLQgUBhQKTxwtbdSlA2WQoYsaUV3KFd0ra4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39830400003)(451199015)(71200400001)(122000001)(38100700002)(38070700005)(31686004)(478600001)(6486002)(6506007)(91956017)(66556008)(66446008)(64756008)(41300700001)(66476007)(66946007)(36756003)(76116006)(6512007)(5660300002)(8936002)(4326008)(8676002)(26005)(83380400001)(2906002)(316002)(110136005)(186003)(86362001)(2616005)(31696002)(44832011)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MFhPZnJGclV1Tk9rZUlzZTlRZ0kvV3U3ajNNNXdyNndYMnlwdEMvcTc2Q0VS?=
 =?utf-8?B?K1NYTUNFR3JxblNPMlU0Mjl6S3h1ekdHZGNTbFVrVmdMclpRajk3Q09Jb0NX?=
 =?utf-8?B?Y2xDaTJSZFdLeDMzVWxlSVJUbW9oQ2hMK1N0ZEVvQXM3WlROOWw1K2RDcHp3?=
 =?utf-8?B?dXRLMmRZR09MeFFBWDBaanBmcHdGaFhCajBqOXJxQXhVdnpBZitwWU14b0Rv?=
 =?utf-8?B?a2I2Qk9DOUtYNTZZTm56TGpWTlp1Z3lEeERHL1JabGQwWHNsUVIrcjdWalNv?=
 =?utf-8?B?ZVFGekE2c2FrNXFmOFRLL2FBRVpNMWpuVmpCV09Eem5Ua250a0pybkZtSkN4?=
 =?utf-8?B?ZENDdm5kZDE4OGtCcEQwSFlWbEJlTXY2RUY3cjBxb3pVVUI4Zm9qaVRLOVpp?=
 =?utf-8?B?R00rVldJNDlyUDJSZkd1U2NjTFlUQXV4VXlmb1Y3bmZQbHl2VnJGRW94d0cr?=
 =?utf-8?B?dmdUNUxwU24wc1V0c2R0WWMvQm4rRU9EV1hyTXNiTWVqTDAwaGR6Rk5JMWdy?=
 =?utf-8?B?UFFWYTZyZkxVZVBYSmVDMWF4akQxM3FXc1RRK2RpRW1CKytJVmNYcXRTVHZH?=
 =?utf-8?B?WmltcEFZZjd1WTRZeUZIOHk0Ti9rZFJKN3g3cHQzTnZiYVUzUEM0OURoMzg3?=
 =?utf-8?B?bUlsbXVlWkwzaDF1WGlHYnU4VXZZYU0vNHo2MGoxenY2V3dDUVJGRHFnQnh0?=
 =?utf-8?B?alBaVGVBR0lQOEV1VloxbU4wQjlDd001U21ablkyWnU1TUlsM1pYMzI2UkRl?=
 =?utf-8?B?TytKdFRUN2lVandIbXl0K0FJL29aeTZXcWEydkIvL0I5NUkxWFVld01uTW1l?=
 =?utf-8?B?VytsTFlBeEVOcmhZdnhJY3dxYndaQ3pIbEZXN1dVcnpZbkNzWXh6VmdRUWtE?=
 =?utf-8?B?U0VWUXFNTDE4Yk1TenYwc3hTVFpQY0F1SGNWN01CYTlWYjJRUUtVUTZ3WVNr?=
 =?utf-8?B?WkUyTE82RjE2OVNQeEUwY2YrWmxyOC96cVVZd0R3YnZ0VWxERXR3dTVPcFRk?=
 =?utf-8?B?czYzTzVFZ0kra2VnN1ZSaERMUnpqR0RBQW9JclJlaXNmd3dWaXZLemVNNDEx?=
 =?utf-8?B?aEFhTlY4cVdNa1FqWTVqKzc5VFJiTGtXc1lMYnA5ckRhL0QwQ3gvK2tQYjky?=
 =?utf-8?B?Uy9UOERYSE5lY1ZBUU5kTGtseEJsRHNZakQ1OXFqUU8vQXpxUDF6a2N3MFkz?=
 =?utf-8?B?Q094a1ZCTTVONUhWNm94clAxc09jMVlWSUxyeTFhdnpFRGlWS1o1SzhsRmcy?=
 =?utf-8?B?UHlUbHB6OXpXbU1xL3Z5dG55bk5Zc2hoSVM3SmhzYTZGZWdlY3g3dTlYZHJI?=
 =?utf-8?B?ZGg5aSsybEhSeE9ZUmpIeUpzemwzY0xhWmtHZVlMeFE4M2JGbkdycDBvQkJ1?=
 =?utf-8?B?d2NYc2dDYnJ2Tlg5RDNWVzVtOFVzRGYxV2EveXlqV3RyajNmcVY2aVJUdTlo?=
 =?utf-8?B?UWdYaGxqLzZzRUd2UUNuNGVmUk5hY1BSR0lRQ0UwYThnakN6eFVQYXJrWlIz?=
 =?utf-8?B?KzRjbmtOZGxWRlJONGZuSXRic0xpWnZkKzNTaS9DOWU4Zkw5THV6d2xyM3BY?=
 =?utf-8?B?SlljUTlYU1Y2eWhFcU5aZmJZc2t3WG1ZM3BicERpaFZGTE5hMG9wQjAvcm1I?=
 =?utf-8?B?TmRtK2tSYzhjRVUwZW9KY0tkSjliRjZtaVBTblRyNncxMWZ5dzU5WXJ3Y3pH?=
 =?utf-8?B?VG1nM0FWaHB3QmczU0RGVmY5RXY1bVBDa21welBuQVFseHVLQ2ZIWjFqS1N5?=
 =?utf-8?B?TzNxazliM29VdWVDN28vRFhSVklnbVU3RXFHeGhuUzVmTDdzSlhMTDdVYWdl?=
 =?utf-8?B?Ykhza1RPQ25XRDV0MnRiYlJPc2xCandWdjNsWmgxTlEzc1JwLzdSanR0cjEz?=
 =?utf-8?B?UTBLZmlTWGJNcmo3bmdCWEtmaUR1SW5EV0hhYWVMeitJVE5TYnNYYTdRaHYr?=
 =?utf-8?B?MHBiTE5PbW1yV1NRT21TcGhNYmhoTDBPR2JxYU5PTHhLZFFVMmRhQnlOQTQ4?=
 =?utf-8?B?REsvTUN2MFhxSDlWeE51czdWaEExQ1N5RjFlTjUwRDNYVXVVbnFjSkdzWUps?=
 =?utf-8?B?bXVDcStDemhKT05hUk1PcWIyVEU3T1djb01wRjNsekRtUUMvSys4bzRjSERW?=
 =?utf-8?B?RkRFcStTZUlpTjlnQ2dtVnh6ZDh3MFRGaHZ3YnFKcU10bWQ4cUdVU0lndzIz?=
 =?utf-8?Q?Bkcm7ID2toDIaJPi4wMiWDQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF2F1831332D2C4C82404866A7192A1D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ac4602-3fc9-4d20-3a36-08da9bf19b66
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 16:52:02.2625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxAV+dAUd7LvOJ4nU+3oceRJfrrgdtQEwE6uMCt5SKgK8evn5N5q/V2XwvuDg7CEZz/srI5Tr5ecFrlKjVyFuAVt3MRbCKckjvJDc9bw84w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3325
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA5LzIwMjIgw6AgMTY6MDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBBIGxhdGVyIGNoYW5nZSBzdG9wcyB0aGUga2VybmVsIHVzaW5nIHIyIGFuZCBsb2FkcyBpdCB3
aXRoIGEgcG9pc29uDQo+IHZhbHVlLiAgUHJvdmlkZSBhIFBBQ0FUT0MgbG9hZGluZyBhYnN0cmFj
dGlvbiB3aGljaCBjYW4gaGlkZSB0aGlzDQo+IGRldGFpbC4NCj4gDQo+IFhYWDogNjRlLCBLVk0s
IGZ0cmFjZSBub3QgZW50aXJlbHkgZG9uZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMg
UGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL3BwY19hc20uaCAgICAgICAgICAgICB8ICAzICsrKw0KPiAgIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvZXhjZXB0aW9ucy02NGUuUyAgICAgICAgICAgfCAgNCArKy0tDQo+ICAgYXJjaC9wb3dl
cnBjL2tlcm5lbC9leGNlcHRpb25zLTY0cy5TICAgICAgICAgICB8ICA2ICsrKy0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9rZXJuZWwvaGVhZF82NC5TICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+
ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9pbnRlcnJ1cHRfNjQuUyAgICAgICAgICAgICB8IDEyICsr
KysrKy0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvb3B0cHJvYmVzX2hlYWQuUyAgICAg
ICAgICAgfCAgMiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlX21wcm9m
aWxlLlMgICAgfCAgNCArKy0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L29w
YWwtd3JhcHBlcnMuUyB8ICAyICstDQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vcHBjX2FzbS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0K
PiBpbmRleCA1MjBjNGM5Y2FmN2YuLmMwODQ4MzAzMTUxYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vcHBjX2FzbS5oDQo+IEBAIC0zNzQsNiArMzc0LDkgQEAgR0xVRSguLG5hbWUpOg0KPiAg
IA0KPiAgICNpZmRlZiBfX3Bvd2VycGM2NF9fDQo+ICAgDQo+ICsjZGVmaW5lIExPQURfUEFDQV9U
T0MoKQkJCQlcDQo+ICsJbGQJcjIsUEFDQVRPQyhyMTMpDQo+ICsNCg0KV291bGRuJ3QgaXQgYmUg
YmV0dGVyIGFzIGEgR0FTIG1hY3JvID8NCg==
