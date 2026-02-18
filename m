Return-Path: <linuxppc-dev+bounces-16935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPksOj3FlWmTUgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 14:57:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D07156E91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 14:57:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGJ3Z6bL0z3bnL;
	Thu, 19 Feb 2026 00:57:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.144.234 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771423034;
	cv=pass; b=PlZRlC8v1LKIAXHP/nugGTl2nXfBhygkSBqVc3KbL0G+PAFKENd/WQ77BQ+GOtSgg/PqiJ9W8bIFwpGwNThtH0ZULCJwhJxdYzXDwVUQpB/+xdUVTdk8EbIPv6+BwFKeWWZbTzbnqFL5GOydzrueQhIfL8I8ppM4vvAhiIfOWT0Ny4oxkvfBNczGltzFaSXzLtX/NwxkDt1/j3IqwVnsCdGcwyVy5u4YArpitJFXj0tWEIImpnlwvy6e3NXXSbLDC1cKySFOK0A++dMkGZo6dDjxMFdYY8hPeLQyxaIPIQo/Tlpp1biDPwhRYHCoOOdWsFAz8wlOo7bdF+8sDShxgg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771423034; c=relaxed/relaxed;
	bh=BjVxufuCy9VAB5llt63OTWt6GS/ZmbiXAw3SXLUIcog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k4apWEAUKXNlLM+RQ46V/rKgOVEcK/3Rk/Pu6dW14wVE0deWSn+MER4hsQb4Q3QWEGpi0jSqq7ERFbgD3t/j4vdehZVmRH9mPmw2buUEPa/4uXTzHnveHr7mLHHPzZOkQePRgx80IxDY+YPDhsndUi14l4+O37xyHmcKpSQeCgk3Fcc0Bzi0eR3HRrKqIk1z9ExsT8fvHYEmsYFyX3LqZcmB6VxKPB1Ce4b2vTpCZYvzwt4UK4ncg3bDRpY4SgDIkyFQLmbkwo+N7TJ98GgQuAiq9HH24zOUME1nP/q1nMvSCs8tDJk5P1PCPQChAZzl63dFqOezdsojHENoBdi8/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com; dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=vHYhrh3s; dkim-atps=neutral; spf=pass (client-ip=67.231.144.234; helo=mx0a-00103a01.pphosted.com; envelope-from=prvs=8509b15a93=mnassiri@ciena.com; receiver=lists.ozlabs.org) smtp.mailfrom=ciena.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=vHYhrh3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ciena.com (client-ip=67.231.144.234; helo=mx0a-00103a01.pphosted.com; envelope-from=prvs=8509b15a93=mnassiri@ciena.com; receiver=lists.ozlabs.org)
