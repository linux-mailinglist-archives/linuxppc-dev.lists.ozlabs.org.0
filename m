Return-Path: <linuxppc-dev+bounces-2529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1F9AD871
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 01:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYlcP4bgdz2yFP;
	Thu, 24 Oct 2024 10:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::605" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729726149;
	cv=pass; b=cPvZM/iROeCWAjKw6OdCBvRGfvtFSs5FCk8B95xyNNUXONFIeNJnraQVcYY7w3zCJ3gzM4n+m8guvzr676Kfo7Uu25oBGAaTVUF2QAwUM3NuKgoeaTHh0Zd4OOV1JrD85DLMj+KywjMdtz8gREmuPwBHkygP6pgFPgOQ4AKZzLftW9Mfayo5RTfs+6x4E41Ig1Z31jGTNjSfwT3UKfBlgPk4WJCtuytl9DbOMQVk/4RQxkGbqiHLFqMoSpFuYkCckNXklRuNV2Vxj7j4rIR8/Gxx34aLbRqC4TTM94pNlkkzrageJ9fMt91XqIsBtT1JeS0kZq9FekiC67Ke++ipiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729726149; c=relaxed/relaxed;
	bh=nohy9Hcljm57kXW2f2p0yj2WE3cNlsRCqRsNj3T7JbE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 Content-Type:MIME-Version; b=URcX5lyd+zPUxNsDSCCnQARW7do+zmSgPdnDQjncdvWYghPKGCRJptg1wcgWcP2CVHk0Zml1q6RISSqIF5rtCGDZD1j44BrkhGROZDI24C3bn2Vhs56pjfna0OnAmHLpPe/H/tB9V3WDp4+oMf2d0yLHp79Sn3qDW6bdw/w8d/glo7G4SNp+C+x/JGgwLkCjUt2SuO8q8Gwt8D4GA4GiTQH52hHL4z/cvtVMgItRO298NKV7rzphIfvI7WkqbjLLW/PF60kkavaqELWXWeyPF7IkUFXQjhxGPU2xxUQn/YVCLwClXlU8TXpswAPmJyl3PVr6pUfThCH/ZePZsQDO/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Em9A4sjS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::605; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Em9A4sjS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::605; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYlcN1YQKz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 10:29:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqUUtI9lX9WPyb9wfUts1vOVXMd+7W5vMv+JrRs5n2WlrKcSuScAk/f8U8SEGGDZQ6oJ6iIo6TCn4Pgm75EgpEw+9tg5+d3WGoXsM3wdVJ+c2uDOI8uo+mHLSaQztxtJ192Nv/ZE4o2fhRpx2TX7F6aA+FEwkWlL62BekaiCcItwmX08Z8YCsy0vdQsPC+45ql058heoOhrNX8XxbtWBxJf/Lu+Vhbrh8rFkyoHu/6HbmAse8x2DCQ5+uZm7qItw3W5l+xCf2q2NO7azJ42P1TW6exYkhaRftaTGli1+TXSwbOvEHEwqgKIj3suqbnY5o/u+wa8lBtGwayiz/GF1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nohy9Hcljm57kXW2f2p0yj2WE3cNlsRCqRsNj3T7JbE=;
 b=jV3ZhU34PhcN2F8YNRkc3QxEbn3aZP8vCdmFaFxUbYVlZ1QW5S6cbr8fKtUAgI3Getc0eYgdUMpmsnGFJTeqAL+t8t3zhj49yjFOvEHnJPTtU09iIOQkcPDN9RhluAEu2eFM/WGwde4g1E+Pf+SkKgnudW2ZBud1giW+Z+oDdH3wVK1Lk6aQ5NZTQi2n7TFOxWeOlYwYIeDuKzGQQ7pYA4a44xYtN1zugXOJBiRL9cjRU7AC5+2MgVCYJMFoXlsGV/1CsOizuGV+qQCuumpuJYoc1fvkwO25dO8EAOuuB3IcDKsQhKGJKkC3q5z72iBRdai2+aITHr6IWn60gVcYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nohy9Hcljm57kXW2f2p0yj2WE3cNlsRCqRsNj3T7JbE=;
 b=Em9A4sjSPeDffxJHoVwQaLV4TB8TLQKfa9bkPERmcZaj1JAxCshGhdS1ob+kvBFb6zGuLi2byjt7Sesc5QYuSGQ3boSmNAZHjzuupDa2AUID/pJl3i/iJd4NN2zvNEibMGyRJuDmAfiXZ4T1jyXdb0h8wG6HVaflFIrxiuMdJzRt2GR86X2MJS4wtAQ0twO4oQrjvUyVP/zLqaDmdf/FkxRR5DQEyv2bqjoZGuW033Y6Ouhwim5UvUs7AjIiGg7UNAXIGbOrxODqYf/ycAhdsscUG3YiJPcVFEvJgyXVtHoiy83TOzXI3qy4578kQdaDrzGTz+uaxakX/TyVSg7Vag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Wed, 23 Oct
 2024 23:28:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 23:28:43 +0000
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <b63e8b07ceed8cf7b9cd07332132d6713853c777.1725941415.git-series.apopple@nvidia.com>
 <66f61ce4da80_964f2294fb@dwillia2-xfh.jf.intel.com.notmuch>
 <87bjznnp6v.fsf@nvdebian.thelocal>
