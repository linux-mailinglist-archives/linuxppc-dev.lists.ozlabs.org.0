Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A945F6160B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 11:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2NBV3ThLz3cLm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 21:18:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=I7T9sDs8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.83; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=I7T9sDs8;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2N9Y0V4Qz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 21:17:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL2ECtsWkA/t7z9C6zui3RyCE+Yo+GSkgKVCCZrzh2jnaF9PNYd1QSOZMMVIARjaaesDC12cg3F548p9LGa39L/LM4Ykm22dMkPA/bwz3nQPYRCgRQGGKizlEsX5yQ8Nt0lGk63oTLk6YdOofSbWNK+9TN19JwRcbpyrfJVqSKUvgnbHN9Yw6KKG1XlnlfCDhGfCS5rftsDcWk8tPbXZUO/tl1QcD34e5Y/Y8cbzAXcLDBo/mJoiLH+ej9jwaP4DpRr4L9zfmeVtbU6WiNWqHJNZyB/WfblLInqw9SsyC4DryKAAxUHXQa0Wi1YNtn+HWHDXYMfH/ci8oLBp9zTRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4FCi4jSwF17DnflFxtXawql71SpLzkzghH+Q4On/vA=;
 b=f9onvCp0RW/Il2viWtS9V2RnQbwnSjnQHWwqmD0NuNgfjx48KlydegLma3kihNmOqWxZiUCJf8KE4F7pbTC92VsRy9sdq67ykPgvCi7b3SCx3OBs/1S/6iO0SeFaSaS932jmW8YavpCbef9w04x+3XKcXHC6U0Po7H1EjJRhueGE6IQdwb8He3j3Hnb1pGrjh9H8fycMPiNwq+NvnTveyznCPqeqREy3KYsCRVkoNOj7ExikVJ+l3e32x6g4IN1GhltRnBjTb4zKHW/RLgHQ5r/minGbhkgEFkY4sxOahys3eavPm6NHAj63/Uy4Gs0vyS4DAajxfhjEFiBz3Wse1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4FCi4jSwF17DnflFxtXawql71SpLzkzghH+Q4On/vA=;
 b=I7T9sDs84r50gbWT3m9c67wSUkcCsw1Z/Tyg+6GwF/CVk8P0D575GWkeR+VSToyfOjSM3MC/4fvggAOSoU7rsCm5Q5Q8TwAk29cLbLG+4NIu+2Qul8yb/oEIPsVwUu09fll5yOSSb5LZY32f08GOZrXVg+nNSp+OxlFjWygUVZbKb1hJM89djzCxr2S+C8nJkI4FOIiNd2/3xQKPTxEU9+h0xMPKVqB583eTVezCRvSHG0aEdAbsJ9kDex9oVwFTnE079RyxWNLnM9Jo5PdXvRtJKwZEvdOaDoCmymxJ6nwUzmRs+Urjlmrr79u6cIVuW6CGyLrjfejZFl+bXLji6A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 10:17:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 10:17:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 7/7] powerpc/code-patching: Consolidate and cache
 per-cpu patching context
Thread-Topic: [PATCH v9 7/7] powerpc/code-patching: Consolidate and cache
 per-cpu patching context
