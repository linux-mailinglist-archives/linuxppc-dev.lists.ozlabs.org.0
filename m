Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B4563128
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 12:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZB1c0zL3z3cMq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 20:16:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kOoTarWb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.74; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kOoTarWb;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120074.outbound.protection.outlook.com [40.107.12.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZB0p6t4lz30Bl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 20:15:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxUzIG0ynPRDwqHrTyl/Mu4VUHpYx0Y4jiDtBGWKop8ycdPTA9rBFToQP1xU5y1+m9EUHQIZieNfYmAn7o/vdaFSKFPTDCTf1Kp0U54kUWaOdyL4bspsh5MtzU6DRcDxqC6dQ77xDPMijfGQW9ZQL3jFtS6jgwyqkRenbQIQwR7DUK/xPat39KpzmpPq3mIFaY/oWn/oMtj/n40QhhGmiVZ1ILUWOwVndUR3SiBDRVGXtPs52ajwkXZfl/J6EMYmEuk1sWiwTVINWcdxOYpyYuLnBKnWl1GHgYCkouDKM64kPfuEFsnARm/8YSPns/zMpUaTE47Bm80og03tQJzCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocCRJjkqO7buL2mBeRsOB2SD34qpk9FTwN+Vhknt944=;
 b=SGazAHxv28n3ZYElqCHMsenA2/8CTuALwK7tGz0L4M9Xc6QGNSn+D3j+H7EgnXIoaFQambjgpwG8d085heQlOk66ozjaftNqAzUl0celOidKFgaONgKKxKuNovh0xTWv4wFpS5UUhzdVPaR5xccZHvniYj+LcwSl0cctPqOnSPlT0gcGy/YKaBxgSioyKSvYEKolX2dmkrjuuVSZt3jxZzg6xyw3ckXkfN6ZD1zkTM9aHK1rWRSAOoG11XQwLs6IhoTcCzeKex+d5NrDSoLmjf9X5X7ZU3Jwuqd32mOWoMFRKyUWvA2GPuGBWzXGNqA6T75JnOUKoWkJwDz5Dq1Gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocCRJjkqO7buL2mBeRsOB2SD34qpk9FTwN+Vhknt944=;
 b=kOoTarWbm311rSmr09ZcB00dh4HbqjQkq6OO7bmsU2sbzClCV9oWaLI4kTYcsTnBxTwKoOq9GYspA44g3YXC6NSIEuskOQK5bRnZpBH2ti6oyWOU8OZXFZ14TO6rumwL/at5K3SSbJmq02ymX2/oNNi0ift/+eANC0po5YdOg8SHzqufuLzPmOhFZgCXYtechJozwflEqeivKJ4Gmea5ue0vOb7HOyUn4uH0B5LjI9Fu84yZrbBO3Mo+m41DSqovxdV3Agfxk8H3bXL7X4BZ08h62e13BYlUbtwMJKHqHkKEogwv5K1ZM3hsl6KayU9cMlmyfHYNMsf7cH/rM8vY7g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3759.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:142::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 10:15:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 10:15:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 08/13] powerpc/hw_breakpoint: Avoid relying on caller
 synchronization
Thread-Topic: [PATCH v2 08/13] powerpc/hw_breakpoint: Avoid relying on caller
 synchronization
Thread-Index: AQHYitZo2ef+XoeA/keVuMHbOZq9GK1pOsOAgAANBYCAAAl3gA==
Date: Fri, 1 Jul 2022 10:15:17 +0000
Message-ID: <45396b77-4acb-817c-eeae-9a672a92611c@csgroup.eu>
References: <20220628095833.2579903-1-elver@google.com>
 <20220628095833.2579903-9-elver@google.com>
 <045a825c-cd7d-5878-d655-3d55fffb9ac2@csgroup.eu>
 <CANpmjNOeyZ0MZ_esOnR7TUE1R5Vf+_Ejt5JRQ1AoAmhkCrVrBA@mail.gmail.com>
