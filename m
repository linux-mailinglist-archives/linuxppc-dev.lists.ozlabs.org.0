Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0795AC84D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 02:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLV8w1yyQz3c2s
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 10:42:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C5XSCLcr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.223.44; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C5XSCLcr;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLV7v3XSXz3bWB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 10:41:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EumMnOHuS542aswXXoDkMkoO8bOGEoNhTOB65LwOgEgjq//usaV1QqTUDPu26BR+/UK0XNrSzVLzI0pGCXRBfTV99DwAYzG32JPaeU64B/c82TCu/WGM3B1Rggc1FwzSHugg6HNXrRyLXdfh1v1jMjTudQlm7T+AZjFQ8xPhLKRrMH5phi+yOnbysTV+gbBAT2F3dWN4Lfl/ADd+hB6Llvn85DA3Y8g1T2u5YjL6Puv71AwXViAiLgJLgvKbzgo3zbMbgmL7/yKx5fKxafJ1cUt5Wgpe1NenQa9s99BzE3+1eW3j6gTMhi2NCbBeQ9svgYDS5vSopgBkNSTBYR7YZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cg1V3eJNG0733B+ZazLYIO0/6lpqyf9HBMzTNkQ3ZgA=;
 b=KZGBcCaUCdusDecleuKcoKfyKokXTP0FyzkyhD7LQnn/wYr0zyzBqG1w0IS8xGlSF3nv3I0pXyZWDm5J9v/kLjgnvRngMVLpxkPu7CMV9XSuFSXNXxXkr15nRK28yua0KPZ4skM2rxkJN7bTylJn+JrR7jt0ydv8YdInYu6J+L9Ae+dhsT918dttUrO9lVehh6wDqmiWlXx1eIxfvDbUWeSwea/hLH86xjv7zcVvA5hAmF19PcJhdhJgGElJZnvAeJRFPlOSV2iwr3iCp1jEpJxvlrMcyay1KdGIJF+KEbUM3kyQvJBCBbei3saJ0wbwDjRHUcyXQhnEkWi1VfuwGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cg1V3eJNG0733B+ZazLYIO0/6lpqyf9HBMzTNkQ3ZgA=;
 b=C5XSCLcrJdMDDUplckTr3wiRSioPDy0mHKbiNCBbACvqOGO4B4dA3hYvIv03LKu3q3Bnu6NsZWwGgFlDVdpSov2DjQacm5e5Q4mr8zXSpWTE4Y8aWEb3iC3XgkR9ZUcyGWuJ/mvQI6vqghM8jAF87AITTycJCRTGKOp7MWdDjKbKhWjFBeFB6q9RwVgGj3EJjpaD+dkeTRw/7iBvW1+bFATcUbmvrbDf+o8KRXzMBC8USsxBxsy4qJTcdcDL7i8Cp1NrOsvrDVNvTijezQGaAHmSAJQL7iVT/uH/H0YkrnzVUmmhHwjIF6W2nEKv0bOM6zAD97APfH51x6bdpIVz5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SJ0PR12MB6968.namprd12.prod.outlook.com (2603:10b6:a03:47b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 5 Sep
 2022 00:41:10 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::508d:221c:9c9e:e1a5]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::508d:221c:9c9e:e1a5%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 00:41:10 +0000
