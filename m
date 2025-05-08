Return-Path: <linuxppc-dev+bounces-8445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C5AAFB68
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 15:32:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtY3K5FgYz30Wg;
	Thu,  8 May 2025 23:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746709626;
	cv=pass; b=hj48DtdhkJ2vMtdgjoTUOWfL9zw1eQd4heY3tB8bZczr9M7hafSlLGD2jCf6/ztXTeKKU01Qb5WwvrPX2i8aS8Om5b9G0KTHQR46gqMREuqGCye6s88YHfaoenDcMNdCSbXpDI3xR/8kLx9jsc+bgNFkgs1qZWhJrX2gFDSImu8pzQYiTJ1ZkSwVQDMKFLZ17FhbQ9jHwh6c+8Fi1p3vhGea0vReeXz1fPbbkxrfmhqeQGhcTZ7ZETaOTPViphhEqPOXaxSxF2bB4QsnUEh6j8Tsjmash3WmuHJNa2niHlAnuY1Z0SPJ/aW+6aj8xJKHsHWefP9LI2GYls0II7ZZCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746709626; c=relaxed/relaxed;
	bh=VRDR/onfdWCuzRRmPokvPr/QmVBJp1A2uHl38EGDFFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iM/ZhLJLAOFSv51qJ+4ioe4KWrEFpKPA/ZJyMqYetY1JKEkzbEVFvEcJPAf8VM2WlSdT5aSBcgvLY856IKA3AyejHSyV5awXT7kIYTLXCpuGGik71sXO2174mBwnzCCMQtUHWxolz0fhsqTNB5RM4kStuCfYPnAlBa1queWCBV805a/qNG48pUQlZYUKGNwtu87EPXRQrKY+l1r3iu5RfiQOceefhS5j7AuAHUtziDhLcuzH85o7tszh9AsQUo9rGhDMcea5KCwopbqfyqX7aFxjZdqB8Ixm+hfYoC4d3LmahrkoJbXl00hU+TU0SPKZ3TRp/3gMoi91XZGQn5v+hQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com; dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=skQK5h6w; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org) smtp.mailfrom=mt.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt.com header.i=@mt.com header.a=rsa-sha256 header.s=selector2 header.b=skQK5h6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mt.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=markus.burri@mt.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtXTj4pjmz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 23:07:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoM88MTYRT3uoYSNp6XEeuxuXN6jbTo6diQvg/4YCYmDMPOVO82SNhOUmVJ1jIvYxVYINyhu8Mu+HLJZNLcNIfy6wLpALjSWqM4JJvGlgG4cvpZ852THnLynPZKHzA89AEe+5EUqwI66LkpzxMjk/KA4nq9c4Jt44WcUoJ4QbaBunFgch1Jd86f3zz17uGYxrZ+Jef/pFsgq8OwFB7q4ub4OSyUllWXjWZ4SLJ1SpC3s7ebIDbbTCCO6BlQG2vQHWLiouQpuO9r3S9u5uDnn+2W6bpV+nKhRRpXZgsirNSyjQ+f0bNb4AHbCs/tkqY4VmOCZZ4EYWuOuwDSl1HAfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRDR/onfdWCuzRRmPokvPr/QmVBJp1A2uHl38EGDFFs=;
 b=NmSTSxkcCF48l+4mKNx0P/isvQKrb/BOO5pcA21P4G/8RxIj0fswH9xGnsKKhx91UotqVnptceDukGe5UQG6UTP8t6awo8jHzAU8+NEgik4wiwio2IxHGW+Uxqo5jBe+zFn5lyIebvjlFkqV424aVRW/dQhnaRe2yhjopvkFwe5JCLjjfNCX9FownjR4hG7jnQEJm+Xgv+Oi4ADKkkb5+w7MMayeX0tWpf+Y5tJwrfWwATEfcK3/eP/Ov7Rgl6VIGD0Gdc+8AMz4athx/5zs6CbYfD14x9qQgw/BGE/c6+nIY4SpXyMz0u5977eHy49seinE6zhRH4kxVd04urFoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRDR/onfdWCuzRRmPokvPr/QmVBJp1A2uHl38EGDFFs=;
 b=skQK5h6w4o0EIPnCb+YWdjaUdySUHrcMkc0TTsLddxXiNO4M5Hr3yidf2jchjPW2jrNVnhZGvy9vr/drGPn0n9miPaRWM31aLUl7TDe3Fas4OEayDgi2xqhh0NrZCglc9Md+7GUETmgTrEbPFEG86eff4Qt6HetxvKzrS8/jof9qejZ4OLuBvTWeEgGbHl0dFlDuNMcb5pO/RZYmxBC7/FqhnH862UPfva3dqyLjE+jBH7UbCL2ZSdum3XD/YF/RX2xhMCgoo8vwmv+MLIN2O88RZbGriC2KbP6eSG01awg69t0I/D2msG6JeyCYmou1VMnSDTTGGKjSxtHkjJ2nlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 DBAPR03MB6439.eurprd03.prod.outlook.com (2603:10a6:10:199::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Thu, 8 May 2025 13:06:55 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Thu, 8 May 2025
 13:06:55 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nuno Sa <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v4 3/6] iio: fix potential out-of-bound write