Received: from mx0a-00103a01.pphosted.com (mx0a-00103a01.pphosted.com [67.231.144.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGJ3X6964z309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 00:57:11 +1100 (AEDT)
Received: from pps.filterd (m0174892.ppops.net [127.0.0.1])
	by mx0a-00103a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I8Mdrs1892343;
	Wed, 18 Feb 2026 08:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=06252019; bh=B
	jVxufuCy9VAB5llt63OTWt6GS/ZmbiXAw3SXLUIcog=; b=vHYhrh3swr8fvexKI
	Bq4gYoqo8ktOl4GrlXYFk0yUcuHvZ6TW3EvCy/02dcT9O9VEdTbCzGEEo2xdw9HX
	j6MTPhpgm45Zy8WLMEYffhAHtUM2soHz/FG33+uv7VXcXBwlVKVrlCOY5Hk/9Uhj
	wS6VNhYcLK+EUj9PRxVJBReAkYR7Coqw5DGLMnMMMEXjsb3SJOWWxBO7CqxcdzFM
	cX5fyzGKcRRRAXU41kN2SqSS3FNFk/5uswmhkF7OzgsMYwNGZSviixKDqHYZXOzt
	nr6lbavWMRekmMoexB4b/b2XO1hEJ4bKSARkHCZPrZWjPvcwKdVdg45r4f4GnYB4
	nGXag==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	by mx0a-00103a01.pphosted.com (PPS) with ESMTPS id 4ccq124duq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 08:56:54 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaUEyZ/09NEQdM3EP4xIXDNzg+W15qvwWxdD6zNCdD9etV+bpJoJQ+5O1CJvlH1fn97IyPU+b78coUX8umf45HAjO0B7gxuDueuD9tT/Zc8UTfTySPMLzOh8NcoN8BYpGvMUBu5n05CeaEkJ7poVkI3y0KIWB76Df5Yj6zMvbedUjGdl9SGl4quENuxLWo6BGPKfnSD5SnQNgkxsPVRqJU5UwTACzaIRtjnYynjlFR3caalByI1j+tevfV/vf6jMKWHOSfXi1Vhdmet2jvjltjUBVa8taBv8/XbBCbv7HAcR3hAQkRTEc5+GKs5kZyl0Lkwh4fXXb8gsMn/AOVpv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjVxufuCy9VAB5llt63OTWt6GS/ZmbiXAw3SXLUIcog=;
 b=VK/SyrBnf1V+CLDRHBQDOgT0scK5wEHr5ly4riDgnwlyPTcFefASUcnzzUiFeDKT9c2iYEIGllrBw+hGNPJMsNxDBIxBOk30AIo1QF8wsYJXI3xl15zJKZ07dagGpenxCXRvFGuJDrHI4pb5ANmPGzNz2wt1xbQtcTBtHIGEqeXUyr91G2u/upitTTYumV7TYaqfLkEC2YDUQAQUcyKsnVXuWGIBQw5tU51ubZzNuSKRBIt2KCY72kJ/KLQ3ODYg9Km+Zal1oH+n4UGSP4GSuXVUXbB9gsQSU/S+1nCMZkYVBubR2RCz4Afz21fcRpgMq1Tv+KDQrrg2GNmRGQP/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from CH2PR04MB6821.namprd04.prod.outlook.com (2603:10b6:610:94::20)
 by LV3PR04MB9491.namprd04.prod.outlook.com (2603:10b6:408:285::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 13:56:52 +0000
Received: from CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103]) by CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 13:56:51 +0000
From: "Nassiri, Mohammad" <mnassiri@ciena.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
CC: "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>
Subject: Re: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
Thread-Topic: [**EXTERNAL**] Re: [PPC][Tracing] Missing syscalls:* ftrace/perf
 events on PowerPC vs x86
Thread-Index: AQHcoEcGeCnVUQeYJUiohhPZh5dZMLWH762AgACHazA=
Date: Wed, 18 Feb 2026 13:56:51 +0000
Message-ID:
 <CH2PR04MB682162D39BB7E7EB0F0695AFC56AA@CH2PR04MB6821.namprd04.prod.outlook.com>
References:
 <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
 <b9ddf051-f6eb-489a-b199-6d47f5a21395@linux.ibm.com>
In-Reply-To: <b9ddf051-f6eb-489a-b199-6d47f5a21395@linux.ibm.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR04MB6821:EE_|LV3PR04MB9491:EE_
x-ms-office365-filtering-correlation-id: a562dca3-f657-4bea-ec86-08de6ef59159
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F+lgYrCqrwhGCb/Pndu+KOhZT0lDh4NY4d6e/JsO9N6G5UjWPRwcfGmBY9?=
 =?iso-8859-1?Q?WdkUH9ByP1fddgHpLsSEd/jLe28Zu2fmNAB/Vvp1bX2CzVVtKbc2NNVWHo?=
 =?iso-8859-1?Q?ywnJvcOPedOM66jEYsZece1ZEgnZtW/cFTYXSRQloiACbt/tboYIePgWtj?=
 =?iso-8859-1?Q?ptFcIbisMfz1xvMgFu1Z60pWSdegPMHBcQK98Lzg52stlfZTyMXnO8rD48?=
 =?iso-8859-1?Q?7S7twqZeECIqMzSLPJUaqlh5v9gxHN95AD0SBAgnab075l7raB6zVi7uKg?=
 =?iso-8859-1?Q?2hcD2fyyhoUAN8M0FwZykPaFSq5A34U8nMjo2sTJEpxmcRsdh+Vxkuwiuo?=
 =?iso-8859-1?Q?9bzXYKvGJt9auEjtgVyXzfDY9soFhV9lBI9vUBP6yswhZvc8ZVEsCgezH/?=
 =?iso-8859-1?Q?rZ0Oqp+Nj+gL8Ej8bCVAaN25n8yZEN9xdosteHf0JegrBws/Rhp60SX1T3?=
 =?iso-8859-1?Q?b8g3aFcHv3Wbydphj73OghKMVJvuRFhQQCgBNLKN7MBe7g4zyFgyRHIUUw?=
 =?iso-8859-1?Q?xyMCNqMgSKW+YrqzOmvxBsSTqKfqk+u3yoUd8NLCXHEPdqZnDQhEb7eGOb?=
 =?iso-8859-1?Q?YesLhRAA8rM9ZJUCsXctRhbj2ALocM+Mlq4xizcb9GZPJaHs//K7r4xMqW?=
 =?iso-8859-1?Q?9Ac5MEWVl9So7Zo6NJXghCut1XauTP1wnbNadTFPpyblqnpEW3XFgaAHtA?=
 =?iso-8859-1?Q?58ZNHFYzrASe7algTW3wat57+5fGU3ak8zuOjT8g4yGulWazt23ne1CYrM?=
 =?iso-8859-1?Q?G05ptBn3GoMZn+MwVr1bX36Wqi5MNtpRBzhhCd6fHWjrzOsLJ5fwPUW8gS?=
 =?iso-8859-1?Q?1MONBTF2gaiGUulVwgymobMS198th3YQCGo3Qp0UYqsoIhfT0zdvJ26OCa?=
 =?iso-8859-1?Q?JBzlhvMG+YVT8Z32OD2S1+1fw772f28rJMYlIdWI95/jU1Jt5SDHtIATXJ?=
 =?iso-8859-1?Q?Oo+9rXOiUg/4qyJF6oQ4qMXeKOxzULSxSqPYs7kFK3V0oBEQSxUVVeRi2c?=
 =?iso-8859-1?Q?DUp7+uuESgcljEKwj5FlQDCuRetowCM4Ql6gJeCHKqmKHk63g4lRQSy2bg?=
 =?iso-8859-1?Q?WWo+43E/CFiokR63hhUqtaSsWMTJLPxFQw44YPuX9vgTJOOjcMnYABSkYw?=
 =?iso-8859-1?Q?Gile2J+QKT078Qxj0Zt3cUsl+uLF+u1g2WDDaPUmhlo/4VScuHI04dpY1V?=
 =?iso-8859-1?Q?EznQvyl7ZYd4DqOrM3sHVIUvG1yQSLdBpG7kHbblY+TpnLslcgRF2YJSIi?=
 =?iso-8859-1?Q?zxaBaSP3nrRAMGDBjk7FOH7pAVj3KimpIYQjhgRuyffbb72GUDACfR5EN9?=
 =?iso-8859-1?Q?9NqBmRuwfKf3CaN4JtPvS2b3D3+c20rOrDTWDGN0gqdVDTOLZJ+TywOOno?=
 =?iso-8859-1?Q?qME6u0Ufah7+CyFkY4376S09t7UOjg6V1UbOAS/M2cV150POorkBMwLVr9?=
 =?iso-8859-1?Q?o23AUeOBoD7dt/ZaTfil7wfjfrbTFMu8JyoGBbaSO7D7rujYy+KDdPTPXM?=
 =?iso-8859-1?Q?enYjXrXRh0re/qynlwJ9MXn5nwz17qNrKPwqPmjgi8bBw+SIn8oe9X8xrk?=
 =?iso-8859-1?Q?gwQq5SopRj4b/eeXAa+XBFXxOAp8kO+fWN2d9pVexeVV8wq3fi5Y22B6VW?=
 =?iso-8859-1?Q?42xAFMg6sCtQ3XnbCwA+F+iWb1vIqOnmSzc0YBHSV/7i5T8ZckcQ2kBWFH?=
 =?iso-8859-1?Q?jsFnf/bWoaBMKYpLXHw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6821.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fIkTk7P6k/+EtnQA0A0uFiiAsM3TnwGXmUCRAikqzYz4DlymPzBcfRScVr?=
 =?iso-8859-1?Q?/Utb2Wn6mTT9nwGi5qlr+LlGo2GXWoMpdVSJERAlmbRYEFqK45SC6sFz/c?=
 =?iso-8859-1?Q?H7AfMAl6LqJ2axMRuY/aMRBV56DUrNX8CD6iRtpCtU+ArtybZxa+CZQaI8?=
 =?iso-8859-1?Q?9xyXqmlYd3M4f32AFpFDGnixoO/+seMvj8nr3kRvTMzT47iwKt472HGKVw?=
 =?iso-8859-1?Q?UaOqnuV6G9luP+66WCkJui7MccMG88Tb+EXhKJJ3Q8SSV8VLYyE7k+0Z4y?=
 =?iso-8859-1?Q?GUjFgq58VoyjsKimkr70/na+fTc5rplxSuoTezPuhr0whi3tiw8t4ZOEMN?=
 =?iso-8859-1?Q?qukgch9Yi68guap2bdfMt0NkAT0PfDMEkarjd7DKW7TVK1Bg8l3x2gHDy3?=
 =?iso-8859-1?Q?z4OsEE7f4x/YeqKCdaf+CdhBmcjBmn/BGqnisUt5gN1FP9Rm5v7WidhztS?=
 =?iso-8859-1?Q?TCzMjFobuumqK6tEnQMtG4Kj9p32wOVuZkYX8Xda1DRxiVCmapbdXMKL2Q?=
 =?iso-8859-1?Q?rgAEbmRIaHDsx8eKob4LEorBna5kyTN+PSEsZ3A0AUcHD57fBF6ctbsQ1q?=
 =?iso-8859-1?Q?riPo+VCxYoMCNGpKl2DR4ofD7mXTvKkbu5n9QcZ36xnpdwq1nBKTj7Tj8P?=
 =?iso-8859-1?Q?MGmDUVygoXfi/HfGCTZzL5Y6WyBYA0DETiTCWkrnW25XM0I5+DkPkaibxg?=
 =?iso-8859-1?Q?QagXbZYuJ75TfPr5cKTO+jGHMl1B9gzL6PgieC7fQIzia+ilIFFXOqKuW8?=
 =?iso-8859-1?Q?frla1h8uxl6QXw81ODjtOAxR+eE24cShb9ybikyEECtfEH1nfYUdm+mqTJ?=
 =?iso-8859-1?Q?2HTho9ot+/5antKLqloL2SmQNguJ2OzaWjmeh9QKQ2IeWe39TzCKcwa56P?=
 =?iso-8859-1?Q?iGuIefNchCHhglt5wIMSxAwcWGHWD6HSTJV5NHOMWK8Donbw1ip1TFHCJW?=
 =?iso-8859-1?Q?dK89ul0I8fZbyekdqOi7Z9m+P1iI+tNzosr8raI0Fsi7alQkcA1JREDS3i?=
 =?iso-8859-1?Q?YNB8Vy1MEyh7hbRxoMJ4wZ4I6O3cxT1ySiQjqOlbunjaY2x2YpcnxeF+wO?=
 =?iso-8859-1?Q?JYXEn5ZPM0D8SkLQit/tidMyF0dtaFUr5gNzl0QjiMXLLhB9nlvansQFjn?=
 =?iso-8859-1?Q?0gwPxoVCYWwgV2iG5g/mYBHhr/VSapUI8UAYSN0C3c5jF7z7rkxnO8iXAD?=
 =?iso-8859-1?Q?34xWmJO51W9/ND8WLEiJwutpRstHEiX80xHjvQjmi8Gzl9SZ+hhUxAP6rh?=
 =?iso-8859-1?Q?mkzK9dTMJkJQWy/StWdnNMp/LhdZi3cvk70BtztGdclVfLXPwAM5sr92tx?=
 =?iso-8859-1?Q?aIrhZAHKqPZU2OQSBJJCt9l/LFDDgRFj7J1PezHxnfSaOyucPzDnyUbaop?=
 =?iso-8859-1?Q?xsfmvVbGEDYyOETI7ASVGPLiRCFlvDy4eXWSdxcNJ4Hk5itxxcty908az5?=
 =?iso-8859-1?Q?zSfqn3RddFAnkuEjvi+lS0vBf3pW+extquTiGJBCnl7U/6UuBo94VpKl8m?=
 =?iso-8859-1?Q?SU/3tzsoLXzHw9VMP5ZiPH397JwkVTKABhaO8bjzTG+r0ZD6yCfWhCZ+Re?=
 =?iso-8859-1?Q?LrH5lVEoSz6x7jxcLjJqbngcDFNuUUUU2BtNEb7AidD1ADxcsecjcseO1E?=
 =?iso-8859-1?Q?49tSK6oRoVpLGM5WHSDrQJAUhbsI4xDZwtGn0PvJ0pJpTaF+Gte/Do35m7?=
 =?iso-8859-1?Q?e6XcjgjPloQPy8rwjIFscWPnvvBRwbD6tsjJRjFmwqRqIWulA8ReE2UJSO?=
 =?iso-8859-1?Q?dwcN4iAY7taN5/TNWJE1zPTlB/r3HDPuW1kAHrsPzB5cR5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a562dca3-f657-4bea-ec86-08de6ef59159
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 13:56:51.7139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxrStwlhm7BcNPly8CyAYS9Irh4yy1ItkpDqEwswADnkQCnSaZRmKrMvAwN+I/qmfs4kfQlK8BByBkCDT5QTHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB9491
X-Authority-Analysis: v=2.4 cv=da6NHHXe c=1 sm=1 tr=0 ts=6995c526 cx=c_pps
 a=feJg8xcwi6yo0k/5NfVkgw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=UrNDnOn9PbXbhOCLxuIA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: ROwGS62X7mYfq2iG84U_d5I5WaWVzz80
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDExOCBTYWx0ZWRfX1BW1XdrEf/oX
 4FTt5dXagQvHSDaV1zK33So9qmNfqJTYUaUZtUwmK660IeC/0WHguKtXXzwl4a5srPPFbEdGOF0
 Prlvnbzde6U/CBT/91ro/Vz94ni9lpJbhtJ+IYPqMmQv4Ge3HE7ZH0VkjzijxDa6sbXh62OJrOk
 6Qw0gHEOig2HURiLbyhahHl63CAzH2m/R/GfUh8wzaE342Z9YFrerSYowdMUR7xM29PtIbH217y
 ALKMfSI+clYnI8ilFdcpfvaS+gG0Ud1APVvjmt8Ha/f3nga0oAeop9ZiTZvLEOdmfRSR9kvbAc1
 v4vF+qmXl3TIymDFTA7aM3QezLGHAtDETZugsVCDYB1Dr8WGA3wZbZrU2am26g6+LpSJR4w7v1B
 vBtNHR00xkjoycU1siQmfJOkUq0Qi6ZazhR0A8GZZvWEYYN4GffKGJyl5IR7vHlqOdcI/YCkYi0
 2yAVcmiXFSmxfNj4E8w==
X-Proofpoint-GUID: ROwGS62X7mYfq2iG84U_d5I5WaWVzz80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Spam-Status: No, score=-0.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75 autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ciena.com,reject];
	R_DKIM_ALLOW(-0.20)[ciena.com:s=06252019];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16935-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-trace-users@vger.kernel.org,m:michael@ellerman.id.au,m:masami.hiramatsu@linaro.org,m:christophe.leroy@csgroup.eu,m:npiggin@gmail.com,m:rostedt@goodmis.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,linaro.org,csgroup.eu,gmail.com,goodmis.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ciena.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ciena.com:dkim,CH2PR04MB6821.namprd04.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 19D07156E91
