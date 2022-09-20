Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A55BDC86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 07:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWr9K5lxCz3bY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 15:45:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=v+OWFNIb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=v+OWFNIb;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWr8X75kNz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 15:44:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvwGkzXw7iTOPvvXGV4zSqpjow+CyRNbJ4Sc6GM+E8416WpdycnF+oufa816UeStxmImAdP+FRhMAmgzWzMaAQRnpn51k2QRK1ugU9A2/hrho0GrBAl5NsAmY4pPJOD7zEvDY6cnH32gpQSFRcfHOesjvxQsjzEt5xu7y8CQG3+pvnJh0bDyol1ZZE61POGodaDcToAnIyujXNBK5qAkRaLueeCxTmxMvQ4ClRf/Aha96K/ni7HlLwSKGwsaXOS9em/VeolpRJj1CKZDxnKeqTSzyilEO/GMFUwxsCwDMN3TCNDIx9WfWxTiVVcEA383wsD/wKDgSSJaW7GdZrhm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nLLcwa3F2DDu31QF1Rc4D/NcFxXOgYK0MBmJ/JiVkU=;
 b=T/H8bL4c8PuA0WHCJJXoLQdUU4Cgd5pjewHSgH3wDDJn7Leln1Qf1H3xb6QwUNoGjfE8PI5Cc1poMuBrAtvFZ487dBLzLmcnorZbx6KOT3vHSIjFGpY/XWsHABw37BH1wIfJEuRTE6paILROHxeNTOx3kB+H7DCBKRv2ZQPa+hWskSGvYfMN/yYVXOqqDN6Z4q/x2nFKU+xacFsOhsqhzh5+8OzzwJXKex+8jeMW+zOE+1bqlAl5pahFNUjwdPneWCd9QGoJCb2HadvTCFbeyOtijIIWaPEidGiLlXULKSzdSZq9TSVNHlBqF92Zyucu2xS31LS00DHJX1b7Bu5Ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nLLcwa3F2DDu31QF1Rc4D/NcFxXOgYK0MBmJ/JiVkU=;
 b=v+OWFNIbDGYItj0MYKDNdV09/2bm3DK/akeAIOloRUUWNEyyiIyExbyKdMd2zJ59f38BGGf9I5VLd0eGu/5C+A0O4u3FMBW53RL1alZhO28yDrLHiTi0poAF3ugA2weJEPPlmlnlLDuMyLM9KnW5yK6Ih63RYOJ9T7FiYxqiD2Dp4uCxhibucj6PKWe1/+Vc2yR6KPEtFr7nRxtFOoZbYdPYVirM+u7OmK8/8kEK2fLbQu5K9D6zYBMSi00UUuyZf8828IerdOtEwBqjq8WORyXXjPie7PpTU1xfqU3xDDiXehJkeGbBzwc4bzVvsAHnea1Eg1YD+uqAU771qxM1rQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2990.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Tue, 20 Sep
 2022 05:44:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 05:44:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHYyZT3TDSTBbnSJ0CIZQGPG79aSK3mSCqAgAAMh4CAAAe9gIABQuSAgAA1g4A=
Date: Tue, 20 Sep 2022 05:44:08 +0000
Message-ID: <0a5f74cc-7eb6-ab85-8ebe-36d628974ca1@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
 <20220916062330.430468-2-bgray@linux.ibm.com>
 <4c19a0fa-6af0-e71a-deaf-b150eeec6381@csgroup.eu>
 <ff06e95c7f85f0b33e3573c46f9d9fe7ddffba2d.camel@linux.ibm.com>
 <f3ff19a1-4e78-0201-0241-ae8e0b9baa1e@csgroup.eu>
 <857e6e30d88454d45d8ad191e4ecb64b4484ec0b.camel@linux.ibm.com>
