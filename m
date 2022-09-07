Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DDC5B0F68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 23:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNG6t580Fz3blb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 07:46:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nafPuG88;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.237.44; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nafPuG88;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNG666Ylxz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 07:46:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqV3T+foJg7c/9MFbNfDC0QHA4s+0NJvBRG8l/9ajpyKjTxd7tXsnp7y9K5PRzUXR1ptXVICQtfxSX73xw3qLd1Z8qf9p/b7pJle92PLPPrM/kUzlxoB0vLxbmchr8G2BhsF4K4oof9HmXiXmMGBf7QNwmGM2ZPauKBVP5mzofYuCC9lLIDd2xk1cDeChkJcYPcstkKxzHdgFBRRABIQDdhEWQK8cqCLzCaDWwSQu+Fci4Xq3fQR2haHfmCnEjepxEXbbM/ILT8zADGlrO6Khq3654zTrR6ERKmSHf0g/6qIDDFBE2TVaXxUlq4KvHRgkJg0QKxtydXEq9ZnSl0I/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vElcluAh52dAlYvKgXW0zWoTlNL963JlXOVuOP/r8Bc=;
 b=L2qcar0eMCNizbJ2aAQBxHmU6Nue0Pfm9+pFWEJanGFyKabqiHB9Bj/OVq6Iw7dJfhiTyoijQa53l6a1hhZQesAvZnZusjuJJNjKIMo+Tagc+CbiIPZCZgWgEYQQUSSkY33+iFGPBnzXSsrsU1mOt1MeRM16gxxp2dmf36OHW2rSbg6qb67CEoI41b7g4kio1uwjmtnl0vfvZoC6AKm9hOaIAkaqfB+rWHFHviJPEEzampAyLBjuSgHdQZCoxajm1Cg7Sz6078kW8PTbwsblzZpoycBL2jFrkNU8pjLWZ8gdsL1O1hpohlMph2H0HMBxgdgMuceKuMkPGfzyxiFTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vElcluAh52dAlYvKgXW0zWoTlNL963JlXOVuOP/r8Bc=;
 b=nafPuG88/FUBqCyR26mb/FZ8vmZmnGcwS5cFvI5DGu+07cEWUFViOwiIZ3Ton5tIkZaAISbMNpucOHsYnsXGMA690iG7SG7TK12cv32SqYneqKQH1nvDavfPgb1vpClTSrLhoTixsFKJgurnUeTeTljmXR97ALAFT21rJYzvlTspEDMXWWnmD1417Jq0RTOJBMoQ0y8IPdKujWANhthHWcZWDW0HjFNehH9w5DwmfmEsMR4AQWgCYJgkwieFqJpMKI0yZdZBCoBifCym3hp5bwRyNxStrLwr5yd7E19mj8UW18L7cbAof4QsqLv1NGVIbAlk51xkbLGnN1t17Nq29Q==