Thread-Index: AQHY6Cx+/lgBePFde0u8aXvvMxpbMK4reCQA
Date: Wed, 2 Nov 2022 10:17:01 +0000
Message-ID: <9d0fe711-8ea8-2325-81f3-8b9b7a3d729d@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-8-bgray@linux.ibm.com>
In-Reply-To: <20221025044409.448755-8-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2006:EE_
x-ms-office365-filtering-correlation-id: a8b7565f-8629-4f6f-08ad-08dabcbb6206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  S82/2LkKDh8TxNJBpNCcLB/VQGQ/zOUbAIph44X4nkRLZROAhFRhzSp9GkQkRtlCF8M+h7qjdCzcrBKTm9QVYE+JUiwbyEJzwmdxju/MlE47+Pd8wzojrhSvf1itifeIKbDOfO6S8McqngyTW4m+Krdv+gOi3MajNS8wty1WOaKsD/46mC0d/EJfZrL5NPY7R0tu37IOeu9Ej2GnKIVO+UMnafUiedlHMVmdeYdAj0ORlKLIFkjKAF3ZBzELfsF+QIS0vI1WMyIDdyr9q1U9yEBGMTSAZ04CJhIQXpL/7F8DNXWO1W2GrVMEg7BUx2IF3Fl+RopvCtNjf1q0D8xn8V5I6tlKpB1pqA+exy8XYfgF2J/NqdgvYlDuAGfpr0uu2slwNQ33trTmNY5T8Boaom1i/1SHzdZd6LCtC0ULloUyG8+QCjZxpibZZSoQyZnu32XAuIGNc1i2idw8LvkPHCam5SK57LbgB0cEwg7Y0yUJrgT5HaV7+7LmVweS9Ub+45oIEUI3/osnlp0zbt9q/XpZ0+3mmxWDk6svMbqkfCdqCG3UHm8n9OPHAC62eFIzkpNjyXgy2XtraAOBDTxQKW1SJcuzdGF21EP/t3mi8dwMCO2A4mEVO4MNBLuMMJec+xNjVEapqOGiCCpOpBmSFEMZT5YZm+cQ3tsq5bu9ZCzadb/4VmryObAsGGW4SaYrKuf1Vc+u/8fPwFTJCZYTQpNDqt+p+jQ8Vgm1SaTgErOBjNw/V2v7+Fv8MPayr7VgRvTZKq0RbJwwtc5vfeUhizHoU4FFXJJH67Ung66HpD86Qn0RgF+BpF6zATM7bv8zz3SCgXFn3c6NbNTwr8kQHJTj1e2t5pycwk8eGi8A01c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(451199015)(83380400001)(86362001)(36756003)(31696002)(38100700002)(122000001)(38070700005)(31686004)(316002)(478600001)(54906003)(110136005)(2616005)(91956017)(4326008)(44832011)(5660300002)(6486002)(186003)(6506007)(2906002)(71200400001)(41300700001)(6512007)(8676002)(76116006)(64756008)(26005)(66476007)(66446008)(8936002)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YnhXSHlXbDV5VG5NeDh3MlRaQXZOSkQrNGpLd20zdzFRU2ZnZHhvU1lIR2Zo?=
 =?utf-8?B?azNNSllyUUtUN0Uvd0xOVVhZMGpmNVBjNUtLTVhwcFIrdTRmVis3ZkdIR2px?=
 =?utf-8?B?eTZqd0Rwcit1T01SaE9PNlRBS0pHT0lEZjFyVWdhRnhtazVzUnpVN08zMllh?=
 =?utf-8?B?dzlIaE56emdGZnRzVjVNVCtEOXJPWEkwQkpzekt0OHVBZnN6SmVYNkZUVmlT?=
 =?utf-8?B?cjY0TUdnNWNVNDM1WjZyZElhVWdqU3RlQ0tsUXBXVFZmVmdCcEtUZWNGbERo?=
 =?utf-8?B?RVhOeVlFb1N5UGNUdGl6SEF4dE02KzhsS2JKbENBeGdZZS84V3pKVDNHd0hZ?=
 =?utf-8?B?Ly9kY05mb0NRZnRHSkl4QVNmSHBDRGxpc1pwVlRNR2JNMU9za0MrSlBOOFF5?=
 =?utf-8?B?eWIxaEhON21nQTRMajI3VXlzM0t1bTZWeEJQbDlsVUpINlRJTnFuSnM3M0JY?=
 =?utf-8?B?SUR1UUt4bTVINFNrZlNYZ1VjSStaTmRpRTA1YUcwOUNCRnJHL0dhS0Y2Q0dw?=
 =?utf-8?B?MEFOUzNCN2RSalFyazdkSktYRUIzcis1dUFoYWlySkVJTHJyb2lwcVV2cWJR?=
 =?utf-8?B?RjRBcnBVTk1uK2VFaUtJSjZDRWV0SUZDNFgxN2I3RXlqREkvOUdVYmRBVGI1?=
 =?utf-8?B?d0dVYzliMVgvYnNaMnRsaHNLVFF0eEQ5UEI5UHBGSktMY002TXlXcTM1SXlD?=
 =?utf-8?B?emdCTDJoaFFneGdCSllqQVI0REJEb2ZEZG1nRkxjVHBSVENNSlkxVGtGSUVa?=
 =?utf-8?B?YndCNWJrWVRleVVyazZJSFd1NXJSbE1naXNNN1dxNVRmRG4rcktwNnJ6ZS80?=
 =?utf-8?B?c1AzOUxBTXM2anF2WnhKSkpCR1NnNjdjazIrbW5MRm14b1ZvSFBYOW1vL3B0?=
 =?utf-8?B?TnAzcklxRklVYXJlMkFhS3dPK0JKcEpZOUZmU1ZHdTZyS3dZaTV0MkJtQ21s?=
 =?utf-8?B?MTNvdGhtWUtwM2dXa3VvSVZPSzJJWklTLyt5N2R5dFpUZmxoN3cxeE1qRWxX?=
 =?utf-8?B?N0hxRk5KMHFOUE5GS1I2NXl2N3liQkcrTStzV3FhUVg4cWp3YkNldis2T0xn?=
 =?utf-8?B?V3lPU25NTG01YzdsS1krNXl5em1NRE1zd3dYclZCZ0w2WitMM3ZhRDRvVjE3?=
 =?utf-8?B?bGpYUmt0MzRoY2oyaUNCMitQUlgxVnZJUXJiSzB3WStpTHlzZDhrQjFrcGRT?=
 =?utf-8?B?eUN4TTZ2OWsvR0NpblJwYUp6OXN2aUJpM0JQaFFZV2lmaG5VaFJWREl5eXNW?=
 =?utf-8?B?aFMxNWloaCtRL2dCdC9uUlNJRnN6OHNBKzB5bTV1a005T3pJT3dVb1h2NUNQ?=
 =?utf-8?B?KzNQMHdpSlVscHZINFZXZkNqUXBBU1p5dVdQY3hHb2xiZkM3TnRXR3BnaDBG?=
 =?utf-8?B?Nk5aamNpM1Q0WWQ2WXFTSWU2MWpiOGtXMU1kYlppaFVqZ25Edytvb1VjcGVH?=
 =?utf-8?B?a2pPdktpMHlyVklCSWJkMTREeGpRRkhlcVJQc0FNalpQWFVRNDBJNHhOMWY5?=
 =?utf-8?B?WFB4YzR2VnNZOGovVnZDcXEvM2RYVmtLUWdZNzdjazJuTGlaTzFUUnczZUQ5?=
 =?utf-8?B?QUlYczFWWDNJVVNDOHd3aWhhVys3L0pmeEt3YjBseHZxc1ZtTnhha1lVQ1hF?=
 =?utf-8?B?ZTJwdDNBVDRYa21Xa0RZUTVLckR5KzVVODJlamRVQXcwcGJSbm90TzVzK285?=
 =?utf-8?B?aFd2My83TndlRmlhN054UE1uRjV2ZmduOFJEaXNoRFIwUWNLcjUvV0w1d1FJ?=
 =?utf-8?B?elVSbzNYV2xHL3M2cFdkU3haWWJWOEZnN3UzZVVnREYraURnRTNuamxxMHpJ?=
 =?utf-8?B?czlGRHhtZGdqOXNxZnRraUx2a1hXcHhVUHNjMTlvTm9OMVdyS25RQy9jdlFz?=
 =?utf-8?B?MU14eGlqTGp0Z0drT1Bwc3hFeXJoVnk5aDlzUkY2NWF2a1lGUlRUdXpEaDJK?=
 =?utf-8?B?UU1xaWFNS3dCQXlXY0tHb2N3N0pQVU9FNGJWU08yNmd3cTNIYUVQWVpXaXpu?=
 =?utf-8?B?NUJnOVp0NGNiMXBHbUl6bUhMeFEyR0VleDJGb29yYWM2bUExcTN4VXF4R3Yv?=
 =?utf-8?B?UHdjSTBuVlJnNFA5bWtFUEhNa2NIYUN6dVJtYStGNW1sSWhyNURWMGsvampu?=
 =?utf-8?B?dlJJbDc0Y2cyN2pTQzhCVGNZVm5GZzQxRmN6Z1Rrc0xDdFhxWWEwYmYrOGdE?=
 =?utf-8?Q?eDIhKcI9yBS9dOHd2ds+8Lw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <478987331F526743B19408E1E855265D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b7565f-8629-4f6f-08ad-08dabcbb6206
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 10:17:01.5659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxxcN+/U5Nv14JtUJJAtK5C7u1szf8e/PSVqP+aWV+e/Wdp0BjLcrXpDDSS4tWxsvFkj54b4vP3lUuJ1bbvO87PWujbwwATnW1AEcpQvn3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2006
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
V2l0aCB0aGUgdGVtcCBtbSBjb250ZXh0IHN1cHBvcnQsIHRoZXJlIGFyZSBDUFUgbG9jYWwgdmFy
aWFibGVzIHRvIGhvbGQNCj4gdGhlIHBhdGNoIGFkZHJlc3MgYW5kIHB0ZS4gVXNlIHRoZXNlIGlu
IHRoZSBub24tdGVtcCBtbSBwYXRoIGFzIHdlbGwNCj4gaW5zdGVhZCBvZiBhZGRpbmcgYSBsZXZl
bCBvZiBpbmRpcmVjdGlvbiB0aHJvdWdoIHRoZSB0ZXh0X3Bva2VfYXJlYQ0KPiB2bV9zdHJ1Y3Qg
YW5kIHBvaW50ZXIgY2hhc2luZyB0aGUgcHRlLg0KPiANCj4gQXMgYm90aCBwYXRocyB1c2UgdGhl
c2UgZmllbGRzIG5vdywgdGhlcmUgaXMgbm8gbmVlZCB0byBsZXQgdW5yZWZlcmVuY2VkDQo+IHZh
cmlhYmxlcyBiZSBkcm9wcGVkIGJ5IHRoZSBjb21waWxlciwgc28gaXQgaXMgY2xlYW5lciB0byBt
ZXJnZSB0aGVtIGludG8NCj4gYSBzaW5nbGUgY29udGV4dCBzdHJ1Y3QuIFRoaXMgaGFzIHRoZSBh
ZGRpdGlvbmFsIGJlbmVmaXQgb2YgcmVtb3ZpbmcgYQ0KPiByZWR1bmRhbnQgQ1BVIGxvY2FsIHBv
aW50ZXIsIGFzIG9ubHkgb25lIG9mIGNwdV9wYXRjaGluZ19tbSAvDQo+IHRleHRfcG9rZV9hcmVh
IGlzIGV2ZXIgdXNlZCwgd2hpbGUgcmVtYWluaW5nIHdlbGwtdHlwZWQuDQoNCkFub3RoZXIgYWR2
YW50YWdlIGlzIHRvIGdyb3VwIGFsbCBkYXRhIGZvciBhIGdpdmVuIENQVSBpbiB0aGUgc2FtZSAN
CmNhY2hlbGluZS4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlA
bGludXguaWJtLmNvbT4NCj4gLS0tDQo+IHY5OgkqIENvbnNvbGlkYXRlIHBhdGNoaW5nIGNvbnRl
eHQgaW50byBzaW5nbGUgc3RydWN0DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9saWIvY29kZS1w
YXRjaGluZy5jIHwgNTggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgYi9hcmNoL3Bvd2VycGMv
bGliL2NvZGUtcGF0Y2hpbmcuYw0KPiBpbmRleCAzZmU5OWQwMDg2ZmMuLmNlZmI5MzhmNzIxNyAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gQEAgLTQ4LDEwICs0OCwxNiBAQCBp
bnQgcmF3X3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4g
ICANCj4gICAjaWZkZWYgQ09ORklHX1NUUklDVF9LRVJORUxfUldYDQo+ICAgDQo+IC1zdGF0aWMg
REVGSU5FX1BFUl9DUFUoc3RydWN0IHZtX3N0cnVjdCAqLCB0ZXh0X3Bva2VfYXJlYSk7DQo+IC1z
dGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IG1tX3N0cnVjdCAqLCBjcHVfcGF0Y2hpbmdfbW0p
Ow0KPiAtc3RhdGljIERFRklORV9QRVJfQ1BVKHVuc2lnbmVkIGxvbmcsIGNwdV9wYXRjaGluZ19h
ZGRyKTsNCj4gLXN0YXRpYyBERUZJTkVfUEVSX0NQVShwdGVfdCAqLCBjcHVfcGF0Y2hpbmdfcHRl
KTsNCj4gK3N0cnVjdCBwYXRjaF9jb250ZXh0IHsNCj4gKwl1bmlvbiB7DQo+ICsJCXN0cnVjdCB2
bV9zdHJ1Y3QgKnRleHRfcG9rZV9hcmVhOw0KPiArCQlzdHJ1Y3QgbW1fc3RydWN0ICptbTsNCj4g
Kwl9Ow0KPiArCXVuc2lnbmVkIGxvbmcgYWRkcjsNCj4gKwlwdGVfdCAqIHB0ZTsNCj4gK307DQo+
ICsNCj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgcGF0Y2hfY29udGV4dCwgY3B1X3Bh
dGNoaW5nX2NvbnRleHQpOw0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgbWFwX3BhdGNoX2FyZWEodm9p
ZCAqYWRkciwgdW5zaWduZWQgbG9uZyB0ZXh0X3Bva2VfYWRkcik7DQo+ICAgc3RhdGljIHZvaWQg
dW5tYXBfcGF0Y2hfYXJlYSh1bnNpZ25lZCBsb25nIGFkZHIpOw0KPiBAQCAtMTE2LDE1ICsxMjIs
MTkgQEAgc3RhdGljIGludCB0ZXh0X2FyZWFfY3B1X3VwKHVuc2lnbmVkIGludCBjcHUpDQo+ICAg
DQo+ICAgCXVubWFwX3BhdGNoX2FyZWEoYWRkcik7DQo+ICAgDQo+IC0JdGhpc19jcHVfd3JpdGUo
dGV4dF9wb2tlX2FyZWEsIGFyZWEpOw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19j
b250ZXh0LnRleHRfcG9rZV9hcmVhLCBhcmVhKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0
Y2hpbmdfY29udGV4dC5hZGRyLCBhZGRyKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hp
bmdfY29udGV4dC5wdGUsIHZpcnRfdG9fa3B0ZShhZGRyKSk7DQo+ICAgDQo+ICAgCXJldHVybiAw
Ow0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfZG93bih1bnNpZ25l
ZCBpbnQgY3B1KQ0KPiAgIHsNCj4gLQlmcmVlX3ZtX2FyZWEodGhpc19jcHVfcmVhZCh0ZXh0X3Bv
a2VfYXJlYSkpOw0KPiAtCXRoaXNfY3B1X3dyaXRlKHRleHRfcG9rZV9hcmVhLCBOVUxMKTsNCj4g
KwlmcmVlX3ZtX2FyZWEodGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfY29udGV4dC50ZXh0X3Bv
a2VfYXJlYSkpOw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19jb250ZXh0LnRleHRf
cG9rZV9hcmVhLCBOVUxMKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfY29udGV4
dC5hZGRyLCAwKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfY29udGV4dC5wdGUs
IE5VTEwpOw0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+IEBAIC0xNzIsOSArMTgyLDkg
QEAgc3RhdGljIGludCB0ZXh0X2FyZWFfY3B1X3VwX21tKHVuc2lnbmVkIGludCBjcHUpDQo+ICAg
CWlmIChXQVJOX09OKCFwdGVwKSkNCj4gICAJCWdvdG8gZmFpbF9ub19wdGU7DQo+ICAgDQo+IC0J
dGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX21tLCBtbSk7DQo+IC0JdGhpc19jcHVfd3JpdGUo
Y3B1X3BhdGNoaW5nX2FkZHIsIGFkZHIpOw0KPiAtCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGlu
Z19wdGUsIHB0ZXApOw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19jb250ZXh0Lm1t
LCBtbSk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2NvbnRleHQuYWRkciwgYWRk
cik7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2NvbnRleHQucHRlLCBwdGVwKTsN
Cj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgDQo+IEBAIC0yMDIsOCArMjEyLDggQEAgc3RhdGlj
IGludCB0ZXh0X2FyZWFfY3B1X2Rvd25fbW0odW5zaWduZWQgaW50IGNwdSkNCj4gICAJcDRkX3Qg
KnA0ZHA7DQo+ICAgCXBnZF90ICpwZ2RwOw0KPiAgIA0KPiAtCW1tID0gdGhpc19jcHVfcmVhZChj
cHVfcGF0Y2hpbmdfbW0pOw0KPiAtCWFkZHIgPSB0aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19h
ZGRyKTsNCj4gKwltbSA9IHRoaXNfY3B1X3JlYWQoY3B1X3BhdGNoaW5nX2NvbnRleHQubW0pOw0K
PiArCWFkZHIgPSB0aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGluZ19jb250ZXh0LmFkZHIpOw0KPiAg
IA0KPiAgIAlwZ2RwID0gcGdkX29mZnNldChtbSwgYWRkcik7DQo+ICAgCXA0ZHAgPSBwNGRfb2Zm
c2V0KHBnZHAsIGFkZHIpOw0KPiBAQCAtMjIzLDkgKzIzMyw5IEBAIHN0YXRpYyBpbnQgdGV4dF9h
cmVhX2NwdV9kb3duX21tKHVuc2lnbmVkIGludCBjcHUpDQo+ICAgDQo+ICAgCW1tcHV0KG1tKTsN
Cj4gICANCj4gLQl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfbW0sIE5VTEwpOw0KPiAtCXRo
aXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19hZGRyLCAwKTsNCj4gLQl0aGlzX2NwdV93cml0ZShj
cHVfcGF0Y2hpbmdfcHRlLCBOVUxMKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdf
Y29udGV4dC5tbSwgTlVMTCk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2NvbnRl
eHQuYWRkciwgMCk7DQo+ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2NvbnRleHQucHRl
LCBOVUxMKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiBAQCAtMzE2LDkgKzMyNiw5
IEBAIHN0YXRpYyBpbnQgX19kb19wYXRjaF9pbnN0cnVjdGlvbl9tbSh1MzIgKmFkZHIsIHBwY19p
bnN0X3QgaW5zdHIpDQo+ICAgCXN0cnVjdCBtbV9zdHJ1Y3QgKnBhdGNoaW5nX21tOw0KPiAgIAlz
dHJ1Y3QgbW1fc3RydWN0ICpvcmlnX21tOw0KPiAgIA0KPiAtCXBhdGNoaW5nX21tID0gX190aGlz
X2NwdV9yZWFkKGNwdV9wYXRjaGluZ19tbSk7DQo+IC0JcHRlID0gX190aGlzX2NwdV9yZWFkKGNw
dV9wYXRjaGluZ19wdGUpOw0KPiAtCXRleHRfcG9rZV9hZGRyID0gX190aGlzX2NwdV9yZWFkKGNw
dV9wYXRjaGluZ19hZGRyKTsNCj4gKwlwYXRjaGluZ19tbSA9IF9fdGhpc19jcHVfcmVhZChjcHVf
cGF0Y2hpbmdfY29udGV4dC5tbSk7DQo+ICsJcHRlID0gX190aGlzX2NwdV9yZWFkKGNwdV9wYXRj
aGluZ19jb250ZXh0LnB0ZSk7DQo+ICsJdGV4dF9wb2tlX2FkZHIgPSBfX3RoaXNfY3B1X3JlYWQo
Y3B1X3BhdGNoaW5nX2NvbnRleHQuYWRkcik7DQo+ICAgCXBhdGNoX2FkZHIgPSAodTMyICopKHRl
eHRfcG9rZV9hZGRyICsgb2Zmc2V0X2luX3BhZ2UoYWRkcikpOw0KPiAgIA0KPiAgIAlpZiAodW5s
aWtlbHkoIXBhdGNoaW5nX21tKSkNCj4gQEAgLTM1NywxOSArMzY3LDE3IEBAIHN0YXRpYyBpbnQg
X19kb19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpDQo+ICAg
ew0KPiAgIAlpbnQgZXJyOw0KPiAgIAl1MzIgKnBhdGNoX2FkZHI7DQo+IC0Jc3RydWN0IHZtX3N0
cnVjdCAqYXJlYTsNCj4gICAJdW5zaWduZWQgbG9uZyB0ZXh0X3Bva2VfYWRkcjsNCj4gICAJcHRl
X3QgKnB0ZTsNCj4gICAJdW5zaWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIpOw0K
PiAgIA0KPiAtCWFyZWEgPSBfX3RoaXNfY3B1X3JlYWQodGV4dF9wb2tlX2FyZWEpOw0KPiAtCWlm
ICh1bmxpa2VseSghYXJlYSkpDQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiAtDQo+IC0JdGV4dF9w
b2tlX2FkZHIgPSAodW5zaWduZWQgbG9uZylhcmVhLT5hZGRyICYgUEFHRV9NQVNLOw0KPiArCXRl
eHRfcG9rZV9hZGRyID0gKHVuc2lnbmVkIGxvbmcpX190aGlzX2NwdV9yZWFkKGNwdV9wYXRjaGlu
Z19jb250ZXh0LmFkZHIpICYgUEFHRV9NQVNLOw0KPiAgIAlwYXRjaF9hZGRyID0gKHUzMiAqKSh0
ZXh0X3Bva2VfYWRkciArIG9mZnNldF9pbl9wYWdlKGFkZHIpKTsNCj4gICANCj4gLQlwdGUgPSB2
aXJ0X3RvX2twdGUodGV4dF9wb2tlX2FkZHIpOw0KPiArCWlmICh1bmxpa2VseSghdGV4dF9wb2tl
X2FkZHIpKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCXB0ZSA9IF9fdGhpc19jcHVf
cmVhZChjcHVfcGF0Y2hpbmdfY29udGV4dC5wdGUpOw0KPiAgIAlfX3NldF9wdGVfYXQoJmluaXRf
bW0sIHRleHRfcG9rZV9hZGRyLCBwdGUsIHBmbl9wdGUocGZuLCBQQUdFX0tFUk5FTCksIDApOw0K
PiAgIAkvKiBTZWUgcHRlc3luYyBjb21tZW50IGluIHJhZGl4X19zZXRfcHRlX2F0KCkgKi8NCj4g
ICAJaWYgKHJhZGl4X2VuYWJsZWQoKSk=
