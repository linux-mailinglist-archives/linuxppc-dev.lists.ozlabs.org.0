Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6F934E81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 15:49:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XPPptqgm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPvLk4v9Jz3dXL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 23:49:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XPPptqgm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2407::621; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=stewart.hildebrand@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPvL03Y1Gz3dD2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 23:49:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ho0GMO+35KAmtSaiYVPXkL/9GnPNUrI3HWAUqNzD6tHXR36G2e4B55O2zHW56KAtfNyBfkd8al2sgtbIb1ad7k83XXq9pT9P3g99yFcJWBjXAgGjB11v6D8y4YLeiOst0I07B/scH77vCTUQlgS9akFmvwJQo54NXSQhKYA4/htsSMtju/htoIL0hb+5Q5vuTRyU5dXfB6YGBc5W1GgY4HasjdphLgvFvfhoHeCTxwvMGaEfNgADXmONRCRkCv5c+RM1sk/R1GX62D+qJUqflfWHEV6WPE66a0NHuIAGwYcpHAJmvKav65S/S2QdVFrUUZTnZWOX1a4gQj8I0HC49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2BqtejKqAOVlJy3nKX81UnmFiET1q6Y/i+tU+7E50g=;
 b=W+258WxIUsYu0tbMgc9G1ymAC6wTIiy9Rd84j7bVPPrnXrAbQA9HE1t/O9e/NMwlFppAGUwCWeC4/449vxPqkQiu4HIo4xEqDCTqBjn2B+9+z9whp+iHX8tkPmdXGCwvha1OVn8dau5OqdKbB6URzmW58GwMwRSGM5zbpAWzW676YW+yaTqRTeIxH4D9aZLdp2jsoADL1kpdKq+ne8niVroWiGJFsLvJoRV1VgMChCou6viK+mPng07FOgGl1Z5+w9JtDDdJqE2oX5Or6R+KV7LTR+rwiIND1jlpQF6BTBVDXDiWZcNbgWyACgQ3PW0JR/i3YkoBsHufhwv/dHhz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=aculab.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2BqtejKqAOVlJy3nKX81UnmFiET1q6Y/i+tU+7E50g=;
 b=XPPptqgmrlw1wSDKBBmVqNplS7rsnlypnUlciMOjsXa7bE7irYvsgQSD5UOt+TU2ICEihpuSPjpde3yqdWLMzqIm09DN3bS5/IHj0pUYNg50pwkOw26flO8wofZFOLcusjP1zWA22vcBL46rY+aOSKnnX7vvpQPz+nWskYB/t+k=
Received: from BL1PR13CA0392.namprd13.prod.outlook.com (2603:10b6:208:2c2::7)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 13:48:35 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::fd) by BL1PR13CA0392.outlook.office365.com
 (2603:10b6:208:2c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Thu, 18 Jul 2024 13:48:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 13:48:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 08:48:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 08:48:34 -0500
Received: from [172.25.198.154] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 18 Jul 2024 08:48:31 -0500
Message-ID: <f9875438-d937-4c0f-92ab-b69860b63edb@amd.com>
Date: Thu, 18 Jul 2024 09:48:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] PCI: Align small (<4k) BARs
To: David Laight <David.Laight@ACULAB.COM>, Bjorn Helgaas
	<bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Arnd
 Bergmann" <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, Yongji Xie
	<elohimes@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