Received: from BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 21:45:44 +0000
Received: from BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::94) by BN9PR03CA0362.outlook.office365.com
 (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15 via Frontend
 Transport; Wed, 7 Sep 2022 21:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT097.mail.protection.outlook.com (10.13.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 21:45:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Wed, 7 Sep
 2022 21:45:43 +0000
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 14:45:42 -0700
Message-ID: <90a0441e-47ad-007f-06c1-b30e5f7bb692@nvidia.com>
Date: Wed, 7 Sep 2022 14:48:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 4/4] selftests/hmm-tests: Add test for dirty bits
To: Alistair Popple <apopple@nvidia.com>
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
 <68cf1d70f3fb8ce4e3c1a4899c19df4f6c382a13.1662078528.git-series.apopple@nvidia.com>
 <f81f6f90-81ad-7b77-a74d-e9d5d6e3bc94@nvidia.com>
 <87mtbb5soy.fsf@nvdebian.thelocal>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <87mtbb5soy.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT097:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a2fe45-ac9a-4885-29aa-08da911a516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DiG++JZyJjdRl08kVlAHcuTNGQnrQhrdlcseKjJxyKZWwsoTyTl7K8i6z7z6iExYy6iLf7fPkCji5Q1T+dNGl0D2IrCOqZsQxSVUEtDr0k2fb9rCKD8hS+b53Ob1RD3WlBhE8/pABsgsyNVhwXd5sWZyTGieE1JSJUppb8+ae0D0I4V6XTXFt4sGnrNZ3N6EAaM4i2Aipi/Ck1wm/Q87mSomfSAYEnrsIG9sv9sva25pqy2Zk99KLCF2NE7s+I9mlYehbFIYXP6hcCyV5o7glYtd0VdY1oC6J9rkCpVsJWeoytQgkCcwDzWyhbq5jhVacJz74PN8Akj8KmnDyO0Tn2DaWh3qkXdmHpgwgQyXWa5Tjq3zqMztU/DW7VdVhqGx9DwLpW/kGl6kQTbGhtctN3Q6FjWo96fA4bz4bqpl+lHvhTXEFBGY7HEwL7212hJvdpBhNQztEW0ECE5HMF6a34ZEoPL30Jxa8cwUbzoR/C+owBPeeLYM8J+atTEcZ0cGPnBMp2S3zdv4Hj0Qx25G0GiBU79AKag7zgZksx1jArO3XZ356a1nO256KXYJ7Sz7lBufVqvxShck45AZH6XlKa/RHZ8EBvwPFlDIBWjyZ9zwZdG5O58YxZb/8iL0BV0TFHNWAAZ93k3K++yHZjLEyalv0+ZBN/F9l0lBMp5gjdO+PLnZIcB5P8Z52/dJaAcdh+3kqnvfT+Qfiltqz7/YgdOY6uFp26Kskb/hGAYopZTUg7I8AlRvN1Wxu3vQKRZJ8XXOH5dNhLE28TgezIyLx9G25EfWkT3NsgzgpNybjLCKTT6vrQfFiz0TDEwJyszALuuNx+kNVP+U0y/CckqNLwRXMSXij/MJf1EP552MmBc=
X-Forefront-Antispam-Report: 	CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(40470700004)(40480700001)(86362001)(37006003)(356005)(31696002)(316002)(81166007)(54906003)(41300700001)(40460700003)(16576012)(478600001)(47076005)(83380400001)(2616005)(426003)(36860700001)(186003)(16526019)(336012)(6636002)(53546011)(6666004)(82740400003)(26005)(6862004)(2906002)(82310400005)(7416002)(5660300002)(36756003)(8936002)(31686004)(70206006)(4326008)(8676002)(70586007)(14143004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 21:45:44.5626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a2fe45-ac9a-4885-29aa-08da911a516b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Sierra
 Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/7/22 04:13, Alistair Popple wrote:
>>> +	/*
>>> +	 * Attempt to migrate memory to device, which should fail because
>>> +	 * hopefully some pages are backed by swap storage.
>>> +	 */
>>> +	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));
>>
>> Are you really sure that you want to assert on that? Because doing so
>> guarantees a test failure if and when we every upgrade the kernel to
>> be able to migrate swap-backed pages. And I seem to recall that this
>> current inability to migrate swap-backed pages is considered a flaw
>> to be fixed, right?
> 
> Right, that's a good point. I was using failure (ASSERT_TRUE) here as a
> way of detecting that at least some pages are swap-backed, because if no
> pages end up being swap-backed the test is invalid.

Yes. But "invalid" or "waived" is a much different test result than
"failed".

> 
> I'm not really sure what to do about it though. It's likely the fix for

Remove the assert. If the test framework allows and you prefer, you
can print a warning.

> swap-backed migration may make this bug impossible to hit anyway,
> because the obvious fix is to just drop the pages from the swapcache
> during migration which would force writeback during subsequent reclaim.
> 
> So I'm inclined to leave this here even if it only serves to remind us
> about it when we do fix migration of swap-backed pages, because we will
> of course run hmm-tests before submitting that fix :-) We can then
> either fix the test or drop it if we think it's no longer possible to
> hit.

Oh no no no, please. This is not how to do tests. If you want a TODO
list somewhere, there are other ways. But tests that require maintenance
when you change something are an anti-pattern.


thanks,
-- 
John Hubbard
NVIDIA

