Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 579B35AD714
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 18:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLtgs1v8Fz30JR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 02:07:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ZYzslS78;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.70; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ZYzslS78;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120070.outbound.protection.outlook.com [40.107.12.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLtg25l59z2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 02:06:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiGv9cVwV+OyeQQYCqRe/tIZ2lJCoK746BC4LZM37hfnML++5plv6ZEhDd0siNhPArjay+j3ZZILlRIyfW09PJ71UqkGj4CBXpJpUBH7N6AQGnP4ZRwQxmn151vq4JPBCcGrV8Gb0wepV9/DemcWGTY28WtPYVgU/MOBYcy/3Hay3ez+2mz3c1Es/6QZVDSDXj7xCXAoDD3P2oppz+Kr4JbRJijAMYDJaJSpXJhaLAJOHxEuM16SiUMtyDklBn3OvAjHqSU/sqT0S6qIuVbN0UUzM9r5s0e8JXLZMF9gydbt3bXLkA6IdQKrxMByqW2iMrUOScHAYEymEd9vxnOoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKmq0DZskonn59QgADM4dv0WynFjcSDqcaIN02Ejvnk=;
 b=fkCJQHHpQsQ7Up8IuPxzBb7B8JMx+UW+2KS9kTy+S+Cd2ppQdANM3tkvdhplDahzrzdsqcgiTrb/UHjkj8gJIMQqfxE+5RgX0nwrt32XLed2GQWG0UVgTgyuIOPplGRNeSDU5RE/ONoC9Tbj5lBIjsQQb9CmqxkG8NDprIPZUOp+s97NA3m0atAXPDP3Uo+wXvlpDJU+QnRftjVEWum2GEHoL6FTun5HETxT5x8xT4J7c6CkAnmZX1iel7YZp4F4tSZSPULihRA8e/ZEHr346ayAe4SRtKUSl8injdJebBjmcOklQE2A5XB0r7JihogEDpxLp9eJ3c1egXuzDyKgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKmq0DZskonn59QgADM4dv0WynFjcSDqcaIN02Ejvnk=;
 b=ZYzslS78s7Ds1l8EhItthqtXT27lKPT4LJQxt4Ti7AbA1GQmKW7312nmbD/UCGf8N0NzK3PBKsijxkNUN/HsYvaBXFKp1YcviZqTxBPlmpdwTdkqcI5njAUwhELvk9hZEsSKYEvcR1s87MqpYC55CKvbreidIFmWnHrt8mHc2tfnI8IEqvk/v3q7FDwjfjRaGllHQOJ7eTdGLeGx9cmPsNyrn3kNLnwvsXUazyqXx4pyKidPITQnqFvYKVziEaie3ZzifZ9g9sLTdG8f8XQ35z2MNtnok9xLAIzJQ+WGlXS7XJEreuqnmSpRqU1cUrr3Qw+fRrgGyyk085y3qz3yIg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 16:05:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 16:05:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, Mike Kravetz
	<mike.kravetz@oracle.com>
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Topic: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Index:  AQHYvADXSfya6wb65kG+D7mgtkHwTK3HGEyAgACRYoCAAE3+AIAAsbkAgAPYXwCAAACZAIAAzVqAgAM9zgCAAA+WgIAAA4sAgABqHQA=
Date: Mon, 5 Sep 2022 16:05:59 +0000
Message-ID: <bb05ac8a-6847-0dcc-1f71-dc7c3f141f11@csgroup.eu>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
 <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
 <ac9ef726-c465-ccec-363e-9cfb60c170e7@csgroup.eu>
 <e54a4004-3de9-7ddf-9368-e98e0dc45425@redhat.com>
In-Reply-To: <e54a4004-3de9-7ddf-9368-e98e0dc45425@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f929d96-557f-4e92-04fb-08da8f58862b
x-ms-traffictypediagnostic: MR1P264MB2066:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ScQrQzttPFCedmQkjHQxQfbuH+6Bs2BesgNRx+/GMUmW/EKtm0A10q9vrzivhRxTLatWJ4xLTVFJIILS5GiGVr/HyLvPwLmCr1dtkDwlMJmpGf0p0A1zN5S5UhxXSFkEBjBdFwfNR9g7F/HdROzr9GlY1B2oRQL/UCCvmCXxWVGEToiHSoztZObJx3AHVV6hR4L7CArmIH+QnKyT6dwwv78m92pg3K06YlVEp4dyE2A7QBeaa8ArX1kquj1H3USdhSHjxM6HRHC2c75+bzNHQItq5lce5kBTZXvuLX3m+OnIud26CM4LI6MSw6nBmCFMrWJ30UXAp3Pr+P9tb5P2akpPzCMIDX6NtUwrDkaIwEPhVpyW3UXDJxvQtRWgn4qWrb3RZ9znGk9f0V4eyW+wcHA6lX6iDGHw9XVIupzFfX/xF0fF2PrwWJEH83iaTy2/0XvGKLwCgA5KexzU9l2RU15Gy4vJwyy+JsNnXSPyHqE/7tl4PoyyAWfrEYSx193nykiRjjSwPWEJ6tUsEH7B1kQUzGAIcywcZVD1NP8DmtDh182XeD+P2dv5oxpKorEYU7+3OhB6wQkPhCXL4wjBxp32aF3RvsPBbhDZzDhEOiDWmt3dellB0tjWZooto7CpCPc8TgS/DqiSwfeKp+ku2rXAKw6KH9EVALti972BgHbmodSyjTTujO5c4sZ0kpID6cbI5m7brmBHDAkpCEq5I9NFTh1k0Ixo76t+BIIxUd+gQH7WTzSd/QDdvxRolMz8TIDJdGa6Y+JIbGAfwpCQMRm+Tosz9z+TF6pUIHZFjPTM171S385Dy1LbVJcBqrfcPPBioMrlP72Xv1QShPiVAA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(91956017)(316002)(66556008)(66446008)(76116006)(4326008)(8676002)(66946007)(66476007)(110136005)(64756008)(41300700001)(83380400001)(54906003)(31696002)(36756003)(86362001)(31686004)(6512007)(66574015)(26005)(2616005)(186003)(7416002)(8936002)(44832011)(2906002)(5660300002)(38070700005)(478600001)(71200400001)(53546011)(38100700002)(6486002)(6506007)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZU1HK0JsaE5ETzZsWUtwb2duaHBhTFB5Zjd0ckhCeW5CRkZaN3lpOU9XbllO?=
 =?utf-8?B?UEhQTXc1Y0gxanIzN2Q0a0RnUER1bjUvUnQ4a2FGNTFtakdndkZFa0VDVXhO?=
 =?utf-8?B?S2VodjQ5V0NhTmZRNXc2cytwQno1Z203SElVdkFMVUI5WmRTK0NHQTBkUnFt?=
 =?utf-8?B?YjRCZnUwVHZyMFV5ZVBSQzFUVGI3dFpOSFRuQmRjdC9uMDBkdjBnNVdwdDhN?=
 =?utf-8?B?QXMzQnRMRHYyYkE5Qi96UitVNnA3V241QVVkZ0UvV3AyRitwTjV6dUI0cHo1?=
 =?utf-8?B?bGIvTVV0MjNWT0l1K2NKZ295eWtBS2pDd3R1eGhjaWpvTXFkTGJHUUVpN3pE?=
 =?utf-8?B?VHhraVIvbHBHSm8xU29VdXhCVE10bTR1ZGd2bzRpazM1NzFLdk1SdDRQV3py?=
 =?utf-8?B?dG54eENYTnU3aXNFb1lmY1FPTnlMRk1TV2RRWGtqdnBEOU5QWmIvNk9tQXJ3?=
 =?utf-8?B?ZCtWWDZUbm1FV0xERWhBV1FTSlVIVXYzZnFFVjBFVVdSS2srOXBhNVNjNFlL?=
 =?utf-8?B?YXF2dkZ0R1piUk4vWDRWT1V2VTcwK2hxYVZWUzdFZ3dhNXFVSWV6dTQ1M2Rk?=
 =?utf-8?B?cmphdHZLK204eXoxYUpwcVFzSnc4aFEvakpiNGt6cGJScHNMOVZqOU9EVFFR?=
 =?utf-8?B?NlNic3JJcmo3OFZRbTY4TjVXUVdaQ283Q1p3akxPQmFrOTAxUmJNMk5uYUVQ?=
 =?utf-8?B?TVV0eUZKVWNSVloxUUUwNGE2M2pkNFk0bEp1aVkrVVE3U0YvbG1KeSt3WlN2?=
 =?utf-8?B?OHdDd2xGT1RPM2szQ1NJQUhNcDFFOFNKek5kS0NzMlkrUks4RjFyU01oWlFt?=
 =?utf-8?B?aEthQmRPK3c2alB6QUNjVjJ2Z0FVMFkvVzhmWFF3U25mWkdxV21sVmNBZWZL?=
 =?utf-8?B?b3BIT2t2QWJYYXRoU2t4R0NEK1BIb1UxTHYxd2V1MzJJaWpBdXFTYmlYeGI4?=
 =?utf-8?B?aWh3c1hUeSs2RTFTRE82a1BBOVRSNkk1TmVGSDZXQm81NHZsRU1aOUlLZTBV?=
 =?utf-8?B?T1IzSWpmaW0xRXgwMFZ5MGZob2JkaGZRTStXaWtxNzlkbUtHZHdsL0pOT09i?=
 =?utf-8?B?bkZqOXNqVzAwL0hHQXozVWhIYm1FVDhKc0Y3WkFwdTVOMHVORzZxaEN3RXhS?=
 =?utf-8?B?bXUyVTRBTjUwdUl3MzNtejZYWWh3UEpjcnVqb0EvYTJMcWZ0ZjlqcUM4amk3?=
 =?utf-8?B?WStEaXBRcDVuWnk1Nm5IVmJXMHQ3UW5XU2c5YUZ1T3VLemtqdjgrZTJqbHlw?=
 =?utf-8?B?UytrdVA3dWsrQy8zMEt3TlJTTlQwazFtTFV0Wm0vbTlWUGtCOHZRZGYwM3ZJ?=
 =?utf-8?B?eTBPQm43UnJqTjM4bDV5ajFCb2NCWFhWUzJHUGF1aVVDVStlWStzdUZRYTNI?=
 =?utf-8?B?L2JkMjI1SlZvY0NxYVQxaSswbXR6Und6ZWFHMFk5eWpTYUIzVkE1MExXS1JV?=
 =?utf-8?B?NWVPelBuamJ0NlpueVovUjkybEJrRTFncURzT2JMTlpoY3Q4UFJzUnNVQmNF?=
 =?utf-8?B?NUVlZi9VQmp2dlp1dkNiRHdQdnpFNlZtU0l5Q2NabDFMZFVHOGthMmgxdi9u?=
 =?utf-8?B?T2dlY0gwazRBL1ZwSU9HMzQ2eEsyU2ZrS0VVNklFSnFLZm9mZDViM2tTbEZv?=
 =?utf-8?B?d1I2VEZtOVlKclBDbW15dU5XMWhqVFdkUmxydUNJejljUm8zd1J2R1pvOWRM?=
 =?utf-8?B?bUJ4RGF3ems0UW80b3FXbnVYU2VZb3BPcmJUVEE4dzJ4a01RS0FLOVh0eTE1?=
 =?utf-8?B?bnI1WDhRcmFXR1dUVkV6aUJmaDg2bzQ5Wk14bnVucFdGdGt4cGdQdlZKZ0ZS?=
 =?utf-8?B?M0o3Sm1RSjBHWmNKWjdxdjR2c21iQ3RYMzBtdG5zdzN3ZUQ2YmhEQkJtZElz?=
 =?utf-8?B?QTVFQmgraVUvKzBVZUY1RDhWaFdlUCtLTXlTM2pTblB4SkRzNWdPT1RvbTRa?=
 =?utf-8?B?cW5MYXM0YlpCODhYazFuVTl6eEpFNWFPVWZTVlhGMDBpdHlkdVhoL3NLcVFC?=
 =?utf-8?B?SmJhK1U3THFYRjRSVFFPMlhJbUhMd0pFSmU4QkNsajNLdTcxbzZCUFB2UEVl?=
 =?utf-8?B?NTBNa3ZJNEJPamZ0U1UyN2pWR1BuZUhoY0xwdVU3ZFRJKzNDelRMZDBrVnpZ?=
 =?utf-8?B?SDlYK3JJOWZnRFZHdllDQUlWejB5Ky93V1RDeDROKzJLNEs0ejV3UHF6RjhN?=
 =?utf-8?Q?crEzTIPue9M5sG2AaV3OOT8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <688428B92107D4478CB78D28155AC82B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f929d96-557f-4e92-04fb-08da8f58862b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 16:05:59.7050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YEEypQ1J0ioz5QuK3vFAsGRng781fPa9GW9RpEc+3XzMiNlUOgOtKj8oIS2N/k5s26FVYWEUskXR1Bt923DuTiPKmd0ZULOvjp7JLoDeSPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2066
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

DQoNCkxlIDA1LzA5LzIwMjIgw6AgMTE6NDYsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6
DQo+IE9uIDA1LjA5LjIyIDExOjMzLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+
PiBMZSAwNS8wOS8yMDIyIMOgIDEwOjM3LCBEYXZpZCBIaWxkZW5icmFuZCBhIMOpY3JpdMKgOg0K
Pj4+IE9uIDAzLjA5LjIyIDA5OjA3LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+PiArUmVz
ZW5kaW5nIHdpdGggdmFsaWQgcG93ZXJwYyBsaXN0IGFkZHJlc3MNCj4+Pj4NCj4+Pj4gTGUgMDIv
MDkvMjAyMiDDoCAyMDo1MiwgRGF2aWQgSGlsZGVuYnJhbmQgYSDDqWNyaXTCoDoNCj4+Pj4+Pj4+
IEFkZGluZyBDaHJpc3RvcGhlIG9uIENjOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IENocmlzdG9waGUg
ZG8geW91IGtub3cgaWYgaXNfaHVnZXBkIGlzIHRydWUgZm9yIGFsbCBodWdldGxiDQo+Pj4+Pj4+
PiBlbnRyaWVzLCBub3QNCj4+Pj4+Pj4+IGp1c3QgaHVnZXBkPw0KPj4+Pg0KPj4+PiBpc19odWdl
cGQoKSBpcyB0cnVlIGlmIGFuZCBvbmx5IGlmIHRoZSBkaXJlY3RvcnkgZW50cnkgcG9pbnRzIHRv
IGEgaHVnZQ0KPj4+PiBwYWdlIGRpcmVjdG9yeSBhbmQgbm90IHRvIHRoZSBub3JtYWwgbG93ZXIg
bGV2ZWwgZGlyZWN0b3J5Lg0KPj4+Pg0KPj4+PiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIGlmIHRo
ZSBkaXJlY3RvcnkgZW50cnkgaXMgbm90IHBvaW50aW5nIHRvIGFueQ0KPj4+PiBsb3dlciBkaXJl
Y3RvcnkgYnV0IGlzIGEgaHVnZSBwYWdlIGVudHJ5LCBwWGRfbGVhZigpIGlzIHRydWUuDQo+Pj4+
DQo+Pj4+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gT24gc3lzdGVtcyB3aXRob3V0IGh1Z2VwZCBlbnRy
aWVzLCBJIGd1ZXNzIHB0ZHVtcCBza2lwcyBhbGwNCj4+Pj4+Pj4+IGh1Z2V0bGIgZW50cmllcy4N
Cj4+Pj4+Pj4+IFNpZ2ghDQo+Pj4+DQo+Pj4+IEFzIGZhciBhcyBJIGNhbiBzZWUsIHB0ZHVtcF9w
WGRfZW50cnkoKSBoYW5kbGVzIHRoZSBwWGRfbGVhZigpIGNhc2UuDQo+Pj4+DQo+Pj4+Pj4+DQo+
Pj4+Pj4+IElJVUMsIHRoZSBpZGVhIG9mIHB0ZHVtcF93YWxrX3BnZCgpIGlzIHRvIGR1bXAgcGFn
ZSB0YWJsZXMgZXZlbg0KPj4+Pj4+PiBvdXRzaWRlDQo+Pj4+Pj4+IFZNQXMgKGZvciBkZWJ1Z2dp
bmcgcHVycG9zZXM/KS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSBjYW5ub3QgY29udmluY2UgbXlzZWxm
IHRoYXQgdGhhdCdzIGEgZ29vZCBpZGVhIHdoZW4gb25seSANCj4+Pj4+Pj4gaG9sZGluZyB0aGUN
Cj4+Pj4+Pj4gbW1hcCBsb2NrIGluIHJlYWQgbW9kZSwgYmVjYXVzZSB3ZSBjYW4ganVzdCBzZWUg
cGFnZSB0YWJsZXMgZ2V0dGluZw0KPj4+Pj4+PiBmcmVlZCBjb25jdXJyZW50bHkgZS5nLiwgZHVy
aW5nIGNvbmN1cnJlbnQgbXVubWFwKCkgLi4uIHdoaWxlIA0KPj4+Pj4+PiBob2xkaW5nDQo+Pj4+
Pj4+IHRoZSBtbWFwIGxvY2sgaW4gcmVhZCB3ZSBtYXkgb25seSB3YWxrIGluc2lkZSBWTUEgYm91
bmRhcmllcy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhhdCB0aGVuIHJhaXNlcyB0aGUgcXVlc3Rpb25z
IGlmIHdlJ3JlIG9ubHkgY2FsbGluZyB0aGlzIG9uDQo+Pj4+Pj4+IHNwZWNpYWwgTU1zDQo+Pj4+
Pj4+IChlLmcuLCBpbml0X21tKSB3aGVyZWJ5IHdlIGNhbm5vdCByZWFsbHkgc2VlIGNvbmN1cnJl
bnQgbXVubWFwKCkgYW5kDQo+Pj4+Pj4+IHdoZXJlIHdlIHNob3VsZG4ndCBoYXZlIGh1Z2V0bGIg
bWFwcGluZ3Mgb3IgaHVnZXBkIGVudHJpZXMuDQo+Pj4+DQo+Pj4+IEF0IGxlYXN0IG9uIHBvd2Vy
cGMsIFBURFVNUCBoYW5kbGVzIG9ubHkgaW5pdF9tbS4NCj4+Pj4NCj4+Pj4gSHVnZXBhZ2UgYXJl
IHVzZWQgYXQgbGVhc3Qgb24gcG93ZXJwYyA4eHggZm9yIGxpbmVhciBtZW1vcnkgbWFwcGluZywg
DQo+Pj4+IHNlZQ0KPj4+Pg0KPj4+PiBjb21taXQgMzQ1MzZkNzgwNjgzICgicG93ZXJwYy84eHg6
IEFkZCBhIGZ1bmN0aW9uIHRvIGVhcmx5IG1hcCBrZXJuZWwNCj4+Pj4gdmlhIGh1Z2UgcGFnZXMi
KQ0KPj4+PiBjb21taXQgY2YyMDk5NTFmYTdmICgicG93ZXJwYy84eHg6IE1hcCBsaW5lYXIgbWVt
b3J5IHdpdGggaHVnZSBwYWdlcyIpDQo+Pj4+DQo+Pj4+IGh1Z2VwZHMgbWF5IGFsc28gYmUgdXNl
ZCBpbiB0aGUgZnV0dXJlIHRvIHVzZSBodWdlIHBhZ2VzIGZvciB2bWFwIGFuZA0KPj4+PiB2bWFs
bG9jLCBzZWUgY29tbWl0IGE2YThmN2M0YWE3ZSAoInBvd2VycGMvOHh4OiBhZGQgc3VwcG9ydCBm
b3IgaHVnZQ0KPj4+PiBwYWdlcyBvbiBWTUFQIGFuZCBWTUFMTE9DIikNCj4+Pj4NCj4+Pj4gQXMg
ZmFyIGFzIEkga25vdywgcHBjNjQgYWxzbyB1c2UgaHVnZSBwYWdlcyBmb3IgVk1BUCBhbmQgVk1B
TExPQywgc2VlDQo+Pj4+DQo+Pj4+IGNvbW1pdCBkOTA5ZjkxMDljMzAgKCJwb3dlcnBjLzY0cy9y
YWRpeDogRW5hYmxlIEhBVkVfQVJDSF9IVUdFX1ZNQVAiKQ0KPj4+PiBjb21taXQgOGFiZGRkOTY4
YTMwICgicG93ZXJwYy82NHMvcmFkaXg6IEVuYWJsZSBodWdlIHZtYWxsb2MgbWFwcGluZ3MiKQ0K
Pj4+DQo+Pj4gVGhlcmUgaXMgYSBkaWZmZXJlbmNlIGJldHdlZW4gYW4gb3JkaW5hcnkgaHVnZSBt
YXBwaW5nIChlLmcuLCBhcyB1c2VkDQo+Pj4gZm9yIFRIUCkgYW5kIGEgYSBodWdldGxiIG1hcHBp
bmcuDQo+Pj4NCj4+PiBPdXIgY3VycmVudCB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaHVnZXBkIG9u
bHkgYXBwbGllcyB0byBodWdldGxiLg0KPj4+IFdvdWxkbid0IHZtYXAvdm1hbGxvYyB1c2VyIG9y
ZGluYXJ5IGh1Z2UgcG1kIGVudHJpZXMgaW5zdGVhZCBvZiBodWdlcGQ/DQo+Pj4NCj4+DQo+PiAn
aHVnZXBkJyBzdGFuZHMgZm9yIGh1Z2UgcGFnZSBkaXJlY3RvcnkuIEl0IGlzIGluZGVwZW5kYW50
IG9mIHdoZXRoZXIgYQ0KPj4gaHVnZSBwYWdlIGlzIHVzZWQgZm9yIGh1Z2V0bGIgb3IgZm9yIGFu
eXRoaW5nIGVsc2UsIGl0IHJlcHJlc2VudHMgdGhlDQo+PiB3YXkgcGFnZXMgYXJlIGRlc2NyaWJl
ZCBpbiB0aGUgcGFnZSB0YWJsZXMuDQo+IA0KPiBUaGlzIHBhdGNoIGhlcmUgbWFrZXMgdGhlIGFz
c3VtcHRpb24gdGhhdCBodWdlcGQgb25seSBhcHBsaWVzIHRvIA0KPiBodWdldGxiLCBiZWNhdXNl
IGl0IHJlbW92ZXMgYW55IHN1Y2ggaGFuZGxpbmcgZnJvbSB0aGUgIWh1Z2V0bGIgcGF0aCBpbiAN
Cj4gR1VQLiBJcyB0aGF0IGluY29ycmVjdCBvciBhcmUgdGhlcmUgdmFsaWQgY2FzZXMgd2hlcmUg
dGhhdCBjb3VsZCBoYXBwZW4/IA0KPiAoaW5pdF9tbSBpcyBzcGVjaWFsIGluIHRoYXQgcmVnYXJk
LCBpIGRvbid0IHRoaW5rIGl0IGludGVyYWN0cyB3aXRoIEdVUCANCj4gYXQgYWxsKS4NCg0KWW91
IGFyZSBjb3JyZWN0IEkgdGhpbmssIGZvciB1c2VyIHBhZ2VzIGh1Z2VwZCBvbmx5IGFwcGxpZXMg
dG8gaHVnZXRsYi4NCg0KPiANCj4+DQo+PiBJIGRvbid0IGtub3cgd2hhdCB5b3UgbWVhbiBieSBf
b3JkaW5hcnlfIGh1Z2UgcG1kIGVudHJ5Lg0KPj4NCj4gDQo+IEVzc2VudGlhbGx5LCB3aGF0IHdl
IHVzZSBmb3IgVEhQLiBMZXQgbWUgdHJ5IHRvIHVuZGVyc3RhbmQgaG93IGh1Z2VwZCANCj4gaW50
ZXJhY3Qgd2l0aCB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtLg0KPiANCj4gRG8gc3lzdGVtcyB0aGF0
IHN1cHBvcnQgaHVnZXBkIGN1cnJlbnRseSBpbXBsZW1lbnQgVEhQPyBSZWFkaW5nIGFib3ZlIA0K
PiAzMmJpdCBzeXN0ZW1zIGJlbG93LCBJIGFzc3VtZSBub3Q/DQoNClJpZ2h0LCBhcyBmYXIgYXMg
SSB1bmRlcnN0YW5kIG9ubHkgbGVhZiBodWdlIHBhZ2VzIGFyZSBoYW5kbGVkIGJ5IFRIUCBhcyAN
CmZhciBhcyBJIHVuZGVyc3RhbmQuDQoNCj4gDQo+PiBMZXQncyB0YWtlIHRoZSBleGVtcGxlIG9m
IHBvd2VycGMgOHh4IHdoaWNoIGlzIHRoZSBvbmUgSSBrbm93IGJlc3QuIFRoaXMNCj4+IGlzIGEg
cG93ZXJwYzMyLCBzbyBpdCBoYXMgdHdvIGxldmVscyA6IFBHRCBhbmQgUFRFLiBQR0QgaGFzIDEw
MjQgZW50cmllcw0KPj4gYW5kIGVhY2ggZW50cnkgY292ZXJzIGEgNE1ieXRlcyBhcmVhLiBOb3Jt
YWwgUFRFIGhhcyAxMDI0IGVudHJpZXMgYW5kDQo+PiBlYWNoIGVudHJ5IGlzIGEgNGsgcGFnZS4g
V2hlbiB5b3UgdXNlIDhNYnl0ZXMgcGFnZXMsIHlvdSBkb24ndCB1c2UgUFRFcw0KPj4gYXMgaXQg
d291bGQgYmUgYSB3YXN0ZSBvZiBtZW1vcnkuIFlvdSB1c2UgYSBodWdlIHBhZ2UgZGlyZWN0b3J5
IHRoYXQgaGFzDQo+PiBhIHNpbmdsZSBlbnRyeSwgYW5kIHlvdSBoYXZlIHR3byBQR0QgZW50cmll
cyBwb2ludGluZyB0byB0aGUgaHVnZSBwYWdlDQo+PiBkaXJlY3RvcnkuDQo+IA0KPiBUaGFua3Ms
IEkgYXNzdW1lIHRoZXJlIGFyZSBubyA4TUIgVEhQLCBjb3JyZWN0Pw0KDQpDb3JyZWN0Lg0KDQo+
IA0KPiBUaGUgOE1CIGV4YW1wbGUgd2l0aCA0TUIgUEdEIGVudHJpZXMgbWFrZXMgaXQgc291bmQg
YSBiaXQgbGlrZSB0aGUgDQo+IGNvbnQtUFRFL2NvbnQtUE1EIGhhbmRsaW5nIG9uIGFhcmNoNjQ6
IHRoZXkgZG9uJ3QgdXNlIGEgaHVnZXBkIGJ1dCB3b3VsZCANCj4gc2ltcGx5IGxldCB0d28gY29u
c2VjdXRpdmUgUEdEIGVudHJpZXMgcG9pbnQgYXQgdGhlIHRoZSByZWxldmFudCAoc3ViKSANCj4g
cGFydHMgb2YgdGhlIGh1Z2V0bGIgcGFnZS4gTm8gaHVnZXBkIGludm9sdmVkLg0KDQpZZXMgaXQg
aXMgbXkgZmVlbGluZyBhcyB3ZWxsLg0KDQpBbGx0aG91Z2ggaW4gdGhlIGNhc2Ugb2YgdGhlIHBv
d2VycGMgOHh4IHdlIHJlYWxseSBuZWVkIGEgUEdEIGVudHJ5ICsgYSANCnBhZ2UgZW50cnkgaW4g
b3JkZXIgdG8gdXNlIHRoZSBoYXJkd2FyZSBhc3Npc3RlZCBwYWdlIHRhYmxlIHdhbGsgYW5kIA0K
YWxzbyB0byBwb3B1bGF0ZSBMMSBhbmQgTDIgVExCIGVudHJpZXMgd2l0aG91dCB0byBtYW55IHBy
b2Nlc3NpbmcgaW4gdGhlIA0KVExCLW1pc3MgaW50ZXJydXB0IGhhbmRsZXIuDQoNCj4gDQo+Pg0K
Pj4gU29tZSB0aW1lIGFnbywgaHVwZ2VwZCB3YXMgYWxzbyB1c2VkIGZvciA1MTJrYnl0ZXMgcGFn
ZXMgYW5kIDE2a2J5dGVzDQo+PiBwYWdlczoNCj4+IC0gdGhlcmUgd2FzIGh1Z2UgcGFnZSBkaXJl
Y3RvcmllcyB3aXRoIDh4IDUxMmtieXRlcyBwYWdlcywNCj4+IC0gdGhlcmUgd2FzIGh1Z2UgcGFn
ZSBkaXJlY3RvcmllcyB3aXRoIDI1NnggMTZrYnl0ZXMgcGFnZXMsDQo+Pg0KPj4gQW5kIHRoZSBQ
R0QvUE1EIGVudHJ5IHBvaW50cyB0byBhIGh1Z2UgcGFnZSBkaXJlY3RvcnkgKEhVR0VQRCkgaW5z
dGVhZA0KPj4gb2YgcG9pbnRpbmcgdG8gYSBwYWdlIHRhYmxlIGRpcmVjdG9yeSAoUFRFKS4NCj4g
DQo+IFRoYW5rcyBmb3IgdGhlIGV4YW1wbGUuDQo+IA0KPj4NCj4+IFNpbmNlIGNvbW1pdCBiMjUw
YzhjMDhjNzkgKCJwb3dlcnBjLzh4eDogTWFuYWdlIDUxMmsgaHVnZSBwYWdlcyBhcw0KPj4gc3Rh
bmRhcmQgcGFnZXMuIiksIHRoZSA4eHggZG9lc24ndCB1c2UgYW55bW9yZSBodWdlcGQgZm9yIDUx
MmsgaHVnZQ0KPj4gcGFnZSwgYnV0IG90aGVyIHBsYXRmb3JtcyBsaWtlIHBvd2VycGMgYm9vazNl
IGV4dGVuc2l2ZWx5IHVzZSBodWdlIHBhZ2UNCj4+IGRpcmVjdG9yaWVzLg0KPj4NCj4+IEkgaG9w
ZSB0aGlzIGNsYXJpZmllcyB0aGUgc3ViamVjdCwgb3RoZXJ3aXNlIEknbSBoYXBweSB0byBwcm92
aWRlDQo+PiBmdXJ0aGVyIGRldGFpbHMuDQo+IA0KPiBUaGFua3MsIGl0IHdvdWxkIGJlIHZhbHVh
YmxlIHRvIGtub3cgaWYgdGhlIGFzc3VtcHRpb24gaW4gdGhpcyBwYXRjaCBpcyANCj4gY29ycmVj
dDogaHVnZXBkIHdpbGwgb25seSBiZSBmb3VuZCBpbiBodWdldGxiIGFyZWFzIGluIG9yZGluYXJ5
IE1NcyAobm90IA0KPiBpbml0X21tKS4NCj4gDQoNClllcyBJIHRoaW5rIHRoZSBhc3N1bXB0aW9u
IGlzIGNvcnJlY3QgZm9yIHVzZXIgcGFnZXMgaGVuY2UgZm9yIEdVUC4NCg0KQnkgdGhlIHdheSB0
aGUgZGlzY3Vzc2lvbiBzdGFydGVkIHdpdGggUFREVU1QLiBGb3IgUFREVU1QIHdlIG5lZWQgaHVn
ZSANCnBhZ2UgZGlyZWN0b3JpZXMgdG8gYmUgdGFrZW4gaW50byBhY2NvdW50LiBBbmQgZm9yIGFu
eXRoaW5nIHRoYXQgDQppbnZvbHZlcyBrZXJuZWwgcGFnZXMgbGlrZSBWTUFQIG9yIFZNQUxMT0Mu
DQoNCkNocmlzdG9waGU=
