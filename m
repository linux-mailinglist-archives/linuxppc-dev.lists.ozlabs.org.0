Return-Path: <linuxppc-dev+bounces-6068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A3A2FE8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 00:42:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsLhX5l8Gz2yys;
	Tue, 11 Feb 2025 10:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2414::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739230924;
	cv=pass; b=lI66dXpbmjTtBhzGRZtBRb0nXYbwlgwwak7rk9BXVmIOW39Zmzx7eTY2G0W8SeDurHTWdO/MrF+E3PVLDZw3zgUShbfAVT9eLny/FAFGu2J43EFLCQdaV/LrGJFWZTLDxyLelkBWjabZX4e8hnisLHetB/INCtQlYXpWRHn+PfjrJrGX3Jty8d+DGMfXY/np/oH+nTZL+ixmx1xkiS5iTf6RPOMT7Zn8hglP7DbHwxduBbPDiWajwYS/4wNyFgCKlitTAhLHubuNu4h2I+5txIQ0JX2o8JC53wzoYaOFIyfYYlIlc+OyMrV5CKTuu44sHCpS+I690yoWi5NJdGudfg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739230924; c=relaxed/relaxed;
	bh=gn6J2Oj5w2TUY2OLzzr3QQV1IgRZlIvYOMWYRLA3clE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k5E7TrdeSILZzqSjIfzv0nQ7bBceXoq5KWjFlLqibWlhMk0GUE7dIDBDn/iJRUKSQdnBUvWCREvX6HMsaON9X6ebHXwplV4jAIKrPc3xlPUJi5q09GPHzSs3EhRlizEEfjGto0FOXHIVftgaaHYuYtbvYKacFnKx2V7yihUGQXkfK3GdysFNRkYuQX2BwFC6hWuQ2E7zrL2skZM8rl4N6eITClB29tsE0zcLF/nSkzFuBvCdUj0LMlsNvq16bJcGC2tEIxO6xmnlRBk5FFBjVhVmxcCiId+1BF0DRHWULMbsQaBCns4YwKfu3Dwb0rtMvj9hMmhRPpO7T3bXaLdlLA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZLoIGP4Q; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2414::609; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZLoIGP4Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2414::609; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2414::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsLhW0NzPz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 10:42:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eerdXhVgtx1xCaFKZMBGywZohZSCPSAwURdHUjFvHXwh2X+z7In5cLiFRYbn+BDoY0g/oYEQCWs3dsaZxuitwcSg6tKFkF++ZG/U0HmOt3Jay260G5tIkR/yYqKvkiDLD5TNf6XJPU7Mt+UUH7JTvk17y7WV7unJHjSD+Lrz2sBSUbnZ88btxQ5049u3JaYEkTWEl+v5PtemYLX7QzKTucGnF2HK2XqaN6RC2FFDDsDyxD8haUGh5ykz19QApApUDSU7xg+QYDb1TM/ufIexbt8y83Kfg86Sg7Ni1wdxntRkD/lD+eCxU08OPSAZvRgkJ8PCWraR+zYBIaJgZTBQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn6J2Oj5w2TUY2OLzzr3QQV1IgRZlIvYOMWYRLA3clE=;
 b=jGRf5CZNzqFfWu1rOxatuDozKphY7rqEpfFj+vLCixHrz+WonBSfauY7NNpVRwe1FuWvzD3j82JjvWGUhJdu5jv5dpGyQ3mCgsOYp1oa4pkFWzvVqqGfQT5+G6v5EYZ/FiuyJWAdFpZGH6zu9/qyHkz2FEo8P1mcusVKQA1NJQuAA5SYlnIQ9IhsjSCLHJEdUItcymRBSDwJa3UyDBLXVtl1g8hdQ7T1rR6auDLGP2ITLwTnoxVGrfKcFQHoGKAbwKrMrGVohQvAr0MJVBbD/aVuQzI7soMdfwzSW3yT1kK7b2txvNUCEwZU33b/AxhqbLGdV5UYqooP4S51FS/8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn6J2Oj5w2TUY2OLzzr3QQV1IgRZlIvYOMWYRLA3clE=;
 b=ZLoIGP4QkgKuAMJJaFvOKXhaTA/68+0dTDpsbFcGmTczQpySg0cSQXtzK5CuDQ71lZ+0WP85BQwBYD9/ChLtB+S4AOdDh6Dw6nzXrre7JW02lzD8BdK3zh7XCHzeYEClVUhaNmK8QHFoX99ZoKbCOa4KWzvzF0hbV0rztbHVbWp4EAHz94ImXDSttBGMZyZqC28Pg0D2/Jo/8QmJJiIhSqesQ9pDlZy0HeKgcb+Vb/u1Gl499PFmMvCZ3f9d0kAAwf1ScCKOt2K6Mvxo8w9SoShaURLIeClo8nAL/k3WrExR7CtrYfLH8ECsQzIVbNWfpN0to0ICols978oDeLFvDw==
