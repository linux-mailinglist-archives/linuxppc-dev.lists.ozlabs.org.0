Return-Path: <linuxppc-dev+bounces-3554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D39A9D8CF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 20:48:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xxx7w0GvYz2xyG;
	Tue, 26 Nov 2024 06:47:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::601" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732564075;
	cv=pass; b=I+O5YPw0mDcX8x89Sur68PmCg1KRRT233HXTwqaHhkDauyfy6owSYs1glUeGPDQ/3FjGdTPzNOzIHYmqF9xzl2WLdIld3usxH+WuBnoYuISAmKAV7KxlVmBAhgeDC7ErV5yVWTEXrtzMPUuvIt96N4Gj0ui6vFQqQm4NoLEgUUZMRw5CDqV73F1nCSQbCfT5dpgmNrkEYmmi3tcwXzcYo8A0vlZGW1tNGoI5kt0ZND1JEE67YCXtf20Fq9xw3t/AkdIr7/gxnZNcl/mAgNtw30YH36jkF7muWRnJJn1PDNwoY2tcPNyh7v02zPPR8x7Pde+GIah1+FuineFCuIau+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732564075; c=relaxed/relaxed;
	bh=dFPRIk/xKpTrLRYrzDG2vB3pZqQIeSOOyv95HedAbeM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HlqyF/jorTmRiL5fv1icrIIaPPWRX3KWuJtV5H+L6r9+P1WFw6KDZXt0cl8FsSGsb3xv0E/S84aU7AgvlJo64FcXW0cOQQLWshnw+xOKlsMCnGT166jhHDNxiG3N2N0O7qxfhq4k9YipSwbKsBG4kf93/WicsovmJ2CreUxQ6f3y5gXtjWofr+kWHl9PKMeK4lYM5xKPaA4Td6UFuOklQhxbAKlkctrT9wqmyVB4IKFLnTsD6cjB6V7vourbR4NG4H87kGtYZWawk3uD8ZTlcb+FLzEO9PsAP0eKLUkc+7g0GFmOYCAf9Ocm1ynZDC8xMmxeLbF+jpniNswARebEBw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MqXpVL8P; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MqXpVL8P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxx7s11kHz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 06:47:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnFwTizwxtVwefz0Cq0e+/tsRGxS4vhx1eqCT6yGqXDVRi//dvJcrA5MsL/YrgWpQ78Q4KtSkoSYHwxFD4Zr9wxbbQ8/qrXO1/Eg/BgwxCt+Mz3CD7s+D/lDtnlfv8p6S/lqVTk5iGtMk1mxHfujxIpJGc6OHmacEVXDNdEDvgd0Q+ODUE4Dvkn205bI2wB3oeUHHFRRXsvcgBSMESdNzF5l3W4uWNEmZtLIRbv3V/LMDsXv27aZXyoo8o8TL/2p69io7pfrnsj3KJT1YQRUYek6A4H+jJX4YSYryPH9Nme0MALfGsds8W37M/wj1TeILgcmuxERmsrfL+FUBCiwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFPRIk/xKpTrLRYrzDG2vB3pZqQIeSOOyv95HedAbeM=;
 b=C76yIffPQn+H9MFkaPt++A3zEvDMHtse2HBYCgx4elOTlRbcTNVDSX8qNiQJKiz/aETwKPxgvyvBAs+3ZBFRmPHo+UdJMlank8EoXuFrJzgjfUt1CE4/bcBDsH9pdhE+Xy3QOBhoBaLDPDw9YBnczb3eBqzqpkcUdH0+nHAhESvNDxTUmauMmw3aG76CBbtR398wRTOF5YJZ3JgC1iLmVn5EnvNpCI5odcnzuS7ja8FQtwZxK4BH3jdcCQDZE761Kggo9y3pp+aLTUD6eC9/WQ51yrFXiqIu6US2PJa26NbuhaA87PSFSvxnvT2kK7Dnnsu9za15K3pmhT5Cg1tFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFPRIk/xKpTrLRYrzDG2vB3pZqQIeSOOyv95HedAbeM=;
 b=MqXpVL8PjhflSuToWPQ3t6jMTbKhnccNRB997NcVP36TZ7wsAC0epomgBVLUGWtsbJPM0IS6jX6rE1rsyCs6v4I/7vGWTgW7gr7kB2vI4xnuZx9Sd45t8ITaPdEQLXa+GTG9j3SPcmwjPCU/0E/6Mm/a/1ZVr1BpEPQTMLYt2rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 19:47:27 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::38ec:7496:1a35:599f]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::38ec:7496:1a35:599f%3]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 19:47:27 +0000
