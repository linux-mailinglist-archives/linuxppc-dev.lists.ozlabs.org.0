Return-Path: <linuxppc-dev+bounces-16455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KbuHz2SfGkQNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:13:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49CAB9ECC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:13:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YHT2yKjz3cNB;
	Fri, 30 Jan 2026 22:11:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771509;
	cv=pass; b=BKtELrSRaxoJdfoJEmNKKvd62qifGK+tlhthQFHMRTtT1CW+7LSJyzD5JKMZFMROdpNlTuEcaSGi7qKGIHyd5K6IhlleTVUcKVrSHdTMu0IPhU0wyG+b481ketFDV9YJCPNI6zb+FUXlgISmM73N52UXGSHf4pZS9AeQtVgM7a6r2fLsVPsJ46QixZzgMD53PVN1alXd9F/WEQ/dJwC4Xuefq6dgunwYGw60Z4m8UkX8h9feRVubmlRcOtjLL1UVHJS2WKqcZJd/TXAYlFcVOkVTNEhd56h4QpIJc/h8lPuvNq214ZG4Jx86Av3PI7yFmLwqc0Vf4PY+cJB7irHs6A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771509; c=relaxed/relaxed;
	bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxVIr1QiUHsb9u7iaP4MsDucrqEX67vssOqmyAKEEFsAzAKnzcVWIJlJ0dQNFlp1/93OtM+EJu2Xqj5jEfpFLPhidZpfaCb10ZjGldBofJDGEFmup6RnS8LwJBj20UVjm0hzjDGWgU365xrGYbR9HWJXnoh4RB3Xuv1gBfux0InzMB2L4QfgHr/ohNaysvzmk2GkLw6FQLJx5ac+BpM2JHQDe8wfwPZj95Z1tuXHqhltZaa+oXbapqZqv/HPRlXJjTwgPDVpuK2LAUBJCoboYPOhr9CsXcUJmzkSWP+MgdPbHc//FZk1dO3acJUkvZryJAEU2NUUIL87IxeLAPdc6A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N9sl/gSd; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N9sl/gSd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YHS3ftDz3cLv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZt/tSx4jo4WwN413Wn5dnKMDu0sVhOhbFOr7yWD8+gwKP3MXeLeZPSF0fQqigT2o8e19w7btOxyTmVj9IeVA53Lsl9kRwO1qmvXSKsom3aMZskpbinRdIhOuV+IdTyljTxiqpzAhzMh5dM4Qb90CnzPwS5GrdB+JFLbUaTy/UIWkqYTayLYPUR8K49J1E4QKf07a+u4+4SJ8dHB6KUpXnyuNzpVCCfdu9YGoC4udSPY07g1ZblGHli7U7icjNayEET4bP69uKGdD7yq9G966RGddUm6JfB9yEbLsuq9kjtQ3OMj+diUToInAqQBF5dX0G/7oaQqpssa1AW5tJYPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
 b=fU4L2+KPs8Mc6cAVFKa9f2NWBxy5sBIyZG6zzr6lX8qTtWyJIjeqSalSVsovVuQvfHzA2OX5FUMzzK1XYc5VRV2ZWntrntjMvCZhgHFWxKtvJ3T0s6FB5r3ndQHS9SsvE5o9SANpTzz1LIFuftLL55hyfkKEHATPezyf52W4MiWbZ5ltsggzhSyU4jsFMntRegfe7DgSbisIzXrI9ndPMTtBe00ZuvT6SO3GXL+QuaevZUfbLNOPlwhvcJ0Ik6beOPZqVzWWaIs7av7GoT4S5tR4uAQOn135Xear84QXSXKpApWzvTdIBAO2PwaKhHL/Klq/ukO8fQBn+ZjJFTX22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
 b=N9sl/gSdH+KY5dNWO0KDDo9NegxkjsSO6DgUKKFAW7W3vFzZARBwvDc8MvW/CpTY7fo6PWCRxXAAhctbqlEt4PsMqp2kpJ7uAwZuzA2jGpC1nNBKD38RCgm82ItFN+Y+5BfAiSACKGNcOlf3jQmXE9EHs0ukTcJjWsaCCksbyDOkIxMEGTnfbCyGcLGIwh4hvRX1vadCZbBZSNfkWdiizC9KVqBEX/Tke8bqLPmfAKj+OiDAEG+rfVjRG8Yk3D7U41ZBjVFiMt5DxQAk+dJHJ9wCFLv02a9NI7N5fki3A7stmml41pFYoHPXzqiNOIh/t3YEUWUA32aqFIfWK5+eDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:37 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:37 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v5 12/13] mm/hmm: Add flag to track device private pages
