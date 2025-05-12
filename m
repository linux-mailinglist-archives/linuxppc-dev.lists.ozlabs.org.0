Return-Path: <linuxppc-dev+bounces-8519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E7AB41D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 20:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx75m6v0wz2xlK;
	Tue, 13 May 2025 04:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747073628;
	cv=pass; b=XWsIaiwqaaSOsn0o4hSXMIw1UZeJLIMzsGIpjAsT88iWL9waL221LC8C6j/4KuYwuXQiAe8kwEbXqYIVu6kdTN8h7P5sKDXuD62ydH86KyXmRdtC+Q0iJyCgIgfrbWUmW7wM0nEgL1f5YcEe3swx6VYqammll7F1nH1PKRNqoYBJqPeesYoOIEkFjXbZ/0l5ooOKdjPRcP0rL/33gVmXoiZo4wbF7mo+OXPZdYtBraujZfErEOixAwOk9d2prc+qI2QlDPQnzqorfNVpnj8ivnchmOHdKgK0QWRf++yv56CbFf/EW6r6tRiD0yGb4OnWSNsZt0i6Z7dUgCFjksb5Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747073628; c=relaxed/relaxed;
	bh=V84czVJTnRTuP9NLpw6mzxNpwvNtGVQYWXf/f8vXEu8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NT3OWH7d8ci+/cefeRzd7MQZRzmui5wTuPdFeCdKCQfHkQtrqWCfWnNm5MwQ4Ri7tpCFfJ166wR7MPBVrzogborRITFyk2U0G8p2K0H9pKkM0m2CsVoM465gxWvvcAQoAiK39sy+5vg9MhWPoqokoqphRK7h/7GSTzXm2a35ImH0unzFo3+X9finjdk5KTOhDZ6Dr163WpovTnUSj/fQc77uJ+60Yy9IcB8/iMKtQctk5IQhI3odQEi/rAFZu12GXuUNuBGt26K/o++s9Ci2vjYW465SKFrG+dAB9T2+DM6bBDcQQI9ml8Cq3A9aW9DM740+IosVgHTyQXNi39lQxg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=OQIaDhyT; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=OQIaDhyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx75l5TDzz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 04:13:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5KMZDlGVUQib+olD6sNKky4LKGSgT9urAmhpjZaLz2LwbI0qCBxtXwnMfnIaN9jF2uOVV27T8ZJu+zZOBXVhX9EKIiqPOAGFYHkVEIK+h4b4h6NwLOIwJ47cDhZVkB4rI2EbvQx4zAcItqdp5qeTQCbhse5jZiHIGM2pF4rKUTA265f1fzhNL2x/9UM2jGKWymy8NEQ5Csx9Rdl24QaWIvAWBPTtguDHInIjapPhO21AbzcdqB8BFePFyizDXoa6Oqg0lEdFBLZnQyJP8N3pWguJWMO+E6T/P9lHy7OZrOSR82vLg7+iKyLDYry0wQMz4b/gwvBGyDoQXEgx9XB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V84czVJTnRTuP9NLpw6mzxNpwvNtGVQYWXf/f8vXEu8=;
 b=uQ6zLetZDazLhT1uW9e/jgZXFCt7W6fto0vw+z9daU60GWMOFctiC2zPxJu3TIPlJrYYW+hfYroFC28/5LWg0hN5cHhmvGuMAUahpWEr60GpAFIQf8D7WqmjSrfTJoyUkHWIu8Giu93DZQYmLdmXBQHL03ojr14Z+QvQ/cBFlcjEDRN0zog3KLipFIGyaQOBFkLqqA2DJcTAoIOkSVPtbSysjCsMCS4/Ag6Jk1lvXhkM4mMrdV77e+IVwJ0huJk4qYtoYJnMBXXYizQHQc8nulxvJnfUT3LddcEkRJgpzF2knhx3RdsCUihUaYf0u8QDS5zLMD+6vnoHNRC7BY3zYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V84czVJTnRTuP9NLpw6mzxNpwvNtGVQYWXf/f8vXEu8=;
 b=OQIaDhyT+uRswezUDqBStGbuj25Zr08gVCydhpUqrxHnI5tEcnap8Nh9u9zkF9+gVdnjatu/3+NBUzFPqKodaf8pDQfMDxSZYY3wFl+Y5bG6SbRDtmcDXEPEPFlBjVcgmWKHSY1Y51WX8bcFWWfI+WZr7xGpu1zFfWoZhug0Pef5ztf+crv7I70Sa35vfZ/KB1BBMzkbwW4Pt8s06vUV5aIyNGArVNYONTQOuMT5MGEtyGeaWogwiRYW+i8VCdoJs9HViaztd9O3+tetE3SQ8eaxq1jgy0+K+0LxyzsVIDO1AXo7lMsmSbvjnDGua38AjkAcSSP8ro0WNtBNwk7isg==
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com (2603:10a6:208:ed::33)
 by VI1PR0701MB6942.eurprd07.prod.outlook.com (2603:10a6:800:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 18:13:21 +0000
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a]) by AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:13:21 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Crash in __do_IRQ with gcc 15
Thread-Topic: Crash in __do_IRQ with gcc 15
Thread-Index: AQHbwUvuWBilynjsS0WjxgWvPd1MdbPPUHuA
Date: Mon, 12 May 2025 18:13:20 +0000
Message-ID: <8bbd9fc6-8edf-46e4-952a-0a4da0a0660c@cs-soprasteria.com>
References: <aB6teOoVLWkdvyBu@bruin>
In-Reply-To: <aB6teOoVLWkdvyBu@bruin>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB6196:EE_|VI1PR0701MB6942:EE_
x-ms-office365-filtering-correlation-id: aa5b2a7f-d652-475d-3879-08dd9180ad90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Uys0aXVyVG13ckZtalQyR2JFZkFVYk9BbTNXY1RGRHdWK1FyZUVVay9EVTQv?=
 =?utf-8?B?Q1BSTW9wRzJhSGMraTN3SHAwU0ZDSVpPSTFHNSt2NCtnVWtEdVhaMFBja29i?=
 =?utf-8?B?NkNBK1NqbHpFT29rTWt4L0dwTVRRSHc3K2dLVHp4WWlXbmxvbWE1OHlzZHRw?=
 =?utf-8?B?TXMzZDM1RGVVOGg1VFFLMEhwRXpBQzJEWXVza25IOFA0bzA2c0svdUJjZmdW?=
 =?utf-8?B?Y0k2YVVRdXpSd09uSTNIeGdoM2VmNWxoK3RwUkV2c0FPblVpL041YWJBUEFj?=
 =?utf-8?B?cWVEdDd6NXBmNVBIUHFyazFJYy9PdUY0VGNQdjRGSkMzaHR1V2FnR09kWERu?=
 =?utf-8?B?YStRSFU4dndmT2xDb3N6Y3g2RVlsVVhDUlFOL3lMRmUwYTVTZ2poWmZtRFpo?=
 =?utf-8?B?d1oxRnM4ZWRmbXpISVFSWmZ4OTMrTmFUYXFRYVFpQ2xMZ1FLU3ZqVEMzNENp?=
 =?utf-8?B?QUpSUEVmR2M1b0JRTFJBSlJiOGtQY21HKytJZUY2UXUrSTZIWCttZzhIWngw?=
 =?utf-8?B?TmdsYVlwMDk1UllSbW92VGdXcnRnVkdoSWpQMVhZRnc2MEtKMGRzR0FDdW9X?=
 =?utf-8?B?WEUwR29naHVYRFpoQ2JOMHB5TzUwb2dyd0dsbUVOTUdUU1FJUTZ3YW1SQkFo?=
 =?utf-8?B?TWsxR05DTEU2ajNmZHFab0NkaXpWOUFCZXhVSXhDbEJyTlU2cTcwNkpVRmFQ?=
 =?utf-8?B?R0Ixd1Q5ajkvc3czNjk5MldpUTJ1bjd0R3hCZUR6OHFSaDN1QWY2alJORXB4?=
 =?utf-8?B?bzRCdlI1V2NvdjhwSWllVzRpamdlTm45UEJLRXpVUGIwTmREajhaZHZ1SDJ5?=
 =?utf-8?B?WGE3OGVrcmJHTXZZWXNNek5kalBEMThqdThzOEI1NlMvUEFIUW1oYjlVMERF?=
 =?utf-8?B?bnNyMkNpcHltOEFpakc5U1JWYmR2OTVxOTNoam1FelA5dHEzZ2ZkTU4rK09R?=
 =?utf-8?B?TWVsbnRhcWlvdDFWN3VseWVMWFZiNVgweEp6Q3hxVWdMUmRVWVVqdzN2OWNJ?=
 =?utf-8?B?WkN3dXg1emNzbDcrTmxzNVMwNDZrcjU4a2d1K1RjNnVRNlB1WUEzT0tpNjVT?=
 =?utf-8?B?YWpybkFpK3MrZmxFamdCNHJNSjA1UHJ5ejZhemJZZllKaSs3QmxuNTZQM29U?=
 =?utf-8?B?YW0rQmVCNVF0dmJzemc5anp4eGlDZUlWTll0MGQzNHR0TTd2dHNyVXp5NHgr?=
 =?utf-8?B?cXF4QlJXS3NIYUhvcXFjUEhHcVJiVWNPdmVWVEhPUkJTL0FHcTBDenRTZklP?=
 =?utf-8?B?Nk9HK0VPY29WWTF1N1NUbUtUT2dsS2RTR3BVNGxuOURhZ1Z1YnFYMVd6N0c3?=
 =?utf-8?B?cjQ5ZWNLTWorWER3RCtSL3FUbjd6RmRSeDdNWmZIVUlyTWxvNHdMcUdMQ0dQ?=
 =?utf-8?B?NTRQUUwrbTNPT1JLeTkxbzJVRm4wdDAvWEV2ZjB2V01aV2Y5d2VyOCtZSFhx?=
 =?utf-8?B?U3MvcjZMNEhvcktoNVluTUtYVVkxMlhOcFJKZGdMZk9Pdk1GZEduNGpKNDIy?=
 =?utf-8?B?MmkwenFYWnF6ZWFSTExETnpNYzFOMjNQN1NOQWhIYVZTRXZqdlN1dVJ6SHZu?=
 =?utf-8?B?TVN0TUJDdVczeVRzZGsraFNaU3RTTHA1T0tkZWg3dDkrMDJmQXhUd3lRbW1n?=
 =?utf-8?B?Q2FWMVJlKzJkUVBjbFpYM0JvRy9GcWpHYVRMZEdPN2kvMU5qS09sSjM5QXpK?=
 =?utf-8?B?cXVRbVlPeERrWUhBcWpmQy9hTUxpeG1EVVdHRDJQemlOSmRoaDQ3bUtJNnNk?=
 =?utf-8?B?c0UvdjBrbWJBN2o3QWQyUUNXVGk4R3dMTm5DYmI0NnlGVmFlTUVzZXVydkQ1?=
 =?utf-8?B?RGRINW5td1RxWS9lYXgwcUk2eHNjRDEvR3oxdnlsSFBQamVhc0dHZzg0QTho?=
 =?utf-8?B?Mm5kdUphS3B2Z3gwOVZYRURWOWk2Zi9wSFlYa25tSGpBczhFU2puRndVV3oy?=
 =?utf-8?Q?t2MiaYFW2j8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB6196.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0c5RGhXMy8wb2VmRkV4VlN0SmlkUjM5LytQdFdxb3Y0UlA1a2M1OWt6TDhD?=
 =?utf-8?B?Z2tzcHNKS2xGalJXKzF4eWYzQkxaSy9vcGRQcU03NzhzcmVxOGxQcXFEN1da?=
 =?utf-8?B?aGg0NytRUXRrTWt4em9jQVgrN005MVYwbzRUNWpwYkJGY2FWVnhGaWpVNnlY?=
 =?utf-8?B?dEhvTkNjY3NJRjNNYjljYWR4KytBQU01MHo2S1habHF0bGV4NkZTbHF0YVhq?=
 =?utf-8?B?dUhka3JLOGVLRlpKVTdMbTVRb3Zjaml6SDRGdklub2FWZEU5aTZSSFZFQy9t?=
 =?utf-8?B?Mm1rRHhkK2s1VzUyQUxwaTNKeGRRWHZnUFF4c2w0TkZNelB2QkF4dERUM3dJ?=
 =?utf-8?B?dm9ZQTk4U3ZOZHdkY3BzSFgzMm85UVYvMzlMUVRoMW80M1MyOXdPTHg1NU1L?=
 =?utf-8?B?MWFlZjZkT2wzOGE0WHNZQmZzTnlLYXdwS0hQd3BTWnFtVVZwSnA3ZjZLYW1o?=
 =?utf-8?B?dUp4cCsrbG9QNThvS2N3aHpKK1dNd0tWU1k1djVOK25ESklvZUxLMGtaeFA1?=
 =?utf-8?B?Y2pkRVFxaThCMjNoQ1RLeW9FNGtGeUR6emxBTDBranhVWWlYN1VkdTZaYUtz?=
 =?utf-8?B?VkNmak1ITXBoa2d3QjVLWjVVaWZCL3JTUGo1VCtJUDNvaHB4OWRQbWJzRWVX?=
 =?utf-8?B?cHNyOFc5dmVJT1lWVE93a3B0M1krNGlESjhORExaeERhUVJSSTVmYmlGK3Y4?=
 =?utf-8?B?YWczZXZoT2pJZFNaL3BxQ0Y4TkNpSzFkemlnMldyZU1uVGJucjZBY0EweEFu?=
 =?utf-8?B?SHp1WFhtL2UwSENaSnZIc290REhEVFpkeHlCTk1oUVRWQmVzbEg0Q2ZtYlMz?=
 =?utf-8?B?OUZFM290cThPeS9vKzNtTnkxaWJVWjhGdy85d2lvTElDUXd5V3A4S2ZsSW9v?=
 =?utf-8?B?a2xhVFVPQ3BEUkJYNkJiRXprcE5wZHdOWFBTK1dESG5Nc0NWNlBsZ0dON0pC?=
 =?utf-8?B?aHFXUFZmQnpBUURGdnh1N0ZCUTZYK1l5bW5JRXkxanVMU3E2Vm40azYzK1Zs?=
 =?utf-8?B?WmU4RGV5Z2FPVms4czZrbG5hMTBVY0phRlFSYWdSVlVjWGo1WEMvZHBFdVRH?=
 =?utf-8?B?dkZNTWg5TW1oajJHNVhxV0ZNQW9nZ0UxZHlXclJVNmFnR1NJNVBLNFY1eG1R?=
 =?utf-8?B?ZkVjclNTRmg5WlduQzFOb05JeDNEdnpoelFoM2pSZWJkNGl4ME1ndDE1d1VB?=
 =?utf-8?B?N3A2U1JKWnhmbkVnTWZLTk9ETklwR091aHphZi9JY0VCZXVQdTJlUEJqWHN0?=
 =?utf-8?B?YXhxTmFQK0F4VlNXZUF2M21VaEI2cFJSY1hZVkEwb1VrVGowTFdxNjd6TjdK?=
 =?utf-8?B?K1RmYTdlbno3VktMU0pwKzNTdmY2SktwRTdkeTlxUHo4eFFjODl6dFN6V2NQ?=
 =?utf-8?B?UXpnbkc0bEM5cnpkNTM4a0VkbTJmWk9URkl4bzJKNnFJSXF5VVdsNG14Ym12?=
 =?utf-8?B?NjA4blN1VlZYMkpqQ09LVGNUQnEzSXVRM1c4WmNUbUFGMktPUFV3Z1IvZGdV?=
 =?utf-8?B?bUk5L3JOZjUyZ3VxVkhpNnJVSlArRVQxbEVFMWMxR3RvUTVhckowUFk1aHY0?=
 =?utf-8?B?VGhQRVl2aVgvc29MT1ZSbmh2Tlk0QkdnRVBZWHYxbjIvL3kvWlpMV294eXRW?=
 =?utf-8?B?NW9oS2hGVnVCb0Y1VElYMnpZTG9KZUY2U0sybFIzeTNXWktiRDF1VG1sdlhn?=
 =?utf-8?B?aEV0Z2I4b3ZYRDhlMjV1ci82Rlk5amhralJLK3RURGJ1SElOOEl1aVF6M21X?=
 =?utf-8?B?SzF4Yy9ERnFuYURXTXJwTnhNcHV6eUNBTXloWk9TclJIZldkb1FTOHJYZHhy?=
 =?utf-8?B?QldRekNqSTBXNkEvY0JEalFJbmJ3L0U4VnVHTjJsb2JHQ0JOSUZ4Nnp6Sjg2?=
 =?utf-8?B?VUNpdjRPZHdNSHNaajlPVXRrUGZNT25vM3JpTllOcjhCcDNFOURGcHRiWFg3?=
 =?utf-8?B?YUxJRkxlVXM1aE5qdXVuUjVsaW82cU9COC9TaFV5TEg5dXNwREo5S0VjNE5X?=
 =?utf-8?B?NXBSd2Q1NUNmWVZBbVd1VEVHNjJ4M012c0UwNktjS2Q0ajhHdHRIakxzb2Qx?=
 =?utf-8?B?bnBjaVpZc2ZUQ0xFUWtiMndVSEVJSlBLalQvcjIyZzM3eGgzcVBQdVBJcFN0?=
 =?utf-8?B?NEpsNmQyRDRoR3BqNmRaaXhyaDlkeng0NDdsY0hPUDZqcjB2czFtVGFKQ1dX?=
 =?utf-8?Q?yVsLU5QKtQILJjjDeMK5EyI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7324F8179958874B88CB4A12DB8ECC53@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5b2a7f-d652-475d-3879-08dd9180ad90
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 18:13:20.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ehkBfyQxFtB14A3lIpWVWiCo5s8qHr5TjrFiNGE7HZrdyYCtc0SF92MOgr9SSD6rds4o0tG0jFon3GbCfCjyinHCw0MarY5QOrCEyHTyTktF4dYVE2mmTE6bIBZWam2Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6942
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 92.184.102.25
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: VI1PR0701MB6942.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgQXJuZCwNCg0KRG8geW91IGtub3cgd2hlbiB5b3Ugd2lsbCBiZSBhYmxlIHRvIGFkZCBHQ0Mg
MTUgdG8gDQpodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rv
b2wvID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCkxlIDEwLzA1LzIwMjUgw6AgMDM6MzUsIFBh
dWwgTWFja2VycmFzIGEgw6ljcml0wqA6DQo+IFJ1bm5pbmcgTGludXggb24gTWljcm93YXR0IHdp
dGggYSBrZXJuZWwgY29tcGlsZWQgb24gYW4geDg2LTY0IHN5c3RlbQ0KPiBydW5uaW5nIEZlZG9y
YSA0MiAodXNpbmcgdGhlIHBhY2thZ2VkIGNyb3NzLWNvbXBpbGVyLCBpLmUuIHRoZQ0KPiBnY2Mt
cG93ZXJwY2xlNjQtbGludXgtZ251IHBhY2thZ2UpLCBJJ20gc2VlaW5nIGEgY3Jhc2ggbGlrZSB0
aGlzOg0KPiANCj4gWyAgICAwLjE0MTU5MV0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BV
cyAuLi4NCj4gWyAgICAwLjE2NzYyOF0gQlVHOiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBkYXRh
IGFjY2VzcyBvbiB3cml0ZSBhdCAweGMwMGEwMDAwYmU4ZDYwMDQNCj4gWyAgICAwLjE3NTQwOV0g
RmF1bHRpbmcgaW5zdHJ1Y3Rpb24gYWRkcmVzczogMHhjMDAwMDAwMDAwMDBmY2I0DQo+IGNwdSAw
eDA6IFZlY3RvcjogMzAwIChEYXRhIEFjY2VzcykgYXQgW2MwMDAwMDAwMDEyZjc4ZDBdDQo+ICAg
ICAgcGM6IGMwMDAwMDAwMDAwMGZjYjQ6IF9fZG9fSVJRKzB4NjQvMHg4NA0KPiAgICAgIGxyOiBj
MDAwMDAwMDAwMDBmY2NjOiBfX2RvX0lSUSsweDdjLzB4ODQNCj4gICAgICBzcDogYzAwMDAwMDAw
MTJmN2I3MA0KPiAgICAgbXNyOiA5MDAwMDAwMDAwMDAxMDMzDQo+ICAgICBkYXI6IGMwMGEwMDAw
YmU4ZDYwMDQNCj4gICBkc2lzcjogNDIwMDAwMDANCj4gICAgY3VycmVudCA9IDB4YzAwMDAwMDAw
MTJkZTAwMA0KPiAgICBwYWNhICAgID0gMHhjMDAwMDAwMDAxMzVkMDAwICAgaXJxbWFzazogMHgw
MyAgIGlycV9oYXBwZW5lZDogMHgwMQ0KPiAgICAgIHBpZCAgID0gMCwgY29tbSA9IHN3YXBwZXIv
MA0KPiBMaW51eCB2ZXJzaW9uIDYuMTUuMC1yYzEtMDAwMDEtZzcyYjczNzM3ZDQ4My1kaXJ0eSAo
cGF1bHVzQHRoaW5rcykgKHBvd2VycGM2NGxlLWxpbnV4LWdudS1nY2MgKEdDQykgMTUuMC4xIDIw
MjUwMzI5IChSZWQgSGF0IENyb3NzIDE1LjAuMS0wKSwgR05VIGxkIHZlcnNpb24gMi40NC0xLmZj
NDIpICM1IFNNUCBUaHUgTWF5ICA4IDIyOjIwOjM0IEFFU1QgMjAyNQ0KPiBlbnRlciA/IGZvciBo
ZWxwDQo+IFtjMDAwMDAwMDAxMmY3YjcwXSBjMDAwMDAwMDAwMDBmZDUwIGRvX0lSUSsweDdjLzB4
OTAgKHVucmVsaWFibGUpDQo+IFtjMDAwMDAwMDAxMmY3YmEwXSBjMDAwMDAwMDAwMDA3ZGI0IGhh
cmR3YXJlX2ludGVycnVwdF9jb21tb25fdmlydCsweDFjNC8weDFkMA0KPiAtLS0gRXhjZXB0aW9u
OiA1MDAgKEhhcmR3YXJlIEludGVycnVwdCkgYXQgYzAwMDAwMDAwMDAxYzJlYyBhcmNoX2xvY2Fs
X2lycV9yZXN0b3JlKzB4NjAvMHhjNA0KPiBbYzAwMDAwMDAwMTJmN2VhMF0gYzAwMDAwMDAwMDA4
M2M2OCBkb19pZGxlKzB4ZDQvMHhmNA0KPiBbYzAwMDAwMDAwMTJmN2VlMF0gYzAwMDAwMDAwMDA4
M2UwOCBjcHVfc3RhcnR1cF9lbnRyeSsweDM0LzB4MzgNCj4gW2MwMDAwMDAwMDEyZjdmMTBdIGMw
MDAwMDAwMDAwMGNjN2Mga2VybmVsX2luaXQrMHgwLzB4MTQ0DQo+IFtjMDAwMDAwMDAxMmY3ZjQw
XSBjMDAwMDAwMDAxMDAwZWNjIGRvX29uZV9pbml0Y2FsbCsweDAvMHgxNjANCj4gW2MwMDAwMDAw
MDEyZjdmZTBdIGMwMDAwMDAwMDAwMGJhNmMgc3RhcnRfaGVyZV9jb21tb24rMHgxYy8weDIwDQo+
IDA6bW9uPg0KPiANCj4gV2hhdCdzIGhhcHBlbmluZyBpcyB0aGF0IGdjYyAxNSBzZWVtcyB0byBi
ZSB1c2luZyByMiBhcyBhbiBvcmRpbmFyeQ0KPiByZWdpc3RlciwgYW5kIHIyIGhhcyBhIGxpdmUg
dmFsdWUgaW4gaXQgYXQgdGhlIHBvaW50IHdoZXJlIF9fZG9fSVJRKCkNCj4gY2FsbHMgY2FsbF9k
b19pcnEoKS4gIFNpbmNlIHIyIGlzIG5vdCBpbiB0aGUgY2xvYmJlciBsaXN0IGZvciB0aGUNCj4g
aW5saW5lIGFzbSBpbiBjYWxsX2RvX2lycSgpLCBpdCBkb2Vzbid0IGdldCBzYXZlZCBhbmQgcmVz
dG9yZWQgYXJvdW5kDQo+IHRoZSBjYWxsIHRvIF9fZG9faXJxKCksIGFuZCB3aGVuIHdlIGNvbWUg
YmFjayB0byBfX2RvX0lSUSgpLCBpdCBoYXMNCj4gYmVlbiBtb2RpZmllZC4gIFRoZW4gd2hlbiBf
X2RvX0lSUSgpIHN1YnNlcXVlbnRseSBkb2VzIGEgc3RvcmUgdXNpbmcNCj4gcjIsIGl0IGJsb3dz
IHVwIGxpa2UgdGhlIGFib3ZlLg0KPiANCj4gQWRkaW5nIHIyIHRvIHRoZSBjbG9iYmVyIGxpc3Qg
aW4gY2FsbF9kb19pcnEoKSBmaXhlcyBpdC4gIERvZXMgdGhpcw0KPiBzZWVtIGxpa2UgdGhlIHJp
Z2h0IGZpeD8gIERvZXMgaXQgbmVlZCB0byBiZSBjb25kaXRpb25hbCBvbiB0aGUgZ2NjDQo+IHZl
cnNpb24/ICBPciBpcyB0aGVyZSBhIGJldHRlciB3YXkgdG8gZml4IHRoZSBwcm9ibGVtPw0KPiAN
Cj4gVGhhbmtzLA0KPiBQYXVsLg0KPiANCg0K