Message-ID: <b08da57c-1ca1-4dc8-9c5a-550f81dd3b4f@amd.com>
Date: Mon, 25 Nov 2024 13:47:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org, Lukas Wunner <lukas@wunner.de>
Cc: mahesh@linux.ibm.com, oohall@gmail.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-3-xueshuai@linux.alibaba.com>
 <a76394c4-8746-46c0-9cb5-bf0e2e0aa9b5@amd.com>
 <22d27575-fc68-4a7f-9bce-45b91c7dfb98@linux.alibaba.com>
 <9810fadd-2b0b-410b-a8a6-89ddf7a103b9@linux.alibaba.com>
 <11282df5-9126-4b5b-82ae-5f1ef3b8aaf5@linux.alibaba.com>
Content-Language: en-US
From: "Bowman, Terry" <terry.bowman@amd.com>
In-Reply-To: <11282df5-9126-4b5b-82ae-5f1ef3b8aaf5@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:806:130::32) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 5adca5de-d336-459a-7d31-08dd0d89fd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWcyOEVEUDY2TjVPaXVPRUFHNHNVL01qc3JSVTl5TEFOY2xxOExPZm10ZXlO?=
 =?utf-8?B?N2hRcVlNOEZMajNQYTFNNk5sUW5hTlhTa3lSUGRTSUVZT1RrMVdxTERLdEtG?=
 =?utf-8?B?WW1hQzd1ZFF2aTZlSnpSLysrbW0zOUFObjRNVHdoeDViUHNBQWNkTlY4eWgy?=
 =?utf-8?B?YjQ0ZVFxaDA2SXpTSjg1TDdUOENnaGpQWmdjdDcvbG5GeTV0U1B0VWQzZWdU?=
 =?utf-8?B?QzJCNEcrcEI4eThvQXhsK21WcmYzQmpsQjQ5aUFPNW1tT09xNVpaajZoRTQ5?=
 =?utf-8?B?VXNENzJaR2tuSU5BM1hjc3dTYU5OQ0RRMGFYR1dhcTQ5bnNvRTVmWDRPZ0lv?=
 =?utf-8?B?N3BkSFFndE5VL3M0UEVOc0hTZHg5Q3htb1NhNW82NzdySFVjVTdHWXNIVzlx?=
 =?utf-8?B?eUVXOGtRb3ZKcG1kM293MXdub29PUGQrVFE5MGlKUk1lckVkR3VKYm1meVFO?=
 =?utf-8?B?bmdHZk5iVzJ6UXQrMkEyMHBKRURUcHpWKzAxSWd4c2RwdHNHVTRGN0VldGZ1?=
 =?utf-8?B?Z3J0THYzNUkvRWFDYmkrd2FiRXpESzhZWVJWdVNHRWFZVEp1aFRUWFh3ZFd0?=
 =?utf-8?B?YWJRWUdzTHMyQkxMQlpFb3AxelBOZGF5anRIbkZmRnh6RzhiRUZxOFh6THVi?=
 =?utf-8?B?UW5Zak9CaWREYm80Z3VMdlRtYStYRk1pY1QzMkFyblhVOW1Gdnl1NDYzVVZv?=
 =?utf-8?B?RXFRTnNmU1Uxb0FFVTAzd24yUE9oQ1M3NmtYY3pmK1FTaHRJUUUzeDROZUdv?=
 =?utf-8?B?a3E0ZXg1NUFiSmZyb01mN2RGV2xVUUNxOHhsd0M0YkxXWEJicCs5dDcxVld4?=
 =?utf-8?B?b2xmMmZ0cTZNRjlHNk1lbXhuTFMwRkxpSUREQ1JnTGhFcG1YRDd4UFpQdHU4?=
 =?utf-8?B?eTN3MFVhdWE1MXY4T1lsdTE5amN5bDZSUTU3NmptUGZKMXcvbE8zQWRUS0dP?=
 =?utf-8?B?enJyRDM2bnJqSFZtKy9qVVdxamlkU0lRVEcwMjlLZTdVenJ3QTdYc0xDa2dj?=
 =?utf-8?B?M3lhbG4xNjVVYUVaTUpjV0JMbUxoYjNyL0lQRXA4L1h5Nk1iSHZ5S3lKV0w1?=
 =?utf-8?B?YlZqNXF0UUpNUWhqWjBhaDVQOXRzeHVvVWViUDA2d2tZMnhuZXg4ZUl4NUxI?=
 =?utf-8?B?anQrOWd5NE9qMUg5UzBxZ3dzRVp4ZUFMa01FZU9JOHAxdTFqWjFOTWdUd1Ju?=
 =?utf-8?B?YTRKNXQ0K2IwSGZ0RG95dUxMTXd3TktHZmU0eEZ4RmU5eVgwaEZacldqc1Jz?=
 =?utf-8?B?UVQvdnVxcjJ5UFRUbzd1N3J2TUtkVGlSM3AyVVVNWDRtUWM1Ui83RnpTQ0U4?=
 =?utf-8?B?UUNNTk8yRTlXWWJSV2VybVR1OXA5WG9Yb0RYdTlwMzdIa0c2NHR3VE0vU1B4?=
 =?utf-8?B?NEZYMDF4TnVrMlJQcFp1cHdUYnptYXk2L0pNVElmSitKSnI3ZFFvci9HL09P?=
 =?utf-8?B?aC9nWExIajQ4UkNkT0U1ZTJVcmRTVTNiSUVXa2hnZkVndWhnOUxrd0Rjelhi?=
 =?utf-8?B?OTJCeGtxRllab1czUE12bktpbDFVVXRIMjFRTHZTYmdTMDlOS01JaXRuYWtq?=
 =?utf-8?B?SU9zUmZ0OEZqRXhFSUttUEdsSXcxcnRlWGY5Q2NZZS82djRzcy9ERkpkOGp6?=
 =?utf-8?B?K1Y1SzY0bE9oSXlocWRRK3cvVXU0N0s1bTZrUTRac3RFZ21ZMVNDVU43RGRR?=
 =?utf-8?B?V0tLODFBV0JKU3VYUW5tS1BzRzU2NGR3b1grVXJWQ2IwS3Y5VWZRUWVqem9J?=
 =?utf-8?B?Nm5xcjFVeXFZVWlIYnRDM3BMdkFDNWVMUGVyc2hnTFh0cnZ3K2R2akdyV3NW?=
 =?utf-8?B?THZReFRkY3hqZEk5YXdIZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym1ES2lBSTNzbzEySXJLQmNPM0FIQk5MOUV1SW9xcUhqU3FxN2h4d29UNUVS?=
 =?utf-8?B?eXdxZUNQOEd5U053ZksyYXhEYVFuem5jcmpPOFJrcmRkcWlUYWRGdGliVUxq?=
 =?utf-8?B?NE5Yc1B3ZVZQa1ZLWllpMXE5aVhkYm5hL2g3NFF3MDlPZ0Flc2gyRk9ISlIy?=
 =?utf-8?B?cklLWGtKUXpKV0FkM1JDK1pZVFhGU213ckhpMXNGYXlHNS9ScXdjamlGc1JZ?=
 =?utf-8?B?MU9DR2lmVkJoL2NRUXFCRlVYOXB4RVA2MjNYRTM1WWlTckpUa055YVU4S0xT?=
 =?utf-8?B?VHRHT1FOR21JUUtXRjJaMGljRkJCaHRoYTdQTXM2Z09IODVMUzFZR3g0Wjl5?=
 =?utf-8?B?RytRSTFJb2VIWDRhVGl2MG52WFhHNXBkcExScE5Oa203cGdnRm9ZTHFZeXVt?=
 =?utf-8?B?ZzdnTnlFN1NhM1NWSUt6TXpVZSs3K0NMNUZ1NlV6OUhJbFJJN3c5aGFSemlS?=
 =?utf-8?B?a3B6TzVrQnpGVXVHYVUxSTB0RGszNXBhWlV1MnBzazExUXlwNEZsZzVoYTNI?=
 =?utf-8?B?bnJLRmJGeldxNVphWHVXQ29RY3IwWTNGWkhPTnA4MjhMQTcydDF3VG1Pa1c2?=
 =?utf-8?B?RUQ3L1pJOTlHbFc3cFVUL1VJQXp2VVJicEVLQzE2MjhLNTBSWnVNUmhSSU03?=
 =?utf-8?B?d1d5VEpxWlVpUVdrdmJwTGdzZE9TbVkzTldlWGk3Yk9DRUx1WFpXNmZOSHhh?=
 =?utf-8?B?dXc4Sm1wVnZ5R2FMK0MzTjVod1NWU2xyT3F0VVJEY0Qwc01RSEd1M21yUzRL?=
 =?utf-8?B?aEU3d2VlNFUwcGNBTEgxNVAzS3lFMjI0ZnNVOWhObFpsb2ZmQTk4ZitrQ3RX?=
 =?utf-8?B?ZnlPWFFqVWdBcEdoMUVwRzVJSk5aelUwaDJFbGpGUEYveXJzMmlwQ2p0UHJx?=
 =?utf-8?B?bTRaUTlmYWUvWTdjU2RVdmloblFUUnBndVVUeWVxcm5TaW9zRmI3dXh2YjBm?=
 =?utf-8?B?L2hCMnBscnlsR1BydTNlSWVaZ2Jqb0JLeGkvNkp5bE80dWZmK0xBeEFEd2VO?=
 =?utf-8?B?cGpzTlU3VXBpbHJZUDc5UGlQaEN2YzFIT0xjZFFEOXFNeHl6ODRabmFDQzJp?=
 =?utf-8?B?cm1pRXpzL2ljdGFPS0paUTBVZGNFcWFKb2ZNUm9qK0wvbXhkbTZDNEErZ3Bn?=
 =?utf-8?B?RzN3MzZENStzb1ZtM0JQNG9oTTUyRVB4T2wvdm5HZTdpR2c3MGNkZzhMY1Vh?=
 =?utf-8?B?bmkzakNuMXlUamlYVTRIQ2dRUms4K0RRZC9KL0wxYTFSSk05Q0VNTFRqbkhH?=
 =?utf-8?B?R3N4MEdVa29keXh1KzVpZ3d1WGFtSHFuVDk5eXRRdlBYZ3FHK3pwY0hsTUNu?=
 =?utf-8?B?WHhLSFBkNndHcEt3clplMEdQVWo5RDRETVJKY3JLYUlJVEUrOTFCbjBhRmor?=
 =?utf-8?B?SDZZL2Z1VU4zSDVLQm1ud1g1Z0lsL1VXMXM5OVdRWjQzL295UVArRHk5WkRh?=
 =?utf-8?B?WEppOWQ1b2tOanQrb1hYVE5ialQyNnR6eFc3ZjZ5TWFVQXNnLzZUN2gwYmxv?=
 =?utf-8?B?L3A2Y2JzYy9RZ1ZZUnFsT0FJNFprR3VOWHpTVXIvM25yM3IyeEtvdFZ5R2VO?=
 =?utf-8?B?blZhaWY3SDRJWUxYYWNsZlNCQUxkTWFmYTlRSS9DTVZEL1BQN2VldElwdm8x?=
 =?utf-8?B?RUVlRWR3QjhZYi9oVjFIb21TenhUbStJcnJnY3pxdTRicEZ6MXBVVWVvQ2x0?=
 =?utf-8?B?bG00WW1VUDlIOUY0d2YzbDJuL3dJYmxUN25vYWxKRm11TDFOOEl2cmFEZTU2?=
 =?utf-8?B?YSsxL2dhbmlxMVB5a0RSakZFK204WGR6WDk5ZGRoNWtoeVc4Vi8xUmYvV0ZP?=
 =?utf-8?B?RlFaZC95TnA0T2NZbmVQeFEwSTdmVHU3aHFlOW02WFowNDhTRjBHZjdDRll0?=
 =?utf-8?B?UDJaZFFpWUppMGpxeTlKSTJQUnBkcjdOcXdvZGNIK3h0b0xneHRySHJlU1E0?=
 =?utf-8?B?aVgrWGovUlBHK2tvdCtBUnZIbVlkSXUxa2FQNnRaMEk4K1JFWWdVQks2S1hm?=
 =?utf-8?B?aUgwUkdaU2VlbVBlcTZvQWFtdlp4ZlY2eTMzbUdjVkhyeENMTFc1MHhCNHF4?=
 =?utf-8?B?dWZTMUNrc1kvVkQ0U3hMcmNzUHB0ZHZSM2RyVGhybkFhUHJOUENSYzB4cnl6?=
 =?utf-8?Q?LAVutRxSZa/dVHsjADjadlJNw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adca5de-d336-459a-7d31-08dd0d89fd8b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 19:47:27.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nenPeA1Cbh0Nf0WSH+fVcCIc2kCY31+MSMixltmIao2bMP/3tENUT9KWxqPt6/5N4J3drVH7+Vcl6A0EfnGeqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/24/2024 11:43 PM, Shuai Xue wrote:
