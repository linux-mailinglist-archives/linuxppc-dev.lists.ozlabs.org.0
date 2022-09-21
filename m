Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9E5BF5D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 07:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXRWk5h4kz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 15:18:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=WOy6phuW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.40; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=WOy6phuW;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90040.outbound.protection.outlook.com [40.107.9.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXRVy0SqHz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 15:17:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dODXMEKFjsBPZ+Rp1raZJbtArKB8LEEzqLj9V+CJf57vUDS/dMDXvcrtWXL+i/b79hTc+XXpPfu47nZQBRKjRSizkJcmxlKXZciVzZSkH1eipWeZph6YVp88LQR77XHw7qQnlB3+AsiyNLYFSA44mhIajWb38LxZWnkw9EhH+UGUkBn5NSbbxJy8Q0mza+nb42xX5FAuLmhzErSaOgjtLfzW23lecYOQpSPe/y8Z+YxbEVTWpvM9T/RHepQI5/tWSFbdXNIblcrzkGUTrft3hbFq33FpbswusrVF1rhOv7XWf9hzGLlIg6h5eXAHrD/nZOejZic4hih1KTDpmmqk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSd+7WiHWSN8wEjp26epOa4RcF+FHaNiucB9Lh+A1XM=;
 b=T7NtVhlotIMwJ+DiB0M+hbCQYzzp9BPw1+gcP+50n2S7VKtoAt+yDlrMg9vfLQdtTF8JGHjCFbb0Mwxp/4MZ6B2vgulXAyd1vBFowmdCdQJkkrRnglOQRtCs41RkX1c7hdjtdRx342D6YXbtdwx6Y2VhuXMQMjV7hF5dKOCNdwV0GDTrZln6iE052d5+J8f3E6NvOxUA5z1PJPc++j0GgfNg5nv8KnD/4esKma4AMskyaiJWKKw1YheJcvIAJ5142QQ+mLBmEk6vpEwa4v/hvFWH7VOEaVi7l/U4b7fDTkpnFcxhRCActGNJ5jh6+CnA8yOnL5Naq56WQ88gKgx/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSd+7WiHWSN8wEjp26epOa4RcF+FHaNiucB9Lh+A1XM=;
 b=WOy6phuW7E/SY2b9ec5nrZrIlI+hG+8bXMS4EfFvxwxOFbFuMsDvfEqUJ5JfmaZBdAbfJ1JZASjSqAV8mBHS6+IgpArjGabM1mvT2qOSgKRvRxbdC0PHqDqYTBPPKB7W8TSTZw+9u8MihSbJXjGdSr/PdNjbf4/aI/pcBIslHLG5oXpOU1vo0lrl+qnzZz9Cl2zzTpEhSgpd8T8aOmez6PLKbWeEsyimm5jfQmeDZvSWwPjptpNTGiT9CGsbqIxy5WzA0sFf56/2l/lT44DnZpqSNnYkjYjA7+M3fpeC1Mu9sckMBfWEKf5eUq2pwwirCE9f0huDmqRyd8PQCT2H8Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 05:17:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Wed, 21 Sep 2022
 05:17:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Samuel Holland <samuel@sholland.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Topic: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Index: AQHYyYnrawisyGt7e0mr4Du3kDJFGq3jSIUAgANtqoCAAoyJAIAAHP2A
Date: Wed, 21 Sep 2022 05:17:07 +0000
Message-ID: <ea1cf92d-a388-9f7d-1f86-38afedfeff1e@csgroup.eu>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
 <87h713leu8.fsf@mpe.ellerman.id.au>
 <01281a29-5dff-8868-a1c3-4c4978dca346@sholland.org>
In-Reply-To: <01281a29-5dff-8868-a1c3-4c4978dca346@sholland.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3087:EE_
x-ms-office365-filtering-correlation-id: 440c6fcc-e68f-4228-1db2-08da9b90875e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  H6SatKyYV8Yz8YLtdcGgqrSfhDEc1gMUVBGqswdmNleQ9QpXVj0YKYCyYG/4zmaM/sWFqaWDZVRnpaBlXld3CCCYNiazhkZ7ykCEfe7w+zepISfN4ABMWP3y0ercZob/0aJKdYYxhZig/0yKsWsI7+oMFp0IkDDjkQtzs0RXMEMFtQwvREge9r9jAvnNQhdIlJWqgluY/vSzqEqLn3LhflNhWSM5triNbz4IezuohqoIKwAdVb0EZQZq3pRZdm3Jw+4aL97AZrHCiDI/+2Jwd3Lm85uJV0BnfjHNbalPDO1u0G34VzD/YO2ba7AnZHshImjDOjDDxZwScf/ARvrkRJMItf0ebherYuXxybnJ1GNWAzJXqbWt6CXzU/eRlLYCHpm7wLu3srvXKS4QAYjivV/0CYg6ajWhwPk73kSB83bJPyJhdksxmyDSa4MafDp2FYv6MIMDRXtZg7DvfTAmGlOWnYfAlnkfinNVYpQ6cIYA5f5ztLvF2rRpKWhFM4xUhHq4V+Nouc6kC+uRSvlBOOpdQSwJb9ArkwdKsPGwE6SOvAXHvWG3PkXS77S/cEpGhwBM76RF5eDenxZ0BYDKUHf1NQhFca/4+1uHRdkv/CzrwP5Clg3RTQiFiR/HiJJ0nQZllY69CQRJsCDskgFoEJz9Sssl7dSgzML9JEbuRnnm7cJ1XN3FY1NNnGXDcYKXZdR6g6W6Fgdf4lJetUQspkqMbFwoaoiHIDwG2V994DcFQ/cIapzbkA8SXSO/SXwjPZf6cxY+pmPgWoCAS1QP9rajg7nNbsYntKKQe8W0HA1KdvuXf9Bmd+UYpm1W5XuDfEJUXDXIahOl2xY9VfxduA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(41300700001)(8936002)(31686004)(38070700005)(2616005)(186003)(71200400001)(38100700002)(8676002)(53546011)(36756003)(478600001)(122000001)(66574015)(2906002)(6486002)(110136005)(54906003)(86362001)(66476007)(66556008)(66946007)(76116006)(66446008)(64756008)(44832011)(83380400001)(5660300002)(6512007)(26005)(316002)(31696002)(6506007)(91956017)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QXh5YmptbUVYdExLMlZkRzRoWi9ac2VEU1o2dkh0RTdkWW90aVVaZnBjb2pj?=
 =?utf-8?B?elJZOFVRa1BLUUtRQlF5Q3ZSa3RxM3RBTmwwYmFXamluYzBjbFE4SFZqUTdE?=
 =?utf-8?B?SGtzVmpoZDBXUGRaU1R3UXB3QWtEZ3MySkdDZUgxWDlIeUVHZ29xUEU2YXBD?=
 =?utf-8?B?NUx1TStxUm12am1FS1VrcWpJOTF6dG9ieFR2b3lKMzNwVVBDWnJxNmhJaU1T?=
 =?utf-8?B?eFU3cGJ6SEY0ZVBZd0p1TkNlRWxEMG1kNzFLNElsUHc5ZzE3Qmp5ZU1NUGJ2?=
 =?utf-8?B?a04rUEtVSjIvRUdvVE9rWjNOOFphOFVUUjZsUW40VFJOeFpna3NCbnQ1UW1H?=
 =?utf-8?B?alFzMnRITXFOaUdCbVAyUjQyTVF6eTdEcVFiUGtJdk8vZEJod05SeHRzYUJG?=
 =?utf-8?B?WENIaDdxZFNLanMxZGRMcDZJelBySTJvVDZvV2JVdmNrOVpRalBlZmhEWm5T?=
 =?utf-8?B?MHpBakhuaHNabTBESUd6VVI1V3h0R2FMRVN3cERNeFJYSlhvckZhWFkwbllI?=
 =?utf-8?B?Z2ZJZFI0ckppdi9HaWxzUGdsZVpGMFVWVkUvL1JPY0RQWDBMNXNxR0NhMnVE?=
 =?utf-8?B?c3R6QXZlb2hETmpMbzFaZVRvWmlKWDdoMkI3V1J5M1Y2YzJtWVptbDBZbVRQ?=
 =?utf-8?B?dUJMVnlmZnpVdTB5cmFibUw3MkVsNE9lM3l3NjBibG5TNmVrUUZ3MHNPVGVJ?=
 =?utf-8?B?ZjBSUkpNNlNzNDRMckUwa1dBUitGbkR3UTJla1l6Y0NMTlJHc3NuQSt3QWJn?=
 =?utf-8?B?eFRha2VJV2k3K1RROEpRNWh1QkVaOGszZWlvUVRYRWNSUVlOdFJ0NEVmT2F3?=
 =?utf-8?B?QzhFUm5Kd05SSjd3M2J2M1RaSDhvNlY1NVVlLzVHSmthZ3hkZGRQZkV5SytK?=
 =?utf-8?B?b2FJU0RCZzNRYnE3d2N0QWczZnhmSXJqUUp0aXM5YlV3eTNuVHpWMmFZR25Q?=
 =?utf-8?B?VjIzUDZibVBqT0MvOTU0TjRBZ0lSU0k1ejNiVmFIU1hsZTM5YUZTOW1FY3hT?=
 =?utf-8?B?c3c3aHlqTVl6OTBab1NJcFU3U1A1eGxjNCtRS0RFRWx0MEovQmF4OWNjQUhZ?=
 =?utf-8?B?ajZIME5XVGlQdnZXQzN5S0dFYmczQWg5WUM1ZWpNbWZ2UnJ4WTJRMC9NVExs?=
 =?utf-8?B?N1lQaXMwZjltcm9SNUI1a3c1Z1RpbWF6NmNpZXpGTE9XRVFKVlBBaTUwMDdk?=
 =?utf-8?B?c3lwNXlSbTJLWUdIeWNGNXpZcEdpVmdFUmN5RExyR0taQlk2YW1pRC8wNHVa?=
 =?utf-8?B?NzFIOFJCaUZyeEFWMDBLUnJla0lqbEVSb3FBaVk2ZzBKQUlTSzFCWWVJSVZ3?=
 =?utf-8?B?d0FMdzJGVjkxM3JmNTlQajlJVExEeEdCRm1ybTZlTUN2WU5PWEgzZE5qK2FR?=
 =?utf-8?B?V2NrZUYzT1JOaHQxSlYwU3JXVDB3QVVNTXE4WjhVYklIeEY3TjJ5QmNwTG5Z?=
 =?utf-8?B?WXd0UWhlNzZmekU3U1JyOFpKMTA1SzFIVW55M3JWd3BZN2ZBL0svbWJJNkRS?=
 =?utf-8?B?YUNhUVlNaWYvUHBNeHRkN2NHNENmemEvVFBwTm5KVkxiVEFGaksrNmg0S0hk?=
 =?utf-8?B?MmtjZXUrYkNzTzUwUXNjS3lXV2dvaFJmdHRkUFVYMWR0emc0MTNjRCtmbGRU?=
 =?utf-8?B?WGFBY2NveHlYYWRkbkNtVDgzblhkQTdzOFl5ckhaaExTU1JQdHZ6STBBSTQv?=
 =?utf-8?B?NE53VW1pQUpKMitGaWVTb29FUHdyL0ZCVUd1WFBpOGVaUURQNTBKaHhXQnc3?=
 =?utf-8?B?aFhKT1o5ZmVBRHNrL0xvUXFKQjBtU1Y5eWUwMFUzcitkZFhVVWVrNklac2FF?=
 =?utf-8?B?WmgxQlRrTENuL3MzZllMZmpwcXVHZmdNNFpFMHErMGtxT1R0QjNPelpBTzZK?=
 =?utf-8?B?OThyRkJYQm5KT2RaZGludUxJcmdvVG9wZ1M1NlpURlJCKzRnRlVhSjFiZTlw?=
 =?utf-8?B?ZEJPOC9FcHdBZmxpZjFWL2YvTFpBOWs5MU91Q0c0Z3RjNS91Z3VyZUxCQStv?=
 =?utf-8?B?aHdkYXJlZVJPN1NUYTc4QVBmdHh1M1NVK3hneFQ3OU5jOHI2b3N4Zjl4NWpN?=
 =?utf-8?B?b3V0RGVVbnR2a3JWdTVidVVzaGt5ZWNia1VRK1F2T2RLYXgrQ1VMaGdEeExZ?=
 =?utf-8?B?YVgvUzNhVzVZb245dDh6aGZlQWtBZEZ3STEybmY5VEVZS3BXVUJjVlk4TXNY?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A866EA8B9A22624AA3443E857CF200E0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 440c6fcc-e68f-4228-1db2-08da9b90875e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 05:17:07.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ku0qj14tSY66P3EQPuitZKFJuJ4uJraVo7BBpRS7QtyzbcfXR5qIlnMOxP9019bbHVu7znZpq0iV3mYbpPPxcaIX03Mn4WOwH62JGnZaolI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3087
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzA5LzIwMjIgw6AgMDU6MzMsIFNhbXVlbCBIb2xsYW5kIGEgw6ljcml0wqA6DQo+
IE9uIDkvMTkvMjIgMDc6MzcsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6DQo+PiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyaXRlczoNCj4+PiBMZSAxNi8w
OS8yMDIyIMOgIDA3OjA1LCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdMKgOg0KPj4+PiBXaXRoIENP
TkZJR19QUkVFTVBUPXkgKGludm9sdW50YXJ5IHByZWVtcHRpb24gZW5hYmxlZCksIGl0IGlzIHBv
c3NpYmxlDQo+Pj4+IHRvIHN3aXRjaCBhd2F5IGZyb20gYSB0YXNrIGluc2lkZSBjb3B5X3tmcm9t
LHRvfV91c2VyLiBUaGlzIGxlZnQgdGhlIENQVQ0KPj4+PiB3aXRoIHVzZXJzcGFjZSBhY2Nlc3Mg
ZW5hYmxlZCB1bnRpbCBhZnRlciB0aGUgbmV4dCBJUlEgb3IgcHJpdmlsZWdlDQo+Pj4+IGxldmVs
IHN3aXRjaCwgd2hlbiBBTVIvSUFNUiBnb3QgcmVzZXQgdG8gQU1SX0tVW0FFXVBfQkxPQ0tFRC4g
VGhlbiwgd2hlbg0KPj4+PiBzd2l0Y2hpbmcgYmFjayB0byB0aGUgb3JpZ2luYWwgdGFzaywgdGhl
IHVzZXJzcGFjZSBhY2Nlc3Mgd291bGQgZmF1bHQ6DQo+Pj4NCj4+PiBUaGlzIGlzIG5vdCBzdXBw
b3NlZCB0byBoYXBwZW4uIFlvdSBuZXZlciBzd2l0Y2ggYXdheSBmcm9tIGEgdGFzaw0KPj4+IG1h
Z2ljYWxseS4gVGFzayBzd2l0Y2ggd2lsbCBhbHdheXMgaGFwcGVuIGluIGFuIGludGVycnVwdCwg
dGhhdCBtZWFucw0KPj4+IGNvcHlfe2Zyb20sdG99X3VzZXIoKSBnZXQgaW50ZXJydXB0ZWQuDQo+
Pg0KPj4gVW5mb3J0dW5hdGVseSB0aGlzIGlzbid0IHRydWUgd2hlbiBDT05GSUdfUFJFRU1QVD15
Lg0KPj4NCj4+IFdlIGNhbiBzd2l0Y2ggYXdheSB3aXRob3V0IGFuIGludGVycnVwdCB2aWE6DQo+
PiAgICBfX2NvcHlfdG9mcm9tX3VzZXIoKQ0KPj4gICAgICAtPiBfX2NvcHlfdG9mcm9tX3VzZXJf
cG93ZXI3KCkNCj4+ICAgICAgICAgLT4gZXhpdF92bXhfdXNlcmNvcHkoKQ0KPj4gICAgICAgICAg
ICAtPiBwcmVlbXB0X2VuYWJsZSgpDQo+PiAgICAgICAgICAgICAgIC0+IF9fcHJlZW1wdF9zY2hl
ZHVsZSgpDQo+PiAgICAgICAgICAgICAgICAgIC0+IHByZWVtcHRfc2NoZWR1bGUoKQ0KPj4gICAg
ICAgICAgICAgICAgICAgICAtPiBwcmVlbXB0X3NjaGVkdWxlX2NvbW1vbigpDQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgIC0+IF9fc2NoZWR1bGUoKQ0KPj4NCj4+IEkgZG8gc29tZSBib290IHRl
c3RzIHdpdGggQ09ORklHX1BSRUVNUFQ9eSwgYnV0IEkgcmVhbGlzZSBub3cgdGhvc2UgYXJlDQo+
PiBhbGwgb24gUG93ZXI4LCB3aGljaCBpcyBhIGJpdCBvZiBhbiBvdmVyc2lnaHQgb24gbXkgcGFy
dC4NCj4+DQo+PiBBbmQgY2xlYXJseSBubyBvbmUgZWxzZSB0ZXN0cyBpdCwgdW50aWwgbm93IDop
DQo+Pg0KPj4gSSB0aGluayB0aGUgcm9vdCBvZiBvdXIgcHJvYmxlbSBpcyB0aGF0IG91ciBLVUFQ
IGxvY2svdW5sb2NrIGlzIGF0IHRvbw0KPj4gaGlnaCBhIGxldmVsLCBpZS4gd2UgZG8gaXQgaW4g
QyBhcm91bmQgdGhlIGxvdy1sZXZlbCBjb3B5IHRvL2Zyb20uDQo+Pg0KPj4gZWc6DQo+Pg0KPj4g
c3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nDQo+PiByYXdfY29weV90b191c2VyKHZvaWQgX191
c2VyICp0bywgY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKQ0KPj4gew0KPj4gCXVu
c2lnbmVkIGxvbmcgcmV0Ow0KPj4NCj4+IAlhbGxvd193cml0ZV90b191c2VyKHRvLCBuKTsNCj4+
IAlyZXQgPSBfX2NvcHlfdG9mcm9tX3VzZXIodG8sIChfX2ZvcmNlIGNvbnN0IHZvaWQgX191c2Vy
ICopZnJvbSwgbik7DQo+PiAJcHJldmVudF93cml0ZV90b191c2VyKHRvLCBuKTsNCj4+IAlyZXR1
cm4gcmV0Ow0KPj4gfQ0KPj4NCj4+IFRoZXJlJ3MgYSByZWFzb24gd2UgZGlkIHRoYXQsIHdoaWNo
IGlzIHRoYXQgd2UgaGF2ZSB2YXJpb3VzIGRpZmZlcmVudA0KPj4gS1VBUCBtZXRob2RzIG9uIGRp
ZmZlcmVudCBwbGF0Zm9ybXMsIG5vdCBhIHNpbXBsZSBpbnN0cnVjdGlvbiBsaWtlIG90aGVyDQo+
PiBhcmNoZXMuDQo+Pg0KPj4gQnV0IHRoYXQgbWVhbnMgd2UgaGF2ZSB0aGF0IGV4aXRfdm14X3Vz
ZXJjb3B5KCkgYmVpbmcgY2FsbGVkIGRlZXAgaW4gdGhlDQo+PiBndXRzIG9mIF9fY29weV90b2Zy
b21fdXNlcigpLCB3aXRoIEtVQVAgZGlzYWJsZWQsIGFuZCB0aGVuIHdlIGNhbGwgaW50bw0KPj4g
dGhlIHByZWVtcHQgbWFjaGluZXJ5IGFuZCBldmVudHVhbGx5IHNjaGVkdWxlLg0KPj4NCj4+IEkg
ZG9uJ3Qgc2VlIGFuIGVhc3kgd2F5IHRvIGZpeCB0aGF0ICJwcm9wZXJseSIsIGl0IHdvdWxkIGJl
IGEgYmlnIGNoYW5nZQ0KPj4gdG8gYWxsIHBsYXRmb3JtcyB0byBwdXNoIHRoZSBLVUFQIHNhdmUv
cmVzdG9yZSBkb3duIGludG8gdGhlIGxvdyBsZXZlbA0KPj4gYXNtIGNvZGUuDQo+Pg0KPj4gQnV0
IEkgdGhpbmsgdGhlIHBhdGNoIGJlbG93IGRvZXMgZml4IGl0LCBhbHRob3VnaCBpdCBhYnVzZXMg
dGhpbmdzIGENCj4+IGxpdHRsZS4gTmFtZWx5IGl0IG9ubHkgd29ya3MgYmVjYXVzZSB0aGUgNjRz
IEtVQVAgY29kZSBjYW4gaGFuZGxlIGENCj4+IGRvdWJsZSBjYWxsIHRvIHByZXZlbnQsIGFuZCBk
b2Vzbid0IG5lZWQgdGhlIGFkZHJlc3NlcyBvciBzaXplIGZvciB0aGUNCj4+IGFsbG93Lg0KPj4N
Cj4+IFN0aWxsIEkgdGhpbmsgaXQgbWlnaHQgYmUgb3VyIGJlc3Qgb3B0aW9uIGZvciBhbiBlYXN5
IGZpeC4NCj4+DQo+PiBTYW11ZWwsIGNhbiB5b3UgdHJ5IHRoaXMgb24geW91ciBzeXN0ZW0gYW5k
IGNoZWNrIGl0IHdvcmtzIGZvciB5b3U/DQo+IA0KPiBJdCBsb29rcyBsaWtlIHlvdXIgcGF0Y2gg
d29ya3MuIFRoYW5rcyBmb3IgdGhlIGNvcnJlY3QgZml4IQ0KDQpJbnN0ZWFkIG9mIHRoZSBwYXRj
aCBmcm9tIE1pY2hhZWwsIGNvdWxkIHlvdSB0cnkgYnkgcmVwbGFjaW5nIA0KcHJlZW1wdF9lbmFi
bGUoKSBieSBwcmVlbXB0X2VuYWJsZV9ub19yZXNjaGVkKCkgaW4gZXhpdF92bXhfdXNlcmNvcHko
KSA/DQoNCj4gDQo+IEkgcmVwbGFjZWQgbXkgcGF0Y2ggd2l0aCB0aGUgb25lIGJlbG93LCBhbmQg
ZW5hYmxlZA0KPiBDT05GSUdfUFBDX0tVQVBfREVCVUc9eSwgYW5kIEkgd2FzIGFibGUgdG8gZG8g
c2V2ZXJhbCBrZXJuZWwgYnVpbGRzDQo+IHdpdGhvdXQgYW55IGNyYXNoZXMgb3Igc3BsYXRzIGlu
IGRtZXNnLg0KDQpEaWQgeW91IHRyeSBDT05GSUdfUFBDX0tVQVBfREVCVUcgd2l0aG91dCB0aGUg
cGF0Y2ggPyBEaWQgaXQgZGV0ZWN0IGFueSANCnByb2JsZW0gPw0KDQpUaGFua3MNCkNocmlzdG9w
aGUNCg0KPiANCj4gSSBzdXBwb3NlIHRoZSBvdGhlciBjYWxscyB0byBleGl0X3ZteF91c2VyY29w
eSgpIGluIGNvcHl1c2VyX3Bvd2VyNy5TDQo+IHdvdWxkIG5vdCBjYXVzZSBhIGNyYXNoLCBiZWNh
dXNlIHRoZXJlIGlzIG5vIHVzZXJzcGFjZSBtZW1vcnkgYWNjZXNzDQo+IGFmdGVyd2FyZCwgYnV0
IGNvdWxkbid0IHRoZXkgc3RpbGwgbGVhdmUgS1VBUCBlcnJvbmVvdXNseSB1bmxvY2tlZD8NCj4g
DQo+IFJlZ2FyZHMsDQo+IFNhbXVlbA0KPiANCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmgNCj4+IGluZGV4IDk3YTc3YjM3ZGFhMy4uYzUwMDgwYzZhMTM2IDEwMDY0NA0KPj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oDQo+PiArKysgYi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgNCj4+IEBAIC00MzIsNiArNDMyLDcgQEAgaW50
IHNwZXJvdW5kX2hhbmRsZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOw0KPj4gICAvKiBWTVggY29w
eWluZyAqLw0KPj4gICBpbnQgZW50ZXJfdm14X3VzZXJjb3B5KHZvaWQpOw0KPj4gICBpbnQgZXhp
dF92bXhfdXNlcmNvcHkodm9pZCk7DQo+PiArdm9pZCBleGl0X3ZteF91c2VyY29weV9jb250aW51
ZSh2b2lkKTsNCj4+ICAgaW50IGVudGVyX3ZteF9vcHModm9pZCk7DQo+PiAgIHZvaWQgKmV4aXRf
dm14X29wcyh2b2lkICpkZXN0KTsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2xpYi9jb3B5dXNlcl9wb3dlcjcuUyBiL2FyY2gvcG93ZXJwYy9saWIvY29weXVzZXJfcG93ZXI3
LlMNCj4+IGluZGV4IDI4ZjBiZTUyM2MwNi4uNzc4MDQ4NjAzODNjIDEwMDY0NA0KPj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2xpYi9jb3B5dXNlcl9wb3dlcjcuUw0KPj4gKysrIGIvYXJjaC9wb3dlcnBj
L2xpYi9jb3B5dXNlcl9wb3dlcjcuUw0KPj4gQEAgLTQ3LDcgKzQ3LDcgQEANCj4+ICAgCWxkCXIx
NSxTVEtfUkVHKFIxNSkocjEpDQo+PiAgIAlsZAlyMTQsU1RLX1JFRyhSMTQpKHIxKQ0KPj4gICAu
TGRvX2VycjM6DQo+PiAtCWJsCWV4aXRfdm14X3VzZXJjb3B5DQo+PiArCWJsCWV4aXRfdm14X3Vz
ZXJjb3B5X2NvbnRpbnVlDQo+PiAgIAlsZAlyMCxTVEFDS0ZSQU1FU0laRSsxNihyMSkNCj4+ICAg
CW10bHIJcjANCj4+ICAgCWIJLkxleGl0DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2xp
Yi92bXgtaGVscGVyLmMgYi9hcmNoL3Bvd2VycGMvbGliL3ZteC1oZWxwZXIuYw0KPj4gaW5kZXgg
Zjc2YTUwMjkxZmQ3Li43OGExOGI4Mzg0ZmYgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMv
bGliL3ZteC1oZWxwZXIuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2xpYi92bXgtaGVscGVyLmMN
Cj4+IEBAIC04LDYgKzgsNyBAQA0KPj4gICAgKi8NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nl
c3MuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2hhcmRpcnEuaD4NCj4+ICsjaW5jbHVkZSA8YXNt
L2t1cC5oPg0KPj4gICAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPg0KPj4gICANCj4+ICAgaW50
IGVudGVyX3ZteF91c2VyY29weSh2b2lkKQ0KPj4gQEAgLTM0LDEyICszNSwxOSBAQCBpbnQgZW50
ZXJfdm14X3VzZXJjb3B5KHZvaWQpDQo+PiAgICAqLw0KPj4gICBpbnQgZXhpdF92bXhfdXNlcmNv
cHkodm9pZCkNCj4+ICAgew0KPj4gKwlwcmV2ZW50X3VzZXJfYWNjZXNzKEtVQVBfUkVBRF9XUklU
RSk7DQo+PiAgIAlkaXNhYmxlX2tlcm5lbF9hbHRpdmVjKCk7DQo+PiAgIAlwYWdlZmF1bHRfZW5h
YmxlKCk7DQo+PiAgIAlwcmVlbXB0X2VuYWJsZSgpOw0KPj4gICAJcmV0dXJuIDA7DQo+PiAgIH0N
Cj4+ICAgDQo+PiArdm9pZCBleGl0X3ZteF91c2VyY29weV9jb250aW51ZSh2b2lkKQ0KPj4gK3sN
Cj4+ICsJZXhpdF92bXhfdXNlcmNvcHkoKTsNCj4+ICsJYWxsb3dfcmVhZF93cml0ZV91c2VyKE5V
TEwsIE5VTEwsIDApOw0KPj4gK30NCj4+ICsNCj4+ICAgaW50IGVudGVyX3ZteF9vcHModm9pZCkN
Cj4+ICAgew0KPj4gICAJaWYgKGluX2ludGVycnVwdCgpKQ0KPj4NCj4g
