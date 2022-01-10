Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0459489CEB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 16:57:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXdks5V9pz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 02:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXdjk0983z2yZZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 02:56:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp4NPyELV3OAzKOdsWoM+xtRogmAbVX7VkRIEFigLc5sXsDsU/6C2zRm6ALK2bVFcx2BpehJpnjbbyErOcl2JlKKiy8Mggz8fo3Td8stvZH2zIDdIHGIqPQ+hgws4JeRZyzX/+BF/YUq2g+ZfP1Zy3vO4rls7s+4qVaO3Z69I+Wt7OxLxzMXice0KG4qLSSgXzB8HKsAVPaXK5/KlRGckgNI45cKYteK1+eNr1LBRTtDayu4z0Il2wwVDmfXi01ADqGT3t0mKntv/4deL6D4zKOr2TAiBuFES/1ILXem7iIoOb4PDW4Vgwx+qY3UZUjz6dC2s/HJFsG3aF1xJzwqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mAEJyMIdb3VsVsy5493kv7UAnH3zDC55bpa+Tcojpc=;
 b=UPJTW2HE4M3EjQwHkoh8EqxjchjFf1LPuIs0ucX3JRzr38J+uEuMwGPPMEku1lTvr+mLkucPtLWQv67lbXFbLrd2q5meUoerXb4oJRs5iW/zIQYIv5iw1EIZMBXVdZMV+i6yzQ2yWEDn8ByvmVPjYHOTanl40Ul88XMrSJJRDQBgrVf+JZICCbVrxAP0OEXBDS7XF3N+dJzIMygoCw9tFBO3O/412KKXK81J6kKHvpRl6N2YlVf25pAhnbMU7vh8RM7KDLgMRPr6fGW0GeZ5fY1nrZjWr5SFTbThnYLrtn6lpFWN9WTnvY03j21BSanJFW5wA1rUq6PGLkrZq8IAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0643.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 15:56:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 15:56:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "guoren@kernel.org" <guoren@kernel.org>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "arnd@arndb.de" <arnd@arndb.de>, "anup.patel@wdc.com"
 <anup.patel@wdc.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "liush@allwinnertech.com"
 <liush@allwinnertech.com>, "wefu@redhat.com" <wefu@redhat.com>,
 "drew@beagleboard.org" <drew@beagleboard.org>, "wangjunqiang@iscas.ac.cn"
 <wangjunqiang@iscas.ac.cn>, "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
