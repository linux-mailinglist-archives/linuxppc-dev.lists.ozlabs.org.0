Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF04EBE16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 11:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT1tn1ySpz308B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 20:52:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT1tH1jVSz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 20:51:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1HDgOy2f+i9a3C3xacFcYUMPofJ3cBT0Taf967kGCruCKniZ8c7VeUWXSsOtWd+EINhXmrFqUU4zXBVh3SDSRi7gKFlL4dtvMZfHdGodUFnyQvb68r9pCfVTFaFdTsI5S9kT57XU2NagpVtylLMtqQKsjZf0KxuaehCyMMdqwGbaxEvCkfKRijpt16G1fFio33hFAmb/V6LmwORtZ6kbS0PNjIbD5ZagB624A5rZfxvlTOGBhpbOaQihN2WmlzJ8wWO4R8s1rkXqT1PKhM2McvDC7gNW9Oio0pTBCYm3FFUWLndGI6yVFBwUjhWu9mvejGfs6TA5JKGPFP8XL7M+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCXA9cwycuoZMdIk9YhRtqC09qUJQmS07J1NzPPDk6E=;
 b=gemJMK91W2f8QaxurQOlYZ4aROY7czxqpZDNBlsHywIXKfG3NxQWQ/M3vzzl0dey1vG19x6W7fHr5n87NVUEm7a1yBayMVQ4UKK3mGYGiMzk2G2bOpQ80PvJKSaV1tL6uyqtTgIes5scyQoMymXwFkxkUlNH97G8adM45/Rxg0oNRFY0/KyzfG+7kLwRvaP95TgnXo+kkiUU/P4EzWATWCIYS+3+ZC8tFmjdskeWMwE0kimZCZwI+Zu0lGGF1BK/+ktteahMRSu8u2OHtWyc/4OiWhyoE2ienRqs15Z4tDiY9ubbP6s5zA6Qh2PfXt6XL0HHWp1YFnW7E4wfRz8LQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1899.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 09:51:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 09:51:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] recordmcount: Support empty section from recent binutils
Thread-Topic: [PATCH] recordmcount: Support empty section from recent binutils
Thread-Index: AQHX4UGxSaNKZM4HWEO/NeipaXxcJ6wVgNIAgAVOBoCAAAOUgIC7UkAAgAJQQ4A=
Date: Wed, 30 Mar 2022 09:51:27 +0000
Message-ID: <c81c544f-96d7-139f-4583-824f4791e162@csgroup.eu>
References: <cd0f6bdfdf1ee096fb2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu>
 <efc0e15e-fc93-fb59-068d-602f96ec7431@csgroup.eu>
 <20211129124355.52474d90@gandalf.local.home>
 <0b901c6f-9d42-11f6-4e44-df3bb1587456@csgroup.eu>
 <CACPK8XcM9LAWrc-eiir5gUN0Vb2Ca_ZMR-xF1Z_FoyWK8eqYbA@mail.gmail.com>
