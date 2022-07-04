Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679A5655B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 14:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc5BL1jtlz3bsl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 22:45:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=OudehQnx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.75; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=OudehQnx;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90075.outbound.protection.outlook.com [40.107.9.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc59Z6m9jz305d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 22:44:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMJfK/i4puLVEfliUyllFqegTAHlnzDlScSu9vHYq4Bgi9EDjpWm/GNK8zJQDTTE8sPRYzYy2D9B3NlYjJdms9gA7s+1IffH1JJLrh9oVvy3gJgcekQ1HyJe9+JSCaWoZx8LzEUXdqLX0LajXFH32uIo7I05ohrbsjXenhuVkvoNCZIttJKBPa7Y4vEwOAWhGHiL/ltwqso763FqMN7tCsUVHLKbTfCaCLT5W3Z5T6MPVJ/GKedCDjapPEhwjhLE1kiMiXZQxkdP08mvX0YtnNCWooN6dTQxb8hhn17V2CfmnjPeOrzaTtuR9PBOjzBm/DwWsgs4tsx4RgyB7Sm39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXqR4Im8J72YNQ4yYp1emQZuVCqyYUNViBc9f4cBPVg=;
 b=eyGaFl5nLpV7rrtiOhKU/6Y3ADFaX7mB/vnMnUVHGpogUaWSc3cQKutPDOD9cw/J+CqPFkTkeLf2QROVnc4J7rPh2hT6QkKNEDSzh6uYZPOh4qikm38GLTiSTJbW7Jc0OkjolHK0UyyCBNw018L/v5KHiJ9wh8tjq0ptAfYLV0nrgRS7hkmGUWQijgwNxqRWPF0kzyPecXdhy2Cwya7zacwQ0PopEXgGUH07OOMH966Gmh90dF6xS4sECzXieOrYwu9fwNbHmGSRrZ6cmAdsUj3mt7QHkyxzBivHyNewja5Mp8ediaf9RHX4eMOYjxBqkaRY8AYSUFpoXIKsqgX9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXqR4Im8J72YNQ4yYp1emQZuVCqyYUNViBc9f4cBPVg=;
 b=OudehQnxdWmdTf7q/xXkRPxDWEgCE5Y62ddzKeV8dIDkjv3ruLU8qEuW60/E1AimI51+hjBS4kHLJ5+52Q3t7NAktAMv/86YTk+HB8bmsKa3tmXCcH6YQ2qdUNUs3q+tovgnepI1iFZd9kQoxOp33qGRsIvv/MmQRvrDkf8PCAUyUxI5efUWPGZqT0Sr4aUzd2u1PvbXB++ZfbY2S8KMpGDm8kkAzYRHZk99Go+I0TfyDICGNdSapOXpHyV/+wKwmZa5YMVD8sfZyRqbatlWdQDkq0sjCtUBl+oP77eExwR8ICoe0pGXaHDvAhbXtd3daAl9LJdFW8pBR8Fr53IUaQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1999.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 12:44:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:44:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Thread-Topic: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from
 WARN_ON()
Thread-Index: AQHYh/kBfzKOa0yAB0m8i9v+dp1MAq1frsEAgA5+CQCAAAregA==
Date: Mon, 4 Jul 2022 12:44:30 +0000
Message-ID: <1d0c5ebc-3f66-f6cb-998f-072bceb41c5c@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <YsLXkCMtQpxmDhVM@hirez.programming.kicks-ass.net>
In-Reply-To: <YsLXkCMtQpxmDhVM@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a18eccb4-82f3-4822-daa1-08da5dbaf054
x-ms-traffictypediagnostic: PR1P264MB1999:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XZixZFpd5kxmdmVjIORp1QxY99JaK+FeJ8bo81YQFo9hvv39LmaoZbw9HHgOyh70rqB8Iqu72QV29jsIaVZVht9Gyp69wd0piAji/xS6AIFvI/xTYkrXftfKfgNSu3ynYm738MVl6m+mcRa1Kgj8oouaWrRdAaLyNopMQdWsuXNerCOZxYbpuwWGEddQveVgnLXFhDfLwmzBjJOtd5psIHKIaLHMzsNVWFfBay1NVlBWksbA1FM/8OCEFbMwpXWyzF583ar/tnYP1dJAVh1hq9X8CZyC4z8J5600NQMwR69exWpgouEshoErK1+f6Sh1CBxpf9G/h9NKxaiBlZlfPDuAu0AOW1p9WPuQ3eWazv6PnQpnGK+zZoJOMNzH2/1APEOowd4QPawIC/WSq/w4DWTf80LZ95WQWQuBn4zwru/C7GsmIKZBFIImzh8N/2CAX/MSlfubsdixWsJufIQMicbp3oF856PvkM+celCGXPDFJjbApo+cIMHdsRojDMZt3gBy4iQ0jSEfrcdt6Ck8/Mc3UcecqhKHLuzlZyOjrCDRUYLECowuQryr6VaNS+/Y9I613Sh6z9m+sr4fczdeEI9dxeLsZOy000dO2VAE5sCN9YuchR7oG5frzn+w7l5ZDw7oddBPVXBQE+BHpDhinGLThBIT2B7SdPqtgbM2vwcgn0wC0LmZIKZ0LDwr+dCVrYcOXlrvIRw8PpfwsKTcQ6sHUMTqEPUIBVR5rESoUaTVeKes8gSYJRW2Rq4A4chxT+w5C+atCgFiPpoJogZIZ8TOMWa0zmSBEZn7jvq6MENCKFmGDrkJabya7Rb2NiTR62EmS8kUpVBmhQv4O6oASYFIJncqlYlhOEwwhE28Gm8x1PBfrdaoXBHhS3XGIasQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(39850400004)(136003)(376002)(71200400001)(66946007)(478600001)(6486002)(2906002)(8936002)(66476007)(44832011)(26005)(6916009)(6512007)(5660300002)(316002)(54906003)(76116006)(66556008)(7416002)(6506007)(31686004)(31696002)(36756003)(86362001)(66446008)(2616005)(4326008)(64756008)(8676002)(83380400001)(186003)(38100700002)(91956017)(122000001)(38070700005)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bTdFdUY5ZEpEM3I0WDBVdnFqOTYvcU1ieDU4SmFQSkRCLytYZll6dW1iUWw4?=
 =?utf-8?B?ZktlK1hzN1B0V3BuYWcvN2ZxQ2dINlZPNjYzSTdpYlBDU1dkN2NoTjdpWUwr?=
 =?utf-8?B?eFhIR2k2dUMzK2VtU0U2cDh1VlhuYlJiQ1BxMENHeEwwM0w4V2lrUEVxRis3?=
 =?utf-8?B?THRaK0Q3VFNBdFM0WnRKU3RmR0QvSVJ5cXVGRGVNR3JqNlZjT0pRemNFYXBE?=
 =?utf-8?B?MFl4S1daeUxnSkcyeHhqbkNqYkI0SzJEMEFFYU41U09vMTU5YjlZRzc1WUNB?=
 =?utf-8?B?aVFsVzRrRVQyNzAvZ0FYeTh3dDF3WjV5ZXZyWlRGMHVUcUtHTzVUcmlRTFAw?=
 =?utf-8?B?cGVHdkZlUDltRFp6Rmt3SE9pdERMTGtqVllxbmFUa2Q5YXdmQzdwTU9tSnpr?=
 =?utf-8?B?cnRiVGMzVHpPNHF3Nk9IbEp0SXZkR2dFalJENjVwSnc4N256R3Y1Sk9mTjBI?=
 =?utf-8?B?SFp5T1Z4TzllT3YvMGJVbUZjUlV4TStVT1ErZWNzN29xelk0ZkgrMVZmc2wz?=
 =?utf-8?B?dGxpd3N0cFVFREJoUXcrQWF2a0lsZkJGbDBKWkcyaks1QmJKR2MwcnFvbW1E?=
 =?utf-8?B?dkpwZ1JEMkN4YmpXR0w1Z0ZTNGMvS0E2dVFIUmVMeFl0a3dmMGgzT0tqK1c0?=
 =?utf-8?B?OHBUQUlZNnVzUkdKTXJncjhseksxNndsWWgySE83WFlKWXl1bGd5bEpjcTVI?=
 =?utf-8?B?MndPMlR4VThvYldoeFBKVUtTVXNYdWhCR2d6QjRZZ3N6YTlwRmxrSE8xNms0?=
 =?utf-8?B?VnpHUW1ObUszb3Jac1NUeWVjWGorcW5JUFNWQmg1cStkcC9uOFZBVllQQ0Jx?=
 =?utf-8?B?aVo4cXViUnpmNURCVXUrVnFrQ2dNVWhITmpBUFZKWFhrYmRvM0xXcXdVOTFz?=
 =?utf-8?B?V1FIRGVFRHRseEZWOFV0dFZ6VFJvbGpWZGNDNnZCbGRnWGZBQzBwSzlOYm9P?=
 =?utf-8?B?MFBBWlRNRmxwVzhBYWZud2hDYnRWSC84emx0ZlBnUGdkazh6VUNjSDFueGIz?=
 =?utf-8?B?WHVnV1cxWDV6aUx4eUFCQnhTZTNvaitlL1NWWHg1TDk5cGgyWVhabXpvYjVX?=
 =?utf-8?B?MERpdkV4by83K09iTGdnekV3UnlDdk0vc3FDekxUS1ByUE85QisxTmx5aE40?=
 =?utf-8?B?WXlpUWtkVnBRaWZjdnJHV1Z5dXBrWVBUeDVKZlZjbTFOd2VJNEFLTi9Cdjhp?=
 =?utf-8?B?VWxDaHM3ZnpJRURhT1JzaWZ4dVVpSGdYa0VWL3FpTEs4MWM2aFlGMitKV2R5?=
 =?utf-8?B?Y0M3VFIwTmFwbjFOMlVkRUxyRFdtbll2LzB1RDJ5M2FRcDlrZDVueStrc2Jm?=
 =?utf-8?B?ckVlRkRqaTdZT093aFhhOUg4MjErQ0pEbmdpN3lFcDZxRmh2dmNLYXdnRm43?=
 =?utf-8?B?R0Z3SnJqVDllck5NRDY5TFpRbWF3NDRiemVhZ2NOaHB0Y2oxM0FMcWJyUHB4?=
 =?utf-8?B?UDNaYU9SS1ZEYTBBaTkyclUxV21YYVNYdzhHaXFQZXZWTHdkeGpwUzZkV3Vq?=
 =?utf-8?B?eEJyS0poMSs5eEtFZUxBendmUlQxMld4NG5xVndMV2k4ditvMFNZc1pReG1z?=
 =?utf-8?B?bnFObXhnRUlmUVk4ZjB0clRYSCtrUndYRmZGcFJuYzhTMzR6MVBPeURMRWlD?=
 =?utf-8?B?c3BjWWlzcEZXRTAvdFd0N0JUejRlUG0zUXZIRzlUL0daLzBCS1NIRWZsY3lr?=
 =?utf-8?B?THpTMzBOcGlZQWJxUE8xNFIzbzhDQXErZ2pXM3JmWTBzZnp6YnFiK2lhRVlv?=
 =?utf-8?B?dWp0aVlqZ0hXdW1ma3hEZXZ3ZHBOUHcyWkI0ZDE4dXpiQmVKNGRSL2NMWGFx?=
 =?utf-8?B?OEhHUWFmV0ZabFdyN0VLQ3NselBpdVRxdXQ3dVFmTGJtN0NuMEdKclBxMkxm?=
 =?utf-8?B?RXdUY0FZeHdiNXAwU1pWd296V1hiZFpqMWNLc2JMbG1BYlZvWU5PZ0RwQWJ1?=
 =?utf-8?B?T21hQU52VzRSQlNkS0Y5YlU5ajFXd1VhZDgrK005dDJOUlByMnNkU0NrQWRy?=
 =?utf-8?B?QVNyeE0zaDEzV3VnSm43ckNQYUM5V3Y1ZFNBNTQ0cjJzdmxpUWMvUXlkdkRF?=
 =?utf-8?B?RlAzS0R4SVgyLy9QU0hidFRqK1prUFlJU3J6TCt2NW5EQ0kzcU1oSnpiU21I?=
 =?utf-8?B?OXNSeDVlamF4SlBkUlVPK3hCeDdVMldkYmQ3UjBEUTBUbG05dzBqazJBSUhx?=
 =?utf-8?Q?iqDj7N6+tnuI1fh6zLJTaXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <292BA6967DFC654E8853AD025957C1F6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a18eccb4-82f3-4822-daa1-08da5dbaf054
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 12:44:30.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMt+iKYPkFLVjsENKgfh2CJpVYBPVy65IiJpDBVylIM5rnR+s1/VVceO+eG/j+cPfH8gIGpPRolUKRZiKysZ3K1yJlHT5IFb+t6fxfgxnz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1999
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjIgw6AgMTQ6MDUsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFNhdCwgSnVuIDI1LCAyMDIyIGF0IDA2OjQ2OjU0QU0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+Pg0KPj4NCj4+IExlIDI0LzA2LzIwMjIgw6AgMjA6MzIsIFNhdGh2aWthIFZh
c2lyZWRkeSBhIMOpY3JpdMKgOg0KPj4+IG9ianRvb2wgaXMgdGhyb3dpbmcgKnVuYW5ub3RhdGVk
IGludHJhLWZ1bmN0aW9uIGNhbGwqDQo+Pj4gd2FybmluZ3Mgd2l0aCBhIGZldyBpbnN0cnVjdGlv
bnMgdGhhdCBhcmUgbWFya2VkDQo+Pj4gdW5yZWFjaGFibGUuIFJlbW92ZSB1bnJlYWNoYWJsZSgp
IGZyb20gV0FSTl9PTigpDQo+Pj4gdG8gZml4IHRoZXNlIHdhcm5pbmdzLCBhcyB0aGUgY29kZWdl
biByZW1haW5zIHNhbWUNCj4+PiB3aXRoIGFuZCB3aXRob3V0IHVucmVhY2hhYmxlKCkgaW4gV0FS
Tl9PTigpLg0KPj4NCj4+IERpZCB5b3UgdHJ5IHRoZSB0d28gZXhlbXBsZXMgZGVzY3JpYmVkIGlu
IGNvbW1pdCAxZTY4OGRkMmEzZDYNCj4+ICgicG93ZXJwYy9idWc6IFByb3ZpZGUgYmV0dGVyIGZs
ZXhpYmlsaXR5IHRvIFdBUk5fT04vX19XQVJOX0ZMQUdTKCkgd2l0aA0KPj4gYXNtIGdvdG8iKSA/
DQo+Pg0KPj4gV2l0aG91dCB5b3VyIHBhdGNoOg0KPj4NCj4+IDAwMDAwNjQwIDx0ZXN0PjoNCj4+
ICAgIDY0MDoJODEgMjMgMDAgODQgCWx3eiAgICAgcjksMTMyKHIzKQ0KPj4gICAgNjQ0Ogk3MSAy
OSA0MCAwMCAJYW5kaS4gICByOSxyOSwxNjM4NA0KPj4gICAgNjQ4Ogk0MCA4MiAwMCAwYyAJYm5l
ICAgICA2NTQgPHRlc3QrMHgxND4NCj4+ICAgIDY0YzoJODAgNjMgMDAgMGMgCWx3eiAgICAgcjMs
MTIocjMpDQo+PiAgICA2NTA6CTRlIDgwIDAwIDIwIAlibHINCj4+ICAgIDY1NDoJMGYgZTAgMDAg
MDAgCXR3dWkgICAgcjAsMA0KPj4NCj4+IDAwMDAwNjU4IDx0ZXN0OXc+Og0KPj4gICAgNjU4Ogky
YyAwNCAwMCAwMCAJY21wd2kgICByNCwwDQo+PiAgICA2NWM6CTQxIDgyIDAwIDBjIAliZXEgICAg
IDY2OCA8dGVzdDl3KzB4MTA+DQo+PiAgICA2NjA6CTdjIDYzIDIzIDk2IAlkaXZ3dSAgIHIzLHIz
LHI0DQo+PiAgICA2NjQ6CTRlIDgwIDAwIDIwIAlibHINCj4+ICAgIDY2ODoJMGYgZTAgMDAgMDAg
CXR3dWkgICAgcjAsMA0KPj4gICAgNjZjOgkzOCA2MCAwMCAwMCAJbGkgICAgICByMywwDQo+PiAg
ICA2NzA6CTRlIDgwIDAwIDIwIAlibHINCj4gDQo+IFBlciB0aGlzIGNvbnN0cnVjdCB5b3Ugc2hv
dWxkIGRvIGFzIHg4NiBkb2VzIGFuZCBhc3N1bWUgdHd1aSB0ZXJtaW5hdGVzDQo+IGNvbnRyb2wg
ZmxvdyBhbmQgZXhwbGljaXRseSBhbm5vdGF0ZSB0aGUgV0FSTiBjYXNlLiBUaGF0IGlzLCBnaXZl
biB0aGUNCj4gZmFjdCB0aGF0IEJVRyBhcyBubyBpbnN0cnVjdGlvbnMgZm9sbG93aW5nIGl0LCB5
b3UgY2FuJ3QgdmVyeSB3ZWxsDQo+IGFubm90YXRlIHRoYXQuDQoNClRoYXQgZXhhY3RseSB0aGUg
cHJvYmxlbSBJIGd1ZXNzLiBJJ20gZmluZSB3aXRoIHJlcGxhY2luZyB0aGUgDQp1bnJlYWNoYWJs
ZSgpIGJ5IF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpIHdpdGggb3VyIF9fV0FSTl9GTEFHUygpIGFu
ZCANCkJVRygpIGJ1dCB3ZSB3aWxsIHN0aWxsIGhhdmUgYSBwcm9ibGVtIHdpdGggc29tZSBvZiB0
aGUgdW5yYWNoYWJsZSgpIA0KdGhhdCBhcmUgaW4gY29yZSBwYXJ0cyBvZiB0aGUga2VybmVsLg0K
DQpFdmVuIHRoZSBvbmVzIGluIGFyY2gvcG93ZXJwYy8sIHRoZXkgYXJlIHZhbGlkIGFuZCBzaG91
bGQgcmVtYWluLiBUaGUgDQpwb2ludCBzZWVtcyB0aGF0IHRoZSBnZW5lcmljIGFubm90YXRlX3Vu
cmVhY2hhYmxlKCkgaXMgd3JvbmcgZm9yIHBvd2VycGMgDQphcyBpcywgYW5kIGFjdGl2YXRpbmcg
Q09ORklHX09CSlRPT0wgbGVhZCB0byBiYWQgY29kZSBnZW5lcmF0aW9uLg0KDQpCeSB0aGUgd2F5
LCBmb3Igd2hpY2ggZnVuY3Rpb25uYWxpdGllcyBvZiBvYmp0b29sIGlzIHRoYXQgYW5hbHlzaXMg
DQpuZWNlc3NhcnkgPyBJIHVuZGVyc3RhbmQgaXQgaXMgbm90IG5lY2Vzc2FyeSB0byBtY291bnQg
YWNjb3VudGluZywgc28gDQptYXliZSB0aGUgbm90IGVtcHR5IGFubm90YXRlX3VucmVhY2hhYmxl
KCkgc2hvdWxkIGJlIGxpbWl0ZWQgdG8gdGhvc2UgDQp0aG9zZSBmdW5jdGlvbm5hbGl0aWVzID8N
Cg0KPiANCj4gQWx0ZXJuYXRpdmVseSwgeW91IGNhbiB0ZWFjaCBvYmp0b29sIHRvIGxvb2sgYXQg
X19idWdfdGFibGUgdG8NCj4gZGlzdGluZ3Vpc2ggdGhlc2UgY2FzZXMuDQoNCklzbid0IGl0IGVu
b3VnaCB0byB0ZWxsIG9ianRvb2wgdGhhdCBleGVjdXRpb24gbmV2ZXIgZ28gcGFzdCB0d3VpLCB1
c2luZyANCklOU05fQlVHID8NCkJ5IHRoZSB3YXksIGZvciBfX1dBUk5fRkxBR1MsIHdlIHVzZSB0
aGUgX19leHRhYmxlIGZvciB0aGUgY29udGludWF0aW9uLiANCklzIG9ianRvb2xzIGFibGUgdG8g
Zm9sbG93IF9fZXh0YWJsZSA/DQoNCkNocmlzdG9waGU=
