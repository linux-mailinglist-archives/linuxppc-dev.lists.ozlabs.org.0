Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C854E9666
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 14:20:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRsGb3RrWz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 23:20:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=NN4QBQq0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f403:704b::731;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=NN4QBQq0; dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRsFp5z3Hz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 23:19:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SK/IUMPwtjQa6i2QJiHz11qPdofB3F6EGRNjNJzIapG0Mo0UitXypqlCwhxC+a+0ZXCw2oS2+KvvY+X8TxQwrRyvaayd7Fv799znkbt76uRX6eGzAB/9Mwh59n6nPeiVPN2Lkf/Zc9Breed1YWn/cUC9ahUhDsFi1tihbZJL+Ds5ZhP0RnMELqYmJWApQmFp4Lx4/D+towHf1zz+nW/9nujDAai1eETqwAYu3HIxUdARbTfUcfZ5BszSr4cOE9DfM3IHagcXGunKYE8ojXmAVAeOsTTJT25CAQr4Fw956AT+uRiQaIjbglYllrLVFCVPFWfgHzvAztaEmv/kqpfoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDNEYO6rw9tqWeIHRN5p+8Q+SmlE0nd6c4a2+Qmzj8E=;
 b=EGzCei++rNp1mWn3ifM1UxTF+eXu4UqqJid975TPiRDGpWg3Zon6nYI026XiIIKhBBHzzs9olI149WbomjSGPbRixQf+joTuCfqiyRm4Ji7bHShYR4xiPDCbMfoudiVfzG0virG/zCNOclBPFEZjrZFSHAyRZLLysvplfmg/QltAh60DfmpwyoX5uCWKO/gRtBXDrga9cLcdusOXQ/KJXx/JhCBAv6Gl+SP6LiuBRl06iN/WEIBJOzYUcGKYDw6rEvvMxFQMCoi2lBgjYmFkQzi+bJEMPl9+GatIPtS8n0cEOZeQ0t1AMvjGuQxf4TZfLny6T6GjHu3a64len+q2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDNEYO6rw9tqWeIHRN5p+8Q+SmlE0nd6c4a2+Qmzj8E=;
 b=NN4QBQq0QlCFleY/VFb0VJj089bRchGVGxVMWX+PrqaJsTD2x1inFqovBt/GmfrCtNCTkMgOL2fmLzYq56S5U0fdgdRuspo6TNq1KXtTy1c5ShnM2mk9TUqZEyf9aCq5l/Yvb9V5bbc/3xGF+UQnHsLGM5fmzyrwviV2oycrQWQ=
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SG2PR06MB3061.apcprd06.prod.outlook.com (2603:1096:4:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 12:19:12 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 12:19:11 +0000
From: =?gb2312?B?zfXH5g==?= <wangqing@vivo.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] sched: topology: add input parameter for
 sched_domain_flags_f()
Thread-Topic: [PATCH] sched: topology: add input parameter for
 sched_domain_flags_f()
Thread-Index: AQHYQom+TEWTjEaXQEaQRFsoOGwDwKzUsUUAgAAA2rU=
Date: Mon, 28 Mar 2022 12:19:11 +0000
Message-ID: <SL2PR06MB3082B464A5D719DE78893DECBD1D9@SL2PR06MB3082.apcprd06.prod.outlook.com>
References: <1648461219-4333-1-git-send-email-wangqing@vivo.com>
 <20220328115844.GC8939@worktop.programming.kicks-ass.net>