Thread-Topic: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
Thread-Index: AQHX+/kpy3NwvC9DQUiLoTFp3BRg2qxcfUSA
Date: Mon, 10 Jan 2022 15:56:19 +0000
Message-ID: <d64c8b66-c5bc-81a1-55c6-a0b44cafb19a@csgroup.eu>
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-4-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-4-guoren@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dca9241-98cc-494d-e592-08d9d451be21
x-ms-traffictypediagnostic: MR2P264MB0643:EE_
x-microsoft-antispam-prvs: <MR2P264MB06437FA080963D2BA43C6CC5ED509@MR2P264MB0643.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fsMDdQYz/Amekb2qsUZTKnzsDEiWCNb9SSryyJd3cGb0G7Lvxva8uCjs9RwOcgyfqXn9yS0VZKeS4fEZzpKr/ydy+Sk2YyTmEKpf6iOnDH+Uuqg8JAEr6dXOo0FkHiRPqowWhQawWPiikBMGxpGHyuQTRIPaaSemuWua8B4ZS2HOnM8uzhKgiaLL2SurBcVupZx2IjpgR6o8GmcvVDliwqnProZcUaUTeVrZ+qO7sVYMCBYfw35KWTsa/myNF7b9U6oY8zXpfgCO4AtDglsy1Tgr9ZEGyB0YhGPOE2yM4tBX5I8bRXH4zAi+7n68BlXhZOxIdGhzjY0/1FgbwY2QlBQAjE/LQwugCuz/TnQNtMNx6/TO5dRuZSvu6EAN04L/XaiUsfPZH84PUV7dapS2g0fo3vUi7b9Ij7aRC5txNNh5rtImA0hADQagKWff7/lkQB+11Z5bc8UQQC6xPZVmBs7d0vsxz1iDBPCaVcyJeZKqgU2u2Tn4frfZ4gTcS2sIo+WtKJ+ziCuYS+Iu9y2yPQIdtwIBClbPM5ndI3OsZZp1M2DBXSZFXVdSkZdlTGuWcVSO574FxEieLpSCHPNjYMVPCWwPrKb/Mez0S/lJnKjKYtnx0W8StSpSYcxiB3e85lpcWzXsVeOVZEsBmTdN8XlMV/baPajTyT9jr9wMDwxMkSRVRoaTCyT2H+1c0hqfAdRflM3RbCuq4/JWQ8Rvx2/njT2kPYl9+lxzmBTthIm5uJG+u/iFT/Tqj7tiH/4H1eSIYizRa456owB4f6oOZRaUk8ES+QvWSNo0dztqOWH+XmoGs/J4k/TF7qV3LVNj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(31686004)(83380400001)(31696002)(66556008)(64756008)(66446008)(122000001)(66476007)(66946007)(76116006)(91956017)(38100700002)(4326008)(7416002)(316002)(71200400001)(6486002)(186003)(6512007)(8936002)(508600001)(8676002)(38070700005)(54906003)(5660300002)(921005)(36756003)(2616005)(26005)(6506007)(110136005)(44832011)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0FtL3NVa0o2S0lXeEdjdUJXRzBQeHBXa2ppSWdMUmEzUFJqaE42d0EzK1JW?=
 =?utf-8?B?Y0gxWkhyd2dXeWdiSitzQmpPdWdMT3BwdndKRXBKbEp0clNXZTBUNi8wNFFo?=
 =?utf-8?B?cGRUbkxjNkl6VmNzVWtpUW5ESy8vUTJ0R2FrNkYzd0NYVUdlTmEraERMcjUz?=
 =?utf-8?B?bWlCalZBT2JhMEVmWDF2bUM5bCt3UGlicE42SCtyL0YvSUxFV1ppdGlRUm5H?=
 =?utf-8?B?eHl2WXFacnlKQUN2NGx0c1JOSk1oeDhuTHhZS2dIandyaVhBK2MzWThsSTZK?=
 =?utf-8?B?ZGtFQW42RlBHYnlUVE1FS0VMS00yL1R1dTlScmw2YUVlM0xxY0ZSUmhSWEFU?=
 =?utf-8?B?LzBqSGp3NDh0VlBtUVNFNjl3U2VhUlR0MEJMUnlGc3FZeXJ2RmNmYnU4bjZ6?=
 =?utf-8?B?SS9Yajk4a0duTnZyN3QyR3BGSWk4NUZMRS9DNEJZVEViUjdKT0UwNFdjTVJK?=
 =?utf-8?B?TlhMMWdDc0lNRzJRUjcwV2dYcFBTZVA1TFRGeFB1TGZhNmMzWkk4eEdSc1B6?=
 =?utf-8?B?ZEVQUUhsT0hFNUlYdGhYK2tkU3B5M3VuWXR0UWdMTFkyTEgvVkRVWkg0WFcx?=
 =?utf-8?B?blNEVkJHTlRnZ245RUpsaG5wWW9OMHZmNk5wRTVqSWJ5TDllNWlpNEYrNW9l?=
 =?utf-8?B?MlQyNWRacVQ0V0M1RXVHNjBTeE5BREFQTlBwOWZOVHc4ejArbGczbjZMbFp0?=
 =?utf-8?B?NDNoeXovWkFCSDZTcWtxcnRhSks5a1NUNEhUaTJPY3VoTHlWRlRyNmYzWUds?=
 =?utf-8?B?TTlrc3YzdGpvWTFaNGdkTE44MGNmbDNBTUMyZjFWTEV3N2NjT3hmVlY1UXlW?=
 =?utf-8?B?QzZBOFNvT21wdkVMUEg3ZzNaZERwMG1iOGljRHU3VDhyYnA1ak4vWFFNbDJR?=
 =?utf-8?B?ZVV6VUh5OWd0bmNVQi9vbVhOYzN6UFY1ektkcGh5UVJKNHZYZERWQmxlRElL?=
 =?utf-8?B?cDQ1UUtNbjZZRGdKcmlNZlZFeTl5YWlIUEczUnIyZHQ1c0kvTUFYenhnQzJF?=
 =?utf-8?B?STJCY2tnN3p4U2JDZjB4ZVMrYnNzMGNnemNKQmw5RmRKZHZVaGhKNWs2enpP?=
 =?utf-8?B?eHBNTjBmOFl3V2FGQmM0MEorMHB6VVEwTmlIMERSY2VPS3pQMHp0Q1FyVjJz?=
 =?utf-8?B?eHJCQThqZ2NjYzhPNE04S3pqNU1EZ3NnMnJ6Nm5UZUh4VHhKTmVGMkd5OVA1?=
 =?utf-8?B?RTlRZk1ZalRxVHE0K051M011Y01jTk9CaURrTWJCYVJxRHlTMTJ2S3JUSm00?=
 =?utf-8?B?amFCaVkzeGE2MHRpS0FETUlLVmRzUkFUZm5nOVRpNURwTjRIcWFSZEg5VTBZ?=
 =?utf-8?B?SFhieFRoSEpLeFFZWVdjZ1RjVEEwLzFFYXlJU21lRnA4a1VMWFR2NTRUb0tp?=
 =?utf-8?B?VStTWTBvTytMY1UwT2N3YmFYUnlMM0NtTXg4bk9NWFFsVGJxTTNNL1Y2MFFJ?=
 =?utf-8?B?QVV5OGNUeTBQaXlLSEVzNnJyd3dDYkQ3VVdRZWRoVnU0TWxCVnpEbWpUNVZu?=
 =?utf-8?B?d1Q2R1VRcXJiZ2ZUMmhSdHc0OXRRSExMdmpRdlVKTmJsamJNanZkaCsrU3ZV?=
 =?utf-8?B?WUhIVkl2RWJERncwRStSSm9iOWp5MHIxRURCYUpOdUtVZkxIazNYajhNMGp5?=
 =?utf-8?B?b2VybHVmcjlSTi9TcCtGNitzeDdTcHBNZk52bXhoQWxXeHVHcmw5aWNTVXMw?=
 =?utf-8?B?YmhnQk92UXUySE9JdklqdlpNNXVXVHdOcXlFbzJoay85VDFJamlmVzVMYmZM?=
 =?utf-8?B?YVVhTkdIK2QzTjk1UktHOUtTcjZDemhOTEtRVVZBWXZubnpBM0hodjN1dW9Z?=
 =?utf-8?B?dnh5cFhLVmNwVjJhUzMrN29iN0tYM3pnUktWVXkvMnFpMWNmNDRMSmZtNG5t?=
 =?utf-8?B?Umo3NXFRTjdjY09xRHFRam5Jdm1JWmtINEtoMEUrVjM1KzFTK3JBTDdQOW9k?=
 =?utf-8?B?TXRnUDhyeGdDbkxUK1h2bnFINERydkY4SnF4VmhZQ3hMWTVwZ2VZRk1JMUZS?=
 =?utf-8?B?UEorOC9odEl0cW0wQlZQWmZkNlNhamRsTFlrMGwyblFrdzdrNUorMTdZVXdE?=
 =?utf-8?B?RFRyQjFOSm52SXBzcjdBL1JKOUNHSnM0Zi9IVmNjdEw0ZkpZb2FlNEl5QzVP?=
 =?utf-8?B?ZmJuTjhFTEovRXVoMXhFNGYzWDFXZDh4SHlVQU5VYW9DbjFUaUI3OEhSc3BO?=
 =?utf-8?B?QVgyWmJEbzJFZWVXTHovRHVNR1F5bDFab3ZMa1M2ejVhMWFnNXUrOHFpc3hW?=
 =?utf-8?Q?FeCLZTbULduYOEJSO4LGmPsUle/qAGBNL+tbjzBSd4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <218151C46623A54F868167BCE789D359@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dca9241-98cc-494d-e592-08d9d451be21
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 15:56:19.6342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2MzHhKrkR6DFps8SCi1rRJvqmWbheEXwY2CBrBqY0tq/pn41aq6pqn7l38mhQQPfXcgPPHjV4bOOfkXQtYMkclVmKOGlMvKYrKzzGLnK7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0643
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzEyLzIwMjEgw6AgMTU6MzksIGd1b3JlbkBrZXJuZWwub3JnIGEgw6ljcml0wqA6
DQo+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4NCj4gDQo+IFJlbW92
ZSBkdXBsaWNhdGUgRl9HRVRMSzY0LEZfU0VUTEs2NCxGX1NFVExLVzY0IGRlZmluaXRpb25zIGlu
DQo+IGFyY2gvKi9pbmNsdWRlL2FzbS9jb21wYXQuaC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+DQo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
Pg0KPiAtLS0NCj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NvbXBhdC5oICAgfCA0IC0tLS0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29tcGF0LmggfCA0IC0tLS0NCj4gICBhcmNo
L3MzOTAvaW5jbHVkZS9hc20vY29tcGF0LmggICAgfCA0IC0tLS0NCj4gICBhcmNoL3NwYXJjL2lu
Y2x1ZGUvYXNtL2NvbXBhdC5oICAgfCA0IC0tLS0NCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9j
b21wYXQuaCAgICAgfCA0IC0tLS0NCj4gICBpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvZmNudGwu
aCAgfCAyICstDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjEgZGVsZXRp
b25zKC0pDQo+IA0KDQouLi4NCg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2FzbS1nZW5l
cmljL2ZjbnRsLmggYi9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvZmNudGwuaA0KPiBpbmRleCBl
Y2QwZjViZGZjMWQuLjViYzFlNTFkNzNiMSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2Fz
bS1nZW5lcmljL2ZjbnRsLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL2ZjbnRs
LmgNCj4gQEAgLTExNiw3ICsxMTYsNyBAQA0KPiAgICNkZWZpbmUgRl9HRVRTSUcJMTEJLyogZm9y
IHNvY2tldHMuICovDQo+ICAgI2VuZGlmDQo+ICAgDQo+IC0jaWZuZGVmIENPTkZJR182NEJJVA0K
PiArI2lmICFkZWZpbmVkKENPTkZJR182NEJJVCkgfHwgZGVmaW5lZChDT05GSUdfQ09NUEFUKQ0K
PiAgICNpZm5kZWYgRl9HRVRMSzY0DQo+ICAgI2RlZmluZSBGX0dFVExLNjQJMTIJLyogIHVzaW5n
ICdzdHJ1Y3QgZmxvY2s2NCcgKi8NCj4gICAjZGVmaW5lIEZfU0VUTEs2NAkxMw0KDQpUaGVyZSBz
ZWVtcyB0byBiZSBhIHByb2JsZW0gd2l0aCB0aGlzIGNoYW5nZToNCg0KZXJyb3I6IC9saW51eC9p
bmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvZmNudGwuaDogbGVhayBDT05GSUdfQ09NUEFUIHRvIA0K
dXNlci1zcGFjZQ0KbWFrZVszXTogKioqIFsvbGludXgvc2NyaXB0cy9NYWtlZmlsZS5oZWFkZXJz
aW5zdDo2MzogDQp1c3IvaW5jbHVkZS9hc20tZ2VuZXJpYy9mY250bC5oXSBFcnJvciAxDQptYWtl
WzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KbWFrZVsyXTogKioqIFsv
bGludXgvTWFrZWZpbGU6MTI4MzogaGVhZGVyc10gRXJyb3IgMg0KbWFrZVsxXTogKioqIFtNYWtl
ZmlsZToyMTk6IF9fc3ViLW1ha2VdIEVycm9yIDINCm1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5
ICcvb3V0cHV0Jw0KbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9saW51eCcNCm1ha2U6ICoq
KiBbTWFrZWZpbGU6MTU3OiBraGRyXSBFcnJvciAyDQptYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L2xpbnV4L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzJw0KIyMgU2VsZnRlc3QgYnVpbGQgY29tcGxl
dGVkIHJjID0gMg0KIyMgRm91bmQgMiBiaW5hcmllcw0KISEhISEhISEhISEhISEhISEhISEhISEh
ISEhISEhISEhISEhISEhIQ0KISEgRXJyb3IgYnVpbGQgZmFpbGVkIHJjIDINCiEhISEhISEhISEh
ISEhISEhISEhISEhISEhISEhISEhISEhISEhISENCkVycm9yOiBQcm9jZXNzIGNvbXBsZXRlZCB3
aXRoIGV4aXQgY29kZSAyLg==
