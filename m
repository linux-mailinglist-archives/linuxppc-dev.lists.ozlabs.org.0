Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D374380EF8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 16:02:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P9M+yYTk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqMKY2FHrz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 02:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P9M+yYTk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqMHr5clxz30YL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 02:00:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRe4Wzd8odD7fb0xUk2e4EWlCZ7RE8tgycEcWeX4Zx0ec4VRMFJjuC3GgtHHBB6JunurBnzm+RTlP7RuPaoiYl2r2HRWoi24W/xnGC04w4H2L6ztYAJtUUJ7t/8GltatMznzCh5AJyvbgofAJPDZ4t/v4UkDN8/hD+58rK177neqOD3iGQkQJNTabnBaLINd4Vh3FKBxvkkwP04C8GSdgliLyAUtoKtuqtfn+vYPyU5o0YrnNa3mcVxH0SzZu+bCXHEr7uOT843mQU+6fpnm/E/CnC3VkAHDLRMykHybE1a6f6z4S2AxRpzrbLRLEnnDC5+Ys/dIoN7ZCF41ai42TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSQWM4PbzO8YJUdRvXOLVowWREJ9xntmXkqznjus2eo=;
 b=XxWscK7Vk1Ctc4NOQcx5kVUfGCfIERHhCBIsCdEBYR3lsY1lO3edIp0yigjzHux4V5o9UynfUJS1GVYc4xNVxi3oERNvVBPKdiUthF1BkgKBIhUPgLqWDNmW8BHPrHE0ayoSKRLMHUDo7dFwpLjUPycpxdll6j5ExpI31+M/tNxLn81ZwUb52Rbdhk432CHYiMpskU4Z194GoLDylVLHCBoCYlY/i+ATwZqZTYfiJ+EwlGtPeIrHXs+hvQq9h7Hus2Bmd4ZfNiiJE+kqK7cGZ76O952CEloBi02u8jDkplBWyQJkrmwZqwaPmw5ZsTPu+TFC+LcUWMATqWlZ8JRLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSQWM4PbzO8YJUdRvXOLVowWREJ9xntmXkqznjus2eo=;
 b=P9M+yYTk0eBfv2fcXz5Gr9hBAoAOOcaxP/EvzyIisEEwTxK1SL1KFqGs2HchkVF1Ua9lI/BjjIZx5F1DDBRMhrQ+5p/ud1rCxGEbHXk/yyNJqKx7W1AIzu4z81hKkWAoilDF7SBaTMW7Vy4912JeJjFdFMqdgCDBWqJbktbGr1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 SJ0PR12MB5440.namprd12.prod.outlook.com (2603:10b6:a03:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 15:00:51 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::eb9d:982c:4c9d:8522]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::eb9d:982c:4c9d:8522%4]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 15:00:51 +0000
Message-ID: <448c843e-b212-4b21-9c9a-1651a456f4bb@amd.com>
Date: Tue, 12 Dec 2023 09:00:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI/AER: Decode Requester ID when no error info found
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20231206224231.732765-1-helgaas@kernel.org>
 <20231206224231.732765-3-helgaas@kernel.org>
