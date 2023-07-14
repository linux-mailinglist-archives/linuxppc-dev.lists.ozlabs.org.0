Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C747E754550
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 01:15:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MyogqPdF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2nQc5GMCz3cDd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 09:15:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MyogqPdF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2nPP6v27z3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 09:14:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy+uJwisrettaHWGnT3/8Uu2eP/YL2eg5lKf0+w0ufZBgwjt7HNw4Hheu2e6CEMD1IaQMv1jRtWOnMXkDx59PC50M8uRrDWYvOc1ICd7hYFwbgpfpBjjgjuFwoFyyA2N/tnWHnaG0JXJhUhQQg5pBpmnc0vtiHuDci4K52Rz1in2rH0G3aUnWLxRHMLyFtF05RLF6FXsrOb0NuqoIzQm7KXqplKFk+1DlpVHKHKsfdqpuR6WPqTuBgIEzJoNkRP7qSnSC1ueOBnznsAzJQMyBtIPBMXT3FxmVYUMHrN/G+0YPcw6l9HLigRD+lb08RiwMntwgLmdusiU7T120tHwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+RaUFJ9WjY6mE7U0k2uCbCH1PRt63Mv/VsQEbl+Lxw=;
 b=Gsl49Q/ehqct5H4FmCd8oMaNTBxeahQY6XKDiwW3eYVhEd0YNvuLHAQUThI1xJkhXt6iRfsFQh5mipOgugvsu8/+S4aIsLLACohrjISBgbk0yXBWiJ+GR8MEzgTLA/ytMlTS//f+8M5Vv7YANUK+D3j2tf4mFeZonfvxf/ASmgj6WSAU1ndutQKhhq05Myx3rey/xrxpu2YkG+CovY6s8u3u0oNtjQ05AQXl9X8o4A3GPqiSEazMA3EKBkBX2erteSCRXM8/YGIpt4mlBDPRi40abonT+sYS6oLjY9fkrhw5eiE3IzE71xuFB9UKEUXo/fiXC/HPT0JsB93kGwubOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+RaUFJ9WjY6mE7U0k2uCbCH1PRt63Mv/VsQEbl+Lxw=;
 b=MyogqPdFR4uadNWUuUtk9C+iKEebY3eNNAdZ4DAbf6kf7SNiCC2FTI820C/dQfUg+iMZ+MwFlARG8iBnnuuv14nMP8aUY+lkPJr7MoZuQIZi0r9rq/qrmj11UFq3we/u5qeaL3p4GJXjr4yCDre4/6pfMamz6fHSqBCsMtrTcpO1ikTfWMCEy8sycJApWsbWejgqyQxva2wn5zE116nJu4hAn/iv9uhhGSOuPMwaFBw1MreCJuyBOlOMQByQcwLL4jVk6cF4l8e35fsA/8OTPxWSCdq5pHn3hMZiwjG4Bo25VXSP33H78u5ViSb+V4rFMumAZjcO5wOp6/aqv/Ka1A==
Received: from DS7PR03CA0326.namprd03.prod.outlook.com (2603:10b6:8:2b::28) by
 DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.28; Fri, 14 Jul 2023 23:14:24 +0000
