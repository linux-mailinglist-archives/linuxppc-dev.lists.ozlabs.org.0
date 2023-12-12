Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB2780EF84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 16:01:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nbiBhjc7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqMJf4jTCz3cNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 02:01:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nbiBhjc7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqMHp5w58z30YL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 02:00:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnTUDSUSqiDxbtbsv1ulQEMZQkiZdFpWAX9w3YWoj0x8tqjzoocqFI1hJr7Gz4F3D7qrgj1eIOqcwoQnThXf+BOQ0PCwhEPaOl8/iQZPbk1GMJZ9E8GQlB17aVTMRI6bZCIGqYs35FAM6riK54GKkPjIUTgaI10n2rBOYNAdPo4qrqAkj0wK4MmrsSSipEdmJRKQLLirtEuNVhpdfJLVRXpJlS+FkXxynTawekwnY7k0JZlXqiyuAPId7GgNTvrifozSKarlShlovP1KtaGm9lRC16GIi3M9vecC3gHPL0VPZFAsX8Xm1aI5dIwxDWv82sROJLwsgVBMaQQzTtyLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWp0lh2BvH7atoIgGk92tPrsbmBqmrdnWMyouww5FHU=;
 b=mrtEOhhP0JoNApnVNksmrL1f9IYp8T2ZpE9elRgJsPsCMUwNODMQtehp5nhAP9tiG0Fk9pNQac/qmTbjsJL+l2ui/brTXysHj24xSYbwrHq8gvyOnasAYxrtDPd4chLQ5hYyIU7SfnaaLRcFXgpqAN9r/m95XIbdA4rKXJZCsb/qI8MWkat3nXbOZyCeh6O00qP9PTdBqJVDAnc8OnlfTIua1pR40N/gqycn4g27rB0bAVjm5/GLoysohFVp/z5+PuWGYGdfQX/M1eaHzuVcWH7g03VBoxRtNRMnNDf5UlYojofnVEDkW4EZEsTL7h+pbWG/gkIHtyOkP6A3LLpFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWp0lh2BvH7atoIgGk92tPrsbmBqmrdnWMyouww5FHU=;
 b=nbiBhjc7Khq/KjFLGoSMsEWngrvSmBZWEOBOizTeVW3EKVqmo1udO0abJWoE2+FxBCVUcUcLVGzbQ9xd5BAQVskA47ebey/JQ7ZxqBBEr+9Rp+S8yUtXfUhQMWLGFZAArYjc9vQKeMEVHcAHPM3lVIktGRiTW4h7h4gOda2yWhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 SJ0PR12MB5440.namprd12.prod.outlook.com (2603:10b6:a03:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 15:00:27 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::eb9d:982c:4c9d:8522]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::eb9d:982c:4c9d:8522%4]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 15:00:27 +0000
Message-ID: <ace772f1-475a-4d20-9bf3-3b9901d48dd7@amd.com>
Date: Tue, 12 Dec 2023 09:00:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI/AER: Use 'Correctable' and 'Uncorrectable' spec
 terms for errors
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20231206224231.732765-1-helgaas@kernel.org>
 <20231206224231.732765-2-helgaas@kernel.org>
