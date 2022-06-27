Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2F55B7C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWc8Q31n7z3cCk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:43:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VceQwvtL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.57; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VceQwvtL;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90057.outbound.protection.outlook.com [40.107.9.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWc7b4MXTz2xKq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:42:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c58tIQAKIm74DB6nkQzOu9dZ+MPpoU2Sy9MGrPcZvGYuVhwUwKL0I9ZuBU1B7Tk/i163GVx257ybl8/mhUR+geuKblYi2oJF5xNxyDH7tP3+SK9GHixxkK5QSjpbdj88XSHEvvVQiJxDCiQIMRrSKm7mUqCXB1Fgm0O6pfkFco3rrAvUXJUoidKPKpSoRYGhOLbn7+h6PH0+uRl87UDZqg7DZfoGjXb9b+eBjVUG69DhttKIEmzOL6ibgVmltIIhV+BMM7RWytd5bJjGIK9lo9GGU18erw1Ko8ai0S+aoErT89xsaSziZOdzcs8sVvhw6vGuZcqow4dPj/8hz1fmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwMyGuV4JwPlI5MhdjaUIVud4L9ZU7VKfAuNxOQtp1M=;
 b=U4Q8Vt52OzG24v5uIrtcstVgdWVfrhf3+xv4zp/yoyZYzgGPVNG2+SPiobnvXKEourl9bP8/qun3VCB5QEtDTThewTG6Z2xximCfixhFZK/CyfxS1w50SXiTpZmsp5QsfPu+CxmvpQKBVjmB+pGfEnMJfs3nY2I5EkXSn8XzmR1DAwwi54tcz8vuA4c4JY+xC6BQH11Rw+iZFymsJFPAUGS6KCqof+zbhqcv2frJImCIhcA6gT+dgs7vqnMmPqqbxq8JSrglUrEigOxBfHg0/hyETIAg6/tCsgg973o35guKiXWmodFJllwTFKSEMP1mQyLQlW8W/yAuiOd+lprpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwMyGuV4JwPlI5MhdjaUIVud4L9ZU7VKfAuNxOQtp1M=;
 b=VceQwvtLebW8QnfqHfPTSLjOE/uvyoCfX3ldr9z/c36cLUjLl2TxSrOkNGYyzExbs8Wm+gsOKtVgSo9gZrg0KRT/LE5R4l8UwZRLcQL4ZIeIR7rwP5F3JfsUBFgGQb2TwTHK/j4eQsFFCIl+g7m07vtU3nZIV+6UIc7Yog3IJp6ll6sUsHvEatkJebdGTIIzwrc+V4UFf7+u+N2Mq1axH6eHEisPvYwdUkoraz/QVAfnLO7eVOkhbI1AEub7fSN7pWG1VMX0F5dftexmeromS8cSp7nhMiScTgZCFL/nfgW4kFJ5aB5FJmttECq+APD688BlWwSQBVggWe6sTQQVMw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 05:42:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:42:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
Thread-Topic: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
Thread-Index: AQHYhvzuJLbBXEz5XEakZ/byXjWT7K1iw1OA
Date: Mon, 27 Jun 2022 05:42:13 +0000
Message-ID: <e69ac23f-5847-2acc-418e-5bd93864ed54@csgroup.eu>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
 <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2dbc75a-f08a-45bf-aad2-08da57ffc9bc
x-ms-traffictypediagnostic: PAZP264MB2736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /hnPreAHNJyJK82RmNYdISX0BhgY8YvMGjxnqTHEjxiRsTYhvCbbMZcVKxqm+jXhBlzGQoxyY/wQ6ysvHUxmgImcfvy9n2BlFap3TOreR4BPawgAnSoYqsxth5YUd7rCvYEDuRShQ1HQOFuhXnXOTV20v3PRa2nWS+m9u5BpBRV96BK+eOnwNNYHgzP7vYm2QachAQzvtaWp0h44c5dj/fqhx8wXAZ0rGXdStNjm8XOKi0fsREHQ07/+GDgBpG0ixKd2idLH2V9uNkeSUa/1EzABpRPAO/ME+wFhv0igRvbgdIz3uqL4RqeaKJJlCn5oYy+ZUOGsJZAAT+gYY3A8U3AiWXnjfNl+LyHulxMtHWmMmbJ+W/PfGg+DOVAAvybGvlwQkUcxWvXBcZ0JS8+OceIMRzuWnY2jMH8GtSuMZO/k/7Y9Xq1ZjKM7l1MYx7j0Luuz0+yuEj+T3TnI6iqv5zKS5pKvQX+9GqCXWVWZzOSD6NxKafQqq756YEv97AsfqzgsKq7jbp1vEsNqYsUcxnJpgxJiqiCtzZ6AzWB04LomF0rUDM17ldAb0h8EFyWJBkE/lICGUhk0gSKEqc/1/kaMGW1hnCvEi8UxtHlwRNB2OkoombB8BD7/9HL47OopcKGgvrMbcM/+i6iEZZvPT1kTc7Ek9QQuCXnsTbEgyOZKDDi0enX9RMHcfMf2uU0UxLmD5OLL+BRxG3BSnHsXSV+1hDcNISuawTaIJiw5JqDCpPaW3UelnV+S+KiqFiXqccww9tyFLkTj7Ja1/9wekGIr3uWAj9XGjay+LGOtvVGYDHnkmvC+uOKv+2ogz7WM/zcsHRg6oP4+PiRFz+UZnzZfbee63Y4uqwbatk/gMvY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(366004)(376002)(396003)(346002)(15650500001)(2906002)(186003)(6506007)(110136005)(36756003)(122000001)(316002)(41300700001)(86362001)(38070700005)(31696002)(31686004)(54906003)(38100700002)(83380400001)(6512007)(5660300002)(66476007)(2616005)(8676002)(4326008)(91956017)(44832011)(71200400001)(26005)(66574015)(478600001)(66556008)(66446008)(64756008)(76116006)(66946007)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b2dscDU1QVh6aDBPVUtSbnJJS20raW44WFpzaXltQk9mL1Z3K0xEc0tjdkc5?=
 =?utf-8?B?eWNqK2V3aEN2dVY2YThPc3ZvQzZkdjJnTjR3dnVickhVQllYRlluVmlUTjQ2?=
 =?utf-8?B?NTkzYkF0bnZ6YVBxNW9WcW5keXd3aDFzRmJ6VVdwNU14cGc2VVNFZ3NOdkMz?=
 =?utf-8?B?ZUdwQkgwNVNGckloY25xMHFidDg3NnNqVklLbWRtU01tZU02aE1OY2FDSHdU?=
 =?utf-8?B?Q0paN2VFTDFQL1g1bTdDRGpEVEhCM09SVGUxZk4relh6RThkTCszYWt6YkY0?=
 =?utf-8?B?cDNFWUp0RDZsbkZ3RVFWZlNGblVUVm1aNWJXNVJhSUIzSUtML0c1T2FMTUhX?=
 =?utf-8?B?VlRVYzM1RmFibmYwNVJpQ2VJQXA0WVVIa0xaOW9tc2RDRldoa0RSZTVIVmk3?=
 =?utf-8?B?OGpUelFZdnpESSsxR2l5Q0E3YnFkQWxwamM5NlFiZis5TUJNTVQ3TzVKWGpw?=
 =?utf-8?B?VWdDVGxtOU54QVZFNkdrUDlZcFB1TGE5K3oybFFxZHNTclE3L0d5Yi91Um5P?=
 =?utf-8?B?a1UycjZwY1l3cXJIdU5Id3U3ZmtXUmR4UHRydk9XTnBBdHo5bkEzY0VMNzFv?=
 =?utf-8?B?T3FURzNnTjZLYjBPK2JVcnEzUmVLUytFeWlOdDQwWWh1ZkxiOW5mVk9OeXRP?=
 =?utf-8?B?M3p0THpweXU0bGVQQ0NYZGs3Z1FKOVV4Vm5HaWtyTVo5TS90MHZncUdhc29r?=
 =?utf-8?B?WHF2YWhqejdrUlN4Ry8zejdwUERMSUlraHZxSUFhdmJyZmFWTFJUS0loMXFG?=
 =?utf-8?B?T200STB4Q2U4QVQvWFEweXNEb0tYYlJwaUpkWThjRmpoV0wwR2VRb2VPVTho?=
 =?utf-8?B?VU51TmV4YzhnTk5hRlBlbWFEZzR5T1I2SUpZTFk2Y2dWUU1reGdZNlc4SUtJ?=
 =?utf-8?B?OVdJWmZFbkdkNXlZTHZTTk83Zm5WUFluaXh3QWNtUXZWSS9tRlE1ZnZWUmRR?=
 =?utf-8?B?aVNoS3doNkl4U2Exbm4zQ2hyTXJGNEhoTEg2VXhwZndQUFZaNW9zbW9mbkpF?=
 =?utf-8?B?eDQwdWdmb1lyYUY4Mm5TU3ZCaWRDR05rdGxvWjlIVUZHK096b1lJaUw3ekQy?=
 =?utf-8?B?S2NLV0RSMEJZemowWGg2cEQ5UE5yRXZ6SmRNQkxRZnNqNXNMK1ZJTG52YW5C?=
 =?utf-8?B?T2VUQmRsSWJ2TVB1Tkw0UEdEemk0VzQ2OFJnU0NPWGZhQk9kMTJ0MTFYSlpT?=
 =?utf-8?B?RUt2a21oWnBiRUdacDh5dXdqNWVuK2JTNUpjTEVEc1YzbVBoQjdWc3ZCek8y?=
 =?utf-8?B?R05xTTVHVzVMSTNWaWlGcmxuZlpWbWhXQmJiS1dnOFFDSmNKc2gzaDFNWHRx?=
 =?utf-8?B?dGRvb3NRMWR4bDZham5URERzMzJrQU1hOUJ5ZHJuelVCbEU4WWFUMXhVUHhI?=
 =?utf-8?B?bDFTYUx5SjZmOXBmcXhXTksrUlFwMFV6RkhsbENOUVRCRjM3ZGJEbUdLMHQy?=
 =?utf-8?B?bVRwbGovNGZwUmhpYjNMcWVjeGI3TFVsV25mdDByU0w5Q3l1OGZ5OUFoNTl4?=
 =?utf-8?B?c2czYjhHVDdEUlkxcmRqcTROSkVsblFhSUtJWFpWQXBHOXFUR201ZDRwd2hn?=
 =?utf-8?B?ZWRhSlozR1dsL3l5eDg1U2pkeDR5Z1JHV2dmdUFLc1ZGUHhjNUwwcG9mcG1I?=
 =?utf-8?B?VXJSOVpYUXZJL3Z3VWlBeG10cUZGcmMvczBPaFNHSlVrOGdpKzhLNWVsaytZ?=
 =?utf-8?B?RTJrcnYzK2ZVUHZGQkJCZ2RCU3BuZVFUb3lXSVF0TmRvdmZMa2srZUxPelM3?=
 =?utf-8?B?Ryt6aUVVaDlGbDhWU1FiU1Q2eFl2SklQd3JQUnBQMUgxa2Jadm1idGhDTERi?=
 =?utf-8?B?Njh5cVpvdVFQQTJrYjkyTzkyenNCOHFhaHhsalQremltekpWQVZBM3RVWXBr?=
 =?utf-8?B?Zm5kU2hTbFZNU1Q3ZTBkeTBud1RkL05qYlhhenJUNnhsdkhSRG9lVlFkTmNR?=
 =?utf-8?B?VjFiSXNQUjhlRHRtSVdWNnFJQytvdm1wY2w2bkdNK0hSaExCaUpiOS9GVGNt?=
 =?utf-8?B?VnkzRTdkZ2Z3NzBRckhIREp5dzhpQ3Iwb2dLdWg5WE5Lbm42NHVXNFIzb1g3?=
 =?utf-8?B?SVFhS0w4T3VoMnNFTVNCTW9SQ01vcDFzd3V3Q0lPQUdBY01oNFArUURpcXJ0?=
 =?utf-8?B?SnA4b0swMFFndGUrSFZSMm0rWnRNdVRHMVJORENTZTRLOW1PQldZT2crZ1Ns?=
 =?utf-8?Q?o/bzozrCySTEC+EitlKn0Nc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <760B47084072C84391916E614B995C5D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dbc75a-f08a-45bf-aad2-08da57ffc9bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:42:13.8583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCbgXnr0qEeJpGi6i2F1O+2e93adr1I+x+hqT1mZbqRkfeBBgD0abuc9TpQo8sgmxQKH8GF4mAHOSiX2qniPR3WOlEG3OCUiIE2QuYYCqEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2736
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, Michal Hocko <mhocko@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA2LzIwMjIgw6AgMTQ6MjksIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gSW5zdGVhZCBvZiBoaWdoX21lbW9yeSB1c2UgVk1BTExPQ19TVEFSVCB0byB2YWxpZGF0ZSB0
aGF0IHRoZSBhZGRyZXNzIGlzDQo+IG5vdCBpbiB0aGUgdm1hbGxvYyByYW5nZS4NCj4gDQo+IENj
OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+DQo+IENjOiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IFNpZ25lZC1vZmYtYnk6
IEFuZWVzaCBLdW1hciBLLlYgPGFuZWVzaC5rdW1hckBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
cGFnZS5oDQo+IGluZGV4IGU1Zjc1YzcwZWRhOC4uMjU2Y2FkNjllNDJlIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9wYWdlLmgNCj4gQEAgLTEzNCw3ICsxMzQsNyBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgcGZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgcGZuKQ0KPiAgIA0KPiAgICNkZWZpbmUgdmlydF9h
ZGRyX3ZhbGlkKHZhZGRyKQkoewkJCQkJXA0KPiAgIAl1bnNpZ25lZCBsb25nIF9hZGRyID0gKHVu
c2lnbmVkIGxvbmcpdmFkZHI7CQkJXA0KPiAtCV9hZGRyID49IFBBR0VfT0ZGU0VUICYmIF9hZGRy
IDwgKHVuc2lnbmVkIGxvbmcpaGlnaF9tZW1vcnkgJiYJXA0KPiArCV9hZGRyID49IFBBR0VfT0ZG
U0VUICYmIF9hZGRyIDwgKHVuc2lnbmVkIGxvbmcpVk1BTExPQ19TVEFSVCAmJglcDQo+ICAgCXBm
bl92YWxpZCh2aXJ0X3RvX3BmbihfYWRkcikpOwkJCQkJXA0KPiAgIH0pDQo+ICAgDQoNCldoYXQg
YWJvdXQgYm9va2UvNjQgPw0KDQpUaGUgdGVzdCB3aWxsIGJlIF9hZGRyID49IDB4YzAwMDAwMDAw
MDAwMDAwMCAmJiBfYWRkciA8IA0KMHg4MDAwMDAwMDAwMDAwMDAwIHNvIHRoZSB0ZXN0IHdpbGwg
YmUgYWx3YXlzIGZhbHNlLg0KDQpDaHJpc3RvcGhlDQo=