From: Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20231206224231.732765-3-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:8:54::12) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|SJ0PR12MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d39cdef-5fd8-4b2d-07bb-08dbfb232200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HMGnCjHSscWTosmaVOVD6H+3pmC+qP48GIQYovYAqRfenhS+SBXcuqZPtB/HMkxHr7b1DJsJEKkd0OI2R+yZuQm9KohwI0m90t9oFWzTBeixr7uQ3c7RAeHYweuRh8atVx06DG2K4ESz3A+mbClygH+P+txF+2SCuf7v1aD6uNLgPzWe+FkMF1S9jy0i2Nx3qr5NywFzUVjiCj5q1vnebdJ86049VmxTH5I3mmolWcHgvX1GPP3r4pNP1p1rdP3Ver+hFwP73gyrhDTPxUwiqjQqYmQYa36VDhhqweXzks07D4FYx9SPQCSvFe5GrsY/D88ehOugzLH5I53gEibVYZ2h/JLG9RtuKMNramzyF/GXCeFXIAfymPsfDASPKfAKOTgSHqvV2X+lqiR/KU2fdqlpnKK5EYdK2CWUDs2vd/0Z2sgUaSRWObc3C2qrXeW8C0UoovMTcY6R8RMaAiPgQOUaqH+SObqfrkQQ7elmznN9jMSoWIPG4kjR0sE7Wso8bJhQaQU4WFWddaOFiJFXrKuhmIpFvIqlwbNL3QnqvO+EUm5R7grD74N6LQVQ8bexVF+I7sEAuZsetYoZ66o30jo/YJAiuK8r5vz0HuoeszXDNpmVaNSmgzrhO/gBkitapKSG87y6mEDJNFwOEeOL2g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(66946007)(66476007)(66556008)(54906003)(31696002)(36756003)(86362001)(83380400001)(26005)(2616005)(6512007)(6506007)(53546011)(6486002)(2906002)(316002)(38100700002)(478600001)(4326008)(5660300002)(8936002)(8676002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z1FiMlB1YUlzWndqWFdXUDM4ZzdnSVgreThzaTFuRitMbWo4bjBRNURuWTRY?=
 =?utf-8?B?SDVNODdscVNWUm9jK1ZRTFArcmdvV29sNzJFNkF4TnJLVENlaUhycUlsQ0xY?=
 =?utf-8?B?anYvRHE1c0IrdlZhZXg5YytqanVKNEk3RldENk04QUtneWZvTU1Ra1NxQUF2?=
 =?utf-8?B?ZmZuTlFqK2VMRlVhRnV0clZLNVBFOVg2eWEyREE2R2FNZDVHdGRmcVAwNnlL?=
 =?utf-8?B?ejRXYi9UNTlDaVF5WGtYZVB0ZUtqZUcyL21FVGR4ZUxFVnNvczR4K0FiN1pS?=
 =?utf-8?B?cGJURlViR1ZRSkI4UmNMaDAwUFFWUVBYdlR3REZnTFUyUTV4RTRVRy8vOFR1?=
 =?utf-8?B?aXYwMExRbWxTSHUzUWt0cGZuWFl5dlRpSzZMMUE0WUJpbHFrWkxoZFdNMVZr?=
 =?utf-8?B?bzVIc0x6emdhNkRBVnY3YVpaYjliL0tpMUR1MSs3RGQxbVBMOTVXZ1BjMjVK?=
 =?utf-8?B?QSs3Nzh0QVM1Z2szbGJmcE9vbWFFTzRUSmpaQ1JQaHNNd1p1cW1FRDBSQStp?=
 =?utf-8?B?K3R5MFpJOFlveEpUYnFHMnZ6dnZJTEYrQ2JIT2k0VTVrZGZnd21HdkNCVGRC?=
 =?utf-8?B?TTNsNWs4WldhWUtSVitVZnIrOXRsZ3VlS1BSTjB3S0wyNWpxbFpJN2p0eFJ6?=
 =?utf-8?B?dUxORW5DYThtNE5GdUtLdDhaa1k4QVJrUnlucEFYS3RNNHVXOVJFUUFzbnU1?=
 =?utf-8?B?MDc0YWwwekErQ0hxcFVZV0c0Z0R1bjFsOTVzT0RtMExCU0lIYUc0b0ZSK09U?=
 =?utf-8?B?blZNbmdVcktROW5IWk9jem8wT3ZrMVRVQWV2T0lENkhiQmg2bVI5QmRiVFZY?=
 =?utf-8?B?YjRIY0FzVmxGSEJKejF2UENuc3JrODI3L1JNZ2Q2NlI2QURsUnF3ejF0SCs1?=
 =?utf-8?B?SS9ZVHZzem1NN3NqeGx5YWlSWmRnaENxMkFWeEdGLzJjQUUyT3BhUEVDQnR1?=
 =?utf-8?B?alVJTUNkRU1EK2c4K2llcnM5YmQ1T251Q2lHYUtiZ1Ftc3JPeTBHdEh2UzdM?=
 =?utf-8?B?bVJubFZBSWc3MnZZQjBYclZKUC8vUEFtQ0JaVU9WNHpkL1Z2RWF5amN0T0Q3?=
 =?utf-8?B?ZzRuVlJSaFRxNHJSLzJ0bUl4Yy9WSDRRb0hhVHhSRW5TMEYvVVpqR0NjdjdB?=
 =?utf-8?B?MlBaZXpKWlVmT3JxR2JiZDlGSnE3Z1FISUlHYW1scUNhVWFWNmN3L1oyd3Br?=
 =?utf-8?B?bEJ6eXJtOXlUVFFxbW8zZzhkUGVCTEFjZWkzVzhONEhPWG05dFVRNnEzMWFG?=
 =?utf-8?B?MnNYWVNaSDVmSWRiNFpDb1VIZmNmaUhVRFA0dHJRQ252ejk5QkR4QUdKSUlE?=
 =?utf-8?B?YmMxbmZMR1h3SUFiZm5aMFRvbGt6RVJKRW1hWFM3R1FsRFdPSTc3NjRMZFNx?=
 =?utf-8?B?Y1BHRlJGOTc0WXNJZmdSMU9TdmpvRmR1VmN2MFlPSmhzOUpqNnRVNXVqd3A3?=
 =?utf-8?B?dkUzdW9vcVMrR0QwTnZDdGpFL1JPNktOK0NzZUVNVzlQOHZhSmtGLzRJeXNL?=
 =?utf-8?B?eU92UVNNbFd3L2VkaDN4bHNNaFZpUjJBVy9DZFpQaTR4dTdBUWRjaWkrUmo5?=
 =?utf-8?B?eG5vRTQ1bkkxRHhyYXJoZUdkV2x4eEJNa1BLZS8xQ0hXZHlxZU83UjJBVTNz?=
 =?utf-8?B?Wm9xZlhVRHlHYXJ4QUd4cS9XNGpPeG5xZTJQMlFvZkpqRW4rMTV1ZGxvUDFr?=
 =?utf-8?B?bEd1OEUvRzk1ak12b1ROTFpka0h0dWFhR0Irak9aNWVRM0Y2Zk9jR1lNMFQ2?=
 =?utf-8?B?RGpCTTMzVi8wZjlOQWc2cUN6Qkt1bFVXZ0trZDNTNnA5dzNLSTNsUjFMV1hF?=
 =?utf-8?B?UkpTbktGQ09WZHpUcE1GbVNBU3lPbFlqVWxVSUYwS3ZkVjZGTlFlaHFPek1W?=
 =?utf-8?B?TCs2aERKOHpybmNkZXdOTEFiWXIvb01RQUwwVnlYT1FFUWRwSnNMb0lWaGps?=
 =?utf-8?B?eS9BbTNRWmZuR0liWWpSd0pxRExTdVFjVWh0eGxnK0V2dzZXZ1l2TFBkY3FM?=
 =?utf-8?B?RXRRTVZ6VU54eEEvVC8rWmtGZnRWejg4RC9kV1ZxdzV2OFMxbGl5OVZwdnBY?=
 =?utf-8?B?UDByV0xSREgxUVpuUUNWaUtPUGN5UEtiaUZ4RVo0ZXFqNlFHWXRFZW13MDFj?=
 =?utf-8?Q?TjmVznRfk0eyWmezmrSjTQISD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d39cdef-5fd8-4b2d-07bb-08dbfb232200
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:00:51.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayrfQCMep1zMuvz0A3NI3Fbadf8wWiZ2yMWiRIur5B1gD0Obu1fpxgFsHOzfMuBkont881OZzMOiBHwjuOtFBA==
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

LGTM

On 12/6/23 16:42, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> When a device with AER detects an error, it logs error information in its
> own AER Error Status registers.  It may send an Error Message to the Root
> Port (RCEC in the case of an RCiEP), which logs the fact that an Error
> Message was received (Root Error Status) and the Requester ID of the
> message source (Error Source Identification).
> 
> aer_print_port_info() prints the Requester ID from the Root Port Error
> Source in the usual Linux "bb:dd.f" format, but when find_source_device()
> finds no error details in the hierarchy below the Root Port, it printed the
> raw Requester ID without decoding it.
> 
> Decode the Requester ID in the usual Linux format so it matches other
> messages.
> 
> Sample message changes:
> 
>   - pcieport 0000:00:1c.5: AER: Correctable error received: 0000:00:1c.5
>   - pcieport 0000:00:1c.5: AER: can't find device of ID00e5
>   + pcieport 0000:00:1c.5: AER: Correctable error message received from 0000:00:1c.5
>   + pcieport 0000:00:1c.5: AER: found no error details for 0000:00:1c.5
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pcie/aer.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 20db80018b5d..2ff6bac9979f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -740,7 +740,7 @@ static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
>  	u8 bus = info->id >> 8;
>  	u8 devfn = info->id & 0xff;
>  
> -	pci_info(dev, "%s%s error received: %04x:%02x:%02x.%d\n",
> +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
>  		 info->multi_error_valid ? "Multiple " : "",
>  		 aer_error_severity_string[info->severity],
>  		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> @@ -929,7 +929,12 @@ static bool find_source_device(struct pci_dev *parent,
>  		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
>  
>  	if (!e_info->error_dev_num) {
> -		pci_info(parent, "can't find device of ID%04x\n", e_info->id);
> +		u8 bus = e_info->id >> 8;
> +		u8 devfn = e_info->id & 0xff;
> +
> +		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> +			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> +			 PCI_FUNC(devfn));
>  		return false;
>  	}
>  	return true;