Date: Thu,  8 May 2025 15:06:09 +0200
Message-Id: <20250508130612.82270-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::16) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|DBAPR03MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: acd65b42-e60a-4848-d383-08dd8e313527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3XPYURECBMz6fAEhTDgi69k8o9VhuM5rlAxI7Dd9NjRdxvz0DhjLYhs8z16k?=
 =?us-ascii?Q?KF2WmDy4kJgXu8feIXMrYSEj4YlN7uQ4fBqzD/NXBqUppLq/0aCLRTJGzypB?=
 =?us-ascii?Q?nWAqnt6QpyX0NRAPd81OmOChx5UaN5GtbYk2qPPU9CDQMBMPEk2GyQOfZlMG?=
 =?us-ascii?Q?vcNkAg8hBmuftlKtdGAVca4r8lbpUpTNI1bdKDgXwFaZmp/hXIQ9KXFj8KYO?=
 =?us-ascii?Q?ETjpibs+5nyKWiVXe7c0kGuk7MkGyhBoJzqXqApQZKO7+xzpqBFKUMD/jGtl?=
 =?us-ascii?Q?h+sAmCnHsGLIhodk/0LpDemPAMhYON5ZWlj5gLkC6JvR2vaZ0pTzC5GtRYGw?=
 =?us-ascii?Q?dtnOi9RpOCoFk3JLoiSKxrdAax/HIPBKedeJm8eGyxKeRQ8Nvqo4aUcaqLEL?=
 =?us-ascii?Q?i41YlLxwyKjO24WpEjqulaesYkXjuvX4ixm8LozUmNbqmFxQjcmQqU/pgOOQ?=
 =?us-ascii?Q?oXhh4CdScqx7S5rQ6gbhiWtewmiuA0rMKayW1I/Yjmnm8DV+k21cY3d81mQa?=
 =?us-ascii?Q?L6GhmOIzL3wJHWhN+T6lvjHH4G/EtQ71RVdtijxYmoZrNE6vJv6eNbLl+Bii?=
 =?us-ascii?Q?kKjDpciNILWei0AVFUUXOYXwajVo9423MI1Yuyqy0egFDoXSDePdUeWH+VQT?=
 =?us-ascii?Q?1UaWsLuSoojArJA4nM5dA5xfnZRsQtdAXI+vChMp+sav0viCRyDNVZSLYs2I?=
 =?us-ascii?Q?ADTsEFzV5Y5S/5SLkLB78OoCMcw5u8yKgtwDEh9yGDkLHQO3YremCmTGzFHL?=
 =?us-ascii?Q?uqad2rTFj7xsNxzW9zLVwgP+dAbDK5gAmo6vWuYIq8moRd0gVVa5TrKtlE/2?=
 =?us-ascii?Q?SpoA1/hiO1bn6qn1/UB5oYje1cdESfR1GRARt2MMzHRWxx2uEr8kKL/StAJV?=
 =?us-ascii?Q?fsVXL3m91+gFKymx83kpY4dU0oLT3AQ4VBsTrOr5BLxBYIEYNt/tewnXD682?=
 =?us-ascii?Q?Ht3AthXGYSLIp/z3tb6vZ2UND1uA25Sivp7iQUqOr/ydTtLHPjZr5AxLwiI7?=
 =?us-ascii?Q?D0mMd8ObHVHuZ2d/HeyfqPb5PZm+fYuUFguzDR1kytUjPnS1CheOoyxCNoXo?=
 =?us-ascii?Q?wbNrj7KPgttY+chd5tj3C59LcJG6LG2Rdlf91Rn/7A4q4myCAxc/mh3i5bwQ?=
 =?us-ascii?Q?w2lv/KiEkGH2k4S2kw53Oj1oAv6vXTUYPdJiJr3vFNvSftydimI5nNo2YPGs?=
 =?us-ascii?Q?LckMSPwXephIe48ojlHXrsKHayM+zVsesc/5zeFF625nqvKKtRmjzhwcvC9k?=
 =?us-ascii?Q?zHzow7Yv3+mLlzYY6XLs6TqGkwQkMkxk/mDICDd7riR/ZnWouko//lC1bQAc?=
 =?us-ascii?Q?wbSk0zhKtPq4z6rlSUjGwzurLcbpxzQOa60z2DNxkWBZHPogALbl4HXkxlRH?=
 =?us-ascii?Q?PShX9Mam/9eSm93j/NS48yDrnJiqCJMlZ4TekAgI8kFatryRfZk6GQMAM4BT?=
 =?us-ascii?Q?OlEBcz6p0jiXHky75v6VgsEx6a15Uh/Fros6buUtiHG95wsfqfm8eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7TZt4CvpD0XR8WQZsF6nqIGynQ78sbX5LPNdN14B0OHNwsZoawpuQRZhW5Q?=
 =?us-ascii?Q?6NL21wxTl0AsxldA+2GzSy4CDsMXCOyfPfZkyZCmFJKekNSemhB/OHOKbezW?=
 =?us-ascii?Q?8PVlwTZZkFAtempfGlJ0mA3cLjQv/yKZ8zQfz5N88rohZh1p5rTi2SsGqnVv?=
 =?us-ascii?Q?bAkpNELA+2lCSzgC3sCuFOGWeybC3FY5wB4kT8HtZ7CrFmM/UTnGBU/6MtdR?=
 =?us-ascii?Q?JD86CEtKNMUMqyQfmg7K0luwsy/zc7RRO3EKtXbH0FnNXDQlSxZl2IICsHcX?=
 =?us-ascii?Q?gyebZHDhxxuuPtElx6MyqlJpTMnDz95c7kcQwGNvt9+pIWExaP1U/psJBe5B?=
 =?us-ascii?Q?sDlYyaKv8QOJ8UjM+LcHJGzL/sWD9wycNWDU6JVjYT0YJOdpd+xnGBF2XmG3?=
 =?us-ascii?Q?KcutGC614qX+7d2A53g+iFyB3ValuUeAwG/7Bc07UsFNMfVkWdQCBRYqHvyZ?=
 =?us-ascii?Q?N7EpzIo/vBe6TNP48Iz8m3qqsaWVcxmjZS5PfzmRiIZkWGn+b62Mv4NXwbGa?=
 =?us-ascii?Q?wBj3cOy/0ycuj2rgWZEzbuqAgNT4bRKYonozDmB+hGv9V2JS2v2+5VYP3jy2?=
 =?us-ascii?Q?T4UtEla0PPtO6zL9wPifdlLAbMChC2ulD+JODtkk4hs993MEq8TfdvM/PUWu?=
 =?us-ascii?Q?QbLvTKPc5XNOP3hYV7uO0r9HX8PR2OR6MWfeC+8a/kAPfbASIo+nyaJHkrdo?=
 =?us-ascii?Q?pZVjbdoawqAl9o9AwtSKd+SdQWMyNkSoSxhrEg1b+TZSUfSLU25tcJK0NewK?=
 =?us-ascii?Q?0e0XHuRFEbFvpYsiMpciLZLq58ITq10Vf3NjCl9W2VgdIP/RGBpEcRoG6a3w?=
 =?us-ascii?Q?lXGtjVscTZml9dlu+FoTd6B5SVj7q/tJNpMyhzna6CbFdvipGMBa2d11F7zn?=
 =?us-ascii?Q?8fOU0GMLppGBxgSsqE4DlOJya9tFHlorZQDqCmxbmf9D5OuXlu08HbJ+SFWs?=
 =?us-ascii?Q?SQuufD/aDACieYMJP949CGexWLps7pyRQ5FW5547HyrCF1IcYTp68xcss4EP?=
 =?us-ascii?Q?Mt28W/Z/3jNIqUpBP/zPkszDBfjdYCVV561d3QiEdjAsjL2JyBbymuqpgSfw?=
 =?us-ascii?Q?7f00nSjKuNbN2/x28V1VNizYquP51EeCySC2rs3FsZiSc/yorF1vZSv4El9U?=
 =?us-ascii?Q?U1mXpoAM/IP07bPVzr0ONieLcxAU/ZSM0JhjmemAWU4xXKmxxHKSbZgp8Yy1?=
 =?us-ascii?Q?4zVVzOwKNmMQQR3h27LyhDKjFK8SYgkaWmwW7vtenFb5UcCWU+pQAwxP7PMt?=
 =?us-ascii?Q?ORmJE7x2tfIbNi8enbZYxSy0RD5znp3wuU4YSGMgccZX19QE2egRNUwwwl00?=
 =?us-ascii?Q?q4JfpLHjI9lCKLT5r0rYcYEN7SRTEZdVluedTKFMUBPkWvW4cbGbGNcKGktO?=
 =?us-ascii?Q?MwJYirHguC6Rg05oboD2MFzOkUMaBjXvRz2b2E9n4C43HjeQAQLSjsuMolQV?=
 =?us-ascii?Q?mD6wA4KMhJRrLjShWdrvqwdE/DikwUtnyTWsj4GidBdfCvTDJ3PuFf/OnFUt?=
 =?us-ascii?Q?AqTTHsqdbUyQLeyc1VGCsOIsQ2pmQRnG0OVq3i+/+Z8Lx3byQidSv//rC1g7?=
 =?us-ascii?Q?bQn795tdCGGFi8OFr2Nl1yJtZpw6qvulEv35wWlT?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd65b42-e60a-4848-d383-08dd8e313527
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:06:55.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: le+jr6sQGJ5ZrccxKg/zDx57d9n6NW0FXP9xtZRwpmfcvdoRicEoBLKcOHy5ycGodIK5NS2Zff5/WqtCx9iHcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6439
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The buffer is set to 20 characters. If a caller write more characters,
count is truncated to the max available space in "simple_write_to_buffer".
To protect from OoB access, check that the input size fit into buffer and
add a zero terminator after copy to the end of the copied data.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/iio/industrialio-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index b9f4113ae5fc..ebf17ea5a5f9 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -410,12 +410,15 @@ static ssize_t iio_debugfs_write_reg(struct file *file,
 	char buf[80];
 	int ret;
 
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
 				     count);
 	if (ret < 0)
 		return ret;
 
-	buf[count] = '\0';
+	buf[ret] = '\0';
 
 	ret = sscanf(buf, "%i %i", &reg, &val);
 
-- 
2.39.5


