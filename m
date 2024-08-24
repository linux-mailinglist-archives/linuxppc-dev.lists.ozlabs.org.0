Return-Path: <linuxppc-dev+bounces-475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6295DD15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 11:02:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrWCT5ytlz2yDT;
	Sat, 24 Aug 2024 19:01:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::600" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724490117;
	cv=pass; b=BYQ4NJj8t/asDHBclnTG9ID0J7FOSDosEjJT6kX6PdWjr3Uq3pnpb93j+meKtm0pCnNSHHVhDa/zlSjHFucf6unYWqQ9lw1N3L67VjwAe3lEKTamygTr+0iTxLnYt+eS411Lt4v8lujO8npk7bNpa7YZp2Ukh/hOH4WnnfNb/wrI5TUjXUZO2xDK2cjqWwkPEX98qNG8Tz+pXRzo6p7lJEFA0E25DHEhqdQrshv+eJYRnjfETZgziPTC5DArlKT/UObgq2MQmbEI2OPXSV4ShOpIqON/aEhj6Ky1r99Q7asZ3inVTbYZ2JTB9kP1djYQmEgsUEYkXO7/IuN+LcttOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724490117; c=relaxed/relaxed;
	bh=qb7e1LXo7necwvWPofB7j1RKs5fWxnyLhJ+E77R+yBU=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityhea
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Cj/dSScM; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:260e::600; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Cj/dSScM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260e::600; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WrWCT0FvMz2xtc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 19:01:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKd3sHy/+Zt/MelOkyxbuCf6pMonfsZCGOk27HCVUQbh6fSroVR1j5+VHPk12KTJ8g0+LRSf49jkMNNz/HYFUKh8GIQr3xnrlbk2e/ahRT6jTgVcqxJAPO71ktSGwo/eKJtrQ1jEywOBrGHuvD8csebxeBTy33bEibwr+PjkGQLd+gkg6HcVhvB+/wPz7+20cHi5Mx1mDm4MfYpwWUueE0i+XpYzK8zEXK8skfur05aLnyB4dN44RPqmSjnwrfP52o2vdEZbYBm8rxXWu8f+vqguxeEzC3IOnXTLwnTm/5xZowpnJ/tt0UPVzCA4ZgMlx5y4XVGB6eLOp7HHJ9PiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb7e1LXo7necwvWPofB7j1RKs5fWxnyLhJ+E77R+yBU=;
 b=cLEAMttD6SLYQCskuWwJkdS0gTKeXmq3zGh25UOsLAbGX1CuVM68Vy6crKFOf0Eao8iNQL7K9XR762Mt1AR+5KqT8eAByXGdA3oIxAtH+4xgV5q3PQWO4JU2eo96DbbRtySyOpUuLqTEYPGUTv04Y/WzW63qHjDqhl4nvmzvwexOb5nst9+1U2o9onwLWMadQqEt5loYJqRXFvwMM0GuJPrLZ3YupGAX8O8fwLmUWvLdB3EY1sXHWB7ffPWPwnkJ2lweyWUovyEaF+yDjter6nCoSnbUBnOC8welHRwpoBt8Dk6rM/dm1RSvNLZ2W+lp6WwkE6cIV6d1InpkqlyNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb7e1LXo7necwvWPofB7j1RKs5fWxnyLhJ+E77R+yBU=;
 b=Cj/dSScMke+XErgS09mhvB4vcYfiSrZkEIhZjm/JCViIRNWRKP/vBlxD2Q2nlvXv4LEbZwx7ffHNDE/+7XNemM0+9LKAr7uDgtdPjfgLmDfwBX5fUjQSfR7utVZDKu4ddmb61uDb7cziVU0oGq7/SEv1yLagyr8ICnf7HaDvwGs16dx66gsBx8q9aWIwVe0XtyvWIm9T1ixfh8wXwDUu/w+tezvTfftLAt9acTer+isU2VYV/JFuX12SIqcdlczO6e2qP+SCMRxUmVptbneWAnME+g8nmd7yiwWclVdDsRIkIR2dx9O3bjl3Bu8501Nwk+cSzFO2iISZVwbgGYFjMg==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by DB9PR07MB7996.eurprd07.prod.outlook.com (2603:10a6:10:2ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22; Sat, 24 Aug
 2024 09:01:34 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 09:01:33 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Segher Boessenkool <segher@kernel.crashing.org>, Christoph Hellwig
	<hch@lst.de>
CC: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Stan Johnson <userm57@yahoo.com>, Finn Thain
	<fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Thread-Topic: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Thread-Index:
 AQHa9Br4BDSvPR8oAEC/NyES9AV4E7IyvxcAgAACGQCAABKwgIAB/lAAgAANr4CAAFqlAIAA5bMA
Date: Sat, 24 Aug 2024 09:01:33 +0000
Message-ID: <c8127b03-245b-4eaa-98f5-6e14df094669@cs-soprasteria.com>
References:
 <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu>
 <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de>
 <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com>
 <20240822053238.GA2028@lst.de>
 <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
 <20240823130600.GI28254@gate.crashing.org> <20240823135459.GA28487@lst.de>
 <20240823191924.GK28254@gate.crashing.org>
In-Reply-To: <20240823191924.GK28254@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|DB9PR07MB7996:EE_
x-ms-office365-filtering-correlation-id: be44a024-ab36-46d8-b3cb-08dcc41b5a53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eVp0WnVjQVFiSmJ2UHhvWjdlaTJXcDZXWW92Mm5obzNsaVRHQWdacVVxZ25X?=
 =?utf-8?B?ajVmV2x6am5RRkFBY0xoYlZLUEg5VklPdVZKSkNYUmxmWGFJcFlCbUtUMVVt?=
 =?utf-8?B?U3FMRFdLYkJTTTdBVndnMUNOY0RnUVJ3ZU5QcW0xdTZkSStWMEFscjdCUXBI?=
 =?utf-8?B?SC9DSGxvS2hYY0VkbzZmOUF4aGFQRWdNUXQ1Z255MUZwVmZVaEppM2o2TTcz?=
 =?utf-8?B?RVVpckhZamlwS1B2NG5WVWJOcGNLZndWWlhuMFdhcGpYZDNFdTNxVktWWFFF?=
 =?utf-8?B?K0RMSnBZVjVzOHVTVjFWdE9WeVZybjZLYWJTZE83RTF3QUJtNkpCMGtLejU5?=
 =?utf-8?B?a1lkT1haeUZKZXA1MzlzdDEzdzVpYUIzbEZPK3AvMmdZOFBUREVId1RtVk4r?=
 =?utf-8?B?KzF1RDhWWk80b2VNei9rOE5Lb2wzZ1pvakQ4NUFkMFNqT0ludFllVjhuWWFt?=
 =?utf-8?B?aWtKS05iM043OUkyUDhWcWsreWd3Yy95MFFDOERQcWZZODRKdFcvTVlhUDNi?=
 =?utf-8?B?NW4rUDNQR2w4cldFc0dVc3ZNM3VzY2d2eWt4M2tsNlRGMVB3Z3VGSzRzMkdw?=
 =?utf-8?B?bGo0QVhuU2lSMm9ySEd3dVMzMmpWNUxBS1VjNjRjVFcrYnNub0NPY3U3alpy?=
 =?utf-8?B?dHVNU2phMXFFTU1SalFSd0oybGZSYmVyTVBPcDZFb3FSRzBsRTlWd0RZOVZU?=
 =?utf-8?B?MmZCQ2k4YTlSRlhQenQ3bXhUVmtGbjlTekJlSW5WYWFEcndHeXQ2b2RSZ1RV?=
 =?utf-8?B?TytacXp5VXNwVHV6dVRqL0I3WnBFTUtrNWdmbXhyUWNDWG5wbUxiY01oampW?=
 =?utf-8?B?T09NMGlrOXBkUmMyT2tUTHM5UGxTQ0ZtMnJLN25GMWc5OGlucit5QWk3djVt?=
 =?utf-8?B?am1MVFVMMFVKdHo2cFNDdG44ek03ajJiYWx5b3o5TjgzL1REcFduNWEwRHo1?=
 =?utf-8?B?eGhQVEV2ZmxTNDdXMzVFYmNhTXRjMTBTU1dzd2duOTBUK0hKREFXNG91dzZ2?=
 =?utf-8?B?S21ncTlPd1U0OVhiSHFBMGR0Ykw3VzAwM0t0TExqcHFyOTc2SElJSERvQ3Ix?=
 =?utf-8?B?WUdiR2ZyWUkxOVJwOGtDUWN5MWR6RlV4WEpMTUVvUXNxWlhuQnpxWjNlb0lK?=
 =?utf-8?B?cXhiOFY0T3BaZ1lXRjFEbVJkK040aWN5bXJYaDFMdXcvV0ZlaFY0L1IySko4?=
 =?utf-8?B?cG1WSGpXREhGYjB6SktPWG8vMHJlU3M5MTJ4dEdpTUF1M2NMWTk5cVJUUlhV?=
 =?utf-8?B?eVh6d3I2QkVzaDdFT2Yxa3BieHB0VW8xd2lMSVIya3RhdHNQUDNWZHFqNGVY?=
 =?utf-8?B?V01zRm9xOWZnanc0U3B5TG5jUkJXekEwRzBjeCtrYmovN3ZVSndqdUExNXpw?=
 =?utf-8?B?Ty9RQVFJSDdISmVlMjRkeElCS0srV0t4TFF3aGNBYUFEM1BNcW1UUkM4TmNi?=
 =?utf-8?B?WEgzQzFDRlgxQVFrQ012V3oxSHJqOXd4b0ZDODNwWGZVT01MVHl0WUtQRENP?=
 =?utf-8?B?V0RNTWQvZnpBUmllYkdDNEZCSVVJMDhWdnhWcGF5N2oxZ1FKd0RROW00NGpU?=
 =?utf-8?B?bTR2RVpLdVN5YzJDTnUzbFg2OTBnNFN6VDV4Nlg1ZTZOYTZpUCtaOXVnNkQ1?=
 =?utf-8?B?ZUtlbHlEUkx1L2IyM2tzb2dnL2pZRHQzb0NQSFBOQnc2TTluY2lRaGtWOU1B?=
 =?utf-8?B?bEg0dGpXUXhuMnlrVzN5aW10Qm82OGR2TkkzZU9jSlhnYlNNanltYy9UcEk2?=
 =?utf-8?B?Y21GREE3V2Q1Vk5OYTJralU3N1lWRk9MQnMvK2lvU2Y1dTRVRG94eG9XTnFO?=
 =?utf-8?B?TnFkMjVVemdqcFVHblpkZkdQVVY0dXppdWRKWndPK1NkeXBsWTRzVHJnZ1Mr?=
 =?utf-8?B?dHpYVWRYZXhmNWZ5Z2xpMkF5amNrUnVqejcxRVMzTGZ4b1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cW4vVmRKV1JvOXJmZHk3bHd5ZlZ2K2VQZnlmUkZFUktwVjU0bnZGZG0wUEcw?=
 =?utf-8?B?TjMvb3J0d2FPU2RSSmd3ZTVVNjB3Q1RXWnZEZEdXMkIwOVhPY2xZQWQ2RjVN?=
 =?utf-8?B?ZytFNmJ6aXRGaGVHdjRGYWpQWEFxY3JVL2k0RlQ1TzlmZXVqeTF0cGVBOElI?=
 =?utf-8?B?RWdXSXk2MDd5ay9xTDkyT05JZEZ5eTcxOWc1U0xsNXlnNEZmMkNVRDhrK0xy?=
 =?utf-8?B?U2lGMzFKTThwc2w3SllWUEVyNDBHK0RoeVA2L3p2UDQ2YmYvNlVGV1JmeTJN?=
 =?utf-8?B?amw1TEhOY3BGakswYStwMUJ5Q0RwcXFnbjF2MFIwOEV5c2crSlpSbW1JbjdY?=
 =?utf-8?B?Q1V2YWZDaEY3RjFRVmV5SHg3S1RkRmcrRUREUjNMb3Z1cW8vZ24vOStwUmMv?=
 =?utf-8?B?QnhWWktybENtMzcvRlgwZ1NtQnZUclVVcjdVcHkwaWRhSUhHNTAxeDBYazlx?=
 =?utf-8?B?N1FiWkVBa1hrd0dJaSsxZVB4dDF4bUlvb1l6N2tmWkxMNC9FaWs4QzFKeU1R?=
 =?utf-8?B?K2pyM1k4YWVaSmF0THF2cDdIUXh5SlZXRmV0cXB6eG5MUmZCbDVnVFY3cHBO?=
 =?utf-8?B?ZUUybWtjUU8rZmtNQXA4Vi9CdmhBSDNjMjlFVGNtOUhnb085MU8rVUROSzI1?=
 =?utf-8?B?cU4ySU1lcWZhWFA5U3BhTy8vdEptY0laVUlmTTFzbmpjb2hVM25xck9jZXpG?=
 =?utf-8?B?Z0d6ajVZc0NuT0ZUZ3RxZHNvNUJmNzFvRWJSS3lBN3ZTLzV3bE10U0dJeHBT?=
 =?utf-8?B?OHNqQTg0bWZ6ZWl5dWZPYmxlNFQwVnhVd0xJbjNtbFlrWGxXTDhGaVEyZXFU?=
 =?utf-8?B?YWxTVFNORGNFbUVwbC9JRElqTFFaL2NZUkFtS1RFTU9zak1mSHIwS1c4bzcv?=
 =?utf-8?B?MG9CaTVHWFFnL3lleVBoSVhJblk2cFc3aGJaNHhONDExUmdyczRXODZhd1Fr?=
 =?utf-8?B?aEtxdzArR2cxeWVHaEpEMXdERUllaUhuWTFZd3hPRndWR1BnUWptVWoyRExU?=
 =?utf-8?B?NS9YZFVsMWgyOUEwZXhxb0V6YVFwZ0Nub1YxNDF2dXUwblNRQTBKMG40a3g2?=
 =?utf-8?B?bDFockQ1UUNTVVBCM2hOR1l4SnAvcTFhNFM4TmR6UkNDWHp0dGg0TkdOSVZZ?=
 =?utf-8?B?MHpwMWYyZTkvenAzTWYxRE1kNHZIeEgrY280UFBkU3FaSmJyMlZEM0ZjNWNw?=
 =?utf-8?B?QUxxSVVtcDUvMUM3ZlBhR3VQV2FRWTBoNXhLbUd2RisrK2lFWGMxM0kwcFdY?=
 =?utf-8?B?NFB4VnVQSnRBMmg5VEkxeXlNakloSnpvRlhsODNCSjdEYTQ4S2lNWkNSbnF1?=
 =?utf-8?B?UFdMWGlGK2ZnMTZrNSt1N1dKUE52NXdoZG94RUZ6OTlyczl0dEpuR0Z6MmVj?=
 =?utf-8?B?alJqNUNoVnpheDFobklJUzZkOHFYbjdTQXh4MmFnajBUb3BGd0s4QWg5bUF3?=
 =?utf-8?B?ZWpxU2xqNUhnMldkbTRjcWcrbDAvMU5hU2hzUXRHNjJDZUdsbCtRWnAwU1pn?=
 =?utf-8?B?WXpRY2Jham5TeUMzZm5ZRWQ3eVBzcXBBSEtQWjErc3hkd2tva3FudEhKVE1X?=
 =?utf-8?B?UkJMWmgxdU1HNktnQ2gvRDl3MDdhVjVmbk1ucXk3c0dGdUhxOEh3MXhmdmtR?=
 =?utf-8?B?anppU05vSXI2YXY3cXkrQ0M0UkJZS1VjZlFxYk14ZFE5d1IxZ3JqbmtBbHhu?=
 =?utf-8?B?OWhGUGV5NEJmUnpscmYxN0V5QVVndXovRWpDbnl5cDExTE10dTNwWFpaNlhk?=
 =?utf-8?B?SFN6Z3lGMXVTdDVxTVk3aHBZODh3bFFnaldvRzZwaUtUSEg3cWNhVWVHcnR6?=
 =?utf-8?B?dU55SUEvdlFrbitaY0lqMmR2TXV5ZUJRcy9lZmU4ME1zaC93SW0ybFkwSUtQ?=
 =?utf-8?B?Q3BUYkZmdHVqcXpINktPcmJGSG9WTVJEOWFsUXdtV3czUzRJd3FWSm11Um81?=
 =?utf-8?B?cEpkUHgxNHV6aUQrLzlSVERwU0FrV1lrdk9mcWw3RFZoNUpnQzBWWnRnVDBq?=
 =?utf-8?B?d3ErVXVOZWVhMGxFMVpPemI5end0Mzl6azJseTBxY2xOdmZ3ZndRVTQvRVd2?=
 =?utf-8?B?NktWZ0xVT0NPRUordVdacHBwbWg2NnVUU053ekxEUkNWR0hXQnVnMCtzbHRm?=
 =?utf-8?B?OEVSODhDdUNiS0toMnVYK2J3VDU4cVIyOCs1YXljSzJBVmdXVTlKTGlnTFZH?=
 =?utf-8?B?YVdMWXpjRjJKOEthOUFsNUgzaFFVZVlRVHltRDN4ck5DMVFGaUhtVFBwbGFF?=
 =?utf-8?Q?tCzNhMaucqglj9uTQXqRHJuAvedDRYJEHQMBCpdnQU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9FDCB87C8DD234D83B2F435BA125975@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be44a024-ab36-46d8-b3cb-08dcc41b5a53
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 09:01:33.7928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XVAhEgi4pDlaP9RTW99LwkyXdDpWkoW3rnbdeRL2rGAc2d4CEYDZFnyTukjUBo/JH2x7JYooCasHfMTC8jUFMLaq+NBzmcwO5b9AwqU0JHEpCdDovKR8Ii4mFNcvvzD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7996
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DB9PR07MB7996.eurprd07.prod.outlook.com

DQoNCkxlIDIzLzA4LzIwMjQgw6AgMjE6MTksIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiAqKipBVFRFTlRJT04sIFNvcHJhIFN0ZXJpYSBHcm91cCBjYW5ub3QgY29uZmlybSB0aGUg
aWRlbnRpdHkgb2YgdGhpcyBlbWFpbCBzZW5kZXIgKFNQRiByZWNvcmQgZmFpbHVyZSkuIFRoaXMg
bWlnaHQgYmUgYSBmYWtlIGVtYWlsIGZyb20gYW4gYXR0YWNrZXIsIGlmIHlvdSBoYXZlIGFueSBk
b3VidHMgcmVwb3J0IGFuZCBkZWxldGUgdGhlIGVtYWlsLioqKg0KPiANCj4gKioqQVRURU5USU9O
LCBTb3ByYSBTdGVyaWEgR3JvdXAgbmUgcGV1dCBwYXMgY29uZmlybWVyIGzigJlpZGVudGl0w6kg
ZGUgbOKAmcOpbWV0dGV1ciBkZSBjZSBtZXNzYWdlIChTUEYgcmVjb3JkIGZhaWx1cmUpLiBJbCBw
b3VycmFpdCBz4oCZYWdpciBk4oCZdW4gZmF1eCBtZXNzYWdlLCDDoCBkw6l0cnVpcmUgc2kgdm91
cyBhdmV6IHVuIGRvdXRlICoqKg0KPiANCj4gSGkhDQo+IA0KPiBPbiBGcmksIEF1ZyAyMywgMjAy
NCBhdCAwMzo1NDo1OVBNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4+IE9uIEZy
aSwgQXVnIDIzLCAyMDI0IGF0IDA4OjA2OjAwQU0gLTA1MDAsIFNlZ2hlciBCb2Vzc2Vua29vbCB3
cm90ZToNCj4+PiBXaGF0IGRvZXMgInVuY2FjaGVkIG1lbW9yeSIgZXZlbiBtZWFuIGhlcmU/ICBM
aXRlcmFsbHkgaXQgd291bGQgYmUNCj4+PiBJPTEgbWVtb3J5ICh1bmNhY2hFQUJMRSBtZW1vcnkp
LCBidXQgbW9yZSBsaWtlbHkgeW91IHdhbnQgTT0wIG1lbW9yeQ0KPj4+IGhlcmUgKCJub24tbWVt
b3J5IG1lbW9yeSIsICJub3Qgd2VsbC1iZWhhdmVkIG1lbW9yeSIsIE1NSU8gb2Z0ZW4pLg0KPj4N
Cj4+IFJlZ3VsYXIga2VybmVsIG1lbW9yeSB2bWFwcGVkIHdpdGggcGdwcm90X25vbmNhY2hlZCgp
Lg0KPiANCj4gU28sIEk9MSAoYW5kIEc9MSkuICBDYWNoaW5nIGluaGliaXRlZCBhbmQgZ3VhcmRl
ZC4gIEJ1dCBNPTEgKG1lbW9yeQ0KPiBjb2hlcmVuY2UgcmVxdWlyZWQpIGFzIHdpdGggYW55IG90
aGVyIHJlYWwgbWVtb3J5IDotKQ0KPiANCj4+PiBJZiBtZW1zZXQoKSBpcyBleHBlY3RlZCB0byBi
ZSB1c2VkIHdpdGggTT0wLCB5b3UgY2Fubm90IGRvIGFueSBzZXJpb3VzDQo+Pj4gb3B0aW1pc2F0
aW9ucyB0byBpdCBhdCBhbGwuICBJZiBtZW1zZXQoKSBpcyBleHBlY3RlZCB0byBiZSB1c2VkIHdp
dGggST0xDQo+Pj4gaXQgc2hvdWxkIHVzZSBhIHNlcGFyYXRlIGNvZGUgcGF0aCBmb3IgaXQsIHBy
b2JhYmx5IHRoZSBjYWxsZXIgc2hvdWxkDQo+Pj4gbWFrZSB0aGUgZGlzdGluY3Rpb24uDQo+Pg0K
Pj4gRE1BIGNvaGVyZW50IG1lbW9yeSB3aGljaCB1c2VzIHVuY2FjaGVkIG1lbW9yeSBmb3IgcGxh
dGZvcm1zIHRoYXQNCj4+IGRvIG5vdCBwcm92aWRlIGhhcmR3YXJlIGRtYSBjb2hlcmVuY2UgY2Fu
IGVuZCB1cCBqdXN0IGFib3V0IGFueXdoZXJlDQo+PiBpbiB0aGUga2VybmVsLiAgV2UgY291bGQg
dXNlIHNwZWNpYWwgcm91dGluZXMgZm9yIGEgZmV3IHBsYWNlcyBpbg0KPj4gdGhlIERNQSBzdWJz
eXN0ZW0sIGJ1dCB0aGVyZSBtaWdodCBiZSBwbGVudHkgb2Ygb3RoZXJzLg0KPiANCj4gWWVhaC4g
IEl0IHdpbGwganVzdCBiZSBwbGVudHkgc2xvdywgYXMgd2Ugc2VlIGhlcmUsIHRoYXQncyB3aGF0
IHRoZQ0KPiB3YXJuaW5nIGlzIGZvcjsgYnV0IGl0IHdvcmtzIGp1c3QgZmluZSA6LSkNCj4gDQo+
IFRoZSBtZW1zZXQoKSBjb2RlIGl0c2VsZiBjb3VsZCBjaGVjaCBmb3IgdGhlIHN0b3JhZ2UgYXR0
cmlidXRlcywgYnV0DQo+IHRoYXQgaXMgcHJvYmFibHkgbW9yZSBleHBlbnNpdmUgdGhhbiBqdXN0
IGFzc3VtaW5nIHRoZSBoYXBweSBjYXNlLg0KPiBNYXliZSBzb21lb25lIGNvdWxkIHRyeSBpdCBv
dXQgdGhvdWdoIQ0KDQpCdXQgaXMgaXQgb25seSBtZW1zZXQoKSB0aGUgcHJvYmxlbSA/DQoNCmRj
YnogaW5zdHJ1Y3Rpb24gaXMgYWxzbyB1c2VkIGluOg0KLSBtZW1jcHkoKQ0KLSBjc3VtX3BhcnRp
YWxfY29weV9nZW5lcmljKCkNCi0gY2xlYXJfcGFnZSgpDQotIGNvcHlfcGFnZSgpDQotIGNsZWFy
X3VzZXIoKQ0KLSBjb3B5X3RvX3VzZXIoKQ0KLSBjb3B5X2Zyb21fdXNlcigpDQoNCkFyZSB0aGVz
ZSBmdW5jdGlvbnMgYWxzbyB1c2VkIG9uIERNQSBjb2hlcmVudCBtZW1vcnkgPw0KDQpDaHJpc3Rv
cGhlDQo=

