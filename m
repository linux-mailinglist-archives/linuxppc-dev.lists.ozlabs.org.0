Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B3456BCCB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 17:11:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfcF95ktgz3cFJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 01:11:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1uMMO2Os;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.52; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1uMMO2Os;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120052.outbound.protection.outlook.com [40.107.12.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfcDQ5VKhz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 01:11:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9bo4BYdN+TnhJ28PxlIcoSMCH5Y6SfsIHLQRWu00tHnLH2Gsitv2UHLxtv9rXZx/vyQx2EBjdHWX2sc7kKePv5v4yaBleKbEQ+TvkOkuac+mnvWti4XE3VQtxJWcfZSESegYCcb96bU0ShBkBqZn37UMF7vcvJ0Zgiie3gjGzLADtn5f/SBc14C+4Z+q33WFWrQIBgQYFGJRDtuVHON8ingC1p2VNGa/tGIGHlDVs2Cg606qCR7TSQ050rCwfRY13Q88Fxv3BY+QPIvD8HSL0qHU/Tz3V4hpO2IjnRD/lWr54cCVS9rSinLvUbIA9fYk5D13QuvL2wt8qESDJ4PtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGYlmS7/NbdAxxQ9J/bLNLrdpahkFrhGc2D1MEbS+qk=;
 b=howqvl7Dvr3zfPS9dZEej+7PRjHLH1+O+N/pwl6oOWr0aE0s5hHCE63KcYCdTs+sEPORAmzx8j7wUfwN9JgKvSeTKseKKMeFmyW3paUSE1uC50JQU71smZ2RnhFkkjcptof0/DXMNnzFdAWTfzji/2LJTd2MUsr0mr/vwYuVu5UjXd6UvcNSRV/rJ0qGDu86jfHw3xqnAhnU+nxc5RK6RBSUOrS5UPThG1nSdnFI3EYwx38f1+vtlX1QN6NuPxiatDR4QBcn/7TikCIuzSM8jSaUjhfVviVE0tKBqaOBvS10/X55s0+zGof8TybhGof+iphrAFmAOLs1dXSyesEsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGYlmS7/NbdAxxQ9J/bLNLrdpahkFrhGc2D1MEbS+qk=;
 b=1uMMO2OsbFLS0gvBc9iSAmvjXP8+bS/tTaNbHkEAyOPZ3cZ/PTiKH+Xy2OnGfYRrfoVrfH4BQ6FjBTxyBrKYrSluZ0JtZVl1a7u8Swk1sZU8MCO0VyWIcJ4m8SrxFX/oIXX+B25TUn2eHpD3VSijQV5YaPqKbpXd3Fdt+y2pbPn3MuBdhfYk7UY3WPhRMDM7C8he7l7FA2JLVmAoiouGtF/lhJ6pzYZ5pUy8HwC9bmbRd+NdkSwikcFc0kIYs7Jq7CQepdtf4+G2MtooBaFUCnkrdKuwjFShNifir8gyKBVxaqS4XmRr1PpUdqRuYdnAmulDftBuYodpu9Ukfn4iEQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2923.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:10:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:10:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH v3 01/12] objtool: Fix SEGFAULT
