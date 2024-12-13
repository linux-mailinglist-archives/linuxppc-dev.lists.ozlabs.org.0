Return-Path: <linuxppc-dev+bounces-4084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E989F059E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 08:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8h8t3m7Fz30h7;
	Fri, 13 Dec 2024 18:41:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::622" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734075662;
	cv=pass; b=XrtbBY1KAshUPcruhNRNSAgd9327m8FHGfMXfSJ3GAAItANlhxy807IMrpw+GHIRmJ94MJ0Eqw+4M/yIBQPJSqYrdrrvMBCT8JbPtPov4Lht+2MF11P0ebIcTtLbIsKiWsEfOFdnkF8RmWbHfFXU6t294vPTHbuq3wLu6uGABsaoxE7FB1K8OnbCufl6AWP6N3DBQoTa22VnTv8QsPiHPCK+nI5Oi1lFkgDYX/BScrS5va7e9MJGfQGqPhGk75Br4ZORk/ZuwIRAJl84NeMX2AOTuHZRcgEkqY8T/A0SDlEHIY3Agm+B2e/vrUDu3o6qRn7fFeqWH0kda3q2FewEiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734075662; c=relaxed/relaxed;
	bh=hAtu6NrZTXi6KWBX6Y6Hs/jb2z5I4RYcalticfOeG3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JKBTfY8wLPL7Gde080MBwCxzTQa5Clpf9ZE7jj+NuNkEhZBaJGsekYJk6DCX1Q9JlIXZgeH0R6+E4tKe9ayIb1qyi21ulqITt+L7v2OlZjSMyr9ZE5EMvJaDrNp3m71o3gVq6yMvZ9eKijfcoedDOCl4esZY2H3Jw2A0ZC/UJedYXwcCC62FwaE2aMHkN20wT1M7TqyF5xu4A+hJR2lKl/R8fU3UBtOpDqOoaC9DTraVNDr7psvbAKtOHAg75BFJvpEs4Tb2C6LVf7Y98BFINK3xeKF0a45x2f6vV2wz7gROVj33lLDPh1MnyJeHy+ieerWAKZpZvkRdarCwImxnxg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=0Xzz20yp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2608::622; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=0Xzz20yp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2608::622; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20622.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::622])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8h8r2Q53z30gs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 18:41:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3KgBmUb1lHHCbEwpbFU471lwoxcYhYUN2WbqhmW8zcTziRJOEyy2s5FESOU0Wx1x1pLhzzRSO1Rvw880WkI4iN9gG9Mpi/CazXLToAVZJBFzVxLTHDUiFyaZPmEmOLBlvKEsnDHgevv50o52BM2NTKYvd0CCsay8U+tbK5N1h/wcMOI4Mhir3CuWH2GxEnwFHB4dIDvu0Rc/YvPsEQbubdp4dOqw/zgitR0kNbo1/XQLCfJAZhHH2x/9BVYZCkmHAjyoayasB802XtxGskn0lEFs1KMO8FYAQCnuQJD2aIcxRzV5gtPpfs8Fkux5VAwTyOfL4WixSCGYKSugHEoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAtu6NrZTXi6KWBX6Y6Hs/jb2z5I4RYcalticfOeG3s=;
 b=LYvbL99/s+GAitJPebeOPLC9VO3rtsLqwVkYVTA53cQwFA7PYV8YR5FYwCCRr8rhKU5m/Zw1djgN3vLFPg6aQfQ0BYD93spN3UE+y2050V9L1Hz8KX9dxXXjJBKpqDNnUlwyZxXUAbmyQg4BgOg8FYd+LcZNQFY4sT4i7FkxFpWzxcPWvKGsw0H0bIpJFSoro7KZHcdszVzviqrj1cmEiNrI3KWkuqI2RPj610fS+tkAeHQq9y37OUuM+SwtoClDkrCxvc8u/j2QlUzz2HCfx3yjJYk3IglZVbW96tVuJtQF0tTYTlo/r9c2NPMshhuhxcAQZSnid/qy3RkYqfHuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAtu6NrZTXi6KWBX6Y6Hs/jb2z5I4RYcalticfOeG3s=;
 b=0Xzz20yp/tX09Mk+pP1yrn2JcsFEykXH12D80GX7ZxhFngCYrXaTEkqNiD++9tZ4EwXJhYU8DEn5CYYMEl3gH+2XIKypMpbsIXv6GgWM7Brn72Fc2cVhQMv2V3IqwzRJczI6DHV6tKLZvd3p+cN6uFgCExCsgGNM/cUCfxLgkQP7inKYy/6u7mEX+WWT9CHynZAJwOoVhB/da60Lcm0w0+XsSYZvBOkTWVsPiYZyZVN7g438kFIsDzfexbVBZ+gDbrvFI4aCTvHCdi7o/4ox/Xsctxwwboy1Kotl8Fs61Py2tCywWhXkAaLhWIHahCvfafi34O377+k3rAyOg3/m+g==
