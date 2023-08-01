Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569E976AB87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 10:59:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=C8kDrU8O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFTYr21T9z3bm2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 18:59:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=C8kDrU8O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::607; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFTXt2DyXz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 18:58:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUCWbaTZxpPFOct/q/8MW43yrGzH58eluk6ddwYF52psfo5i5Ywvc7ZuyKO+tDmNabR32AifqQTm0bZBTtXGePh7FDptnMKO3+qUcQRZeH2s2QHSELzV2F5nLxll7BdxmGvFqVLqzSVFFMgWqeDUGsA8OsrLgnhf3fG8yIYw6MLeCb5Smmevj9nvNKbKraX41DmXvaaDVmpu7Tg5GvLEb3Ec6mEQezKJDN83WHK+C4DzpJOGq9WA6prvqimMr8aqO065Uv8z8wxgVTis1At2qxIoMyILg2cGxRKhPT9Pz2Ou9uC2IOV2EPusxtgnzYK9NxZhG00tFD/l0YK33efLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EMTUPFwJ4bXjqbOWycFDB4YSFdev60M3EuzGnT/enQ=;
 b=USdBb0qFkYSwJX3Hl1/XBNaM6u4ZYQHqCB22+xNYsUv9GesMpnONVQ6Zno9nSfcTBcY5xS8rNGlwJ8lo3fFtxuZITY4YncE/7jph+Bfku8TKxcf4W5wTLmvTbsovZ1uCoVx6gn1XPcBHUxvyLmXZyPmC9AAgu1VdvG7O6t7icqwDViya1lv2/jvU9l90oCcEuqkhGamZoZteUJ85ocKOPw176ix61zHplRoBNEK09c2oaylhT6IvYGBYVsUdjj85f0HEC2fjM3JOe8iISFwWX6eBv2mcoZRuZ9zvWO5l00X9dwyGv3lCOKFEvP1ZqXgSgrkGfK6T3yzhv7anPChjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EMTUPFwJ4bXjqbOWycFDB4YSFdev60M3EuzGnT/enQ=;
 b=C8kDrU8OikLWA3Cn91t4lTQxSBQt7W08CDVI49twnfIrhIyRYASh/LPynEFyctO/uCVWXMQtdkeFC+Zl1aio9Ia9lLi1IZTUAFvsWHy2L8qQ6PGQIq+P5n15yQeWGIV81pg01yYeplzuoAF4+Paqg26tdyWt9uVpQ5BLzKhhX8s0WQQcXyCAgp39YWqAddv/SxnZ6UGz+brhgZ2J/XGMWSCS6BFpDoy7vzwhnY1pz6tTVpXQwB+r6LfvRxhdkc9Jba7zoF4y8HPnbw5HctUPXuqB+oXxw1pvN8MDJcQGavvpbQTTyOoNYWoubgy5GU7dOOf5ABEXdktlKJiqm0NLWQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1577.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:58:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:58:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Thread-Topic: [PATCH] Documentation: devices.txt: reconcile serial/ucc_uart
 minor numers
Thread-Index: AQHZvfjvf6d+ftR+dEGjqGoP8+PuAq/U9AiAgAACuICAADnbAA==
Date: Tue, 1 Aug 2023 08:58:01 +0000
Message-ID: <2c4a02d0-e216-2cf2-2ff0-60851cb284cc@csgroup.eu>
References: <20230724063341.28198-1-rdunlap@infradead.org>
 <dc334e93-1487-8058-195d-e90db7bdb53f@csgroup.eu>
 <58f88e11-9292-5eca-a4d6-e72d4124078a@infradead.org>
