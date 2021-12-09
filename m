Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC07A46F259
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 18:42:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J91Z64hTTz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 04:42:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J91Yb5kRhz308v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 04:41:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acvWBN+pON3VrJsPznorXpuaQVB1N8IOMHR3bvppuWolN+PFjCtZueZDT8sT9IqR0QTZrAA4Hzr8zoBSnq0ajE2P+QjpkJ+/ngz32m6yY1M25EZLGQlwDAmhLmLPvrPJJjxHROSRkoBY+5aZyjEf9HVNEq4y+3pZx+RHZ7fBOO0fZFBjW9wEwm0rfkbyXPBdP8/AhqfmV9ExJ4kGfk9Tl9UnIvVp8PeDBAfup4esjrtfhi42Aws3kppHWngWq+uSRQojqX90CK6Iy6JzFzkOgOxquLTnG/C5dlGjL/sJeGAGL5GP9lx/OgnZhV59WQwT/uflMcytXfRAhYeYq1zOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiKQXs/CPolYMwUM9idTikaWhS54MKhvu4Mddl0fE6k=;
 b=M7DqJf5DPGWFXC7H4skMphVUj/GY7PU3O0+MqaZXdyXZpMsSiYtyNg58Z4pnJRUVvhhCpKsu4vu7mr3Tb70ML10RAowGZYK352yz3Gyvwbetdd08a5041YLpGWOqTI6KbHB4UixHETMdPcK1nRKeuBybUbFWgZSlDRiuXvBgiMajMha+U7dCxvbSgzEdAcUCPR5V9x6C7UkY8Cji8ma7MwS+QkDSs6jOStSSCQ5VH7Q+4N4VShndni8YPQel2rzAVHaGnCq5jP/94hafamJ4N0IQMpjMX5Jaw8yzXDD+DAizkPvKW+N8W6cqotHyB/FK/lOsAYhisQgB+gP4cSMH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0438.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:18::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 17:26:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 17:26:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "mbizon@freebox.fr"
 <mbizon@freebox.fr>, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/603: Fix boot failure with DEBUG_PAGEALLOC and
 KFENCE
Thread-Topic: [PATCH] powerpc/603: Fix boot failure with DEBUG_PAGEALLOC and
 KFENCE
Thread-Index: AQHX6zEUm45+sm7WYEq1/qYEgOJsjKwm1aoAgAB5jACAAmDdAIAAvUgA
Date: Thu, 9 Dec 2021 17:26:16 +0000
Message-ID: <ea3156e2-53ae-9138-382a-ea6e3d592560@csgroup.eu>
References: <aea33b4813a26bdb9378b5f273f00bd5d4abe240.1638857364.git.christophe.leroy@csgroup.eu>
 <12988dafdf7e14ba6db69ab483a2eb53e411fc0d.camel@freebox.fr>
 <191754d3-e13d-6fe2-db4b-99d78cbf2a2e@csgroup.eu>
 <8735n2nwcv.fsf@mpe.ellerman.id.au>
