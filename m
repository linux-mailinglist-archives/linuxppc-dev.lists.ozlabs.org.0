Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A8B4F77D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 09:40:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYtbJ5Rqtz3bbL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 17:40:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::624;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYtZm6Xsmz2xCC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 17:40:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFeJelp5ltz11Ni8ajljobaWnv+WhOYlnsw2xxD2ptKhmVuxknKtJW+HfkVPiZmW6kb7X6J5raf2m++IjjwPZRtjJ0aI9yiD1l2MJyUrSbrP5MVh6LSqGqPnO7bTS0GB/g4E9fJWpc9OLzIJeKiESxzAYDS7BAkVl/q/GIMzsKHuS7qapef+FuxQl1ldq2v9BgSOyD36Sj6PMtdU+zf000DZVIU61NhIvPFl1/BjsnTJyzjnqSXV2H/rXjxwvBfBc7hzUSnRBjSpyW8q+SJso4VFIb2Y+cHB4gd8q/K5/jaF6QsgDCBZ2DeEDdxhmJg8ugAGH1E9QTIFt4qHxGOJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QYkkrWO5FnSdkDADmisuxGnQZtwsfRv/4z9Lsmiwq8=;
 b=GBpPokdhARY8ksTFBaQqHg15UiYIJZp8b3jYKbbkcTbNeItze+3SskOG25JzPTLNqLfLgXv+qLuDtY5pb4v8n3ZEhc0gmb3fCajthfitzxtXWuvKsD4YDUgL+wDgX4KKbvqS6E3xE8NCbj45k3GpRgVtiPslXKx75EERd9iBVekzI9hH7xcsMKw4aKVsvgHUEiLqamqT0FlYJXvTGd01+6gwN6b3FCPv+TI9yS5yjggPqXetTuXgnNyZvYwgQev+Y/ZBrEvzGsnWQecW/0ltq4OYhTx++/NhYkNKFjpONkO5eAzLnxaxpsxQeDfWS/kE8bDSO64cwCyqkHV41I7fmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Thu, 7 Apr
 2022 07:39:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 07:39:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>, Russell Currey <ruscur@russell.cc>,
 "jniethe5@gmail.com" <jniethe5@gmail.com>
Subject: Re: [PATCH v5 3/8] powerpc/mm/ptdump: debugfs handler for W+X checks
 at runtime
Thread-Topic: [PATCH v5 3/8] powerpc/mm/ptdump: debugfs handler for W+X checks
 at runtime
Thread-Index: AQHYSef8/b7FSR/d5Uqv9yVajspvtqzkEYGA
Date: Thu, 7 Apr 2022 07:39:51 +0000
Message-ID: <237d8319-8127-c0fe-a855-ca04408bc925@csgroup.eu>
References: <20200226063551.65363-1-ruscur@russell.cc>
 <20200226063551.65363-4-ruscur@russell.cc> <202204061154.5A685C10D@keescook>
