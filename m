Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A44E218C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:47:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMRXx187kz3bbR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:47:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::626;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRXP3b99z2yYc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 18:46:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4vOulhbV0A7LxljBKhklYAiuMxr5G40pkDpm41NCKbsdk5BqUF1LtwIszIdRoyfPKsLWwVr9CsH3oX2MSU1V3YjUgZHYDp9OMweEHgU996wy8B+qjwbIbsJWS7SBgMssN5of2Rytke7tzaoJ5+4TsX1V3ja/oLX6+E5iR62LmIIo/vMq01x7PRtzbzvCgQUaOQ2vslc7aH7Hl3WSr9dawstjRBBR8RcusDkGsmRENkBDISFJaueaJD5Ub+9sf753FvcuAnOyLXg+fxhp98pcbA02djDEpEU/D1WFtbK8QNlel9KgjdEmHv9Oxxv5GNJgmsqWKP701or0TNSKRiabg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiP4xsujlsUHEAERyx6b3KjtCP+cYAsx8p9kiKoPHqs=;
 b=MbXWNNGuUT9N9jPWA+rGgxdxYp7YnsswaObpIhO2Db5XWZ0y/Qqbg+8VQiIB8Kq/6+AzNjFbcydHecagQVBmS/h5JrWteVf3i1h+cjIfPpOqotEb6GLwH+giZffMHHpzpYabp0lKuN7nExor6YXTGM2zQ3lpeOoiJBRuujEeng6rOVlEOskYdbbUKYYhZ5a3srnZVRkzFUqAPxCeS+mDSbo8t7Bn8q9wiCJj5ZlMVkufcyxpyiAYq3qb1Ejtumox44yUAXQ7gSc5Y3wq0CuCBHC3mB47L3tH5HwtdZpzVO4K6PKSK7/tzJIVMtf2CG3pmY2eJN8+1Aqy+0mS51+O0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0212.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Mon, 21 Mar
 2022 07:46:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 07:46:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy
 <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzFK0EAgAP1goCAAFlHgA==
Date: Mon, 21 Mar 2022 07:46:33 +0000
Message-ID: <acde6260-59b1-c579-99e7-ad59fbd4c563@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
 <87pmmgghvu.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmmgghvu.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5850a61-eef6-4846-3c70-08da0b0eebc2
