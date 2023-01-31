Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ADE682472
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 07:34:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5ZzG3vLyz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LXhdS4/L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.20.60; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LXhdS4/L;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5ZyG1zSdz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 17:33:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqsPZmPafU9h7opj7vp4MBbaLJWOKUL83F5qZvpQb988y6ayf++OL/WbjdFN0thEo9KnzZVvEwtOnABI2Gnafjg8DEBQSIZKwWsaRp8re3Tmh+adwLEhGsY9QnQyt4PySkBzJoilJYACJ+kp10PDqFNC3k1e4V40C/aERc00gi/jrnJA4OjlNv+qCm40Va0irV1wxLvkb/8LaJLMii+aWzAkHzTI2bgK2S6RZk0u7gEDV7Y1YlF4YH9aaS1z0QujYabGIXD9mHSNKZiVEeO2oaqmWPi7XSxj1hGAJdmhHMeno3ZTdCM0PLDg9H08wVPf+mn+eZ5JGhGf5ygKefVKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zYxtpv8ht/pdZ1/UNdvuyeub4Xlau09ZNTxJfuJwY8=;
 b=TUolWdbKoDHJmJWbJ6xIQuDDa9HJlnAaJFOE+kawXt7JxVe3QIkn7SGxhrG00Gq+Kva9XDkMlJ5OoCG5vw5VxtcRmou0W7rQ3Mxk//cl2w1fkh5hjDuQMFCExl1kMByK/C1rT0JVe2mCRcVDIwkBdXVM1zPPHKReFo5qEkTspSBA3DVeQhv1w+QcflUww0Dqf5k3dVlknQxtny0HLR2Uy0VO1WwKTx7XGOV/EePm5AcHYGIFYifPSjhTkgRGFyr04fX4oy0rEPbrHS0t3YloYhdfTGYY2ATDhEWhg1wlNfyFEBm7zhOS4dI9w/Dhfm/FUjf4rUgVwBTrvwlRtu+6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zYxtpv8ht/pdZ1/UNdvuyeub4Xlau09ZNTxJfuJwY8=;
 b=LXhdS4/LsO2xzhW0Hp4Ac5Jv0ERcyLI5C4NLggJDO2SO238AGi3aHhmuQvfNiYh3U4Xw3mszE5uWxkO0pZa33/230aWnXiK0P4hUrQ5kF4XFhhno1KAUcSM8GROu5o8KrAtLrELluErB4COJI1e8H1j5GqxceYTdUdLF5JPxZPKt7kz/Xi4IGdKgOGoFxlmGVrgrOdu2BBxo7I84yteCQ9Zd5zKPFXJ+Pb0iqlk1bGJ40DfVRCdGISJsOC8myG+WvO4grNCgiD0KSNnOyR8bdpgJe5+aqPk8isAkZ2xJs1yAdsHCrn8VW8pGV/Uf8wDb8wpk5IYhaS6oPvPzPJZZJQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1866.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 06:33:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 06:33:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/tlb: Implement book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Topic: [PATCH] powerpc/tlb: Implement book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Index: AQHZNR/tYZTE+/A9A0SyFlqRUThyaa64EaIA
