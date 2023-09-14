Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA379FBCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 08:19:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O8zq6vsv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmRxX5cJMz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 16:19:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=O8zq6vsv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmRw95Yxfz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 16:18:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZdps0m79KSgXyPqXsESOR6Hnk0HSyWaucpYHrieYqUxZt2GItzb1TGq0CSmYRaRc7r7LQiClldUlxO7nZxY4PcbC5aY4963WtlrYuSsu+uFLzVycNDyE3gKKWnhjJTmalfb/2QXDxeBJ2r6Sh58utrhmnYGzK3gkEBWm7gSFGFzoBrqyVkgUIxyrdN2VGsZ716O9MjJcoID+gGXlD2azgA3cjHHFErOe6+U/H0YhSibP0NR0j28xnpFeoqxiomgDniq4cSygwxdPtzdbcnccIHR2PsUWEUQnqZ5XZExzTd9dlU8hPO3g70ZNZNwxIe0AyWEEqQ/iJAfEYVmQmqSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kcil+jk8a81cZaGRx+BwHj6w5J9VayYt2mywvvOFt7c=;
 b=TkQcq8iDcrwY7jQiFQkRDy03YBRvY+oDW6p67lQJT9odbx/Nm1LSX2jYcPnlza3OCsC/y+QWxNpHe+3j9fnNQsrIQ5tWVlE2eYS2MZNNDE+55mY0mldHdlLXgIFwUejvdOhT8wCCOacXJ2dzMPDVoFSIB1NRG9YtU+kUFmFj/AaigjEtJBTEvZW/qFYNF9KC6hlMjmlQnHLu2JQN7FTDa6T39jjrktZOUOz77TCUEYtlbW2m6jQihb1p30CnYZA1cBJibByrtoNWbfgaIcfeJKUFU2kOUdbO5uTk4CvPT1WAVzU8sgvvI3V0h0/WOCB2hddMHnPmLSun7dQUblc4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kcil+jk8a81cZaGRx+BwHj6w5J9VayYt2mywvvOFt7c=;
 b=O8zq6vsv4H7+TtvdlcSFmOjXMsrTlTTNXcm1/xdJ7QdlF/MNDgndwyE1vVPdKVXlm7U9CegmPSCsAQjBLqPKi6ofHvOG0f3Fw1K1xZPAcVXSYU5Lyrnla2sZPSzr4CivGy17h6ob+8PI2nhY1g33JJSwtNUOCQR8VsSvaXlZm1EIElenDLZATcvnDvmCiuGNIg9TMEf6O+bXVsBS1hdf7PEY6j3C9FYOI383t5Ajrv2qFzdy+FGsScFIjKf3Ya0Z7XPzHybrICeyp5mjaJ4A/qn6qS3+LvBmSg1EyvQ2iKrYOz+r3FUCU7dWYjbreDrLifqg53qgotQboBcvERmV6A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2406.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 06:18:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 06:18:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, "naveen.n.rao@linux.ibm.com"
	<naveen.n.rao@linux.ibm.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
	<daniel@iogearbox.net>
Subject: Re: [PATCH v4 8/8] bpf ppc32: Access only if addr is kernel address
Thread-Topic: [PATCH v4 8/8] bpf ppc32: Access only if addr is kernel address
Thread-Index: AQHXtSPwi5j5HKVh7Eekzw1VFtpsUrAePC0A
Date: Thu, 14 Sep 2023 06:18:09 +0000
Message-ID: <aa3db398-5d44-c68c-6f74-027e31521177@csgroup.eu>
References: <20210929111855.50254-1-hbathini@linux.ibm.com>
 <20210929111855.50254-9-hbathini@linux.ibm.com>
