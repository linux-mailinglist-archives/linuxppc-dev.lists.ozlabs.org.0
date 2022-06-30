Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A95616FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 11:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYYj25Vb4z3cg1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 19:59:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=62xOtFeL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.53; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=62xOtFeL;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90053.outbound.protection.outlook.com [40.107.9.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYYhF0qY3z3blq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 19:59:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWTCFg58Yk8LI4pYCCFT+Rqf8TJBqnqSOWMS4aKCtzskk/DgLr7sYiU+IGHC+wK3xDqXKRkiApQ9H0TqStF1PY5E8cORk6FGoltv0G/CD8baBQZH3hzmRuCnSgmcYe+0HrvFDGZFC9Q/Dj8iqVH+ZG7zo85KHjWfTTDPYKF79JvyEihyquJWIdIFdlrv/a/ldr/9MPZ3T3qYrjFQrIrwAdAJQkO76T4D7Fb0Yk9m3uhQaUNwVFUAubmgugx/wUnhK7/ZKbAB6uXwwey3TXxAN/dtC9Y7X3Qr7CN1PUnXDOdUtEfBk6+o/gCP2meVIsGhnMvXhMPrrCUJc9y7A7sw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TErd66LM0kyNutAwL5LY+2ijI/vOUcXUSgRtkDFfOTg=;
 b=HVmqFX3o9GbHQzENHygN2hfwxBZTaR4nrF2GJtPUDKQByOQdHiQk2kHuWBId3XI8cpOlrdM3HhSJHDVMyustPFAE3ocCowJDYCNFZ+8bjkP+dOaKd0JEupbXNM4gf+h53UbuXdRhpMppA25fo9uX23IikTwtaOx0AWOaYwu5Mzz5bW8JRCbYKs5Yhm01nLdn9mYlNDEHrpQag3PKTMfm5Yu9Z+4YvbEXefxI9oGEh72iLZhit/PpbmYL/om1o7EOmXPSTJhYJKaVGRWqsvPq5rsUDxTbuma2MYqcGlJbjrbS7j3Y+Y9iMtN+rQehnw2qsDNpepdY4ge4XDr7bv6egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TErd66LM0kyNutAwL5LY+2ijI/vOUcXUSgRtkDFfOTg=;
 b=62xOtFeLQsdlBJtUbDxY+ocDVaHotndRrp8gKgpLdAWBl+sg+yNMjT/5nAqK/hsk/VrO88cQaQM8wT7PeFxfScMpDSo/igEv+NjNLdyUB2qRUG2H8Wjp6KE6X+PD1fJkJISw/FeXP7f2CywgQGiO/50qgfOClG0DWfclsTmEmsqifrfRb5SQW+r7yY+QI3ec0sCYmO8JhREj8KSofKXi4b1YEYKnpZ56R36jLemJTo3dEGrmLMYKjsJG8H6zOuDnU9dnombCqhJctG/MTpFTvLEpd7mmsj1PJ1066seSB8xtSi2FYzAYjRyy9ckxI+MH55DaY2VuTUCZg5a584whkw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB4031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:18a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 09:58:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 09:58:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika
 Vasireddy <sv@linux.ibm.com>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Thread-Topic: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from
 WARN_ON()
Thread-Index: AQHYh/kBfzKOa0yAB0m8i9v+dp1MAq1frsEAgAO4OwCAA1WnAIAA46UAgAAfwIA=
Date: Thu, 30 Jun 2022 09:58:48 +0000
Message-ID: <da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
In-Reply-To: <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06de3582-6c45-4e6e-2182-08da5a7f20e6
x-ms-traffictypediagnostic: PAZP264MB4031:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hRoCQsClLhFAIj0lXTfXxu+VAPS0V2vlZbnBo5XfHdrualrgqt0FnEJjYJvD/xcpW5atLYzdgaQqWcEvWWdNzJ8b1ROgC/74W2ngmqCJSNWHWu9SXksjmph/Uj65iJPVp3OVGd2FJnGdNAseZIWRAKu3+F3/lKa6aP7xyTLHqLaQ9oZAAYj2HV3cWyML6QJdpGpl4ptiYx54e4AeTPU6V6KARsaUbxPIoIdvwl61K1gk1s/iMazNp5oDMDNVSk9+rSdmZFmpYQXbHrbbINZQ4ZqGQ5hwRDe4ao8cEf0Azk34KxEHX5S4dGWx7nPQJVOMu9/tentMLibomsWAzyMukxM8qEqlUZ64k40wvyOVHSXIiQEnSMzMwF4jV8DHclvoz+XnAuUhE0Kf47Jdsyw4WLe/N4/Yu66IjfqLFnwTXT4BITEq45/5wWdtUYoJjSHqGeT6VaFuGz6dGK3CvlajLmg+T6Q3mN5ARDIcw7JN3ZS91nddjk+cAa3NLo4Bbu51CAanEz7jIsfGDL6WJ4evSt2zspyCnD4CKqG8WGxOcGNNCDFDr4YKGrzwqn7JiDRwp+18rrWXQTmg3q0M7ImDoGswxE4N5d5Trvwb4GqD0JTYV1I47lEqIzqNPDhh0Hx0cb+6mvM/hNK3KvqfHn2NLMFFr08OcjsWuS69NhSsnpzvd53IAC/btBPw+VTqa+Z4CP3g8E56fa+cMicu9EqmrHEBLMrfiTg4IZFFZaM3MaftwswIQyoacEh5+IdgzKWESdTCnqzZOISj6ZYOOUKHiWfePMCq85ZZs3nxlFZP9jaV136trDw+ExsniqfYaOWzwooVR1qbR0ieo5Vt32IdRwZ4joyHEZYa20gGbU4QwGOkva/kaA94sQpjcXfttyzfbFcZXAocmaz+0xTIdRXUX5ijSHrxcaEgjuysgCjL0c8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(66574015)(8936002)(91956017)(5660300002)(83380400001)(53546011)(54906003)(110136005)(36756003)(7416002)(186003)(31686004)(6506007)(6512007)(26005)(41300700001)(38100700002)(86362001)(478600001)(2906002)(44832011)(64756008)(66476007)(76116006)(31696002)(71200400001)(966005)(66556008)(8676002)(66446008)(316002)(38070700005)(66946007)(122000001)(2616005)(4326008)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bzlFUURPckdOTFhyLzVCOFMrcDZvNzdGUGJXUzZ0eGcxWXkwWWhyV3NlVFlh?=
 =?utf-8?B?aHhhVGkxZWN2ZHFmSXFYYkNyeG9kT2x1dGpQM0VqZzBWQ1kzcHFjQjhqTk10?=
 =?utf-8?B?QmM0MjZWSmVFUWNqMzBxRC95dFVQR25Pd3pqQlJRaE5FUmdoRkdrUjI2bTRC?=
 =?utf-8?B?d29VbHFRazBNenhrZ3A0dVpIODBVMTAvQi9EZ29kMVZjNUl6ZzkvY3BlTDk1?=
 =?utf-8?B?S29qazYzNm5ZWndwOTlKOFMzNk5BNm5yWUlRaXZkbG9tU2NWN09DUGh5Mldp?=
 =?utf-8?B?bm1wK1lCVk10RU0vbE5oUVBWU1ZWa0R6THRJdTA0V1RsNEo0SHZXOGVmUmlK?=
 =?utf-8?B?bVhxSVNpOXFLL0tWSEFmV052N1hmbmxRY0NVZjJaeE9iY1Q5Rm5TSkk4c1Nz?=
 =?utf-8?B?aU54bUZ1b0U4eDRZaVJqNUwxdFFDT3VMdnpHVyttQ2JDT1RhbDhkUUVoNzFz?=
 =?utf-8?B?SnRRTUNvSVVwZk1VQUpncjY4ODBlUU1KVjVaNXJRTjhqTWRKS2h2L3VIY3Rt?=
 =?utf-8?B?ZVk1eTdJNmZ3Ump6TVpkRGRqTUlTWklTRVl6TS9ySzVCeDh6T0t1ak81NFRV?=
 =?utf-8?B?UEZ5OG5QRFZGbkYzTnp6T0dSZ215T05nNGlPcnZFTDJpek9WWTJLbGZXbGtq?=
 =?utf-8?B?bUo1RVU1NUFGbXlkR3llUnBmNkRqSXYzQndqQmVOVUkvOFQ5cC91bnFXLysv?=
 =?utf-8?B?ZFdYREJxSUpKeUVwY1M1UUZ4dXdPbHBOdjNPNDY2SWk5ZWU2MHlxK3IxeFpK?=
 =?utf-8?B?TEgyL0xDQ3RMMVVoSE1nVUZ2VjJJNUpKZ3BjbFNWQW54Q0V3SVVyVE1WWWtQ?=
 =?utf-8?B?Wk9pc3FZQXB1UWp1S2IxdGJjTlE3VVF5SVA1cnh5NWlla1NaWnlLUUlja2tP?=
 =?utf-8?B?aW4zRzlyYVhtVjNqOW1vOWRDZHArV0RmZWVKRFFHZzh0bDBBVWEvQ0lHbVZS?=
 =?utf-8?B?RDlpQ3UwOWs4SytYLzFUV2FzNXE5NUR0dTFZOWwvR1BFaW9GaWlSb1E4cGo4?=
 =?utf-8?B?TWpBYXlTMXBaWGpzcUZob3pMUEptTXl3YUQzbVhoNHdWYXhrbFYrZXRTcUFD?=
 =?utf-8?B?OWlYMTMxRlZFeWdnOEFBNjNiMzRBOFNjY25qczVJUG1kTEc2cDduSFp4QXBy?=
 =?utf-8?B?Ri9YOVJSWEJJY2RwU2FBTFZDRFNYT3pjY3JhZVhVVWk5UlFITlZOTk5IbW1T?=
 =?utf-8?B?WmRvbWpTV1dEUlJEM1NwK0hIYmFoVUxBWm51L0EwQTF2RGsrR3hxeTdJcVVo?=
 =?utf-8?B?MmV1NjlQbFJSQkFraEdTZmxmQ0psRGZzemNoUFNsNENlemZzcEtlQXVMQVBq?=
 =?utf-8?B?SERQVDMwMkhieEk5andwVnNTMzZDaEdrRCt2OXdGMHhzM0Q2Q2NzR1h0bm1m?=
 =?utf-8?B?VXdSTEExVmZXSkFCZ3lsNHp1RXg4elM2VVdyL0FsTG1kajZ5UURwMy80YU5P?=
 =?utf-8?B?R1NKVURRLzA5NVVYWDhMaHlEVUFTNncxc2NEeVFyQmRHR2lKMDFaWjdtZVdK?=
 =?utf-8?B?SUJ2YjdsdU1MZXRYN0VuR1NTOUVlaXg1cnpWSzhNWmt3M3FXb0laemg5RXly?=
 =?utf-8?B?TFRhWFVCV1NDVVZyTktBWVUyUHVaRWFReVBRREhZcWs2Q3UzT3dBaEJ4SFlm?=
 =?utf-8?B?Rmxwbm1qUitSTjFUaWlyWEtiSllHQWxUTXBiZzloOW1ldEloeWhxNlMweWhY?=
 =?utf-8?B?MkpsUmM5dWtWenJ4N20ybGMzYVVnTE9aeE02c1paRWFjcWJXS2lSWSs1bUxI?=
 =?utf-8?B?dG9leFVSaVNpTjJLWTdOMmZ0WjRDRTNPQk1PaEFIZ3hDU2lHb2xGOWFrRDVr?=
 =?utf-8?B?bVhOYzhoR3pMeGFBK3FVMlBSKzI1S2JnNUFTMktVTEVTT25RekVXRHJ0NHdR?=
 =?utf-8?B?SGpzV2dqa2YzckdoeUk3YXh3QzlVcUVuak5mTmNQRW1VQkJCVkVLa21jT3J2?=
 =?utf-8?B?M0F4eEJQWW1iNmNJUGZRSE56cnpyZjEzWkowR2dCbnlRbklFTm55aCtkbkZH?=
 =?utf-8?B?UERZQVNtcFJvNFZST21CUWNJdGdRNytNQlpDTkZhVk9qdGtTTHZZbFl6ZnBj?=
 =?utf-8?B?R1pSMmZOSkJ4UG8yT1lkMkdnc1BCYjN4SW9aV01vSzM5UDFUNU9QcE5UZmFS?=
 =?utf-8?B?L2lVUXAyS3dGMHZTYnJwZkRGd0V2TzBUcFBnSjdGdkU1SGtGeVgraW0vZ0lE?=
 =?utf-8?Q?PLGiOmu8meg+mMP0UeE90rc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41F6CAF0BED5AD4B9FA531313FEA5803@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 06de3582-6c45-4e6e-2182-08da5a7f20e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 09:58:48.5177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Apg9omxIBrqmzaxjfLbWpQyHb4Tj4K2rRJxSMzSCewA6tc/YmwDLD82l33zDv0Djr1VflWlFjMbQWekOrQdlkTNvM3PNyMqNEVGjFgClCGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB4031
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
Cc: Marc Zyngier <maz@kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzA2LzIwMjIgw6AgMTA6MDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IEhpIFNhdGh2aWthLA0KPj4NCj4+IEFkZGluZyBB
Uk0gcGVvcGxlIGFzIHRoZXkgc2VlbSB0byBmYWNlIHRoZSBzYW1lIGtpbmQgb2YgcHJvYmxlbSAo
c2VlIA0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWtidWls
ZC9wYXRjaC8yMDIyMDYyMzAxNDkxNy4xOTk1NjMtMzMtY2hlbnpob25namluQGh1YXdlaS5jb20v
KSANCj4+DQo+Pg0KPj4gTGUgMjcvMDYvMjAyMiDDoCAxNzozNSwgU2F0aHZpa2EgVmFzaXJlZGR5
IGEgw6ljcml0wqA6DQo+Pj4NCj4+PiBPbiAyNS8wNi8yMiAxMjoxNiwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToNCj4+Pj4NCj4+Pj4gTGUgMjQvMDYvMjAyMiDDoCAyMDozMiwgU2F0aHZpa2EgVmFz
aXJlZGR5IGEgw6ljcml0wqA6DQo+Pj4+PiBvYmp0b29sIGlzIHRocm93aW5nICp1bmFubm90YXRl
ZCBpbnRyYS1mdW5jdGlvbiBjYWxsKg0KPj4+Pj4gd2FybmluZ3Mgd2l0aCBhIGZldyBpbnN0cnVj
dGlvbnMgdGhhdCBhcmUgbWFya2VkDQo+Pj4+PiB1bnJlYWNoYWJsZS4gUmVtb3ZlIHVucmVhY2hh
YmxlKCkgZnJvbSBXQVJOX09OKCkNCj4+Pj4+IHRvIGZpeCB0aGVzZSB3YXJuaW5ncywgYXMgdGhl
IGNvZGVnZW4gcmVtYWlucyBzYW1lDQo+Pj4+PiB3aXRoIGFuZCB3aXRob3V0IHVucmVhY2hhYmxl
KCkgaW4gV0FSTl9PTigpLg0KPj4+PiBEaWQgeW91IHRyeSB0aGUgdHdvIGV4ZW1wbGVzIGRlc2Ny
aWJlZCBpbiBjb21taXQgMWU2ODhkZDJhM2Q2DQo+Pj4+ICgicG93ZXJwYy9idWc6IFByb3ZpZGUg
YmV0dGVyIGZsZXhpYmlsaXR5IHRvIFdBUk5fT04vX19XQVJOX0ZMQUdTKCkgDQo+Pj4+IHdpdGgN
Cj4+Pj4gYXNtIGdvdG8iKSA/DQo+Pj4+DQo+Pj4+IFdpdGhvdXQgeW91ciBwYXRjaDoNCj4+Pj4N
Cj4+Pj4gMDAwMDA2NDAgPHRlc3Q+Og0KPj4+PiDCoMKgIDY0MDrCoMKgwqAgODEgMjMgMDAgODTC
oMKgwqDCoCBsd3rCoMKgwqDCoCByOSwxMzIocjMpDQo+Pj4+IMKgwqAgNjQ0OsKgwqDCoCA3MSAy
OSA0MCAwMMKgwqDCoMKgIGFuZGkuwqDCoCByOSxyOSwxNjM4NA0KPj4+PiDCoMKgIDY0ODrCoMKg
wqAgNDAgODIgMDAgMGPCoMKgwqDCoCBibmXCoMKgwqDCoCA2NTQgPHRlc3QrMHgxND4NCj4+Pj4g
wqDCoCA2NGM6wqDCoMKgIDgwIDYzIDAwIDBjwqDCoMKgwqAgbHd6wqDCoMKgwqAgcjMsMTIocjMp
DQo+Pj4+IMKgwqAgNjUwOsKgwqDCoCA0ZSA4MCAwMCAyMMKgwqDCoMKgIGJscg0KPj4+PiDCoMKg
IDY1NDrCoMKgwqAgMGYgZTAgMDAgMDDCoMKgwqDCoCB0d3VpwqDCoMKgIHIwLDANCj4+Pj4NCj4+
Pj4gMDAwMDA2NTggPHRlc3Q5dz46DQo+Pj4+IMKgwqAgNjU4OsKgwqDCoCAyYyAwNCAwMCAwMMKg
wqDCoMKgIGNtcHdpwqDCoCByNCwwDQo+Pj4+IMKgwqAgNjVjOsKgwqDCoCA0MSA4MiAwMCAwY8Kg
wqDCoMKgIGJlccKgwqDCoMKgIDY2OCA8dGVzdDl3KzB4MTA+DQo+Pj4+IMKgwqAgNjYwOsKgwqDC
oCA3YyA2MyAyMyA5NsKgwqDCoMKgIGRpdnd1wqDCoCByMyxyMyxyNA0KPj4+PiDCoMKgIDY2NDrC
oMKgwqAgNGUgODAgMDAgMjDCoMKgwqDCoCBibHINCj4+Pj4gwqDCoCA2Njg6wqDCoMKgIDBmIGUw
IDAwIDAwwqDCoMKgwqAgdHd1acKgwqDCoCByMCwwDQo+Pj4+IMKgwqAgNjZjOsKgwqDCoCAzOCA2
MCAwMCAwMMKgwqDCoMKgIGxpwqDCoMKgwqDCoCByMywwDQo+Pj4+IMKgwqAgNjcwOsKgwqDCoCA0
ZSA4MCAwMCAyMMKgwqDCoMKgIGJscg0KPj4+Pg0KPj4+Pg0KPj4+PiBXaXRoIHlvdXIgcGF0Y2g6
DQo+Pj4+DQo+Pj4+IDAwMDAwNjQwIDx0ZXN0PjoNCj4+Pj4gwqDCoCA2NDA6wqDCoMKgIDgxIDIz
IDAwIDg0wqDCoMKgwqAgbHd6wqDCoMKgwqAgcjksMTMyKHIzKQ0KPj4+PiDCoMKgIDY0NDrCoMKg
wqAgNzEgMjkgNDAgMDDCoMKgwqDCoCBhbmRpLsKgwqAgcjkscjksMTYzODQNCj4+Pj4gwqDCoCA2
NDg6wqDCoMKgIDQwIDgyIDAwIDBjwqDCoMKgwqAgYm5lwqDCoMKgwqAgNjU0IDx0ZXN0KzB4MTQ+
DQo+Pj4+IMKgwqAgNjRjOsKgwqDCoCA4MCA2MyAwMCAwY8KgwqDCoMKgIGx3esKgwqDCoMKgIHIz
LDEyKHIzKQ0KPj4+PiDCoMKgIDY1MDrCoMKgwqAgNGUgODAgMDAgMjDCoMKgwqDCoCBibHINCj4+
Pj4gwqDCoCA2NTQ6wqDCoMKgIDBmIGUwIDAwIDAwwqDCoMKgwqAgdHd1acKgwqDCoCByMCwwDQo+
Pj4+IMKgwqAgNjU4OsKgwqDCoCA0YiBmZiBmZiBmNMKgwqDCoMKgIGLCoMKgwqDCoMKgwqAgNjRj
IDx0ZXN0KzB4Yz7CoMKgwqDCoMKgwqDCoCA8PT0NCj4+Pj4NCj4+Pj4gMDAwMDA2NWMgPHRlc3Q5
dz46DQo+Pj4+IMKgwqAgNjVjOsKgwqDCoCAyYyAwNCAwMCAwMMKgwqDCoMKgIGNtcHdpwqDCoCBy
NCwwDQo+Pj4+IMKgwqAgNjYwOsKgwqDCoCA0MSA4MiAwMCAwY8KgwqDCoMKgIGJlccKgwqDCoMKg
IDY2YyA8dGVzdDl3KzB4MTA+DQo+Pj4+IMKgwqAgNjY0OsKgwqDCoCA3YyA2MyAyMyA5NsKgwqDC
oMKgIGRpdnd1wqDCoCByMyxyMyxyNA0KPj4+PiDCoMKgIDY2ODrCoMKgwqAgNGUgODAgMDAgMjDC
oMKgwqDCoCBibHINCj4+Pj4gwqDCoCA2NmM6wqDCoMKgIDBmIGUwIDAwIDAwwqDCoMKgwqAgdHd1
acKgwqDCoCByMCwwDQo+Pj4+IMKgwqAgNjcwOsKgwqDCoCAzOCA2MCAwMCAwMMKgwqDCoMKgIGxp
wqDCoMKgwqDCoCByMywwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8PT0NCj4+Pj4gwqDCoCA2NzQ6
wqDCoMKgIDRlIDgwIDAwIDIwwqDCoMKgwqAgYmxywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDw9PQ0KPj4+PiDCoMKgIDY3ODrCoMKgwqAgMzggNjAgMDAgMDDCoMKgwqDCoCBsacKgwqDC
oMKgwqAgcjMsMA0KPj4+PiDCoMKgIDY3YzrCoMKgwqAgNGUgODAgMDAgMjDCoMKgwqDCoCBibHIN
Cj4+Pj4NCj4+PiBUaGUgYnVpbHRpbiB2YXJpYW50IG9mIHVucmVhY2hhYmxlIChfX2J1aWx0aW5f
dW5yZWFjaGFibGUoKSkgd29ya3MuDQo+Pj4NCj4+PiBIb3cgYWJvdXQgdXNpbmcgdGhhdCBpbnN0
ZWFkIG9mIHVucmVhY2hhYmxlKCkgPw0KPj4+DQo+Pj4NCj4+DQo+PiBJbiBmYWN0IHRoZSBwcm9i
bGVtIGNvbWVzIGZyb20gdGhlIG1hY3JvIGFubm90YXRlX3VucmVhY2hhYmxlKCkgd2hpY2ggDQo+
PiBpcyBjYWxsZWQgYnkgdW5yZWFjaGFibGUoKSBiZWZvcmUgY2FsbGluZyBfX2J1aWxkX3VucmVh
Y2hhYmxlKCkuDQo+Pg0KPj4gU2VlbXMgbGlrZSB0aGlzIG1hY3JvIGFkZHMgKGFmdGVyIHRoZSB1
bmNvbmRpdGlvbmFsIHRyYXAgdHd1aSkgYSBjYWxsIA0KPj4gdG8gYW4gZW1wdHkgZnVuY3Rpb24g
d2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgaW4gc2VjdGlvbiANCj4+IC5kaXNjYXJkLnVucmVhY2hh
YmxlDQo+Pg0KPj4gwqDCoMKgwqAgMWM3ODrCoMKgwqDCoMKgwqAgMDAgMDAgZTAgMGbCoMKgwqDC
oCB0d3VpwqDCoMKgIHIwLDANCj4+IMKgwqDCoMKgIDFjN2M6wqDCoMKgwqDCoMKgIDU1IGU3IGZm
IDRiwqDCoMKgwqAgYmzCoMKgwqDCoMKgIDNkMCANCj4+IDxxZGlzY19yb290X3NsZWVwaW5nX2xv
Y2sucGFydC4wPg0KPj4NCj4+DQo+PiBSRUxPQ0FUSU9OIFJFQ09SRFMgRk9SIFsuZGlzY2FyZC51
bnJlYWNoYWJsZV06DQo+PiBPRkZTRVTCoMKgwqDCoMKgwqDCoMKgwqDCoCBUWVBFwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVkFMVUUNCj4+IDAwMDAwMDAwMDAwMDAwMDAgUl9QUEM2NF9SRUwz
MsKgwqDCoMKgIC50ZXh0KzB4MDAwMDAwMDAwMDAwMDNkMA0KPj4NCj4+IFRoZSBwcm9ibGVtIGlz
IHRoYXQgdGhhdCBmdW5jdGlvbiBoYXMgc2l6ZSAwOg0KPj4NCj4+IDAwMDAwMDAwMDAwMDAzZDAg
bMKgwqDCoMKgIEYgLnRleHTCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCANCj4+IHFkaXNjX3Jvb3Rf
c2xlZXBpbmdfbG9jay5wYXJ0LjANCj4+DQo+Pg0KPj4gQW5kIG9ianRvb2wgaXMgbm90IHByZXBh
cmVkIGZvciBhIGZ1bmN0aW9uIHdpdGggc2l6ZSAwLg0KPiANCj4gYW5ub3RhdGVfdW5yZWFjaGFi
bGUoKSBzZWVtcyB0byBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBjb21taXQgDQo+IDY0OWVhNGQ1
YTYyNGYwICgib2JqdG9vbDogQXNzdW1lIHVuYW5ub3RhdGVkIFVEMiBpbnN0cnVjdGlvbnMgYXJl
IGRlYWQgDQo+IGVuZHMiKS4NCj4gDQo+IE9ianRvb2wgY29uc2lkZXJzICd1ZDInIGluc3RydWN0
aW9uIHRvIGJlIGZhdGFsLCBzbyBCVUcoKSBoYXMgDQo+IF9fYnVpbHRpbl91bnJlYWNoYWJsZSgp
LCByYXRoZXIgdGhhbiB1bnJlYWNoYWJsZSgpLiBTZWUgY29tbWl0IA0KPiBiZmIxYTdjOTFmYjc3
NSAoIng4Ni9idWc6IE1lcmdlIGFubm90YXRlX3JlYWNoYWJsZSgpIGludG8gX0JVR19GTEFHUygp
IA0KPiBhc20iKS4gRm9yIHRoZSBzYW1lIHJlYXNvbiwgX19XQVJOX0ZMQUdTKCkgaXMgYW5ub3Rh
dGVkIHdpdGggDQo+IF9BU01fUkVBQ0hBQkxFIHNvIHRoYXQgb2JqdG9vbCBjYW4gZGlmZmVyZW50
aWF0ZSB3YXJuaW5ncyBmcm9tIGEgQlVHKCkuDQo+IA0KPiBPbiBwb3dlcnBjLCB3ZSB1c2UgdHJh
cCB2YXJpYW50cyBmb3IgYm90aCBhbmQgZG9uJ3QgaGF2ZSBhIHNwZWNpYWwgDQo+IGluc3RydWN0
aW9uIGZvciBhIEJVRygpLiBBcyBzdWNoLCBmb3IgX1dBUk5fRkxBR1MoKSwgdXNpbmcgDQo+IF9f
YnVpbHRpbl91bnJlYWNoYWJsZSgpIHN1ZmZpY2VzIHRvIGFjaGlldmUgb3B0aW1hbCBjb2RlIGdl
bmVyYXRpb24gZnJvbSANCj4gdGhlIGNvbXBpbGVyLiBPYmp0b29sIHdvdWxkIGNvbnNpZGVyIHN1
YnNlcXVlbnQgaW5zdHJ1Y3Rpb25zIHRvIGJlIA0KPiByZWFjaGFibGUuIEZvciBCVUcoKSwgd2Ug
Y2FuIGNvbnRpbnVlIHRvIHVzZSB1bnJlYWNoYWJsZSgpIHNvIHRoYXQgDQo+IG9ianRvb2wgY2Fu
IGRpZmZlcmVudGlhdGUgdGhlc2UgZnJvbSB0cmFwcyB1c2VkIGluIHdhcm5pbmdzLg0KDQpOb3Qg
c3VyZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4NCg0KX19XQVJOX0ZMQUdTKCkgYW5kIEJV
RygpIGJvdGggdXNlICd0d3VpJyB3aGljaCBpcyB1bmNvbmRpdGlvbm5hbCB0cmFwLCANCmFzIHN1
Y2ggYm90aCBhcmUgdGhlIHNhbWUuDQoNCk9uIHRoZSBvdGhlciBzaWRlLCBXQVJOX09OKCkgYW5k
IEJVR19PTigpIHVzZSB0bGJuZWkgd2hpY2ggaXMgYSANCmNvbmRpdGlvbm5lbCB0cmFwLg0KDQo+
IA0KPj4NCj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyB0byBvYmp0b29sIHNlZW0gdG8gZml4IHRo
ZSBwcm9ibGVtLCBtb3N0IHdhcm5pbmcgDQo+PiBhcmUgZ29uZSB3aXRoIHRoYXQgY2hhbmdlLg0K
Pj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2VsZi5jIGIvdG9vbHMvb2JqdG9vbC9l
bGYuYw0KPj4gaW5kZXggNjMyMThmNTc5OWMyLi4zN2MwYTI2OGI3ZWEgMTAwNjQ0DQo+PiAtLS0g
YS90b29scy9vYmp0b29sL2VsZi5jDQo+PiArKysgYi90b29scy9vYmp0b29sL2VsZi5jDQo+PiBA
QCAtNzcsNiArNzcsOCBAQCBzdGF0aWMgaW50IHN5bWJvbF9ieV9vZmZzZXQoY29uc3Qgdm9pZCAq
a2V5LCBjb25zdCANCj4+IHN0cnVjdCByYl9ub2RlICpub2RlKQ0KPj4NCj4+IMKgwqDCoMKgwqAg
aWYgKCpvIDwgcy0+b2Zmc2V0KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsNCj4+
ICvCoMKgwqAgaWYgKCpvID09IHMtPm9mZnNldCAmJiAhcy0+bGVuKQ0KPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAwOw0KPj4gwqDCoMKgwqDCoCBpZiAoKm8gPj0gcy0+b2Zmc2V0ICsgcy0+bGVu
KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAxOw0KPj4NCj4+IEBAIC00MDAsNyArNDAy
LDcgQEAgc3RhdGljIHZvaWQgZWxmX2FkZF9zeW1ib2woc3RydWN0IGVsZiAqZWxmLCBzdHJ1Y3Qg
DQo+PiBzeW1ib2wgKnN5bSkNCj4+IMKgwqDCoMKgwqDCoCAqIERvbid0IHN0b3JlIGVtcHR5IFNU
VF9OT1RZUEUgc3ltYm9scyBpbiB0aGUgcmJ0cmVlLsKgIFRoZXkNCj4+IMKgwqDCoMKgwqDCoCAq
IGNhbiBleGlzdCB3aXRoaW4gYSBmdW5jdGlvbiwgY29uZnVzaW5nIHRoZSBzb3J0aW5nLg0KPj4g
wqDCoMKgwqDCoMKgICovDQo+PiAtwqDCoMKgIGlmICghc3ltLT5sZW4pDQo+PiArwqDCoMKgIGlm
IChzeW0tPnR5cGUgPT0gU1RUX05PVFlQRSAmJiAhc3ltLT5sZW4pDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmJfZXJhc2UoJnN5bS0+bm9kZSwgJnN5bS0+c2VjLT5zeW1ib2xfdHJlZSk7DQo+PiDC
oCB9DQo+IA0KPiBJcyB0aGVyZSBhIHJlYXNvbiB0byBkbyB0aGlzLCByYXRoZXIgdGhhbiBjaGFu
Z2UgX19XQVJOX0ZMQUdTKCkgdG8gdXNlIA0KPiBfX2J1aWx0aW5fdW5yZWFjaGFibGUoKT8gT3Is
IGFyZSB5b3Ugc2VlaW5nIGFuIGlzc3VlIHdpdGggdW5yZWFjaGFibGUoKSANCj4gZWxzZXdoZXJl
IGluIHRoZSBrZXJuZWw/DQo+IA0KDQpBdCB0aGUgbW9tZW50IEknbSB0cnlpbmcgdG8gdW5kZXJz
dGFuZCB3aGF0IHRoZSBpc3N1ZSBpcywgYW5kIGV4cGxvcmUgDQpwb3NzaWJsZSBmaXhlcy4gSSBn
dWVzcyBpZiB3ZSB0ZWxsIG9ianRvb2wgdGhhdCBhZnRlciAndHd1aScgc3Vic2VxdWVudCANCmlu
c3RydWN0aW9ucyBhcmUgdW5yZWFjaGFibGUsIHRoZW4gX19idWlsdGluX3VucmVhY2hhYmxlKCkg
aXMgZW5vdWdoLg0KDQpJIHRoaW5rIHdlIHNob3VsZCBhbHNvIHVuZGVyc3RhbmQgd2h5IGFubm90
YXRlX3VucmVhY2hhYmxlKCkgZ2l2ZXMgdXMgYSANCnNvIGJhZCByZXN1bHQgYW5kIHNlZSBpZiBp
dCBjYW4gYmUgY2hhbmdlZCB0byBzb21ldGhpbmcgY2xlYW5lciB0aGFuIGEgDQonYmwnIHRvIGFu
IGVtcHR5IGZ1bmN0aW9uIHRoYXQgaGFzIG5vIGluc3RydWN0aW9ucy4=