Date: Fri, 30 Jan 2026 22:10:49 +1100
Message-Id: <20260130111050.53670-13-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d82528c-071e-4558-e417-08de5ff055ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qUk8LY0t5U4DOsrLpT2oYTDlYFaNXwV/Z+OD0sw68K/P2GEdbu8lvcMtq+ya?=
 =?us-ascii?Q?wx5hqrtCw6lYJHlfJgpR5r5cFcuLT05bjWzd2Mq7xt2uOwLKOp9qiwnDeUnt?=
 =?us-ascii?Q?oDLZKxA4nwuhtGsOLlfPh9JN5k6TcfWHHWi2NpnVcTaL7SOiAT3kBRvTsotl?=
 =?us-ascii?Q?qJWhY/aTcx5sZ1s7Rgs8pDB6qraUrxieSnKXB3fJhPmlYB4ljn4ujZMBxv7i?=
 =?us-ascii?Q?HQV5lypMe3nwokdepG3P3Z4l4Ea7etUSM1ggk4Boecci3SxEychPwb2OFI5Q?=
 =?us-ascii?Q?vXjJq6xqa885ymeYr4rmveoG66xF1vOSYMQMTzIKhn2DR1yiXWa5rnlz3lqV?=
 =?us-ascii?Q?zyQtco9r9O7CcpW6RE5TO2ExzE8m5KMnbjumqptH518sFtsM+mjHF4Kfy2J4?=
 =?us-ascii?Q?kEPIgCICCmbg/4cHcblZz/awLaaw0nzGPCNrrNrzA0fomD4bqba3odjnCWw6?=
 =?us-ascii?Q?5tT33TpZKpWUAhbDaAURxnDCLSuPMRRxA+GcdSvb+L7Q9k4W60TF5gbJEV2E?=
 =?us-ascii?Q?0NNjWCJ/eg0Pyh2opbekdfizFGS+L166RrDqi7p/YC/HrKCwSIhLs7awNbDZ?=
 =?us-ascii?Q?4SrFUljeob0waKB5SwCNmne/uQ7pdXauZh0ngjL7KQ4Ees9PIg8O7hWGHeoT?=
 =?us-ascii?Q?YXByDhSB2qoHcZdKH0epVbyPes/UaFosC2Q16kBAGUndwbuueSlS5OtBXIb5?=
 =?us-ascii?Q?TFoVJHc6GaPBiuENcWYf/9MSp5jg3YMia9Ikl0FiQcJxa5RyHqKdt9UermTc?=
 =?us-ascii?Q?p0f3NuA5q79uhvVYeJ/J2DJL6kY3BHtdl4VRTLZ+D5NFXkPQwIsXx3RGQrnF?=
 =?us-ascii?Q?TkhULf413fIc7gJI3NEMmsDPHyVBJ8gzcMWjRTBu2REvcC7mCCuUKjUib3uS?=
 =?us-ascii?Q?wxbcrem35z09NoC03Wb36zsQ3sv1k7Rkf5d/N11qX5Lek+1rhAj+Rgumk9UM?=
 =?us-ascii?Q?a/fhD+xIwJi4iT58svohFdEgwm61bCOJXuzfLApoNHz3P6yI0hoUY5/ar/DN?=
 =?us-ascii?Q?I2gaEscmNJH0Sqn9morzPVcbYjUI7sSQYUn8Z2Cw8zrx5ca+j3TyNyJxwmMs?=
 =?us-ascii?Q?hXvyzkX65oramrPNE+XIgg1hqR2JjcxBpkVoF80qV4ZxbksOZAOr6b4xnVaO?=
 =?us-ascii?Q?6zZak096w2mrqWesX6UbCAhXtfLyu8VH1NziVqJuLmAWhHJfzkRMVDcwZ2Ht?=
 =?us-ascii?Q?JaWsqNK0DpVZUSuoG97+9189g2uDam45M6eh0oQEOKqRVAg9ElwIJLr5dWzV?=
 =?us-ascii?Q?rMDiQpTJDEes09BPSgXlhOh9C3YcuHqyAWbXZ8LJZRWm+epja1tCxziFEHTu?=
 =?us-ascii?Q?moSScf2wCpA1Pw/l7vT8YeAmkkal+eLUYRcCn9ephiHhO393rS+ebJJbsQ/q?=
 =?us-ascii?Q?9ypvCr/CT9M5OdSSMLJwk11f+vzvW1RTSIF/96+Ks1BUGDbh5KQGsSJ4wVsa?=
 =?us-ascii?Q?5G71KWl1BDOHP/VMasWreEjhH4RTz2FIwx0g4q74FjhRXGOSR8hpzVUicYzq?=
 =?us-ascii?Q?vuLMjNTqjH62ThT7kgfDWcVFDyJgyRJDC8BHMArdH99nXgXfNRI5TGQAI3OQ?=
 =?us-ascii?Q?Azeldikjs8M5eL3VKk0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OzFjVZasF1e6xRcOtm3JDqJAnSSx5hieuOwz/eEDNGeMz7uLcVY/JtRsUL1c?=
 =?us-ascii?Q?s6wQBp69jDXdWjztgc6xzFvVBodviqh7oWmk8vVhzQs/V+oNypIfUWye8boI?=
 =?us-ascii?Q?XNxp4fWdQWiIvrnF81iul2wv64KBK9J1PEu8ZO22end8NXp5u6CmvCiaQiLG?=
 =?us-ascii?Q?QP2vP5oHQOsa746M9HQ8RT6Z7kvQ2YcBTBN5D0LAxMRDNm+7F+m8TWezodv4?=
 =?us-ascii?Q?EfuT1iu/OJwgp3T5aDwt4U+/Kk26HhZkEuwGSYoM74b5bD8FMjB81ftYqtfo?=
 =?us-ascii?Q?dN5PWUZegk0B1UVCVbk8popkqB8lkJ/DNhrJ/XHvGXWwS15kc+caM+jjEJdk?=
 =?us-ascii?Q?BRCN8Hi8xa4//31dQt1qoaBvyOCmEg1c7pvSbaaAn4wg6xeybtumTYqOwuvk?=
 =?us-ascii?Q?0f0Zri8L+CP6FJeLcDVWVRi2LfN2WKdhjxLDBDiDn2qKC3k6KN5iRk+OgOMt?=
 =?us-ascii?Q?RHYeXqaPkVWYToy/L1lnYwj5Cc8uRSYfwTKqCWJnhkHmklSwZ06BsNp8HAda?=
 =?us-ascii?Q?wdVqlMU+nUe382uDkr0TZk+btu5Tl4UKETe0uBqxpRD7kMSuGQAqYT6OvFF7?=
 =?us-ascii?Q?ygbw8S2yZMTVuh6pMcN39c752W9EG2aMCvaB4pQMkAdUTrpgB8ITogxMPm0T?=
 =?us-ascii?Q?sxPBdWszW2Trz9SjqImgcM6fstN6F/ELAf6ctYMspIaIMaRmoa3p/8JPjq2i?=
 =?us-ascii?Q?Ry9zKfkTQK2/p/lX3NKwFm9qDBf832432kArbXCOtGDQLdB9ZcKyPER58MZK?=
 =?us-ascii?Q?bEZ9jC1cATDrTRkJhspWXskIHv6u+Lb0rhh19rTmPQmdZ+mYaOsu7BWSWjCL?=
 =?us-ascii?Q?I9TfHv+qAxYGeWxmd+20FmKZph6q3WUILkTr8oek70gM8J1bXKHYjL2ySUFf?=
 =?us-ascii?Q?TAJ5o41dU/pe0sUP7v/cMb2xFHP4NepFFxg0dv3Rw9iZiOGx+ZdnHV+DSGWb?=
 =?us-ascii?Q?hf7ShZdyPOWeVcFkwzDmqlpYOYrDqjMlgpA+A5+RrLTPq0PM0alALO1qiLFn?=
 =?us-ascii?Q?O9gP+BfldsD3WnNC00g8XFumLkMnioJIyHyunk5ELhDcDXnaV1/HRjo6cjva?=
 =?us-ascii?Q?4oI7+U/yB2meFUzHNn2VTS+Cgad5I6DFTwxMjt0Gt5vNrb89nia7ScLjbfRc?=
 =?us-ascii?Q?WAktorrhz2XfZsSzVdlC1oFJk1BVzD0mFQqpD9JNw73R2gHG+RCeuk3o7msG?=
 =?us-ascii?Q?WEvFA9KUOQ9x+b15kpIyJ+LEmDru2kSrTITxQpnFKSmUE9xGYgZOBLJV5H/S?=
 =?us-ascii?Q?eC+KY13uDufG/uAJT72Ahd5lcdHesewD8AfF2Plsx53ODBWtMnvcUf3PO1bA?=
 =?us-ascii?Q?u+NP6SwqgVhoGG+GweBS6pK5NxecGgGTsA6Y5uhY6DaDqyoxVLZor3J/WPS7?=
 =?us-ascii?Q?7KsdPEMrvEtgwuUdDoG+U9l9TIV2Hzsf2kGnvppG3jtf47BUeg8FK9Q4HBiX?=
 =?us-ascii?Q?ErG5CAQBIVWVA0zKfEGjQPreV4uf1bgzEtlABse0q0oVR3Aqnz97O5y3/rKV?=
 =?us-ascii?Q?yclAUPdS9S2BVQxWd1vtCkfXirI3ZfebC2NeLxzXnRtv5Njt8j6ZWkps0neQ?=
 =?us-ascii?Q?Qa9lpJpGZ1kIDdiRpN7QCKHTrm82p9GH5v4rr0Eyr9AK1e6ac7DviC9nxtr1?=
 =?us-ascii?Q?FJWm/Ji9iBE455N82HjXYTU0DtSD1qNMI8Qi1gSqC5Qo/tIOF9WdbC2ZUbjY?=
 =?us-ascii?Q?GyfAbFVwMOpJfxV//FTb7YUQw5JL9HIUyst3q8k7y6QNpca4Bggi0Tcuelv5?=
 =?us-ascii?Q?0vfu9QBz2Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d82528c-071e-4558-e417-08de5ff055ed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:37.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hYyydJxmKUrmgyKrCyE5ow4vJB0r6jE0fORAytWAhqoQJHiQuo0EYZdPRZwppnCzXVoAeheE9NNXV3wuzqP/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16455-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: A49CAB9ECC
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
that a hmm_pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
  - Update HMM_PFN_ORDER_SHIFT
  - Handle hmm_vma_handle_absent_pmd()
v2:
  - No change
v3:
  - No change
---
 include/linux/hmm.h | 4 +++-
 mm/hmm.c            | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..d8756c341620 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -23,6 +23,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
  * HMM_PFN_P2PDMA - P2P page
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
@@ -40,6 +41,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
 	/*
 	 * Sticky flags, carried from input to output,
 	 * don't forget to update HMM_PFN_INOUT_FLAGS
@@ -48,7 +50,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 12),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
diff --git a/mm/hmm.c b/mm/hmm.c
index 4ec74c18bef6..14895fa6575f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -267,7 +267,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (softleaf_is_device_private(entry) &&
 		    page_pgmap(softleaf_to_page(entry))->owner ==
 		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
+			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
 			if (softleaf_is_device_private_write(entry))
 				cpu_flags |= HMM_PFN_WRITE;
 			new_pfn_flags = softleaf_to_pfn(entry) | cpu_flags;
@@ -347,7 +347,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    softleaf_to_folio(entry)->pgmap->owner ==
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
-			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
+			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT) |
+			HMM_PFN_DEVICE_PRIVATE;
 		unsigned long pfn = softleaf_to_pfn(entry);
 		unsigned long i;
 
-- 
2.34.1