In-Reply-To:  <CANpmjNOeyZ0MZ_esOnR7TUE1R5Vf+_Ejt5JRQ1AoAmhkCrVrBA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e66d82a-4ea9-4191-7136-08da5b4a98e8
x-ms-traffictypediagnostic: PR1P264MB3759:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /ZvgGXbY30ZUl0+WciWToYiBqnw+jH+n/7aMH0SVNDmgFzXuMAP+IAa1dglBwFbIqOhluckt7gXtaqwMbq4k5bUGprPOuSXFuqRFESH/3yfz/flX/YoVDu02O+/HBUzPs2YN4/M1N2hZIdoD3ZI/OvxeKomEwtmfBISf+2aJz2IdteU4z7rKp8m5OUXuDNxZ0+oq3EHcf8lV4OGj/XZeR9vv2C6rDqNFIz/m53b7UUxuXFMJApFUtzG8KaJRYFTaawcp3YzruuYJm/Tc9MWAM0CObVM0g7fC2V+w7kz9uMfxDG4JNwu0tTKKJWTiajvcFmB//+2R381b3/OBXVn/cmsQjcjXPaZrk+P9vxJT+olgOi4+hKObwZUv6OoSoEkQmIilfKhyqGE9WOUiLQvVgw197IFKgHjPoV+9MlOtwAJUV0qwBWszLziUwGXQcIWwdWg1aKuCDqZz67F1HyAEqZULAg7pr/ayD1tEiPSLSGwpBSqEmfrJpU+cqXjjeUoSRu06bQGrRv7DlDQv3lU7+a7kRHv2Ubw3o136V/vYVqpaqHm7iVQGXND3oGDz/TSnEgfQsceN8/hbsCBFeTDt4bAAabGGzoezmM/feM32Vt6/4cghCQ7wjUM2UprQy3meyp6hmNbvoH7qoJzUXu+oNc1mgO63pR//9dahjHCnrjcGlm6sYtEeJjQFH0zX9WGHZ9GQO8FlUtbKpnObS0ImlquXrWWqyHmMnl5XoPeq8ye9VF46+HQKII23ogUfLncWB1VXRZzOx20RpsPlZj2+tgCHmKdM1NrkvEeodmznbGGawFTiZf9AaHcVxDQ5rNJdRtde+E1WlaTCrZk6n/rQTW8TvwiUJ4SfrKhAsAcQQFNDN+DluT1qhiqQlyScQG4v55yMBOBDfceTsqNjNK4wjjMSKokcvdqkX5UdhHx3JvU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(66446008)(66476007)(4326008)(478600001)(64756008)(91956017)(8936002)(38070700005)(76116006)(66946007)(8676002)(66556008)(966005)(6486002)(2906002)(7416002)(83380400001)(41300700001)(44832011)(5660300002)(71200400001)(36756003)(2616005)(6916009)(54906003)(86362001)(66574015)(6506007)(31686004)(122000001)(31696002)(38100700002)(186003)(6512007)(316002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WUJXK3NKYjZpYXhIMlNzTUw5eTI3OUNSWHdRUHlaZHFYMnprekVlK2JaeDds?=
 =?utf-8?B?WmM5c2hEZzcyN2NNRFNsRDZ1VXQxU0MvNStLMFJRd095TlFRYkFYR1BjVXFV?=
 =?utf-8?B?Ym5sZDRKWVBMdDVaaW9BVnUxZWRpQksyVVFFbmNpamhNOW90WjlkSzkzaWFP?=
 =?utf-8?B?aXBmQThTK1F2bXZNUmFGQ0huR1EyYTZ4bzFmcC9lMG5vMi9nSmE3WnV4R2M4?=
 =?utf-8?B?am50VFAzeTV5RmlDYk1YRHpLSFBRUm02ajhLWG14SjhMS2xvRVVjZE1ydFBO?=
 =?utf-8?B?anpFTC9hMVVzSE80V3E4YjE3N0FSR2UzUzFmdVY1bEtjcnNHbDF3ZitoMlpV?=
 =?utf-8?B?UXUxbFR4VS9ZRk5iUEtvc0Q5eHBCZGgzS1FlMHNVRVJiZC9QQ3J4SG1YaVRv?=
 =?utf-8?B?SnFvUHVFcjk4RncyVSs3QTV1TWpjdEpaVEw4K3VpZlplRXhOdEJibm5tdm54?=
 =?utf-8?B?TjRETDBUbjFBSGZVRU8xQTJjaFR5K0dmWEZYME4zNkF1UnpLSHFwcEw4cTZN?=
 =?utf-8?B?T3dyNng0azRUNUhkNjVyYkFtQWFpUkNkcGVnSXh2eldXc2U3SUEvNXhtTlFF?=
 =?utf-8?B?SWdqUjRtZitFY1JoV05vemloL2tPbWtFL2hnbDYxSGc2Z2xYT1MvSXEzWWl4?=
 =?utf-8?B?MjRxRWZxRGpnd1Nza015eFNyS01DT2oyRk1KdTVLMVJmVzlOVDMwOTc4V2ph?=
 =?utf-8?B?RmFYeEM4SnFMZGJLVDFSVTJjbkFja2RhUjlxZCsybk12b25OQ0MycFBEMmRy?=
 =?utf-8?B?UStlSzJrQ1ZxeHZ5UDV4STJwYU91TzZkOVY2aCtyUFplWDc2TGNJS3lQb3Jy?=
 =?utf-8?B?V0RQRWF5bEJBaElqTWV4cCtsOGxvZHNYaUkyTVlnb1E2T1RjdStxcENwakFq?=
 =?utf-8?B?WlhwNWhoYVd0WERxZUROL3ZNRThQMTRuM3BZLzNQNnFFWWx1bElseFY2OHZz?=
 =?utf-8?B?REU2NDUrYVV4M1NmMjNoMGYxWFR1NmFiajlEOGZ1YjZHRkZUTTROaGVmV3l4?=
 =?utf-8?B?MGk2UGtqQ1l5bGowMUJzNnYxNXRyY3BSeTYwVjRLeWdZS3VxMTBYVW4yYURa?=
 =?utf-8?B?SWFwRXBsUjhCNkZEb1hNZWw1bDg1UUU0VXpQeW11MzZvbGZoSmdJYmZMRmg4?=
 =?utf-8?B?Wm5GaHdpdUIrT2htUTZTYXIvcnlobzdVYkxUS0tuaG0xUExjV3dqZ0wzN0Vr?=
 =?utf-8?B?WXpGbnMxeVV2Sms4dDZTelZpRjloYVdyRHZwVlV6WE4vMHB6QnRINXdsZFNr?=
 =?utf-8?B?d3NiMDBDNkFyR3hTOUozRkJialFha0pSVGhxSGNiMjIyREhYU3IrK3BkeUx4?=
 =?utf-8?B?TE1neWM4ZUpVZnNSSjIrSEZHdkJDQXdFZXB0VTJMM2ZieEoySFhNYkNPc21S?=
 =?utf-8?B?TFZNb1k4Zjk2bjZ2L0RUVUxvdndVdkxyZ0dxUGRpOTlrTlpHYldPZjl4aStH?=
 =?utf-8?B?TG9KV250THp6dzhES0ljdnVCU1B5Q08vMlpNU0IvSjdpeDcrbVRVUFFuQnZ0?=
 =?utf-8?B?ZFprNlV0YWVNc3NYQWVXWkV4SDIrbzA4WDQyQWFqTmpreHlzZGtuRmRObXYx?=
 =?utf-8?B?cU8rTmhPSDN1WFpNU1JRelVQamR6YUoxbW5lM3BBMWVDK2VOVmd5WWp6L0N2?=
 =?utf-8?B?MGkzalVyQ2JPakQ5bjlxV0lXUnVHaGM5S1BKOG1jUUtPQzVLSmF0Q09ZSENL?=
 =?utf-8?B?SzhkdWVibU5xYWV3Q3Nxajd6eGlvNjN5MzduVmw1ek5WaHZIVGExNjBMNVpa?=
 =?utf-8?B?L1RKVnhIOWlIZGNuUGVCYXpOSnMycENjeFpib0dvbHhRUlpqZzVBZHcycm9K?=
 =?utf-8?B?SVdJdkVaZm9FN2hpZU1SQVpkNmYvM2Juc3N4bWJ1K1k1S2RPN1pCNmVTWURU?=
 =?utf-8?B?ZUVzL3ZyaVZNR1cwaGRxRkppTFUvcVpIK0w4Sk5QbTBQanl1R0hvS1lkVFBz?=
 =?utf-8?B?RVJlb1R5ZVVtYWgxcXlkZUZWS3p3dGR2WC9sNU5SdjlybVp2ekg5ay9WZXhZ?=
 =?utf-8?B?TEJ3bm9vMzBsbzVEUmJvQ1M5Tk82NG9mSkJOWHBFUlNmQ1RxSFE2VmI3OHo2?=
 =?utf-8?B?SXVGK2s0T1QvTTRCSmpSL2pSWm9WSWdJQ2drcVpQMys2RGxBdDZuWXVDbzlJ?=
 =?utf-8?B?VHAxb3d5emMvRUdOUEdKYUE1OHJIT1I3cEE5ZjhBaUJSOVRqNFZ6RWpVazEr?=
 =?utf-8?Q?38SpEZ26RKfZbNvpcQ5tpd4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48A37FA002C14C49A2E2CA16C8FCBF9E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e66d82a-4ea9-4191-7136-08da5b4a98e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 10:15:17.7268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgiqtQZuNzk+4zMt2P7lEbskDMOTOOfh7GX87C3rGGSWKCv/sLcNa6Zg22pPcTejz4eYQL4KCl0Osx2sGptt5zEGlsgRbrzVFLRyhkme+9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3759
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
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA3LzIwMjIgw6AgMTE6NDEsIE1hcmNvIEVsdmVyIGEgw6ljcml0wqA6DQo+IE9u
IEZyaSwgMSBKdWwgMjAyMiBhdCAxMDo1NCwgQ2hyaXN0b3BoZSBMZXJveQ0KPiA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+PiBIaSBNYXJjbywNCj4+DQo+PiBMZSAy
OC8wNi8yMDIyIMOgIDExOjU4LCBNYXJjbyBFbHZlciBhIMOpY3JpdCA6DQo+Pj4gSW50ZXJuYWwg
ZGF0YSBzdHJ1Y3R1cmVzIChjcHVfYnBzLCB0YXNrX2Jwcykgb2YgcG93ZXJwYydzIGh3X2JyZWFr
cG9pbnQNCj4+PiBpbXBsZW1lbnRhdGlvbiBoYXZlIHJlbGllZCBvbiBucl9icF9tdXRleCBzZXJp
YWxpemluZyBhY2Nlc3MgdG8gdGhlbS4NCj4+Pg0KPj4+IEJlZm9yZSBvdmVyaGF1bGluZyBzeW5j
aHJvbml6YXRpb24gb2Yga2VybmVsL2V2ZW50cy9od19icmVha3BvaW50LmMsDQo+Pj4gaW50cm9k
dWNlIDIgc3BpbmxvY2tzIHRvIHN5bmNocm9uaXplIGNwdV9icHMgYW5kIHRhc2tfYnBzIHJlc3Bl
Y3RpdmVseSwNCj4+PiB0aHVzIGF2b2lkaW5nIHJlbGlhbmNlIG9uIGNhbGxlcnMgc3luY2hyb25p
emluZyBwb3dlcnBjJ3MgaHdfYnJlYWtwb2ludC4NCj4+DQo+PiBXZSBoYXZlIGFuIHN0aWxsIG9w
ZW5lZCBvbGQgaXNzdWUgaW4gb3VyIGRhdGFiYXNlIHJlbGF0ZWQgdG8NCj4+IGh3X2JyZWFrcG9p
bnQsIEkgd2FzIHdvbmRlcmluZyBpZiBpdCBjb3VsZCBoYXZlIGFueSBsaW5rIHdpdGggdGhlDQo+
PiBjaGFuZ2VzIHlvdSBhcmUgZG9pbmcgYW5kIHdoZXRoZXIgeW91IGNvdWxkIGhhbmRsZSBpdCBh
dCB0aGUgc2FtZSB0aW1lLg0KPj4NCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy9pc3N1
ZXMvaXNzdWVzLzM4DQo+Pg0KPj4gTWF5YmUgaXQgaXMgY29tcGxldGVseSB1bnJlbGF0ZWQsIGJ1
dCBhcyB5b3VyIHNlcmllcyBtb2RpZmllcyBvbmx5DQo+PiBwb3dlcnBjIGFuZCBhcyB0aGUgaXNz
dWUgc2F5cyB0aGF0IHBvd2VycGMgaXMgdGhlIG9ubHkgb25lIHRvIGRvIHRoYXQsIEkNCj4+IHRo
b3VnaHQgaXQgbWlnaHQgYmUgd29ydGggYSBoYW5kIHVwLg0KPiANCj4gSSBzZWUgdGhlIHBvd2Vy
cGMgaXNzdWUgdW5yZWxhdGVkIHRvIHRoZSBvcHRpbWl6YXRpb25zIGluIHRoaXMgc2VyaWVzOw0K
PiBwZXJoYXBzIGJ5IGZpeGluZyB0aGUgcG93ZXJwYyBpc3N1ZSwgaXQgd291bGQgYWxzbyBiZWNv
bWUgbW9yZQ0KPiBvcHRpbWFsLiBCdXQgYWxsIEkgc2F3IGlzIHRoYXQgaXQganVzdCBzbyBoYXBw
ZW5zIHRoYXQgcG93ZXJwYyByZWxpZWQNCj4gb24gdGhlIG5yX2JwX211dGV4IHdoaWNoIGlzIGdv
aW5nIGF3YXkuDQo+IA0KPiBUaGlzIHNlcmllcyB3aWxsIGJlY29tZSBldmVuIG1vcmUgY29tcGxl
eCBpZiBJIGRlY2lkZWQgdG8gYWRkIGENCj4gcG93ZXJwYyByZXdvcmsgb24gdG9wIChub3R3aXRo
c3RhbmRpbmcgdGhlIGZhY3QgSSBkb24ndCBoYXZlIGFueSBwcGMNCj4gaGFyZHdhcmUgYXQgbXkg
ZGlzcG9zYWwgZWl0aGVyKS4gQSBzZXBhcmF0ZSBzZXJpZXMvcGF0Y2ggc2VlbXMgbXVjaA0KPiBt
b3JlIGFwcHJvcHJpYXRlLg0KPiANCg0KRmFpciBlbm91Z2guIFRoYW5rcyBmb3IgYW5zd2VyaW5n
IGFuZCBjbGFyaWZ5aW5nLg0KDQpDaHJpc3RvcGhl
