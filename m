Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D59B54E234
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 15:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP3HQ0PrHz3brm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:41:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=vwGBQhHz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=vwGBQhHz;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP3Gd2m31z2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 23:40:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArmmYpN7Dtbv37pG4xGRFxRpkShyS0ubpIEbDu53lQlurVJ6zQjBUCuT3sk2QhOs/CPZb5XhltGx+jDNA96FzlDH+fc7WCNYMe/SxyRU2xrpVMsGKeCTtycsy8CsdPbJUVYksh6QNbPQuTcpPRkNwD6vBHvTbA6uHErZtVAq5SVbFCh8imBA6Q/eU4JFSPHyBbcvtHuB1rpDsStwy/0v7GHfruIK5N2GtnWeD9jbGaUXk9e8thhgoiaFxn9niEGmWFvPcucINHD3UpAocvV8K0Q9dW1a+IIb+69bQ9a8STSXC0YJNsI9wC5gHFyB9iGCwN3BBPXMONNjg263j+D2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/qyhYy9U3XEyYkmOJQT875VbB3O/EEy2b9IIxae63c=;
 b=UpwVZWDuzS8myRDhxzPyyV/efI5QsmXhr3yF5YQqxPvRQcyNznOnuXqjeTWO+wIvEziCOxNsEBiZAj4m5I6TIk09l7XigrRrQu1yFkGQbl2eC1ExLfkBCyhor6c4J8H5W5l5cZImArsW9kXlNqMGFTL1t7crIMUAHItDlMF1V5la1wqmK79TMII3pk9+w9iwMj4EV/O+0bsffi7zhqLIKITGu7kmmPwmbe/qpuHoWOgsfMJfEvGpeX8qMZfex+kxCeo4IufWDNRKebd1qQPSK8lWe5WFnGhLJC43Yzrm5x53Z2Pfu5nGYIV5nfIsEaMIc49vkNJGwD4hQPkff3KI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/qyhYy9U3XEyYkmOJQT875VbB3O/EEy2b9IIxae63c=;
 b=vwGBQhHzNwCpuXi3myU3SmWbDOhPxY04gzAKxBKyMsZ2DCiC9rpE/IIDPJYuF0kiqmZtjb4jPgwWDPl6aT7hcYYMYZzxlxnZ1GauHpptkXbVUDjmtY5XQsU405ehQmj1T0jNfC10Drf2hnwwoDHCL2v5x0nt3jVIQ6KNX0bAUfWNFg7/PPpUcBfdN1p+ceKZSycFOesWKpL4rx04iTSwmjzpW60z3mXF1xuJrXG2YZ+hixx3nhNKyHIHEUHtWxR85vK9IzErODo8yFOSLzBw1k2+S2vueekuuc72pre5cy8SATn9bKvBn1HzejaA+VoRBuS5tQsmOAKLVWv6SfGBdg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1755.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 13:40:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.014; Thu, 16 Jun 2022
 13:40:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Sathvika Vasireddy
	<sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index:  AQHYbs5qyDK6/X7ZxEy6GUPocR2PqK0txaCAgAAXpYCAACrWAIAB07WAgAizrYCAGZ52AIAAAb2A
Date: Thu, 16 Jun 2022 13:40:34 +0000
Message-ID: <30f3791c-0fdd-e635-4a85-ec457f990fae@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
 <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
 <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
 <578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
 <f1decbb7-b441-a241-469a-4ba118e08212@csgroup.eu>
 <c1e2cf35-2a8d-87e6-3a7e-7f144392db23@csgroup.eu>
 <1655386289.uh0k7sgl1r.naveen@linux.ibm.com>
