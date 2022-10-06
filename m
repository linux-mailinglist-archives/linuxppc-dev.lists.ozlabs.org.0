Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8445F637D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 11:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjmBX17lMz3dqk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 20:20:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pOeguXgX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.73; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pOeguXgX;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120073.outbound.protection.outlook.com [40.107.12.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjm9X5kJGz3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 20:19:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYSBcFWMcBF3Y9MXMX83ARGzv9q+jlLauSrsu9yjcYxZQ/M8JM4tthsfewLBB6s+wU3u00/9LAsyiV+bi3XC49fESCBLHdHlPog9JiazJu4JGOyrR1T19lxWW5EDsWhjZ1l2NsA7srob/HPgLOd1Kg++bVvSBMLaCObwJF082GFd8feTOhxDZIofskUW8shP31LZtZY2S9BnYXkvnpFGmyY5V8ZCXWEtJoIQBZuFs65FU7o5WFZplL4Hq52eSXcFzDAmy7x6oIUAI+MR1Rnn/jgE+2v5e45cQs7Ms+wZASNbuCiPNp3aFelEr9SCeYSqRH+nw3iWa1l0zEUp/pD8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2IXUxDwXS7d8K1XhwKsZ81ewYvG7z6c8U61JlCALnk=;
 b=Gr5j1rVj08BggnQaCBowhjwxhepw3YN1g5uipf9uRiD4j7sYL94ZqcwagvCD6tV8+UU2tM3msqMfh2wDYrTAVCR/+Y3NyK0XV9jMYarao4tkeXzCvpnByqE+lJRK0AqhDBCgri21PGfxkLQqlC7mBUnmkWnQvmlGK1Qk9+8OUUrYQ/jkQVW8arCfS33YVQcaRcB8Sq2IEgAsL2ZDhZUgbQ4sKKCP8zKN2J4nXTrEjksVldt4ijUBNf29rqaIxEtmwsUjYoSmTit/nMS7SwQNPpXz/tgPvsKpTn1AcRe9u5A1QpwGGnrmKPq3pKsz3+EBXIt9ScJ9JUM7rec3X/g4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2IXUxDwXS7d8K1XhwKsZ81ewYvG7z6c8U61JlCALnk=;
 b=pOeguXgX5NACJCGEaOgr3rs6VDDjWPXibNR+6hWB6q+GCkbPSIt1X0EI+0oUs0lfFjhf2MrA6iWxPkcm5oKGOR+st64L6GVfvkZywAsZaS6AKzEt3r9pSFClSKd9UPbYNeXKtlQFU11HZi//zeGaTR/xo5BkzzU87vzWK/2mRz+8HklS5UC6PcwdIdRz7oZLwm+cY3Q6GoRrrRK2h9PAx2fcKC2T9JarkVfYbtee3sGdnVCGKI6wDU4buQMVMuHYHrsYFFQVZaWZQ7uyI+ZT5I5jiWiHP3/Rcn9OOZW3iq+TC63XHYONdfbS1bUNiazXabk13sXDWLs8I4hpAYHJJw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1756.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 09:19:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 09:19:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH v3 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHY2Hv8jcjn0F5WT0KrXxtUtzcdPK4AFj2AgACiUoCAAF/pAA==
Date: Thu, 6 Oct 2022 09:19:23 +0000
Message-ID: <b28d8d04-8658-c4be-88e9-80f635debfd7@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-2-bgray@linux.ibm.com>
 <8625116b-4a0a-a9fe-fe81-47c23a58c91f@csgroup.eu>
 <6642c9085a1b98a4aa8a03383b71d070881afe45.camel@linux.ibm.com>
In-Reply-To: <6642c9085a1b98a4aa8a03383b71d070881afe45.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1756:EE_
x-ms-office365-filtering-correlation-id: 75afd5fd-b892-4fd6-a0bc-08daa77bdb85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JvPucSnzEqqP8uiTZtoPZoBp5yiRSl0y7louPcTk48BrJkQtg91UG/5T6fiL6FVHqNyB0OtXz3Ot2yMfJaEfs1nY2KO1ehrn2SNTCWZFYPq8GS2k3+Ep5kUHTJlsnE7+FoKt+BVyz+1/e1qtpzgXwvg0qpmCJLzoBW3s5Fu/OilnBdsboQOkYXPwQIRbhphQ9z+9mt4aYRP/WDMkAOzXlcPn4gqcbbE4khc3G1UJjOjy9xpbS5e9WSB3NuNXTL4Y7ktO1AkikY4mUzO/3cjuWkMRu/4rD4IHOEh1xC96B05e1EWBcTIO+57cUqENkkwBssIjXBd1ih3SnWmFZk+n7+B4mvBf6XQ/EfgCcmZ63uRps0KwtdVdjyY3xbewdkZiM1TuIyyaVbyn5CdS8CCDs1dX4dz2Lmokzseq6BczvgWM6Ja0XtBmXvjOs41f85mBgSbz0gGzghBiYjHaZDX5WW4rq55DdyXqIv3X8K8vgWCVAGV5vU4GcWm6LEnwYdBs83plGtdO8Num1y1tLaLfDSAELxn1225vRVbUmPaEe6IMT07itjewriowXCz4+0jmN3hNIIsjPPnEME7D219KvvWYcX1YW2i85Il44QX0nWIMWDpLAx8aauUgmwHZ0+ovMeKxz885cpK4jpYjLA2wVTEgHdjsCNF+zEPKPrmTnewpUQQs8EnEHVoDHo72R3K8E2Tbr4fR+YZGRElxHdi2es+w3CydrTwa7UZq3wGFHqogPcZTKWjB6Lh0bfEC+EHRnCkqmKKbgPU72ufXoXXt46Cn71nK9Tp2+XmINcRC6SxMIOmKT7wOTD/Tvv2ohkQe8djMDSN4hxOjqCjzTpOST6uehxUgpKGUQWWsD6bMJTE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(451199015)(54906003)(316002)(110136005)(5660300002)(478600001)(8936002)(71200400001)(7416002)(36756003)(44832011)(91956017)(76116006)(66946007)(66476007)(66556008)(64756008)(8676002)(2906002)(38100700002)(6486002)(41300700001)(83380400001)(38070700005)(122000001)(4326008)(26005)(86362001)(31696002)(6506007)(2616005)(186003)(6512007)(31686004)(66446008)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MEpHZkxjcGhERkJFbWptVW5PNlNxaXhkNllyK3FwUTQ0OHovbmdJVE9tUnRD?=
 =?utf-8?B?d1RieGVSTXlnSmFwckR2b2hGZUdaTUYzV2x0cmpjbDJyRGF2K2E0aEQvZW5D?=
 =?utf-8?B?STB5aXJQeDh5dkdXMkRDK0xDNzNvbHo4RXFsbnpKRnNRUU9taHZUNVNCdldD?=
 =?utf-8?B?T0lxWXh1YUFNV0RwNWpZWnl5emJ3ODQ1ODRzT2lsN1cybmJyeFZsVVd1M2hn?=
 =?utf-8?B?QjBBWmdWV1NuNlNpbnpzb3RCdUlGS0hzcG41cTF3TjFySkp1YmdQL0ZJZHRZ?=
 =?utf-8?B?aG9la0tGT01KN2RlL25MUDZNdlBXZXFQRWhkODNOdUNNODVnWkJYeTdpZUJw?=
 =?utf-8?B?RXV3TGFvQ0RacUlOZTlzQTNSaFBid3ZzbEZjZWowdVU1TU4rdkdhd1pVSjUr?=
 =?utf-8?B?V2NjcXVOODMxQXFDL29qc2NSNXhGd2V4amhpaXZHMWxWWUIxbDdPNlg0bTcv?=
 =?utf-8?B?dEtVdnNlajM2eUt3ZUZkbm1xQ2kxOE5DRFUxakJyQk5Rc3R3ZFVXcnJoQkNa?=
 =?utf-8?B?TkdDOG16VmxFR1lyK2JsemtPTDRacDhNaVVqK01XZkVqWWZ1akRsNGFxb1dR?=
 =?utf-8?B?V3B6ZWFpRmFDME9LVFBiR1Z3UE81Tm9Na3BIYkhsV0NiV3YrR29xa08zRjlM?=
 =?utf-8?B?ZlFuTFlGdlpzR2F5enAzTUFjdmVJL3dqZmZ2RTluT2VLL05DZVBFbEIzcTdC?=
 =?utf-8?B?OEllRkJxNTlWYmZ3TzdDa0NkcmdCRnk1ZUQ0MVJEWWZlL2xidmZ1YmIrc1dz?=
 =?utf-8?B?RTFNNEZMYVhKNDlYUkdLTDNQTGRtWDJkUGlvZDFSeGRNdzFvWlFxTFFwYVpY?=
 =?utf-8?B?Mnc3SlVlVTU2bFJRcVh5aVJ4UjJ0andtWlJZUUxsNDN6OTVwblozQW5raG9Z?=
 =?utf-8?B?ZFdySmNGWWhtMlJMOWk4cUlZemM1RlNEWFEvUHppWTdad1UvQWtaWUFZYzRP?=
 =?utf-8?B?UlduU2M3ZGdMM0xZN3dsRTJNbWJiYWVlR1k4OU1nd0dtcWpJMEJnVE9HQzl2?=
 =?utf-8?B?bEdmRTNoSm4ycmFpZjVseTI0NlJ5SWpTT0tqNEpCek4xTXFOV1RaTGpBWTIx?=
 =?utf-8?B?dUEwZXE2YVlCd1ljNnloWFNEb3pMNGVPanRGWnl6UVZBTlFDNVlJVnVEVktI?=
 =?utf-8?B?dWlSQVFZVDBCR2l4cmhPVXdVMHUralFkblM5TzZraUJSaERBRlF1K2Q1cm9Z?=
 =?utf-8?B?b0Yyck5jV1ZFME5VLzZvZXhRN3pOMGZQQmR5MXc1cFU2cGpSYWlGU2RpVE5r?=
 =?utf-8?B?aDA2SEJEOGR5cWpNYklUZmRTMUpFTUYzNUFaNjcrdkMrRERLRExoRThEcjBD?=
 =?utf-8?B?QUpMTWZLV3NvYWZ0VlFnUUh1c3JIcVR6VVZibGkvbDNPOWVJQzBNbFprMjRp?=
 =?utf-8?B?V2xsUTRyK3dGQWNDSXBiM0xvYzFlUTNHRmFQejZHODZpMTBreis5N3dSK05T?=
 =?utf-8?B?N3REZU9pVGM4M2tLOTFWMTFleHBFYTFCSU5tTzR3K0RGVUozd3k4Y2lTVWxF?=
 =?utf-8?B?ODhKSk9Kb0lua2s5RTVQUW5qbmRVL2pxbVZXL3l5T0l5K3VzUVRaaitUcEpL?=
 =?utf-8?B?QlhxME15NThRNklyb3dlQ2hrQmMrWGhXOU93L3h6dEg5TGhKc25tSDFmaXl5?=
 =?utf-8?B?NjBKalQrbXJXemkvT1c4UU8rSWNEdXFldkNnaXNJTkZOUGFNb3dpY2JRWXA0?=
 =?utf-8?B?dFk3WnBIOW54S0toTGttVFBoQW13VEpaeWlZUDNBQ29wWnFNUWc3bnhQMEtS?=
 =?utf-8?B?aUVBNzdTY3MwQ0x4WHFZdFZXZnByWHV2WmdSWkY1M0E4clFwZ3RDNk13RUJt?=
 =?utf-8?B?SHNlNnpKVDlySTFkTHNLalRXZnIrZk11dXVIYzAvckl1YzFCL09FNEo4Nkoz?=
 =?utf-8?B?MU5ySHVsaXJiNlB4ZTgzZGFoTWxWSXNYSlJxbno0d2xYWjE5eEgwb3JNN0JP?=
 =?utf-8?B?WHhkZUVvNjdXQlNBUUxyT3hoRy8vbW5ENWxPa3hIN0I5QXZrdDNDUk1kL01P?=
 =?utf-8?B?U3p1d2pQNlhSZnlIblVublcyaExSUDBERXprS0xDSTQ0VXFqamJ4ak4yaTFU?=
 =?utf-8?B?MzlncmpCNkQvYndGemhYVS9hK3h2NjR0Qk51Vk12UCs1ZjFxWW85SXFpYmlE?=
 =?utf-8?B?ZGxmUzd1VDdTdUdPazlZVkkyU215S1E0WVpkcXZFMHFBSUxTaFlmL1hNemUw?=
 =?utf-8?Q?+h36Mg7QnQIaur3KgDUMQ2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADC995D813FDD4469B0E931D7544F261@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75afd5fd-b892-4fd6-a0bc-08daa77bdb85
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 09:19:23.1974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GipSzWgyfwL/fYQt0J3XjxoT0KORt8f6Vk0fLKtZPwWhvFZISnrB7pGEJ+Br2rFzfoOXbULFrgh66/O0/1tQDsyms7vyssWlzr8yNPnPYu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1756
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

DQoNCkxlIDA2LzEwLzIwMjIgw6AgMDU6MzYsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gV2VkLCAyMDIyLTEwLTA1IGF0IDE3OjU1ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4gSSdtIG9uIGJ1c2luZXNzIHRyaXAgdGhpcyB3ZWVrIHNvIEkgY2FuJ3QgdGVzdCBpdCBv
biBoYXJkd2FyZSwgYnV0DQo+PiB0aGUNCj4+IGdlbmVyYXRlZCBjb2RlIGxvb2tzIGhvcnJpZCBh
bmQgc3ViLW9wdGltYWwsIHdpdGggYSBzdGFjayBmcmFtZSBhbmQNCj4+IHNvDQo+PiBtYW55IHJl
Z2lzdGVycyBzYXZlZCBpbnRvIGl0LiBUaGF0J3MgbXBjODg1X2Fkc19kZWZjb25maWcgYnVpbHQg
d2l0aA0KPj4gR0NDDQo+PiAxMiwgd2l0aG91dCBtb2R1bGVzIHdpdGhvdXQgc3RhY2twcm90ZWN0
b3Igd2l0aCA0ayBwYWdlcy4NCj4gDQo+IFllYWgsIHRoYXQgZGVmaW5pdGVseSB3YXNuJ3Qgc3Vw
cG9zZWQgdG8gaGFwcGVuLiBJIHdhcyBsb29raW5nIGF0IHRoZQ0KPiAzMiBhbmQgNjQgYml0IG1h
Y2hpbmUgY29kZSBjbG9zZWx5IHdoaWxlIGFjdGl2ZWx5IHdyaXRpbmcgaXQsIGJ1dCBJDQo+IG11
c3QgaGF2ZSByZWZhY3RvcmVkIGl0IGJhZGx5IHdoZW4gY2xlYW5pbmcgdXAgZm9yIHN1Ym1pc3Np
b24uIEl0IHdhcw0KPiBzdXBwb3NlZCB0byBhdXRvbWF0aWNhbGx5IGJlIGlubGluZWQsIGxlYXZp
bmcgaXQgaWRlbnRpY2FsIHRvIHRoZQ0KPiBvcmlnaW5hbCBvbiAzMi1iaXQuDQo+IA0KPiBHaXZl
biBpbmxpbmluZyBpcyBkZXNpcmFibGUgaGVyZSwgYW5kIDY0LWJpdCBpbmxpbmVzIGFueXdheSwg
SSB0aGluayBJDQo+IHNob3VsZCBqdXN0IG1hcmsgX19wYXRjaF9tZW1vcnkgd2l0aCBfX2Fsd2F5
c19pbmxpbmUuDQoNCkZXSVcsIEkgZ2V0IGEgZmFyIGJldHRlciByZXN1bHQgd2l0aCA6DQoNCmRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyANCmIvYXJjaC9wb3dl
cnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCmluZGV4IGJhMDBjNTUwZDlkMi4uNDQ3YjhkZTZlNDI3
IDEwMDY0NA0KLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCisrKyBiL2Fy
Y2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQpAQCAtMjEsNyArMjEsNyBAQCBzdGF0aWMg
aW50IF9fcGF0Y2hfbWVtb3J5KHZvaWQgKnBhdGNoX2FkZHIsIHVuc2lnbmVkIA0KbG9uZyB2YWws
IHZvaWQgKmV4ZWNfYWRkciwNCiAgCS8qIFByZWZpeGVkIGluc3RydWN0aW9uIG1heSBjcm9zcyBj
YWNoZWxpbmUgaWYgY2FjaGVsaW5lIHNtYWxsZXIgdGhhbiANCjY0IGJ5dGVzICovDQogIAlCVUlM
RF9CVUdfT04oSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpICYmIEwxX0NBQ0hFX0JZVEVTIDwgNjQp
Ow0KDQotCWlmICh1bmxpa2VseShpc19kd29yZCkpDQorCWlmIChJU19FTkFCTEVEKENPTkZJR19Q
UEM2NCkgJiYgdW5saWtlbHkoaXNfZHdvcmQpKQ0KICAJCV9fcHV0X2tlcm5lbF9ub2ZhdWx0KHBh
dGNoX2FkZHIsICZ2YWwsIHU2NCwgZmFpbGVkKTsNCiAgCWVsc2UNCiAgCQlfX3B1dF9rZXJuZWxf
bm9mYXVsdChwYXRjaF9hZGRyLCAmdmFsLCB1MzIsIGZhaWxlZCk7