In-Reply-To: <20210929111855.50254-9-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2406:EE_
x-ms-office365-filtering-correlation-id: cc27458e-e9cb-43f3-6cad-08dbb4ea5dde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Jk5Kt6ZBKNEbqMUV4Z83krg64Z9iVeaMo06ZZff+dXf/6tFX/L+HErW0XWHeoM6fZo9NOKLHDTaDTQiNd6ufvwir4g6czcFskfhtdLKdr13fw9hcl4GoTE0CXzNk2YGCzE1T26jA07+lNoDhgRl3oXp60IkXbj8JCw7W5tAR+4y2bluqhyhzLTh0sAInsYuP0bPzzZQDgkpHvxm3fKL9kdKp9gRoOc6siXl0WMvu4J2o1Pvpf0ids3ZC3GSSxeFENrugpLwWVHnVzI1QEwceC2t23F8PO3n+xlgcAREub7DyKCb4Wc/B1IVLXNOXW3Qw2NFuodostbersIiGreW8TcLSWV8lEzIPzJ2HGnNto+6lMA4KuCfndvT+RkTuir0u7drQOprnISHBaev0tnRUbQx6xd5/6MHXn0xkewPqow/W0+hYvDrLFNBthgJCaklkzAs1v0BIQIjULfLeYS1MMMFApkUk4ZOkdKBm5Iy43NoO0TP49LS/9OWUd443z0oIBirscIrMU7yDij00QIxMpTZFXDBfPMgy5cqELXF7uNoIm4MAF0OwKU/cRMZYWZF3t4mT4IMxwBQZeDKxIZykT/bAuBB8M1WguNICVgbnedW2nnIqujk4ew8qfCrc9ntKFZ9YMsLKnwQr244F167/8YNeQR//FaHK9l5ZvSakaISzv4PoJalaIceq8e/dZ3Uq
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(366004)(136003)(1800799009)(451199024)(186009)(31696002)(86362001)(5660300002)(44832011)(8936002)(8676002)(4326008)(2906002)(7416002)(36756003)(6486002)(6506007)(6512007)(71200400001)(66574015)(2616005)(26005)(64756008)(38100700002)(38070700005)(478600001)(122000001)(83380400001)(31686004)(41300700001)(66476007)(76116006)(66946007)(66556008)(316002)(66446008)(54906003)(110136005)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ekJxL0VuMWREcFdNY2thb0ROc0taUERVNU0vbmtQODZwaEI1UEJOMlkwRUZv?=
 =?utf-8?B?Zm5FZlUxRGZ1VVY0Y3hwOTNCR2tZWG1IRjd6UWp3MjUrL21tL0M1K0lIWGhG?=
 =?utf-8?B?WFExVnpZRjUwYWVncUxrZ3MyUzBFNTM4WjlnT2xvTzFhOE1MR2JWWVlzQXJV?=
 =?utf-8?B?c2lwRmsxOWYwQlFiWmVBVlBXR3NSWGl2YTZLblN5NEhOT2hYQU5JckVBWlhV?=
 =?utf-8?B?b3h1RU9ZMm04eU96TzM1T1hqVWdzckRpRUU0V3IxYmJSQVZzMFNOQ1dQZmJ1?=
 =?utf-8?B?Y1lmRitHOUoxSC9qVVBNcTlJWGw3aHRDUEoyKzhRbTViRVpubDV6bnplNFpX?=
 =?utf-8?B?WlZPMHlYY1NlNndZKzR5QTJ0UWxxMnlscjJtNmV6Y2hvaUNLOEJ4M2R6QVpi?=
 =?utf-8?B?RDJMbGUrTXYyaXZBZHhyNndrazBybDQwcmFmVXNGNGRLb1k0U3VZLzV3UENN?=
 =?utf-8?B?bExUd2VCeG1RbHFObE05QUJ6UjhLS0NZYnJKOFM3d3FEYjRkMDRiQnVlZ0NO?=
 =?utf-8?B?QW13eFFuWnUzN3luc0Q3RlErSHJCZnA2Tm1hM1NSMGNJRWV1MGNIN2tVOGE4?=
 =?utf-8?B?SllxUmFZVCsrZExzVmcrcWNPWDlMckZhdE93T1Exd0JPeFhDenhCdGdRUWdt?=
 =?utf-8?B?RFFrTVJkMFo5c0xuNlU3TXlnMy9TNnl3WklPOEliZHNQMnB0MTRsNHlwUFBY?=
 =?utf-8?B?RG1DVmxNK1hYdFBwbFdHRldrTnVvM01GYysyNnZ5SCtoR2lwc1YraHNGSHht?=
 =?utf-8?B?RUoxOVNxcnZJZFJHK3REZ2hMQXRyUVlrVzIwVDBaamZjNHlVRm9xUXlvNnox?=
 =?utf-8?B?QXZ5b3RhcitETjlCbnFVa29EcTBzVDdYcDZzVDhIMktwcnAwNjcyNnJRZTdw?=
 =?utf-8?B?ZVhOSXUwRVJsUDRtUGN3ek01NmFreDI4ZmRZVVB3ZkwrQ2QrbzdxZVdkdVBn?=
 =?utf-8?B?ZFl1SlVMU2JzY0o3WW9OckdDWlBYTTJNcXhDQlRMUUYwd21ONXBiRy84MHE2?=
 =?utf-8?B?Yjl2cURGTlBBd1ordUJjMXpDaG5aQldjTU1FK3hSVVhLWkRySlgySFY2LzFj?=
 =?utf-8?B?YmRvWVZpelpyMUFxbWxsZjF3S3ZDb3pqQU5rL2k5b0JVbVFkVU9JbTFycjBp?=
 =?utf-8?B?L1lmWUNlbCs4L0wwMUlhUUM1eFRzbkVXNWEzSnVUYlorb2hrdVU4UW92MVdi?=
 =?utf-8?B?aURlcDZBUkszRlhzWTI4c3U3cENTQ2hRcGdNU3pFeWtNMTgvNlNEYjF4ajZ4?=
 =?utf-8?B?V1F6dGFPQTdWZzVmeDd2VjVBYmxjZmlKeWdIa0hFYjlLekprRlpMSTZxaStG?=
 =?utf-8?B?UlFWdkdVUW1NRm84VTFZcEVjQk1QSCtJWlBxMlg4NEE0UGw2Ti9GZDJCRjhL?=
 =?utf-8?B?aTRqNzQyaGdPTzJuTWMwUDU4N1MrU0JjS3lUOHdMbGdzTTlQWER2T2JHYmd5?=
 =?utf-8?B?bGxEUCtNQ0RuOWJDYlc0M0U1U0pNb3duMThUTGd6MkM0T0dxeXV2d0ZJVzZU?=
 =?utf-8?B?UFEwWGphRSs5SGMrL2Vma0Y5cVNveUd4OWlMTHR0dk14Y1VnRVFqN0Ztd3Mr?=
 =?utf-8?B?dkF2bzNoeW5vUWRDMVBZNWZLdVZFU05rQW5yNFhHY2tVcWJFS2N5aHFxc244?=
 =?utf-8?B?Sm5vRU9OL3R3RHUvaTl4WFJlMEE1M3NCSlBVeHBSakc0Z0VZc1JUV29zS2M2?=
 =?utf-8?B?aWdYeTVHNHE4U1M0bVdBeW5TcFlJemJOMlJaamtXaTdzRkZvMCs2UjVXYVpS?=
 =?utf-8?B?Q1hrRksvUTMxcXlmTGIxaldtNzd5RVZMeTNOMi96dkVTUUdjamFiNlhETnVS?=
 =?utf-8?B?ajE5ZExsbVBadXo5OGRuUEU1alpyL3RrY1Y4enNQNmNIdFFCUWdzb1dsYjh1?=
 =?utf-8?B?azZOdVpWa0VpckYxVFhRaWNYZ1I5MXpNN3UrSDh1a1ZTbHYvcDB5a1NXd0pP?=
 =?utf-8?B?T2kyTDNTSVQ1RlhPODlLSDc0WlhSNkYxTlZmWlV2RU1TWDlWWWVvRFRxaVFv?=
 =?utf-8?B?Z3k5c2FTR1Y5UDd0cEs3WC9Fd1ZiRGVxdWZqbVpPZ0JKTVBnay83Qkpucjly?=
 =?utf-8?B?QjAvdm13Q2hEcmtpTkZpT0tRMFRiNnVGTm0xMDFFL0xPeUVVb2dTVTZPd21t?=
 =?utf-8?B?clBFRjJVK1h6Q3VpcjZZUXM4cXdwZFVPc0VkVWdKYnlhd1JVNWhDekljd2Zh?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <725A770EB58AB14FB9462A655B706CB4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc27458e-e9cb-43f3-6cad-08dbb4ea5dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 06:18:09.3118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LJdbG2DXGqAopyd3wzDmQKdOYqrCPCYDOEXxAyPoQmDctakceszYdeVf/5BkMSVZnz8RE2d3sAansMewRqWY/zBJJiIGwDLIxd/De7CJC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2406
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
Cc: "songliubraving@fb.com" <songliubraving@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "paulus@samba.org" <paulus@samba.org>, "yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kafai@fb.com" <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDI5LzA5LzIwMjEgw6AgMTM6MTgsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0K
PiBXaXRoIEtVQVAgZW5hYmxlZCwgYW55IGtlcm5lbCBjb2RlIHdoaWNoIHdhbnRzIHRvIGFjY2Vz
cyB1c2Vyc3BhY2UNCj4gbmVlZHMgdG8gYmUgc3Vycm91bmRlZCBieSBkaXNhYmxlLWVuYWJsZSBL
VUFQLiBCdXQgdGhhdCBpcyBub3QNCj4gaGFwcGVuaW5nIGZvciBCUEZfUFJPQkVfTUVNIGxvYWQg
aW5zdHJ1Y3Rpb24uIFRob3VnaCBQUEMzMiBkb2VzIG5vdA0KPiBzdXBwb3J0IHJlYWQgcHJvdGVj
dGlvbiwgY29uc2lkZXJpbmcgdGhlIGZhY3QgdGhhdCBQVFJfVE9fQlRGX0lEDQo+ICh3aGljaCB1
c2VzIEJQRl9QUk9CRV9NRU0gbW9kZSkgY291bGQgZWl0aGVyIGJlIGEgdmFsaWQga2VybmVsIHBv
aW50ZXINCj4gb3IgTlVMTCBidXQgc2hvdWxkIG5ldmVyIGJlIGEgcG9pbnRlciB0byB1c2Vyc3Bh
Y2UgYWRkcmVzcywgZXhlY3V0ZQ0KPiBCUEZfUFJPQkVfTUVNIGxvYWQgb25seSBpZiBhZGRyIGlz
IGtlcm5lbCBhZGRyZXNzLCBvdGhlcndpc2Ugc2V0DQo+IGRzdF9yZWc9MCBhbmQgbW92ZSBvbi4N
Cg0KV2hpbGUgbG9va2luZyBhdCB0aGUgc2VyaWVzICJicGY6IHZlcmlmaWVyOiBzdG9wIGVtaXR0
aW5nIHpleHQgZm9yIExEWCIgDQpmcm9tIFB1cmFuamF5IEkgZ290IGEgcXVlc3Rpb24gb24gdGhp
cyBvbGQgY29tbWl0LCBzZWUgYmVsb3cuDQoNCj4gDQo+IFRoaXMgd2lsbCBjYXRjaCBOVUxMLCB2
YWxpZCBvciBpbnZhbGlkIHVzZXJzcGFjZSBwb2ludGVycy4gT25seSBiYWQNCj4ga2VybmVsIHBv
aW50ZXIgd2lsbCBiZSBoYW5kbGVkIGJ5IEJQRiBleGNlcHRpb24gdGFibGUuDQo+IA0KPiBbQWxl
eGVpIHN1Z2dlc3RlZCBmb3IgeDg2XQ0KPiBTdWdnZXN0ZWQtYnk6IEFsZXhlaSBTdGFyb3ZvaXRv
diA8YXN0QGtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEhhcmkgQmF0aGluaSA8aGJhdGhp
bmlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAqIEFkanVz
dGVkIHRoZSBlbWl0IGNvZGUgdG8gYXZvaWQgdXNpbmcgdGVtcG9yYXJ5IHJlZy4NCj4gDQo+IA0K
PiAgIGFyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wMzIuYyB8IDM0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wMzIuYyBiL2Fy
Y2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wMzIuYw0KPiBpbmRleCA2ZWUxM2EwOWM3MGQuLjJh
YzgxNTYzYzc4ZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAz
Mi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wMzIuYw0KPiBAQCAtODE4
LDYgKzgxOCw0MCBAQCBpbnQgYnBmX2ppdF9idWlsZF9ib2R5KHN0cnVjdCBicGZfcHJvZyAqZnAs
IHUzMiAqaW1hZ2UsIHN0cnVjdCBjb2RlZ2VuX2NvbnRleHQgKg0KPiAgIAkJY2FzZSBCUEZfTERY
IHwgQlBGX1BST0JFX01FTSB8IEJQRl9XOg0KPiAgIAkJY2FzZSBCUEZfTERYIHwgQlBGX01FTSB8
IEJQRl9EVzogLyogZHN0ID0gKih1NjQgKikodWwpIChzcmMgKyBvZmYpICovDQo+ICAgCQljYXNl
IEJQRl9MRFggfCBCUEZfUFJPQkVfTUVNIHwgQlBGX0RXOg0KPiArCQkJLyoNCj4gKwkJCSAqIEFz
IFBUUl9UT19CVEZfSUQgdGhhdCB1c2VzIEJQRl9QUk9CRV9NRU0gbW9kZSBjb3VsZCBlaXRoZXIg
YmUgYSB2YWxpZA0KPiArCQkJICoga2VybmVsIHBvaW50ZXIgb3IgTlVMTCBidXQgbm90IGEgdXNl
cnNwYWNlIGFkZHJlc3MsIGV4ZWN1dGUgQlBGX1BST0JFX01FTQ0KPiArCQkJICogbG9hZCBvbmx5
IGlmIGFkZHIgaXMga2VybmVsIGFkZHJlc3MgKHNlZSBpc19rZXJuZWxfYWRkcigpKSwgb3RoZXJ3
aXNlDQo+ICsJCQkgKiBzZXQgZHN0X3JlZz0wIGFuZCBtb3ZlIG9uLg0KPiArCQkJICovDQo+ICsJ
CQlpZiAoQlBGX01PREUoY29kZSkgPT0gQlBGX1BST0JFX01FTSkgew0KPiArCQkJCVBQQ19MSTMy
KF9SMCwgVEFTS19TSVpFIC0gb2ZmKTsNCj4gKwkJCQlFTUlUKFBQQ19SQVdfQ01QTFcoc3JjX3Jl
ZywgX1IwKSk7DQo+ICsJCQkJUFBDX0JDQyhDT05EX0dULCAoY3R4LT5pZHggKyA1KSAqIDQpOw0K
PiArCQkJCUVNSVQoUFBDX1JBV19MSShkc3RfcmVnLCAwKSk7DQo+ICsJCQkJLyoNCj4gKwkJCQkg
KiBGb3IgQlBGX0RXIGNhc2UsICJsaSByZWdfaCwwIiB3b3VsZCBiZSBuZWVkZWQgd2hlbg0KPiAr
CQkJCSAqICFmcC0+YXV4LT52ZXJpZmllcl96ZXh0LiBFbWl0IE5PUCBvdGhlcndpc2UuDQo+ICsJ
CQkJICoNCj4gKwkJCQkgKiBOb3RlIHRoYXQgImxpIHJlZ19oLDAiIGlzIGVtaXR0ZWQgZm9yIEJQ
Rl9CL0gvVyBjYXNlLA0KPiArCQkJCSAqIGlmIG5lY2Vzc2FyeS4gU28sIGp1bXAgdGhlcmUgaW5z
dGVkIG9mIGVtaXR0aW5nIGFuDQo+ICsJCQkJICogYWRkaXRpb25hbCAibGkgcmVnX2gsMCIgaW5z
dHJ1Y3Rpb24uDQo+ICsJCQkJICovDQo+ICsJCQkJaWYgKHNpemUgPT0gQlBGX0RXICYmICFmcC0+
YXV4LT52ZXJpZmllcl96ZXh0KQ0KPiArCQkJCQlFTUlUKFBQQ19SQVdfTEkoZHN0X3JlZ19oLCAw
KSk7DQo+ICsJCQkJZWxzZQ0KPiArCQkJCQlFTUlUKFBQQ19SQVdfTk9QKCkpOw0KDQpXaGlsZSBk
byB5b3UgbmVlZCBhIE5PUCBpbiB0aGUgZWxzZSBjYXNlID8gQ2FuJ3Qgd2UganVzdCBlbWl0IG5v
IA0KaW5zdHJ1Y3Rpb24gaW4gdGhhdCBjYXNlID8NCg0KDQo+ICsJCQkJLyoNCj4gKwkJCQkgKiBO
ZWVkIHRvIGp1bXAgdHdvIGluc3RydWN0aW9ucyBpbnN0ZWFkIG9mIG9uZSBmb3IgQlBGX0RXIGNh
c2UNCj4gKwkJCQkgKiBhcyB0aGVyZSBhcmUgdHdvIGxvYWQgaW5zdHJ1Y3Rpb25zIGZvciBkc3Rf
cmVnX2ggJiBkc3RfcmVnDQo+ICsJCQkJICogcmVzcGVjdGl2ZWx5Lg0KPiArCQkJCSAqLw0KPiAr
CQkJCWlmIChzaXplID09IEJQRl9EVykNCj4gKwkJCQkJUFBDX0pNUCgoY3R4LT5pZHggKyAzKSAq
IDQpOw0KPiArCQkJCWVsc2UNCj4gKwkJCQkJUFBDX0pNUCgoY3R4LT5pZHggKyAyKSAqIDQpOw0K
PiArCQkJfQ0KPiArDQo+ICAgCQkJc3dpdGNoIChzaXplKSB7DQo+ICAgCQkJY2FzZSBCUEZfQjoN
Cj4gICAJCQkJRU1JVChQUENfUkFXX0xCWihkc3RfcmVnLCBzcmNfcmVnLCBvZmYpKTsNCg==
