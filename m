Return-Path: <linuxppc-dev+bounces-8165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B6AA1A58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 20:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn7tZ0LjVz3bkb;
	Wed, 30 Apr 2025 04:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2407::61c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745950885;
	cv=pass; b=IuVXCQgfutGZ848WC6UeLIl6LV6EnutnHZY9f5xt7+fnFtfk9+Ht0dh1z0iw4rxPZqqDb0AqyP1ggKzbpBnbOZHsrYVgHmDfPC6TWHJT5JVp5RC9sG5bRemQhxEUYGj+4yLicSZYTpT4Vg9Q2ch0P/DYHIOtVVSLDAGLRVay8sgcZ9TO+K43A/MuMExJN/A+cFwU2UbbC7ApbzFAYkNVpallR7k6VB/oNn7sDU8RQm+hpzfXQZ6WSlMT7hdIpHkbiLawM2r8vxXHuXfbXSnECdq1hqjLmp40yHUfyA7x2Sx3KB+ThLSCjT+omidQa74FLG+quzs/8n+nq8ms9PfdsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745950885; c=relaxed/relaxed;
	bh=Ek6W4PErRfhVGTa/r7p36hxCDJV5whLv8VxpM2zV3eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EW8mmG3TIj6KV1fJ0l7DzHYqDwAxKbfCPgwsXFNlWNTunyHTf0b3TyPxLPvtWnbsIWXejfXN6geyFaZoMEMgP3e76On+D7lRWfDqw/K1AWyY7WgZzWo7mXF8vKMOwiBiCVL8imtLiR0qxaPvlbqE/qwNBLZtVroltWGj5w4Bb1L6vLk+zXWKP8yRhPSnyzf8oSnfBEW5nTdga/sC/If4tPMKoBMd6bITaGLW97MrBrqknClGRGts2SkcA7/GZeuCeBr6/4NLh4EwyOp5YZLgJCZXuZbo4jJ3ws86zIHvqxtxaZNL2ri995qKgO2cw+3N5BBHq+FI6qJQ4/ma1Zv2OQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4UFjTb2q; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2407::61c; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4UFjTb2q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2407::61c; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn7tX3c3Sz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 04:21:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejcd/9F23dPVwCayaWWhV14k9/ub6nDTqNPZ/ZqRoTZ36FJI7nNCjE6/WkA+X2y1AUrapzO25yBD3IBKAFEM7VWUrz1BcXYDE21v4cD51oz+DiGm8n+mmUCxPNGARc3apUXE32po0r51EGCe6rRbBnUzkeHanN8vkoX8IFrKgdwWvQa9xf01Vcg/ke97quC7FOJtGyrGrDaWBURDlJzBqoUMzSg38/nBXsA4jlxt05GWzTVVpR/TsJOAXMx/gNiQMUqkqMA6VAkxTxIioqVZ3o4mfqY4lUe6eztqmU+jkjlh3f3tcpxySu/r1M5YQnUbDgTyHgkfmlwUTUanMvv7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek6W4PErRfhVGTa/r7p36hxCDJV5whLv8VxpM2zV3eQ=;
 b=cNJSOYZMqyr7yzLYFwSMeOYf2Wa4ZvJG6yXjqF9YVzwapWB0jeJ5SxoKgoIpK65A1UlGLXoarKdOl+l9sugWh9Yfl1KBrW/6/vKMIbC/Hj8w79sq2NTVPpfXaM/MzxHN6z7iGyZ410e2mNZYfWqqnz2LNuEQ1Lkcb4bsAnMM3r8Q2CW5wMQwvTe5g8xJhlB5ExVTm+YYMLZ+C7WNeyglkti+9kGQwNAX9HE3Z3cQEC3wy1mMWaodzZ4+w3F8j4ZmbjNTaJAW5Va8InGFdME1yVpxNBiB8iBTgqmKHxl/6a1OzkrApgsj3fZ74UEwwA8hvmH88ad/j4uNX47v/+GKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek6W4PErRfhVGTa/r7p36hxCDJV5whLv8VxpM2zV3eQ=;
 b=4UFjTb2qh5hhfZQEf3YndtQ5rDYlfHqL8Xn9WQx0wWuxdAZVA+q1CfHHixRObxz+vYKMV/bmW9aAoip2Lq4BkatBhVCS6jChc3fyksUonR3mpLExUMOo0090AzftUeoCaVsY8HJvTY1ThpZJ2to1p58jQEdv5l7+nNvHQ1OAfe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 18:21:04 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 18:21:04 +0000