In-Reply-To: <1655386289.uh0k7sgl1r.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31e55506-c7ad-415c-ae1b-08da4f9dca30
x-ms-traffictypediagnostic: PR0P264MB1755:EE_
x-microsoft-antispam-prvs:  <PR0P264MB175523860ED71A558CFE3616EDAC9@PR0P264MB1755.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QEPttXcH2SqSz/4HZDFnPUXa92rKqPtzhbOPNDBl6xIBwsMoEetr6fxavyObuTrgcPlfaypCvikEUBy0vjMCArG55FMhEAadhbR5nXXOk52oXWuDpnZncS3TEhqYy10UvxNr/ug+CjklJr+hkD+pNDB+k/c5H4i80yN0fxI57pC+Y3IwkMpURon/vewWfBfphhnF1lr4afePJfh4kModHxdxHQLJ6f+1DbKaW/PnEbqWvP86LDeaOVvFJitHbRhVia55Riu3F8YrpQP/dqTFYY4YIt9jfHnGI1fFcsPasRg7vdPrpsidTXqR9wZm96QKtzFtcwN29WzMG276BQweu4AUvHOPW/al1w51AdAusZIlDE51NQCDnaYOa40WkBT/PyrmZYTK/aHnDjWNn9BwTKzqG2E92DdVZtA7hj1faBHrdH4pS7DcHdDno7A0rixWt1wItgjCRa4bS+44vD0n6I61szBftU52+fgUc/0MrGRCOR0ZW43EEgZhELRRDmZmUr9YBTPXpDGVPHLtDgqIuoCYQm668IP4/PQeeR5qKCaRMSE15j5h+AjL2mTev5euiwkWZivHl5e5Y08pAu7bSMjD9bKa7m4dVVPOuU1Wfo48r5HrA5Fjc/KJ3oIPfR5CSKyUXfVoNPhy6lgQiINZmKEbsmKtlkHVbTLpeHnZyu1cQDE6UUDW3HvrpP3UJj/OygUB3HQwiFybl9HhXHO6ZubJW8PmTbSXeuxQTyWtLceeIDkZ3fUJ6bDpSHg5/bV84u3mo2o0hjvRVfgtYke5niV1OPFOT/5LlwV2adLlkle4/kIOpruEbU0jLMrC48XnTNujlg5NiYTE0pSzhjUeRsUGJ07gFRHvrWb3iqkEnBw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(31696002)(186003)(83380400001)(86362001)(2906002)(316002)(66556008)(110136005)(4326008)(31686004)(71200400001)(64756008)(66446008)(66946007)(66476007)(8676002)(76116006)(54906003)(36756003)(66574015)(91956017)(26005)(6486002)(6512007)(38070700005)(2616005)(5660300002)(7416002)(966005)(6506007)(122000001)(508600001)(8936002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RGJnZ2piSEI1eXgyb0U4UTkwYWMwczhENitsQkEvNnpvQmROZDNpT3ptaFVW?=
 =?utf-8?B?RS9xaGtabkNwSE94Q3AxTVhscUVKZnN6TXhMMVRqM1FGY1djNXVoem96N2gr?=
 =?utf-8?B?L2tMSnN1dXlJaS85UEtOVDFMOVVWSCs0SEtxVndqazNVeEI3U2ZyY3hCdnkz?=
 =?utf-8?B?TjYrZUIyOXlpb1NFYUtIcUcxVDlMNEVHOVpRVGxzVEo4WjFtaVBCcHVqUkxE?=
 =?utf-8?B?MU5KdGR0b3RqanBEUDBoQXpJY01rSmsxTWxyQ0NkTjdLWXdER0dvTTlWeHhH?=
 =?utf-8?B?SE1hb0VwSUwzUDJXUDZrM1FhZlM5YVlza3ozVHdQVUxmdTlBcW15bHBJY1VC?=
 =?utf-8?B?QXRIOG5yRE9FZ1VUOTIwcC9VenJtbHpFaHlNbUJiWllueWZTTUF1UWI0TE1M?=
 =?utf-8?B?aGZVYW1DVlNiV1lKdXJrRk5OTTlwK1c4RVpmejhZZ2VqbEdxZ055d21DMlZw?=
 =?utf-8?B?d3lOVkVmbmxWbVBkcWtkM1VDNncrclJoUGdOTitMRjlPQVlmRDZhSnR3TjdP?=
 =?utf-8?B?eVlSSUs5ZUFqcHc3UlVlL0tMc3lxZ2xndzRwQlVmWXFMdzhxSi9tdStzcTFm?=
 =?utf-8?B?Tm5zR2NyN1RIbDhmQXFKTWRaOERzRXBSdW5nSDgvNnFWRlpvYkVuS20rOVdj?=
 =?utf-8?B?Zm5VV29mcHltejNnLy84QTdMUURXY3NLSlZtVjF0VUtpSmJDK2NrdlV4bjJv?=
 =?utf-8?B?NjVPMW9PcUJQbVA3ckRBR3RrUnlqalJ0WkMxeVB2WElmNm9mWm9nUU1WMitj?=
 =?utf-8?B?TWl6Q1d0ckhUUzY4Z2pWTTdiWENRMDd3NkRueW1hamc0a3prdVNkbDFCTG5R?=
 =?utf-8?B?TnNiQ3F5QlBGQ1YrREdqU0pMaWovaEltMGVHUDlyYmhlMk9jdkJTenVzQzZ2?=
 =?utf-8?B?VXE1ZUptRWlyNU44OTZENjBnblJ0VFV3a1kxRGtFNklPUjVTMTVVR2hLZENx?=
 =?utf-8?B?OVZWS1YvRytNYlhUL0lyYjBZNEtEN0g2azZ6SFNEVjgxNFkvRVlIbXBmT1dX?=
 =?utf-8?B?OXdOelVaVjFnU1V5T0o5bnMvRWZOc0pOZUduZ1Rac1QyM1cyQUw2dy96SzFz?=
 =?utf-8?B?WUovVUpDS1pXWmxFVkNjeWVlemtNb3piNjNaR01mbmViZjVNWHhpMjhnQm5H?=
 =?utf-8?B?cHBoYjQ4OHdaZERyMUI3aVI4KzZJRnEzQTRsR082bzlXcmRTZ3NmS0pHV0tV?=
 =?utf-8?B?azhyUEJyRUwrb01Hbk5zdXBIOUJQcXVqcGNDMGJSY3YrU0FiU0pkYlBQaGJJ?=
 =?utf-8?B?eElKTzRTZG1oc3I0aURWYnorREl4VEtvYlM2RkZCZDNIVnVnRTQ0THBNbGRP?=
 =?utf-8?B?NE95bUtKS2RUd0RlcC9XeGx5Z2JjdHZPMjBvVEpGR1hlUkQ0WG15R0wrVjcx?=
 =?utf-8?B?Z0xRRGhjalYvMHA1SG9xNk5GQnoyNHNKeUFBYkdDV0lLZnFtU3NrRENrRGVk?=
 =?utf-8?B?TjhRckZGN0xOSnhEVFhDZS8yRVJiRWFGNE9jQ25UZXRkV2V5ZUlvcURyd0Rv?=
 =?utf-8?B?cVh4ckxFdHV0bTVrWW1CT01nYlpxQnYyWC9nZlE2WFlTVi9VNEdYSXpCUnhk?=
 =?utf-8?B?UjcvNGxFVHRMRXRwcUpJVlpNUjBxQVJGVVRUK2pramZRZ2l2eERnZVdRKzRs?=
 =?utf-8?B?R29NeW1kUmZSN1NaMDZVSG0rUnZ4L0RCZzZid2VjWTJyNFhqOWVSS2pzMjVK?=
 =?utf-8?B?dkNhTEgxdTFYUEJ4MG9NWVgwVytVaXhCQ09OdDA4UUVIdDZFcXErZVBUcjdZ?=
 =?utf-8?B?MVBVc0hUSmtlMWpkWW9XKzUzY0YrNVJXK29UQzVYanpHdlJ4b2RRN3k4ZHhY?=
 =?utf-8?B?TW9sY0RUQW9pcHM3R1RybTU0NEtmTlZwZ0RGTjFDTkxsVkxyTGhnTDcrMXhT?=
 =?utf-8?B?S2QvNGFEYkl0REMyRzRSUEhXZ2hBdlZoMTczN3krK1IzRGFUU3RodU9LVkl1?=
 =?utf-8?B?NnZOVi9EaDdsVC92b3ZaNjlsVjlhTG50RWFRdzFUdDF4OEd6N1l4dzNleXo1?=
 =?utf-8?B?UTBVWW1Vc2Qyc2lXMGZkOHhiRlhYWTFUeEptejljUEtqVXdPRXpEc2RsWTJX?=
 =?utf-8?B?YjQ1bXpNR3VMQmNyMnV5Q2dCR1pockF0UUV4Tll4Ynl0dSs0QzZuaWdxYW11?=
 =?utf-8?B?RHZPS0txSnlIdWh3RjBaR3JVMndjS2V4RS95bHFpcERBOXlhbENyZ3BKUHVK?=
 =?utf-8?B?RUxzUjZWTVFEZVFJZmJzMWJRbXB1MjhqQ3JkTFpjc3lyK0xFWWlpeWdMT041?=
 =?utf-8?B?Yi9jQUh3SGlibGRaeVBUNXNtaENaL0RHaGMxNTgzaW1FY2Y1QmVSZUN4Z0Jw?=
 =?utf-8?B?eHQwTmYyYk9qRU1TdUlGWmczdXN1SDZyNm5JUXdhc0xOTkFldmZZOS9GMXor?=
 =?utf-8?Q?7ZvtupJZIm5JxfpB6aesDWQOdFX82LYR/VnST?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01E6436A6158B943AE40232BD7391307@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e55506-c7ad-415c-ae1b-08da4f9dca30
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 13:40:34.6525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TBkdmeFou76LD74zidUmhrNyMuRdoWRHrigVGQZS1LXrtVgF1Uxgj9r+1YllQJYoNH4JTyxIazcKECiWZ2Z6Aj1EnJfybMKCH8OrFe2Hfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1755
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, Chen Zhongjin <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA2LzIwMjIgw6AgMTU6MzQsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjUvMDUvMjAyMiDDoCAxOToy
NywgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKgOg0KPj4+DQo+Pj4NCj4+PiBMZSAyNC8wNS8y
MDIyIMOgIDE1OjMzLCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6DQo+Pj4+DQo+Pj4+DQo+
Pj4+IExlIDI0LzA1LzIwMjIgw6AgMTM6MDAsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPj4+Pj4+DQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICvCoMKgwqAgc3dpdGNoIChlbGYtPmVoZHIu
ZV9tYWNoaW5lKSB7DQo+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBFTV9YODZfNjQ6DQo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBSX1g4Nl82NF82NDsNCj4+Pj4+Pj4gK8KgwqDC
oCBjYXNlIEVNX1BQQzY0Og0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
Ul9QUEM2NF9BRERSNjQ7DQo+Pj4+Pj4+ICvCoMKgwqAgZGVmYXVsdDoNCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgV0FSTigidW5rbm93biBtYWNoaW5lLi4uIik7DQo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4aXQoLTEpOw0KPj4+Pj4+PiArwqDCoMKgIH0NCj4+Pj4+
Pj4gK30NCj4+Pj4+PiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbWFrZSB0aGF0IGZ1bmN0aW9u
IGFyY2ggc3BlY2lmaWMgPw0KPj4+Pj4NCj4+Pj4+IFRoaXMgaXMgc28gdGhhdCB3ZSBjYW4gc3Vw
cG9ydCBjcm9zcyBhcmNoaXRlY3R1cmUgYnVpbGRzLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4g
SSdtIG5vdCBzdXJlIEkgZm9sbG93IHlvdSBoZXJlLg0KPj4+Pg0KPj4+PiBUaGlzIGlzIG9ubHkg
YmFzZWQgb24gdGhlIHRhcmdldCwgaXQgZG9lc24ndCBkZXBlbmQgb24gdGhlIGJ1aWxkIA0KPj4+
PiBob3N0IHNvDQo+Pj4+IEkgY2FuJ3QgdGhlIGxpbmsgd2l0aCBjcm9zcyBhcmNoIGJ1aWxkcy4N
Cj4+Pj4NCj4+Pj4gVGhlIHNhbWUgYXMgeW91IGhhdmUgYXJjaF9kZWNvZGVfaW5zdHJ1Y3Rpb24o
KSwgeW91IGNvdWxkIGhhdmUNCj4+Pj4gYXJjaF9lbGZfcmVsb2NfdHlwZV9sb25nKCkNCj4+Pj4g
SXQgd291bGQgbWFrZSBzZW5zZSBpbmRlZWQsIGJlY2F1c2UgdGhlcmUgaXMgbm8gcG9pbnQgaW4g
c3VwcG9ydGluZyBYODYNCj4+Pj4gcmVsb2NhdGlvbiB3aGVuIHlvdSBkb24ndCBzdXBwb3J0IFg4
NiBpbnN0cnVjdGlvbiBkZWNvZGluZy4NCj4+Pj4NCj4+Pg0KPj4+IENvdWxkIHNpbXBseSBiZSBz
b21lIG1hY3JvIGRlZmluZWQgaW4gDQo+Pj4gdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hcmNoL2VsZi5oIGFuZCANCj4+PiB0b29scy9vYmp0b29sL2FyY2gveDg2L2luY2x1ZGUv
YXJjaC9lbGYuaA0KPj4+DQo+Pj4gVGhlIHg4NiB2ZXJzaW9uIHdvdWxkIGJlOg0KPj4+DQo+Pj4g
I2RlZmluZSBSX0FERFIoZWxmKSBSX1g4Nl82NF82NA0KPj4+DQo+Pj4gQW5kIHRoZSBwb3dlcnBj
IHZlcnNpb24gd291bGQgYmU6DQo+Pj4NCj4+PiAjZGVmaW5lIFJfQUREUihlbGYpIChlbGYtPmVo
ZHIuZV9tYWNoaW5lID09IEVNX1BQQzY0ID8gUl9QUEM2NF9BRERSNjQgDQo+Pj4gOiBSX1BQQ19B
RERSMzIpDQo+Pj4NCj4+DQo+PiBXZWxsLCBsb29raW5nIG9uY2UgbW9yZSwgYW5kIHRha2luZyBp
bnRvIGFjY291bnQgdGhlIHBhdGNoIGZyb20gQ2hlbiANCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyMjA1MzEwMjA3NDQuMjM2OTcwLTQtY2hlbnpob25namluQGh1YXdlaS5jb20v
IA0KPj4NCj4+DQo+PiBJdCB3b3VsZCBiZSBlYXNpZXIgdG8ganVzdCBkZWZpbmUgdHdvIG1hY3Jv
czoNCj4+DQo+PiAjZGVmaW5lIFJfQUJTNjQgUl9QUEM2NF9BRERSNjQNCj4+ICNkZWZpbmUgUl9B
QlMzMiBSX1BQQ19BRERSMzINCj4+DQo+PiBBbmQgdGhlbiBpbiB0aGUgY2FsbGVyLCBhcyB3ZSBr
bm93IHRoZSBzaXplLCBkbyBzb21ldGhpbmcgbGlrZQ0KPj4NCj4+IMKgwqDCoMKgc2l6ZSA9PSBz
aXplb2YodTY0KSA/IFJfQUJTNjQgOiBSX0FCUzMyOw0KPiANCj4gSG93IGRvZXMgJ3NpemVvZih1
NjQpJyB3b3JrIGhlcmU/DQo+IA0KDQpzaXplb2YodTY0KSBpcyBhbHdheXMgOCBieSBkZWZpbml0
aW9uLg0KDQpTbyBpZiBzaXplIGlzIDggd2UgYXJlIHdvcmtpbmcgb24gYSBiaW5hcnkgZmlsZSBm
b3IgYSA2NCBiaXRzIHRhcmdldCwgaWYgDQpub3QgaXQgbWVhbnMgd2UgYXJlIHdvcmtpbmcgZm9y
IGEgMzIgYml0cyB0YXJnZXQuDQoNCkNocmlzdG9waGU=