Thread-Topic: [RFC PATCH v3 01/12] objtool: Fix SEGFAULT
Thread-Index: AQHYh/jgP+b/vbtPLEeoo4BHsjdC+q10qdUA
Date: Fri, 8 Jul 2022 15:10:43 +0000
Message-ID: <04cfb78a-8c0f-95b0-4bc2-dbca096a4b08@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-2-sv@linux.ibm.com>
In-Reply-To: <20220624183238.388144-2-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fc24e9e-5261-43bd-1879-08da60f40749
x-ms-traffictypediagnostic: MRZP264MB2923:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  n2L2A9zOXPGrbsVI3jrTo91X44tG2KkjEhAD84M4FZb4IZ5GBLJKoVwfnr/2eHZuGGCFGRWTIApvKos3q0nJY9g2v3S+qtfCQEq7cDNTuEd/FXRHISgWIYtPwitZy8SNLf0Mem9THsgxLcOG7+6aWf2OiY0WO8/QuvCYewpxaW0u/u48Zoeog2eurIwRFzV6cPD7/S/+Mk1Qeyp2eJoA4Y8kddgax7+Ldz7RgD45eadYvnZ1s09gPnXYs1ACJAlt588Ibydh9w+j8sHITJUaGlhbnkna67lhmGke7BB5x+5+itEca8+XowMNxrvCGbrqzXrGLzq81iuY9h2S0mkjhdGxk8NH5Ljn5dch1kz5nJid9+GoziwLUVVjOP/XUTbDuU20Tf2Nz7QxqrOzIcBC521fdKHk2n8z+s2QcfEyXgPMhWmKbKSy29OLzWVWcK5cD4hEKoSC+QMx91z2dQz8mGe3tsEWQlx87Ve+fkXHrSFZTDJyky3EhA/U0kLK3kUoKa0upCYEE8X4xF7mTCJxCnjOfSxzUWO28uhV9BHGm8yqgEO/wh0sL7Igr7y7yKDlcNZ7akzxJ1lwntKcqxnjJZyDZBjOnmfa7CXHVxUjg5aLIWlpBrWmuq/InMHG2fwB3zYZOdJoxFvVDooGZPao3X+wkqCrO1TaAPbt2IdOkvy4BOCOsrMgb5m+PuHZ7cmoehJeXPjDcEiNsQ7vjTgW1G+NxMozy9dqCO27TZuZr/G9h1GqRpeCoyM1ixWXbiHNcNxwJqZ+Jf6IKesHjacm8yHQKwlNpjGSxcGuE10hoZr3JJqwprRvpIoS6OuLXhQiY0io3oXoEO+VD6A4H6JJ33EZ7XRs2ejXtAOvV9xFX+AZYRU6AKiqC3nERNxgttRK
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(36756003)(38100700002)(31696002)(38070700005)(44832011)(478600001)(122000001)(4744005)(5660300002)(6486002)(316002)(86362001)(2906002)(7416002)(66446008)(41300700001)(8676002)(76116006)(71200400001)(8936002)(66946007)(26005)(91956017)(66574015)(186003)(64756008)(66556008)(4326008)(110136005)(54906003)(6506007)(83380400001)(31686004)(66476007)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NkxUVXRNT1RPQ2FiTTdMOFVzZi9TZXc5TDE4WkRFMk13QW9IRVdZeURTdHJP?=
 =?utf-8?B?eDlYcVZVWlJNOSt3N2Q3UW1xblZyRUxldy9kNFNiSzZjN0hsMEhUM0VOVC9a?=
 =?utf-8?B?MWllMEtjUjB5Mi9ZUnVUclllKy92YzhIbGZqaXAzQm5NZDRYZ1ZMdEMybkVr?=
 =?utf-8?B?V1l6NWFYeXhEMkQxUnFpMnJPYktGS1hKZFFiS0J5S3pCc3NGMk05KzROaEps?=
 =?utf-8?B?V1AxaXhuNm1RZ0R3dG9lanhKMkpkN2tqSGI4YXNYM0h5bEhzd1NrdDNaNGRm?=
 =?utf-8?B?cmI4WjAxMVdadHNqbDJGTEFJYktFQ2lnZ2JvREEwYU9KR1ZVRW9OVzVpczdQ?=
 =?utf-8?B?VGRIQmhLekhxbVIrcjNvbGxTUWJOKzlnelRCVDBZSXMzZzN4TGpqc01BbDVP?=
 =?utf-8?B?cytyK3BWcWhLN0N5ZW1wU29LTitlalZpMjZ4MERtMU54dis1OEorVWxFWk1G?=
 =?utf-8?B?b2R4MVJFclQ5ZFBKVFNsajhvOHZkbGdlb2VpVEREN0tjZlFGcVM0TndiUlE5?=
 =?utf-8?B?cEJXTjExMlR3MmFXRHZKenhzL2ZaZDFISFJwOHFHSHpZTldQSEJuZ2twNXlJ?=
 =?utf-8?B?bHJnNXdaUS85UDN0STZRc1cwTVNLU2dLbTJ5aFk4ZlNEWEF2UitvZjhhOG8w?=
 =?utf-8?B?NjBuMlRRRkp6YkRqTGhXSFBRMFFBclBYYXZabzhaeXRBb0xhZldEc1Q2UUtl?=
 =?utf-8?B?SFBZUmF3TStncXRCNnhmck1BdEs5eFE5NjB4VkE1SVE1eXNSMkp0djFvSm03?=
 =?utf-8?B?dERJTEFjdE4zdEdFNmhFUVVQTVR3V2hoNDBqV29vTUFjZ0RRd0t0amxna1hY?=
 =?utf-8?B?V0o2dXUreTNaZnVwYVhva2MzRlNrZC9ENnpIWXZ6MjhhVUhtRFJaUHhRQUNN?=
 =?utf-8?B?U1hKTGlEYlFNMG1oK1daL2lnZEQ5a2FYNm8rNFlhZEh1cmhSTmxwTzhDSnpP?=
 =?utf-8?B?dE9vT20yM2V2YVhwcU1EU2RQejg0dWJlRTFwSE4weUxqYWlLU281VU5mcExH?=
 =?utf-8?B?MzNoWHh0VW5YUTc3ckVTbUNidVhGQXBwdndWODkyaXpTN25nMTNpbUhTUk1G?=
 =?utf-8?B?Q0FGS0JtNDUvalNoaDZYTGpWVDFtUFJiVVZ3c2U0Z3VRMkc2RUFrQWtSd1N5?=
 =?utf-8?B?VWh0NUlobStPNTkwalpmU0N5SDUxZWErWmlnM0RTQ2ovejdkMjVVUGsvR3NZ?=
 =?utf-8?B?dEFFWmlSNE5QdGpPRERuNThzeU5XTXhabWl5QURTL2dhdWJnZVZHc3M4SzRi?=
 =?utf-8?B?YTE4b3FPNHNhNmNZREhEdzQ3VUsyaHA2NTREdG9xUWhGcHk3Zk5ZWnEraFdw?=
 =?utf-8?B?NmxJZE9aRnJvZCtDVG9aYzBUK2ErUlNlSEYzSEo0cjRoN2VSQ0RpaVd1dmdh?=
 =?utf-8?B?WXNoWXh4UWttdW91VllpNkpxWTI5cDZRNnNKV0ZuZjZNSnVWd2JDV29tbFgw?=
 =?utf-8?B?Tm5jWlZIdHVGZlphRTdwM0pJNUJQNWtyTnA5bFdYMDhubU9uc244SnZDTEx5?=
 =?utf-8?B?K1FWUWNrb1QraVFaQm9tTUlKK3lROGtkdVVYY1dPRWljUW9ZbUkyK3REZFpP?=
 =?utf-8?B?Mm1OYnVMU2JWdnRmeWJtZ1NoRU4rNCtWeE5GdWtBYUE0TjRoZkE2QnE4SWtT?=
 =?utf-8?B?TW9sa042b0RUUlFFeFNKY05hZFduZWpINGRreEhzclNjS3EyN2o4RGtuYnl4?=
 =?utf-8?B?RW4rcDZGWUI4MVZhZVFSQTVXMmorSytweHFoSm5iVmh0MlVyYmpkek5zSW9V?=
 =?utf-8?B?aC9ycE9IWXlnTGdjUGVnV1NUbGZaT2JrWlJkZDFsWU5oVHBZTVJLK3NDa3VL?=
 =?utf-8?B?TDhwbi8rbjJHWkpWdXlsSkdnVEQxNUxMQk5kTUpWNnYwVzc1a04xSTRzdlYv?=
 =?utf-8?B?czRsd2t1QXQ5QW1rU0hVNzZpVEtSVjdDNFhXU1IwUjdpTmtTY3lDOGZNMGk2?=
 =?utf-8?B?ZC9pYitmZThDSlh1SldMVVRrQXIxc0dvYlVNcS9sNVN6aE0wYVc3di8yMzJI?=
 =?utf-8?B?OWxNdDQ0MkJyeUt3UzdudHN1YkQwekY4ZDBrajB2K1Bpd2xRUzBqMWl6bGdS?=
 =?utf-8?B?bTFVeXFDNnliRjkyMTVUSkw4Q0VjS0N6cFE4ai84NTVqMVAyUjZzTUNocEk5?=
 =?utf-8?B?bEp4M0lqU3BuTXdkdUxnZmE0T3BTYTRDLy9OdU85MmJFK3N5RzA2OW1tZkFx?=
 =?utf-8?Q?hMbfu9fhRYjpRohWxif3GF4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5994D2D31C860D499151C1CFB0C428C6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc24e9e-5261-43bd-1879-08da60f40749
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:10:43.6239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ke0ZPnzqQaclH6eTqMB9XJJmIPfpwrox3dXsZJv41gAldB3DFNy0YLWLd73oskziCJZfgjBt7SdxxtnvqfewnNiiXZCYkP3DkqNVqNzYWEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2923
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMjA6MzIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBGcm9tOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+
DQoNClRoaXMgcGF0Y2ggbmVlZHMgc29tZSBkZXNjcmlwdGlvbi4gQ291bGQgYmU6DQoNCiAgIGZp
bmRfaW5zbigpIHdpbGwgcmV0dXJuIE5VTEwgaW4gY2FzZSBvZiBmYWlsdXJlLiBDaGVjayBpbnNu
IGluIG9yZGVyDQogICB0byBhdm9pZCBhIGtlcm5lbCBPb3BzIGZvciBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gLS0tDQo+ICAgdG9vbHMvb2JqdG9vbC9jaGVjay5j
IHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRv
b2wvY2hlY2suYw0KPiBpbmRleCAxOTBiMmY2ZTM2MGEuLjZjYjA3ZTE1MTU4OCAxMDA2NDQNCj4g
LS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2su
Yw0KPiBAQCAtMjAzLDcgKzIwMyw3IEBAIHN0YXRpYyBib29sIF9fZGVhZF9lbmRfZnVuY3Rpb24o
c3RydWN0IG9ianRvb2xfZmlsZSAqZmlsZSwgc3RydWN0IHN5bWJvbCAqZnVuYywNCj4gICAJCXJl
dHVybiBmYWxzZTsNCj4gICANCj4gICAJaW5zbiA9IGZpbmRfaW5zbihmaWxlLCBmdW5jLT5zZWMs
IGZ1bmMtPm9mZnNldCk7DQo+IC0JaWYgKCFpbnNuLT5mdW5jKQ0KPiArCWlmICghaW5zbiB8fCAh
aW5zbi0+ZnVuYykNCj4gICAJCXJldHVybiBmYWxzZTsNCj4gICANCj4gICAJZnVuY19mb3JfZWFj
aF9pbnNuKGZpbGUsIGZ1bmMsIGluc24pIHs=