Date: Tue, 29 Apr 2025 14:20:55 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH 4/4 v2] ACPI: extlog: Trace CPER CXL Protocol Errors
Message-ID: <20250429182055.GB76257@yaz-khff2.amd.com>
References: <20250429172109.3199192-1-fabio.m.de.francesco@linux.intel.com>
 <20250429172109.3199192-5-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429172109.3199192-5-fabio.m.de.francesco@linux.intel.com>
X-ClientProxiedBy: BN9P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::13) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SA1PR12MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d9f047-d61d-4999-6250-08dd874a9a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wue69Ng4sHVypIHb6V63ms8JQNDUKcG39w5qehmULk7UPFgjC7cD4DPaFdCj?=
 =?us-ascii?Q?FbNR22bGLA2967iVghU53y2p+Esk+dNpxUbA5Cfi2iY1rM1lCJJd2sGKXo1i?=
 =?us-ascii?Q?gDfjloAnixVHtvKsH2yvqKCCkm/44nHkvuphCR8IcLyxs/PVnFLeYcfM0mr/?=
 =?us-ascii?Q?hqJB98mPTtrS9vdh2EYTw8jCvqedfBfLX19eUM/4Z461TS628HCM+3kWIWCn?=
 =?us-ascii?Q?gps1fQXZmP2YEu4FJhhzz6Cd3ovirIX05/7n/Qszrwg+CYzzadDw5q+PJFvm?=
 =?us-ascii?Q?BfwuEUBYHuTWqssC97X5secLiijHqyEWp+tY2vtb7uJOGPMA6gDCvaLI9JvQ?=
 =?us-ascii?Q?y4o1sT/a0yFBtl0qsuXqZwMF4U05G5i8N99DejO8TLc2I7P6z+fcCQ/186U9?=
 =?us-ascii?Q?q6Pxq9CyBhI9sgJYhj2TVoghrNEQxlAxRz5xjshvVaQ+aYLZw9XllgOPxIEg?=
 =?us-ascii?Q?Zp1YWINgOu2b+lM9y5lX/AHu2q4zvk+HhFOzzcc0fh2OjyFSADdKD3MFTXj4?=
 =?us-ascii?Q?30VwPhEmKgy7cDnspVisDN5R3ie8vRak5ex9Jx04DAqFg2eRWbDHG8B0J3zs?=
 =?us-ascii?Q?aTGe48s+eL+ggseMoInqWbLpClxQV9WFINeDQ+vA8EMT1nypMzgiSIy5uMMe?=
 =?us-ascii?Q?gispA+sJ/Uk9mWOalLgNYAAhrvdaA4ZTUScw5hmttYmWjdWuGEkA7v+j2OYn?=
 =?us-ascii?Q?M6jRq4YVfZ1UOOZjT+uBvAB4MNTIPA89M2HIzyuA85E6ZSduZfNC9gTtCej8?=
 =?us-ascii?Q?baG+XQoWFgw1yAv3u7RPx5ank/iMz+3Gy8YpJ4NPZRtfnqTVxQBwioN98pBw?=
 =?us-ascii?Q?4GFFli1Rz5wbTgO3Qgl3FWyKbg85PXkmmFnsG/ITwxl0RwVF3gPON0WCCzod?=
 =?us-ascii?Q?4qW4AThlTn/ddvmU7UnjeqZ/5vEOtOKP9Cm4SWp97off7x/kuGv6JsdHqKyj?=
 =?us-ascii?Q?FTuqQvYnmt5Eg86Zakc2Jhe6YALhmLSXtW8ga027fqhVDV3bJmXu4DCY+DIS?=
 =?us-ascii?Q?UWPenNiBmn87+nyUkjo8XgeObwfoH/i35QfC9HkZftIVtpZCx2dUev39BwhZ?=
 =?us-ascii?Q?T0VQNw7PE5i4xSqdqe8miqipiNmA/mMR8FfTQlwhVPnPo4+6igFstDecTRcu?=
 =?us-ascii?Q?B47jdlrEYIh7B+rKLwPGGSsyX1yGqwOUKKujk2KxWdO2UcEuUyVh2e1j0/4b?=
 =?us-ascii?Q?OeSJTkRzDoGlnvrkmUFSd2PA1fs9bmyGF6j6/3K9VblJ28F6Ry63oa6X0ayG?=
 =?us-ascii?Q?0qNxj7W05wg5DI9LGFIAfNG0/eI6cnZ7Q4wCfL6ocvNRcXCpsRN34UDVxqYM?=
 =?us-ascii?Q?gmMlvgWZvc1s6fvAKU5+ZNxciXrfwypmXi4c+4HjXazvh7KzvsJ/7kkzd/SM?=
 =?us-ascii?Q?pBk4w8ojiyBJteM6hLLs6vHQGOpw5uyOVLmwnKcWwk2HWYrqSF+Bqilmxdsn?=
 =?us-ascii?Q?Se4Fwhn2vxM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GkfKwJHu6ha0zJlZFgSlx3vEFhaI7bG/nJRDNnL7aS5usDWxR7YJaWV5ZDi3?=
 =?us-ascii?Q?GWICRwTxwZddBTzTSiu83ktNSisOUlRaZPHadwzmGNHdJn3TA+jWwHRHHaRc?=
 =?us-ascii?Q?LIVseRYjogb98gAkVqIypZ1debsPJUMIa+6qPi44mpKhECi62Ii85OPVy0Mf?=
 =?us-ascii?Q?CJHvpDwB93dOKNc0CtYGLO0SMOX2jJ17frxK5D5OoWOVs79D/HXIZNfaozJw?=
 =?us-ascii?Q?VQCZN9el22EkT8PaKvJhS8bzQDvFbfODuzk0QMfzjvoK+WbjkmijGtTF8+Pb?=
 =?us-ascii?Q?kLT99BNIZUY0Vf0MoIdKyUec9A7+8iv8JD8XYE14z5x5O10jOW6lwkCs8Y1B?=
 =?us-ascii?Q?m4SP5RFcR4JFvTyids8t09h+VcVrskuHJHPk4LhRSvhwhn4HVm4GwxrtLDcr?=
 =?us-ascii?Q?wnGFkThYN4MOadSY4ASjqhxarP/p92Ex0OqtUq2TL2QSiuRl9nC43cTiMPip?=
 =?us-ascii?Q?/2JW0H7FgstWSAPK0uVgxYsNpjqidbCRaEoZAPY6YtElsEYxi+g4ZeBIMv8y?=
 =?us-ascii?Q?fsuFTHGntWJyIkmtUZFAaMLwPD2Jwvm9cqrPgIR08dsskLVAQJBecQk2/ZKG?=
 =?us-ascii?Q?3x3RI26F3stgjkL3gDofGyqRKYDTrazrJHUZtgiafpCC+oDZm6iGjQiA/+51?=
 =?us-ascii?Q?GlJXczmmSjykWWDrCmKI5ODeGxFke2wkEBC41netsU8r1d9gmEV2QBGGThyj?=
 =?us-ascii?Q?jUXWdPBPIpCK0XeB+R903/L8N8cvn06BX6+xbDUU+nq+KxFaf5Qgy5iGZNpy?=
 =?us-ascii?Q?03PoqGoHav923bqCKL9iW/cXLXAaqYDkhLk88+I0FboUVJgnDj9utjuVSgyt?=
 =?us-ascii?Q?8tAar10bM3j5nSW7aF9lChxZyirpIbYyD/IwP78K2xz0xasTg8G2AfimeVmy?=
 =?us-ascii?Q?zRaz8+ow5Fi2qevLxsL2cHsy1pDd68EjwdcK6PqbMphZI28Gq0WcNnTmotI3?=
 =?us-ascii?Q?bCRr7tYC8DXq4jxTYXJ8I2q+Li4Q7v7Yf3mUCmmEFlIVtlFUQPDCYjJEN/Mq?=
 =?us-ascii?Q?i/FuFLANlpsAFgn3yxuHot26E8K7rmu4fMYq5F7ixChjhCCSWFf8tFi5pg8o?=
 =?us-ascii?Q?EXhPzv1D8r0GqIR6/+9vkVgHv3OE5CVl3dgUYajsFy0hI1Q5VWDzmG6rItUi?=
 =?us-ascii?Q?uQ802K+QAFQ3AkA/UfqcALu5d6tKv+ZHZrvH+Hu9JGhvCiTTOxshSDqMYI1E?=
 =?us-ascii?Q?rpPOTqPc3uxW9tcxHg2O9HoI48DEp4rKl3yhux12f+glo7x8rDvtP2AtGzsM?=
 =?us-ascii?Q?0IbuGmnhyQ4Lr5FRwIIZmznvC7Wceeb1QK1bxumI00kWqSiOh5YHDQG3MaDk?=
 =?us-ascii?Q?xO+lr7DSCCx698JOIH1CYBaZXafawG8B5RjYh4DlLlcsQWqqFZSMzV7Z3kSy?=
 =?us-ascii?Q?6oFjdn1u6ANVFHJF6lMpia+J2mi3qLI/ftQ8fnQIckR4Tu2lMg1jtCTaUG7S?=
 =?us-ascii?Q?Xacdaho9FnDxTVNOXg1PvEclFC2reCaEb8kWw8Y6WYl8F0BTTajY2u9+/VU+?=
 =?us-ascii?Q?EoLRZXskicULVv093fjGre9y64/H6+WBFuFowvk6pKtXyLLMyh/BioNjqpjG?=
 =?us-ascii?Q?lssZEmSgbsPOuN8Tt4ybPZePo9WKhe4AU7Q5/uOZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d9f047-d61d-4999-6250-08dd874a9a2d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 18:21:04.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laaN3aYzvucdoM38teJrU3r3XVnjiqYTca95P9QHhKXue4oL8to20oCw5KyJPpo85gyrSA1C1oG9z3Dqq5hx0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 07:21:09PM +0200, Fabio M. De Francesco wrote:
