Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9975593F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 09:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTpCZ3vpBz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 17:09:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=c/RuoMoO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.87; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=c/RuoMoO;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90087.outbound.protection.outlook.com [40.107.9.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTpBm4Rdtz3bd4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 17:09:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU6ob+QnwL0qRVa2pHZmI9IetD0KHWaLFJOIvgWnbBjzT7F8K3RVW8fnPVhmoYlgXlhom9SDcZ4pk/NCXnUhuwC0UBrYoLrP3Srkl30Nj9cLiVPfKmnQa04zkzJmTzzElcMrhznwkl8MYFhRdDPN1PQjWCxAuNEgSLVDHpGZiG2/sUuiCQK78sOdQqtH2kXzslOOESzT2rbNJwFVC8ck7baRZhjQzBUOsqDukwZt6WyLXx3pz8uoFXgfgqkIMik0fiEGdRgHl8VkwZ5G5zSOuirpxzyBFO+U/QYzjsUHsd2Qsq6TWoOpZLRGNKzajH/O9FN/2PfsHCuRCKTDsRzt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slH7hsHcKiNbxlNaz3lGXo5RpOhVp7EufDFWBNhvJRk=;
 b=MYKFEwoT8h5s9SWFHcFR+LVAKVqc2Yxj4zGb1M6InwPGs5ldSxIupNdlMX9WeSJ5rpPOCgz8HS5mz84jJ5Ao0Y5VRfmn+/bZRiKJYu9C9eHyevfLKs3Frx7xuIR0XFoM3ql+RKgP74YvGGIuh4YDRX7ohV9XLgoX+zZ89miVLsldqpqhVVoeDEutSIJlSsLNlZG8Iq8Vc4PfAk0b8DMkrJ+MEm7lts57GOqy52TreR71LYSO2o+nWnv9zZYl0tcxI8jeLEIqn4304GiuY1YYcvZ9K8qR11He22xqoScegRoRIRO/ckqDhjtsncW3IY9UCuR43SIIsGtQGUsRH2VilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slH7hsHcKiNbxlNaz3lGXo5RpOhVp7EufDFWBNhvJRk=;
 b=c/RuoMoOZDsFOESOhShIc52Xiz4kzR3h9ANeUjgn0t+x0nk/JR9xcs5pwhQ4E9y0A7iB4oozPmG9jaT7ZUB/SbEHY8bAi61dvfxYAzp/8HyyJSg9yOKVopZCaff7ogKE0x2YnzD/NyA8AJiJmjgz4p940JGTkEfllnVzMVeqoCtmqerYBm4J5mlYIirMfZQGZUqYXlTThsuKr//GSfHi+5SRR4+RNcreh/r/5bogu8Uxu8XDeiNBrFU9rgDi1buuEqM/DCrkEnxkw2OL7qU5+E6V//1XcSnfbDhFX3KSWfDtSTypgtBr8DaOabyMQf3YvOS1wTSWz9xUs3K7E/4NGA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3416.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 07:08:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 07:08:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Thread-Topic: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Thread-Index:  AQHYb3C6vgEmcLWl90eZLKe3IHFJVq0vYXAAgAB8bICAAAlXgIAg3NiAgAP8igCACZMCAA==
Date: Fri, 24 Jun 2022 07:08:44 +0000
Message-ID: <23cd9412-30a4-e9f2-aaa1-eb3fc817711f@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
 <ea64b232-e002-9317-dca1-c5933fb94e03@csgroup.eu>
 <0d2a6ea3-71cc-a8e1-22eb-7b66f533b3bf@linux.vnet.ibm.com>
 <18d05edc-6669-0308-7e6a-acd1cccd4f20@csgroup.eu>
 <863b068d-e534-b377-c5d7-2f16fbb11977@linux.vnet.ibm.com>
In-Reply-To: <863b068d-e534-b377-c5d7-2f16fbb11977@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42b081f3-fbcc-4534-a55d-08da55b0604a
x-ms-traffictypediagnostic: PAZP264MB3416:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  l5mlhgpJvcdA0AhnbIHJQgyzzsjxF/O7/A9Qj9xRE4cLIIfbnJHVBpTvAp9UJOGpwKjs20Jsrgg87dBBQDRqwdDf/dB8mg4vwdoDvNrVgz/yoQwqH0plfC4ol5AJ40CINGUY0aWwh2hrDDtZvrNRRaLDgB5WgSOz5co0o9JQMfPBTecpvQElPK+0o6pXNN1nmkbmKHsSUYaH6Ywe5sxuLk0fCARd6aMw9s6IOpHn2y2P5FnQbuxeFAk8q5x2pPhGWYjOKVvMCnmjMsUDKw4l4q+7ECz4M+RLWFfJinqsUVXk9ADZvgl6mjvv9KN5GQz4LJHZMm9pFguKxyDzSiBt8irmsGtfD3eptcsLttWikW6KAaakvKzn4a2LZjlxpy03u+6cc2hJ2IXjxN2KWc9H9XYRLuLvrGC7LKTSR8lJ/JTWwu9mSyJc/sun6vtPW4kW9btulTrenGaoalJf9gKRlkVop+WdvSGzftSwCiInF13MJRCL6h1lK1PcAbXVKbBWmibR9rCTXxqR+b0M21m93A3hUMEwrIqY00xe0m4ArCUyG+b+vFyXvfA2w6lcDYNJInHJXO/r5Pl7Uh7xbGBkuB8vXq/j+/PybXBkj3fT8S9ySM97dJiihVD9YdwCg2ZspVwA6Tv2MqfN3r6KVghePFHk+2Zavp5nZkPs8F/YzZKq6HxlMy/m/lQq9RCfVmpYvVUh/9uQ/VUjqpz4FlP+1HG7+aj8FjMvvkBzxZH3efOd1scTME1MJBn46I5iXyB0Gg8wgS1WoMDnuHp1GF1QHUKs92ZWFVr95dPvu0Oo13BM/J174SkXgJuZMBiEid8pKWBr/iNScIvDKXeRctlHYSvO8FlNMsvsDU3UpVeJDcg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(478600001)(36756003)(2906002)(122000001)(6486002)(38070700005)(44832011)(186003)(4744005)(5660300002)(31686004)(83380400001)(7416002)(91956017)(76116006)(66946007)(66556008)(316002)(66476007)(64756008)(8676002)(4326008)(86362001)(41300700001)(2616005)(66446008)(31696002)(54906003)(6916009)(8936002)(71200400001)(6506007)(53546011)(26005)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MGZ2MHVsMmt3eVNhS2VhRTRBbG1FRncvcGw5VHRjZWxiTjNxMEdYT3VSaWM5?=
 =?utf-8?B?MTBNZkFwNU5aNlpmSXBNQmJkbjZZWWVvZ0QwdkV2ZlJmWFU1R0xES2JWbTcx?=
 =?utf-8?B?VVpEMHJ2Q0dIU1REdjMwTUdWTS82RkU4UXpwSUNHTEl5RFROU0lTUUxnMWZK?=
 =?utf-8?B?aWF3NGhnZXBzUXRjTEt3SnoxcWgxMDFBSnVWc3RWc0ZKN3FoZ2NFTkhBTGZM?=
 =?utf-8?B?SzY1ZEFhbjZtc0FFUllhT3lIZTdmaVlxSmJIOTFELzhJMGcxK0V4NnNkQ245?=
 =?utf-8?B?bSs3RjZwUW5obzRDVFJWS2NuRU14dWo1SWJCYmJMN1F4Ty9ReTdJUnQrci9E?=
 =?utf-8?B?R09Eb1BiYjdnVkRBVW4zQ3FVUmpHUjFvdUZaUlRIRTRhMDhBWG5QRWowZno2?=
 =?utf-8?B?aXhXNFRETFFjYmg2NjZZaEQrdUR2SUZTTHZTck1DMVFDVHlYRUpwRXNQbFhw?=
 =?utf-8?B?dWZCcXUxWm1YaW5qU1pWZTdlWVZVR3hnNzNFMXJBVW5tbWlQdjNnYStjQzNX?=
 =?utf-8?B?SXFlaHdVYWhkRGZIWGM0TXMwMnB6clJIdFJzNFdRMFRpa010cmFXLzlHV2pS?=
 =?utf-8?B?ZGc0bC9hTUlLQ0k3UzNwK3ZXUVhMS3A4MTQvcGxzODNqMElpZURaWWo3MzQz?=
 =?utf-8?B?R1IyMHpsMjJTelBhK0RVczRkVVJxWXFiSDc3S3VUR0hpQm9nTTgyMkE5TTJB?=
 =?utf-8?B?T0gwbVFlKzNsRC9ESmxKKzFXdGx1M091bm5Ya1FhMzR0YTNPMDZlYzJ5bHc1?=
 =?utf-8?B?ZzlicmQrY2ROb0dmYXNPbi9qUUxwekdaeTRmbmc2UlNzdVFGUnJ1Tm80Q1Rh?=
 =?utf-8?B?cnJ1Q3QxZVUwT2J6T3BpelFWSEhZbXNkbVVLYW9MUDduNTVDdENCdHl3YzRW?=
 =?utf-8?B?QVFpSjFlU2g1SVBCTDUzTXRhMkFFZFZ3bWVBajB4eGxwd2hVbmN2K3MycjVh?=
 =?utf-8?B?Sm8xNlZ0V0RFTjdSQWF6RmRNaVZaeno2bzFaU2V0OEFPUVlnOUg0cTU1eGVs?=
 =?utf-8?B?OU5VVzc4aUxTTTNhYmV6VlovL1NYSGI4QzBjdlRlbXhKNXdRVWVHSE1IY3BY?=
 =?utf-8?B?b3BiaWNWd0M1Zk5Qb0hObmdraXFmQmJlajVCZkpLUGtBS3dhak5WWkJBWTlH?=
 =?utf-8?B?RzQvR2pTak1adGxIekYvNU1uaTRadFAvK2gzVVVaRWJ2N0ErZ2h0MmNZSmNB?=
 =?utf-8?B?S0s3Z1NHUVJ5OVZpUy9QbUYxNXNoYUFrUCtvMDZPUlh3clgyT3E0UFhyVzhR?=
 =?utf-8?B?YnlyTTZFNStZbjJKYjJWTWVrdFhKVjlkSEtqVXFZL2N6T1VhTGhUc092cmZ5?=
 =?utf-8?B?dmtwYWtlZ1lNMnFwSkhLaDVzdDR0Wm9JRXRaL0hFN3dtOEJBYkpFNXplbUtP?=
 =?utf-8?B?cXhNSGpqY3kvZGFSclVPM0x2ZEZlY0c4Ti9jMkdwNmZsRlhJaEpzdEx6a2Zz?=
 =?utf-8?B?V21jWDJTYWJHcGJ2dTArWE9WWXVjQ2lETlZJVjU1U0xZV2tQK2hiVVQrOEJr?=
 =?utf-8?B?NUdEbms3aUR6KzlrV25RSWdDVE5YaXZpeVlxWXB1MjlacHp2eGZQY0tSaVU2?=
 =?utf-8?B?bUVpeldZeHdEMWRCYS95d1BlSEV0dW1CanM1SFpROERDbUwrU1lSQTI5V2lH?=
 =?utf-8?B?YmFZMkdJSHlJVGx1RWc0WG5tcHBhZ05zcDQzL0RCR25qUDZXek51UFhKblEy?=
 =?utf-8?B?aFRVMExnM2ZoaUdGa2x0ellqemxVZ2piWGh4Zm5KbFZ3WWsrR29sNmtnWi9F?=
 =?utf-8?B?VzhDQy8zMitaSTVrOFZjZUIxdnlsMUdrVTFJYlE1c1FXNVRiRjRzWE9oMlA1?=
 =?utf-8?B?VXRxQ1lpc3ppYmttREx1czl4VllMOXFKeFpEQWtpUGt5UFNuSVhrcEdsYVgv?=
 =?utf-8?B?Qk4zcWRXanZleFlzcWFybFdQZjMyQ2pGOTlwbmxJUXRSd0R5SlZ1bHoreUtp?=
 =?utf-8?B?bXRyRjVkRkhLTWtzc3VCbWF2ZmFwT1M0eitPMExrYS9iYkwybWZEdlFFTlRz?=
 =?utf-8?B?RXRrZmRJQU9aU1VheUxhcTM5QUxKYWMyVjZTRjRJMWxMWUJXa2hpTXNEY3JP?=
 =?utf-8?B?elhSd3hicHpYZ0lsbERSWG5hbjdoQ0tCMFhVTUdjNzRGaWFoR0Z1QVNsMk04?=
 =?utf-8?B?alRtUW5mYWdDUVZ6VkhRYlhMU1pZVS9SbisrTGVkc3duekZ2Z3BtaXRqSCtK?=
 =?utf-8?Q?oL0GX3+TDGzlHqvpd/3oBTQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <672362FE42599141BAE7D1AFBB66A4EE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b081f3-fbcc-4534-a55d-08da55b0604a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 07:08:44.4299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Z3M7RDg99SPCzOZUkGJuyUhp0cqaPjJ5v8BNNsMC2bD0hp++0Ubembr2gOAZupUBPckhS+4AUlg3YKMdYfpAI92H/6wm1vGbTAc71OTQfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3416
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU2F0aHZpa2ENCg0KTGUgMTgvMDYvMjAyMiDDoCAwNjo1NiwgU2F0aHZpa2EgVmFzaXJlZGR5
IGEgw6ljcml0wqA6DQo+IEhpIENocmlzdG9waGUsDQo+IA0KPiBPbiAxNS8wNi8yMiAyMTozMywg
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IERvIHlvdSBoYXZlIGFueSBpZGVhIHdoZW4geW91
IHBsYW4gdG8gc2VuZCBuZXh0IHJldmlzaW9uID8NCj4+DQo+PiBJJ20gcmVhbGx5IGxvb2tpbmcg
Zm9yd2FyZCB0byBzdWJtaXR0aW5nIHRoZSBpbmxpbmUgc3RhdGljIGNhbGxzIG9uIHRvcA0KPj4g
b2YgeW91ciBzZXJpZXMuDQo+IA0KPiBJJ20gcGxhbm5pbmcgdG8gc2VuZCBSRkMgdjMgbmV4dCB3
ZWVrLg0KPiANCg0KSXMgZXZlcnl0aGluZyBnb2luZyBvayA/IERvbid0IGhlc2l0YXRlIGlmIHlv
dSBuZWVkIGhlbHAuDQoNCkNocmlzdG9waGU=