In-Reply-To: <857e6e30d88454d45d8ad191e4ecb64b4484ec0b.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2990:EE_
x-ms-office365-filtering-correlation-id: 137b1cc4-b90f-410c-cfeb-08da9acb22e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3RMUOth1zX0fLNKUQor1C1zgzreXvdp7r+Vphg3BQd6KqaySYlqP73FiC7UrjCRLyOYeE1LOYs6FSM8PfCDh4Y/uVShuX+VVALoc281Ut6miBFHATykjWAFQHhujGclLtItqEjhmau0oAHnoUZpBMen2HfcQgnzSmS5Ew8tV+DjAX7tnnVrvO6QAPXJBbuBqUMWTtVWLzj6hIi9/32uoEBM1S7WYPQR5pOkiQct5LMEJUqCWCe0k5j/kurvWluxZKktVK0rlYRFZuEkqwFnhPLG8Yh1906N9SGloeX5E0I7P0jzGnJ5VJd5St3ufRKRBUAKZC+uvZPh8mHbaulLPZRunVYjJ0slYcBxN8HHbwEZJmNNqVofSvpDVmmpfiy4QhZncUGyJnKFMcLH0qS33leYuQVS0LN6earyFLz4Gu2CwLHghCpvWTgAsPRFsM/RQRAvFwFmRFwdEsOSwifNdfIPsEWBW+Orqjw5i29DVif6SmYEGLUXXG19+YLvJJq8pkEOGjTxzBfuEQ2pEv4Y+OaHRcOnvgCOSZfXzNJMQy6zmfEJSOC1kIR+uFwV491rbN97CmZik2FVmjpE064cXDirYuY6/wpj5kZ9H+F+sWmQVTzWhJDh+bfO5u1IMnf8HtVwHNVardLnYoLi123jxWdZDifyQ/y4IaERf8VBb9VUniRNToeL0teIDy19QcNH96UEJnsf8eyCtQ8ikKkYfiNc33acEcHhO+MZIMHTmdfgxOxUSkRitq/vxDePCwdgU6oZ81C61N3WAo+ySXxJbsKif3wfG7laDuz4RE9CyGhJhavpMOAVm21dPiVw6mn7EOhiJYpCrm9zfLpu7WA/TX9DTtZ6CIzNO00uo5sqrC48=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199015)(44832011)(31686004)(36756003)(2906002)(122000001)(316002)(38100700002)(4326008)(8676002)(66556008)(64756008)(7416002)(5660300002)(76116006)(66946007)(66446008)(66476007)(110136005)(91956017)(31696002)(54906003)(86362001)(186003)(478600001)(2616005)(38070700005)(6512007)(26005)(8936002)(83380400001)(6506007)(6486002)(71200400001)(41300700001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z3hNMFlVOUdjV0llUklMRzBJQUY0Y0oxVE1Lbnp1QU4ra0M1cXJVUnBMMUdJ?=
 =?utf-8?B?S1Y3YS8wa2pyaHBKOFI4bWpNQnJGV0Z5SHdETTZma280UWxpQS9PNlZhRlNQ?=
 =?utf-8?B?VEJFb0ppdDBYQ0dkVUVEcmtrSDNKNFk5dUw1YzFSU2lyN1A4L1R1OWIycVpV?=
 =?utf-8?B?MVRNZEorZnV5NEJKZm03S28vYlFSbUtvazc2U1lRaVNOdGhzZWRmaVZUVFR2?=
 =?utf-8?B?VFlhQUw3SldSTkp5cytPZTVEcHRFSVl2Uzh5ZnY1d0RJY1grRm1iMzFLNkh3?=
 =?utf-8?B?QVlmM2pkQm03SStDVW1ldU5tT2h3Q1BKNkE1dDFvTElHamR0bmJ3Y0FpdTFy?=
 =?utf-8?B?ampYTnpHVUF6TVdGNytqYlhnc3pNY203S0Z1THQ5Q09XNVkyTnFkek80dFR1?=
 =?utf-8?B?eDl5Tm5ZaVJ6ZFBncTQ3SnlwZU5paWh6cTJFM1g0OEIyRDdiR2xPV0dQUnl5?=
 =?utf-8?B?bFRSbmtZMTQzeWtWWWF0YVdPYnVMSy9zSHVNKytnVEhiMXdDZTlnZXZobi8w?=
 =?utf-8?B?ZDZ5VHBBb3Erem5GRXVuMGh6SU1NSzhkTlo5cHptU3cvQ0ZTMHRqdXdWeG8w?=
 =?utf-8?B?eHRTUjdGQzd2eFRId2ZwRmFjeE5aQTdHM2xnK1pPN0hFUklEWlhNL0hvNTk0?=
 =?utf-8?B?ek9kK2luNVh0QmMvRUhLWkdwQkt6S1BDWlFDdG9EK25HcHAyNDM3YlZnUnhO?=
 =?utf-8?B?TGR0dTROazRYTTVLSkNWRUM4TzNzUGhsekFTK3VlSDZZOWxjQUxxcUw1bnhs?=
 =?utf-8?B?OW5MbVdaSlZBRVFiUy8xSXVUKzdvRnpzT3hOUStja0s3K3d2aDJKR3Vla2xG?=
 =?utf-8?B?dHlMYmNOcFJjSXAzNjltWEtmZDZGdERqMjFrNklBaVBaM08rMi9IVnBmWXhR?=
 =?utf-8?B?QVY4cktaM3pmSWxremErU1p1RElNTk9YWTJyNjlKU0hqOGRjZzl0OGZsaDQr?=
 =?utf-8?B?b0szUUZ1QjExTkg1NWd0U2pib2xJVDlHLzREYjZpb0R6Q1hoNEdBSnc3Uzh5?=
 =?utf-8?B?UkMrd0Y0NmVWWHVVTEN3ZUpkVnR0by9CK0hNQjlGSU92eUpHZkpZK2JOWm9J?=
 =?utf-8?B?ZlNYdzZlMlNhY2g4NUZvaFVLYi93SHRMdUtzRCttaGg3angwcE5iZEFiQkNO?=
 =?utf-8?B?VUZLb0FwYVgwMXFxQy9KYkZkRllMS0F6SHI3Um1kZ2pUWlB1NVBJQ1JnR2Rt?=
 =?utf-8?B?SmFPazVuT3ErMjlweGRiM1lNVFRBMGlEeURieldtVEZneDJGVXliNjNXV1U3?=
 =?utf-8?B?T1dhYzJwWGE3OTFWWHpwZkhjc1ZTQUtNUEVuSXZtZEFaN05hd3ZTRE1JMDdK?=
 =?utf-8?B?SENDMjZOR2RERUZNMGxSOVRYNFVBMzBtSEF1V1JCNGFseDVrbTR0V2YydWZM?=
 =?utf-8?B?Q3pWQ0Vqdnh0MnZXTUV5NFIydHNJazFXVDluOXA4SEdRd2NHckM5ekdNeDl5?=
 =?utf-8?B?TUJhUzhTZlZwSTFuakcwU0JzbVA0WXNRRExRZ01rY1dycVNvWkpTNDNFSXJs?=
 =?utf-8?B?blVDL1pBNEk4ZEt6cVQ3QkxTZzhqcC8xVDJYZHZ3K0hDMDdzSXQ3V25zR3Ev?=
 =?utf-8?B?c3ltQi9VcHpyQ09vWjZMYjRONHNsTHFSN1pzTzg2SXNZVDQ1REdKOGZkQkhL?=
 =?utf-8?B?RU9IZHU2eGlyMGJ6ekQ4V2wwbXZLdkNxcmoyM1ZmS0hZOFNERS94QmdYbnFj?=
 =?utf-8?B?Z3g1WXg3SjlsbktIMXBLbXQ5Nnk5cStQSjhWYkVFS0szbFhjcXRsK2FlV3lV?=
 =?utf-8?B?K3dsdWFxcnl6UjdLdG5ycjg4SDkxdWJTSG9MODlBZ29xZ1k5QThZNG4wejE0?=
 =?utf-8?B?ZXpWNU5SZmdOMWc1Zk1SY3MrL2xhT20vSnNtSmRCN2JIeG5GTGU1YUpVYzVT?=
 =?utf-8?B?Y3orS3hzWm8yb3pjcWxFcjVFYVlNYnRwM0NHczlRZVB1NGhyWXZKY1k2RWdh?=
 =?utf-8?B?bzBhYkhOK3NwcUtNakNXczQ3SDlKZ2p1c1VHMnh3NnoxR3hody9nS3Rwc2t0?=
 =?utf-8?B?VC9XdzRBdjg5Tm5INXZHdVZtbmgycDZxU2VDQ0ZSSENndE15eDM1OUdBU3JX?=
 =?utf-8?B?YXBaaGxRYStBMlcwaEdMSTBnRGE1NEUvU0FTdnJsTVNpT25peXgzNnlEbHJj?=
 =?utf-8?B?TlBibWRZdmxQTk41cjFGNmFFMlhjUWJmN3AxNHE0K3BXbGV6NHA3THNFMUQ0?=
 =?utf-8?Q?531tE55gee3jNlD/ScaBWd8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <831C2F78A83CDD419FCB0E5F9B7D9239@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 137b1cc4-b90f-410c-cfeb-08da9acb22e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 05:44:08.0453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RtH7v7l0zMC6T1v1DE8eDiggBalvm6b99eS/Qx0zjOup8GP6SKRjo7UaOrN/4+hIwi9S8U/IaMvDBanWs+ObkGEKIFvZ1HAUtmCTKIYYho4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2990
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA5LzIwMjIgw6AgMDQ6MzIsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCAyMDIyLTA5LTE5IGF0IDA3OjE2ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4gV2h5IHdvdWxkIGl0IGJlIHVucHJlZGljdGFibGUgPyBPbmx5IG9uZSBwYWdlIGlzIG1h
cHBlZC4gSWYgaXQNCj4+IGNyb3NzZXMNCj4+IHRoZSBib3VuZGFyeSwgX19wdXRfa2VybmVsX25v
ZmF1bHQoKSB3aWxsIGZhaWwgaW4gYSBjb250cm9sZWQgbWFubmVyLg0KPj4gSSBzZWUgbm8gcG9p
bnQgaW4gZG9pbmcgdGhlIGNoZWNrIGJlZm9yZSBldmVyeSB3cml0ZS4NCj4gDQo+IE9oIEkgZGlk
bid0IHNlZSB0aGF0IGdldF92bV9hcmVhIGF1dG9tYXRpY2FsbHkgYWRkcyBhIGd1YXJkLiBZb3Un
cmUNCj4gcmlnaHQgdGhlbiwgaXQncyByZWR1bmRhbnQuIEkgaGFkIGFzc3VtZWQgdGhlcmUgY291
bGQgYmUgYSB3cml0ZWFibGUNCj4gbWFwcGluZyBkaXJlY3RseSBhZnRlci4NCj4gDQo+PiBBbmQg
d2hpbGUgeW91IGFyZSB0aGlua2luZyBhYm91dCBhbGlnbm1lbnQsIGRvbid0IGZvcmdldCB0aGF0
IGRjYnN0DQo+PiBhbmQNCj4+IGljYmkgYXBwbHkgb24gYSBnaXZlIGNhY2hlbGluZS4gSWYgeW91
ciBtZW1vcnkgY3Jvc3NlcyBhIGNhY2hlbGluZQ0KPj4geW91DQo+PiBtYXkgaGF2ZSBhIHByb2Js
ZW0uDQo+IA0KPiBZZWFoLCB0aG91Z2ggdGhpcyBhcHBsaWVzIHRvIHRoZSBleGlzdGluZyBwYXRj
aF9pbnN0cnVjdGlvbiB0b28gKGluDQo+IHRoZW9yeTsgcHJlZml4ZWQgaW5zdHJ1Y3Rpb25zIGNh
bm5vdCBjcm9zcyBhIDY0IGJ5dGUgYm91bmRhcnksIGJ1dCB0aGUNCj4gSVNBIGRvZXMgbm90IHNw
ZWNpZnkgbWluaW11bSBjYWNoZWxpbmUgc2l6ZSkuwqBJIGRvbid0IGhhdmUgYSBuaWNlDQo+IHNv
bHV0aW9uIHJpZ2h0IG5vdyB0aG91Z2guIFRoZSBmbHVzaCBuZWVkcyB0byBiZSBkb25lIG9uIHRo
ZSBlZmZlY3RpdmUNCj4gYWRkcmVzcyAoaS5lLiB0ZXh0IHBva2UgYWRkcmVzcykgYWNjb3JkaW5n
IHRvIHRoZSBJU0EsIGJ1dCB0aGUgdGV4dA0KPiBwb2tlIGFkZHJlc3MgaXMgb25seSB2YWxpZCB3
aXRoaW4gdGhlIElSUSBzYXZlIHJlZ2lvbi4gU28gbm9uLXByZWZpeGVkDQo+IGluc3RydWN0aW9u
IHBhdGNoaW5nIHdvdWxkIGVpdGhlciBwYXkgZm9yIHNvbWUga2luZCBvZiBjaGVjaywgb3IgbmVl
ZA0KPiBzcGVjaWFsIGNhc2luZy4NCg0KQXMgZmFyIGFzIEkga25vdywgY2FjaGVsaW5lcyBhcmUg
bWluaW11bSA2NCBieXRlcyBvbiBQUEM2NCBhcmVuJ3QgdGhleSA/DQoNCj4gDQo+IE1heWJlIGFu
ICJpcyBhbGlnbmVkIiBmbGFnIGluIGEgZ2VuZXJpYyBfX3BhdGNoX3RleHQgdG8gbWFrZSB0aGUg
ZXh0cmENCj4gZmx1c2ggY29uZGl0aW9uYWwgaXMgZ29vZCBlbm91Z2g/DQoNCldlbGwsIGlmIHRo
ZSBjYWNoZWxpbmUgaXMgYWxyZWFkeSBmbHVzaGVkLCB0aGUgb3BlcmF0aW9uIHdpbGwgYmUgYSBu
b3AgDQphbnl3YXkgc28gaXQgc2hvdWxkbid0IGNvc3QgbXVjaCB0byBmbHVzaCBib3RoIGFkZHJl
c3NlcywgYWZ0ZXIgYWxsIGl0IA0KaXMgdGhlIHN5bmMgdGhhdCBjb3N0cyBhbmQgeW91J2xsIHN0
aWxsIGhhdmUgb25seSBvbmUuDQoNCj4gDQo+IA0KPiBSZWxhdGVkIHRvIEVBIGJhc2VkIGZsdXNo
aW5nLMKgZGF0YSBwYXRjaGluZyBvdWdodCB0byBydW4gJ2RjYnN0JyBvbiB0aGUNCj4gJ2V4ZWNf
YWRkcicgdG9vLiBTbyBnaXZlbiB0aGUgaWNhY2hlIGZsdXNoIG9ubHkgbmVlZHMgdG8gYmUgYXBw
bGllZCB0bw0KPiBpbnN0cnVjdGlvbiBwYXRjaGluZywgYW5kIGRhdGEgZmx1c2ggb25seSB0byBk
YXRhIHBhdGNoaW5nLCBJIHBsYW4gdG8NCj4gbW92ZSB0aG9zZSBleGVjX2FkZHIgc3luY3Mgb3V0
c2lkZSBvZiBfX3BhdGNoX3RleHQgdG8gdGhlIHJlbGV2YW50DQo+IHB1YmxpYyBpbnN0cnVjdGlv
bi9kYXRhIHNwZWNpZmljIGVudHJ5IHBvaW50cy4NCg0KV2h5IHNob3VsZCBpdCBydW4gJ2RjYnN0
JyBvbiB0aGUgJ2V4ZWNfYWRkcicgYXQgYWxsID8gV2UgaGF2ZSBub3QgDQp3cml0dGVuIGFueXRo
aW5nIHRoZXJlLg0KDQpBbnl3YXksIHBvd2VycGMgaGFuZGxlcyBjYWNoZWxpbmVzIGJ5IHBoeXNp
Y2FsIGFkZHJlc3MsIHNvIG5vIG1hdHRlciANCndoaWNoIEVBIHlvdSB1c2UgYXMgZmFyIGFzIGl0
IGlzIGRvbmUuDQoNCkFuZCBkY2JzdCBpcyBoYW5kbGVkIGFzIGEgd3JpdGUgYnkgdGhlIE1NVSwg
c28geW91IGp1c3QgY2FuJ3QgYXBwbHkgaXQgDQpvbiB0aGUgcmVhZC1vbmx5IGV4ZWMgYWRkcmVz
cy4NCg0KDQo+IA0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2UgODoN
Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19w
dXRfa2VybmVsX25vZmF1bHQoZGVzdCwgc3JjLCB1NjQsDQo+Pj4+PiBmYWlsZWQpOw0KPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsNCj4+
Pj4NCj4+Pj4gSXMgY2FzZSA4IG5lZWRlZCBmb3IgUFBDMzIgPw0KPj4+DQo+Pj4gSSBkb24ndCBo
YXZlIGEgcGFydGljdWxhciBuZWVkIGZvciBpdCwgYnV0IHRoZSB1bmRlcmx5aW5nDQo+Pj4gX19w
dXRfa2VybmVsX25vZmF1bHQgaXMgY2FwYWJsZSBvZiBpdCBzbyBJIGluY2x1ZGVkIGl0Lg0KPj4N
Cj4+IFdlbGwsIG5vdCBpbmNsdWRpbmcgaXQgd2lsbCBhbGxvdyB5b3UgdG8gcGFzcyB0aGUgc291
cmNlIGFzIGEgJ2xvbmcnDQo+PiBhcw0KPj4gbWVudGlvbm5lZCBhYm92ZS4NCj4gDQo+IEkgY2hl
Y2tlZCB0aGUgbWFjaGluZSBjb2RlIG9mIGEgMzIgYml0IGJ1aWxkLCBidXQgaXQgc3RpbGwgcGFz
c2VzIHRoZQ0KPiBwb2ludGVyIGluIGEgcmVnaXN0ZXIuIEkgYWxzbyBjaGVja2VkIGFsbCAzIEFC
SSBkb2NzIGFuZCB0aGV5IHNheSBhDQo+IHBvaW50ZXIgaXMgdGhlIHNhbWUgc2l6ZSBhcyBhIGxv
bmcuIENvdWxkIHlvdSBjbGFyaWZ5IHdoZW4gYSBwb2ludGVyIGlzDQo+IHBhc3NlZCBvbiB0aGUg
c3RhY2sgYnV0IG5vdCBhIGxvbmc/DQo+IA0KPiBPciBkbyB5b3UgbWVhbiB0aGF0IHdlIGNvdWxk
IHBhc3MgdGhlIHBvaW50ZWQtdG8gZGF0YSBpbiBhIHJlZ2lzdGVyIGFuZA0KPiBza2lwIHRoZSBw
b2ludGVyIGFsdG9nZXRoZXI/IFRoYXQgc2VlbXMgbGlrZSBhIGdvb2QgY2hvaWNlLCBidXQNCj4g
X19wdXRfa2VybmVsX25vZmF1bHQgdGFrZXMgYSBwb2ludGVyIHRvIHRoZSBzb3VyY2UgYW5kIHRo
ZQ0KPiBpbXBsZW1lbnRhdGlvbiBpcyB2ZXJ5IGNvbXBsZXguIEkgZG9uJ3QgdGhpbmsgSSBjYW4g
c2FmZWx5IHdyaXRlIHRoZQ0KPiBtb2RpZmllZCB2ZXJzaW9uIHdlJ2QgbmVlZCBhdCB0aGlzIHBv
aW50Lg0KDQpZZXMgSSBtZWFudCB0byBwYXNzIHRoZSB2YWx1ZSBpbnN0ZWFkIG9mIHBhc3Npbmcg
YSBwb2ludGVyIHRvIHRoZSB2YWx1ZS4NCldoZW4geW91IHBhc3MgYSBwb2ludGVyIHRvIGEgdmFs
dWUsIGl0IGZvcmNlcyBnY2MgdG8gcHV0IHRoYXQgdmFsdWUgaW4gDQptZW1vcnksIG5hbWVseSBp
biB0aGUgc3RhY2suIFdoaWxlIHdoZW4geW91IHBhc3MgdGhlIHZhbHVlIGRpcmVjdGx5ICwgDQp0
aGVuIGl0IGdldHMgcGFzc2VkIGluIGEgcmVnaXN0ZXIuDQoNClNvIEkgdGhpbmsgeW91IGhhdmUg
dG8gcGFzcyB0aGUgdmFsdWUgYW5kIG9ubHkgY2hhbmdlIGl0IHRvIGEgcG9pbnRlciB0byANCnRo
YXQgdmFsdWUgYXQgdGhlIHRpbWUgeW91IGFyZSBjYWxsaW5nIF9fcHV0X2tlcm5lbF9ub2ZhdWx0
KCkuIFRoYXQgd2F5IA0KZ2NjIGlzIGFibGUgdG8gaGFuZGxlIGl0IGVmZmljaWVudGx5IGFuZCBt
b3N0IG9mIHRoZSB0aW1lIHZvaWRzIGdvaW5nIA0KdmlhIG1lbW9yeS4NCg0KVG9kYXkgcmF3X3Bh
dGNoX2luc3RydWN0aW9uKCkgaXMgOg0KDQpjMDAxN2ViYyA8cmF3X3BhdGNoX2luc3RydWN0aW9u
PjoNCmMwMDE3ZWJjOgk5MCA4MyAwMCAwMCAJc3R3ICAgICByNCwwKHIzKQ0KYzAwMTdlYzA6CTdj
IDAwIDE4IDZjIAlkY2JzdCAgIDAscjMNCmMwMDE3ZWM0Ogk3YyAwMCAwNCBhYyAJaHdzeW5jDQpj
MDAxN2VjODoJN2MgMDAgMWYgYWMgCWljYmkgICAgMCxyMw0KYzAwMTdlY2M6CTdjIDAwIDA0IGFj
IAlod3N5bmMNCmMwMDE3ZWQwOgk0YyAwMCAwMSAyYyAJaXN5bmMNCmMwMDE3ZWQ0OgkzOCA2MCAw
MCAwMCAJbGkgICAgICByMywwDQpjMDAxN2VkODoJNGUgODAgMDAgMjAgCWJscg0KYzAwMTdlZGM6
CTM4IDYwIGZmIGZmIAlsaSAgICAgIHIzLC0xDQpjMDAxN2VlMDoJNGUgODAgMDAgMjAgCWJscg0K
DQpIZXJlIHI0IGlzIHRoZSB2YWx1ZSB0byBiZSB3cml0dGVuLg0KDQoNCldpdGggeW91ciBwYXRj
aCwgZXh0cmFjdCBmcm9tIF9fcGF0Y2hfdGV4dCgpIGlzOg0KDQpjMDAxN2ZkYzoJMjggMDUgMDAg
MDQgCWNtcGx3aSAgcjUsNA0KYzAwMTdmZTA6CTQxIDgyIDAwIDc0IAliZXEgICAgIGMwMDE4MDU0
IDxfX3BhdGNoX3RleHQrMHg5OD4NCmMwMDE3ZmU0Ogk0MSA4MSAwMCA0MCAJYmd0ICAgICBjMDAx
ODAyNCA8X19wYXRjaF90ZXh0KzB4Njg+DQpjMDAxN2ZlODoJMjggMDUgMDAgMDEgCWNtcGx3aSAg
cjUsMQ0KYzAwMTdmZWM6CTQxIDgyIDAwIDc0IAliZXEgICAgIGMwMDE4MDYwIDxfX3BhdGNoX3Rl
eHQrMHhhND4NCmMwMDE3ZmYwOgkyOCAwNSAwMCAwMiAJY21wbHdpICByNSwyDQpjMDAxN2ZmNDoJ
NDAgODIgMDAgMGMgCWJuZSAgICAgYzAwMTgwMDAgPF9fcGF0Y2hfdGV4dCsweDQ0Pg0KYzAwMTdm
Zjg6CWExIDI0IDAwIDAwIAlsaHogICAgIHI5LDAocjQpDQpjMDAxN2ZmYzoJYjEgMjMgMDAgMDAg
CXN0aCAgICAgcjksMChyMykNCmMwMDE4MDAwOgk3YyAwMCAxOCA2YyAJZGNic3QgICAwLHIzDQpj
MDAxODAwNDoJN2MgMDAgMDQgYWMgCWh3c3luYw0KYzAwMTgwMDg6CTJjIDA2IDAwIDAwIAljbXB3
aSAgIHI2LDANCmMwMDE4MDBjOgkzOCA2MCAwMCAwMCAJbGkgICAgICByMywwDQpjMDAxODAxMDoJ
NGQgODIgMDAgMjAgCWJlcWxyDQpjMDAxODAxNDoJN2MgMDAgM2YgYWMgCWljYmkgICAgMCxyNw0K
YzAwMTgwMTg6CTdjIDAwIDA0IGFjIAlod3N5bmMNCmMwMDE4MDFjOgk0YyAwMCAwMSAyYyAJaXN5
bmMNCmMwMDE4MDIwOgk0ZSA4MCAwMCAyMCAJYmxyDQpjMDAxODAyNDoJMjggMDUgMDAgMDggCWNt
cGx3aSAgcjUsOA0KYzAwMTgwMjg6CTQwIGEyIGZmIGQ4IAlibmUgICAgIGMwMDE4MDAwIDxfX3Bh
dGNoX3RleHQrMHg0ND4NCmMwMDE4MDJjOgk4MSA0NCAwMCAwMCAJbHd6ICAgICByMTAsMChyNCkN
CmMwMDE4MDMwOgk4MSA2NCAwMCAwNCAJbHd6ICAgICByMTEsNChyNCkNCmMwMDE4MDM0Ogk5MSA0
MyAwMCAwMCAJc3R3ICAgICByMTAsMChyMykNCmMwMDE4MDM4Ogk5MSA2MyAwMCAwNCAJc3R3ICAg
ICByMTEsNChyMykNCmMwMDE4MDNjOgk3YyAwMCAxOCA2YyAJZGNic3QgICAwLHIzDQpjMDAxODA0
MDoJN2MgMDAgMDQgYWMgCWh3c3luYw0KYzAwMTgwNDQ6CTJjIDA2IDAwIDAwIAljbXB3aSAgIHI2
LDANCmMwMDE4MDQ4OgkzOCA2MCAwMCAwMCAJbGkgICAgICByMywwDQpjMDAxODA0YzoJNGQgODIg
MDAgMjAgCWJlcWxyDQpjMDAxODA1MDoJNGIgZmYgZmYgYzQgCWIgICAgICAgYzAwMTgwMTQgPF9f
cGF0Y2hfdGV4dCsweDU4Pg0KYzAwMTgwNTQ6CTgxIDI0IDAwIDAwIAlsd3ogICAgIHI5LDAocjQp
DQpjMDAxODA1ODoJOTEgMjMgMDAgMDAgCXN0dyAgICAgcjksMChyMykNCmMwMDE4MDVjOgk0YiBm
ZiBmZiBhNCAJYiAgICAgICBjMDAxODAwMCA8X19wYXRjaF90ZXh0KzB4NDQ+DQpjMDAxODA2MDoJ
ODkgMjQgMDAgMDAgCWxieiAgICAgcjksMChyNCkNCmMwMDE4MDY0Ogk5OSAyMyAwMCAwMCAJc3Ri
ICAgICByOSwwKHIzKQ0KYzAwMTgwNjg6CTRiIGZmIGZmIDk4IAliICAgICAgIGMwMDE4MDAwIDxf
X3BhdGNoX3RleHQrMHg0ND4NCmMwMDE4MDZjOgkzOCA2MCBmZiBmZiAJbGkgICAgICByMywtMQ0K
YzAwMTgwNzA6CTRlIDgwIDAwIDIwIAlibHINCmMwMDE4MDc0OgkzOCA2MCBmZiBmMiAJbGkgICAg
ICByMywtMTQNCmMwMDE4MDc4Ogk0ZSA4MCAwMCAyMCAJYmxyDQoNClNvIGFzIHlvdSBjYW4gc2Vl
LCByNCBub3cgaXMgYSBtZW1vcnkgcG9pbnRlciBhbmQgdGhlIGRhdGEgaGFzIHRvIGJlIA0KbG9h
ZGVkIGZyb20gdGhlcmUuDQoNCg0KQ2hyaXN0b3BoZQ==