> When Firmware First is enabled, BIOS handles errors first and then it
> makes them available to the kernel via the Common Platform Error Record
> (CPER) sections (UEFI 2.10 Appendix N). Linux parses the CPER sections
> via one of two similar paths, either ELOG or GHES.
> 
> Currently, ELOG and GHES show some inconsistencies in how they report to
> userspace via trace events.
> 
> Therfore make the two mentioned paths act similarly by tracing the CPER
> CXL Protocol Error Section (UEFI v2.10, Appendix N.2.13) signaled by the
> I/O Machine Check Architecture and reported by BIOS in FW-First.
> 
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/acpi_extlog.c | 60 ++++++++++++++++++++++++++++++++++++++
>  drivers/cxl/core/ras.c     |  6 ++++
>  include/cxl/event.h        |  2 ++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index 7d7a813169f1..8f2ff3505d47 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -12,6 +12,7 @@
>  #include <linux/ratelimit.h>
>  #include <linux/edac.h>
>  #include <linux/ras.h>
> +#include <cxl/event.h>
>  #include <acpi/ghes.h>
>  #include <asm/cpu.h>
>  #include <asm/mce.h>
> @@ -157,6 +158,60 @@ static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
>  	}
>  }
>  
> +static void
> +extlog_cxl_cper_handle_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +				int severity)
> +{
> +#ifdef CONFIG_ACPI_APEI_PCIEAER

Why not apply this check on the function prototype?

Reference: Documentation/process/coding-style.rst
	   Section 21) Conditional Compilation