Received: from PA4PR07MB7455.eurprd07.prod.outlook.com (2603:10a6:102:b9::12)
 by DU0PR07MB8441.eurprd07.prod.outlook.com (2603:10a6:10:354::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 07:40:39 +0000
Received: from PA4PR07MB7455.eurprd07.prod.outlook.com
 ([fe80::191c:a08d:4945:6288]) by PA4PR07MB7455.eurprd07.prod.outlook.com
 ([fe80::191c:a08d:4945:6288%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 07:40:39 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "javierm@redhat.com"
	<javierm@redhat.com>, "arnd@arndb.de" <arnd@arndb.de>, "deller@gmx.de"
	<deller@gmx.de>, "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com"
	<airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 2/3] drm/fbdev: Select FB_CORE dependency for fbdev on
 DMA and TTM
Thread-Topic: [PATCH v2 2/3] drm/fbdev: Select FB_CORE dependency for fbdev on
 DMA and TTM
Thread-Index: AQHbTH2cSrRv3rHVzkCE1+lb9HsbvrLjy6CA
Date: Fri, 13 Dec 2024 07:40:39 +0000
Message-ID: <d41785b1-7246-46fa-a2e8-881a04e8da35@cs-soprasteria.com>
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-3-tzimmermann@suse.de>
In-Reply-To: <20241212100636.45875-3-tzimmermann@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR07MB7455:EE_|DU0PR07MB8441:EE_
x-ms-office365-filtering-correlation-id: e93be476-a430-488d-d222-08dd1b4970d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RE5NNWY1MWFQRVhua2ZScHZRVEZKKzdUTFZiWlgzNFAyR29oTmRyR3JhRm9t?=
 =?utf-8?B?R0FnNmdsV2UvWW1BZUR3UUFCcklpWVZMKzVMdVNzSWpQbXdBanRuRkZjZmRy?=
 =?utf-8?B?bkFxUzJ0NHR6Yis2R2xZTkd1UHQzVG13bkM4d3R5dElwc2VpaDdSMEhVVi95?=
 =?utf-8?B?LzN0M3JXRWI5QVErcVNyMHBsb0xpTFh2YUFFcXM5ZDBOSmVYWDNneFV4TlBo?=
 =?utf-8?B?Z0NPM1FpK0oxd3FrYzZ3RHU1RmliK3Y3Z0F0aUpiRHArSEd3SEtHTDB3Y09K?=
 =?utf-8?B?TXpKVmt2VXFrRXNFNTI5M3dZdVVGN2hIT2xmR0NxTDB5a0k5UWtWK2NyNHdH?=
 =?utf-8?B?SUZvY2NHSDFPTnY3bW1lb0QvVG8rNTd0WDFxOVhlbmlOeHlYREtvRlFiWElt?=
 =?utf-8?B?Kzg0dk9Oc2t6RHFmdFp2MEk1dTZqK1lFem8yd29ocWZ3SmtzUGdRMU0zd3NR?=
 =?utf-8?B?T1BPc2xkbFpFenM0MHhtTmNxNlZGMTd1Sm8vanEyZWZ3dktib2pBZkw3Wi9v?=
 =?utf-8?B?NHJGNldrb3dBZ2ZyTlVhbVlVc1RGeDdSK0hkRlR5VndZTVpvaHVNV2EzRk1Z?=
 =?utf-8?B?cE5yaGZiVjROWWwzVXhLKzhyZkx2MDR4aXBDTUZWcFhhdGNmd3pKbHFBWmdp?=
 =?utf-8?B?b1ZxcTl4WEREUkxxV3R1YTlrejlIWWU3WE1DU3NQWnRNODZBWENHUEZ1M29E?=
 =?utf-8?B?WnVONk9VL0J1disvY256MklXRlFIREJiUmJ3T2F1TzV3aDNpRElTVjB2czFQ?=
 =?utf-8?B?Z0VCQUhxV3FReXZaUlQ2bUxvbXJDcFZiT2syWFpYNld6aVZrR0o4Y0Uxamlx?=
 =?utf-8?B?Y0NPUXBQTWRtQzNGYzRiNXNCcm83NElHc2FCRjJ0VEtkNVJQVlN5aVJlcUd6?=
 =?utf-8?B?ZnhDQ0gwVisraHJWeWZxZlp4TW10cVhRSkU3b0oweHhzMVAvYW15eWJDSkdF?=
 =?utf-8?B?bkxZYjJVZTZPTGRxUkE0OXhFazNVb0ltZS9KY3dMYnhxM0VtTGtwTnc3NnhF?=
 =?utf-8?B?Ui9lTEhhVVh3RzZCU2lJRms5a05uVzNkUHhwNWlkeFlqandoRkJUcjcrb2px?=
 =?utf-8?B?STRGNUk4UEsxZFJHaVJkVnRyY2U5eDR1ZE52VzV6VDNZU2kxVmcrSzc2L0xa?=
 =?utf-8?B?NTBkbEQ2STc3a0ZId09vaU5PdGtKVDhVb3YrNEFQL2dyb0ZPZk5LRnJSWWVV?=
 =?utf-8?B?Vjl0Wlh0cmxsek5wbFJOZktuMFRWMU44cGJLSis4QVFoeG0yZFdWSEFzaFZz?=
 =?utf-8?B?L0d6dThwU0xKZUIvMUVEOHRXRG5ERG9COERRSUhGeHBwZlBYbWoyd1VrdUZs?=
 =?utf-8?B?Q3I3K0VsMFR3MmswZUFsWEtHRFRGdUY1T0I1YStzdWJIVlJ6WFpaUlhOWFc5?=
 =?utf-8?B?amxXeHBXUUdDTUZKeDRxM1psdjJnWXVVTlpjOC9mVUFIdWRZWXQ2S2R6dHN5?=
 =?utf-8?B?ME8vVzBtZk95dTJoZEdFSm1UNVNzQ3IwaGdkMEh3ckEvZEpZYkxBVTNreFBH?=
 =?utf-8?B?S1M2Y3Z4RXNxUXlJbjBsZm51cG5IMUxPKy9aQkdOUlNIWUIxc1VHVjJveklv?=
 =?utf-8?B?UHh3eFdrRjgxeU9VN0xVdHhTZ2o4YXg4NjFCb0JFOUs2aVR4bWx2bXRnZElV?=
 =?utf-8?B?ZklsbXhMRGRRQkY5TGdiN2MwK09rM1ZaMDhxSkpTRVlIZ2FVUEZBQkhrVEhD?=
 =?utf-8?B?ZUlzdVgrWURoOVNFTGZHMlZDM21OeWhtck1SSmNrenFCLzJRQ1JNTUlzU1dT?=
 =?utf-8?B?MVdBa1ZrRW5CR1V3aElXbWZPNFVuWFRvRXlhcGYzZnZyZ05DbDlhZG9iRW1i?=
 =?utf-8?B?czVKWTRZNXpRSFFyOUtkYTVkczJ1SVZDWEpBSWFBYzlNVWVkcG9BSTJxM1d2?=
 =?utf-8?Q?tuMjs9xbC6xag?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7455.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW1PTnh2anVyQlE2eHMrZGFQYzR6dlhNbys3UGdwS3c5d3hPRjBsa0k5YnRY?=
 =?utf-8?B?OVZpNDBoTVZWTmxSQ3FCc0xoY3NUVEtVZ0hXTGFscCs4bW9XTVVlRlpJZW5M?=
 =?utf-8?B?K1QwQWpTbTZ3LzRJMnhRWnBudTlLTWl6NkFPV1lNRlkxclpCZ0Nicis3VWg4?=
 =?utf-8?B?Ukdhalh1ZmEwRjMrQWZwbmYxUDRPZ0ZlZlJmTHVXUU5mRWpxejFaZnFYNksx?=
 =?utf-8?B?Y2VKZTcvblRJSjhXWkozc1VaUVFMbmYyVWJkMkFsditvayt0VjBKN1JSY0Ez?=
 =?utf-8?B?UVZXUkt3cE1vZmNHWTVuaDhMT2luRGtoNjlOc1NzcE9EdVl1a1NTZGhZbDZL?=
 =?utf-8?B?TDhiM2lRS0czNjZ3T2JzRUdCOENaZ0ZVeDJwNzJMMHhicFJQNGdUUFQ3ZmIx?=
 =?utf-8?B?RTFMQmJvVlRJUGNmYStsMXd2bXUrbmZuZ3gxU2ZNcXBNdENWdm9DNmhxdll4?=
 =?utf-8?B?MUpXOWttdGRXT2pyZ2hYVGVZenVnYVBBMS9xNG1jUTV2NG9YZXYya0JSMVFW?=
 =?utf-8?B?OUZJTGNnZXdJaFVlY2ZvYnozUnBBOENraFpXWDdCR0h4SzkzSmt3UzErb1Fq?=
 =?utf-8?B?N2sxb3R3Y2xvR1YyV2EwN0tpWElJZFdORENpZGhxZHZJbThUczZQaEdoeDRU?=
 =?utf-8?B?UlV0TkNxdm9hK3pheGhpaUQzSjNZRnU0UjB1bGhQbzNYS294REZjMG8xdWFE?=
 =?utf-8?B?MDZ5S1JHVmVJODFhSjN3by9aTjJPK2Zaa0QzMm8yWGJ4Rk9qeHFvU1ppdm5a?=
 =?utf-8?B?WGYzeVRVcGRVeXp6SVI3azYzVFBpc1BLTE53OFdEd1VPUHQ1WXpqeWZFRlN1?=
 =?utf-8?B?Zm41T3JSbGV1cXFreitoZVJreE84Y3NjalFvSGF4bXc4V0Vic0kzZUt3aVZs?=
 =?utf-8?B?S2ZKdCtJWi93QmVqTy9JNENwTEloVzNoZ29aVHo2c3NMTi9Cd3lzYXJHZnpO?=
 =?utf-8?B?VVNaZEZQaUMrRUlpWml3eHZWWFZCY1F5Y2NLeEt6em1GcE5qRVJQbTFsYllm?=
 =?utf-8?B?WVZYMktKKzdKaXFnTFpERzJENkZLdzAvaWI5VjFxZ25Kak1FSlZFKzc4UzE0?=
 =?utf-8?B?QUlJRFlHc1drOERVcUd4eHNFY1JXcnpOeG5YQm90eHJoNWR4ZGp2UkQzMXhv?=
 =?utf-8?B?WHpSemczL1lpNFNUS05PdjRZQWM1eEd0UWZhZ2lKRmx2Z2o0WDNQRU9UWSt5?=
 =?utf-8?B?Q0NiWitqbU5kN2IyRzFLT0xVOC9OaHptbi9qcFZWM0lpK01pZWs0RDhKQzEw?=
 =?utf-8?B?TXN1NmFITzR4YzFsWFJ6NWxIYWc5M244MitmbnY2ZGlqaSszSG5vVHB1Qmhp?=
 =?utf-8?B?anRJa1JXOTgvOFVxb2FGNlJ0Wnhua2lORGUxS1lzSnBkUFBBYWwzNWlGZGlH?=
 =?utf-8?B?YlMzL2hzZjdTdWdwT1BLSUl3emNBVXh1RjNlMUdySzJWdjkrRTQ5blZWWDMv?=
 =?utf-8?B?cjNmaDdZQmRONDJsdWZ0YVNHa1VaKy9lcVNPb3M4bklKQTVHTkhKcnFUVURO?=
 =?utf-8?B?QlAydUxMeGRDY3VIUVJGbzhwQ2QzTThqSzZ5OTBoOTN0YzJJcXR6YXg2a040?=
 =?utf-8?B?YVJuaUE1NFZVT2ZiclF3NHNIZGNoZmYzZEFoL1FwU2k5eERwUU5jaGVPRHlD?=
 =?utf-8?B?bGNrTy9OS3hMb3I5eWhNNWpYaGVLUTc5SDU0YkF1cFNDUmFHU1lBQ2UwaXph?=
 =?utf-8?B?ZnFlNWtQWVMrTDkrYnlGQjlxZ2dDV0phR2xIRnJMN1MrOStSdi80RVAxQ1Bi?=
 =?utf-8?B?R1BOL2dWNEhja29XRjZmRXlGMkNwVXJDUjY4TFhkS08rNDRJalp1WlE4Umow?=
 =?utf-8?B?TWx6RFo5YzR1M0F6aEQrS2srVWU4QWF3cUJ4T2FkdGJveGQvT3hzUzhuVzlQ?=
 =?utf-8?B?N0RzMi9LZzJRT1diR2VRM2hBbkxUMXdPenltMm9zb2RFTXh1NnF3dm9NTkcv?=
 =?utf-8?B?bTEzWnJBR2JCbEMrNlYvT3VCNnhOWnhzVVhRZnA2NWI3VWZPUEQzeW11cG44?=
 =?utf-8?B?Zkg5aS9DM3VIMmMrRmdSOUoxR0kveU8wbXFFSlFHa25USlVMalY3ZURSVnlh?=
 =?utf-8?B?VXBUNTBqemdLRTBmVzk0QXZKZWlmaHhFR2RKWU1NRnRzRXlyNzJ1Zi9uNWxS?=
 =?utf-8?B?Yjd6MFUzUnBrZVVzRjRFaU4wek5Rd25rMEgvRDd4dmlCTTd0b001QUlCOEt2?=
 =?utf-8?Q?XNdvgMuJy59iTpWuZoD+M8E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE93DE28E35DA64189995322D362762B@eurprd07.prod.outlook.com>
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
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7455.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93be476-a430-488d-d222-08dd1b4970d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 07:40:39.5389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3J+T2eIlKHXCpYe1qHM/+uW4MM2yk/kxKyIAeLgHAiJXcXO8DWlq9qvC+Sh7zHxxf072FlQ6p6aLMe0u9k90/qpzemuVJ4LkAfZ6BPNAL7Y8dV6naeCpY87TVHM29V6t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8441
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: PA4PR07MB7455.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DU0PR07MB8441.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

DQoNCkxlIDEyLzEyLzIwMjQgw6AgMTE6MDQsIFRob21hcyBaaW1tZXJtYW5uIGEgw6ljcml0wqA6
DQo+IFNlbGVjdCBGQl9DT1JFIGlmIEdFTSdzIERNQSBhbmQgVFRNIGltcGxlbWVudGF0aW9ucyBz
dXBwb3J0IGZiZGV2DQo+IGVtdWxhdGlvbi4gRml4ZXMgbGlua2VyIGVycm9ycyBhYm91dCBtaXNz
aW5nIHN5bWJvbHMgZnJvbSB0aGUgZmJkZXYNCj4gc3Vic3lzdGVtLg0KPiANCj4gQWxzbyBzZWUg
WzFdIGZvciBhIHJlbGF0ZWQgU0hNRU0gZml4Lg0KPiANCj4gRml4ZXM6IGRhZGQyOGQ0MTQyZiAo
ImRybS9jbGllbnQ6IEFkZCBjbGllbnQtbGliIG1vZHVsZSIpDQo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBMaW5rOiBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MTQxMS8gIyAxDQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9LY29uZmlnIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCg0KQnVpbGQgZmFpbHMgd2hpY2ggcG1hYzMyX2RlZmNvbmZpZyA6DQoNCiAgIExE
ICAgICAgLnRtcF92bWxpbnV4MQ0KcG93ZXJwYzY0LWxpbnV4LWxkOiBkcml2ZXJzL21hY2ludG9z
aC92aWEtcG11LWJhY2tsaWdodC5vOiBpbiBmdW5jdGlvbiANCmBwbXVfYmFja2xpZ2h0X2luaXQn
Og0KdmlhLXBtdS1iYWNrbGlnaHQuYzooLmluaXQudGV4dCsweGMwKTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byANCmBiYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyJw0KbWFrZVsyXTogKioqIFtzY3Jp
cHRzL01ha2VmaWxlLnZtbGludXg6Nzc6IHZtbGludXhdIEVycm9yIDENCm1ha2VbMV06ICoqKiBb
L2hvbWUvY2hsZXJveS9saW51eC1wb3dlcnBjL01ha2VmaWxlOjEyMjU6IHZtbGludXhdIEVycm9y
IDINCg0KDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+IGluZGV4IDlhYmI0MWRhNGUzYS4uNTVjZTYxYTQ2OTg0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vS2NvbmZpZw0KPiBAQCAtMjkzLDYgKzI5Myw3IEBAIGNvbmZpZyBEUk1fVFRNX0hF
TFBFUg0KPiAgIAl0cmlzdGF0ZQ0KPiAgIAlkZXBlbmRzIG9uIERSTQ0KPiAgIAlzZWxlY3QgRFJN
X1RUTQ0KPiArCXNlbGVjdCBGQl9DT1JFIGlmIERSTV9GQkRFVl9FTVVMQVRJT04NCj4gICAJc2Vs
ZWN0IEZCX1NZU01FTV9IRUxQRVJTX0RFRkVSUkVEIGlmIERSTV9GQkRFVl9FTVVMQVRJT04NCj4g
ICAJaGVscA0KPiAgIAkgIEhlbHBlcnMgZm9yIHR0bS1iYXNlZCBnZW0gb2JqZWN0cw0KPiBAQCAt
MzAwLDYgKzMwMSw3IEBAIGNvbmZpZyBEUk1fVFRNX0hFTFBFUg0KPiAgIGNvbmZpZyBEUk1fR0VN
X0RNQV9IRUxQRVINCj4gICAJdHJpc3RhdGUNCj4gICAJZGVwZW5kcyBvbiBEUk0NCj4gKwlzZWxl
Y3QgRkJfQ09SRSBpZiBEUk1fRkJERVZfRU1VTEFUSU9ODQo+ICAgCXNlbGVjdCBGQl9ETUFNRU1f
SEVMUEVSU19ERUZFUlJFRCBpZiBEUk1fRkJERVZfRU1VTEFUSU9ODQo+ICAgCWhlbHANCj4gICAJ
ICBDaG9vc2UgdGhpcyBpZiB5b3UgbmVlZCB0aGUgR0VNIERNQSBoZWxwZXIgZnVuY3Rpb25zDQoN
Cg==

