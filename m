Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD25A5BCC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:28:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGy762NBzz3cgh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:28:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CXCJDZoJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.49; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=CXCJDZoJ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90049.outbound.protection.outlook.com [40.107.9.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGy6957wVz3c23
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:27:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5gSuqXZxbHJAV0n5lKK80kjSf5wWZXWggx1hXImQEG/o98Um6DEUYeyB0/G0mJ1PvdqIpSfpa8qYUdL4o83twZN94QIXu08Z0rkgaAx8Y0ySO2pgTPrHM3c+kobNpS2TfHD2JhqCumk4K/Nh/RwKy4huZdJ0DYhFIftxr0YDtSL3zchzERPmrHNE1Ury5UNiUrHt7XX24431SaSWNHEH46wxClDRkPO2rpwteSbAlLY6RSYm4mEXC4zQKgjxqLb7+4TFYzLjcx5NhUlxh4QrCA1I0VGKLfH1EOj276a5YHTTBQlKKOcNCo7oI85PxVfyLfDg39flxjk9MMEx0Pa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYS+oCfKvVS+MiB5ewqhwJ3Qfz9du1Hum242yVfZexc=;
 b=GQVN9Kjn8wZmAbHskqet82LLTXseVyXuJ/SLDuAyeGuShUhre6O68o5bih1SxlS9dk+lHwwoi0lnw2JU0Uk/ZxacGWZirUSvzGL4rPuoWk5oeQB8tYCqo6bmdG6OW7q+AiJhb/adD+86lTnOvuTkbvN1KQsjmGszVviNB+rkXMguZQRcETIf1AiUojSrZXbJJYZv4PT8eYTeq2WiKs319CSFxX9LZ3fI695oIW2Xvey1qZvL4qFlTEFrUWj+k5zgxy1N3yQKmoTUOEAXRgqfL5lXBIr6YEe5EFBaT7sxAKhDUG6fCM8xCf6SXvz+P/g0KDuEKyDO8ZadUK2gx5FBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYS+oCfKvVS+MiB5ewqhwJ3Qfz9du1Hum242yVfZexc=;
 b=CXCJDZoJzijAbyEtbot/X26+2f1pdJ/R7sNBkGyp3a0KtqcEnyoUDzRJ9tNFoA3/2Vh6238/otYLdgC+75/vBQL11r1cBXLgwmO5cIg8XgQeRuExbzFMR/O8q4PsEqiFScRKu50vZeaeRSMmKaJNIa+A9AcjJQ5T/I3DfhbeJceYpAcmc2BSTVOwfhrvEc/Cl9cSUZRqjFix++f1RLxlzlZna4t5d/81cJFtEKGLKB7xKpKD0DpRgng5iVOcwNQWvtluj5aWuM+lcabyOjJNKetuEf01iHBDrmWvdXwBXSnDFkYTAKPXRrb+yyqb7pSv4E8Pxitup6Ew9zB4Oo6FjQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:27:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:27:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 07/16] powerpc: Skip objtool from running on VDSO files
Thread-Topic: [PATCH v2 07/16] powerpc: Skip objtool from running on VDSO
 files