User-agent: mu4e 1.10.8; emacs 29.4
From: Alistair Popple <apopple@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com
Subject: Re: [PATCH 07/12] huge_memory: Allow mappings of PMD sized pages
Date: Thu, 24 Oct 2024 10:14:18 +1100
In-reply-to: <87bjznnp6v.fsf@nvdebian.thelocal>
Message-ID: <875xpicsbd.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0064.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9e3bcb-56ce-46b3-4e8a-08dcf3ba6ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cM+8r+Sz5S2zwdbr1hMRQ57nsn52BCEPegtEaMPoMwmJ+lI+cClHLNVtRzKE?=
 =?us-ascii?Q?USZLUe4ovT34V+KZMRRWE6WyTyUji0sOqpz7yawotkqGuZ3u0CxIZVANb0RX?=
 =?us-ascii?Q?T0FVHNrWbMZ867Lem1LibgeiKZf8ii5ZMZU4PBFPq01SSQbFmEY3ggUs68lF?=
 =?us-ascii?Q?JfqyNBHkr8L1ElK2w6XHhURJDOrQnoDFU64OkWOOeAT9XB6XsJKCKH1+Rk4L?=
 =?us-ascii?Q?xyQYRYsxTx3MHkiIgY7dj701JT0kyoytBqBh1yUVOcWdT6AjdzUClKJyCHQ7?=
 =?us-ascii?Q?q5n/T2i7XuYPNR7riUxn7ZAzvpsBQDP9gSgZZ7tvsLINa38fmDj3N+L1zFEt?=
 =?us-ascii?Q?MGRxnc33jkHhQRH2WkhWv6ReCPcSnk7AfwV0AAvNpF+c4Og6LV6KYibimryT?=
 =?us-ascii?Q?CVKXxhZaBoIw7DlzMsVDkp9JnOB/AUbIIPrqgSxzyggGQw7KqzhqCGwaqCvV?=
 =?us-ascii?Q?AWF+HMzm4rM/DYWl5k+rhfoGmqo64R4ZrGO5VrCwjVDxuXcud0/xLgALvb0S?=
 =?us-ascii?Q?kgLPVEwBahXHvzlDQPXphCNSvVwaTg6idE5GWidDxewt8eYTIcpdW8j8KwxO?=
 =?us-ascii?Q?ebf9bs6Lc2360DWSZACTNPFP1NRa648V/0r0WIKTBZheTFB98mbCY+pjVuqK?=
 =?us-ascii?Q?7vkkp5j5cnobSV7ZiDGXigYaIVLJizNaQ4fb7vp5oU8qyVGjetrIkbzzTLTw?=
 =?us-ascii?Q?cLoEW2r8q6BVKDiaEJMxZWEce7AE+R2R1MfANiX5BKUhkq59+mJkibw7UUPV?=
 =?us-ascii?Q?OHHigFQX6N19zG7HsJLeYHiEpUrzLmFcxylqN8HIlJZ+1293UB/2JvXXfYeK?=
 =?us-ascii?Q?cGxxI1ZKBBk1Ny7uK6F1ju0BNEzgbLjItl7H+UoXvoCaFxvUxGxFEn85zEg8?=
 =?us-ascii?Q?LRoreCfaHZLtlnHEWidcV/qafKjHgeWtvH++FZi0rViBcdDN27k4VX59jtMQ?=
 =?us-ascii?Q?yvijHcXpREeJOYfJc+XaqtLT6JGyvfT8nicyD3lf0iGqJgLK6cIu8l2J8P2z?=
 =?us-ascii?Q?te4pr1uy2Gp9/g2PoP2RPKEJBJQKBoM87lK9iazPofepLUe1JoAR0zv1V/ev?=
 =?us-ascii?Q?lLEMCt7CdJrOlaMM07nWC9gydd4FQs+ejnNkqGOzE+FwZqPetyKTc3h3v2ZK?=
 =?us-ascii?Q?ni0zTKDoqfav7Ap21Cqz+8IggdUJs8YYC1/z4TYwqMfkKM3s8v1yP2B1UYm/?=
 =?us-ascii?Q?iWkUx/r1ICucEPSrKMc97h2Gs6Bxrm3Osgu8MOy1ss3WiX5sYuIRTj6oWNN8?=
 =?us-ascii?Q?vA60ZdTPjwj2c4F9ABz1WP6AZca4ngqpbGpxpctDYNb5d+PHg6yFHulwffqJ?=
 =?us-ascii?Q?b5c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZt5BTVLB+aLTqwK+Kd9eNXIW4zUWJ/2IlCRMWMBczL+wKz6yHwc+iHsstcA?=
 =?us-ascii?Q?aNIdf7vLTYgiFMG19MBuoibzgg46KI84l2G+zHZNdaTzE1Ba0riE181O65TZ?=
 =?us-ascii?Q?lnSswGDjfjQI/Sz/7vosPNyttAvPBuzZ+eC9+LLImHG3XjJOT8O4gxmsOQAz?=
 =?us-ascii?Q?Cj/VzmDJiG/DNjf3+vNpnHz55d5ZeLjAY6KUT1qR2suZCFfAnIx5bAdvqdae?=
 =?us-ascii?Q?insMOo3bi96lOlwEklicXxWODY0bDPQnw3NyaBsTi8za+M8gwL+dhqYF2UuL?=
 =?us-ascii?Q?ziqKDlGeaJFqh8QDSqEdJjhhcDMfsCrax0Ha9QO+vXyYOdJZ9TGD6Z+4uP/N?=
 =?us-ascii?Q?RbmPZ2oWGrBG/2iFrzYp4NZle2nzkNivtCi6P06RdxmDmm+5guLgQeatb006?=
 =?us-ascii?Q?wLNvjLDczyUim66ytgI/uWcKFmzWAhIUGtNNv2Fh/WfhwuE3FuW4shlIKgqq?=
 =?us-ascii?Q?SQyEhX1uBHhWut4Ik9+UF9VXivumBrHKzlGy1wuRv6VkTj1R2HV19tGLfPbR?=
 =?us-ascii?Q?O6fZgnkvWp6v7feG1EsyrobzZGXPzaJhJRmogrVCnKtfLrbW7Xp6h7M2gznO?=
 =?us-ascii?Q?hrPhhEnapgd6oCnoGcXzZKTeUiUXHfD/GTBIbvVYfukbHhCCuJGQZWTJrVCe?=
 =?us-ascii?Q?ZW/MAFsT7MK8VooC0RqzB4myjzPDZFQnAtRz6mny27/BFLYRNmRzu1btQXJH?=
 =?us-ascii?Q?tKMYF8vtgGlxXYSTnzNTL9fykKpoDmTU/NXu7EetBbl1YBeBuOTvtd9G9pg5?=
 =?us-ascii?Q?JXNQPpfd54A19JuEjq50evXLixpZ/BKWy6we0rx6voD3a1ITpmasu5CFywaX?=
 =?us-ascii?Q?5Z6oGxFMwlKA89Gi6ZRW37qzSc9iy75QbdleBNG1iM9b5JtGdi1Qryu5cQ6N?=
 =?us-ascii?Q?uApAJ+eheldf1ncaB2VmQEYzIvXzwAkdrDAsYZEMB1ESzrI3tSClaeMkDun3?=
 =?us-ascii?Q?ojhZnjEe1GmxU0nHwJfychPNjQGOkpwE2zxbji0SsJu60anKGO0EBivk0gJb?=
 =?us-ascii?Q?AN+9C2JmtIb6+H26yEfMPVQjnlc2RbCc5gCT8V3mRJX5h+u0EIqc3Je2mD6a?=
 =?us-ascii?Q?E4eGsTBI7VSuzhGJArJHzLTmPUh/VGUmK5nwaca+5D0czJgeVfUs4sky13up?=
 =?us-ascii?Q?VSbEBant2vhHYH27LM9IolHUAcQ2JYXClougxQYQEXcxq9N9agrfrmNptM+b?=
 =?us-ascii?Q?5+Y9i/RbgQM4a0pf5IT4dVpf+b4TjmvC864Sq3qoCK2PMrzQhaBrc7kr1bnp?=
 =?us-ascii?Q?6eO9R/dMSO3uKx7KmbIi7f3zSLOpzQEBSVg22Mgj0a4JrbH6fpWeGKbhRAdn?=
 =?us-ascii?Q?GC7AIOwMeaIC2EnFFou47q4vC43CovByM0gsD6nqriXAeaGpsgHx4szcYaQj?=
 =?us-ascii?Q?IbPWflSV1Ve5KI8LEm9o6Iwltnozk9JBna9hc8Fy35dAJte0c+vmE0qnMVIL?=
 =?us-ascii?Q?yosKLs3eoHXRq24XgR/0XFHqzQgVu4U80IeOw/M1/LS3LMUyV0TrEQHJI0G5?=
 =?us-ascii?Q?LxIdkPa47aLQtz2wVnGD/E00rBsIgpf6Q6J8rU9quhl+g7q0Iv/LgDA3AyFZ?=
 =?us-ascii?Q?pAh6/z3ad91WcXA7nv6fubKeft9POHJhqZa41cIy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9e3bcb-56ce-46b3-4e8a-08dcf3ba6ec6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 23:28:43.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgMgMWbsG/XU/IVYPLmKKKYBP8l8vXjkp2AdO2bZgdz7XkZXkQC3xtDN5DBGm5UrbaBoxOYqSfuXHjtz7usTwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Alistair Popple <apopple@nvidia.com> writes:

