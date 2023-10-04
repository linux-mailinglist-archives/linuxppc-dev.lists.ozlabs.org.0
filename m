Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBF87B7801
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 08:40:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Xv/FnRjR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0lS606cRz3ckN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 17:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Xv/FnRjR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::627; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0lRB6dj4z3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 17:39:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lbahg0+mVLqehiXdPNiYPc20Xn2sTCnPk3H/KmyeVEsXag06fSmtxV/A3A/lt0nA+qU+NMmvs3RTftj6H7KZa4qol+pP/M8/UyPm44LekpNzaMjwFAh2RmB3xk3PhEN6JGFFWzWB5jKicEg1qgV9PH5x8qe9mOpzqglnG5XAw8MueqdiL/Oz3t5j5yMetGjY3KWpVZzktdDhBvhUpSafnK/C6B/ilyYwMUVVTPf40JYUkKUee4o6C+6PAnYu5jYaW9W6EoIWAaInViioPpKL4TLVm7HlQqgEF8GHNCkGnRmvEToOu/dPTs9uRk/ct14VoRznmQgGYU1+PlDJYW9aJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBA5N/KLXtcZRetFFFl/hcW3gEinwj48NhMx0hlQ2Os=;
 b=L/gzLpd/KxFnLB/BOsofBCt+yukDlrTOwfCfFa8fH9PCjFHL/r5G6VRx5LHm5dCtcrJztGhSrniIiz2YcvhJo9KIWcvqOCS4+C+bu/wyqVVdZYCFTssERwQNiVwewyVM36Gp8ybu0/G+wEqeetpLfC4OVZz9uuyLEFW89LWmigXNBlHp8k7ZCkM2Zyn391bAx+aMm0kz6Hg4uF7J9aBrAJ4BSvS5XbZcFmKKGzuXh+fX40erGA6rzwYgfW8GO+183WBVXEk3p4uKozk+wPnXtOT/ItBwyrWo0Cri/w7t1CMHZAW/LVbThtLiE5uk9EBPVLB+GPHNyn+96xt+ZUY3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBA5N/KLXtcZRetFFFl/hcW3gEinwj48NhMx0hlQ2Os=;
 b=Xv/FnRjR9Hwu704BTSEvGHrQN9hercyEATVvDmyMoJCk4T9UWIhjTIKmz5wto1WxTzC06jJGRAOwvdZ4B9YcCT1v5EsBGPVe6EMpP7nTI7bAYQuEAVaRK2lSG9M03acc2tlQ/Ieu9GvOUX9HcjskKGETxKHrvwuvi7BoRXM97jzFBOGjcjEELWyt0hCZS9I9Gku5ASesrl4vp9ZQC4q3sdZcgngP6NXFS6aVprmlScX9ysKevpORSDvv+q6Vc4av1X9uCVgssL/SNDx7EAJl4nvBLlgbJuvgxOkPkeZQN74wZIXYSM/1g5t1HrbVAlifJ+J1xv66Htv83qdrIFLd+w==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRZP264MB2252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 06:39:10 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d07a:a0e2:3c8b:d8b]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d07a:a0e2:3c8b:d8b%6]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 06:39:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <michael@ellerman.id.au>, Jonathan Corbet
	<corbet@lwn.net>, Costa Shulyupin <costa.shul@redhat.com>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Linas Vepstas <linasvepstas@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan
	<ajd@linux.ibm.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>, "Matthew R.
 Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Randy Dunlap
	<rdunlap@infradead.org>, Yanteng Si <siyanteng@loongson.cn>, Heiko Carstens
	<hca@linux.ibm.com>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
	<philmd@linaro.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>, Benjamin
 Gray <bgray@linux.ibm.com>, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, Segher Boessenkool
	<segher@kernel.crashing.org>, Rohan McLure <rmclure@linux.ibm.com>, Josh
 Poimboeuf <jpoimboe@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.vnet.ibm.com>, Sathvika Vasireddy <sv@linux.ibm.com>,
	Laurent Dufour <laurent.dufour@fr.ibm.com>, Nathan Lynch
	<nathanl@linux.ibm.com>, Brian King <brking@linux.vnet.ibm.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Al Viro <viro@zeniv.linux.org.uk>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>
