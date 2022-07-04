Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7194A565582
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 14:35:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc4yN37jpz3bsl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 22:35:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=IXcYhp3/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.81; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=IXcYhp3/;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120081.outbound.protection.outlook.com [40.107.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc4xd6tj6z303D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 22:34:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgBnBJOQW0ljgH9c5bSaG7D3+lwKENSZEmjZHnsxaGR/wWhB1OZPgjSag9E/zzWeIwJg21j33nFgmZH9FGezcHPTQqMtkda/u3m8WNn1QgcJwB9vUYDpQixwgvnhfl2pnA+9RkZQeri0iqQA7rgro+EuLwtp5HJdODldW/cmIPH9l4SWuvVVCK9URkVdL3icps0ewMxyy8+eReJeFTFq+TuqJy2hQcjaIiHTSPJ5Sv83ZQ02yjRsGMHXIGdyuEVPEpoI7w1jwUMxYSR5r+kf0DgH6vRE5UUe9u3hpZ4TMUHY8Uj0cf0RL34AzW9Cp9nORQ0B2oymVgZxMvLhJzgE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0ak25HDcAD2UMdmdXUOouRQX0i0WAkJ9EKOCwZ/gd8=;
 b=SwqfcF7kx7lGA/YUvZiEk1DvZ04zWaQqG+l2FUgJR7oIgU5qxwLDizWoOaTNgTKCNVELZQdrSbi9eavmjlMPStjLee6v8vCnlwdNlVeQJ9yCefTzPXZwKcvMNkCsc8nX2iYduSPjS8f2aSonDyrlUQjZA/9G9FK/VE1ovVEHce0D+h67G5/LEUBwHem4SSuUtPKlFioijoV1CtkpGDi5iHrIJ7gyAqkvPu3IZdE53mWc3/0BBivKx2fYunNF1P5SIp5keEavEIF/7Zr4r4YxDIcYjoHrxPJvN1cVZVOlWA4qpA1GmMPRLrGPEpqfJ5GOl5GP7mFPiqwSD66+DjBR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0ak25HDcAD2UMdmdXUOouRQX0i0WAkJ9EKOCwZ/gd8=;
 b=IXcYhp3/arvmwixGY5Bbm/sTdtWFX0hEO3Ra9nUDZBZTDOv1IwydOZVnGLpBbjASdEfceNzV2LJItxzYgopZNGpnZ+EBfgbQDX+KA2SFPSjc8Om5ow+KuFDw57B6FMm2f8IhacbRGscHNQepAytLSDK+Uf6aoeLB8xGyDyVZfk/lW37hNPw1bt8VqfoymnHW1ekU/QrfaJ0nUHevh+r8QkaK4Vj+yImKb4Q7rvB1J1eGThfJLf1j2XgaZ9ruexVg7Fn21vUxMaGTJ/f1XBCndYyZMTk/T8AoAlm4XmPsdwEq6pVRaXHvDVSvUEiA4j650S6lPQV95Nov6um5Dih5Ew==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2484.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 12:34:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:34:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Thread-Topic: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from
 WARN_ON()
Thread-Index: AQHYh/kBfzKOa0yAB0m8i9v+dp1MAq1frsEAgAO4OwCAA1WnAIAHaoGAgAANnoA=
Date: Mon, 4 Jul 2022 12:34:08 +0000
Message-ID: <6ab46ef2-6bbd-e758-a7ff-5f62fdf1ca96@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <YsLS02T6TAxN/HcL@hirez.programming.kicks-ass.net>
In-Reply-To: <YsLS02T6TAxN/HcL@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b802030a-ff27-4561-5d0d-08da5db97d8b
x-ms-traffictypediagnostic: MR1P264MB2484:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  81j8esW7DHY8FfPb5zjU2NUJ24W/M4Lts2uOSEl/Pn9ZZplUWo5c+1QbEzJgybcuL0iMUNvW23mPXl+OTm/nEi9Ys0K2+HPYL/tONhiG6na2IYNbMbQOQaN/8UQYcQPstvOJbSOcDMGSKl1SsIcmW0NK/oxZyJfB/2yvRZhYjKNMDQ1gO5oHomm6f9JXFyXWgsDtQKfP/GqxQHrczemuaL8BsFkpnl0oS79LhJPBs3JwE17FIIH8AbBJD01CCuysxrOKEQp8hp45oQUaPFckN+kb/xLPHiImeH23yuvXLDVcmkeB2uxVWuka5d6YLYO+NH+baGR4ZgJzbPmiMhkGk0PPTTf2LS5DLDBbzUyaQGJxdqR+nwhp82OXMn4071e7w6snKv06GVZ/LtBrOVW86IEzC7i3VDMg17VixToFBQMiUEJ5YCVDkoxx+g/+sexUCIM6vQI2F0XwvUYkW7OI0CbWoHLGFsZO2jchAiv9dKfTVXKjwlrbJ49gQ8DGc9/cSwy9G8+0y43mwgyqITHHlap5gAcsXQwwsZR6Tfslup33NRsKDUR5xswJ4rYc+ZLd9P4D/lASG41EWRv5tAyafTh5Rixgpfk3oWbzcrCpUkKYdSnI5qE0LNiy+j0EAb5eikizATwb+pSIsgLjKw7RtdaIPHtYKad+p2SPUYOBZuztVC+BHkzUD5l9y9kjHCb8FWi69yFyDd2Cng6yA9ZfVobkbOLHCxNNHCWtPNRv5L6+GpuhXBTzcmKjbxnJt8ikbzGUrjFOClAJts9QPRP90DHCRUMyHkdeU4Bol3Ya6KW/47Ej9jj7DOPMoYbvHkn6TDL8mfMz9bEBVXGNdeQ0xAauVaOpJqbt9nONdd7xCF0AfZdLMr+pwHu7tonsYlfI
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39850400004)(376002)(136003)(83380400001)(66574015)(4744005)(2616005)(38100700002)(36756003)(7416002)(2906002)(31686004)(5660300002)(44832011)(186003)(8936002)(86362001)(6916009)(54906003)(26005)(64756008)(66446008)(316002)(76116006)(31696002)(6512007)(6486002)(478600001)(38070700005)(122000001)(66946007)(91956017)(41300700001)(8676002)(66556008)(66476007)(6506007)(4326008)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dlhua1QrNkVVc0JUejhjV3NIS2RWU29DbjVJZEpBU2Z3aTlXbG5hTnlXOVZC?=
 =?utf-8?B?ZERoT3l4SVcvdG1HZTE5YVVaZFJ4dUFManhuYlhuTXk1d2ZXR0paakg2RUVr?=
 =?utf-8?B?RnhXWVlPYm1xYnU0M2pNc1JnM2FFaytOdlphT2FUc0ZML1JMNUNaaFFEMWUv?=
 =?utf-8?B?Qm81RS9nQndnT29QOFpCem5JY004RGtpR0gxYlRIb2cweEZWV3hpOG40SjVt?=
 =?utf-8?B?b2pMeE5SZGg5dkhqMkorL0ZJeWJHcGpncUd4Q2tmUVlQcGo4cG5kVU9MTS9T?=
 =?utf-8?B?UE5hUVhSa1pEVVh2VzRYZVBqM3ZyMHJvMmJNb1o1aVd6cTQ4bEZvY1ZuZXYz?=
 =?utf-8?B?YkU4ak9QODBUU0sxTjVmT2hSMHVtMFVOd0ZKcG5rOWZoUllPcGJGenVkekNy?=
 =?utf-8?B?UDhabWFGbWVUYXlPdFE3dnNDY3hBVE9rQVZ3c1FZYWwwZTl0WDFRaE52b3pw?=
 =?utf-8?B?dHh0Z0YwSTVQMFlNMTRjU2NTVU44ZmVzd1c4ZjVMK0JEQWFPRkFNamFKZ2ZG?=
 =?utf-8?B?QWxrMGpockEwL1BTQnd5YzdWY0crTkNlMW83eElRM0x4V2lxYjMyR3F3cVNT?=
 =?utf-8?B?bmdsdmFNZWI5K2djbU1FZXh6Z3g4d0JvVk5KU3AvUy9DemFLTTc0U2tiL3ZW?=
 =?utf-8?B?QXV4c3BsRTdHSzYvaUg3cWZBK3cvL3YzeVRhUy9vUGdrZmdrRnBIR1I5Vnhv?=
 =?utf-8?B?OTlVWDBQK0w1K2hzaFJjc2J1OExvbTQrdkhCcDJ2dU1lTUQzZEgrWFdLQit6?=
 =?utf-8?B?VlErYWFCT2s4WEZTWEpoQ05IRUtMcGhKR2RVUVpwYXdCelExaUYwOWdRcWlx?=
 =?utf-8?B?WDdUY0Npc0ZSQm1WMVlqMU9WNjZjQ3BYV0RWOXhTQmNZdlNGQnM1cnRadEZU?=
 =?utf-8?B?bnhXRzJsL3VZZXcycVJyZ0lnVWp3MjNvNFZOSXJUalRGaHNTMUphODVaV29M?=
 =?utf-8?B?ZnNHVzhJcFg5YzRuZVJPSEFrRVRuZ3RJdWJZelVmUjRRVkppQWp3SFNNNWVS?=
 =?utf-8?B?QUdzRitiM0RreHliVWxibkMxTDhKMllDc3YyLzNyWWtIU1V0L2hxNDhZV0RT?=
 =?utf-8?B?NTk1UHZtS3F1QXdFVlFzYzVOeEpXWlFTMC9nZ3UzTDVZazk2UE1HN0M5cFBp?=
 =?utf-8?B?cmtQZ29qRkhiZDU3UERGbU1UNDN0ZzBqVWh0dE90SDExcE4yekxqTmI3ZFQw?=
 =?utf-8?B?WU82aWRQQ1JRQlkxVHp2aGNqZUJCVnVQVVgwbU1LNmp5Vm53dGhVM05EYVlu?=
 =?utf-8?B?SnZXNVBXVmpnMHQ0L3dyT1RwellBVEhFb3k3ek1ka3JQUG55YWdoWERRSnp0?=
 =?utf-8?B?Nm9ZMjl5WVlCWCtCMDRMREJiRmFtNmM5WVBRb05XRkxkb3dHMVlMR1lsbkZC?=
 =?utf-8?B?VkQyTjBKWVJZb3gwNjVDcjhqTEdkUW5EcTRyVHNPRHlISnMwL094a09jOWF3?=
 =?utf-8?B?S2pPMDZhOTB3NGtnT2pFSW1zOU5iK005UXpJa3FFVzlBVWRvQnU4TWNENC8z?=
 =?utf-8?B?YnBQelh6VUJRZk5kUGZLTGc5YkRXeWZLOXF3cnd1WCs1dERueUNBOTd1RExa?=
 =?utf-8?B?M2NMSGx3YTh4UU9FTDRna2JGVEFYOGFDa0Nrckl2bGNBSVVHdXcyZC9KU3ZV?=
 =?utf-8?B?M3BwSlpmajQyeEVST3NZdzhzSm1TQ245clBDdzZoU1JOTmFuSElNTWRORzVi?=
 =?utf-8?B?L01PdWJ3MHNaMWd4SndOU2hIeWs0Q2E2THY5VXVtWk9MU0hqZklqekZ4ZGNy?=
 =?utf-8?B?QjUzeHJnakJFRnI1dHBka1h1ZWhKN1hCc2syVlVCRHdqM3UzODAwY2JjVzJE?=
 =?utf-8?B?eThoTGJaVGt4TmcwSGZUSEFzWjZFc3RLckJzNXJaby9RT2lGR0dCL2JWNjlu?=
 =?utf-8?B?Q3gySnBYNDJibU9JVFdUWXAzQ21YaG9nNW1qT0orTStJUU14NUdOaFBPNElQ?=
 =?utf-8?B?UXlUUks5cWtQbkVHOHh1Tk5vOUk4S1B4aW1TNlhZdDZ3YmQ3Z04vSWFqZHJF?=
 =?utf-8?B?WHBEMGlJcy8ya2RNSU4vODVoditMdzlRYzVUcThXWVhTdHNwZElWK0xuanl6?=
 =?utf-8?B?SzVPNWVvVlZ0aVFCOHJ2N3ZwQTduWjJHYlV2RkEvNXRsZ0tENzU3RExRTEJ0?=
 =?utf-8?B?K1Y4T21MRmVWL1FWR1B1U3lickNMREl4V0xiMTh6NGp6cGkrZmVIYmVQVzhE?=
 =?utf-8?Q?sfG5fM6b0CeRSlZ9sch1GaY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5465CA16A196DF4BAEBD80246BBBC0F1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b802030a-ff27-4561-5d0d-08da5db97d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 12:34:08.2808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VC4d6TkB1n9PX/0Ik8e8ohLU9BIQGzoSWon8r02gdxJhW9qZd60y5EBwAJx7d+Zlwp9QEPzdI5umEawySgvjFC0ILbzgZgJyzNRrrs/E09g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2484
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
Cc: Marc Zyngier <maz@kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, Chen Zhongjin <chenzhongjin@huawei.com>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjIgw6AgMTM6NDUsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFdlZCwgSnVuIDI5LCAyMDIyIGF0IDA2OjMwOjIzUE0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+IA0KPiANCj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhhdCBmdW5jdGlvbiBo
YXMgc2l6ZSAwOg0KPj4NCj4+IDAwMDAwMDAwMDAwMDAzZDAgbCAgICAgRiAudGV4dAkwMDAwMDAw
MDAwMDAwMDAwDQo+PiBxZGlzY19yb290X3NsZWVwaW5nX2xvY2sucGFydC4wDQo+IA0KPiBJJ20g
c29tZXdoYXQgY29uZnVzZWQ7IGhvdyBpcyBhbiBlbXB0eSBTVFRfRlVOQyBhIHZhbGlkIGNvbnN0
cnVjdCBvbg0KPiBQb3dlcj8NCg0KU28gYW0gSS4gSXQgaXMgbGlrZWx5IG5vdCBhIHZhbGlkIGNv
bnN0cnVjdCwgYnV0IHRoYXQncyB3aGF0IEdDQyBzZWVtcyANCnRvIGdlbmVyYXRlIHdoZW4geW91
IGNhbGwgYW5ub3RhdGVfdW5yZWFjaGFibGUoKS4=
