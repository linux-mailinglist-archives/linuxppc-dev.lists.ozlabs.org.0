Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BE872A13
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 23:19:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=l4y3u5En;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq93K0xKjz3vdq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 09:19:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=l4y3u5En;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq92V3k59z3dT8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 09:18:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyU+if6IRfQ2RWFlHj4dO/Bu54xT3GroPjqex80JFUUy2saZSd/SPDEaHOLDEDcEteKs7HQdNTh5pceG8/DTAERVv7BPTuNLGBWLyJqYEqHFc0112wnqLtn4IbAyCzhLDAIKKnDEAIJTQP0ay08xOJjxah2q6QJDphSfVgshOqJ6BvtPcxdLnqMRhAdXnBSjnDo58J1cMhoUihkBoXPPZqk74Hr9AVzp1OXa48qQOuM3WRhaXiJ6dEazoBt3jf/R70gJb4Kc7jC8c5CrtzHf5Fpzbu/KWFviyw8qxaO+NESCBqft8ngHay15egthbJlNiP7e6p1r0epqADf8syQlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5elSsm/ccjyOSl0pNyeZfJUkR9cP0/om460vqd3XXt4=;
 b=R/Y4H73oMTVEQzVqwKl7PVSo1ysxWUzUsPLQCH1F8Mfl0QVRZnyb2krGsFSV1GZzSjdmjE9DFmvUGwTYlHRGFQgxkp4wXPS81Y+a7tiqZIZtRUsfFiSIC0iD+n6tUgH9pNzknfLl0gF3mljMeiXCYLXbGWy54oZOHpKHvMn/L6UNhcv+EOOGh/qOxC4mcy5+j+tTm8sbUIzGavMXczj5MHj/ROstjD9doSQuvbNuU1cXOgxqG87R6ZUaPA1sd7zXhqaM55u1TIJJJIQk0PCJwKpqG/U17pM4dC3G0YVjRvAWBSiR6ALLaiO6Nrq2SV6Rh5Xv9jEZU68FNNjiQy5MXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5elSsm/ccjyOSl0pNyeZfJUkR9cP0/om460vqd3XXt4=;
 b=l4y3u5EnHQk57yR5Q3HZOHzCxJZjqZf8womMXPGBuKesHxiBgMQy1dypfd2byzCwHYDH7iCYIsphZN1iHZXyg1Owq/+5N4PEwUkgKzfrtCWOHdLOpJaK4IVJMYK8LlOAgMONUL19Sb8UaiO+OvEFOxu2udkDUUV03PlzgdyKKF7LVSGtX+38CwIZ32cA8QLUxw7tiPBvp0w0YFNGdgW/fZHPXEGlZPvLDJDQMFshkz8dywwy1uxucQf7VLIfrlpkwn369atbC74isAlone3bayg5vk+yMe36zTZm4Yn08BbWV4sfJmmVidkcuB5Yt3Qp8YWiFzSj80kD8jXiXTfD3A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3680.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 22:18:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 22:18:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sean Anderson <sean.anderson@linux.dev>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: Re: [RESEND2 PATCH net v4 2/2] soc: fsl: qbman: Use raw spinlock for
 cgr_lock
Thread-Topic: [RESEND2 PATCH net v4 2/2] soc: fsl: qbman: Use raw spinlock for
 cgr_lock
Thread-Index: AQHaZdeC5vKcuo5tRk2VejKV5WBHHLEXaVAAgACugQCAEW5VgIAARE6A
Date: Tue, 5 Mar 2024 22:18:38 +0000
Message-ID: <63ab7b62-853c-4996-a493-465283252d5a@csgroup.eu>
References: <20240222170749.2607485-1-sean.anderson@linux.dev>
 <20240222170749.2607485-2-sean.anderson@linux.dev>
 <53b401d7-934c-4937-ab83-6732af47668d@csgroup.eu>
 <34da1e7b-029e-410b-8735-a10d6d267e2b@linux.dev>
 <6764b9c5-b61a-4f20-a41a-125d5015a3e6@linux.dev>