References: <20240716193246.1909697-1-stewart.hildebrand@amd.com>
 <0da056616de54589bc1d4b95dcdf5d3d@AcuMS.aculab.com>
 <a4e2fdae-0db3-46de-b95d-bf6ef7b61b33@amd.com>
 <6cd271759286482db8d390823f408b05@AcuMS.aculab.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <6cd271759286482db8d390823f408b05@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 72cbb478-0c14-47a4-3126-08dca7305205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?TjlqYmdGN2NabThhajNyTGhsTU0yMXpZTU5GbXV0enBpTkViaDVYOGVZQ01E?=
 =?utf-8?B?Zzg4SElSNzVJL2p2Y1FZbXR0NVo1OWVENWtpM1JXaDdsVHJ1cFN3SWtxZlg3?=
 =?utf-8?B?SkZRM3gyZTRrdCtrU3g2Q252UjVIUkgvUjFpUVh6blFKcW04NVRXbVJHOEtx?=
 =?utf-8?B?MlNMdGIrOWVpUFJSbzBvUWdoaFBMVTlVVzNFNHlvUHAzdk9rcmg3WkpveUl2?=
 =?utf-8?B?VlkvclJPMGsxTEl1TEJnQTNQaEJmb3hROTVqRWJ1YlIwVlR0UXF3K1l4NFdH?=
 =?utf-8?B?SkJYK0k3TDJqUHlwYjRydjRSaGxudEhnVHh2d2lNaHlFUlZ4RU9YZkhlRndp?=
 =?utf-8?B?Zmt3cjhDbU1vRzluWHBpRitXaDNGMDAySjd1Sk13Tnk2TlR1N1NkVE8waHBO?=
 =?utf-8?B?R0xneSt5NjVpS0thWHNySkFIcGJBeXJubzVtN0dnQS9aVzhCWFNDa29QZVUy?=
 =?utf-8?B?eDdYVWliaVFIc0I0bTdFZnlCZkNjci90dGdiN3FNMGFSWVZaV293OEZlTHda?=
 =?utf-8?B?YWNhQkEzVXdMNWR5a1dBWG1xNEVLV2ZldEJvTlZEOVFDUFZBTkJONUF1ODVh?=
 =?utf-8?B?WVcxOWJSQnJWS09qbStzUHI1QzRvUzBkRy9aZTlUSmhwQTU4dGFwQTVzZjlr?=
 =?utf-8?B?N2puM0lUdWRvQmNiSk5icUs1MjZLVGxiWXdIS2dQaFRXSW0zU0FmV09MT1ZU?=
 =?utf-8?B?aEtJc3NsbDRWbnJLNUY3KzFpVnBHd2hFbFJKN0NQS0JpNDVneVlVZDNMK3BU?=
 =?utf-8?B?Zlpqd29lbHNzUlY4dXZWeVo0M0lIckQwb2NzTEwrWmR1SEJOSVp1SUM0U2pS?=
 =?utf-8?B?V3U4T0FST3ZVZ1c4U2w3TEJBRGxQM3IwMVlvUlFnY3hpR0VEdmduMG9LNFBK?=
 =?utf-8?B?VGtZYkFQWWljVVdCaUg0cWxBNTNXdHRRMnVKNG9HTlhDckc0Yi83ZnNxSitq?=
 =?utf-8?B?eDhJUWl3S3JVODh3eXFFM1ljc3FxVjJLNE5HVmlFUEFVYjRvc1hoUnVUSm0v?=
 =?utf-8?B?OUVpR0YzbWVJOVo0dkxlNUNQNm1qanJ1TVQ2NjRyUEJIM25BN3VsYWh5b0tX?=
 =?utf-8?B?TklZL2dlNWZHdTRvbEhyTEtmUnpzMDJ6QWVPMmtRNzllTDErMDBqL1o4NjNu?=
 =?utf-8?B?cFhiQXRSb1RKNkJYcmtCMnJtazQwcTB2Qmtxc1lQdlRpVmFsVTI0cUFkTThG?=
 =?utf-8?B?aHExL2VYOTRUUm16c3hzWFBYb3Y4ZnBLU2U1ZXhqSTJ4U2JQekNwSSswL3Qx?=
 =?utf-8?B?eWEzdTNpcHoyZ2hIR3ZDelNtcjl4QzZZbndldUNNZnhYUFJXV2lUZnJ6N3Rz?=
 =?utf-8?B?S0gySUNxOEtRbFFiMzF2NXQ5ODN3YVV6eU5jV3FxUndCZE4xSHViT1VuYm1w?=
 =?utf-8?B?a0VKcWtiVkFwU1ZuSUNjQ21aVSsyd0xVb0NMWjNKZCtHc3BaemQ5ZHB3K3J2?=
 =?utf-8?B?eEZUUFNkRHZwS3pPSkltMlNaLzYxWkZPclpaYXVqRVAreHM3U3YwVUtVcUJm?=
 =?utf-8?B?ZHloVnoyQ1FMY1hDeVM5QzIzaHQ0TmlNR1dLK3dQL0tkSStmVmh6eVcxS3lj?=
 =?utf-8?B?MkM1dUJoQjdnNzAyUG05Y2NLVTZJUTJvODlnOXJaNGJpYnVnZklKQ2V4KzJC?=
 =?utf-8?B?ZXgweU8veUpaZlhiUGxSQW8vNkdVN3g3dUVqRnFEZmN0OTVSbG9vV1BQRzdC?=
 =?utf-8?B?b0N0Yk9tSW5kOGI5MzBwcU9QcFRCTDJFUTkxM3d2K3JIQzJ2ZTZXNHZ2SVdx?=
 =?utf-8?B?WUp5N1dyNnlxWFpZTmlvaFVRcTFLSVk3NFRodGlYcWNIbkpKZG5FOXlqb0Q2?=
 =?utf-8?B?L0VLZ0lMVTIwTm1MWGFlRC9YTmFzdURIcU03VWFZVTFjY3VsazhxK0p6THZJ?=
 =?utf-8?B?WDhCaUlpZ0ZPRFFZWWJGb1VqN2h1VWxVT3BpMEhja1Y0MldvMUhDcGROUkU1?=
 =?utf-8?B?ZUJXVWRjS0IwMjVvTkxxVWMwNnZjVEprZ2h5YVRPcXlkOXhVZVo5L3orazJF?=
 =?utf-8?B?bUt6bERrRU53PT0=?=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:48:35.5483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cbb478-0c14-47a4-3126-08dca7305205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/18/24 06:01, David Laight wrote:
