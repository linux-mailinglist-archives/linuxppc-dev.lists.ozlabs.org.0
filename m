Return-Path: <linuxppc-dev+bounces-10232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA8B031E8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 17:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bg95J3383z3bcW;
	Mon, 14 Jul 2025 01:55:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=148.163.147.86 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752422116;
	cv=pass; b=BIQiBNagJfvOd9MfAECJ9+rD/QSkMjy1wKvOpxMe8N0x8YhINPzWC95aT3Qi33E9Wuvc5VtdinVnH3Cwpz+lg7xP4D/z3bjvUnOHS+yi0Vck7wDiVwDsekNAegLa/Nd0TNe9FRpjmteEBuJ0feq8izxvLRcE9YKOqk7h3irQE1s9EN9XIn5wQ+MBzEX9I4r6oid7Ks3UWw2jVSFE6ma4Ebw218XkR/6HBQn1V2ps+bxDo16gNNqwxYp6j42nMJSwoOqy0ecgvruIwwne8NOXYH3SKe/iujRTq8JZeDNtOqjC4sJTT3NNcAhJgTmB+7E7R9Xe9QOj3mY1WQU0eZDkSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752422116; c=relaxed/relaxed;
	bh=TKpak/x1bssmtcAbnOj2fXhOFi1IMBasQm3T5CkeALo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dC+hqUTjVQWSIe7L4U2BTLmXRn8tmGLHXkVrWwZ33+lqDUXV1GfRr4y0DcD0lBum9WWSKkIcp3GOFEBgjDYvhhFvEc9czeLbVMICw3b5u0DL+hU8+TJQ9jJDeQMTmRsK2FjvfqOFvmDClHaJ6tOtDbEr8ciIBYRC8Km6bwkswtNiLzp9wWWPjCJll507w4YqhqJ1zadmCO8VAtvQOcoAigq2b7s9CI1SaEPUDNccttIXLPZtBMC6nOkbKI/69TiDqx6xdcoCbEXfPcM/NEoL3c2ArNqZKcftPn/69C4Bti5Qly2QctN2AikvmqrjJccY+ZDPYZZMA9zHNvCyacS0bg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=hpe.com; dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=V149hTY1; dkim-atps=neutral; spf=pass (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=elliott@hpe.com; receiver=lists.ozlabs.org) smtp.mailfrom=hpe.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=V149hTY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=elliott@hpe.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2934 seconds by postgrey-1.37 at boromir; Mon, 14 Jul 2025 01:55:13 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bg95F6xrxz3bVW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 01:55:12 +1000 (AEST)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DEUvsi031381;
	Sun, 13 Jul 2025 15:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=TK
	pak/x1bssmtcAbnOj2fXhOFi1IMBasQm3T5CkeALo=; b=V149hTY19UyOZs/kww
	P+SSZ5Nb4RKrUVdEMMhKBJ2cw2Nvk4jeCJa0pWwVckVcuFacAoqe32avcSK5/8yx
	sWJh7/VwiR/DR1u3zHlRV8i7eSl3gXWDvCfOpYH6WmQ+JduOgptwNGzOrwqUCItO
	WHAP/A+92JRkqJOJSHSdz0fyR+1ht7WfQqjkH+BD/6DncUBoIfy0S6aNHbaaNZ/8
	yex4dapzZBVIOksuSGaT5YDQrJTPvoHKkU/o4r84w1DFXeXKPGKlbPTPAxYsmakh
	D6+rjGiNtU8r4xqhn3FBOGwSXTBMc5dnBjOKgOqXoyKN2hd2DbElp+FMdiVpICvs
	YFow==
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 47vemb85yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Jul 2025 15:05:58 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 3EE00805E7E;
	Sun, 13 Jul 2025 15:05:57 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 13 Jul 2025 03:05:33 -1200
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 13 Jul 2025 03:05:32 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11 via Frontend Transport; Sun, 13 Jul 2025 03:05:32 -1200
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 13 Jul 2025 03:05:27 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZpLQ9at+kfXwvA7A7RfFAWg29P0fB0MANNgbyP79smhnthWYhPZUkOs7vzPzV39a/OJ2koQ+anEOZ7kjywFx3gJcjAIgUOZ07cGlxHCWvYlpxykvReuaY9YvZUk4ZM1gqXWE3m7EjT95nMRVRvGdsWf429wZ2f/cJ8gRdi0PxTmjJvbafi0NT1DXdQfR++jdCyGu6UM5M2z9lOyt6Vqd71ffWxsmRYXqGuZ8Tqd8X9JQc0DmgcC7s31iSrhCP/8H9TMYDvsLq1xYNHZkCQyaYp6qE7hCQ4PjuyEPUjFv5T6F5uUEBu7VKpAa6Y9PgNMsBhkXAYTdCX8fws7d4Kl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKpak/x1bssmtcAbnOj2fXhOFi1IMBasQm3T5CkeALo=;
 b=gKyUSWnscZqwQS6CUxUCWTSuGwpTotfuUZYWEHFDdhrlWOjkHsAm5DcC985d+Qu8ulvS3n+35u439AYqJ1vRB1nhjFukE2tV6fmFV6iHCSY+sP52XBD+YDJ9iQKRqdhlrmmxQnY/ZNZdDkvlP1UBUCJzCPLYlNUYsSOXxcDhZdifAbqY6d5EvX8emanmXTANMGDp2luzAZzXKYcZMuG3qzGvs9EpPf4Adw3dburUvA2YJyLJKNOLDCc80QJSKIMr4CE1C97jPGFWFo26fgPPMmCq0w7tW7fGTgMcAzJtjIg2LUrNhB1d1VzqJFyQrZk7DBlgP71TzhEc6m+UZvQq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:54f::12)
 by SJ2PR84MB3369.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:58e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Sun, 13 Jul
 2025 15:05:16 +0000