In-Reply-To: <8735n2nwcv.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f0c7bff-f159-4094-8ca7-08d9bb3901be
x-ms-traffictypediagnostic: MRXP264MB0438:EE_
x-microsoft-antispam-prvs: <MRXP264MB0438DFDC049C87A4669E784AED709@MRXP264MB0438.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TPqjQj2r/OkfUHQR6VstjQerA53k4czqv0kAugHx88VhsAl/C9mQLTRd+iHkOdaWsL42epsy86B9Ri8UXBos601UbfflXVdqxLrvoPh4HLNBcA/FV7TVFLBZXaz45HVPnV6tgGQIz/rO1vtcjUIC74f0sCOK7Pf75pWrwKtltbni/r9ret5p7WcL4E0SuLFJccAZ3fD4euqvgjwnIlcOGyp7XLpQh9pFYq70fMg73/F09iM+TNyPn3lZUwAjllul6+5vphFgu7N8wbJUyS3rMIT8WuuFjPZApNfyqi4+Hw5g5UuKbgWS2hJT4AF4euMPN6WZUD6uS4TAHDKL1gM5weEoQYo0O9xgNQuYZiDQjoN5vy+LUMwROJ8uR1/HFZ9XmIe5bPfNL0KoYeoo6ZNQfStG3twU7ax1upBLQ7xdRLhGd3avxa/Fz8qVWll+8Pvq9qGvFhaLYZUYtmk29F4XfD86iS+PQcKqVQhjl6Dsjb/QDe5ekunXiqcmaP0W3hLlFsbZEDkPi3APdgGj/37FAKmM15BsetK2RjOh6l/RKqyfY4EdLNLSHIqeqWw0DMW+kQaghk+w2QCOH4WkVUYUkY2J9xjkeD/RC50H31vKjUNzPUYH0RBTAHiHH8skGL/3JAFBXAZnm/FyEoPYhVPpbdszz5QAfLfPu9jok1Vhmf8e61Ukts2P2clZ8Dp8etZ2ALJSAg+CHckCWRhxUN0smCXLkywVC3cC/YWNX77Vjf7vOJGJEaY6Dzy/gdMq6gv9w4t/LA+W3Hp0fACWJAeF8BJw55Em79rHPcRgr3fqgaU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(2616005)(4326008)(44832011)(110136005)(54906003)(71200400001)(66556008)(508600001)(83380400001)(38100700002)(8936002)(38070700005)(66574015)(122000001)(5660300002)(6512007)(31696002)(186003)(26005)(36756003)(91956017)(8676002)(66946007)(316002)(66446008)(86362001)(76116006)(64756008)(31686004)(6486002)(66476007)(2906002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a054NjlyNndXVjI2WGY5N2htYm1QckZ0NS9KRGFNYVVJWjRpdEJ5dW1RU1ov?=
 =?utf-8?B?R2ltZ0w5MVRmSDZPbTVrVjNmbDBqTGhxT1pBUUFlRG5lbDVTWThyOFkwcXBa?=
 =?utf-8?B?b2dLd2l1WmdPU1k2U25idDM4eHBFdTJIWkJseW9LMVJOeTJJNjRvUWNJMEFT?=
 =?utf-8?B?UkFSY1RyOCtJOGtUZE5BR3JPZ1gydXpYV0FuajFqM01tS2d4TnlnYzFpdDly?=
 =?utf-8?B?eVNBSUxHR1kwaS9penZlL3RWemkwVWxDbGVqQ3p3WXVmZ3JFT09DM2xtU0NU?=
 =?utf-8?B?alJyNzdNTHNobml6QmhpN2ZtOG50RHRMRno1TWcreUdsUEFYaUFVR0ZvcTd6?=
 =?utf-8?B?cU9Qb01RRS9PNTNEQ3RLT3dRakQ2U2ppTkRsN296M01DWGREaDZoUEY0UVUz?=
 =?utf-8?B?d0xLdUVMakN4SzJOejJjeHRVK0I2WkJyRVdtdWZzUTZseHRnSXBpYmxLOGcz?=
 =?utf-8?B?TnRXWFdOd1JqREZFbkpLVVRLaWxlbVkvWVM0cVN2NzFFL2txVjZxaXZNZkpE?=
 =?utf-8?B?ZlFIelRSem5hUTZzMGdDNmkvZTFWWWt5ZnVMTStpbFFRVkJqVXkvT25KaWQy?=
 =?utf-8?B?ODJYQnJOLzhMSVB2Z2xMLytuaThaZnNIYTAvN3hmbTBNRTZOSXcvOHcxRlpy?=
 =?utf-8?B?WmcwMVB6SkN0bi85dzE3Rm04a1p5NkNxU1FZNXRiN0hoRStkbUc1Q3FKRjht?=
 =?utf-8?B?RVo5OTJBcHcwR3dRbFRZN1RHVDhmaHVuZVRVczRIdEVPTjZpYWRjaDY3dzgy?=
 =?utf-8?B?bWVJcWVTanpTZnBPU1h0UlJ1cmk2bzkyNE96aFJ0ODM5aEg4M0dRTEI1dXFC?=
 =?utf-8?B?TGswYnVxUjBiT3ZvOTBDR0NIZk1GSnpVRllDTXdObEFQeTlnOHdqN1FxRitM?=
 =?utf-8?B?aDhmYlo5MnN3ZUNTd1F3T2RPL3pMalJ0R3d2amQ2MkdiUHN2RUFJZlI1QXBv?=
 =?utf-8?B?SXVQcTBESldHa3haQ05LMkFRbHRwbTBrS1VYc3VaWGhrc1RaL2NqMEthVTlK?=
 =?utf-8?B?WnVUcGdRT3M0NzBrNDNmVGFERVhBanAzVmpUMVh0NHdnQnNwTDhTZ3Q4elR3?=
 =?utf-8?B?SHR5ZXZHejZ4QWhLanVacXBlRDdheWdaTFppMHd1ZFIyUGhnZjQ0NWxhS0Rk?=
 =?utf-8?B?TmpzR0cvWHJqeTVPdS9Kd3hzOWdrMzAvbHowR2s0RmE1US82ZDFxQ3NDTGpJ?=
 =?utf-8?B?WndIamVWZW8vby9oZ1FTN1pqVWdiN21uN3ZFZXhkOHBHOS96R1pXTkVvN0xZ?=
 =?utf-8?B?RkFWVk8xbDFLdlUxQU1aQ0U5YmFqQ0hUT3FTcEdZQmFneURYb2t0cm4rZmRP?=
 =?utf-8?B?R0RXVVBrSWY2ZjJtVDdPK09zUlFhUEhXcXJJZVhUVWJ6a3NmMldHR2NqM0Ja?=
 =?utf-8?B?RTVBTG5HNDVoY3k3RkhuemJZbVBqK3Y4K0xIbFBGOThXTWl6L0Zkd3FGTjNi?=
 =?utf-8?B?bDEwUWVBM0tFRGVoS2ZCQWFRSEVVeWJlZzY2ODA3ZEpGOFFFZHNCYThtczNn?=
 =?utf-8?B?ekpXVWtzdHVwdUNKa01ZRitoZnRROVZuRHVFWlF3ME1QOW9TY2ZPcUROVzFV?=
 =?utf-8?B?eGUwc2d0WFVHa0hPNEZMVHo1Q3hOaG83d2Z3U1pDWTNUWWNwbDBiSTgybGll?=
 =?utf-8?B?M2ZLdSt6dDg0TEhaalMrRTdFcVcvcUFzYkllMzFUNE9qcitLK0g2TytaMWdD?=
 =?utf-8?B?SkN0YWZhQ3ZxUzVYbzlxSFdUbHZ6eWVLZ01mYWpCTUxwaFlUdUtjVmxkcEJI?=
 =?utf-8?B?U0VBUlhJcDZQL1RJQTNtbW4rdk1TT3FiM2xUS2pzMEljMUNNcUdzeUlBN0RD?=
 =?utf-8?B?V0FUK0k1M2krdGwvNGFBZnV3U3hsVEk3elp4ekNaVlpPQm9uNWpZcHVWMXhT?=
 =?utf-8?B?RlNUNzRiN1EvV2UrTmJPTktQdFlZdldIS2xGY29UTTFaTEUzeW9FVXBMcUgv?=
 =?utf-8?B?OHRqaTM3U1RianR6OTlueXVnRHZwUlBDcXRCeWlaYk8zaUVNMXdOV3VMazlG?=
 =?utf-8?B?VW5qaXY0NS9iRy9tMktLT0Vja3lUZFpiRTdyZGVFaWkwSU8wWStLOHBpSWJ6?=
 =?utf-8?B?TGNoSGhiRXV3YnJKT3VFdlVYN2JiNkFKL1ZTMFc0U3l1Y05RdWtNbVEzajd6?=
 =?utf-8?B?eUNRTlpyck9tSjc1YmM4cjFqbW0yd09jSmJWTUZLNk5QQ24yMlJud3RwZXZW?=
 =?utf-8?B?Z2ZTcS9KcG05OTRKaGZKZkJmcmtXYWFERUhQTTJQT1BrZjk5SllrNk5CQVdi?=
 =?utf-8?Q?IvLdX7FQwz1Mc9MuxbLmuDHpTpu1zuZPC4+A6NzJxs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D5DA1B68A6507409834C93D2D2F4901@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0c7bff-f159-4094-8ca7-08d9bb3901be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 17:26:16.5385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXeDV4L2Eko/2Hy3Pw+3HJ7u0N0hh59ZS0e9Buy9lpCa3ExewcUzuN3AcUW3t3wdDJ6alrR/k0E4jZ7uRIKAsJXEwmn5bg+C+MDbqrE3ShA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0438
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMDc6MDgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAwNy8xMi8yMDIxIMOgIDExOjM0LCBNYXhpbWUgQml6b24gYSDDqWNyaXTCoDoNCj4+
Pg0KPj4+IE9uIFR1ZSwgMjAyMS0xMi0wNyBhdCAwNjoxMCArMDAwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+Pg0KPj4+IEhlbGxvLA0KPj4+DQo+Pj4gV2l0aCB0aGUgcGF0Y2ggYXBwbGll
ZCBhbmQNCj4+Pg0KPj4+IENPTkZJR19ERUJVR19QQUdFQUxMT0M9eQ0KPj4+IENPTkZJR19ERUJV
R19QQUdFQUxMT0NfRU5BQkxFX0RFRkFVTFQ9eQ0KPj4+IENPTkZJR19ERUJVR19WTT15DQo+Pj4N
Cj4+PiBJIGdldCB0b25zIG9mIHRoaXMgZHVyaW5nIGJvb3Q6DQo+Pj4NCj4+PiBbICAgIDAuMDAw
MDAwXSBEZW50cnkgY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyNjIxNDQgKG9yZGVyOiA4LCAx
MDQ4NTc2IGJ5dGVzLCBsaW5lYXIpDQo+Pj4gWyAgICAwLjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFz
aCB0YWJsZSBlbnRyaWVzOiAxMzEwNzIgKG9yZGVyOiA3LCA1MjQyODggYnl0ZXMsIGxpbmVhcikN
Cj4+PiBbICAgIDAuMDAwMDAwXSBtZW0gYXV0by1pbml0OiBzdGFjazpvZmYsIGhlYXAgYWxsb2M6
b2ZmLCBoZWFwIGZyZWU6b2ZmDQo+Pj4gWyAgICAwLjAwMDAwMF0gLS0tLS0tLS0tLS0tWyBjdXQg
aGVyZSBdLS0tLS0tLS0tLS0tDQo+Pj4gWyAgICAwLjAwMDAwMF0gV0FSTklORzogQ1BVOiAwIFBJ
RDogMCBhdCBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jOjE5NCBzZXRfcHRlX2F0KzB4MTgvMHgx
NjANCj4+PiBbICAgIDAuMDAwMDAwXSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIgTm90IHRh
aW50ZWQgNS4xNS4wKyAjNDQyDQo+Pj4gWyAgICAwLjAwMDAwMF0gTklQOiAgODAwMTVlYmMgTFI6
IDgwMDE2NzI4IENUUjogODAwMTY2ZTQNCj4+PiBbICAgIDAuMDAwMDAwXSBSRUdTOiA4MDc1MWRk
MCBUUkFQOiAwNzAwICAgTm90IHRhaW50ZWQgICg1LjE1LjArKQ0KPj4+IFsgICAgMC4wMDAwMDBd
IE1TUjogIDAwMDIxMDMyIDxNRSxJUixEUixSST4gIENSOiA0MjIyODg4MiAgWEVSOiAyMDAwMDAw
MA0KPj4+IFsgICAgMC4wMDAwMDBdDQo+Pj4gWyAgICAwLjAwMDAwMF0gR1BSMDA6IDgwMGI4ZGM4
IDgwNzUxZTgwIDgwNmM2MzAwIDgwNzMxMWQ4IDgwN2ExMDAwIDhmZmZmZTg0IDgwNzUxZWE4IDAw
MDAwMDAwDQo+Pj4gWyAgICAwLjAwMDAwMF0gR1BSMDg6IDAwN2ExNTkxIDAwMDAwMDAxIDAwN2Ex
MTgwIDAwMDAwMDAwIDQyMjI0ODgyIDAwMDAwMDAwIDNmZjljNjA4IDNmZmZkNzljDQo+Pj4gWyAg
ICAwLjAwMDAwMF0gR1BSMTY6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwIDAwMDAwMDAwIDgwMDE2NmU0IDgwN2EyMDAwDQo+Pj4gWyAgICAwLjAwMDAwMF0gR1BS
MjQ6IDgwN2ExZmZmIDgwNzMxMWQ4IDgwNzMxMWQ4IDgwN2EyMDAwIDgwNzY4ODA0IDAwMDAwMDAw
IDgwN2ExMDAwIDAwN2ExMTgwDQo+Pj4gWyAgICAwLjAwMDAwMF0gTklQIFs4MDAxNWViY10gc2V0
X3B0ZV9hdCsweDE4LzB4MTYwDQo+Pj4gWyAgICAwLjAwMDAwMF0gTFIgWzgwMDE2NzI4XSBzZXRf
cGFnZV9hdHRyKzB4NDQvMHhjMA0KPj4+IFsgICAgMC4wMDAwMDBdIENhbGwgVHJhY2U6DQo+Pj4g
WyAgICAwLjAwMDAwMF0gWzgwNzUxZTgwXSBbODAwNTg1NzBdIGNvbnNvbGVfdW5sb2NrKzB4MzQw
LzB4NDI4ICh1bnJlbGlhYmxlKQ0KPj4+IFsgICAgMC4wMDAwMDBdIFs4MDc1MWVhMF0gWzAwMDAw
MDAwXSAweDANCj4+PiBbICAgIDAuMDAwMDAwXSBbODA3NTFlYzBdIFs4MDBiOGRjOF0gX19hcHBs
eV90b19wYWdlX3JhbmdlKzB4MTQ0LzB4MmE4DQo+Pj4gWyAgICAwLjAwMDAwMF0gWzgwNzUxZjAw
XSBbODAwMTY5MThdIF9fa2VybmVsX21hcF9wYWdlcysweDU0LzB4NjQNCj4+PiBbICAgIDAuMDAw
MDAwXSBbODA3NTFmMTBdIFs4MDBjZmViMF0gX19mcmVlX3BhZ2VzX29rKzB4MWIwLzB4NDQwDQo+
Pj4gWyAgICAwLjAwMDAwMF0gWzgwNzUxZjUwXSBbODA1Y2ZjOGNdIG1lbWJsb2NrX2ZyZWVfYWxs
KzB4MWQ4LzB4Mjc0DQo+Pj4gWyAgICAwLjAwMDAwMF0gWzgwNzUxZjkwXSBbODA1YzVlMGNdIG1l
bV9pbml0KzB4M2MvMHhkMA0KPj4+IFsgICAgMC4wMDAwMDBdIFs4MDc1MWZiMF0gWzgwNWMwYmRj
XSBzdGFydF9rZXJuZWwrMHg0MDQvMHg1YzQNCj4+PiBbICAgIDAuMDAwMDAwXSBbODA3NTFmZjBd
IFswMDAwMzNmMF0gMHgzM2YwDQo+Pj4gWyAgICAwLjAwMDAwMF0gSW5zdHJ1Y3Rpb24gZHVtcDoN
Cj4+PiBbICAgIDAuMDAwMDAwXSA3YzYzMDAzNCA4M2UxMDAwYyA1NDYzZDk3ZSA3YzA4MDNhNiAz
ODIxMDAxMCA0ZTgwMDAyMCA5NDIxZmZlMCA5M2UxMDAxYw0KPj4+IFsgICAgMC4wMDAwMDBdIDgz
ZTYwMDAwIDgxMjUwMDAwIDcxMjkwMDAxIDQxODIwMDE0IDwwZmUwMDAwMD4gN2MwODAyYTYgOTNj
MTAwMTggOTAwMTAwMjQNCj4+Pg0KPj4+DQo+Pg0KPj4gVGhhdCdzIHVucmVsYXRlZCB0byB0aGlz
IHBhdGNoLg0KPj4NCj4+IFRoZSBwcm9ibGVtIGlzIGxpbmtlZCB0byBwYXRjaCBjOTg4Y2ZkMzhl
NDggKCJwb3dlcnBjLzMyOiB1c2UNCj4+IHNldF9tZW1vcnlfYXR0cigpIiksIHdoaWNoIGNoYW5n
ZWQgZnJvbSB1c2luZyBfX3NldF9wdGVfYXQoKSB0byB1c2luZw0KPj4gc2V0X21lbW9yeV9hdHRy
KCkgd2hpY2ggdXNlcyBzZXRfcHRlX2F0KCkuDQo+Pg0KPj4gc2V0X3B0ZV9hdCgpIGhhcyBhZGRp
dGlvbmFsIGNoZWNrcyBhbmQgc2hhbGwgbm90IGJlIHVzZWQgdG8gdXBkYXRpbmcgYW4NCj4+IGV4
aXN0aW5nIFBURS4NCj4+DQo+PiBXb25kZXJpbmcgaWYgSSBzaG91bGQganVzdCB1c2UgX19zZXRf
cHRlX2F0KCkgaW5zdGVhZCBsaWtlIGluIHRoZSBwYXN0LA0KPj4gb3IgZG8gbGlrZSBjb21taXQg
OWY3ODUzZDc2MDlkICgicG93ZXJwYy9tbTogRml4IHNldF9tZW1vcnlfKigpIGFnYWluc3QNCj4+
IGNvbmN1cnJlbnQgYWNjZXNzZXMiKSBhbmQgdXNlIHB0ZV91cGRhdGUoKQ0KPj4NCj4+IE1pY2hh
ZWwsIEFuZWVzaCwgYW55IHN1Z2dlc3Rpb24gPw0KPiANCj4gVGhlIG1vdGl2YXRpb24gZm9yIHVz
aW5nIHB0ZV91cGRhdGUoKSBpbiB0aGF0IGNvbW1pdCBpcyB0aGF0IGl0IGRvZXMgdGhlDQo+IHVw
ZGF0ZSBhdG9taWNhbGx5IGFuZCBhbHNvIGhhbmRsZXMgZmx1c2hpbmcgdGhlIEhQVEUgZm9yIDY0
LWJpdCBIYXNoLg0KPiANCj4gQnV0IHRoZSBib29rcy8zMiB2ZXJzaW9uIG9mIHB0ZV91cGRhdGUo
KSBkb2Vzbid0IGRvIHRoYXQuIEluIGZhY3QNCj4gdGhlcmUncyBzb21lIEhQVEUgaGFuZGxpbmcg
aW4gX19zZXRfcHRlX2F0KCksIGJ1dCB0aGVuIGFsc28gYSBjb21tZW50DQo+IHNheWluZyBpdCdz
IGhhbmRsaW5nIGluIGEgc3Vic2VxdWVudCBmbHVzaF90bGJfeHh4KCkuDQo+IA0KPiBTbyB0aGF0
IGRvZXNuJ3QgcmVhbGx5IGhlbHAgbWFrZSBhIGRlY2lzaW9uIDopDQo+IA0KPiBPbiB0aGUgb3Ro
ZXIgaGFuZCwgY291bGQgeW91IGNvbnZlcnQgdGhvc2Ugc2V0X21lbW9yeV9hdHRyKCkgY2FsbHMg
dG8NCj4gY2hhbmdlX21lbW9yeV9hdHRyKCkgYW5kIHRoZW4gZXZlbnR1YWxseSBkcm9wIHRoZSBm
b3JtZXI/DQoNClN1cmUsIHRoYXQncyBwcm9iYWJseSB0aGUgYmVzdC4NCg0KSW5pdGlhbGx5IEkg
aGFkIHRvIGltcGxlbWVudCB0aGF0IHNldF9tZW1vcnlfYXR0cigpIHZhcmlhbnQgYmVjYXVzZSAN
CmNoYW5nZV9tZW1vcnlfYXR0cigpIHdhcyBkb2luZyBhIHB0ZV9jbGVhcigpIHRoYXQgd2FzICJz
YXdpbmcgb2ZmIHRoZSANCmJyYW5jaCB3ZSdyZSBzaXR0aW5nIG9uIi4gSW4gZXh0ZW5zbyBtYXJr
X3JvZGF0YV9ybygpIGNvdWxkbid0IHVzZSANCmNoYW5nZV9tZW1vcnlfYXR0cigpIHRvIGNoYW5n
ZSB0aGUgdGV4dCBzZWN0aW9uIHRvIHJlYWQtb25seSBiZWNhdXNlIA0KbWFya19yb2RhdGFfcm8o
KSBpcyBpdHNlbGYgaW4gdGhlIHRleHQgc2VjdGlvbi4NCg0KQnV0IG5vdyB0aGF0IGNoYW5nZV9t
ZW1vcnlfYXR0cigpIGlzIHVzaW5nIHB0ZV91cGRhdGUoKSBpbnN0ZWFkIG9mIGdvaW5nIA0Kdmlh
IGEgcHRlX2NsZWFyKCksIGl0J3MgcG9zc2libGUgdG8gdXNlIGl0LCBzbyB0aGF0J3Mgd2hhdCBJ
J2xsIGRvLg0KDQpUaGFua3MgZm9yIHRoZSBpZGVhLg0KQ2hyaXN0b3BoZQ==