Subject: Re: [PATCH] docs: move powerpc under arch
Thread-Topic: [PATCH] docs: move powerpc under arch
Thread-Index: AQHZ2D7Ql8DAv3ahvkWBErtgsZ55Y7A4dnQAgADYUQCAABuvgA==
Date: Wed, 4 Oct 2023 06:39:10 +0000
Message-ID: <5df60cbb-6034-9703-e9c7-33e729dd3d70@csgroup.eu>
References: <169052340516.4355.10339828466636149348@legolas.ozlabs.org>
 <20230826165737.2101199-1-costa.shul@redhat.com>
 <87cyxvelnn.fsf@meer.lwn.net>
 <46705070-17B2-4BDA-9524-1BB2F7BDBACA@ellerman.id.au>
In-Reply-To: <46705070-17B2-4BDA-9524-1BB2F7BDBACA@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|MRZP264MB2252:EE_
x-ms-office365-filtering-correlation-id: 65bcac37-3dd3-4394-a4b9-08dbc4a49de6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oMedfi1Kzt2jSqakwaJtSmcQMEcX/MBFytLh5ioSBX87iAGzBvk/LBOZ2goP1yOJEk4OJjjP5nHx9eNY8zFUArS/j/OxZ9LKjGUGUv0zr9BJJdHScxdsjoVYku0CZPyhD/Oq/yVp+8rXV/w/iXj6bTQ73NmxWTeOgrOWLEdGGE+Cz8CGSz/bI0TCrVu8dI57pADEhF4no6n0Gqz3aHMHe2gwi4vCQjmT4Ww3/nsA0h+FmGPUltrWhKvQsc4nuNuU+xrOVKBYq3/88GJRLK7mZ7OYISng1eAoAXnmAFLS1pAKqrdyMSIaklT46qb396SF8RarxnekNiK5/yWiudMptqDzBHfiv2StPhMvYGRqLOIfztcWp6SKbkQ6k3m3h1rvT8VFXxkvvXTFZp/LrKOgxBP0qGr9x3XWq4+W87cCgfY8AO/+/ZjDCvOK5PaAPxEOc9buidcLT+tps8MURLrbLD5nQOCq5o22uzpirTh17OUVmxFCHSAYh+M304I9f+ll2stbDonzALbk486LyMYt5fE1yuJ3HIWHKGaa/7GqlijvvNpvqGRzyKhJsfja1sI7/IlcG7PsXBw+Iik1IJT5P4538VHndlcUpdr+lGGUzfs6M6dDibJmhhsv02KoPEL5TX8U5lPHw43bPLPa3jG2t1qeAtTbAhT5a8rBymYI1UA8nzFeY5VqvGcDvf7paIuf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(44832011)(91956017)(76116006)(110136005)(41300700001)(66946007)(66476007)(66556008)(316002)(66446008)(64756008)(38070700005)(38100700002)(478600001)(6486002)(966005)(2906002)(31696002)(86362001)(7416002)(5660300002)(8936002)(8676002)(7406005)(83380400001)(36756003)(921005)(122000001)(6512007)(6506007)(71200400001)(2616005)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NWFtVlVrNFBQL21iNEk0dXZaUXJmbDZUNk96RW00L1VkSnlVa1l2WHowMTVF?=
 =?utf-8?B?M3BkajFsT1F1cVhnT2h3a0lWYnloQjBFZzdKcVlua3JGbTBmVUM4WEJwQml6?=
 =?utf-8?B?b0tOV2dXMjhJRFgwMUcySlplTit5UWhOZE9veGNMc1d1VmNMaWl1ZkRYbXNI?=
 =?utf-8?B?YTRLZzhmTDQ0YUJSc091bXAyakRqc21WKy9PS1RlMkZYOEVkSkVxSGFQTko3?=
 =?utf-8?B?Vmt4ZzduR0x6am1IRDdUUlBmZm8zUGdaZ1RkYlVQTlM1L3Y5dWk1a3FIWmFI?=
 =?utf-8?B?eFZ0UGtuWTBUaXVCajE1dmM3OWRIUTJGNUI3VUdTUENEUXZTYWZkRUs3TnA2?=
 =?utf-8?B?WTYvTitpdkdodWJEM1FzLzR5TWZSVGpDWFhTdTBDNTFHclhmSHY0SVUvSFlz?=
 =?utf-8?B?V0xINnpQVDhxN0cyNnJXNXBnS2tVcW9lZWkzcGg5bEZUSUx4M0doWFJZeHhL?=
 =?utf-8?B?c2IzRjdiVTJ0ckkyblp2RzJIQ2pqckhNd2t5RjE3ZDlYUVlvWlJkcXFNMnQz?=
 =?utf-8?B?Q1pKOVRPUDVzK0ljWjlBMkgzbEpOcjJ2eEJUNzlWK0phcnBncUtrYUJDalRt?=
 =?utf-8?B?SXd2VE1iR2dqWXM2U0o0cmVCZE11enljYVdOSld1c1pCWkZWTkxqc2I4R0lS?=
 =?utf-8?B?ck9la3Q5VlR3Rmxyang5eTNDNEUrVDFSaW1SOEJ3bzFOSkI2cDRzb0RyZDBF?=
 =?utf-8?B?cEhUWUJKeVo2RzRpZkhhYVIzZmNtM01nK1NGNCtYdnEwWFVlRU00Z01KWmh3?=
 =?utf-8?B?bFdsVFhsZS9ERm95QTJEbDA1d250SDJaWUp4R09NQ3VUSDZpKzUvUEV3V2NJ?=
 =?utf-8?B?dksrNjNncXNrbElIbDFuUzVEOWI1NTBseTlieWo2VzdkZzFxTzRuMTBRVmpk?=
 =?utf-8?B?RjZaQmg1WUlGKy9ramhDOWNwRW5HVHJ1WldQemx6TWhraWFxZ0x1QkZHL1Z0?=
 =?utf-8?B?TDRIdytTUkI4SC9WdjdsWDBIdGV1dExWRWdJaWEyTDlqRTJGazI3eHJQSWFH?=
 =?utf-8?B?c2JkNjBNek13RmFmNEF1KzZmWmh5S3JUQlpTK0dscHZwTEUwMTFkM0N2TEJE?=
 =?utf-8?B?QWFBQ3BoWGw0YjYvdnFYalJacklMNHp5ZHZtR0o4eklVS0lpZmk0TjVIVkVK?=
 =?utf-8?B?eGh1YkNla0VYWlNYQXBSY09wTno4WktRRThqUUY1U1FNZmEwZUVBRys3M2dZ?=
 =?utf-8?B?QzJZNy9GMFN3dnZMb2RlUDc1K2xZREl2eUN4QjlpZVQ2c3RtWXY2MytXNGRS?=
 =?utf-8?B?WkJvd1pZYk1zc2JPRTV2ZTZldWs1UkFVNWh3dHQ3RkQwUStSbkpNSWxlYWZx?=
 =?utf-8?B?dE9ySlMrSmlIRkUzRmJ0WTkxdnhtb3Y4VXB2MGF4RThKY3ZqajNJaEJrb1lE?=
 =?utf-8?B?MjJEbEhKcWpqMzRGZmtnNUFLdWc4K1d4a21pSzdkcFk3QWR6L2JjSTFOTzhC?=
 =?utf-8?B?dXg2dnYvMWgwdmpZdVI3TmxjK0VKbkh1K0N4Y1paYXVtUUhQZWF2bGlvQTNH?=
 =?utf-8?B?b1B1OHlibDlzeHZMS0ZaMVlpMVFISE10VVduYksvYWVLdDZzSGlTRmtXS3JK?=
 =?utf-8?B?WVpyT2lBOU51OGxIR2NYZk5jR0hqaGZwMEVpaW5sRlZFcXU3clFyRzNjRVln?=
 =?utf-8?B?KzJjZG5VNUdCVjZXM3k5UGVCcS9SQXdTTGVZbGVLdGJYcDQxMXQxbnRCSXRU?=
 =?utf-8?B?Vkd6aXFoSThUMlJXQmZveWhvMjhBd2Q1K0VBT0tjSkJNcFdwZzVFdEdQSVh3?=
 =?utf-8?B?SGpSMDRSWTJCRlB0N0JhZDRnRUo4b2JIdE9NczBCZE8zK3c1ZlFFMEVudWh1?=
 =?utf-8?B?Yy83Y0RjWVNoTlpVQk0zMU1Bbm5nWllNLzkwMk1yeitTaysvZXE1Y2t5YzlN?=
 =?utf-8?B?bnBJSmVIME1VdGo1NDcvcEQrZC9IcXNMb3V5ZHd1TDBkdUdneUR2KzdDWFRL?=
 =?utf-8?B?TUgrVjQ5bjBWR1VZTHV1MU1xZEQwT2N0Y1lTNURnV205VlVsK1VOVTE0cWRw?=
 =?utf-8?B?TElOcUxoYmlzUFVsWHVsNFVNMnR5ZHNnQm9ZQ0FVKzdGQmZ5SVVsNXNjRHUr?=
 =?utf-8?B?WXphVFNXSE14eHNIQUNXY2ZERUFVMDBZKzNRL0ZGZUY3cXQrSmpGVGdwWW4y?=
 =?utf-8?B?aGI3ZjNndWRWNFNiVGM2UEorUlNmY1JrVEZON3VRRXpKNjdVdklOQVFjQVdh?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AFD66C789A22A45B7D5899B94D8808C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65bcac37-3dd3-4394-a4b9-08dbc4a49de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 06:39:10.5633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wn6ScOk2DBWo8EQeMGxX2eQVXWplNZ9LRllRNYj/Fe517oprUtG/hdA4ZHSE5XCWQdxS7kBMNvaf/S8qM+0BUPWMHYPLklzsfx1Kb392dUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2252
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEwLzIwMjMgw6AgMDc6MDAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBPbiBPY3RvYmVyIDQsIDIwMjMgMzowNTo0OCBBTSBHTVQrMTE6MDAsIEpvbmF0
aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+IHdyb3RlOg0KPj4gQ29zdGEgU2h1bHl1cGluIDxj
b3N0YS5zaHVsQHJlZGhhdC5jb20+IHdyaXRlczoNCj4+DQo+Pj4gYW5kIGZpeCBhbGwgaW4tdHJl
ZSByZWZlcmVuY2VzLg0KPj4+DQo+Pj4gQXJjaGl0ZWN0dXJlLXNwZWNpZmljIGRvY3VtZW50YXRp
b24gaXMgYmVpbmcgbW92ZWQgaW50byBEb2N1bWVudGF0aW9uL2FyY2gvDQo+Pj4gYXMgYSB3YXkg
b2YgY2xlYW5pbmcgdXAgdGhlIHRvcC1sZXZlbCBkb2N1bWVudGF0aW9uIGRpcmVjdG9yeSBhbmQg
bWFraW5nDQo+Pj4gdGhlIGRvY3MgaGllcmFyY2h5IG1vcmUgY2xvc2VseSBtYXRjaCB0aGUgc291
cmNlIGhpZXJhcmNoeS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENvc3RhIFNodWx5dXBpbiA8
Y29zdGEuc2h1bEByZWRoYXQuY29tPg0KPj4NCj4+IFNvIHRoaXMgcGF0Y2ggYXBwZWFycyB0byBo
YXZlIG5vdCBiZWVuIHBpY2tlZCB1cCwgYW5kIHRvIGhhdmUgcmVjZWl2ZWQNCj4+IG5vIGNvbW1l
bnRzLiAgSSdsbCBoYXBwaWx5IGNhcnJ5IGl0IGluIGRvY3MtbmV4dCwgYnV0IGl0IHdvdWxkIGJl
IG5pY2UNCj4+IHRvIGhhdmUgYW4gYWNrIGZyb20gdGhlIHBvd2VycGMgZm9sa3MuLi4/DQo+IA0K
PiBJIGFja2VkIGl0IGEgZmV3IG1vbnRocyBiYWNrLCBhbmQgc2FpZCBJIGFzc3VtZWQgeW91IHdl
cmUgbWVyZ2luZyBpdDoNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4cHBjLWRl
di84N2JrZndlbTkzLmZzZkBtYWlsLmxob3RzZS8NCg0KU2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zZXJpZXM9JnN1Ym1pdHRlcj04
NjM3OCZzdGF0ZT0qJnE9JmFyY2hpdmU9JmRlbGVnYXRlPQ0KDQpMb29rcyBsaWtlIGEgbmV3IHZl
cnNpb24gKHdpdGggZXhhY3Qgc2FtZSB0aXRsZSkgd2FzIHNlbnQgaW4gQXVndXN0IGFuZCANCnRo
YXQgdmVyc2lvbiBkaWRuJ3QgaW5jbHVkZSB0aGUgYWNrIHlvdSBzZW50IGluIEp1bHkgb24gdmVy
c2lvbiAxLg0KDQo+IA0KPiBJIGRvbid0IG1pbmQgd2hvIG1lcmdlcyBpdCwgSSBmaWd1cmVkIHlv
dSBtZXJnaW5nIGl0IHdvdWxkIGdlbmVyYXRlIGZld2VyIGNvbmZsaWN0cywgYnV0IEknbSBoYXBw
eSB0byB0YWtlIGl0IGlmIHlvdSB0aGluayB0aGF0IHdvdWxkIGJlIGJldHRlci4NCj4gDQo+IEFu
eXdheSBoZXJlJ3MgYW5vdGhlcjoNCj4gDQo+IEFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQ0KPiANCg==