Date: Tue, 31 Jan 2023 06:33:34 +0000
Message-ID: <2de01197-54b6-0e96-5615-3cd212cfec83@csgroup.eu>
References: <20230131025817.279417-1-bgray@linux.ibm.com>
In-Reply-To: <20230131025817.279417-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1866:EE_
x-ms-office365-filtering-correlation-id: a531f305-6a33-4fb7-5063-08db03551427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  x3hoyCPUaZU+f3Q83qPSbof3MB0OJhvQk52b4ydOJtWoaB60/uOuIOU3wW04myI5VTMFNHOSQkzDQq3ceyxXp5077uyN1F/2kZp23oNXqHFekzquW2TLwjWSfqkMdbq2Y4/KG8+y8uBUSPKwdfYkxe/c9M7lHpL2CfAXlKYWY8R59eUz+nB0260YrO8hsW8rgZcy6Zd/UdSQzGt9DakAiHgISHHVvVQjmldAacCb6vS1hChTx90mwui7GABaBXdkA0rojWbkGmL6mgFK4nGDqrCIVoZfyoNeFILiADOEDQf7Rmhh68fbrYjOIn+jyUH5lTyjKMahy50sCWRDIgtlk2JRrxH8peVB/Y1V/WpizrZATB38YHTrZHYqLIPUn6IfGz9LjEOhvy7Er58jIKqUCpd0n1Ng3kJ/3m1j3HGwbq5k/9MU2sS+cVxsAUR2eJKn5M93lpIXe0ffZPrRR+Esvzya2ALW3BzsgP8IKwFsv4psUoZMuQ0TkHFbnFMv+nAf3KpQVv/etHeEyD4ylTJt87JvoWmxOzGIpqGWLfQGSjm1zm1clAKx4IAIXe9BmU/tThqHticucD8hrxRuLAb4M9gOmXgp8LNiOq/4lvYODmg9jqj3+SO8Fc4UQlCX/GJ5lzrn1N+DcWMJBLIPRuVlyPfD4rzIgLACjHhTR20iBHFHGMhoxUbXyQMQDj0cLjE6dedLdQaoMWKWfYiOdJ2MJeCBWWpTYTB23CLF4JxITT0xHs1W2MLv4G4uBS+0dcfFU6cTX6kRKT/2N2leasmRxBzQW7tpVqTNWvfbSWUwsMzKtTId3iW87EecDO0wFfxA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(478600001)(76116006)(966005)(6486002)(91956017)(54906003)(5660300002)(38100700002)(122000001)(6512007)(86362001)(110136005)(31696002)(186003)(26005)(2616005)(38070700005)(316002)(8936002)(41300700001)(36756003)(44832011)(6506007)(83380400001)(4326008)(71200400001)(2906002)(64756008)(66556008)(66476007)(66446008)(66946007)(8676002)(31686004)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?clR6VkhuYzVZZzB3dWFQMjJmZVkwdnhvNkFUUmVYajZPRUNVREwwUU1HWmxn?=
 =?utf-8?B?cHlQbVI3aXhrWVQyK1RhVEp0VGNRT25lelNHNEhiM2k1dTl4UXRGbFl3WFVB?=
 =?utf-8?B?bE5ZNUNqVC9peFNwY1BYZlBMWjJsOU5ZczFmYS9uS1l0cExudTd5bm9QZjJN?=
 =?utf-8?B?a2FIZlE3NG9IMEdCU0gydDdyVDVrU0hjaEFMcHJoTHh2UnhWL3p3WkpwYUZJ?=
 =?utf-8?B?VGMvdTNaVis5Z1ZPTk9uUnluRVQrZ3crdmsrOWVGQnprUlBLVnRxZktvN3dY?=
 =?utf-8?B?ZXhudjlpcjFZNk0rT3RRQ2xOdHlJV2tuUFh5M1c3a2RKbW5oeVF3Z3QzemRu?=
 =?utf-8?B?WkU3SGt1UG5YZFhRbWw5MFFEdU9oUzhpQlVrbm45b2NkbHFMRXA2b1dOeCtW?=
 =?utf-8?B?T0lDdVBtYnZuNHBnR1ZEUmlZazVVUnI5eTQ5T0l6T00yNEpmMlpOeE92eUdF?=
 =?utf-8?B?SFRrSzNhM0VIY0Fnb0tnWFU4MWNGbmM3bGloV0lubGp4a1MzZEx3M1pONDJC?=
 =?utf-8?B?NitzNEUvc3g5eHhPTkc3Z1gwdEhnMCtObHpVblYrQ05hRjBZTkc3cE9lSWVt?=
 =?utf-8?B?bXErZ3RCOTR5Y1cza2p4ejNNbUtvMU51UE14MnR1SG0ycnhOc3pnaUJzMlNT?=
 =?utf-8?B?OHMzQ0p1YXRJNzZ6bGtHMDdvbGRzZ0lIbGh3ZEFET2ZoNmtaaWFGbzJmTzUv?=
 =?utf-8?B?SDJNR0ZXZXRGQjBPYUwrKzFDM2hUNkhMWGxuZjhTM3NFeGsvYllnc3R2UHBi?=
 =?utf-8?B?MVQ4Q2RRNkNXQnFIRDg5ZG00bzVYUHdqVXBqaCtSS2NVVEJQemtLUjhvRHVn?=
 =?utf-8?B?NXpsYnZWVWZESE5pMFlIVzFibUJudWxuaTczYzFsZDV4V3YyWTJKbzFvcFpi?=
 =?utf-8?B?UDB6Nzc0WW1XUkYyUmxEUitqWHpHZTBJemQ1bkEzL1NQQlRTQVlERFFHaWk4?=
 =?utf-8?B?TFJWOWQ3Y2lPV3dmZHRMdlovUTFmZVc4RTZPa1JQUkNrTi9JY0IzQTNOelc3?=
 =?utf-8?B?SEk0TFZlYkpqR3NlOFFEalE1WDhjWWxkSWkvR1NYN1VZQURvUksyWmFBTEQx?=
 =?utf-8?B?bkZGVmxBWEhucWc2YkY5ZmtnREhSSFA3eElYS2xMYVI2RWQzcVY1L2dhTTJO?=
 =?utf-8?B?OWNuTWZ6ZkI1K2h2STFsbWR5aHczKzFMYW43d09oWXJBaXNHVUZDVHF3cGZI?=
 =?utf-8?B?eFZud3YxUEUraVBFaWVEb1FEaC9XaHlNTlk1WnAvTkRRSFhtV2Y2RXdqN2M5?=
 =?utf-8?B?c3pRZCs0aEhZWWtaUDVDdHN4S1A5S1ZmS2ViTUxaR1QrUUFpb0N4MUdaK1dM?=
 =?utf-8?B?U0VLTVEvcVpkakNqUEkvMkRITC9GdG9uRXlqc0VFaWl2dGVJN1FMa094aTRs?=
 =?utf-8?B?enBBS3luS0tvazZZWEttZ1ZKOG1mQjBTUU1XVWNLQkZyVFVTWlV6ekxtTlFH?=
 =?utf-8?B?NHhmYndYYUh0VThwU2x0K2pxUzlpeTF5U2lDVUc4RGN4Y2RyRWlmczZVWFNW?=
 =?utf-8?B?Vks5bnl6T3JDL0RlZ0tKeFJ6RzFScHRnV0hVRmp4YUk3NEVLYUwveFU4b1lW?=
 =?utf-8?B?MitoQ3pOaWZCNzZiVWlpV0ZlMHkvMGFWd3lHQitNNDJmVzhxQjdhSjcyem5C?=
 =?utf-8?B?aU14bW1LeGVJa0MvZGxrT3R6MVI2Zjhuc0RTZHBYSDVYbWRhSHQ5T1pUVk5Y?=
 =?utf-8?B?ZmxEOHJFNzVaTTFoUHh6OEpjdC8xdlZsMjhyZ1VYbVI5TFhxTkt6K1pJcGJH?=
 =?utf-8?B?VWJkUmdYNnVjaHF2M21ERkE5aEZML2FPYkNrR1J6NCtpZTlXbTREUTh1RGlW?=
 =?utf-8?B?NXNqUFRVaGowQzlkamxBa3dsb3h0eTl5SWlXWkVKV3M1U09Ec1UxV1QrenRC?=
 =?utf-8?B?NjlFWGE3bU9vRGw5TmxxYzYyVU0wT00wMW8vK1VqWjd5LzdyUDVHZGw3bDR2?=
 =?utf-8?B?RU85RXBOVnBUS21PYWpvbWF4MWp0Z3FsWXE2ajA3aUFlOXBYZ3k0ZGJqWDdj?=
 =?utf-8?B?cSt3UWxMUldMQnlGWWdVOXpDeFRQSHVrdjlueCs5L3V3QXIwM1VKdjhmOEFT?=
 =?utf-8?B?cHJNeml0QjdoM2J4VkVvVW1vK3NtS3ZyQkRaZDArdCtvbms1dk1hZXA5WUVo?=
 =?utf-8?B?KzhXSnFtN0tnZVRXYktHRFBBMW5paG9sWnJ5R1dxVS9kVFZWRHNhSmtSY2Ev?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FCD0D8C9C7F974B9E3C39E18D59A284@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a531f305-6a33-4fb7-5063-08db03551427
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 06:33:34.7813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCj7nL7a+3KeZBtn1/l1PqXT68do4RuyUtfjHtqwgnr/G5hEKjG6TlM/mGgYDRPtcTerYbY06OdCqEgnudZVnUMht+MxPrD2U2maUZktNZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1866
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzAxLzIwMjMgw6AgMDM6NTgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGNvbW1pdCBpbnRyb2R1Y2luZyB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGVkIGl0IGFzIGEg
YnVpbGQgYnVnIG9uIHRoaXMNCj4gcGxhdGZvcm0gdG8gbWFrZSB0aGUgY29tcGlsZXIgaGFwcHks
IGFzIHRoZSBvbmx5IHVzZSBpbiB0aGUgY29kZSBpcyBndWFyZGVkDQo+IGJlaGluZCBhIHJhZGl4
X2VuYWJsZWQoKSBjb25kaXRpb25hbC4NCj4gDQo+IEdDQyByZWNvZ25pc2VzIHRoYXQgY3B1X2hh
c19mZWF0dXJlKE1NVV9GVFJfVFlQRV9SQURJWCkgcmV0dXJucyBmYWxzZSBvbiB0aGlzDQo+IHBs
YXRmb3JtIGFuZCBlbGltaW5hdGVzIHRoZSBidWlsZCBidWcgYXMgZGVhZCBjb2RlLiBIb3dldmVy
LCB3aGVuDQo+IENPTkZJR19KVU1QX0xBQkVMX0ZFQVRVUkVfQ0hFQ0tfREVCVUcgaXMgZW5hYmxl
ZCwgdGhlIGFzc2VydGlvbiBhbmQgcG9zc2libGUNCj4gY2FsbCB0byBlYXJseV9jcHVfLi4uIHBy
ZXZlbnRzIENsYW5nIGZyb20gZWxpbWluYXRpbmcgYW55IGNvZGUgdGhhdCdzDQo+IGNvbmRpdGlv
bmFsIG9uIHRoZSByZXR1cm4gdmFsdWUuIFNvIENsYW5nIHRyaWdnZXJzIHRoZSBidWlsZCBidWcg
YXMgcmVwb3J0ZWQNCj4gYnkgdGhlIGtlcm5lbCB0ZXN0IHJvYm90Og0KDQpJIHN0aWxsIHRoaW5r
IGl0IGlzIG5vdCB0aGUgY29ycmVjdCBmaXguIFlvdSBhcmUgcHV0dGluZyB0aGUgcHJvYmxlbSAN
CnVuZGVyIHRoZSBjYXJwZXQgaW5zdGVhZCBvZiBmaXhpbmcgaXQuIFRoZXJlIGFyZSBtYW55IG90
aGVyIHBsYWNlcyB3aGVyZSANCnJhZGl4X2VuYWJsZWQoKSBvciBvdGhlciBtbXVfaGFzX2ZlYXR1
cmUoKSBhcmUgdXNlZCB3aXRoIHRoZSBleHBlY3RhdGlvbiANCnRoYXQgb25lIGxlZyB3aWxsIGJl
IGVsaW1pbmF0ZWQgYXQgYnVpbGQgdGltZS4NCg0KQXMgd3JpdHRlbiBpbiBwcmV2aW91cyB0aHJl
YWQsIGhhdmUgeW91IGNvbnNpZGVyZWQgcmV3b3JraW5nIA0KbW11X2hhc19mZWF0dXJlKCkgdG8g
bW92ZSB0aGUgQ09ORklHX0pVTVBfTEFCRUxfRkVBVFVSRV9DSEVDS19ERUJVRyANCmFmdGVyIHRo
ZSBiZWxvdyBibG9jazoNCg0KCWlmIChNTVVfRlRSU19BTFdBWVMgJiBmZWF0dXJlKQ0KCQlyZXR1
cm4gdHJ1ZTsNCg0KCWlmICghKE1NVV9GVFJTX1BPU1NJQkxFICYgZmVhdHVyZSkpDQoJCXJldHVy
biBmYWxzZTsNCg0KDQpBbmQgYXMgdGhpcyBsb29rcyBsaWtlIGEgQ2xhbmcgYnVnIG9yIGxpbWl0
YXRpb24sIGNhbiB5b3UgcHJvdmlkZSB1cyANCndpdGggYSBsaW5rIHRvIHRoZSBDbGFuZyBpc3N1
ZSB5b3UgaGF2ZSBvcGVuZWQgZm9yIGl0ID8NCg0KDQpMb29raW5nIGludG8gaXQgaW4gbW9yZSBk
ZXRhaWxzLCBJJ20gZXZlbiBtb3JlIHB1enpsZWQuIEFzIGZhciBhcyBJIGNhbiANCnNlZSwgbG9j
YWxfZmx1c2hfdGxiX3BhZ2VfcHNpemUoKSBpcyB1c2VkIG9ubHkgYXQgb25lIHBsYWNlLCB0aGF0
IGlzIA0KZnVuY3Rpb24gX19kb19wYXRjaF9pbnN0cnVjdGlvbl9tbSgpLiBTbyBpZiBDbGFuZyBm
YWlscyB0byBpZGVudGlmeSBpdCANCmFzIGEgZGVhZCBsZWcsIGl0IGlzIHRoZSBmdWxsIF9fZG9f
cGF0Y2hfaW5zdHJ1Y3Rpb25fbW0oKSB3aGljaCBpcyBrZXB0IA0KZm9yIG5vIHJlYXNvbi4NCg0K
T24gdGhlIG90aGVyIGhhbmQsIEkgc2VlIHRoYXQgbG9jYWxfZmx1c2hfdGxiX3BhZ2VfcHNpemUo
KSBpbXBsZW1lbnRlZCANCmZvciBub2hhc2gvMzIsIHNvIHllcyB3ZSBjYW4gYWxzbyBpbXBsZW1l
bnQgaXQgZm9yIGJvb2szcy8zMi4gQnV0IHRoZW4gDQp0aGUgY29tbWl0IGxvZyBzaG91bGQgZXhw
bGFpbiB0aGluZ3MgZGlmZmVyZW50bHkuDQoNCkJ5IHRoZSB3YXksIEkgYWxzbyBzZWUgdGhhdCBs
b2NhbF9mbHVzaF90bGJfcGFnZV9wc2l6ZSgpIGZvciBib29rM3MvNjQgDQpkb2VzIGp1c3Qgbm90
aGluZyBhdCBhbGwgZm9yIG5vbiBSYWRpeC4gSXMgdGhhdCBjb3JyZWN0ID8NCg0KVGhhbmtzDQpD
aHJpc3RvcGhlDQoNCg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGx2bS8yMDIzMDEy
MTIzNDguZURrb3d2ZkYtbGtwQGludGVsLmNvbQ0KPiANCj4gRml4ZXM6IDI3NGQ4NDJmYTFlZiAo
InBvd2VycGMvdGxiOiBBZGQgbG9jYWwgZmx1c2ggZm9yIHBhZ2UgZ2l2ZW4gbW1fc3RydWN0IGFu
ZCBwc2l6ZSIpDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4N
Cj4gLS0tDQo+IA0KPiBTdXBlcnNlZGVzIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMzAxMjQyMTU0MjQuOTA2OC0xLWJncmF5QGxpbnV4
LmlibS5jb20vDQo+IA0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNz
LzMyL3RsYmZsdXNoLmggfCA0ICstLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy8zMi90bGJmbHVzaC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jv
b2szcy8zMi90bGJmbHVzaC5oDQo+IGluZGV4IDRiZTU3MjkwODEyNC4uY2RlM2I2ZjVkNTYzIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3RsYmZsdXNo
LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi90bGJmbHVzaC5o
DQo+IEBAIC0yLDggKzIsNiBAQA0KPiAgICNpZm5kZWYgX0FTTV9QT1dFUlBDX0JPT0szU18zMl9U
TEJGTFVTSF9IDQo+ICAgI2RlZmluZSBfQVNNX1BPV0VSUENfQk9PSzNTXzMyX1RMQkZMVVNIX0gN
Cj4gDQo+IC0jaW5jbHVkZSA8bGludXgvYnVpbGRfYnVnLmg+DQo+IC0NCj4gICAjZGVmaW5lIE1N
VV9OT19DT05URVhUICAgICAgKDApDQo+ICAgLyoNCj4gICAgKiBUTEIgZmx1c2hpbmcgZm9yICJj
bGFzc2ljIiBoYXNoLU1NVSAzMi1iaXQgQ1BVcywgNnh4LCA3eHgsIDd4eHgNCj4gQEAgLTgwLDcg
Kzc4LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90
bGJfcGFnZV9wc2l6ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gICAJCQkJCSAgICAgIHVuc2ln
bmVkIGxvbmcgdm1hZGRyLCBpbnQgcHNpemUpDQo+ICAgew0KPiAtCUJVSUxEX0JVRygpOw0KPiAr
CWZsdXNoX3JhbmdlKG1tLCB2bWFkZHIsIHZtYWRkciArIFBBR0VfU0laRSk7DQo+ICAgfQ0KPiAN
Cj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX21tKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tKQ0KPiANCj4gYmFzZS1jb21taXQ6IGNhMjcyNzUxYmExOGNhOGYxMzdhZjYzMWNiYzlm
M2Y5ODdmYWI2ZTMNCj4gLS0NCj4gMi4zOS4xDQo=