Thread-Index: AQHYu2ujn0Kil3soiEWUIH7sLhciTa3G/EyA
Date: Tue, 30 Aug 2022 06:27:27 +0000
Message-ID: <c0d225d8-6797-ca90-3738-7a7e47939046@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-8-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-8-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edc584e8-828a-4b76-11ad-08da8a50b5cb
x-ms-traffictypediagnostic: PR0P264MB3192:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  j5pBxDFQbWl2gnpKZdhCmRudEnSDyDlZCzPec3JZ4lBxQ3id4p6TkwlqU+dKDwDe6vPnjXD7bI+Kiqmdm1LNNeIfFRDVuQA8m9YaJZONbjyB5CRvU1SlJ0OEG2Zx7en+jmAL+P6zp9RmIRDrW/MuiZiZSGsBwNcoy4QT4ZyDwlOgiRRlgmnI4xGoA3X/nJFWDMDtOJaJCT8p9slTHTMQacn5ttgFijRNfc4EqW7XWjOv25zQCmrib7f6HuELTOiiOe4KLkhFIIX6Vy13URk7niOtF27+l3lbZyQAOVdxJDfnyW1DujdOT4tQsXzZY4/5w7Q93Q1B7wtM0jaM8vvjSz11e5Ee5OXXu5huCDyFnMMAsbLnByuykYnPrAesHxsKaC/RfFMBqwuWYl0Z9jld3gLTP+I47BJImZqfRL7Jb6LsH+QAxLsWRBVRtgURUIsQX8roXvTkyNVGGo2UNDGIAO0T7ueh0aXzWzE0wD8kyVevSrJhsT2CAqbxzKEP6T2eChwsPsqUzbBjscSbuB6H2md05Vl7Xi2Om4abY8yal1trN47ZPen5xGXf/1beeyCNyojRspqh1lgEn5fQx1bPfyk+tEcwhYOKzTSlNLMcm9XSzC9rK2rqIsi0Hj0LQiMETaRtYE/Gf/qL4G+7V0VZbKsDcS9sjqSvlVczHRdTrX6ClOtdOvrZ90xopGJaGdrNbUCYQIQTf4LLoNl/upIClA932OnsXfb27V6qVqdLqMtTnSSI15pyimKm6/D8onY8SYFdeLWI7ZwMG9x3jASEfdrEtrimOnO3iFfpFT6nHIUmi1f+Z5mlYqOjNJvbV/Dl
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39850400004)(346002)(396003)(366004)(54906003)(110136005)(8676002)(66476007)(86362001)(31686004)(66556008)(6486002)(76116006)(4326008)(66946007)(31696002)(66446008)(71200400001)(64756008)(36756003)(5660300002)(7416002)(41300700001)(38070700005)(316002)(478600001)(8936002)(44832011)(4744005)(2616005)(38100700002)(6506007)(122000001)(2906002)(26005)(186003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RTgzQW9oQ2U2Zy9HOUR0cHdiNkorYWJlYlRpS20xcExleGRFS0I3YTRIZGJx?=
 =?utf-8?B?TXlSQTByWHFPci96L0d3YStKclllZUpBT0pjcU81V1JOQ2ZoNG1ZbEozakV3?=
 =?utf-8?B?NWxkWFhVdExaTEhYN3R6bnJndzFTc1NaUEk4VEYxeUo1NG1rdHpyWkhWWk9a?=
 =?utf-8?B?cnluMHBtSmx4RmViSkZNd2VDcnNkbWt5eldadndNUG51WG4rOHhYTGE1c21l?=
 =?utf-8?B?cGkrWE9rVEx5ZVp3NDhCQmZoalBDUGIxc1ZBNjhCZC9vc2FXTE84RE1oaCtX?=
 =?utf-8?B?MUt1TWF1MEZSZHlIWFl5QmRFYUpGbFA0NjlIa0IwcWdvV2llZlJpblJQMDNz?=
 =?utf-8?B?RzBoV2FGeFhnelkwaWg2OW9tNjBPSXlrRXR0ZTBhbGdMaXliaDlReFVDQ3Q2?=
 =?utf-8?B?MHA4OC9YOWIxZUNMMDZBY1hIYkpMWktHbXhnaDRqbWRBS1pwM0ZkdEgvejZG?=
 =?utf-8?B?OTEvRURWMG9haXQyelg4WnJKOGoySVlEaEZGVGZadkNPN29lOEU0WUlkczdw?=
 =?utf-8?B?dDdPVzZGdjlMMTZKODRpUThaNEhTQWJ2SXF6V1pwUDNsVFB5OUVpbG9aSy9p?=
 =?utf-8?B?M1A2aCs1RWJlNndGckptVXI2ZkJaMnU1Y3NZNkVVL2RvRHhFN3dtTEM1clpy?=
 =?utf-8?B?NHNBamEwMVhOK00vZW9SYlB6NS9nVW4xYlc2WXlYdkJmd0xxQlBMY0w1dWcx?=
 =?utf-8?B?bTRaNDlBUXZHb2U2emJKQnF4MXAwbmtZMzlkSWNzenl5VUFRbDdTb09pOWZt?=
 =?utf-8?B?THNrb056dms5a1o1WGJTM3NuNWpwTlBjVGFQRGRBUjQ2aUx0eGJYemFKZDlh?=
 =?utf-8?B?U0JvSFMzQnRUQSsya3pVY2lvVFFMTENPZDVPTjVZVlhQZityRElLbUZZVXp4?=
 =?utf-8?B?MFplT2pCRWtET3MzenF6dkorZVFMVHVoQXZJYlRrMUR1M05pcUlVT0VKeHhT?=
 =?utf-8?B?cWU5UCtaeGRzRG9GbFFNMGhnbWEvalhoaTlTajhleXVFZFcvRHdsVlVleDgr?=
 =?utf-8?B?TjRpRDk4OTdCMnZsZy83VVU2cU1YQmZUa055YVBuR0ViMXJkaWI3NlhUWmpB?=
 =?utf-8?B?NjBNcnZlcGpNK0pub25YaGtrMitET2xEbFJkb1VkdldkM2UvVmI2aW9xN3dr?=
 =?utf-8?B?cldrMGpOZ01PUWlLMk5VT0EzZzhTT0ZTODBiY1YrTUVRaG1ZcFVGQmRSK0Fi?=
 =?utf-8?B?b2E5R2ZRMy9GaXRrY1NTRlRPSWNsQ2lhMUtwZTkwQXEwZEpKaldQbC9WU2Qw?=
 =?utf-8?B?OHVxUTFFTGUyNGh3bUFYRGFIdE0zbmJPUlZFamlOU2p6VERBeUdIYWlQTWdo?=
 =?utf-8?B?ZFdWemZFRWc0cFhTakdyTDlNcmIyeDBNSEpPYlRYRVZSL2toaENvYjl6djYz?=
 =?utf-8?B?dGEwcXVxaFh0T3pZd0pZVWZEL3JwMi9BSmpvSzdpQTNWblZJaTJzQklCV2dn?=
 =?utf-8?B?MlFRUGdlRm03SVZiSFhjdFVrNmRsSlY5VlRNclg4M0s4TVJCTitMUGpyN1RC?=
 =?utf-8?B?Z1FsTzM4QlNGeFpsUHJ5ZDNFcTFwOFRBMnRFelRyd25nQXd5Z05QeE5kUlJ4?=
 =?utf-8?B?c09sN3JIL2NsbWp0Um82dS9QYmFjalNKdHdIZ1ZyOTZlOGwwdnMwQnoxZWp5?=
 =?utf-8?B?SFl6bXZDREttT0NUazJ2TDJyN3huVy9JbWxGNU9kT0g3SThFV3ovQ3o4MTl6?=
 =?utf-8?B?K01xMktkcFlOYk9pUkYwUUpnb1JScTFWbXhQbFZMRkk5NDlQL2x6alhjVGw0?=
 =?utf-8?B?WDBZWHBFZWx0dFlCUDRTUStob0RuQnBjSU83L1VqNDlLZ0NKV3c4bEFORTdZ?=
 =?utf-8?B?OW0vY25BY055YUNvdm1FY2J6RmNFYks1bzBiSFZSaEdMMEJpNi9qVi85cG94?=
 =?utf-8?B?a0ZKZkN6K21wUS9lNmFEODVySWlnOSt6SGNCVmVYTUM1TnFTRWRpU1dFbWtZ?=
 =?utf-8?B?Y0NiSHlJdExyWXZMWG9adWV6bUlFa2JsR21RbkNQK1l2NzFwczFicVFvL2xo?=
 =?utf-8?B?anFGdlcwNHpJeG1NdmlSZlVZVjFRSld5Rm9hbmxhTU9YWlNFMm5TWUNSQWxs?=
 =?utf-8?B?RjExOUtrQThpblVCN3RseGFyWmo0ZGdIU0NCZDdQNjJ6bWFzQ0FsOVQ1SWpF?=
 =?utf-8?B?ZHR6QW00V21yQTRwYmtHcWwwWDF5amtqR1p3dE41Vk1mNURKTExER2MrMXUy?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65084FFF50B76243B1F3556D3C906243@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: edc584e8-828a-4b76-11ad-08da8a50b5cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:27:27.8191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jYUNQDBODoQJqEuxweTvPrMhIEReHlWFAceUyR18WgOc/HEs/6Gsr8IX5DEPhnHdoPDQ5srne560EWizeD5m80iqSjfw9DhpI3Cew/bP3Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3192
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBEbyBub3QgcnVuIG9ianRvb2wgb24gVkRTTyBmaWxlcywgYnkgdXNpbmcNCj4gT0JKRUNU
X0ZJTEVTX05PTl9TVEFOREFSRA0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RvcGhlIExlcm95
IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IFNpZ25lZC1vZmYtYnk6IFNhdGh2aWth
IFZhc2lyZWRkeSA8c3ZAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRz
by9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtlZmlsZQ0KPiBpbmRleCAw
OTZiMGJmMTMzNWYuLmE0OWEwZDZhMWM1MyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tl
cm5lbC92ZHNvL01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9NYWtl
ZmlsZQ0KPiBAQCAtMTAyLDMgKzEwMiw1IEBAIHF1aWV0X2NtZF92ZHNvNjRsZF9hbmRfY2hlY2sg
PSBWRFNPNjRMICRADQo+ICAgICAgICAgY21kX3Zkc282NGxkX2FuZF9jaGVjayA9ICQoVkRTT0ND
KSAkKGNfZmxhZ3MpICQoQ0M2NEZMQUdTKSAtbyAkQCAtV2wsLVQkKGZpbHRlciAlLmxkcywkXikg
JChmaWx0ZXIgJS5vLCReKSA7ICQoY21kX3Zkc29fY2hlY2spDQo+ICAgcXVpZXRfY21kX3Zkc282
NGFzID0gVkRTTzY0QSAkQA0KPiAgICAgICAgIGNtZF92ZHNvNjRhcyA9ICQoVkRTT0NDKSAkKGFf
ZmxhZ3MpICQoQ0M2NEZMQUdTKSAkKEFTNjRGTEFHUykgLWMgLW8gJEAgJDwNCj4gKw0KPiArT0JK
RUNUX0ZJTEVTX05PTl9TVEFOREFSRCA6PSB5