> Alistair Popple wrote:
>> Dan Williams <dan.j.williams@intel.com> writes:

[...]

>>> +
>>> +	return VM_FAULT_NOPAGE;
>>> +}
>>> +EXPORT_SYMBOL_GPL(dax_insert_pfn_pmd);
>>
>> Like I mentioned before, lets make the exported function
>> vmf_insert_folio() and move the pte, pmd, pud internal private / static
>> details of the implementation. The "dax_" specific aspect of this was
>> removed at the conversion of a dax_pfn to a folio.
>
> Ok, let me try that. Note that vmf_insert_pfn{_pmd|_pud} will have to
> stick around though.

Creating a single vmf_insert_folio() seems somewhat difficult because it
needs to be called from multiple fault paths (either PTE, PMD or PUD
fault) and do something different for each.

Specifically the issue I ran into is that DAX does not downgrade PMD
entries to PTE entries if they are backed by storage. So the PTE fault
handler will get a PMD-sized DAX entry and therefore a PMD size folio.

The way I tried implementing vmf_insert_folio() was to look at
folio_order() to determine which internal implementation to call. But
that doesn't work for a PTE fault, because there's no way to determine
if we should PTE map a subpage or PMD map the entire folio.

We could pass down some context as to what type of fault we're handling,
or add it to the vmf struct, but that seems excessive given callers
already know this and could just call a specific
vmf_insert_page_{pte|pmd|pud}.