In-Reply-To: <202204061154.5A685C10D@keescook>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e294d770-a551-4493-31a9-08da1869ccf0
x-ms-traffictypediagnostic: PR1P264MB2094:EE_
x-microsoft-antispam-prvs: <PR1P264MB2094B2258394D48B812AE35CEDE69@PR1P264MB2094.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IUgN3TUdlR52HPp+DQ36SQoB8rdx2GoRZnQB6gC6LemIA8ivZhI6Fl9nm/R9rstjlhiFWBm9CX8aLAgyQj1ISy0RJbyLrmTqrKcBH+uCJh8eDqXJKoaq8mWDtMKE8ZTLdrsxwM7VuSXJ89rmmj5hG3t5MMO/L+r3gkYD5Lhi0U24lrJLbQ19mB+HdgRg405+JAVkmCbrA8spr56UTcvTiNlTUZ53aZ8B8ifnDet1kQbo60EArev5bWYNS3Itf599InGpiS7nsrBsX9W4QFLD7ENiYueyOY0rV7M2T5ob/NYYQAAmJHLFTi2ae1zqhrh9DWgdLMD7jSPdNwC8vOfN1HfsgJQsg6dzTzeYbVSpVBTueO4MDqPnNHVQ8xhi0JlhQmJ1jEZl0s26hy3wQ3c0Vu4Ra5Pkqv/PxnUBMLnRP50cEBHFdyBxEl/n4BMWie8mTiD+u+zVf7jOPeIrNbXbV0TcwP4jrvO3jdm9q7MT69ALFgWd341IsDJM4c9QDngd3fwGCM9hOnpHHhCKu0D1d08wx40TwUUF5XBdtFEHL+wYuiUPararpxJC/hAYSKvtZczk3L6RyZR9i+STP+52p/ysjzypUgeAPyo6ZkBrziRX4g8huIuU2oX0vQA/+1RSIBA3dr8mM1yXymf+pFBuk2TTe5Ll4QutKBA6/t9IV/HihBeLyE4ejfcyeB1FavZYsZLlhARoJX5rWL85YZLt36+R0kF+hgLonb9HnAMwEbeDOo1273ISqIeNV81cF8mPeRGhXi7XXnUandOqcZs5P7pOYFsvYvlYbFdgk9g/pLIjZKEqjnDBR/klhcuz65WzONsWRsMsnTPDF1VqOxZEBqbCDGdovdbm9VY3O24DFtQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(91956017)(66946007)(76116006)(6512007)(66446008)(66556008)(71200400001)(38070700005)(8676002)(38100700002)(8936002)(122000001)(508600001)(5660300002)(64756008)(4326008)(83380400001)(2906002)(2616005)(36756003)(54906003)(316002)(6486002)(966005)(6506007)(31696002)(44832011)(86362001)(110136005)(31686004)(26005)(186003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjUxcjcxSW9mdmJLVFZyZnBLamdaTlJCNldEbDdqZy9uL0xEQVQ5aDBMQWhV?=
 =?utf-8?B?RFpWK3lpekNhWXVJcnJUa1NzRVhXNytXOXNmWkc3MS8wVnBQRjUrS05GUlc3?=
 =?utf-8?B?UjJjVjR5bGZTb05nbnRHTUdMSkZ1UUQrS21IanRpc3dwWDZQc0psOUpkU1Nl?=
 =?utf-8?B?a0o5eTRyaVVsMElodmZxdjlRNkxYa28vREl3bXdGSXhDZG9VYW1YZ0pqVmE3?=
 =?utf-8?B?OUxzTVdTRzBGQzJEUmlydnAwNzF1NWtiSnlIWkZ5aHZ4elBZMjlTcWZlbXVY?=
 =?utf-8?B?QXcreDE4bWxSSHBSTjJGa0hnWkdsVE4yL3dEVlBwY2xKOEFuUFhrcG13VFFV?=
 =?utf-8?B?WWl3bWMweUQ5SGJFNWdTTlhBby8zbTc2WlU4VkZTOURIUTZEdkRMNldnT2Ry?=
 =?utf-8?B?MEVmMkM2aTVVclVSdjFqWXI2RXVWbGtwciswMnhLMnlSUEhTSjNrR3NyYk52?=
 =?utf-8?B?Wm1ZVFFlWjAxQXJtc0VUUmlFc0R1dWdOTzVHZk9YQ2lSQ1hJbjhaSzl4MkNI?=
 =?utf-8?B?Tk0vb1VJY1ZDWjJxb3ZWbS9DU2pLVGV6OFBqUWlTTGNoUkF3OFRkL1JpdjVh?=
 =?utf-8?B?dHc3YjJjcy92S0ZtU2x0M2QxNmJuN1d5ZjlDK3hsQitsSEs4cDF2ZXJyMmxS?=
 =?utf-8?B?RWtjbzlESWVXNTExelVPd2xINUZHWVhhTXZLOUZONzZRT0FUSzBvcXdHMjZr?=
 =?utf-8?B?UjBqM2ZmUU9yaW5kTlFuWDNkaXZLM0ZsT2lhSmkwS0JLTUhwUXMzY1haUnNm?=
 =?utf-8?B?SzBUT21rNTVsOE5aVENFMkNLaElEZXBoRkx6eU1FRW9QMytiaVdscDM3MlVQ?=
 =?utf-8?B?QUgxeXlWeEVicGlyYVZNWFlEa2hqYUVhR2tZTi9yVG92ZmMwbDh6Z3lkK1dP?=
 =?utf-8?B?ekpYUEJGSGx0K1Y3c1VjM2MrOXRNQitoMjhRZGtuODV1WVdObDl3WnpzWjdX?=
 =?utf-8?B?S05hZkFud3QzbjJWZVNPKzlWc1Vza3pEMnQzWkRTbmFQWEI4Mm5tMWhaOHlE?=
 =?utf-8?B?bi8zNFdmWFVONzZYNTl3TEV5MzJvcWUxckFyUlhQdkJtL05OTmpyZFYvWTI2?=
 =?utf-8?B?Vm1wQ203b2JOaEZrQzY0NVdDSk4wUmVTRGxaWmRlUW0xakdWV3dJMFcvb0tM?=
 =?utf-8?B?VDRYcnBGcGZwOE1HOHEyQnZBb0lUVVBWblNuT2xyS1A3OTdqb3pFUnlwQnUv?=
 =?utf-8?B?MGpzOGJzMDA1MkR4MXBrQjEzY0FUeGQ3NUVqaXNiTENEMkVEK2sxRTVoeFk4?=
 =?utf-8?B?S0RSR1ZvS2JYRG9OQWFGVGU2dXlWUVBvUlkwMThpZEJKS3lGTWM2SXA4T2kv?=
 =?utf-8?B?azRhOEphSnU3ZzcyazR6dTBKVllYckNvQXZlM2s2aGtra2MvZU5vMVVFWTBG?=
 =?utf-8?B?cW9RcGlzazlWYTBxZ2E0VnZJNTVoYjgxZ0t0dFo5RXZwbGNkNW5HZnNNQ3lK?=
 =?utf-8?B?YTlPWnIyYWsvMzZhVE1ac3dpREsvdEpkSzlnQnRsOFVEdWF6WU56emswT3hv?=
 =?utf-8?B?cUVtODVlMTdhZHVLRDZwbDlCVEQrZXVSY0FseGNiOWRRRVNiblY3aXBLSWtZ?=
 =?utf-8?B?UVdyY1lSU3dHSnE3bnVwM0FuUXZnaXY5ekRxQ2gvaytNZ3Y5RjJVcXZXMkFP?=
 =?utf-8?B?M0MraUJQSzROVFhhS0RncXlXeUhzTHJPaDZzeFNqUDArTVZLK242eDNyTWdS?=
 =?utf-8?B?RGtVaWpQcHZjaGRVc1hodFJDcWpuSDFEbngzZEpEV2tUck9XaGN5VzFveStK?=
 =?utf-8?B?UGlLbzBvdG44VFVZa2k5V095OEhRUTc2a29NN0xZWm5JYTJOS2hDVmRvUExN?=
 =?utf-8?B?bkRaYW5oV05tZVFJSjJ3ZVhGN2JnaGdLM2Viek9kV1hiU1VoWm5uN1liM0FI?=
 =?utf-8?B?MUhxT002Rk13WDlQNkVGVkVmTmhyamxkbEMweWlIM2ZRRjNTRTl1T040Qk05?=
 =?utf-8?B?YjVYbXoyeExkaWl3UVZEejZRN3RYQ2dCNm1MeGJxMXlzMUpUUC9JajdZbWtB?=
 =?utf-8?B?TEQwd3VuNVpqbENiTXp5SmlaZlJKVUVjQVNiTW92TUlZOFVyL1pZd05YRkkx?=
 =?utf-8?B?amxTeDB0OXNBdFZHUHoyY3VMSFgyZkRQNDh6WFlUSXUzd3hhS083dkhyVWlX?=
 =?utf-8?B?MDBMd1FNZDVlTXN3Zk5qajVGbU9ubVpjRWM2eEVzZ001SXR2Q3hCM2FpQVhE?=
 =?utf-8?B?RDZvL2hPZ0RTbXNrZTRueHI5aDZiUm16N0RvdzlOWktYVFRmbERmQ1E4cktR?=
 =?utf-8?B?bjNxdFNMSW4rM3FPMytZeXZzc3BZNFVJVUpFVkZzZS85UWRRdHFGdnBrYk1v?=
 =?utf-8?B?dHRiUlJNSktVTVhrcWxOQVVBY3ZwOSt6clh0WUJxY3pMZDhXeUZuRGkxYWNF?=
 =?utf-8?Q?0yIgX43+yHw+0t9jPYbX1sduVGWq7LI70nRc3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DCFD5FC02A19F4EB0BF3BF6E109475D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e294d770-a551-4493-31a9-08da1869ccf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 07:39:51.4491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esB891F80p0GZBmd4w+CgI2KyqlYvkLQ+1v61mIu4A6Hb7ynP+MFcNtPpTBMbvfY0Cy+sN6cmnPkmkmi3zQvutbbn9KBklv1ELPtCq2G9bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2094
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "dja@axtens.net" <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA0LzIwMjIgw6AgMjA6NTUsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiAqdGhy
ZWFkIG5lY3JvbWFuY3kqDQo+IA0KPiBJcyB0aGlzIHBhdGNoIHN0aWxsIHNvbWV0aGluZyBmb2xr
cyBhcmUgd29ya2luZyBvbj8gSXQnZCBiZSBuaWNlIHRvIGJlDQo+IGFibGUgdG8gdHJpZ2dlciB0
aGlzIGNoZWNrIGF0IHJ1bnRpbWUuDQoNClRoZSBzZXJpZXMgd2FzIHRha2VuIG92ZXIgYnkgSm9y
ZGFuLg0KDQp2MTUgb2YgdGhlIHNlcmllcyB3YXMgYWNjZXB0ZWQsIGJ1dCB0aGF0IHBhcnRpY3Vs
YXIgcGF0Y2ggd2FzIGRyb3BwZWQgaW4gDQp2MTEgKHNlZSANCmh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvY292ZXIvMjAyMTA0MjkwMzE2MDIuMjYwNjY1
NC0xLWpuaWV0aGU1QGdtYWlsLmNvbS8pDQoNClRoZSBjb21tZW50IHdhczoNCg0KU29tZSBwYXRj
aGVzIHdlcmUgZHJvcHBlZCBmcm9tIHRoaXMgcmV2aXNpb246DQogICBwb3dlcnBjL21tL3B0ZHVt
cDogZGVidWdmcyBoYW5kbGVyIGZvciBXK1ggY2hlY2tzIGF0IHJ1bnRpbWUNCiAgICAgLSBXaWxs
IHVzZSBDaHJpc3RvcGhlJ3MgZ2VuZXJpYyBwdGR1bXAgc2VyaWVzDQoNCk5vdCBzdXJlIHdoYXQg
aGFwcGVuZWQgYWZ0ZXIgdGhhdC4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiAtS2Vlcw0KPiANCj4g
T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDU6MzU6NDZQTSArMTEwMCwgUnVzc2VsbCBDdXJyZXkg
d3JvdGU6DQo+PiBWZXJ5IHJ1ZGltZW50YXJ5LCBqdXN0DQo+Pg0KPj4gCWVjaG8gMSA+IFtkZWJ1
Z2ZzXS9jaGVja193eF9wYWdlcw0KPj4NCj4+IGFuZCBjaGVjayB0aGUga2VybmVsIGxvZy4gIFVz
ZWZ1bCBmb3IgdGVzdGluZyBzdHJpY3QgbW9kdWxlIFJXWC4NCj4+DQo+PiBVcGRhdGVkIHRoZSBL
Y29uZmlnIGVudHJ5IHRvIHJlZmxlY3QgdGhpcy4NCj4+DQo+PiBBbHNvIGZpeGVkIGEgdHlwby4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEN1cnJleSA8cnVzY3VyQHJ1c3NlbGwuY2M+
DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcuZGVidWcgICAgICB8ICA2ICsrKyst
LQ0KPj4gICBhcmNoL3Bvd2VycGMvbW0vcHRkdW1wL3B0ZHVtcC5jIHwgMjEgKysrKysrKysrKysr
KysrKysrKystDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcuZGVidWcg
Yi9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1Zw0KPj4gaW5kZXggMGIwNjM4MzBlZWE4Li5lMzc5
NjBlZjY4YzYgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1Zw0KPj4g
KysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcuZGVidWcNCj4+IEBAIC0zNzAsNyArMzcwLDcgQEAg
Y29uZmlnIFBQQ19QVERVTVANCj4+ICAgCSAgSWYgeW91IGFyZSB1bnN1cmUsIHNheSBOLg0KPj4g
ICANCj4+ICAgY29uZmlnIFBQQ19ERUJVR19XWA0KPj4gLQlib29sICJXYXJuIG9uIFcrWCBtYXBw
aW5ncyBhdCBib290Ig0KPj4gKwlib29sICJXYXJuIG9uIFcrWCBtYXBwaW5ncyBhdCBib290ICYg
ZW5hYmxlIG1hbnVhbCBjaGVja3MgYXQgcnVudGltZSINCj4+ICAgCWRlcGVuZHMgb24gUFBDX1BU
RFVNUCAmJiBTVFJJQ1RfS0VSTkVMX1JXWA0KPj4gICAJaGVscA0KPj4gICAJICBHZW5lcmF0ZSBh
IHdhcm5pbmcgaWYgYW55IFcrWCBtYXBwaW5ncyBhcmUgZm91bmQgYXQgYm9vdC4NCj4+IEBAIC0z
ODQsNyArMzg0LDkgQEAgY29uZmlnIFBQQ19ERUJVR19XWA0KPj4gICAJICBvZiBvdGhlciB1bmZp
eGVkIGtlcm5lbCBidWdzIGVhc2llci4NCj4+ICAgDQo+PiAgIAkgIFRoZXJlIGlzIG5vIHJ1bnRp
bWUgb3IgbWVtb3J5IHVzYWdlIGVmZmVjdCBvZiB0aGlzIG9wdGlvbg0KPj4gLQkgIG9uY2UgdGhl
IGtlcm5lbCBoYXMgYm9vdGVkIHVwIC0gaXQncyBhIG9uZSB0aW1lIGNoZWNrLg0KPj4gKwkgIG9u
Y2UgdGhlIGtlcm5lbCBoYXMgYm9vdGVkIHVwLCBpdCBvbmx5IGF1dG9tYXRpY2FsbHkgY2hlY2tz
IG9uY2UuDQo+PiArDQo+PiArCSAgRW5hYmxlcyB0aGUgImNoZWNrX3d4X3BhZ2VzIiBkZWJ1Z2Zz
IGVudHJ5IGZvciBjaGVja2luZyBhdCBydW50aW1lLg0KPj4gICANCj4+ICAgCSAgSWYgaW4gZG91
YnQsIHNheSAiWSIuDQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9wdGR1
bXAvcHRkdW1wLmMgYi9hcmNoL3Bvd2VycGMvbW0vcHRkdW1wL3B0ZHVtcC5jDQo+PiBpbmRleCAy
MDYxNTYyNTUyNDcuLmExNWUxOWEzYjE0ZSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9t
bS9wdGR1bXAvcHRkdW1wLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9wdGR1bXAvcHRkdW1w
LmMNCj4+IEBAIC00LDcgKzQsNyBAQA0KPj4gICAgKg0KPj4gICAgKiBUaGlzIHRyYXZlcnNlcyB0
aGUga2VybmVsIHBhZ2V0YWJsZXMgYW5kIGR1bXBzIHRoZQ0KPj4gICAgKiBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgdXNlZCBzZWN0aW9ucyBvZiBtZW1vcnkgdG8NCj4+IC0gKiAvc3lzL2tlcm5lbC9k
ZWJ1Zy9rZXJuZWxfcGFnZXRhYmxlcy4NCj4+ICsgKiAvc3lzL2tlcm5lbC9kZWJ1Zy9rZXJuZWxf
cGFnZV90YWJsZXMuDQo+PiAgICAqDQo+PiAgICAqIERlcml2ZWQgZnJvbSB0aGUgYXJtNjQgaW1w
bGVtZW50YXRpb246DQo+PiAgICAqIENvcHlyaWdodCAoYykgMjAxNCwgVGhlIExpbnV4IEZvdW5k
YXRpb24sIExhdXJhIEFiYm90dC4NCj4+IEBAIC00MTMsNiArNDEzLDI1IEBAIHZvaWQgcHRkdW1w
X2NoZWNrX3d4KHZvaWQpDQo+PiAgIAllbHNlDQo+PiAgIAkJcHJfaW5mbygiQ2hlY2tlZCBXK1gg
bWFwcGluZ3M6IHBhc3NlZCwgbm8gVytYIHBhZ2VzIGZvdW5kXG4iKTsNCj4+ICAgfQ0KPj4gKw0K
Pj4gK3N0YXRpYyBpbnQgY2hlY2tfd3hfZGVidWdmc19zZXQodm9pZCAqZGF0YSwgdTY0IHZhbCkN
Cj4+ICt7DQo+PiArCWlmICh2YWwgIT0gMVVMTCkNCj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPj4g
Kw0KPj4gKwlwdGR1bXBfY2hlY2tfd3goKTsNCj4+ICsNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0K
Pj4gKw0KPj4gK0RFRklORV9TSU1QTEVfQVRUUklCVVRFKGNoZWNrX3d4X2ZvcHMsIE5VTEwsIGNo
ZWNrX3d4X2RlYnVnZnNfc2V0LCAiJWxsdVxuIik7DQo+PiArDQo+PiArc3RhdGljIGludCBwdGR1
bXBfY2hlY2tfd3hfaW5pdCh2b2lkKQ0KPj4gK3sNCj4+ICsJcmV0dXJuIGRlYnVnZnNfY3JlYXRl
X2ZpbGUoImNoZWNrX3d4X3BhZ2VzIiwgMDIwMCwgTlVMTCwNCj4+ICsJCQkJICAgTlVMTCwgJmNo
ZWNrX3d4X2ZvcHMpID8gMCA6IC1FTk9NRU07DQo+PiArfQ0KPj4gK2RldmljZV9pbml0Y2FsbChw
dGR1bXBfY2hlY2tfd3hfaW5pdCk7DQo+PiAgICNlbmRpZg0KPj4gICANCj4+ICAgc3RhdGljIGlu
dCBwdGR1bXBfaW5pdCh2b2lkKQ0KPj4gLS0gDQo+PiAyLjI1LjENCj4+DQo+IA==