Message-ID: <f81f6f90-81ad-7b77-a74d-e9d5d6e3bc94@nvidia.com>
Date: Sun, 4 Sep 2022 17:41:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 4/4] selftests/hmm-tests: Add test for dirty bits
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
 <68cf1d70f3fb8ce4e3c1a4899c19df4f6c382a13.1662078528.git-series.apopple@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <68cf1d70f3fb8ce4e3c1a4899c19df4f6c382a13.1662078528.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea8ea1b-eef2-4adb-3729-08da8ed753e8
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6968:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	s5zyt9rwpC0OtOW1Dc3S95unokOPkDLyQ3OEr8dGvIJCXlRP4AACjxLwRJxqNaOcLPS+kEEUrN0g5MwmVF7Gupw3dYbZ8vP+P4xNs0QnCPraIH0rVJVLSywaEGiYTFeVHHo6gtBVBEkjI15A+0hKhU+5PLuZTgBJ9PP11HDR25UWLyy5hyaOk5OCwAnP9A5W+Q2bG9P8+w726nOFKLR+JFvMoaKSDk2r9DFo2vyi29QJJQ+bMQq0+OAcJzvQ781aHbdPB50/piSPa+tVl7gmiKpvKNI/JwZQbdYDTfi7L/ZAYtBXLwMBW2kei8l3jCx+jKbn327XDo6VHKpu6DQtN6zcgFET4R36AEvpeuc5rHCWxaLia3jhzU1qGE3o1QuRBtRIisw3ZMVRjRxxBYZgFUOPZd+ewRv+LikFEPEqXgkTPei1k1lXO+AoN+EbxFDe8drvjjC0X8CvstaLeLdImLKhxGDrxygjgX9MVsx3P8tc63TvbbPUqjvmioQsIfBwRANF91DgoKPHtoiy9EemkF22nr3+poa138j+Oz2bHTg/tGldlLvuFtbiU9/AVoobpSfl6PaH5DM1XBoArW3WgmwybudWSVtZvpBKk27u3Mfy0Kl8k79x9zAp3YQhmjFGVkW3PtchqNDpWjk98QI2PwAfG+o35uaxw+Y2o5et7ASeMmga85VHmDc8PNuwJy0iOCcUc2zdkbht6Q95B6RaaZA9cHxhiqOtcbWnWC8J+yfG6fnGY2iSMGZYJh9u0vrcsazWgkIon4rd0HFI/G88/GWNd9RQNr540oSsvsJE3GssQZK2uESObqCCMc4fWDoYF/83Y+yC2bslKXhuB3HmBg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(8676002)(2616005)(54906003)(316002)(4326008)(66946007)(66556008)(66476007)(38100700002)(7416002)(2906002)(5660300002)(41300700001)(86362001)(36756003)(31696002)(8936002)(53546011)(26005)(186003)(83380400001)(6666004)(6486002)(6506007)(6512007)(31686004)(478600001)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aUNsem96MWozSktQcVBJRnczZzZJeUR0NFNOcituQ1dYTWRYWk1EM1o4alRG?=
 =?utf-8?B?cnVFeEQzNTF3cmxsMTJQU2s2bjJERG5Wb21WdzIrWHZkNHBKWUhIcXVYRFJG?=
 =?utf-8?B?bnlWM3FCU3JYcUxMc0VTM3pCendhbWxzdis1QUJJOGZoc3YwWFVFNTAxSlpx?=
 =?utf-8?B?SWw5RC84R3piUXBTSktDSlgvZG5ZalRjc3NKS0tZRjJFSjl5WGNZTFFBNDJs?=
 =?utf-8?B?bUFFc2pPdkNnTDRGbzNFS283VVBMMVNpZzArUXpkdnIyMWJrMTJVNE9vb3RH?=
 =?utf-8?B?MXpvMVdTeno5QXVVcEIvSWxYc3dyMktCZWErK3ZVTVlXNmFPZXJhZmFqQnRw?=
 =?utf-8?B?SEI3Qkw5dXFvYVZKZlhKUHFEMndzMVBaNklRTUhXdklKQXJnVUxVNjdLU3RO?=
 =?utf-8?B?anQwYVJFZVdxazllTzJHcWxmb2dMeWszS0J3V0wwSmVSVkcrNm5TNTlmTXZ3?=
 =?utf-8?B?UE0weFRRcVdMSFN6Y1RyNkd2K01XY29CN0trYnVPS1RFTjBRSTVvcUZUbFdE?=
 =?utf-8?B?ODFQeDVHK09HakZnK2JkcGk1VFZsc1ZOU3cyWmRYcVBCdjRsZk5ITkZRemV3?=
 =?utf-8?B?MVZXb2REcGJ5cDFEM3QxV0ptOVMxTjlVV1h2dHZTME1ULzk5d2ZjdU4rbG1k?=
 =?utf-8?B?OWdsTTVhSkZmZElzNjNzTms2TWs0bHdabzZTNkJvbGYwNmtmRkdPTHZybEl6?=
 =?utf-8?B?QWJzS3p3Y3BibXFiZ3VuVDQ5SmV5UEhnK1FBSVNKT0tzNTZnbFRtSllmbklB?=
 =?utf-8?B?bDJLTzkvN08xQW1OK0d0ZEZ3SHVzNS9nMXIxT0pBV1h2SjdEUzhVaGtnUWk2?=
 =?utf-8?B?NHE1ajhLMDc4M29FMEU0bFpIUmFsOG1DZ0JGSU1KZFJ1Z0ZWSjY1c2VRYzVS?=
 =?utf-8?B?aEJyRzZDV2xKMWhsL0ZEZXZUOGh3Y1F3VGcvOHIrTitaMnpkK2VBcVpFVEhI?=
 =?utf-8?B?S0VSMXpsdm8vTDlOVy82Mkl1a1pVRElqVWg3bTNRQmY3K0dSbXNZcUlIOEho?=
 =?utf-8?B?UEpNNlZ1M1hJdFJnZ28rUXNPK0RaNWg4WHYxb3VhMm8xTDNKUEtFcC9zWXpC?=
 =?utf-8?B?dUpwNHFQeEtkSWlJVk1rRExBSjUrWmlWZW1wRS9uYkZ4ak5uYUVTOHFoRlpC?=
 =?utf-8?B?MG1QM2cyc0MxSHRtc2pLNXpGMWVCWlFua1FJbFl0VytWbVJUNmYwRXErUHJB?=
 =?utf-8?B?aEtqNC9FUFdTK2REZ214ZUx5L2lldlFGaVFBb0FTT3RIbHUvWlh5ZExReXFQ?=
 =?utf-8?B?c0lmZVlSdHczd2RuZkV5SVhwa2JRcnlnQXZQbXVQMml4N0xNR0xSdGl6NUdW?=
 =?utf-8?B?RGVxZVhtNVNvajkycDdVRlVtcWduWkFxd2hJazMxbHdobitQbW1mTjc4R3ky?=
 =?utf-8?B?dGd6NTh1aUZsckc4SUdjWGt1ZDlhcVQvQVlMcmt5U01yRUR4KzU0Tk0raUlm?=
 =?utf-8?B?OGNhRjlYTFFKbXZHTEswY3hFaTkxYXdtZnhobHk2Vkk0NWovZEIyeHNydWxO?=
 =?utf-8?B?cjJMWkJ2RS9RZXRmTk5jY004RDFIZHlqN0M5aHN4VzJzM3pjTE9rZkVLVVlm?=
 =?utf-8?B?WVRpSWVVT055OXRydzIwVTZhRVJlZDFmbnFwUWZhSGszSlZwbDhnTS9QZmg4?=
 =?utf-8?B?akZJeHI2WnFuUTFSWnVES1pkTGdUT2UrNUE2Q3ZzNm5xUEZ5alk2eEhmaktG?=
 =?utf-8?B?QUdtNnlrelg4b0NpbUI5TzJCaWhJcGFZL0xQaWpsbXRhYVkra29UaHEyQ0ND?=
 =?utf-8?B?WncrQjRMSGlZOTJleDhXc3ljcm1hUmJkcnFOdlZNOS9MellPWHBxMll0dFI5?=
 =?utf-8?B?Mm9XTGx4SHdwSExpZnRmRjNzL3BuLytrMFV1K0ViM3JpUWpDUjZiYzlaMEI1?=
 =?utf-8?B?SzhXTmtHWlRGUkhuUjFSbndQY3JwM1VVaERoL04wVU1CN05jRWxiMTkvMjRF?=
 =?utf-8?B?dkFMWWtVTCt4dlp0bG9uK1o2UTB6akJhb1JJSmY5MkdkVXdVRENFcjQwLzc4?=
 =?utf-8?B?bEJ5RWdoZ0NMR2FVRFoyMkd5LzU1ZWllNVM5bjE2RURBSVpoYkJLOEVmbUlp?=
 =?utf-8?B?dFE0Vm5RL3JReWhjQ3FZYUwrZVg1MGI4Z2tQN3FRbTRwaVFBSWtEemZnTGkx?=
 =?utf-8?Q?m7VtWOV+TyMuZFM0d8Gv1063B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea8ea1b-eef2-4adb-3729-08da8ed753e8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 00:41:10.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8bSeMJNMNAPnCXjjQLlj5l+lMFqQkGuW2v4SX82aTZ/sADA0UeoeY3nrqBZmNf9hmOjvvODbMlC3LYYWzzAOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6968
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/1/22 17:35, Alistair Popple wrote:
> We were not correctly copying PTE dirty bits to pages during
> migrate_vma_setup() calls. This could potentially lead to data loss, so
> add a test for this.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  tools/testing/selftests/vm/hmm-tests.c | 124 ++++++++++++++++++++++++++-
>  1 file changed, 124 insertions(+)
> 
> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
> index 529f53b..70fdb49 100644
> --- a/tools/testing/selftests/vm/hmm-tests.c
> +++ b/tools/testing/selftests/vm/hmm-tests.c
> @@ -1200,6 +1200,130 @@ TEST_F(hmm, migrate_multiple)
>  	}
>  }
>  
> +static char cgroup[] = "/sys/fs/cgroup/hmm-test-XXXXXX";
> +static int write_cgroup_param(char *cgroup_path, char *param, long value)
> +{
> +	int ret;
> +	FILE *f;
> +	char *filename;
> +
> +	if (asprintf(&filename, "%s/%s", cgroup_path, param) < 0)
> +		return -1;
> +
> +	f = fopen(filename, "w");
> +	if (!f) {
> +		ret = -1;
> +		goto out;
> +	}
> +
> +	ret = fprintf(f, "%ld\n", value);
> +	if (ret < 0)
> +		goto out1;
> +
> +	ret = 0;
> +
> +out1:
> +	fclose(f);
> +out:
> +	free(filename);
> +
> +	return ret;
> +}
> +
> +static int setup_cgroup(void)
> +{
> +	pid_t pid = getpid();
> +	int ret;
> +
> +	if (!mkdtemp(cgroup))
> +		return -1;
> +
> +	ret = write_cgroup_param(cgroup, "cgroup.procs", pid);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int destroy_cgroup(void)
> +{
> +	pid_t pid = getpid();
> +	int ret;
> +
> +	ret = write_cgroup_param("/sys/fs/cgroup/cgroup.procs",
> +				"cgroup.proc", pid);
> +	if (ret)
> +		return ret;
> +
> +	if (rmdir(cgroup))
> +		return -1;
> +
> +	return 0;
> +}
> +
> +/*
> + * Try and migrate a dirty page that has previously been swapped to disk. This
> + * checks that we don't loose dirty bits.

s/loose/lose/

> + */
> +TEST_F(hmm, migrate_dirty_page)
> +{
> +	struct hmm_buffer *buffer;
> +	unsigned long npages;
> +	unsigned long size;
> +	unsigned long i;
> +	int *ptr;
> +	int tmp = 0;
> +
> +	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
> +	ASSERT_NE(npages, 0);
> +	size = npages << self->page_shift;
> +
> +	buffer = malloc(sizeof(*buffer));
> +	ASSERT_NE(buffer, NULL);
> +
> +	buffer->fd = -1;
> +	buffer->size = size;
> +	buffer->mirror = malloc(size);
> +	ASSERT_NE(buffer->mirror, NULL);
> +
> +	ASSERT_EQ(setup_cgroup(), 0);
> +
> +	buffer->ptr = mmap(NULL, size,
> +			   PROT_READ | PROT_WRITE,
> +			   MAP_PRIVATE | MAP_ANONYMOUS,
> +			   buffer->fd, 0);
> +	ASSERT_NE(buffer->ptr, MAP_FAILED);
> +
> +	/* Initialize buffer in system memory. */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ptr[i] = 0;
> +
> +	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
> +
> +	/* Fault pages back in from swap as clean pages */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		tmp += ptr[i];
> +
> +	/* Dirty the pte */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ptr[i] = i;
> +
> +	/*
> +	 * Attempt to migrate memory to device, which should fail because
> +	 * hopefully some pages are backed by swap storage.
> +	 */
> +	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));

Are you really sure that you want to assert on that? Because doing so
guarantees a test failure if and when we every upgrade the kernel to
be able to migrate swap-backed pages. And I seem to recall that this
current inability to migrate swap-backed pages is considered a flaw
to be fixed, right?


> +
> +	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
> +
> +	/* Check we still see the updated data after restoring from swap. */
> +	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
> +		ASSERT_EQ(ptr[i], i);
> +
> +	hmm_buffer_free(buffer);
> +	destroy_cgroup();
> +}
> +
>  /*
>   * Read anonymous memory multiple times.
>   */

thanks,

-- 
John Hubbard
NVIDIA