Content-Language: en-US
From: Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20231206224231.732765-2-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:8:54::12) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|SJ0PR12MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e67b2f-7aea-4f02-c390-08dbfb23134d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EXquNbxKwGuU2IHJMRi3Z1XtbJ6MUZbrMMn8qdATt+gPPB/NMMkLG+PVBmfdTRMq7GyC0qEBPMr0YsI915XD5YlFw6fg7ZCWKaz1SVSwahO6qHK0+Ze+0Gs8p6ZevUFyUuG0FOwyJFGQh5m6ebayoGIljLyO0b4C00k/BtDqkCtD1N2e+XomgZndVSVrAdxkNJC7mptpLCKIuTQijw+CL2lni9N63DUgY4K15nDWdVdEIEwxwKhoY2dW1kNMTzf2OubwYDlMzj1CNkhx7dVAas+a2HpAabXEu7LimnVd5aRRSYStSktT/+tDqcowNUoms2i5SmrF0sgn3VTOArpq0Jom2J1Fk3t5itYhcU5GnIxQwZT1VfOU2uPcMjCTL+b4ZU/Y1LrrfNnfmkcIKWzPxAJZ41RjqrDYnpiEXfFzCIqeMoLB6GCZ3UqrYgUg85zgZhGVj++m1ISltVKHe234T0zspHyNVweS0h/B2l6oepBl1c41CKNiTgpxLH64k8o8pn7Vk4qB4I4uIxY6NMrbjtPvDfCWneYd78R531pPOopBfIN7n3YpBekdNYlFcUGGtDq56UgBY4q4wyCddTTFyCCV1HdNjwyfj//R8+zRug5K4UmRmY4qJ23ALPUrBTuXD+xZU4b+DTPcfShfjCPlxA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(66946007)(66476007)(66556008)(54906003)(31696002)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(53546011)(6486002)(2906002)(316002)(38100700002)(6666004)(478600001)(4326008)(5660300002)(8936002)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?c2J1eUdkRTZYa3p6Q3c1OXVxdmxHeVZ0dW5IeTRpdHhFWUlkV2kxWTBjeDlu?=
 =?utf-8?B?akFLdjV0SXJNL3JDZy9oUUxNMWtncEhQcGFTeHhwaUxoSGtudDY3MFhOWTBj?=
 =?utf-8?B?Uis2S0dDT1JxZTlNdStyUEVCcUtSK05YdDNNNlRiZlRxSml0dVg3Ykx1bmEr?=
 =?utf-8?B?MHRzQzdzUlJRRGVSbU0xMTRLNFNFU0VsV3JHUlEzNXNHOVpGRGpoVVN0ck9D?=
 =?utf-8?B?dnNnY082TzUwNWh3VEYyN0x4c3JHekpnclh5UVBrTU5JVlhESXNqMUJpY2F2?=
 =?utf-8?B?V1M3T094NWhTWkhjeFU1OHNSeE9lUlRuV2dyV1hCUkFpVlk2U3UvbXRpeWx6?=
 =?utf-8?B?ZnE4Sm9PT3UyeFhMendSNkp2eEY5bUxlNWVyN0w4bHRYNlFBR095endFRzhv?=
 =?utf-8?B?d2xEK2JlSTBEL21QZmt5elpONXpSa0ZPWDNHaGI1Z1AxVjlqQ2xWekJyNXp0?=
 =?utf-8?B?US9BTWpkVlZ5VHdaUnV0Um1SMXplQzNSZFZzTlcrV3RyWVAwZmY2MXljNVlp?=
 =?utf-8?B?Ym5EbGJ3b29vd2ZQZi9KRmVSaG1GZDNKNmhIOGZTcXhaak5qTXk5OGczVGRD?=
 =?utf-8?B?SWtzWUg3ZlJUcWV6NWFlLzl5S2tLaHppMXBOcXlrWTZnU1FFKzQ1WlJmYXIw?=
 =?utf-8?B?M3liaURWOGcwTVk5Y2ZEWnFTRk1VMEMrV2RPeUcyQyt1akdHREo1K2lWOWtJ?=
 =?utf-8?B?TG9YSjRqMDJYY0V0bzZxUkViT2pYRmhXeWdJMkllL25Ud3FHR2Nxd3VEUFdx?=
 =?utf-8?B?RUFUWVdFMTBqQlU5YjFaai84MFVRWDMrTUN0YXl0TTE1bzhBZzFXejV0WEhL?=
 =?utf-8?B?R2o1MXNiUG9qRFArRlljSGVGZ0JzVUN0ZXZrUjluZWZFNE02QlVmSzNVL0pn?=
 =?utf-8?B?NDI4NTYvRUtnZzRsZ0JqNzF2Z0pLN21ocWh6bHQ4NFJqN1NxNzRmeGRkdGdR?=
 =?utf-8?B?dWRBV2RVWE5XT1J0UElkeW9Ma0dSZEJXaFpQdWd4RkZiYXNPWTIvWEQ2ZHgr?=
 =?utf-8?B?T3ZSd1NpNzQycTM1MXlLUjFiTUVmMDNtVm9za05NdVdvUk9wbHY5dUhiaTI1?=
 =?utf-8?B?dGo1Q2w4MTFzbkhSTkhyd0luOVBPOEIwbzhmWTBtQk0zRGRXL2kyaEFzRU1k?=
 =?utf-8?B?R2d2UlU1R01ZWDEvcitBcDVRcS9ybkZpSUdiazZIcUVEUHNkWG41Snh0MFA2?=
 =?utf-8?B?QWRjVXg4ZEl3RFBvRTVmemhWNzRUUVQzdGk3eWg1YWErR1o0WWl3bkhrUndI?=
 =?utf-8?B?YjlrbmRRL0FWNmxGL3pDUnJTWG0rdU1JUXZPU293aUV2OUFlcGcwYU81VEZh?=
 =?utf-8?B?NExxaTVPckhuOTEvSUZCaFFNcXhVZlh2SjgzT3dmRzQvL0VWMGY1WHB2cFZG?=
 =?utf-8?B?aE5xdk8rWk14UnArVXVLeWJDY0VzNVByNmJlZ0hZMkhCUnFNRS9ScHBBa2Ry?=
 =?utf-8?B?eWY4bEcvaXQ4dm9QM0hFeWNBdHp6QmtlQTk5Q3pGSURudWFneENYWTVhb3hj?=
 =?utf-8?B?ZjVzOVpRWGlscWYySFpPY3RqU2VTMUNTK2hGcVNRcU9uMkpSMEIwbXVkODB3?=
 =?utf-8?B?ODRGQ0JSQmJvVzZ5VkgxWExOUU4rd3dVdzBydGM4U3JtQmVNSTF4cllya3Qv?=
 =?utf-8?B?L0Y0dUV3SFJwc00vcVJwa0pkMjl0RjlDeHdiYmdLcEF0UlRuYVFCazNVaHdF?=
 =?utf-8?B?YlVkUjljUFFSK3FCaGlabHkyNzBYcEt0L3dya2s3S0JDU2s0b2oySFZBcEl5?=
 =?utf-8?B?RWI3Nmo4aTNZZ3pZR2lYaXRpNXBvSXFDdHRtUWRzdkF0WnM0TkkrYWhPK29N?=
 =?utf-8?B?N3RwYzZkWGhTd0NSdXRhazU4K0ZuOUMxbFp0NzJudUNUUkxldlJWdUIvSkVW?=
 =?utf-8?B?bThDV3c2MUg3ekJLMHh6UHFDeTJsQkx2RzNEd2hpK20vNldEYjJzb2VrNVBl?=
 =?utf-8?B?ZXM2RlhYaGtLWW1FakxER2lXOTJhR0I1ZWdtT3Q0VklraWVqdFAwQVl1R1Bn?=
 =?utf-8?B?R3Robjk4R1c2Qkg1WFNYc2xvY1RBM1hnSFUzRW9yUkdOak9VR2pEUWhSWFR3?=
 =?utf-8?B?d3J1akh2blRMVi9Pc1ZpVXBQaEJxQm16YjhSTnI3WGZORGJCaHh4Smoyb09I?=
 =?utf-8?Q?y2Fg121+PIJkw7RQ5RgBVv4tt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e67b2f-7aea-4f02-c390-08dbfb23134d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:00:27.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTOjfmRZcAgJ/ND5JGKxSy9WJ5VtbCg7DzuNN0lJWbxFA9cGUP70bBKBGmy+R3L2g9rGg8BddKh7V0u4zmvXAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5440
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
Cc: Robert Richter <rrichter@amd.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn,