Received: from MW4PR02CA0024.namprd02.prod.outlook.com (2603:10b6:303:16d::9)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 23:41:35 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::89) by MW4PR02CA0024.outlook.office365.com
 (2603:10b6:303:16d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 23:41:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Mon, 10 Feb 2025 23:41:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Feb
 2025 15:41:26 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 10 Feb
 2025 15:41:26 -0800
Message-ID: <4d9bdb06-36f6-434f-8621-a5565680b9e2@nvidia.com>
Date: Mon, 10 Feb 2025 15:41:25 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: Nico Pache <npache@redhat.com>, David Hildenbrand <david@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Yury Norov <yury.norov@gmail.com>
CC: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen
 N Rao" <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"Shuah Khan" <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Muhammad Usama
 Anjum <usama.anjum@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kselftest@vger.kernel.org>, Brad Figg <bfigg@nvidia.com>, Michal Hocko
	<mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad>
 <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
 <8b4bb4f0-37fc-4215-a3a9-3771394f065f@redhat.com>
 <CAA1CXcDXs7VRp=sfyDNTr6fR7MQ+pvb+w-o+gp-N6yTgdpMBRw@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAA1CXcDXs7VRp=sfyDNTr6fR7MQ+pvb+w-o+gp-N6yTgdpMBRw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|DS0PR12MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: f6af0fb5-b1cb-4998-931a-08dd4a2c74bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vy9SaG4vRTVkNWZic204WWs4L21WT2JaRXVhTERISHBJWnpOMWNxT2YzRXF3?=
 =?utf-8?B?eFBXUEFCanVINi9KNThIS1oyNTNpSk9IUDJ3RVYrTmdscWkvSHBmNXcyOC9w?=
 =?utf-8?B?T2N2aERLVXRWWkcvL1EzTFFUNHJOY1ZuKzQ3QzQ1V2tFanVDV2pnbVVid2V6?=
 =?utf-8?B?b0JFL0tSaXNwNmdpdXlqUFdIQmNNTnd0SGd3TVhJZi9MUUpKRjJlZTdvV1Mw?=
 =?utf-8?B?NGZDZTJtanhQdFlMem5pQzVYUW9zeUZueUdQU1gwM09qUWVjenBnREJMTmRE?=
 =?utf-8?B?Yk1lUmZnbTlIZWR1NzZDRTFONW5mTmNqS05YYUdKY3dla2hLc0Jlb2dMcUds?=
 =?utf-8?B?bmwrbm9aS0Z5UFJzTjhadmcvQXhGZmJ6cDJNS0ZyQ0IxamdEQWdNU05sUkJN?=
 =?utf-8?B?TURoZEVyeE5mSTVjVzVLOTZYaEl5NjZYYkNuM2puK0FmL1Y5UDk2YTBkYkdQ?=
 =?utf-8?B?cStqRXl0ZGovZERYMExma1o3NTJTaFUvRTlyTlVQdE1FSWxTY3ZHdGdkZFkz?=
 =?utf-8?B?RVJoL01zT1BQYnM0Y2JPQVVSV3hML05HaFBEa1dkK0FqdnJjTnlKMUFBd2pm?=
 =?utf-8?B?c2MrQ0hyOEI4a05yRkdvWnhaUHRFUDdYOU5iWEk1NXlNb0JYajVFMnR3emhj?=
 =?utf-8?B?QnI4bmdGMURsWE00Q05NZzB2Skt6OC9nbU9zekljSmxNUm41Z1dPRmJFOElM?=
 =?utf-8?B?SC9xU0hPU3VZa3owa0pDV2dJVDNUMml2WG9ZdENodUx2MytpOXpGb1hSRzFw?=
 =?utf-8?B?UDM3ZVBvYjRjTG0xNmxET2ZIcUpySnRQRThER2xMMkRhMHZkMDBpT1VVeFRL?=
 =?utf-8?B?bUhscEpjYXg2ZUVmUzA4Y05KSGV3cU5WM1hMWVRQakdQVUZRa1NyK2hvQXdM?=
 =?utf-8?B?bHZkbElxdWVLTEQ5VWl1STFMR0tJNnRCektxRk92czlUNGhRNWZrOFRnUlhT?=
 =?utf-8?B?MXJPdGg5NGt4czUxRUQzRDJjMkxXaGt2czdwVmR1Y2hyUWZEWFV4ZzZxMXBE?=
 =?utf-8?B?NlJaREZBYmFzbDc4OGVIeHpKSnFkaEpYQUp0cHR6UllyM1Q4SWkrVDE2Snh6?=
 =?utf-8?B?MlhsUGFOYUtaNHBEUFk0UExsTWtYbjBNSzdlTzlDZVdtLzc3TjRmcXR5VVBl?=
 =?utf-8?B?UndDUGw0N0c1TUNlRFdCK0dBWHUvbVVrMXJyZEJBMDFGNVM5Ym5HenZOV29I?=
 =?utf-8?B?bkJrdjNVd2t6NmJoNzEyUTlZTzI3M2w3a1RIZS92NkZlVVRPMW8yWHhqSktM?=
 =?utf-8?B?ZmFQRVdyOFR6aUR5TnlNbG13RWx1Z3crdXRnaG1zUmkrc09zdWZqWHhrRHl6?=
 =?utf-8?B?VSt0blVjeTlxVE1xdlJzd3A2UE1ocjlxbVZ2S2V3YzhSdlJOZWtxMVU2STJ2?=
 =?utf-8?B?MTR3MUNzL0N4V1R6akRuYUNtRnI1V1JwQW5lU1RYRFBLYUtiOEtCb2VYdElM?=
 =?utf-8?B?VVBkN2N4TmJDS1E4WEZkeHUvTFJFekVrZmJiYitQU2ZuVzZnbFR2UGxONnRz?=
 =?utf-8?B?RDJ4UkJiOVFReUdkK2JraDcvSHRmc3loRlNrNnVmY0gvcG1wTVcvV1RJYWRL?=
 =?utf-8?B?WW9oOVhJcjZFRDIxVXdvUENpVmMrSW9SY2FFbUVPUHNkSzArMmlVQVpuQ2g3?=
 =?utf-8?B?b0U0T0Z4ckJxeDhRMG9FQ1dRSnJPcSt3QUFTVUVOTkpiSFdRRHJIZEE0VTNs?=
 =?utf-8?B?WE41OWx1RTVGcWlucktYMkQzQVRIU0FiYTJiYTV3SURXWllsVmlEeit2SENT?=
 =?utf-8?B?YnBPaDliZUVrcVRVV2tpZjlWZEljZ0trMzRIamNzSFF6bWVBMkNXbUhkdmJC?=
 =?utf-8?B?WXZZVS93RFdPTzJpZXp6Wi91RGxoYzMwaEFLQ1d2LzYxWHRhK3J5TGp1eE9F?=
 =?utf-8?B?U0dZRUlvcDJYVXlNYVRFeG81T1RlQ1FpcDBuMDR1OW56UklEQm04aUFVVGRo?=
 =?utf-8?B?NGNocFlRcW9JZmJ3T0hiWVZHeHhIRWdOVEpXc0phYUo0N3BRdHYrZ2pYVC9r?=
 =?utf-8?Q?no7qRvOebVSk0QmOWB3QOJ44BjICeQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 23:41:35.3632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6af0fb5-b1cb-4998-931a-08dd4a2c74bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/10/25 3:10 PM, Nico Pache wrote:
>>> ...
>> Fedora has it.
>>
>> CS-10 has it (-> RHEL-10):
>> redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=m
>>
>> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/blob/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=heads
>>
>> CS-9 has it (-> RHEL-9):
>> redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=m
>>
>> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=heads
>>
>> So I think from the RH side everything is properly set?
>>
>> Let me CC Nico, he did some KUNIT work in the past.
> 
> Yeah that is correct! I enabled KUNIT in our environments a few years
> ago. We enable it as a module and use our own wrapper to exercise the
> code. For RHEL and Centos these kunit modules are only shipped
> internally for testing; However fedora-rawhide makes these modules
> available in the kernel-modules-internal package.
> 
> To test this you can follow this to install rawhide-vm:
> https://developer.fedoraproject.org/tools/virt-builder/about.html
> then inside the vm:
>      yum install kernel-modules-internal
>      add the kunit.enable=1 to the cmdline
>      reboot vm
>      modprobe kunit
>      modprobe <test_name>
> 
> Hopefully that helps!
> -- Nico

Great news, thanks for the quick answers for Red Hat. "Already done" is as
good as it gets, for this kind of question. :)


thanks,
-- 
John Hubbard