In-Reply-To: <58f88e11-9292-5eca-a4d6-e72d4124078a@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1577:EE_
x-ms-office365-filtering-correlation-id: d5dc8414-9b57-49ac-5bb6-08db926d68ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hoBjig/j53bh02STpojPVYKkUafo4iIuSnKLUSx4x1uBg6XRfTM5eh+owJAtXqX2K6++fDfW9DJvzOhq4ie45VzhH5vbbapdf3SNLJyiiLs4jF7SO8YLddzxG653GZncGjydOzaEqBVDQHlOnvA6lyVLmJQMI5QQ7SgpkAzdKC7R6dsHiVBrSrX82Zb+kKGKEEnsNq3iKMO9xkk6efUc7haDmC0Z9o+zQIZMv+Q//6ZbSG/1V36bXfJc4a1VBGK+g0NNSsQDN8/3qUHuVliaOlJElTG9pr5/QAhvkxEr56y88G61ZESjbMmGmyxzAfk4lxujURhxEoDDa+Arj6BdlZ2dW97sd3ezUy5rAaZIH2mowzGGA9AZZvvrNPu8VbHzbIokgXmUOpmPjeY+WoZK/SCfIHUAehFIcsVtgPb0AezkIL1Q30JhFvIUCoQoQUVZxU40k9I5tuM4y3OCR8H+1bp5CnJZTzjNe3XBdRGJRf3lrOA9x4cE6WQD/QHiX3fC4nSyeZ1tc4Zc4YhNPkRlhtUkQi1uOrPBGFviL7xUlzbu5DqBwFMSxXDERkhw7A4Q7Jw38jgdZP/jpFt1Q4Gu5FIJ3NZN1sf6/lHA6DYI+/zpaxfaENV3r2Kf2GK4/qpeVMhM4YL0Sw2tPFcLz3b6th1o1qCbtlP+Qc/CST7SlVU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199021)(38070700005)(8936002)(8676002)(36756003)(31686004)(6486002)(41300700001)(478600001)(2616005)(2906002)(66574015)(44832011)(83380400001)(186003)(31696002)(316002)(86362001)(6506007)(5660300002)(76116006)(7416002)(38100700002)(122000001)(966005)(91956017)(6512007)(54906003)(4326008)(53546011)(110136005)(66476007)(71200400001)(64756008)(66446008)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U3U0NUdWNkFnSUFPUXRyZWpKK3FWM3VHbWt4U1Nick9vVFYrWU50M3MyM2tm?=
 =?utf-8?B?QUlGSVBIeTdYUFRNL2J4a25nTFdiWDBoU09NMWl3OTh6SHJLWlVMVWNWcHdk?=
 =?utf-8?B?OEtTUy9ONThaRXdsRHYwaHlMazBMMDdISXR5KzFaZ0RwdVhHaExJeHVITHZ6?=
 =?utf-8?B?TEY4clZLVjdpQjFVMzBCaWRsQzZkZjl3N1RkNDlwekE0UTNNRXRjb1VBa28w?=
 =?utf-8?B?R09BdUlRdTYxOXNod0NGeWN3eEdxbnY3SGxyL2NvL0Y4NUlEdzVJaFFHb05v?=
 =?utf-8?B?ejdoV3dQMTNxZjMyYW5QSllVd3R2aXlpUHdFWU9wYSs4UFg3MkxjalNMbXNR?=
 =?utf-8?B?ZjZPUDZIRHdiQS9hUzVKQzhzQ25xUnluYzdGNjZQcXdvcFRsYkJBY0w0WDJn?=
 =?utf-8?B?Vm54WkhEa2ViUk1zaDJyZnpRVWx4SHZ0bVlkSjNNeFB6L3N4OW9FOGFERXB5?=
 =?utf-8?B?ZDlxTy9UWFBDVFZHSlpEazNCWnNNNzBkMzdlZ3dZUXEzclM5QVA3b0dhTjVy?=
 =?utf-8?B?clJGMG5VV0UxQWpaVStwdU0rMU9IRlkvQ1N4NFk5Y2R3clRlekhvVXBwL0Fz?=
 =?utf-8?B?bjJMTEhFSUNsT0g1WmU2Qk9Xb2F1VGtTWmlXL21JMW56MmxtQzIrbmoyK0pB?=
 =?utf-8?B?Z2s0cHBXWUFGbTU1Z1lPOUVEZytCUUNQQWJNK0FaVXB0Yk1yR0tFRVBGTWxN?=
 =?utf-8?B?blJHanM5K1JDNjhaSy9IQUZGT0poWFUrQURtcWlTdmY3NkpLNGlKVitqT0Vs?=
 =?utf-8?B?d3Y3TkdmWVdjYk9EeWM2d1RERU4xMnZnWnUrNWl6L3ZlTWp0L0V5Qy8zZ0N5?=
 =?utf-8?B?OU5FQzRQOXRabElaZ1FLZGFxVGQ4SmV0MjFjMDJZVyt6Vy9yc3hTdGJtOVN5?=
 =?utf-8?B?RndoMlhuRms4VDQzY05pVkY3dFhJNCtoYmtGNE4xOUZ3akNDRGN4a3VZbGtB?=
 =?utf-8?B?RUlBY2NTSTlwNnU4OW9HODZudjZZN3drYUVRdEh1UTI0QU5YM0cyRDhKZDNv?=
 =?utf-8?B?bWV0emlYOUYwWmtKNDhCcmFBMytQWnFBUFlOOUR0YmFseGlmZXN0T1M0cjNu?=
 =?utf-8?B?MVhEaXphczFTSi9pdEJ0NTVjWXdZQlU0dGNwTUpGc3lUYmNMVnZ1RHhqVEEz?=
 =?utf-8?B?cUtTWU9RNTZqc0FHSEpNZ2lRUEpEZS9GNWpXaUlIWFVOakVGemNYWFY1V0d4?=
 =?utf-8?B?YnFoMEl3N2tZcWh6dUxwT1dFc0lRV3YyM2ZPMGNkUFJYUnowSGMwR0k4TFNU?=
 =?utf-8?B?Q3FnY2dUcW9BSjc2Vlo3Q3BESVFucXI1a0srQXFUZEpCc0VLbVJBeWpYdnNF?=
 =?utf-8?B?Y3g5TkZKWVpnRXJ2QmRJWVJObk5BWlhoODFlT3NrajJ3VXB2cW1jT25ZV1dO?=
 =?utf-8?B?TjJka2xzby9qTUVpU0FldC9tRzZFam1iOFZabHd3cEUxTEF3ZkNFQmVVb0d4?=
 =?utf-8?B?SjNrUUd4ZU5Zd1V6dWNIRmJuVG03SzdXSFZYc0NneGwvakU2OHBpUkhKcXBn?=
 =?utf-8?B?OHdIcDJvSWI1bWxXamNPdE44ZGVZanA3YnlQOGFyR1lNTkV5dmp5NEFQN25I?=
 =?utf-8?B?UE5JcXdIUVpMMmV4SkRYQVRFRnF0RkI1MmR3b24xdWlYMHNKckFUc1hxbXhE?=
 =?utf-8?B?a081clFFNW9KWmsxWll3MHRXQ0l5Z0E5dy9KTUVTSHRPS09PcVJuZmZVWFk2?=
 =?utf-8?B?ZWlHdXZVYXpyZkRZMmZEM0pua2pqeWt2MzFaUEJiVUJPbEtsQW0xcER5MW9v?=
 =?utf-8?B?YkZ4SWJVR2xkQjB5ZHdJSTJuUkxvbVVGQ1FkT1kzalBXdk4xVEtOVnlIMEJN?=
 =?utf-8?B?NDJXQyt5RVRkV3krMGpYWDY3WkZTSXBoMEYrODhmQjhlZlVSbG9wTlRnU08y?=
 =?utf-8?B?Y0NCMHpIWUNFM1lqOVZhVEtUTHh3MGRkbnZ3NzB3SXgzcHhKYUNjNHRxTC9Z?=
 =?utf-8?B?V21pOHZ5TkExZUovK25Ia2ttd0F2WkRjTlpnbU00Q3JZYThkcC9pb2pKY2N4?=
 =?utf-8?B?b2tDUUhycmtsRitpbXZocERQODFqQVhST2dDQ2lIbXFTVHpUaExGWGFkc1My?=
 =?utf-8?B?VXFJMWVtTEpTMDZKWjd3TS92TUlFUUJKQzQ0WFZ3KzFzanNvQjBJak1XRUMx?=
 =?utf-8?B?OW8vRTM2RFMwS3Y1NWg3dm5XQmZwVEpyT2FWOE02V0lmdlJGbjI3K2hEMmp0?=
 =?utf-8?B?WGhEZW1zNXR0ZHlHbVNEMk5iRFNneURXU1ZXQ3NoM0Zvb1VvYnBBQmVmaTho?=
 =?utf-8?B?ZmNLSlRGYUVBekhpekVWclJsK3FBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0302BF9DDBB797448F677BD2942D8E96@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dc8414-9b57-49ac-5bb6-08db926d68ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:58:01.1973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jy3sTW0QpRfJhX/aUeinVGjH0z/VFwRBWQcJgozWe7Egl0cJBng+JVjH79oTsKw/oVHWLZiYYrjGbtCSJjTt5tawTY8bTw4s3CV4ayauHrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1577
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
Cc: Timur Tabi <timur@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Gala <galak@kernel.crashing.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA4LzIwMjMgw6AgMDc6MzAsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBI
aSBDaHJpc3RvcGhlLA0KPiANCj4gT24gNy8zMS8yMyAyMjoyMSwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjQvMDcvMjAyMyDDoCAwODozMywgUmFuZHkgRHVubGFwIGEg
w6ljcml0wqA6DQo+Pj4gUmVjb25jaWxlIGRldmljZXMudHh0IHdpdGggc2VyaWFsL3VjY191YXJ0
LmMgcmVnYXJkaW5nIGRldmljZSBudW1iZXINCj4+PiBhc3NpZ25tZW50cy4gdWNjX3VhcnQuYyBz
dXBwb3J0cyA0IHBvcnRzIGFuZCB1c2VzIG1pbm9yIGRldm51bXMNCj4+PiA0Ni00OSwgc28gdXBk
YXRlIGRldmljZXMudHh0IHdpdGggdGhhdCBpbmZvLg0KPj4+IFRoZW4gdXBkYXRlIHVjY191YXJ0
LmMncyByZWZlcmVuY2UgdG8gdGhlIGxvY2F0aW9uIG9mIHRoZSBkZXZpY2VzLnR4dA0KPj4+IGxp
c3QgaW4gdGhlIGtlcm5lbCBzb3VyY2UgdHJlZS4NCj4+DQo+PiBEZXZpY2VzIHR0eUNQTSogYmVs
b25nIHRvIGNwbV91YXJ0IGRyaXZlci4gQXMgZXhwbGFpbmVkIGluIHRoZSBjb21tZW50DQo+PiB5
b3UgaGF2ZSBtb2RpZmllZCBpbiBVQ0MgdWFydCBkcml2ZXIsIFVDQyB1YXJ0IGJvcnJvd3MgdGhv
c2UgZGV2aWNlcyBhbmQNCj4+IHNoYWxsIG5vdCBiZSBjb25zaWRlcmVkIGFzIHRoZSByZWZlcmVu
Y2UuIEJ1dCB0aGUgbGluZXMgeW91IG1vZGlmeSBpbg0KPj4gZGV2aWNlLnR4dCBkb2Vzbid0IG1l
bnRpb24gUUUgVUNDLCBpdCBtZW50aW9ucyBDUE0gU0NDIGFuZCBDUE0gU01DLg0KPj4NCj4+IENQ
TSB1YXJ0IGRyaXZlciBzdXBwb3J0cyB1cCB0byA2IHBvcnRzICg0IFNDQyBhbmQgMiBTTUMpLg0K
Pj4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgcmVwbHlpbmcuDQo+IA0KPiBEb2VzIHRoaXMgbWVhbiB0
aGF0IHRoZSBwYXRjaCBzaG91bGQgYmUgcmV2ZXJ0ZWQ/DQoNCk5vdCBzdXJlIGl0IHNob3VsZCBi
ZSByZXZlcnRlZCwgdGhlIGJlc3Qgd291bGQgYmUgdG8gZml4IGl0IHVwIGJlY2F1c2UgDQphbnl3
YXkgd2hhdCB3ZSBoYWQgd2FzIHdyb25nLg0KDQpTZWUgYmVsb3cuDQoNCj4gDQo+PiBPbiBvbmUg
b2YgbXkgYm9hcmRzIHdoaWNoIGhhcyBhIHBvd2VycGMgbXBjODY2IENQVSwgSSBoYXZlOg0KPj4N
Cj4+IFsgICAgMi4zOTM4NzJdIGZmMDAwYTgwLnNlcmlhbDogdHR5Q1BNMCBhdCBNTUlPIDB4ZmZm
MDBhODAgKGlycSA9IDE5LA0KPj4gYmFzZV9iYXVkID0gODI1MDAwMCkgaXMgYSBDUE0gVUFSVA0K
Pj4gWyAgICAyLjQxMTg5OV0gZmYwMDBhOTAuc2VyaWFsOiB0dHlDUE0xIGF0IE1NSU8gMHhmZmYw
MGE5MCAoaXJxID0gMjAsDQo+PiBiYXNlX2JhdWQgPSA4MjUwMDAwKSBpcyBhIENQTSBVQVJUDQo+
PiBbICAgIDIuNDMwMzUyXSBmZjAwMGEwMC5zZXJpYWw6IHR0eUNQTTIgYXQgTU1JTyAweGZmZjAw
YTAwIChpcnEgPSAzMCwNCj4+IGJhc2VfYmF1ZCA9IDgyNTAwMDApIGlzIGEgQ1BNIFVBUlQNCj4+
IFsgICAgMi40NDg5NDRdIGZmMDAwYTIwLnNlcmlhbDogdHR5Q1BNMyBhdCBNTUlPIDB4ZmZmMDBh
MjAgKGlycSA9IDI5LA0KPj4gYmFzZV9iYXVkID0gODI1MDAwMCkgaXMgYSBDUE0gVUFSVA0KPj4g
WyAgICAyLjQ2NzQzNV0gZmYwMDBhNDAuc2VyaWFsOiB0dHlDUE00IGF0IE1NSU8gMHhmZmYwMGE0
MCAoaXJxID0gMjgsDQo+PiBiYXNlX2JhdWQgPSA4MjUwMDAwKSBpcyBhIENQTSBVQVJUDQo+PiBb
ICAgIDIuNDg1OTI0XSBmZjAwMGE2MC5zZXJpYWw6IHR0eUNQTTUgYXQgTU1JTyAweGZmZjAwYTYw
IChpcnEgPSAyNywNCj4+IGJhc2VfYmF1ZCA9IDgyNTAwMDApIGlzIGEgQ1BNIFVBUlQNCj4+DQo+
PiAjIGxsIC9kZXYvdHR5Q1BNKg0KPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAg
ICAyMDQsICA0NiBKYW4gIDEgMDE6MDEgL2Rldi90dHlDUE0wDQo+PiBjcnctLS0tLS0tICAgIDEg
cm9vdCAgICAgcm9vdCAgICAgIDIwNCwgIDQ3IEphbiAgMSAwMTowMCAvZGV2L3R0eUNQTTENCj4+
IGNydy0tLS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgMjA0LCAgNDggSmFuICAxIDAxOjAw
IC9kZXYvdHR5Q1BNMg0KPj4gY3J3LS0tLS0tLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAyMDQs
ICA0OSBKYW4gIDEgMDE6MDAgL2Rldi90dHlDUE0zDQo+PiBjcnctLS0tLS0tICAgIDEgcm9vdCAg
ICAgcm9vdCAgICAgIDIwNCwgIDUwIEphbiAgMSAwMTowMCAvZGV2L3R0eUNQTTQNCj4+IGNydy0t
LS0tLS0gICAgMSByb290ICAgICByb290ICAgICAgMjA0LCAgNTEgSmFuICAxIDAxOjAwIC9kZXYv
dHR5Q1BNNQ0KPiANCj4gSSBkb24ndCBzZWUgbWlub3JzIDUwLTUxIGFsbG9jYXRlZCBpbiBkZXZp
Y2VzLnR4dCBmb3IgdXNlIGJ5IHRoaXMgZGV2aWNlL2RyaXZlci4NCj4gQW0gSSBvdmVybG9va2lu
ZyB0aGF0IGFsbG9jYXRpb24gc29tZXdoZXJlPw0KDQpJIGxvb2tlZCBpbnRvIGhpc3RvcnkuDQoN
CnR0eUNQTSBkbyBub3QgYXBwZWFyIGluIGRldmljZXMudHh0IGluIHYyLjYuOS4NCg0KSXQgd2Fz
IGludHJvZHVjZWQgaW4gdjIuNi4xMCBhcyA6DQoNCgkJIDQ2ID0gL2Rldi90dHlDUE0wCQlQUEMg
Q1BNIChTQ0Mgb3IgU01DKSAtIHBvcnQgMA0KCQkgICAgLi4uDQoJCSA0OSA9IC9kZXYvdHR5Q1BN
NQkJUFBDIENQTSAoU0NDIG9yIFNNQykgLSBwb3J0IDUNCg0KVGhlbiBpbiB2Mi42LjExIHdlIGZp
bmQ6DQoNCgkJIDQ2ID0gL2Rldi90dHlDUE0wCQlQUEMgQ1BNIChTQ0Mgb3IgU01DKSAtIHBvcnQg
MA0KCQkgICAgLi4uDQoJCSA0NyA9IC9kZXYvdHR5Q1BNNQkJUFBDIENQTSAoU0NDIG9yIFNNQykg
LSBwb3J0IDUNCgkJIDUwID0gL2Rldi90dHlJT0M0MAkJQWx0aXggc2VyaWFsIGNhcmQNCgkJICAg
IC4uLg0KCQkgODEgPSAvZGV2L3R0eUlPQzQzMQkJQWx0aXggc2VyaWFsIGNhcmQNCg0KU28gaXQg
bG9va3MgbGlrZSBmcm9tIHRoZSBiZWdpbmluZyB0aGUgaW50ZW50aW9uIHdhcyB0byBoYXZlIDYg
cG9ydHMgDQooZnJvbSAwIHRvIDUpIGFuZCBpdCBzaG91bGQgaGF2ZSBiZWVuIHVwIHRvIDUxLiBG
b3Igc29tZSByZWFzb24gaXQgd2FzIA0KbWVzc2VkIHVwLg0KDQpJZiB5b3UgbG9vayBpbnRvIHYy
LjYuMTAgZHJpdmVycy9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnQuaCB5b3Ugc2VlIA0KdGhlcmUg
YXJlIDYgcG9ydHMuIEV2ZW4gaW4gdjIuNi45IHRoYXQgZHJpdmVyIGV4aXN0cyBhbmQgaGFzIDYg
cG9ydHMuDQoNCg0KQW55d2F5LCB0aGUgdHR5SU9DKiB3ZXJlIHJlbW92ZWQgYnkgY29tbWl0IGEw
MTdlZjE3Y2ZkOCAoInR0eS9zZXJpYWw6IA0KcmVtb3ZlIHRoZSBpb2M0X3NlcmlhbCBkcml2ZXIi
KSwgc28gaXQgc2hvdWxkIGJlIG5vIHByb2JsZW0gdG8gZml4IA0KZGV2aWNlcy50eHQgYW5kIHNl
dCB0dHlDUE0gZnJvbSA0NiB0byA1MS4NCg0KQ2hyaXN0b3BoZQ0KDQoNCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBoZWxwLg0KPiANCj4+DQo+PiAjIGNhdCAvcHJvYy90dHkvZHJpdmVycw0KPj4gL2Rl
di90dHkgICAgICAgICAgICAgL2Rldi90dHkgICAgICAgIDUgICAgICAgMCBzeXN0ZW06L2Rldi90
dHkNCj4+IC9kZXYvY29uc29sZSAgICAgICAgIC9kZXYvY29uc29sZSAgICA1ICAgICAgIDEgc3lz
dGVtOmNvbnNvbGUNCj4+IC9kZXYvcHRteCAgICAgICAgICAgIC9kZXYvcHRteCAgICAgICA1ICAg
ICAgIDIgc3lzdGVtDQo+PiB0dHlDUE0gICAgICAgICAgICAgICAvZGV2L3R0eUNQTSAgIDIwNCA0
Ni01MSBzZXJpYWwNCj4+IHB0eV9zbGF2ZSAgICAgICAgICAgIC9kZXYvcHRzICAgICAgMTM2IDAt
MTA0ODU3NSBwdHk6c2xhdmUNCj4+IHB0eV9tYXN0ZXIgICAgICAgICAgIC9kZXYvcHRtICAgICAg
MTI4IDAtMTA0ODU3NSBwdHk6bWFzdGVyDQo+PiBwdHlfc2xhdmUgICAgICAgICAgICAvZGV2L3R0
eXAgICAgICAgMyAwLTQgcHR5OnNsYXZlDQo+PiBwdHlfbWFzdGVyICAgICAgICAgICAvZGV2L3B0
eSAgICAgICAgMiAwLTQgcHR5Om1hc3Rlcg0KPj4NCj4+IENocmlzdG9waGUNCj4+DQo+Pg0KPj4+
DQo+Pj4gRml4ZXM6IGQ3NTg0ZWQyYjk5NCAoIltQT1dFUlBDXSBxZS11YXJ0OiBhZGQgc3VwcG9y
dCBmb3IgRnJlZXNjYWxlIFFVSUNDRW5naW5lIFVBUlQiKQ0KPj4+IEZpeGVzOiAxZGExNzdlNGMz
ZjQgKCJMaW51eC0yLjYuMTItcmMyIikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4+PiBDYzogVGltdXIgVGFiaSA8dGltdXJAa2VybmVs
Lm9yZz4NCj4+PiBDYzogS3VtYXIgR2FsYSA8Z2FsYWtAa2VybmVsLmNyYXNoaW5nLm9yZz4NCj4+
PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4+PiBDYzogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4+PiBDYzogSmlyaSBTbGFieSA8
amlyaXNsYWJ5QGtlcm5lbC5vcmc+DQo+Pj4gQ2M6IGxpbnV4LXNlcmlhbEB2Z2VyLmtlcm5lbC5v
cmcNCj4+PiBDYzogSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD4NCj4+PiBDYzogbGlu
dXgtZG9jQHZnZXIua2VybmVsLm9yZw0KPj4+IC0tLQ0KPj4+ICAgIERvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvZGV2aWNlcy50eHQgfCAgICAyICstDQo+Pj4gICAgZHJpdmVycy90dHkvc2VyaWFs
L3VjY191YXJ0LmMgICAgICAgICB8ICAgIDIgKy0NCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS0gYS9kcml2ZXJz
L3R0eS9zZXJpYWwvdWNjX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC91Y2NfdWFydC5jDQo+
Pj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3VjY191YXJ0LmMNCj4+PiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvdWNjX3VhcnQuYw0KPj4+IEBAIC01OSw3ICs1OSw3IEBAIHN0YXRpYyBpbnQg
ZmlybXdhcmVfbG9hZGVkOw0KPj4+ICAgIC8qICNkZWZpbmUgTE9PUEJBQ0sgKi8NCj4+PiAgICAN
Cj4+PiAgICAvKiBUaGUgbWFqb3IgYW5kIG1pbm9yIGRldmljZSBudW1iZXJzIGFyZSBkZWZpbmVk
IGluDQo+Pj4gLSAqIGh0dHA6Ly93d3cubGFuYW5hLm9yZy9kb2NzL2RldmljZS1saXN0L2Rldmlj
ZXMtMi42Ky50eHQuICBGb3IgdGhlIFFFDQo+Pj4gKyAqIERvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUvZGV2aWNlcy50eHQuICBGb3IgdGhlIFFFDQo+Pj4gICAgICogVUFSVCwgd2UgaGF2ZSBtYWpv
ciBudW1iZXIgMjA0IGFuZCBtaW5vciBudW1iZXJzIDQ2IC0gNDksIHdoaWNoIGFyZSB0aGUNCj4+
PiAgICAgKiBzYW1lIGFzIGZvciB0aGUgQ1BNMi4gIFRoaXMgZGVjaXNpb24gd2FzIG1hZGUgYmVj
YXVzZSBubyBGcmVlc2NhbGUgcGFydA0KPj4+ICAgICAqIGhhcyBib3RoIGEgQ1BNIGFuZCBhIFFF
Lg0KPj4+IGRpZmYgLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZXMudHh0IGIv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2VzLnR4dA0KPj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlcy50eHQNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2RldmljZXMudHh0DQo+Pj4gQEAgLTI2OTEsNyArMjY5MSw3IEBADQo+Pj4gICAg
CQkgNDUgPSAvZGV2L3R0eU1NMQkJTWFydmVsbCBNUFNDIC0gcG9ydCAxIChvYnNvbGV0ZSB1bnVz
ZWQpDQo+Pj4gICAgCQkgNDYgPSAvZGV2L3R0eUNQTTAJCVBQQyBDUE0gKFNDQyBvciBTTUMpIC0g
cG9ydCAwDQo+Pj4gICAgCQkgICAgLi4uDQo+Pj4gLQkJIDQ3ID0gL2Rldi90dHlDUE01CQlQUEMg
Q1BNIChTQ0Mgb3IgU01DKSAtIHBvcnQgNQ0KPj4+ICsJCSA0OSA9IC9kZXYvdHR5Q1BNNQkJUFBD
IENQTSAoU0NDIG9yIFNNQykgLSBwb3J0IDMNCj4+PiAgICAJCSA1MCA9IC9kZXYvdHR5SU9DMAkJ
QWx0aXggc2VyaWFsIGNhcmQNCj4+PiAgICAJCSAgICAuLi4NCj4+PiAgICAJCSA4MSA9IC9kZXYv
dHR5SU9DMzEJCUFsdGl4IHNlcmlhbCBjYXJkDQo+IA0K