x-ms-traffictypediagnostic: MR2P264MB0212:EE_
x-microsoft-antispam-prvs: <MR2P264MB0212358DE6C5D4880D917F33ED169@MR2P264MB0212.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2aRruN/uJbRa+VO79uWqhUXqA8qsswiJ3Bg6NjyJosGC5bxswXXfYpv64oZwf9FBAYy/PzN2ANfv2b4CvG6yKAIcF28nCfNTexH5fZq73mctpmtNcQ0KV5isf3DR/L+BiKvgJ1J5oKOFiUC17Gjh4Q+HMVIw43Jzz3rRT1gWXCz2WmziB7QKaDKcWa5Mr90S6BvYOopDLvZMqThgyyB5anaBQrrJ8OSZWBqZWx05zPyC9QKYS011sgTX8AA+x8LKefEpCc6Qatt22XJcSagiaHQwlKBomKmKgF9MHFZKQLJ9MLGJHcPGN0gAmJ662Pzt5rygza+AyG1o4SZqkaEM4HXOmMjJSE6P3thiUBtDMKsOzVBO3YG2bXo1izMCH3kU/nKBlosRkEQ/fB0toI6yjE83Q3SOskN1MdSmw7Usce/taVQD9Lulepz8fUgJEX7aoJjGbdh8+ywRn7Jv5Hpkw/PNmiqBnUeLF+P5bh6TxWGnjflzRE9TbdDhT9IAqjKa/hJbi4QtgAeeXWs/Hyjo4OCNqYOeMVAE+C3HkCZ/+UPxkHdfjpKZL6Gzscpmpd9Xo5O/Nf/rDwuq5A11rUGrp8RB+ftY5UEw/YD2qFar99TRBtGX2rrS77xAFohkvt0nRcV7JDO1XU5HjCU3AlvPFOJeYtTr9WEDzSE3HWjX/QexUH1hTFmS9Hk0oD0PhsgBGlS/zIQdVWIYs0C8HUVuy9AD642nR+g39Oo9guQyecb2JlU8XYVDpnN2JZjXlrvObxPChihPwmgTQLlH9nSvLmtMtfawtbUXgZstXUveGg4/w2x5nTzk0EA/nBjrWgwWDkHtQYGV5fFYIBdMwnhBXFomQ5THfpiVevy0hmuwxcsAfCo2CLig+lrxA0QQjqeJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(8936002)(2906002)(5660300002)(122000001)(4326008)(91956017)(66476007)(66556008)(76116006)(66946007)(64756008)(86362001)(8676002)(66446008)(38100700002)(38070700005)(31696002)(66574015)(508600001)(36756003)(186003)(26005)(71200400001)(966005)(6486002)(110136005)(6506007)(83380400001)(31686004)(2616005)(6512007)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1h2RmdYRGhibmJ5dFcrTGxSSkpSRTd3cWI5OEUrNC94VUZkWk4vajdTNVdS?=
 =?utf-8?B?aVc2RE9OQWhmd0VseEZuV1YrRUR1NkNZWGViY0xlUkZaVlNEcXExNll5T0Nh?=
 =?utf-8?B?TzVnOFgzWGtxdzQ2SGNrS1pxS01KMUN3OVVIRGtTUkYrZEt1OFFNcGVyVm9y?=
 =?utf-8?B?UEJmemluaWoxT3V2aFh1eFMwRUlIOER2akowcUdPVEVCR1pMQVROV0NjWHpF?=
 =?utf-8?B?T3BZeFl4WTdWY1IyU25VZ2tJMFczM2R3RnhPZC90V1N3Zit0RnZ2aDdNMWR4?=
 =?utf-8?B?bXY4Z3AxRmovUlhQUiswUitGSmdVQ0pheUVxc3lDM0w3KzBTOHJHK1ZWNXh1?=
 =?utf-8?B?ZHp5S2JTVXRPWk9VSW1RQzQ5YWhhZUllTUNrNjU2Wnpoci9DTGZPN004bUVp?=
 =?utf-8?B?OTNVUlVoZ2tzb1AySUxldEpVVytUZG5PbUJoOElTYUVIUWdTZ3M2M3pFNWs2?=
 =?utf-8?B?a1JUSVZEZjRkeEJyMytMbmVOL0lPVk9hYS9PSGMvdTBYQzlFU1l4UkdBUGE3?=
 =?utf-8?B?ZmNMejcxK2p4VGluRllaUFFYN0hIajBoMHRTV1NOam45TWxmeVk1c2tVRHNV?=
 =?utf-8?B?TUJKNGZqamdyM3IzZWNjeWFZcnA0cnVlMjZlampWWHpUZFZnMUNrSXpmWW54?=
 =?utf-8?B?ZmJFVnM4Sk55bU1Ga2tMaTNmUnJ1L3RCcmJlL3laVnhPNjlUTXFKM3hiQStP?=
 =?utf-8?B?OFZNRUZiSWFmUXNVMUZjRmhVdC92andyOC9kOUdRck5tY0x4M21Vc0VhWC9a?=
 =?utf-8?B?K290bEFrQXZyNHMwN2VqTURud1VyM1VUcWpUNFlhNVA2OUpqMU5WdUg3QURl?=
 =?utf-8?B?Nko0NHBlbUJvcE1zbzdXcVBPcFkyVnVaRnZEdmJUNmEyMHpyY1dkRnYxVGJN?=
 =?utf-8?B?Y1FVbjFDQVM1dTY5NTFhbnkwOVVWS3prTEVadExVZGlObXRsYTVVaERJeGdG?=
 =?utf-8?B?RjZLc0l4eUVZcXV2bkEvTDFBRFZ2dm55WmxxaWZQaGNCdHBVNWZneUl3cGZs?=
 =?utf-8?B?S00wQ09Eb0ExQ1NrcjFocEFVV1JrU29LSjJNQ2VyTEQ5UGN6VmE3RWVSQ1lk?=
 =?utf-8?B?TTZXU3M1alozVWljR29wWjNyend2cUZZQ2RSWHdFYVdYb2JRU2N2QlplZXYv?=
 =?utf-8?B?TSsxRGRsM1JqMkVpaFFEMTBGZ2EyUVdIMUxQWlpQQmpEc1pBQmNJbzNxVlkz?=
 =?utf-8?B?RStPWnYraDV0WStWNmdwODBYQ0txYk93RFhQeWUzc2ppNmp6KzlzR1VEc0dp?=
 =?utf-8?B?Zk1ueXBjRVRXL3FqVWhpNlhsWlRWMEFHTnN1bkV0NmpvVG5GSFdhQUJ1ejlH?=
 =?utf-8?B?WVhQY1ljZ2JuVklXWno0Zm9BZVQ1UHZKbGhJblRhQmUvcFFVM2pMWnRlZ2ZF?=
 =?utf-8?B?bTl3NG93SklxNFhtZjcydVFDNmpuNGVXZ1hibXZDdXo1VUpJc1BIMDZXc1dn?=
 =?utf-8?B?U1Fud1Z2blZib3VJVGxBVHE0Y1JzUzZoblRPUkpldXNWcVdFaFgxVTV3b3J1?=
 =?utf-8?B?cStHbTdpVmgzcnZSYllvdGpzQTBjV04xNjJTWUNOc2dpbkhvaDRpSVIwNlRx?=
 =?utf-8?B?ajJzUHUvc1JwbkdnbElxcWpmcTJ2cm81S1NoYXpmUTc3MVZ1eG95U0YzMXZs?=
 =?utf-8?B?S0JYbUhXcnpXL1RvdG5mMFB6UHdHS0tMcGQxK1Q1KytXS2tBUkFyeThlaG1K?=
 =?utf-8?B?NkV5ayt2MDdRUWw2SHM3cHNldmdtYzBzNmRWcTdnU0tkcFpQWGJlTHJOWU96?=
 =?utf-8?B?WHJOL2tFaHNtVG5ZaWltVVpoODNyUkdOcmRVNVFXdDRvUE81L3VKWDlqY0ZE?=
 =?utf-8?B?dDJ0OTlucmVRWURGVjBiT1JwRFdLTnNKSmpXREw2M1FTcm02TktIeHdKUVRO?=
 =?utf-8?B?UFBpdFZBU2drLytWSE1USHg2TXNtWlp4M01FeENwbEI2ZWNacjgwOEJ1TEVD?=
 =?utf-8?B?eUhXQXo1akYrN3lCVTJIa2NOSkJGTU1kVjFCc2NpcEo1eGRTMVhuRkZ5S1hT?=
 =?utf-8?Q?DBJX/odPsGVIu8lBZKHK+6V09DvzS8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99C6F5A548B0434CAA3077EC6907D8E8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5850a61-eef6-4846-3c70-08da0b0eebc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 07:46:33.8232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mDYVcjwj3RKHiFza8CRXhLXitVRvbGZiRXGSfhRxHsl2qQT9gdyVlssYCRyBj8vXlqgHWbMnMsp9IDJ4O0rq3CcAQBjBOy8Ijft37pOz+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0212
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDM6MjcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxOC8wMy8yMDIyIMOgIDEzOjI2LCBQZXRlciBaaWpsc3RyYSBhIMOpY3JpdMKgOg0K
Pj4+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDA0OjIxOjQwUE0gKzA1MzAsIFNhdGh2aWthIFZh
c2lyZWRkeSB3cm90ZToNCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHBvd2VycGMgc3BlY2lmaWMgZnVu
Y3Rpb25zIHJlcXVpcmVkIGZvcg0KPj4+PiAnb2JqdG9vbCBtY291bnQnIHRvIHdvcmssIGFuZCBl
bmFibGVzIG1jb3VudCBmb3IgcHBjLg0KPj4+DQo+Pj4gSSB3b3VsZCBsb3ZlIHRvIHNlZSBtb3Jl
IG9ianRvb2wgZW5hYmxlbWVudCBmb3IgUG93ZXIgOi0pDQo+Pg0KPj4gSSBoYXZlIG5vdCByZWNl
aXZlZCB0aGlzIHNlcmllcyBhbmQgSSBjYW4ndCBzZWUgaXQgb24gcG93ZXJwYyBwYXRjaHdvcmsN
Cj4+IGVpdGhlciAoaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBj
LWRldi9saXN0LykNCj4+DQo+PiBEaWQgeW91IHNlbmQgaXQgdG8gbGludXhwcGMtZGV2IGxpc3Qg
PyBJZiBub3QgY2FuIHlvdSByZXNlbmQgaXQgdGhlcmUgPw0KPiANCj4gSXQgaXMgdGhlcmUsIG1p
Z2h0IGhhdmUgYmVlbiBkZWxheWVkPw0KPiANCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0yOTExMjkNCj4gDQo+IFRoZXJlIGFy
ZSBzb21lIENJIGZhaWx1cmVzLg0KPiANCg0KT24gUFBDNjQgd2UgcmFuZG9tbHkgZ2V0Og0KDQov
YmluL3NoOiAxOiAuL3Rvb2xzL29ianRvb2wvb2JqdG9vbDogbm90IGZvdW5kDQptYWtlWzJdOiAq
KiogW2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5LTY0Lm9dIEVycm9yIDEy
Nw0KL2xpbnV4L2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZTo3NzogcmVjaXBlIGZv
ciB0YXJnZXQgDQonYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXktNjQubycg
ZmFpbGVkDQptYWtlWzJdOiAqKiogRGVsZXRpbmcgZmlsZSAnYXJjaC9wb3dlcnBjL2tlcm5lbC92
ZHNvL3ZnZXR0aW1lb2ZkYXktNjQubycNCm1ha2VbMV06ICoqKiBbdmRzb19wcmVwYXJlXSBFcnJv
ciAyDQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KL2xpbnV4
L2FyY2gvcG93ZXJwYy9NYWtlZmlsZTo0MjM6IHJlY2lwZSBmb3IgdGFyZ2V0ICd2ZHNvX3ByZXBh
cmUnIGZhaWxlZA0KbWFrZTogKioqIFtfX3N1Yi1tYWtlXSBFcnJvciAyDQpNYWtlZmlsZToyMTk6
IHJlY2lwZSBmb3IgdGFyZ2V0ICdfX3N1Yi1tYWtlJyBmYWlsZWQNCg0KVGhpcyBpcyBsaW5rZWx5
IGJlY2F1c2UgcHJlcGFyZTogdGFyZ2V0IGRlcGVuZHMgb24gdmRzb19wcmVwYXJlIGFuZCANCnBy
ZXBhcmU6IHRhcmdldCBkZXBlbmRzIG9uIG9ianRvb2wsIGJ1dCB2ZHNvX3ByZXBhcmU6IGRvZXNu
J3QgZGVwZW5kIG9uIA0Kb2JqdG9vbC4NCg0KSSdtIG5vdCBzdXJlIGl0IGlzIGNvcnJlY3QgdG8g
cnVuIG9ianRvb2wgbWNvdW50IG9uIFZEU08gYXMgaXQgaXMga2luZCANCm9mIHVzZWxlc3MuIE9u
bHkgVkRTTzY0IHNlZW1zIHRvIGNhbGwgb2JqdG9vbCwgbm90IFZEU08zMi4NCg0KQ2hyaXN0b3Bo
ZQ==
