Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FB5ABD93
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 09:08:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKQqd4xcCz307b
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 17:08:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NIgEscuH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.79; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=NIgEscuH;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120079.outbound.protection.outlook.com [40.107.12.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKQps1Tglz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 17:08:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlLdYwralIwgwVPlniGa1YIZuUaXehw3gVtJhyznrAEJgqC0cySIcwwJ0ZS7DLsXA//MW5a5KirzmX65GxUslcd6ItyvpaoFZWGon2YGrfQufMrjy7CBrFM8JSL6VP4etEgCRUqOjFGNqbd6twqEOkbmMgAl3BQFzw2NifS127fomQV5YGfiAxuoKfHhCOlyaVhbQ1+Ck39R9gcGsf9QKHkfsRlN6nHJ7E7KdfkVpqJJhJMokWeZVB1uni2+EDXD5NiTK5791N5BrwUxEnyxs41R2g0M7PSrZgdXbS6xasHDxm12YRSB/WNKVW1rHgrjC4Ay6zSROA976gOwIEHLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SxcsTabbZawOdMZm6Atx1uky3+fj3vj9yxTf2GM1NE=;
 b=THfaWMy2i495V3P/tiXFbByxeNbqLPO6WF8UXbtP8pqe/2HEJSYq0m898Dqspat/j6qbs5sQ+2T9fKLt9XJ9VrshBx214HTZO+FGRS2gCuud2/yb0qRzIKs7RyalBj1DR7rcnUC2p3anG39GyQ0F6i7aA+nVd5RHU5MvERavCdbR4Ss7wpxWoD2Tk0RbIIjIAN+jZCBVhimiuqjqIyx4Q5DC+5g9S5zsUOw6IN7rZ38YzF8gHq7buz9+XzqNpyt2TlvkaPGFUx428HPytzYdZlYH4YUomAAo15EWFwvOQIVPCuXJsrrG4GIBu4xzB5YTI6r4/s4Sie2f2jjQ2bjobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SxcsTabbZawOdMZm6Atx1uky3+fj3vj9yxTf2GM1NE=;
 b=NIgEscuHGe87C4glgBxBN1N5jmjlwW41W5shBS2zl5ju6rz+5hxwn66bMjV6FPO37zxbgBtfI2IjMQIjOfYzqC44N/kB8vPRxZrj2LJRz9Qh9rkuHCT/oWfJZPQ9g/1cEr3H6r3ItAqx/zrZukE/V+hgZKmnkhA/71rrStjrt8xD/+6CTxzQl091tA/3FiOifK1wc8hoU8JwSlqrBa0I6ADWn2L/iVHUaLGDkaRJ1s36fA+mfHbBiDu11m8NgR/YfdIS1pPfWNSU2AEYzI50ci3/sQ4JqTmyecWZI5CPNVgtU3tNoo0hmTxHauOnGLwxxvHQJyDwhEE79mVbOLPrKg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3378.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sat, 3 Sep
 2022 07:07:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.017; Sat, 3 Sep 2022
 07:07:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, Mike Kravetz
	<mike.kravetz@oracle.com>
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Topic: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Index:  AQHYvADXSfya6wb65kG+D7mgtkHwTK3HGEyAgACRYoCAAE3+AIAAsbkAgAPYXwCAAACZAIAAzVqA
Date: Sat, 3 Sep 2022 07:07:44 +0000
Message-ID: <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
In-Reply-To: <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ace1b39-0b19-48e4-b8cd-08da8d7affd1
x-ms-traffictypediagnostic: MR1P264MB3378:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZRZTZsF5ax1mk54QixHk5jxO00ORpOBw71iAO6sF678HH6M0IgZOWCzwqIk1U7tCZQ+qzzg7PSV4oaCBHSqW3OUIL18PaH6lBs8kZ0YqSZVH/9MGdm7xVAc/L1i5raW2rPXGir3D7dYqW3XVijNUIvWBADd6LJOswtOfu1YdYpVBJWBAvzpE1a5dPanWTu4j7KTU8CBG1eJJHYGMg6ZcbaNduJU791QdVZxSCd8q3Q1I50m8Xfrleq8xF/Exk6iezw1PLZ8ciSqSdDLaqGRuMCDcjq2nG+CX+muNVzdvqGK/MohXDL4Q0+sbfTjyxWHxqQ98ey0guYIFsi4uUZmg+H5qdqQQERzbObtItdGmNc9aiQC+1ZCScxMgivUUTK1bMcwfAFe/bTjq7Ypr+KlcyEsnJ+SNeCF2GPRtHrZz0ySkkLxdiymvezq2zXtYAzgbLHDx9c6oEkpMeDSbZrVLm2gsj3eK/ezngHOIKe9R2HAGHPSpELyO7PkpxQi0423Oar4bUxfE+887W4hwsPUqwFwP1NsxK+Zk4DIoOMASBgnvRkpAEqxq9YYM2eS7cOXfHxnqO+V8TuErXgsHShav3Q+gqxlIxaDma3jL+WOR3xHidm5tmCg0pIw1nxBn8cBqWhwXrOpB7hE1kaeT2yIa0FBY3akJfh2wGrvuTfa11oihgIrHSi99TmAS9zo280M5C5WUTD7OGfjO6eNFKVLWGLTi5Al3Re4iQuWXkbOa2ompXLrPaPJc/CB0tC7+GZ9b9PuOZNjQ0smfYhzj9d5hb+y9QYrJWtrKiTthLf2haDCKRrDMZsj8sdlffQFhd42oamsub+N3QpvJLioZTsqDWg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(44832011)(86362001)(83380400001)(31686004)(38100700002)(38070700005)(7416002)(6486002)(31696002)(71200400001)(36756003)(186003)(66574015)(2616005)(54906003)(2906002)(316002)(6506007)(122000001)(110136005)(26005)(6512007)(4326008)(91956017)(478600001)(8676002)(76116006)(41300700001)(5660300002)(64756008)(8936002)(66476007)(66446008)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RThxaHlPS3JoNDI2MmFCVXRuTFUvbzdXUkV1ZGxtenRRSElnVzIwS3hwSDVr?=
 =?utf-8?B?SVdPOE9POHV1c1A1NWg4UVJ1STllQXpPeVArcG1HV3ZkdGp2NHRRalRMLzRI?=
 =?utf-8?B?YU5WVEFUeGxBMU5jajdpa3AwU3d0OElNQ0FGd0lBYTNCOFdoMTBPVFpnYlpj?=
 =?utf-8?B?RUNVc2pKVWpoWjZNT1lpTi9ieVUvenlKTnovSDNhcjB2YWh6bWpwWmY0endQ?=
 =?utf-8?B?SDJiTCtGblRLMTlkN2Z1a0pvcTRmTzQ4ZU9kVlJFWlNKeXdvUEJNQm92YlFG?=
 =?utf-8?B?aENiSk1hQ1g5YXFOU1NJYVhBTklJUmpubGJCV2VkTExGaXJocUJyaGVYelpt?=
 =?utf-8?B?ZnJhaXZwU0cwTWNMbHczTnJKQytVNjF5Q2cwZ2w2Tkc3YWNuNDhSV25DREoy?=
 =?utf-8?B?WDNOR3NkdGNrMWVqQ0NoV1pWb2Rqdkx1Z21PM0FXdEZQTTdGeTJvY2pXS1BP?=
 =?utf-8?B?ZFlSYjJPUC9jU0tValp5MWJXNGJNZ3p5VHpTR1F2WE00OGxWWUtnTEFnU3BH?=
 =?utf-8?B?NXUvZGxlOCswTkI0S2NMTUZwOTRoS1lVVlk1Tlh3ck13WHdwWEoxdTl3c25l?=
 =?utf-8?B?cmdTaEkxNnp5UmdubHZKc2UvUll6eHIyaXpKU2s1TUtrY1RZMDhUSnhPSkdh?=
 =?utf-8?B?aTZyRTlZb1FnSzlUaDRXa0YyWFBPRW9Wd2I3UWtOV3JVRUUvcWxBVWZiUXdM?=
 =?utf-8?B?WFo5b1ZTR3prZCtiOWRVU2dYVjhIZ3E2NFNiQjI1OEE3K1NzMEpMandoTGl6?=
 =?utf-8?B?QmJpdU51bGE2VWQ4UzFvZjYrdGovb1lkZkxvMTgwWGkyWjNCQnhyOTRDUnhF?=
 =?utf-8?B?MklIci8xeDZVTzlucWV0Rm0wc1dFb0FHekNNb2tOc25VNlcwd2NIVVBvUzVh?=
 =?utf-8?B?MkZWcDAweTZubXpOUlp5azU5NHlzS21kZXlYeTB0amQ2WlVhbmNDS21KbXk3?=
 =?utf-8?B?L2RvZi9xTmU1dVRlQmU1OVhlZVE0Rit4cFdVcytWbWwxRUduaHB6TmdSeHRY?=
 =?utf-8?B?L2VEbDlnWElCTEhibjdJbTBxVmVkY1k3QWVXR2JRVElscVFXci8xd3F1VS9T?=
 =?utf-8?B?QWtDMjVjdzlQZThpL054OUdHL3VpOHpGd1UwdytpbjgweEhqUmh0eTdMWkda?=
 =?utf-8?B?ejJmTklTeVQ0Mmw3Q25GbU9tN0k3WG9pb0ZNMm41UExBM1gvVVhobFBQejV0?=
 =?utf-8?B?cGNHRFdlM1N3KzVST3RDMG9MWGFKRXhvMHlPcWROdkYwK1ZsVDlvZkxyWmx3?=
 =?utf-8?B?UEsxSlZZVjNQSXVhR2U1OWJJVTQ4UUExOVdZQ3ZMVDlCYzVTSmZLNnFKc0Vh?=
 =?utf-8?B?UGg0ckNoMUdWbEloc3pTMDJHdVV3WWlGVjNkSVlTSFdNT3dTMi9jaEZ3d1Nl?=
 =?utf-8?B?MkZkVHhxWFZjVHgzdWRhcEtVWFFiN0IyQlAxdE1TY2VyTHNvdmdYNGpZME5i?=
 =?utf-8?B?a2tINEE2cFA3ZktiMDZFT0tmQVY5ZWFRdGdveDlpTG9zQWovU2pZeGIwN05k?=
 =?utf-8?B?MVdHbmVveTVKL3ExWHI5SlFlc0xrbkF2K0FFc1V2RjRZczNZWUtKaHVUYW8y?=
 =?utf-8?B?V1pDWWRuaTBKZk8wQ3pzSzAxTnZCelVsWnZaalkwb080elhkTFdyclh1MUVu?=
 =?utf-8?B?L3dmK1g2RWRtY0VxUTE0bTJkc2pZczl0SUIxd3cyMnpyUXFMa2V1WG40M3Vm?=
 =?utf-8?B?VmczRXFadDU2bThpaHBvMFZjWFplN2M4TVBveGVjeENDUVowVFUzWmpUdVRY?=
 =?utf-8?B?TnVmaEhGVmk0NkI4SGZpS0xQU0Y3Y1k3YzBqNklTbXJCUjJjZ0FIVGhPWTlx?=
 =?utf-8?B?U3pZL3NKbHI1TDl4OUlES0R4NUZxeE96Yk5yRHRtSW10cnRBdGRTV0dhMERG?=
 =?utf-8?B?d2FFUjRjL0hkb1ZKNUJ2QzhGa1B0ME9yNmViWmZBS01DNThaQ1lnU005TWtl?=
 =?utf-8?B?QzNvdUowL2htcGpWVkIrNkFhRHp6Z2NtWFI2WFdhOGxVWkhmSzZsb2lacURZ?=
 =?utf-8?B?RitQeWNvb01RWWxqMURDSGtLVGFYYUJuNlhxOCs0b1JIVERYTDJBc3F4YlJt?=
 =?utf-8?B?NkkxeWdFUzNQaCtzbXhMY1BjcGZrQURqSjc3ZEdwZTVBb1JYajlXNzhweXVK?=
 =?utf-8?B?YThsc2l5WlJIcG9kRGZCRCtqUi9SVUpxSU5ueVJIZUFqSFRrT1c4ZU5sckJt?=
 =?utf-8?Q?PyFVF2GChn7n6ch+t0N4kh8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84196DE85543844B955E73DB35DEA1CE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ace1b39-0b19-48e4-b8cd-08da8d7affd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2022 07:07:44.3650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sh5TuZdA0fs6A9dMHSsjuzxsQKEh5zAkfUA8GQ1lM9HyTZo08+0jK8jyQZgsjUncz8DwgWcf7WzFATL4o03Spm349RCFytjUg0odDRfmq4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3378
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

K1Jlc2VuZGluZyB3aXRoIHZhbGlkIHBvd2VycGMgbGlzdCBhZGRyZXNzDQoNCkxlIDAyLzA5LzIw
MjIgw6AgMjA6NTIsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6DQo+Pj4+IEFkZGluZyBD
aHJpc3RvcGhlIG9uIENjOg0KPj4+Pg0KPj4+PiBDaHJpc3RvcGhlIGRvIHlvdSBrbm93IGlmIGlz
X2h1Z2VwZCBpcyB0cnVlIGZvciBhbGwgaHVnZXRsYiBlbnRyaWVzLCBub3QNCj4+Pj4ganVzdCBo
dWdlcGQ/DQoNCmlzX2h1Z2VwZCgpIGlzIHRydWUgaWYgYW5kIG9ubHkgaWYgdGhlIGRpcmVjdG9y
eSBlbnRyeSBwb2ludHMgdG8gYSBodWdlIA0KcGFnZSBkaXJlY3RvcnkgYW5kIG5vdCB0byB0aGUg
bm9ybWFsIGxvd2VyIGxldmVsIGRpcmVjdG9yeS4NCg0KQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBp
ZiB0aGUgZGlyZWN0b3J5IGVudHJ5IGlzIG5vdCBwb2ludGluZyB0byBhbnkgDQpsb3dlciBkaXJl
Y3RvcnkgYnV0IGlzIGEgaHVnZSBwYWdlIGVudHJ5LCBwWGRfbGVhZigpIGlzIHRydWUuDQoNCg0K
Pj4+Pg0KPj4+PiBPbiBzeXN0ZW1zIHdpdGhvdXQgaHVnZXBkIGVudHJpZXMsIEkgZ3Vlc3MgcHRk
dW1wIHNraXBzIGFsbCBodWdldGxiIGVudHJpZXMuDQo+Pj4+IFNpZ2ghDQoNCkFzIGZhciBhcyBJ
IGNhbiBzZWUsIHB0ZHVtcF9wWGRfZW50cnkoKSBoYW5kbGVzIHRoZSBwWGRfbGVhZigpIGNhc2Uu
DQoNCj4+Pg0KPj4+IElJVUMsIHRoZSBpZGVhIG9mIHB0ZHVtcF93YWxrX3BnZCgpIGlzIHRvIGR1
bXAgcGFnZSB0YWJsZXMgZXZlbiBvdXRzaWRlDQo+Pj4gVk1BcyAoZm9yIGRlYnVnZ2luZyBwdXJw
b3Nlcz8pLg0KPj4+DQo+Pj4gSSBjYW5ub3QgY29udmluY2UgbXlzZWxmIHRoYXQgdGhhdCdzIGEg
Z29vZCBpZGVhIHdoZW4gb25seSBob2xkaW5nIHRoZQ0KPj4+IG1tYXAgbG9jayBpbiByZWFkIG1v
ZGUsIGJlY2F1c2Ugd2UgY2FuIGp1c3Qgc2VlIHBhZ2UgdGFibGVzIGdldHRpbmcNCj4+PiBmcmVl
ZCBjb25jdXJyZW50bHkgZS5nLiwgZHVyaW5nIGNvbmN1cnJlbnQgbXVubWFwKCkgLi4uIHdoaWxl
IGhvbGRpbmcNCj4+PiB0aGUgbW1hcCBsb2NrIGluIHJlYWQgd2UgbWF5IG9ubHkgd2FsayBpbnNp
ZGUgVk1BIGJvdW5kYXJpZXMuDQo+Pj4NCj4+PiBUaGF0IHRoZW4gcmFpc2VzIHRoZSBxdWVzdGlv
bnMgaWYgd2UncmUgb25seSBjYWxsaW5nIHRoaXMgb24gc3BlY2lhbCBNTXMNCj4+PiAoZS5nLiwg
aW5pdF9tbSkgd2hlcmVieSB3ZSBjYW5ub3QgcmVhbGx5IHNlZSBjb25jdXJyZW50IG11bm1hcCgp
IGFuZA0KPj4+IHdoZXJlIHdlIHNob3VsZG4ndCBoYXZlIGh1Z2V0bGIgbWFwcGluZ3Mgb3IgaHVn
ZXBkIGVudHJpZXMuDQoNCkF0IGxlYXN0IG9uIHBvd2VycGMsIFBURFVNUCBoYW5kbGVzIG9ubHkg
aW5pdF9tbS4NCg0KSHVnZXBhZ2UgYXJlIHVzZWQgYXQgbGVhc3Qgb24gcG93ZXJwYyA4eHggZm9y
IGxpbmVhciBtZW1vcnkgbWFwcGluZywgc2VlDQoNCmNvbW1pdCAzNDUzNmQ3ODA2ODMgKCJwb3dl
cnBjLzh4eDogQWRkIGEgZnVuY3Rpb24gdG8gZWFybHkgbWFwIGtlcm5lbCANCnZpYSBodWdlIHBh
Z2VzIikNCmNvbW1pdCBjZjIwOTk1MWZhN2YgKCJwb3dlcnBjLzh4eDogTWFwIGxpbmVhciBtZW1v
cnkgd2l0aCBodWdlIHBhZ2VzIikNCg0KaHVnZXBkcyBtYXkgYWxzbyBiZSB1c2VkIGluIHRoZSBm
dXR1cmUgdG8gdXNlIGh1Z2UgcGFnZXMgZm9yIHZtYXAgYW5kIA0Kdm1hbGxvYywgc2VlIGNvbW1p
dCBhNmE4ZjdjNGFhN2UgKCJwb3dlcnBjLzh4eDogYWRkIHN1cHBvcnQgZm9yIGh1Z2UgDQpwYWdl
cyBvbiBWTUFQIGFuZCBWTUFMTE9DIikNCg0KQXMgZmFyIGFzIEkga25vdywgcHBjNjQgYWxzbyB1
c2UgaHVnZSBwYWdlcyBmb3IgVk1BUCBhbmQgVk1BTExPQywgc2VlDQoNCmNvbW1pdCBkOTA5Zjkx
MDljMzAgKCJwb3dlcnBjLzY0cy9yYWRpeDogRW5hYmxlIEhBVkVfQVJDSF9IVUdFX1ZNQVAiKQ0K
Y29tbWl0IDhhYmRkZDk2OGEzMCAoInBvd2VycGMvNjRzL3JhZGl4OiBFbmFibGUgaHVnZSB2bWFs
bG9jIG1hcHBpbmdzIikNCg0KQ2hyaXN0b3BoZQ==