In-Reply-To: <CACPK8XcM9LAWrc-eiir5gUN0Vb2Ca_ZMR-xF1Z_FoyWK8eqYbA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc497b25-5d9b-4875-cb3e-08da1232dc5c
x-ms-traffictypediagnostic: PR0P264MB1899:EE_
x-microsoft-antispam-prvs: <PR0P264MB18991FD7345BEB83F964A399ED1F9@PR0P264MB1899.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VALc/WQIc+1ikHXkvbBiPV1k78yIX8W2pAMZLmtRgTi2l/CZmfQkQGVGaoGtvsbEP1Iqvf0b1RCuQjdFtKZvNcUhPeXzHlaKW9r/gE14PiWFzl+8ui91AzK3I4q+iYRMqqIEYsjKl1xAS/eVSkBfIc1RJjLM7RN7455PgTgB1dgsMUag64PIPaopX5BRc8DrawhoBULGFwuim9kmOizLG8fD0NQgWi+kkockBxss/hEeckPcEmqYETh/mZE0ycZhxseExQ3Gd8B3BOvMowjK5LAzkkPYHDZ5XkRUgg+arKtoAsx8hqeETvszdC/Ey0UsyHlfcWILf1jo88CDbqxvCjNnfevblEsUQf0Be713qGg7kmr362A2mtFUBUklIGuqqBpckuUFleQjKpLbyDSkBdVftQX8HU4/hKMy/JV+9EwrhfkTyf9o7Min9k7T0Ew2ug56TxpA09K/L1K6RFjK90+I7IdaXC76oxFF7lrusudzoAlc2sroiFxvHDRPoUejAmRvX4zPFFgWb4Bh19GI7cjUN5nzlObUzIW9FWAH07pFhnQZHRKdV+7ii7UkZs6ULHs++xQOrFrE4CS6XhclSHYOwV27WvyQW9VBqXvMB/CLKC4wFLnQUdQtcvbWWwa1pEGtGvZG5v9B+WsRkgaX1e09Fjbdk1NkecqhuqXxefI+0H5EjkcV5lRSdEqMmJ3z+MLC/Y8j0ontRJ0hD3MucDkLnUUSqI0v4YwLbN42q5h5p7uhxQC3cdTvV4titN40VypYH+RfYE5M7zqvODC6el1e0wWxPUIoOxyZw3ukTKMD2/+PkFrvYczLS2JPMWEqtX3rTRg2jafAyM9Rvzksvb72b7RFkpYGFvLQOWbt85N5shGiMdsi46Xt2G3ezIkTEVF/uA5nn1hSmZO48eB8jw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(71200400001)(66556008)(26005)(66946007)(54906003)(5660300002)(36756003)(66476007)(8936002)(38070700005)(31686004)(66446008)(64756008)(6512007)(6916009)(2906002)(6506007)(76116006)(2616005)(38100700002)(122000001)(83380400001)(966005)(8676002)(66574015)(6486002)(44832011)(86362001)(31696002)(316002)(4326008)(508600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2RTVVhVV1pnUWFPYkV1YkxDeFlxMVprZE5vMnBFblV0dnZEcEZnK3FpZEt2?=
 =?utf-8?B?RVdxMVRzelN3c2NCSjFtSitZcEpUOFdKZjhMMzU4VlUzMzB3SG9lWVZOK2JS?=
 =?utf-8?B?NDAyeE83MkpQZDJSSHZGTlhBd0tzRzV5MUdlZlowTitFaE52djZHTGVSYUFz?=
 =?utf-8?B?YnNNaTJNeTVqaTk0TUtqZU1jTUk3RXBERzB5ZkFLUkpVRFV6Z1Q5bmVOWWU3?=
 =?utf-8?B?MlM4SXkrQWdrcElQWm85M0FXbTdGbTFENThBcng0U1c4WHp4OVVjeGM3MkRw?=
 =?utf-8?B?YkVjWDQ5VzIwL1lad2tIa1ZIR0puUG1zTnBvRDk4YStNMy9TRWo5ZngvZlN1?=
 =?utf-8?B?QnllTnRFeGdXeGg5QXJYaE5hNCs0WkF0QysvYjIzVVpRQndqZG1TdG9uMkk5?=
 =?utf-8?B?Z1h5Qmcxa2NWcDBxK2IxcHJ4NldHTWM4RGxDN1JKWFo5VGJQVTREMFVicVMz?=
 =?utf-8?B?Zm9PbW1wbXd0T0JPaUxUL283S2F0dmEzVWdZSmlBSjNZQnpuTmFjZHN0N1VH?=
 =?utf-8?B?VGUrNDJWSDk3VEtORklkYzNtbDZDeDdjZDJsT2s1am1KaXVJUnVhcW1uRjh2?=
 =?utf-8?B?OHc3aXc2ZUpzUjFoVzVSblUwcUVmUExnSzdmTkxsVm1ScUdEVWNyNWI5QmEz?=
 =?utf-8?B?aDIyOURpQjFwdVBVcUcxOVNLaFB4TTVUc3ltZGdxR0tTQmNZbTRsY3NxSTVN?=
 =?utf-8?B?emx0Z2xkOTFkS1JMaTM2QmxRVDdFS0Z1TWZpc2c0THpyTEtzUTdGYVR0bG94?=
 =?utf-8?B?bm80Z0RIWDUyS2xOVVZqYllHUytWUEk5THlGajJhcUNDbHRGeG96NDRaR1Vw?=
 =?utf-8?B?L0tSY2V5M1UvZUpXUDZPdmZFcHJoN0J6S2RoUTd6VlJBNVMrZmNsMVJGbHZT?=
 =?utf-8?B?MWk4RXRIU1ZocnorUkh0WW9ZMEtJV1BTcm9oOXJwbmFFa0pid000ZGJqdFl4?=
 =?utf-8?B?bm5DWEZ5ZWhxRncvdmVtbHBmMnR3YnZtT0J1L213bDBRTjFzdjhYa01Wd3ly?=
 =?utf-8?B?d09XdmFiSDU0TndybmN2SUZsdllFVzNFOTdSVDNJUE51QnVkSDNlQnZLSUc0?=
 =?utf-8?B?UXRieFVtSkN6V1d4MG9RZGEzVFFGMlZMTVBycXpHRHpjK2kvZUxkRGJDTW9w?=
 =?utf-8?B?K29nOS9yZmNwYnVra2hXV3VWWVJxQ3c2eW4zWlJEVHFvdDVzMmsrdllQVTdE?=
 =?utf-8?B?RFJJYzNlajRRaDNoNHBJZVZLU2ZzN1FRSjRjY0tKclpmUDZDc2V6b1Q0UXoz?=
 =?utf-8?B?cExNNS9xTmRNVmt2dVFmQkpaVzJINHVZTVd6Q2NVYjRHdE9wbzZ6QmNFZGlo?=
 =?utf-8?B?NDQ1MmVwMEdnaUdSQ1ZVZnluZUdJMXdHbENNT2U3QzBJVGk2bld1ZGVRM3F3?=
 =?utf-8?B?SnlyR0UvSmQraC80N291NTdHQWxDeU0xYWNvS0lWNGo5WVBFUEY4blV3MnZu?=
 =?utf-8?B?SzVzZHZIUzRBYzJjRFYyUVVIdGdTY3N2alFRTmc1b2I2TThjbG9JdjdiTzJw?=
 =?utf-8?B?dTRBdXRzMjVnVXJzUk5EUC94UDMzMlpmbmZ6c1VVOXBNQlplRWtEaGE4YXZ0?=
 =?utf-8?B?NERxc2RWdHBjb0I4TjRnRVlScVI5U0N2QU13SG1FeXFQcUJFZTNNM2pDRmll?=
 =?utf-8?B?ZEh1cXdYSlUzRmkwcEVpMlhwbUtVY3doUWUvc2NjVmwrZFo2eml2MEViOGNo?=
 =?utf-8?B?anAxdDU0Q1pGaU9jK1czdHQ2WjVDQjRuMXdYbVF5b0lBV3orN3FTNk1zdHMr?=
 =?utf-8?B?cEF3ZmYxSGRRMkw1NnZ3V3hjcVQxWG5tSVpwaXV3d3Z2R3RGMUtlQkRGT1pi?=
 =?utf-8?B?Y21PQ3FxK3JWYjdWOFh1NGNoaE11L1JsN1dFVlliaXhkdzhUTHRrQkkrelFu?=
 =?utf-8?B?U21jRkdLVWFMUnRVeGNDVWhEZENGcDl1cWJQZmdERUgrTER0dkRVZ2FyNWVt?=
 =?utf-8?B?Z2NQTG1GdjZsWnd4cWlDYnRFeXdKa1RPRnZyK2hiN1FqV1pDSUk3Qk5HS1FY?=
 =?utf-8?B?Z1pURU9ZOWpuM2lwdkxTVFRVL3FxdGFyUkdyczBENFdmSU54R05tdExLcXRH?=
 =?utf-8?B?c2tmT2p4ZDUzUGpxaEt1R3BvNkprbG94Uk1ORnJ2ZGZkMXErUUI4UXZjN2c5?=
 =?utf-8?B?OGV1ZWgxU1FNNnVUcno2WXgzZWh0RnE2UVZ2VGpzdG9ER1dCT2RVdm0rWXRI?=
 =?utf-8?B?cEY1dUtLN29mL1hJeTg5dXg3aW9ROXFBaDBRWGRjT1dzQ3FYN0VtYmc1RERy?=
 =?utf-8?B?NVU3cW1IcTBKekpaMW9OdXdvOUVBVzA2U1JneGRuaS8zQnpnQi9qT0ZKTHZn?=
 =?utf-8?B?N0tuaFZUSzk2YjhOM1huTDRqUTRZTjZIUGM1T0MxVS9TKzYxeEV5WUsrVjdZ?=
 =?utf-8?Q?FanVyDGEiGPkESWJNpEVq25DIbJ7hi+aLw9Gl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5B24379BF4DC446AF227D151E36EC5F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc497b25-5d9b-4875-cb3e-08da1232dc5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 09:51:28.0455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTJXlbuI++BIqS3cZj3iYpb6M3PxRw0k3iUCcfL7nHOiJhQW/vd5PMpeOVQKT7SlY4IodwIW8GJwbNBg067P0C+NvTIxj0T0tn25G6k4vPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1899
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzAzLzIwMjIgw6AgMDA6MzEsIEpvZWwgU3RhbmxleSBhIMOpY3JpdMKgOg0KPiBP
biBNb24sIDI5IE5vdiAyMDIxIGF0IDIyOjQzLCBDaHJpc3RvcGhlIExlcm95DQo+IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMjkvMTEvMjAy
MSDDoCAxODo0MywgU3RldmVuIFJvc3RlZHQgYSDDqWNyaXQgOg0KPj4+IE9uIEZyaSwgMjYgTm92
IDIwMjEgMDg6NDM6MjMgKzAwMDANCj4+PiBMRVJPWSBDaHJpc3RvcGhlIDxjaHJpc3RvcGhlLmxl
cm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4+DQo+Pj4+IExlIDI0LzExLzIwMjEgw6AgMTU6NDMs
IENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXQgOg0KPj4+Pj4gTG9va3MgbGlrZSByZWNlbnQgYmlu
dXRpbHMgKDIuMzYgYW5kIG92ZXIgPykgbWF5IGVtcHR5IHNvbWUgc2VjdGlvbiwNCj4+Pj4+IGxl
YWRpbmcgdG8gZmFpbHVyZSBsaWtlOg0KPj4+Pj4NCj4+Pj4+ICAgICAgQ2Fubm90IGZpbmQgc3lt
Ym9sIGZvciBzZWN0aW9uIDExOiAudGV4dC51bmxpa2VseS4NCj4+Pj4+ICAgICAga2VybmVsL2tl
eGVjX2ZpbGUubzogZmFpbGVkDQo+Pj4+PiAgICAgIG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtl
ZmlsZS5idWlsZDoyODc6IGtlcm5lbC9rZXhlY19maWxlLm9dIEVycm9yIDENCj4+Pj4+DQo+Pj4+
PiBJbiBvcmRlciB0byBhdm9pZCB0aGF0LCBlbnN1cmUgdGhhdCB0aGUgc2VjdGlvbiBoYXMgYSBj
b250ZW50IGJlZm9yZQ0KPj4+Pj4gcmV0dXJuaW5nIGl0J3MgbmFtZSBpbiBoYXNfcmVsX21jb3Vu
dCgpLg0KPj4+Pg0KPj4+PiBUaGlzIHBhdGNoIGRvZXNuJ3Qgd29yaywgb24gUFBDMzIgSSBnZXQg
dGhlIGZvbGxvd2luZyBtZXNzYWdlIHdpdGggdGhpcw0KPj4+PiBwYXRjaCBhcHBsaWVkOg0KPj4+
Pg0KPj4+PiBbICAgIDAuMDAwMDAwXSBmdHJhY2U6IE5vIGZ1bmN0aW9ucyB0byBiZSB0cmFjZWQ/
DQo+Pj4+DQo+Pj4+IFdpdGhvdXQgdGhlIHBhdGNoIEkgZ2V0Og0KPj4+Pg0KPj4+PiBbICAgIDAu
MDAwMDAwXSBmdHJhY2U6IGFsbG9jYXRpbmcgMjIzODEgZW50cmllcyBpbiA2NiBwYWdlcw0KPj4+
PiBbICAgIDAuMDAwMDAwXSBmdHJhY2U6IGFsbG9jYXRlZCA2NiBwYWdlcyB3aXRoIDIgZ3JvdXBz
DQo+Pj4NCj4+PiBCZWNhdXNlIG9mIHRoaXMgcmVwb3J0LCBJIGhhdmUgbm90IGFwcGxpZWQgdGhp
cyBwYXRjaCAoZXZlbiB0aG91Z2ggSSB3YXMNCj4+PiBhYm91dCB0byBwdXNoIGl0IHRvIExpbnVz
KS4NCj4+Pg0KPj4+IEknbSBwdWxsaW5nIGl0IGZyb20gbXkgcXVldWUgdW50aWwgdGhpcyBnZXRz
IHJlc29sdmVkLg0KPj4+DQo+Pg0KPj4gSSBoYXZlIG5vIGlkZWEgb24gaG93IHRvIGZpeCB0aGF0
IGZvciB0aGUgbW9tZW50Lg0KPj4NCj4+IFdpdGggR0NDIDEwIChiaW51dGlscyAyLjM2KSBhbiBv
YmpkdW1wIC14IG9uIGtlcm5lbC9rZXhlY19maWxlLm8gZ2l2ZXM6DQo+Pg0KPj4gMDAwMDAwMDAw
MDAwMDAwMCBsICAgIGQgIC50ZXh0LnVubGlrZWx5IDAwMDAwMDAwMDAwMDAwMDAgLnRleHQudW5s
aWtlbHkNCj4+IDAwMDAwMDAwMDAwMDAwMDAgIHcgICAgRiAudGV4dC51bmxpa2VseSAwMDAwMDAw
MDAwMDAwMDM4DQo+PiAuYXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQNCj4+IDAwMDAw
MDAwMDAwMDAwMzggIHcgICAgRiAudGV4dC51bmxpa2VseSAwMDAwMDAwMDAwMDAwMDM4DQo+PiAu
YXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9ucw0KPj4NCj4+DQo+PiBXaXRoIEdDQyAxMSAoYmlu
dXRpbHMgMi4zNykgdGhlIHNhbWUgZ2l2ZXM6DQo+Pg0KPj4gMDAwMDAwMDAwMDAwMDAwMCAgdyAg
ICBGIC50ZXh0LnVubGlrZWx5IDAwMDAwMDAwMDAwMDAwMzgNCj4+IC5hcmNoX2tleGVjX2FwcGx5
X3JlbG9jYXRpb25zX2FkZA0KPj4gMDAwMDAwMDAwMDAwMDAzOCAgdyAgICBGIC50ZXh0LnVubGlr
ZWx5IDAwMDAwMDAwMDAwMDAwMzgNCj4+IC5hcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zDQo+
Pg0KPj4NCj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgcmVjb3JkbWNvdW50IGRyb3BzIHdlYWsgc3lt
Ym9scywgYW5kIGl0IGRvZXNuJ3QgZmluZA0KPj4gYW55IG5vbi13ZWFrIHN5bWJvbCBpbiAudGV4
dC51bmxpa2VseQ0KPj4NCj4+IEV4cGxpY2F0aW9uIGdpdmVuIGF0DQo+PiBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS4xNi1yYzIvc291cmNlL3NjcmlwdHMvcmVjb3JkbWNvdW50
LmgjTDUwNg0KPj4NCj4+IEkgaGF2ZSBubyBpZGVhIG9uIHdoYXQgdG8gZG8uDQo+IA0KPiBEaWQg
eW91IGVuZCB1cCBmaW5kaW5nIGEgc29sdXRpb24gZm9yIHRoaXMgaXNzdWU/DQo+IA0KDQpOb3Qg
cmVhbGx5LCBteSBzb2x1dGlvbiB3YXMgdG8gc3dpdGNoIHRvIHRoZSBrZXJuZWwgY29tcGlsZXIg
YXQgDQpodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rvb2wv
IHdoaWNoIGVtYmVkcyANCmJpbnV0aWxzIDIuMzYNCg0KQnV0IGl0IGxvb2tzIGxpa2UgdXNpbmcg
b2JqdG9vbCBpbnN0ZWFkIG9mIHJlY29yZG1jb3VudCBkb2Vzbid0IGV4aGliaXQgDQp0aGUgcHJv
YmxlbS4NCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRl
di9wYXRjaC8yMDIyMDMxODEwNTE0MC40MzkxNC00LXN2QGxpbnV4LmlibS5jb20vDQoNCkNocmlz
dG9waGU=