>
> 在 2024/11/17 21:36, Shuai Xue 写道:
>>
>> 在 2024/11/16 20:44, Shuai Xue 写道:
>>>
>>> 在 2024/11/16 04:20, Bowman, Terry 写道:
>>>> Hi Shuai,
>>>>
>>>>
>>>> On 11/12/2024 7:54 AM, Shuai Xue wrote:
>>>>> The AER driver has historically avoided reading the configuration space of
>>>>> an endpoint or RCiEP that reported a fatal error, considering the link to
>>>>> that device unreliable. Consequently, when a fatal error occurs, the AER
>>>>> and DPC drivers do not report specific error types, resulting in logs like:
>>>>>
>>>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>>>    nvme nvme0: frozen state error detected, reset controller
>>>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>>>
>>>>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>>>>> after hot reset, we can still safely access AER status of the error device.
>>>>> In such case, report fatal errors which helps to figure out the error root
>>>>> case.
>>>>>
>>>>> After this patch, the logs like:
>>>>>
>>>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>>>    nvme nvme0: frozen state error detected, reset controller
>>>>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>>>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>>>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>>>
>>>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>>>> ---
>>>>>   drivers/pci/pci.h      |  3 ++-
>>>>>   drivers/pci/pcie/aer.c | 11 +++++++----
>>>>>   drivers/pci/pcie/dpc.c |  2 +-
>>>>>   drivers/pci/pcie/err.c |  9 +++++++++
>>>>>   4 files changed, 19 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>>>> index 0866f79aec54..6f827c313639 100644
>>>>> --- a/drivers/pci/pci.h
>>>>> +++ b/drivers/pci/pci.h
>>>>> @@ -504,7 +504,8 @@ struct aer_err_info {
>>>>>       struct pcie_tlp_log tlp;    /* TLP Header */
>>>>>   };
>>>>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>>>>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>>>>> +                  bool link_healthy);
>>>>>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>>>>>   #endif    /* CONFIG_PCIEAER */
>>>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>>>> index 13b8586924ea..97ec1c17b6f4 100644
>>>>> --- a/drivers/pci/pcie/aer.c
>>>>> +++ b/drivers/pci/pcie/aer.c
>>>>> @@ -1200,12 +1200,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>>>>>    * aer_get_device_error_info - read error status from dev and store it to info
>>>>>    * @dev: pointer to the device expected to have a error record
>>>>>    * @info: pointer to structure to store the error record
>>>>> + * @link_healthy: link is healthy or not
>>>>>    *
>>>>>    * Return 1 on success, 0 on error.
>>>>>    *
>>>>>    * Note that @info is reused among all error devices. Clear fields properly.
>>>>>    */
>>>>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>>>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>>>>> +                  bool link_healthy)
>>>>>   {
>>>>>       int type = pci_pcie_type(dev);
>>>>>       int aer = dev->aer_cap;
>>>>> @@ -1229,7 +1231,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>>>>       } else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>>>>>              type == PCI_EXP_TYPE_RC_EC ||
>>>>>              type == PCI_EXP_TYPE_DOWNSTREAM ||
>>>>> -           info->severity == AER_NONFATAL) {
>>>>> +           info->severity == AER_NONFATAL ||
>>>>> +           (info->severity == AER_FATAL && link_healthy)) {
>>>>>           /* Link is still healthy for IO reads */
>>>>>           pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>>>>> @@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>>>>       /* Report all before handle them, not to lost records by reset etc. */
>>>>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>>>>> -        if (aer_get_device_error_info(e_info->dev[i], e_info))
>>>>> +        if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>>>>>               aer_print_error(e_info->dev[i], e_info);
>>>>>       }
>>>> Would it be reasonable to detect if the link is intact and set the aer_get_device_error_info()
>>>> function's 'link_healthy' parameter accordingly? I was thinking the port upstream capability
>>>> link status register could be used to indicate the link viability.
>>>>
>>>> Regards,
>>>> Terry
>>> Good idea. I think pciehp_check_link_active is a good implementation to check
>>> link_healthy in aer_get_device_error_info().
>>>
>>>    int pciehp_check_link_active(struct controller *ctrl)
>>>    {
>>>        struct pci_dev *pdev = ctrl_dev(ctrl);
>>>        u16 lnk_status;
>>>        int ret;
>>>        ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
>>>        if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
>>>            return -ENODEV;
>>>        ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
>>>        ctrl_dbg(ctrl, "%s: lnk_status = %x\n", __func__, lnk_status);
>>>        return ret;
>>>    }
>>>
>>> Thank you for valuable comments.
>>>
>>> Best Regards
>>> Shuai
>> Hi, Bowman,
>>
>> After dive into the code details, I found that both dpc_reset_link() and
>> aer_root_reset() use pci_bridge_wait_for_secondary_bus() to wait for secondary
>> bus to be accessible. IMHO, pci_bridge_wait_for_secondary_bus() is better
>> robustness than function like pciehp_check_link_active(). So I think
>> reset_subordinates() is good boundary for delineating whether a link is
>> accessible.
>>
>> Besides, for DPC driver, the link status of upstream port, e.g, rootport, is
>> inactive when DPC is triggered, and is recoverd to active until
>> dpc_reset_link() success. But for AER driver, the link is active before and
>> after aer_root_reset(). As a result, the AER status will be reported twice.
>>
>
> Hi, Bowman, and Bjorn,
>
> Do you have any feedback or other concern?
>
> Thank you.
>
> Best Regards,
> Shuai
>
Hi Shuai,

I don't have further feedback or concerns.

Regards,
Terry