Will help prevent confusion. LGTM. 

On 12/6/23 16:42, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The PCIe spec classifies errors as either "Correctable" or "Uncorrectable".
> Previously we printed these as "Corrected" or "Uncorrected".  To avoid
> confusion, use the same terms as the spec.
> 
> One confusing situation is when one agent detects an error, but another
> agent is responsible for recovery, e.g., by re-attempting the operation.
> The first agent may log a "correctable" error but it has not yet been
> corrected.  The recovery agent must report an uncorrectable error if it is
> unable to recover.  If we print the first agent's error as "Corrected", it
> gives the false impression that it has already been resolved.
> 
> Sample message change:
> 
>   - pcieport 0000:00:1c.5: AER: Corrected error received: 0000:00:1c.5
>   + pcieport 0000:00:1c.5: AER: Correctable error received: 0000:00:1c.5
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 42a3bd35a3e1..20db80018b5d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -436,9 +436,9 @@ void pci_aer_exit(struct pci_dev *dev)
>   * AER error strings
>   */
>  static const char *aer_error_severity_string[] = {
> -	"Uncorrected (Non-Fatal)",
> -	"Uncorrected (Fatal)",
> -	"Corrected"
> +	"Uncorrectable (Non-Fatal)",
> +	"Uncorrectable (Fatal)",
> +	"Correctable"
>  };
>  
>  static const char *aer_error_layer[] = {