> From: Stewart Hildebrand
>> Sent: 17 July 2024 19:31
> ...
>>> For more normal hardware just ensuring that two separate targets don't share
>>> a page while allowing (eg) two 1k BAR to reside in the same 64k page would
>>> give some security.
>>
>> Allow me to understand this better, with an example:
>>
>> PCI Device A
>>     BAR 1 (1k)
>>     BAR 2 (1k)
>>
>> PCI Device B
>>     BAR 1 (1k)
>>     BAR 2 (1k)
>>
>> We align all BARs to 4k. Additionally, are you saying it would be ok to
>> let both device A BARs to reside in the same 64k page, while device B
>> BARs would need to reside in a separate 64k page? I.e. having two levels
>> of alignment: PAGE_SIZE on a per-device basis, and 4k on a per-BAR
>> basis?
>>
>> If I understand you correctly, there's currently no logic in the PCI
>> subsystem to easily support this, so that is a rather large ask. I'm
>> also not sure that it's necessary.
> 
> That is what I was thinking, but it probably doesn't matter.
> It would only be necessary if the system would otherwise run out
> of PCI(e) address space.
> 
> Even after I reduced our FPGAs BARs from 32MB to 'only' 4MB (1MB + 1MB + 8k)
> we still get issues with some PC bios failing to allocate the resources
> in some slots - but these are old x86-64 systems that might have been expected
> to run 32bit windows.

I expect this series will not make any difference with that particular
scenario since the BARs are >4k (and PAGE_SIZE == 4k on x86).

> The requirement to use a separate BAR for MSIX pretty much doubles the
> required address space.

4k region, not BAR.

> As an aside, if a PCIe device asks for:
> 	BAR-0 (4k)
> 	BAR-1 (8k)
> 	BAR-2 (4k)
> (which is a bit silly)
> does it get packed into 16k with no padding by assigning BAR-2 between
> BAR-0 and BAR-1, or is it all padded out to 32k.
> I'd probably add a comment to say it isn't done :-)

On a system with 4k page size, this series should not affect the example
you've provided since those BARs are all 4k or larger.

If you are testing with this series applied to your kernel and notice
any regression, please let me know.