Received: from IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b]) by IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::766:753d:9ff8:1c8b%3]) with mapi id 15.20.8901.024; Sun, 13 Jul 2025
 15:05:16 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Eric Biggers <ebiggers@kernel.org>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Ard
 Biesheuvel" <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>,
        "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>,
        "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
Thread-Topic: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
Thread-Index: AQHb84R/vrwXWCY70UKmrSHlkDqWyLQwJxdg
Date: Sun, 13 Jul 2025 15:05:16 +0000
Message-ID: <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
References: <20250712232329.818226-1-ebiggers@kernel.org>
 <20250712232329.818226-4-ebiggers@kernel.org>
In-Reply-To: <20250712232329.818226-4-ebiggers@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR84MB4011:EE_|SJ2PR84MB3369:EE_
x-ms-office365-filtering-correlation-id: 10edd64d-5d74-4ab4-fcf9-08ddc21ead1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?05N5YSyJ1Qx/MCkFRJ/xKqy55jKUDnGJzBNOih+jbtcdqutCQTz+s6rfTDYn?=
 =?us-ascii?Q?0y9Tk+877HPCC5HghW2qEtxjwBAkfVpiqFjmQyKiA8hW3p7t5sEuz+V0lU35?=
 =?us-ascii?Q?i/0xWQUyUfdxExUQFYGSblUZ/L5E5cDUMgdjKX5SpXG0RGiFVIXF8aFyYq9b?=
 =?us-ascii?Q?HwCL8r/Jq1NzYKqctfAliE80BRzNEXfKaAgg90JcI4b7UrYq6P92q6wSbIQu?=
 =?us-ascii?Q?tBXdYJDfUn610GNcVtzXRDjyzZmTm1EHvLte73F4ceW3d4miCQYjEWAU3WDY?=
 =?us-ascii?Q?JTq+sjyi8ZuXty/JmGuGwohl5uO7uL1f9/U9WodfTN3cZcweGkgeMJMWrOmQ?=
 =?us-ascii?Q?ArPVX5RHIlfdCK1Z4Qn0qQ8zEtLMxvlYWM/1Qko9ShUoTzijI36wLWLQc/9W?=
 =?us-ascii?Q?DiFk8lu+gRqxutZvGAZy9Dn44i9bf1YWQnX6lXzzO3He8jzNb/DEYeuys5YW?=
 =?us-ascii?Q?iAtAdfD0HLHIktU9dwdT8fYw7em3bB60jO2eJ0TzNRn23Z5Gbr58+ZjXhfad?=
 =?us-ascii?Q?hHHydWd2KIUkv6Wk7SRLbJEbWP7Vih8uJ/ZdTz2dE4MjSQ0j6vovTT5pq/YS?=
 =?us-ascii?Q?rLFECi4HRDCV3/RrGDXKfAiiIvRPVJ5EhOcNEhn8bH4yBH/w0W6CnVKjtgBb?=
 =?us-ascii?Q?pvzQx+hOlagKhwYP8jqyKFIgasXN3bG3dgHOkCKp1mhHuQOUr6A/TuYXyWpz?=
 =?us-ascii?Q?wDejdp3Yu5eEQqc3Swx+8r1CoooWY/HUdCT97EPEagk3f3HPtC5MYf2XuGhJ?=
 =?us-ascii?Q?AxEV6CU65XeyXj/L4JbQ7BA+asO8jv5NJYjyFTatffdZc2jJ+UmW49A9Aj8t?=
 =?us-ascii?Q?Id0RkkIjUodWJahmGMbY+UP0nYQntl4Cc2/6GDponfFiJi7A/9oM1qGmXAiu?=
 =?us-ascii?Q?zgGHF9IErZgG9bhGD7HRljXrenX3PwX3gmJ9yW8dzEMtut8m+323pxuTemrT?=
 =?us-ascii?Q?qMo8DC0X6f5WtneFd6UGa+jLiOryN2Q2qdBAc764zcElIQCeDwKE2q00iY3E?=
 =?us-ascii?Q?U50hpqHGp6wR2w40sbR63P2jeqJbEBueTXsJaOm1sCUoGOo+2dBtsES8IO6J?=
 =?us-ascii?Q?m19f77PQBLae5TFvfPpD/6y1OVF3PcpQxNu0cOiul4qQaZf3/iVe7fbn3gHg?=
 =?us-ascii?Q?+6aClnjqduUSbInqPvM+xf6uy5Sbcu9XihVQxzQS5ERgscss5mu0QukBfWfK?=
 =?us-ascii?Q?dnH1XdXv468NuJqsjAUULMk4jalrGtL5cnGwnKoXp42hqrvyzNx94E/row/+?=
 =?us-ascii?Q?1jiLPxpvchgbHVXfO5CxIaco5PWahMe/+zEW89ipMZek8siLwIaclC9kdBtM?=
 =?us-ascii?Q?AI3U9iba+Y68bKZMGTb3Cw1rr1g6cI5x8rNP7hGXUQcKqn+1Y6dJ37gD9cNs?=
 =?us-ascii?Q?6hffxAPNYMscUc9a7cR/9yFAuAvbBCm7nJNze8O7/2To52ZDidjV2ZHphj8h?=
 =?us-ascii?Q?vAiZnV8NjdfBCc1O7iH4I0oKDgbKZngh8sMEauFnPXcuatwZUC0ZDg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NXJR7HZritrV4pR3wCou0oOKlf79f67E5Z//eoH0s+vlGXe9IZUAxA6Yk1YB?=
 =?us-ascii?Q?RN32mLr4Z1AV0QD1h9y8CKl0//0aXvLyFGbfQkzYQDg9t44mPzl9ieOA+TjE?=
 =?us-ascii?Q?Seh2X46ycQOGbYtaQsIusMuL6YSkN91TOdvChiCUUIJo81qv1SOhWUW/T3ec?=
 =?us-ascii?Q?+8wKSrAAo2LUEKW1mjLJSISV74ZkXKhCqYZkd8b7KKCFiNTDvaKGjdzqj5KG?=
 =?us-ascii?Q?bizeqw71hQ2nt7HxnX+OY2M9iOkxu+abt6fUr2yXaFBfXs0hONULPtQR7aF1?=
 =?us-ascii?Q?KxdoJ+79sfFMFBtyYL9NKtoOvl71AXjbuK4cfBZW3aMlHNlT5gAFP0iS8xwb?=
 =?us-ascii?Q?cYpIR6LzIwJtXHvHtUu9UcBgQzyu5LmjwOQ9Ip1TIXfc+5PCy5dbfon4pOwF?=
 =?us-ascii?Q?FLaD8LPqlUWhj55+S7zeCjZRQHdWU/k24zzNJ3+vNEsZ1elsZO3vovVo62nx?=
 =?us-ascii?Q?Xq48Jc2JE9tcuGlPGxDN+/vaUyxi+SrhI96U4fnVy+5+6gb0E1NPy/SjwZ7j?=
 =?us-ascii?Q?v/QQpio2llXR2IrACALMzeyd1VXdSgra8UlKDki2uItn95YezgMbRoQNMPVm?=
 =?us-ascii?Q?w2jQW5COPcFC/826KGS98LzlPRABuzmfxrw5cLr2J6PaKkEn6Qb2X886tYZt?=
 =?us-ascii?Q?o8UcvkVn2ASkpyK+lqTWv92ceT2B8P34TlLp8UYqXgsPcdYLHmmsBYDRZTz0?=
 =?us-ascii?Q?L1pBP3wP0xmyZdACErVVJeHdgOIdAhCAIXMMcHGaY91bbSr7Jh3f9i7jgysQ?=
 =?us-ascii?Q?xMs9TLdBNpwsz6BT8yMXIj6yqLz0Z9sHlyK8yYQUzG4f0vuSsXf22jhcJB5d?=
 =?us-ascii?Q?x0haCGGaolzTQBPkbbVA4agzKcGdoJmN8l9GFUL1VKHcf+lvh0TAKRRUv9QU?=
 =?us-ascii?Q?bMm0KJgPXmvrbbOPRd+jemMzxuTCgRghgHxQbVggJ1suBifrIzUnKhi47Dc/?=
 =?us-ascii?Q?No0s2CQnBwPIr0A8IMAykDj+pB7ZFrakioZjlSzy/QCd4PU8exUw+1K/G2BA?=
 =?us-ascii?Q?+Q6yzfIemeoYj7uuIQYlrgR31O2n6VWO1H6yek1tWfYZ1kMUWvUPmIGsL/UO?=
 =?us-ascii?Q?8Kt+N6HbOOdbdPhJbBCWRQpdSzUvdBdKSyj5WYZL+OHN9fpoI0g1Q24SpNmM?=
 =?us-ascii?Q?RsiflDAMZelxVwoVasEX4VeenAVxfvUWXOWTfj9+pqBdFJX9Saymg8/MEb6B?=
 =?us-ascii?Q?rpmUN98ZkvmG33RL5ZcTbI6jeRwKOVKs+QfNr+fNfvcKLTmZ2eHWzn7mop4D?=
 =?us-ascii?Q?w6u0bg/0vrWu19HNkiQcyEbvQFsqpjbtvABsHUbRucYvXTaDV0smvpmWCKmK?=
 =?us-ascii?Q?2kaRwA1ohwJnmNh6WxbYTCQt0N58gqI2eM+MDROH+draHTOe54SNxcEto7vh?=
 =?us-ascii?Q?PvyLXODJdiPkTUqLPrpoDh2Y3e5kNu5LhURLjdETRrvDBWqEtAHNX88q78Nj?=
 =?us-ascii?Q?H1ewsPo42bxl1U3g/HkxTQ+8SXJ/lNYBQ7gmc1zTFuaonbO1ahdoxPPuPZPV?=
 =?us-ascii?Q?eDT/PXWqiCOd88oMaYZ0rM3lu5AOvqcXjkT597OonIp70gyZ19LmrQ5rWPHT?=
 =?us-ascii?Q?ff46PhvPWqxCpXpLQe4=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10edd64d-5d74-4ab4-fcf9-08ddc21ead1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2025 15:05:16.5125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umOtybOUvd1JsgDQhA2tTOdpoWnMsAnLHhx1JbD7Zb5Th2OLT5fsCOw0WTGuJ2HC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR84MB3369
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDEwNSBTYWx0ZWRfX9J0xbCvkK67x laI1HJ1EeboYepKUtJlNOaGtv8PCe/sQQdzHMKlZryHQRG3SggbF/L6HVPHCU45Ibbw978Cu24n e5NrxOgAKjIXgaloUPuo6j2wM971o846ljVzVUyvxIEzXcdaEyH9vsEZAVS3DUtsTftYIuOc67T
 2Me2r7BENMwu6ky/+fduKxl+sT/kPLYoEcmO//oB/QB3xTYZDgyk1RcgvJ0+n2CFzyyuVkVbXPD iphYsU1/VLj3J+ic4wDaFgvr82YBUwHkVs36fFKqgYzDfjc0UriQUooWTQNx+4cF8bPaSxaDkkS 7mXza8qO34VGt371gjHR1sfpK2qynBxYPPwyZHpMFiV3/+EnP8a/F4R2oAt216iVXrzQ9uTTuSg
 yjoBGbajS2CDXeKt5rsCHNDyTbLeJ6bvYVQsW4wXEb65h0oV3nufU/oK9t4qxjumRzr0GCCv
X-Authority-Analysis: v=2.4 cv=MN1gmNZl c=1 sm=1 tr=0 ts=6873cb56 cx=c_pps a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=ES8MNo1sd1zJ02czjd0A:9 a=CjuIK1q_8ugA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-ORIG-GUID: pAxFgtBncnd_2Q6pbi4erKhZGiWnwhYd
X-Proofpoint-GUID: pAxFgtBncnd_2Q6pbi4erKhZGiWnwhYd
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=995 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507130105
X-Spam-Status: No, score=-3.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> -----Original Message-----
> From: Eric Biggers <ebiggers@kernel.org>
> Sent: Saturday, July 12, 2025 6:23 PM
> Subject: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
...
> +static void __maybe_unused sha1_blocks_generic(struct sha1_block_state
> *state,
> +					       const u8 *data, size_t nblocks)
> +{
> +	u32 workspace[SHA1_WORKSPACE_WORDS];
> +
> +	do {
> +		sha1_transform(state->h, data, workspace);
> +		data +=3D SHA1_BLOCK_SIZE;
> +	} while (--nblocks);
> +
> +	memzero_explicit(workspace, sizeof(workspace));
> +}

That assumes the caller will never pass nblocks of 0... should that be
checked first?