X-Rspamd-Action: no action

> You should see syscall enter/exit tracepoints on v5.10.x without syscall=
=0A=
> wrapper patchset referred above. Are you using v5.10.250 ?=0A=
> Also, would help, if you can share the .config you used.=0A=
Hi Hari,=0A=
=0A=
No, I'm not using the latest v5.10.250. I tested on two versions --- v5.10.=
174 and v5.10.239 --- and I still see the issue on both.=0A=
For your reference, here is a grep from my .config showing most of the trac=
ing options I enabled while troubleshooting this issue.=0A=
=0A=
mona_pc$ grep "TRACE\|SYSCALL\|EVENT\|PROBE" .config=0A=
CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy=0A=
CONFIG_GENERIC_TIME_VSYSCALL=3Dy=0A=
CONFIG_GENERIC_CLOCKEVENTS=3Dy=0A=
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy=0A=
CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy=0A=
CONFIG_SGETMASK_SYSCALL=3Dy=0A=
CONFIG_SYSFS_SYSCALL=3Dy=0A=
CONFIG_EVENTFD=3Dy=0A=
CONFIG_ADVISE_SYSCALLS=3Dy=0A=
# CONFIG_BPF_SYSCALL is not set=0A=
CONFIG_HAVE_PERF_EVENTS=3Dy=0A=
CONFIG_PERF_EVENTS=3Dy=0A=
CONFIG_VM_EVENT_COUNTERS=3Dy=0A=
CONFIG_TRACEPOINTS=3Dy=0A=
CONFIG_FSL_EMB_PERF_EVENT=3Dy=0A=
CONFIG_FSL_EMB_PERF_EVENT_E500=3Dy=0A=
CONFIG_STACKTRACE_SUPPORT=3Dy=0A=
CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy=0A=
CONFIG_ARCH_SUPPORTS_UPROBES=3Dy=0A=
CONFIG_ARCH_CPU_PROBE_RELEASE=3Dy=0A=
CONFIG_KPROBES=3Dy=0A=
CONFIG_OPTPROBES=3Dy=0A=
CONFIG_KRETPROBES=3Dy=0A=
CONFIG_HAVE_KPROBES=3Dy=0A=
CONFIG_HAVE_KRETPROBES=3Dy=0A=
CONFIG_HAVE_OPTPROBES=3Dy=0A=
CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy=0A=
CONFIG_HAVE_ARCH_TRACEHOOK=3Dy=0A=
CONFIG_HAVE_PERF_EVENTS_NMI=3Dy=0A=
# CONFIG_LOCK_EVENT_COUNTS is not set=0A=
# CONFIG_NF_CONNTRACK_EVENTS is not set=0A=
# CONFIG_NETFILTER_XT_TARGET_TRACE is not set=0A=
CONFIG_PCI_SYSCALL=3Dy=0A=
CONFIG_UEVENT_HELPER=3Dy=0A=
CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"=0A=
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy=0A=
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set=0A=
CONFIG_GENERIC_CPU_AUTOPROBE=3Dy=0A=
CONFIG_PROC_EVENTS=3Dy=0A=
# CONFIG_MTD_JEDECPROBE is not set=0A=
CONFIG_MTD_GEN_PROBE=3Dy=0A=
# CONFIG_TRACE_SINK is not set=0A=
CONFIG_STACKTRACE=3Dy=0A=
# CONFIG_RCU_TRACE is not set=0A=
CONFIG_NOP_TRACER=3Dy=0A=
CONFIG_HAVE_FUNCTION_TRACER=3Dy=0A=
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy=0A=
CONFIG_HAVE_DYNAMIC_FTRACE=3Dy=0A=
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy=0A=
CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy=0A=
CONFIG_TRACER_MAX_TRACE=3Dy=0A=
CONFIG_TRACE_CLOCK=3Dy=0A=
CONFIG_EVENT_TRACING=3Dy=0A=
CONFIG_CONTEXT_SWITCH_TRACER=3Dy=0A=
CONFIG_GENERIC_TRACER=3Dy=0A=
CONFIG_FTRACE=3Dy=0A=
CONFIG_FUNCTION_TRACER=3Dy=0A=
CONFIG_FUNCTION_GRAPH_TRACER=3Dy=0A=
CONFIG_DYNAMIC_FTRACE=3Dy=0A=
CONFIG_STACK_TRACER=3Dy=0A=
# CONFIG_IRQSOFF_TRACER is not set=0A=
CONFIG_SCHED_TRACER=3Dy=0A=
# CONFIG_HWLAT_TRACER is not set=0A=
CONFIG_FTRACE_SYSCALLS=3Dy=0A=
CONFIG_TRACER_SNAPSHOT=3Dy=0A=
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set=0A=
CONFIG_BLK_DEV_IO_TRACE=3Dy=0A=
CONFIG_KPROBE_EVENTS=3Dy=0A=
CONFIG_KPROBE_EVENTS_ON_NOTRACE=3Dy=0A=
# CONFIG_UPROBE_EVENTS is not set=0A=
CONFIG_DYNAMIC_EVENTS=3Dy=0A=
CONFIG_PROBE_EVENTS=3Dy=0A=
CONFIG_FTRACE_MCOUNT_RECORD=3Dy=0A=
# CONFIG_SYNTH_EVENTS is not set=0A=
# CONFIG_TRACE_EVENT_INJECT is not set=0A=
# CONFIG_TRACEPOINT_BENCHMARK is not set=0A=
# CONFIG_TRACE_EVAL_MAP_FILE is not set=0A=
# CONFIG_FTRACE_STARTUP_TEST is not set=0A=
# CONFIG_KPROBE_EVENT_GEN_TEST is not set=0A=
CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy=0A=
=0A=
-- Mohammad=