In-Reply-To: <6764b9c5-b61a-4f20-a41a-125d5015a3e6@linux.dev>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3680:EE_
x-ms-office365-filtering-correlation-id: 78fa626f-5d5f-418b-3f5c-08dc3d62353b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6Siu58n1TK2hfKN1qar2x9WQlh0iTlJixC6mmq3mawdaOjT2qk+MMO8DYapbxIzH9V5vwGFijxlQFizpFQ9Xl5Zb8op7xx6pimEWk7Ot9hV1HHVSEXf0IeIVn+n39ypAwKQn6oYBaX8YoDEBYD1Uu8NN5xPvsz5bZMbnClyAEtd784wVBJr5M9sid4uim2oUj00/OtvtfVd9qo1y8JEmdrZC+2U13kw8+tRd1cFbGDGmXw+Xu+nIvLnJs8yxsv4g1++qY1k8/aK2FRbSPPrqunSGAGHMdVpUxLHLsw2OBjsEwluT9R0lqMLw1x0FKQRFIR/LeCb2NxFdpJeycP0HVp9iJv4hz8h4TsE/KOFbPGl07ZaMDfZl71Sqh6q8xxkFqD17C3qX5XGRBJjDEfov3N6Xf8jfJnGN/qbLXipu8fF/zEmxVfZNgqDA8gBNbeyvrKrqbaWMlt0W/TJ+YeD0bTVjEzOGTRhxxD+PFpQT0UYYKlilYGEGhbByIlkU9RoeD/iDGBwFSls3QRzczEM+9IQjKnn4EPYyzbASEFjLA30wu+fQVZxHVJF5EakNqp06X60J0RhbUIwbZmIbN38EH0ZoCbiwIpxqoKXMy6RH3u+HqnZeb5C3SGV93eZrEobMDuUw+0v5wRYsggJP8+v3tgSOnjs7nT9cnpY6IYnKJMRux/Rcd+3LoEtMVkJq8CsKytTFVl3IV5ZCiho/yiCb5qsQn7kqFP3D/ujRHoXWWoQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RUlQVXpoRGd3WERKOEdrbWsrTWNrKzQxUHRnNXdYSTUwd3JEN3YxaWh2WXhD?=
 =?utf-8?B?b3ZtMDE3enh0RkhPSHdnd2FMQk4vc0hNcXBtT1F3bTR4U0FWUHUycGdZZ1ky?=
 =?utf-8?B?TkpBcU5FWC9EZTJLRTh6aUZwSndRYXpSYWwwMlBBSU9QdnFuQkkrbmJSNkt4?=
 =?utf-8?B?ODVjOTZ4cUFkSEt0bFJRdCtCamZTWUc1Wk9hVXU5NERFejg2M0tFQ0tPVXU3?=
 =?utf-8?B?RGlIWEtkQlpBTHdkT29iS1pVWEFTVGJiMWtyL3dNZHA2VGpQL0ovYmh0dHpH?=
 =?utf-8?B?QTY3K1d2SWFVSUFlMjV6YVJSQndWNllIS09sOExwKytWZ1IvNHh5a3RhZzdW?=
 =?utf-8?B?b0wxc1huVFRqUTVNRUxxV0RsZjNZeUJsM0M1MjY3RmRQa0JObjEwY3Z1RWVZ?=
 =?utf-8?B?UENVV3U1VWFSd2JodElUMlROK0J3Q1FNdmhISjJGR2lFQmJTenFMTlhBV3R1?=
 =?utf-8?B?c3p3Nmd0UXBYaUlrWjBRMGczRFNPeTJsdU5Pelp0M1ZPaTBjWXIvZlVDUUV4?=
 =?utf-8?B?ckNLejMzUTlOVTBZb3NGSXNvYzVuZmdQakdwdlB5c05VMlFrVmpoRDN1aVdx?=
 =?utf-8?B?ZEdEZG1SQUpWTnhoSzNTL2hkNUV4enVJRmJGTzJScW95cFRXV3l4eDhxKzhv?=
 =?utf-8?B?UXFkTm0xRDhLL3BRbWpvNzA3MkV4Rzc1dXpHRFd3L2dmYmc1aUI2Zmk2MkVQ?=
 =?utf-8?B?Y2lqTCtmb2NWWW9nWEU3MzZjOEowYUV5ZThRYzFSdllPV01wNWxyTHFuOG1n?=
 =?utf-8?B?Wnd0L0xQRHNyeEVQWko1K1JJR0s0NVpDM2VhaFh4Z3oxaUFWSVJablJPOEZz?=
 =?utf-8?B?bXNueTYzR0JPRmR6KzdtZHlrZXNVK3RSN1ZDaWdVWmtIQkFINmFrVlV5YzZz?=
 =?utf-8?B?SDRkOXpFL3QyTlF4RUIyVFpiaG83ZWx3a1g0MFNLbytTbHEwaHU2TGZDdVRz?=
 =?utf-8?B?STAvemwyTzJZVHd1TXh2b2s3c0ZJUFVwZStPYW1Pc2xiRkYwNnRiT2pYUUhZ?=
 =?utf-8?B?RlkyRS9xOGtENnhUNHRaVmNJMXM4MzRnR01FRU9GZXErRjFkMUZTL0xPWXdK?=
 =?utf-8?B?Q1NkYWg5QVJsenEwVzBGajJUbU0zaml5QXZXbGl6TjVNSDR1RGljTFp4N2h4?=
 =?utf-8?B?dXdhOURVVzJ3MG53eVdIMWFLdXVLTndta0JXcmU0aEFEa2VUMjNOR2hGSUJ5?=
 =?utf-8?B?U0dxOWlwYUk3OVlsMTd4RlVNRm90aXczYS9JVDF4cFo5akJlMGdxQko2aXBs?=
 =?utf-8?B?bWVwSm5lNG5tbGF2QktycEVQQU9adHZNcm9jNTJpSlV5UGlSS2ROUGZsYlRh?=
 =?utf-8?B?b1ptWDJQU1hFU1dKZk5ybFowNEV6dldHaENMa1BxNFc3cjhkZ3Zib2I0Q2JB?=
 =?utf-8?B?SXBsRTFFckRGdEJVMW50VWlscmtFUXRLQ2pYdm1QQmNEOUZVWGJmUGtIbkg3?=
 =?utf-8?B?ZllZKzd6WHFkckFuR3V3WlNBOXd2Q3UyRTlkUTdyRUpacGNLQXpYN05oQzZy?=
 =?utf-8?B?Z3BDb3dvUDRxTmtyQ2l6NWVZdkJSaklRRHROYTQvdEozVXlma3doYVhPRDFR?=
 =?utf-8?B?YzE3Sk4rQnJCWUJCWGJnbHk3RVp4Y2xjTlVxTWV0blc5ZVhIM0cyNHBRbXRO?=
 =?utf-8?B?SEFwb1ZHOWpQT0lWRlNsOVg5RFB2ZFozMXNhV1RvQ1Vkc3RPYVVCMXQrVFh4?=
 =?utf-8?B?NzNuVjIzVlUyUWxzOGlzNmVFbmhVUXF3ZGNZTVpZMnJDUDRYYkJVNGhOZnlF?=
 =?utf-8?B?NTl2NEN0YXRVdkswdkJySW9zQ1hSZWh6WUwwNEtZbm81RFE0ckFQVmx5UjNp?=
 =?utf-8?B?NmJvL1Faam1XL1lHT1Nsdy9hc3czWHdMMzRxc2NGcmlNc0JJTGZuTGpZcFcr?=
 =?utf-8?B?YzFia2ljRTVZK25JN1pUNlR6c1V3bjEwUWJvL3Nsb1pUVjlXdVZNeGdzajhX?=
 =?utf-8?B?Z3FlMFF2Q3pOVlVKUVZ2T05WMzdPcUpSR3VRR1ArM1NsRFQ5dHUvWE04WEc3?=
 =?utf-8?B?NHA5dE1JYW8yUHhtdVBjc25WOFlLU2ZPOXNSckJuUThPTkZ2ZE9WWXFadXEx?=
 =?utf-8?B?aWowU0JXUnFkTkxHS3pSU1duK1ZOSEV2bUJKUmtCYUdicFBPaFFtU0pDeGkv?=
 =?utf-8?B?eVNQS3UvMllhMFBwdTA0NjZnRlc5cFFZalhqajFWMFlIWXdGQkdCMTlVdTBv?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEC4E0FF6FA8D14EA82785D41153C1F2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fa626f-5d5f-418b-3f5c-08dc3d62353b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 22:18:38.8884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9CwrYB70pI/y223wufGKmdopD+SDdWbsnAk/1YGXVDcoh8Wr5BDbjrI9WnUQrcAa2a06HNfv0OaWLtRoGPjhdFuc7BGcBQlKBL5woUmPy7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3680
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzAzLzIwMjQgw6AgMTk6MTQsIFNlYW4gQW5kZXJzb24gYSDDqWNyaXTCoDoNCj4g
W1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgc2Vhbi5hbmRlcnNv
bkBsaW51eC5kZXYuIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0
dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBIaSwN
Cj4gDQo+IE9uIDIvMjMvMjQgMTE6MDIsIFNlYW4gQW5kZXJzb24gd3JvdGU6DQo+PiBPbiAyLzIz
LzI0IDAwOjM4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+IExlIDIyLzAyLzIwMjQgw6Ag
MTg6MDcsIFNlYW4gQW5kZXJzb24gYSDDqWNyaXQgOg0KPj4+PiBbVm91cyBuZSByZWNldmV6IHBh
cyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBzZWFuLmFuZGVyc29uQGxpbnV4LmRldi4gRMOpY291
dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5B
Ym91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4+Pj4NCj4+Pj4gY2dyX2xvY2sgbWF5IGJlIGxv
Y2tlZCB3aXRoIGludGVycnVwdHMgYWxyZWFkeSBkaXNhYmxlZCBieQ0KPj4+PiBzbXBfY2FsbF9m
dW5jdGlvbl9zaW5nbGUuIEFzIHN1Y2gsIHdlIG11c3QgdXNlIGEgcmF3IHNwaW5sb2NrIHRvIGF2
b2lkDQo+Pj4+IHByb2JsZW1zIG9uIFBSRUVNUFRfUlQga2VybmVscy4gQWx0aG91Z2ggdGhpcyBi
dWcgaGFzIGV4aXN0ZWQgZm9yIGENCj4+Pj4gd2hpbGUsIGl0IHdhcyBub3QgYXBwYXJlbnQgdW50
aWwgY29tbWl0IGVmMmE4ZDU0NzhiOSAoIm5ldDogZHBhYTogQWRqdXN0DQo+Pj4+IHF1ZXVlIGRl
cHRoIG9uIHJhdGUgY2hhbmdlIikgd2hpY2ggaW52b2tlcyBzbXBfY2FsbF9mdW5jdGlvbl9zaW5n
bGUgdmlhDQo+Pj4+IHFtYW5fdXBkYXRlX2Nncl9zYWZlIGV2ZXJ5IHRpbWUgYSBsaW5rIGdvZXMg
dXAgb3IgZG93bi4NCj4+Pg0KPj4+IFdoeSBhIHJhdyBzcGlubG9jayB0byBhdm9pZCBwcm9ibGVt
cyBvbiBQUkVFTVBUX1JULCBjYW4geW91IGVsYWJvcmF0ZSA/DQo+Pg0KPj4gc21wX2NhbGxfZnVu
Y3Rpb24gYWx3YXlzIHJ1bnMgaXRzIGNhbGxiYWNrIGluIGhhcmQgSVJRIGNvbnRleHQsIGV2ZW4g
b24NCj4+IFBSRUVNUFRfUlQsIHdoZXJlIHNwaW5sb2NrcyBjYW4gc2xlZXAuIFNvIHdlIG5lZWQg
dG8gdXNlIHJhdyBzcGlubG9ja3MNCj4+IHRvIGVuc3VyZSB3ZSBhcmVuJ3Qgd2FpdGluZyBvbiBh
IHNsZWVwaW5nIHRhc2suIFNlZSB0aGUgZmlyc3QgYnVnIHJlcG9ydA0KPj4gZm9yIG1vcmUgZGlz
Y3Vzc2lvbi4NCj4+DQo+PiBJbiB0aGUgbG9uZ2VyIHRlcm0gaXQgd291bGQgYmUgYmV0dGVyIHRv
IHN3aXRjaCB0byBzb21lIG90aGVyDQo+PiBhYnN0cmFjdGlvbi4NCj4gDQo+IERvZXMgdGhpcyBt
YWtlIHNlbnNlIHRvIHlvdT8NCg0KWWVzIHRoYXQgZmluZSwgdGhhbmtzIGZvciB0aGUgY2xhcmlm
aWNhdGlvbi4gTWF5YmUgeW91IGNhbiBleHBsYWluIHRoYXQgDQppbiB0aGUgcGF0Y2ggZGVzY3Jp
cHRpb24gaW4gY2FzZSB5b3Ugc2VuZCBhIHY1Lg0KDQpDaHJpc3RvcGhlDQo=