Received: from DM6NAM11FT072.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::28) by DS7PR03CA0326.outlook.office365.com
 (2603:10b6:8:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 23:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT072.mail.protection.outlook.com (10.13.173.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.28 via Frontend Transport; Fri, 14 Jul 2023 23:14:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 14 Jul 2023
 16:14:13 -0700
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 14 Jul
 2023 16:14:12 -0700
Message-ID: <9abc97e9-1dbc-7944-6232-070cd1cba5ea@nvidia.com>
Date: Fri, 14 Jul 2023 16:14:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/7] mm/hotplug: Allow architecture to override memmap
 on memory support check
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Aneesh Kumar K V
	<aneesh.kumar@linux.ibm.com>, <linux-mm@kvack.org>,
	<akpm@linux-foundation.org>, <mpe@ellerman.id.au>,
	<linuxppc-dev@lists.ozlabs.org>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-4-aneesh.kumar@linux.ibm.com>
 <6f6764f6-4b5a-dfa8-c409-ba4f2828891f@redhat.com>
 <176cee16-f926-ab3b-92fe-98bebf79d43d@linux.ibm.com>
 <641a4276-cfb9-bd1b-36a8-cb4bcae408f6@redhat.com>
 <89d500a4-b639-bf00-ea65-6f2690c74867@nvidia.com>
 <5801c81e-cae4-2ba1-ec93-562fd8255423@redhat.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5801c81e-cae4-2ba1-ec93-562fd8255423@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT072:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: ef56436c-ef60-4d72-00df-08db84c0107b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nGhIy2TuE4VM3UrEx7xAuunyrDeyaV7oM3I9vuqQKD6RUXTH1UnWyvY896d/+ffkpE/EViaeciYAp55NWG2dF5g9uoJO9iOZW6VnnWJsUUbAtmRXardnrF7eDIFYitvIFxZye3XzKTr6siiE6C8+pnbH6eoFRfN+V8xPrfAFeUSktJyc9oNj4j29+aqzxIbQquK4JcfP1GRrxpQ+KclPYt33uSNmtk6FLbwij4kKC5YBbCIYchzmFGwximey2tUD43VCrwj6F0IT3flio6ZJaTkYEvxhWL0NIhMyMG5n/xSh55WBpqt38nCn39WfQMRsoskxrmt3JngdCS6aIMlvEBaexm6lUdosrafqZH+Jj0lLwdfnFPPdYArVyHCsdl3MBvyDHt+bYfsBNFe98ISzTgAacoXCb4gekjkH5cy4u5FczYyvxLtGFg3i0seipI2iWEtVdEJPm/ZwSHfx+Kx0OE6PrYAs4ucpCgkOIi/GDBI8Gdc1Rt/laIc8htoaiQ4gD42OGs1WhRLFX0DvkkT2L/l0r1+rhyyf+KW508/fH2daq4NcvElakA8qmRJ+h+Qt67RHB9gY4tbVEfPly7lgxuHORkpNMj95hiJUf2QzYJ07TBOSHQb/U/SJv6qLlZ4QpCz/pYOt8d+thdm47IEaTvw2Ce2+MdWGQhTqEuCVjaPkmItgAFamq/tpVHiJkizZBXGvn/SjwKGQQmpb2jPbGLDm9Jpr4CrCOKpaGH8djP5BpG6L4FICwTyj8I3Opz2zX43s2iPvTSDd2YA2x1D7grRkVBiJFNmBT7sRI1V/oJ6CYqyad7XdaA5HLdCIeEel
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(31686004)(53546011)(356005)(7636003)(26005)(40460700003)(31696002)(478600001)(110136005)(54906003)(16576012)(7416002)(5660300002)(8936002)(8676002)(40480700001)(4326008)(70586007)(70206006)(966005)(86362001)(82310400005)(41300700001)(316002)(336012)(426003)(2616005)(16526019)(186003)(82740400003)(47076005)(36756003)(2906002)(83380400001)(36860700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 23:14:24.6578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef56436c-ef60-4d72-00df-08db84c0107b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT072.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/13/23 02:08, David Hildenbrand wrote:
...
>>     **WEAK_DECLARATION**
>>       Using weak declarations like __attribute__((weak)) or __weak
>>       can have unintended link defects.  Avoid using them.
>>
>> ...which seems deeply out of touch with how arch layers work these days,
>> doesn't it? (This is not rhetorical; I'm asking in order to get an
>> opinion or two on the topic.)
> 
> Did some digging:
> 
> commit 65d9a9a60fd71be964effb2e94747a6acb6e7015
> Author: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Date:   Fri Jul 1 13:04:04 2022 +0530
> 
>      kexec_file: drop weak attribute from functions
>      As requested
>      (http://lkml.kernel.org/r/87ee0q7b92.fsf@email.froward.int.ebiederm.org),
>      this series converts weak functions in kexec to use the #ifdef approach.
>      Quoting the 3e35142ef99fe ("kexec_file: drop weak attribute from
>      arch_kexec_apply_relocations[_add]") changelog:
>      : Since commit d1bcae833b32f1 ("ELF: Don't generate unused section symbols")
>      : [1], binutils (v2.36+) started dropping section symbols that it thought
>      : were unused.  This isn't an issue in general, but with kexec_file.c, gcc
>      : is placing kexec_arch_apply_relocations[_add] into a separate
>      : .text.unlikely section and the section symbol ".text.unlikely" is being
>      : dropped.  Due to this, recordmcount is unable to find a non-weak symbol in
>      : .text.unlikely to generate a relocation record against.
>      This patch (of 2);
>      Drop __weak attribute from functions in kexec_file.c:
>      - arch_kexec_kernel_image_probe()
>      - arch_kimage_file_post_load_cleanup()
>      - arch_kexec_kernel_image_load()
>      - arch_kexec_locate_mem_hole()
>      - arch_kexec_kernel_verify_sig()
>      arch_kexec_kernel_image_load() calls into kexec_image_load_default(), so
>      drop the static attribute for the latter.
>      arch_kexec_kernel_verify_sig() is not overridden by any architecture, so
>      drop the __weak attribute.
>      Link: https://lkml.kernel.org/r/cover.1656659357.git.naveen.n.rao@linux.vnet.ibm.com
>      Link: https://lkml.kernel.org/r/2cd7ca1fe4d6bb6ca38e3283c717878388ed6788.1656659357.git.naveen.n.rao@linux.vnet.ibm.com
>      Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>      Suggested-by: Eric Biederman <ebiederm@xmission.com>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>      Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
> 
> 
> So, in general, it's use seems to be fine (unless some tool actually bails out).
> 
> https://lore.kernel.org/all/87ee0q7b92.fsf@email.froward.int.ebiederm.org/T/#u
> 
> Also mentions that__weak and non __weak variants ending up in the vmlinux. Did not
> check if that's actually (still) the case.
> 

OK, I looked at that commit and the associated discussion, and now have a
pretty clear picture of the preferred ways to do arch overrides.

Thanks for taking the time to look into it, and also to explain it.
Much appreciated!


thanks,
-- 
John Hubbard
NVIDIA