In-Reply-To: <20220328115844.GC8939@worktop.programming.kicks-ass.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 25529980-544c-b13b-37ef-bee30752780e
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d04bfd4-a00c-476c-b194-08da10b52ab3
x-ms-traffictypediagnostic: SG2PR06MB3061:EE_
x-microsoft-antispam-prvs: <SG2PR06MB30619E5D54E3A3A0478B7066BD1D9@SG2PR06MB3061.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vFEVZbYvI++6UuSDah2Qumbwzz0GlCd3/Xu3pWzBVkBUrEKhSyw0MU6XC12jry75HtxmsAKgYOpWEmLNpV4t0TVlfkOveRB9QFPC7EigN3XT9GWTCngWrX7pYrh5Ts3nstjktHxQJh3dKzz3LbmM5PHBiB7xoS1BB3kdiu6QO/VoC/XimCM0KxbL6JhWlCtU++DsNlmzI4AcsLjJp+4QlCA4SjWKaZ/3izmUq3s4F2eEneNMkgcD5To8XD2y8LrVNH5mAnD7YBDaRdB9oUfMqYL4KOoJP+sEMKZqYmcnFGgIQBUpzrUBPW3bsmMRaWW1d6YqFsyjVxtu1pTYRMNb1lKgz4yH85GbcbUTbMPcwaaghf6RlPzzV7sDIDPwolzH7pW42Eif07TjAjIWlEsYq4tXonKrXF88aeo3AEZVzpiinptqM+Dd5xtxTJBM1PsjHTrIMVUC8qV4R02iI/oVYv6FqDVlkTXLbcup9RU1eAgwZ2kXYRxg/j2M6B1QtOv/graCkrIPykI9VVTrwpAarMr8SKfvZ8r/IwYbrH5PIrxPhZtTVdb6Zd676UwGZD4FWK61adNBHHUmXtN9XbzpEH0X0ru5pwWB8mRMFk1ZpRFN8WLN6/57fNHaEXx0z+OqfcC07zwZHDvirI3YmyalK8549k/HNnhPtUdwTOlR0RS85/VG2OSBHk05BI3jluHlkHpEMxQKWQZA/7uVAktH2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66946007)(38100700002)(122000001)(71200400001)(91956017)(66476007)(8676002)(76116006)(9686003)(64756008)(5660300002)(38070700005)(316002)(66556008)(7416002)(54906003)(6916009)(85182001)(66446008)(186003)(26005)(55016003)(8936002)(52536014)(86362001)(2906002)(7696005)(6506007)(508600001)(33656002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bjdpV2RDRWVpR2hsUG1aYlFiUGtvcXlndUF0eWlaK3pTeEhzY3g0NDhxZEZY?=
 =?gb2312?B?OTROZm5PUkxOSTFRT3QvV0tMbFhPc2dFblpHZUkxcVFadWkyU2dEY1NrUDF1?=
 =?gb2312?B?bVlxbSt3SmJKOEJnTXV4K3R6ajVoMmJTNmxVbE0rR3R2TmFpamJSeWpYYjg5?=
 =?gb2312?B?a0FPL1kyYTAxQllwbXN4bFZQdUxtcEZ4VWVEU3ZzQmJnMUFFSkcyTENRd3VG?=
 =?gb2312?B?T1hyc1NSN0NlZ1BNRThqMEhGRURUSjdRbjZPeHRYYjdxRGpTTW00WTUyUGhi?=
 =?gb2312?B?d3lYK2tBVDRHUHVIblFHN0FkWDRCT0toY2xGWCtsU1hsWUUzN3FnbjRoeEoy?=
 =?gb2312?B?UWNwRnExTjJiaFhTSHZsNDZqZGhyZU5qZ1NYOFpuS1pqRHVvT2VqN3psQno3?=
 =?gb2312?B?blVBWWxxQk5oV2RrQTlaR3JVc1J5VnJqMGVmOGZzSHB1ZW13bjU2eXJoM29n?=
 =?gb2312?B?V0taQ0dyRnUxMW9sZ2FyaXdiSGxVQ1hZY2k4aGM3SFc0cWRZeHRYQksveFhK?=
 =?gb2312?B?VHJpMjVLZHQzQzU5TWhZejNVRnFZcDRNeVBZeVFqRXBkU0xENGlqRFZKTTlR?=
 =?gb2312?B?MG9oYXhYYndudlBudXBnRzdoZkM0b1dyZlhNUjcrbEFUR1B6MHNzaXIwSG5s?=
 =?gb2312?B?bjFDcXJESjV1c3BwQU5aY2JQeWlxLzNwSC9FazhQNklpVjRscWM1TFZnczNy?=
 =?gb2312?B?bXo5OE9sS0JvYkRORHRjekhaeGpKTjVYRDE2R1FaaFgyNzRpL0VoK253N1E3?=
 =?gb2312?B?Mnk5RTFQL3NIcHh1V2RpNmFidzN1SHNiY0R4Y0Zuekk1VlJzV1dkUG5NaVU2?=
 =?gb2312?B?Uk4vVEdQQ2RENG8wRExqR05rOU9ZZzFEeW9zMko2eUgzM1E4Y0l5alg5eUVQ?=
 =?gb2312?B?ZDZHdjErc1VDQzNsSXlDQWp3WEpZejVtU2l6YVJib2lkUzg5ajNBaDA0eWtK?=
 =?gb2312?B?UVB6Qm9tV25lcFRySHl6Q01obC9HWTRLY0JYNXg5UlZRdU5ycTNrdjJKenh0?=
 =?gb2312?B?TUVNNUxHREFXQ2tBUFRUUjg1UTYrcE1vMXZVZy9ZS1JIZFAzOWJnODlKTDkx?=
 =?gb2312?B?V2p4elFhcFkxZ0NsTlVVS1NVTGFPSHQ2V2JHTG95d0FFR2d4VE1TaGh1WTVC?=
 =?gb2312?B?clBMQ2FrOHY5REZyeXh1WmZMY1RmRjVLekRwUWthZmdxbVcwbHVocmZQT2M5?=
 =?gb2312?B?RUwydDNqWThVRnNhalRGQnBGNS9IZ0hCcitmVy9vb3Foc0I1bVhaRzd5SFcw?=
 =?gb2312?B?NDlMWGZ1ak1pUUh3S1oybU44Ty8xT2V6YWlCcFFLbzZSY2dMdlNCTkdKY1Q2?=
 =?gb2312?B?SzBSOHhUOFc2RzVNOUFIUGhBTHFpZWgyeVN3WldwYmFWR3o5bVlEeHVmNW5J?=
 =?gb2312?B?bjVIbEttWHpsTit2YzdMOWF4d0FUcFB2ZHRCY21YZXNPNk5waHlxbjQyREhJ?=
 =?gb2312?B?VEU5K1Zxc09KT3BPOFZvT3E1blJVdlhrb0lTNUxXWkpaK2hYQzJoRWxoeWgy?=
 =?gb2312?B?N2g0WDlKNlN6MVA1M05vQjBCWFJqRE5rZmYxdFdFeUU4TlM3eFZhbnM1TFFK?=
 =?gb2312?B?VnZSd3orbEEzQjFxeXZBQTk4QWhFcWVLcGVqUmowY1UvdFdDcU9JemRZVHdS?=
 =?gb2312?B?amo0T3JYMnQydW40MHVoQmJoM1RScTYwUlcwS0hyNDVHZG13NjI3ZW9QZDdQ?=
 =?gb2312?B?TStaUzRJVytnc2RUdTBodnl5T3EwVUFWeWZuMytmdk44dEZCemdQUWV3VmM1?=
 =?gb2312?B?ako4RW4zMktUWnNwbGxiTVBzVy83dFV6dVFQYk9yQzI4MHc2OEZvNlp0eDJH?=
 =?gb2312?B?QUdSVGxiTFo1NGd5ZVlFZkVydm9CNFBVNmJKTGxhcGRiNjY0Nm9YOXQ3L0JN?=
 =?gb2312?B?ck40RVFCNWZYbE5kSDkzdkZOR3hnUnM0TW16bTIyVkY1V3I4YzNjaUl4b0xR?=
 =?gb2312?B?L3RSYXFGWG5ZYy9Zd0hwb0VQT2RnMGlxbW1WWjUrWldEVlpIRUVXb0J4NEtu?=
 =?gb2312?B?QjBEYnZaV040b2p2TGpOcTlIVDlvVmNVeWpPRnF5QXJWUS9kaFFzckZqekVu?=
 =?gb2312?B?K3dOZm9WTlI2S0lrenY1MjZqNS9xdjlZL3RCQUpvZm9uM1I3elB6ZlBJWTJv?=
 =?gb2312?B?Y1RJN1dmdUNpbGNCWGR6cWl1YlhXV29QK3B4OGVqVnRRT1R2VDZiSFBTR0JF?=
 =?gb2312?B?UWF6Y3F4VVVtckxrdWxXblEzcDUvdlVIK1JGZmJFODVuL1NFWlZlcFBzbE5Y?=
 =?gb2312?B?TG9NRjE5a3BELzkwb1hhVDFsZFJkVmlOdXUyMmJ1Zk5FaXdxQzloM0VNc1NZ?=
 =?gb2312?Q?1d8yfxC5UKhOO23LaL?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d04bfd4-a00c-476c-b194-08da10b52ab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 12:19:11.2266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWAYaOunJ3YIYIYq8o0nUhCbCW+3k3PboIEZipVlBd3qPWy/25IDYtmahOPqMMutgjve3nMXUnyxkL3ZkQPlUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3061
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
Cc: Juri Lelli <juri.lelli@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Ben Segall <bsegall@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Mel Gorman <mgorman@suse.de>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cj4+IEZyb206IFdhbmcgUWluZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+IAo+PiBzY2hlZF9kb21h
aW5fZmxhZ3NfZigpIGFyZSBzdGF0aWNhbGx5IHNldCBub3csIGJ1dCBhY3R1YWxseSwgd2UgY2Fu
IGdldCBhCj4+IGxvdCBvZiBuZWNlc3NhcnkgaW5mb3JtYXRpb24gYmFzZWQgb24gdGhlIGNwdV9t
YXAuIGUuZy4gd2UgY2FuIGtub3cgd2hldGhlcgo+PiBpdHMgY2FjaGUgaXMgc2hhcmVkLgo+PiAK
Pj4gQWxsb3dzIGN1c3RvbSBleHRlbnNpb24gd2l0aG91dCBhZmZlY3RpbmcgY3VycmVudC4KPgo+
VGhpcyBhbGwgc3RpbGwgbWFrZXMgYWJzb2x1dGVseSBubyBzZW5zZS4gVGhlIGFyY2hpdGVjdHVy
ZSBidWlsZHMgdGhlc2UKPm1hc2tzLCB0aGUgYXJjaGl0ZWN0dXJlIGlzIGluIGNoYXJnZSBvZiB3
aGljaCBmbGFncyBmdW5jdGlvbiBpcyBjYWxsZWQKPm9uIHdoaWNoIG1hc2suCj4KPlBhc3Npbmcg
dGhlIG1hc2sgYmFjayBpbiBtZWFucyBpdCBsb3N0IHRoZSBwbG90IHNvbWV3aGVyZSBhbmQgZG9l
bnMndAo+a25vdyB3dGggaXQncyBkb2luZyBhbnltb3JlLgoKSXQgaXMgbm90IHBhc3NpbmcgdGhl
IG1hc2sgYmFjaywgc2NoZWRfZG9tYWluX2ZsYWdzX2YoKSBkb2Vzbid0IHVzZSBjcHVtYXNrCmF0
IGFsbCwgaXQgYWx3YXlzIHJldHVybiBmaXhlZCB2YWx1ZXMuIHNkX3RvcG9sb2d5X2xldmVsIHNl
bGVjdCBkaWZmZXJlbnQgCnNkX2ZsYWcoKSB0byBjb25maWcsIGl0J3MgdG9vIHByaW1pdGl2ZS4K
CklmIGFuIGFyY2hpdGVjdHVyZSBjYW4gZGVzY3JpYmUgaXRzIGNhY2hlIHRvcG9sb2d5IGNsZWFy
bHkgaW4gZXZlcnkgbGV2ZWwsCnRoZSBzZCBvbmx5IG5lZWQgc2NoZWRfZG9tYWluX2ZsYWdzX2Yo
Y3B1bWFzaykgdG8gZ2V0IGl0cyBTaFBSIGZsYWcuCgpUaGFua3MsCldhbmcKCj4KPk5BSw==