> +	struct cxl_cper_prot_err_work_data wd;
> +	u8 *dvsec_start, *cap_start;
> +
> +	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
> +		pr_err_ratelimited("CXL CPER invalid agent type\n");
> +		return;
> +	}
> +
> +	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
> +		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> +		return;
> +	}
> +
> +	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
> +		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
> +				   prot_err->err_len);
> +		return;
> +	}
> +
> +	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> +		pr_warn(FW_WARN "CXL CPER no device serial number\n");

Is this a requirement (in the spec) that we should warn users about?

The UEFI spec says that serial number is only used if "CXL agent" is a
"CXL device".

"CXL ports" won't have serial numbers. So this will be a false warning
for port errors.

> +
> +	switch (prot_err->agent_type) {
> +	case RCD:
> +	case DEVICE:
> +	case LD:
> +	case FMLD:
> +	case RP:
> +	case DSP:
> +	case USP:
> +		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
> +
> +		dvsec_start = (u8 *)(prot_err + 1);
> +		cap_start = dvsec_start + prot_err->dvsec_len;
> +
> +		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
> +		wd.severity = cper_severity_to_aer(severity);
> +		break;
> +	default:
> +		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",

"invalid" is too harsh given that the specs may be updated. Maybe say
"reserved" or "unknown" or "unrecognized" instead.

Hopefully things will settle down to where a user will be able to have a
system with newer CXL "agents" without *requiring* a kernel update. :)

Thanks,
Yazen

