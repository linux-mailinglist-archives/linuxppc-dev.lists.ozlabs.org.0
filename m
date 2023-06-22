Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76D73ADE1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 02:35:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s2XPgj4n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnJF44pPqz3bnm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 10:35:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=s2XPgj4n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::600; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=mario.limonciello@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn2zr6BcRz30Ct
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 00:38:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kl0jX/ScXDldWb9d/hz0s1PypoxaEVsLalSOZp6cqzwEBG5te/IPnEbqQRD8AZ8ggcT2H0muDWCrOmcpUWG1svuvJz2+6LpauGrKGBW5Jr4kGkHTMrgCGD8RxVA18nrzDebAdvwlr/GNEUP9cZn5iCRW+LOtXxzMwU0DCtRw27WOBo08ny/hGnE9pXLUC+rsl/3J8r25TPV8J1Op36Gw5vGKLD3j7wT5aM509TgkZHlSP26EUIvuN4BdvQ97aR8LjrgpUIsXOE2gscOSgEwkW0Hmm7F6sMhrXxEwe6HakGgoZZ4oDLJAPfjG8ROt/Vl/2xbi5TS8D+xLaUHKkN76Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6C1k0E6VRMHIoAozH2rVxsMz96aEptMYqxwqVPAWTMg=;
 b=J4OSWEr/+OstpLlTjbrTq+iebGi6i/2+s5Ga7gBa0Ed/sOyfeGiQUqKxr5Yb7unrLbI8g10xQ53UcWUjpEMsT2QPCYNWsVdg05LefYL5Bo68WWXBd4Yo5FvbeKZpPNe4hRQ6WvgZYVGuhbVhlztiALiY4oqXVUbBHASnaGZ92etDLlwOe9Z0jM7l+50NBBqOohlMTDi+P4fXsP+yp/HYhyettDLn1Y8W3LYvF4RfA/cR1Aaeh9Wm+thJVoElsAH7LpRXRZEeKOWqQM6Z/yYk+4eQEpOXHzm+W7DPMbPLJq0wlx7qSPqlHnkt0qN9/S0B9t03yoOMugWtLZiYCCVVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C1k0E6VRMHIoAozH2rVxsMz96aEptMYqxwqVPAWTMg=;
 b=s2XPgj4no9qlERKadt2nqsCfyB2zyRf+1e4YzeByCife1zzcyx5e8Gl+PLHmYxxeshyKHUJeBM1XvkajRQc9K8xFk57ujmMi+A2zSUU5jk23BOzGFP4KRRNNntpBLKsUEEqTvE0lIvBkj98Ck0DKu4/geygiq9GzpQ2KhjTMH2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4504.namprd12.prod.outlook.com (2603:10b6:208:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:38:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Thu, 22 Jun 2023
 14:38:06 +0000
Message-ID: <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
Date: Thu, 22 Jun 2023 09:38:04 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
To: Michael Ellerman <mpe@ellerman.id.au>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Sachin Sant <sachinp@linux.ibm.com>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <87o7l7oer1.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0059.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4504:EE_
X-MS-Office365-Filtering-Correlation-Id: ec40b563-dabd-4c86-69a4-08db732e4aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bz4R2Ns1fK27e0Lj1LzPzUI2RNTSI3rwUbDYEYq9lGhNZ39MNYvOBA23M09cD0DB9MMydnz0G/3DeGXNR4AHs/UdRIVvVJJowt67qa9nMOYtERB/c8GF9l8eDB9UE1GmGxiovpxLa+hJmOaXjK9SZaT3Ew9wpKb4nmRF7Ad9ceWbzfVDy4HKNPoj7lh7T9d/RvYZZPaeAHN5bPX3s63Y2aqFhpzezr62U3TlzCcPegi+jKMKl8Gge02pSWvAPTwarzVBk5e6orY1i383nQfMeZMbOyOK7TbDZ+ebkU+SyqudNBwLESTKCfsg9NqlotoP52x8zOu0iz5rIwok3jSKgMAlktm90NTH1c/vNrsmBMud+xCEGB7WEXY54zSW9MuNDYYu2OBCdA3oAg4nJVoi0xF5U1xwj58oQkwlS+hm9UZaiOKj0lYR705sZBwj3+luFm/DcURX1lQKzGKgQWHN/UglzsFXKPsdh9OThAqBiPqq1sVBCe7iGo0mk6vF+U4CJoqCyWJ6lujsVS2pMveKGsLvF6GC8PZBXhHHSXCFgiBBhDqQx+FQ1KFGx7PvFQTEYINkUCajk8Tpf5M3RoPXOitq47UtEg7kWQdGHjbs7XaWupCMEJijHcixx5A38X0AL8bLRnUtAvwk2aOt4ETPfA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(31696002)(4326008)(66556008)(66476007)(36756003)(2616005)(54906003)(316002)(66946007)(83380400001)(6506007)(53546011)(31686004)(86362001)(2906002)(966005)(6486002)(5660300002)(41300700001)(6512007)(45080400002)(186003)(26005)(8936002)(8676002)(110136005)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?N3AwSitNMXNMNWV6alB5dE1icjV6b2o5eFVhVm1BS0VFV0VQYVQ4dDVDRHFv?=
 =?utf-8?B?eDZWMVQ0WEhQVU50czAva0ZkV2xwcUsyMjBvVzdPREJaemRTOFRNWlZweXlD?=
 =?utf-8?B?cWEwSjFHVXBFY0VHZVp6SDdOdmNNTDBwbWlLNHJWVHZyd3ZFOHFvUGwvYXlH?=
 =?utf-8?B?RkxQcy95TTNmOGlXRzVMbnB5dFNFUitJeVFnUmZlOUkzQUxidzlVS2JHUitu?=
 =?utf-8?B?cDlrTm85aTdLTWJnZGRvTUwzZDZPWHV5S1kzaC9qdWE4ck8wOVJUSEZ2TmZo?=
 =?utf-8?B?MFV0ak05MlQzYXMzdW8xUVFyMlZrU1JBTk1LdW05SHBYbzNiaVZDWFQxT2g2?=
 =?utf-8?B?Z0F5Z0lBV0N3WHZjMm9GSjJNT09nM1hXM2N6OE84UVQzbTFjcDU5VXd6SDdq?=
 =?utf-8?B?cXVNbXV1REgxRHo3bWpJQ0tKdGZubFVSd0VESkxKUUgrVzhmZW5Da1ArMVZq?=
 =?utf-8?B?ZlV2V29BbytZYlhNR2FROXhzM2tuNW5hOGlYbVhNV3RHQnJ6UmNuUlJFWVZG?=
 =?utf-8?B?M3gvLy9EZ1pCL2ZyTWYwaXZlMjNWc1htc2VZa3RZL1VtUm5STmQxTllRVDlu?=
 =?utf-8?B?YmFzNkNUY1dwSm5zRjNiQXZXdWVLZHJYY2NtWjBHc0lPalVmQWNGVklTVGVK?=
 =?utf-8?B?Vy9NTmhmcG9nUWFYSHB6RjhmdnVOTW1EZnIvZmpJVWpvZFlUazJYNTlvTURD?=
 =?utf-8?B?dzZMb1I1Tk9WRUVkRDV6TVZCRVRKWGdORjZKbmI4NGdUK3ZFTW84ZVZneXNh?=
 =?utf-8?B?bkhqNEVobldvTGVnUkxIMUt1aFJ6RmpTRXozYjEzYkxTQncwVElteG0vQ1JH?=
 =?utf-8?B?cnFmeHFza2E5c25EKzkzU0NIZXRwQWg0N1lSSlhnODZVWlRYZ1gyUnVHTlFN?=
 =?utf-8?B?cXRONnBacXYyTlZlNEU5Tzl4OGdMN0RPMjJ2YTdLSnpjQTdUamFjZG0vbitW?=
 =?utf-8?B?dTZ0NHhBZG5xTSs1SHRUOCszR3g5SjhiOVZ4ZnhOcytnSUhZbWthbTVnRytu?=
 =?utf-8?B?SzMwM05uMzdBbmMxM3IwdGdtbmw1RVlEeXZoVWsyVWhaVG1SV3RmenlNb2pF?=
 =?utf-8?B?Vk1iaEhmR0dzd0hOY1ExSkRFbHg1dzZQUTVYOTI3UEZHVlBwZ3pxaGZRbkdU?=
 =?utf-8?B?bVpSVHFLWlBpN2t3aC9wVmRQa0orK0swYTN2amdCck53alovS2RjZ3NzeUFJ?=
 =?utf-8?B?ZGZYcVNWWVpjMG1wUnNRTFJvZkRZM0pRTzF2eG0vT2Z3K2NjWGpEQXh4NXpG?=
 =?utf-8?B?bndQb2pwdS9nMlFrQkwyak9FWGN3VHFpK2FUTXBCTmxjUkRWdXQvb0dxaTZ6?=
 =?utf-8?B?TnNxK21XN0c3NFpTQkNEemZTTGdpODY2OUR2ZjhvbjYyZ2lndkJ1YU0zSC9Y?=
 =?utf-8?B?M1kzS1hrNy9PcThrajJpVHVDRDEvcGt0cDl6czNBWm8zYmNpeGZIKytMSVJE?=
 =?utf-8?B?UnFSSGJmRkN3anA4c0VvSjl3cXR3cUUvZ1ZDRU9XZlNiby9iSkFuQmlSWUY2?=
 =?utf-8?B?K0tmOGNmdVNiZVhWUU9jS25ZN09JamV4aFdYOTRseDdNUS80c1ZzQ0RIMXpU?=
 =?utf-8?B?aWJmRDN6d0Z5VThHZ1BMS3JSN3NRQU1FK1JwQ3RSbUE2NUpOc0lmcDNtV2sy?=
 =?utf-8?B?Tk9xQnczaWNmQVVoM3NKbGtwYlFBcFk2TmxDNUVneXhjM2RLMHlDTWRSamRE?=
 =?utf-8?B?RHY1T0llU3ZMVHAvd1piWWRqeGJCR01CTlFsYkxpaGYrSU1Hdis4UjFkODZ6?=
 =?utf-8?B?YzVVeW5DZWRiaVJYMzhYYk0ySFg4cFFrOW0vKzNjM0xFOWFnM2hBNURSMUk2?=
 =?utf-8?B?Y3l6cm1BdS9GWG1HRWo5WDQrREdXUHoxZ2tObEVWRWlxcDBzVFZ5WkJ0djY2?=
 =?utf-8?B?N1NJb3R4VHcrc29iOUg0TkNQYWxTbHUwTWhON012Ymk0dFNTcjRpaC9yNFJI?=
 =?utf-8?B?dk9JM3lCekxHQmxaS3hoK0RmajB5ZmpDdkRaL2tWOFdueW1VTG9XdFVFWXVO?=
 =?utf-8?B?RHlBS0tFUnl3REN3OUhrVlk2THhLdURZdUxHOEd0YXd5NHZ0RVF3NGxlWVFO?=
 =?utf-8?B?ZE0xSFhvd2JaR3E1RVBUaEhrZHVBU3NCMnNMV0xiOTROQ0QyZiswSmVNblRM?=
 =?utf-8?Q?ImsrpHaLS10sdUnCdGSCXr/xO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec40b563-dabd-4c86-69a4-08db732e4aed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:38:06.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPP+I2XD6w4mDPu2JM9yst/Q9FNgnsTVJNLC7E9wgaLXODEEBI0YWNRtthFlymc4mIYx3OJ1Nsv9X1cIYp9PHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4504
X-Mailman-Approved-At: Fri, 23 Jun 2023 10:35:05 +1000
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
Cc: linux-integrity@vger.kernel.org, jarkko@kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>> for once, to make this easily accessible to everyone.
>>
>> As Linus will likely release 6.4 on this or the following Sunday a quick
>> question: is there any hope this regression might be fixed any time
>> soon?
> No.
>
> I have added the author of the commit to Cc, maybe they can help?
>
> The immediate question is, is it expected for chip->ops to be NULL in
> this path? Obviously on actual AMD systems that isn't the case,
> otherwise the code would crash there. But is the fact that chip->ops is
> NULL a bug in the ibmvtpm driver, or a possibility that has been
> overlooked by the checking code.
>
> cheers

All that code assumes that the TPM is still functional which
seems not to be the case for your TPM.

This should fix it:

diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
index 5be91591cb3b..7082b031741e 100644
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct tpm_chip 
*chip)
         u64 version;
         int ret;

+       if (!chip->ops)
+               return false;
+
         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
                 return false;

>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot poke
>>
>> On 15.06.23 06:57, Sachin Sant wrote:
>>>>> [ 34.381788] Code: 5463063e 408201c8 38210080 4e800020 60000000 60000000 60000000 7c0802a6 fbe10078 7c7f1b78 f8010090 e9230728 <e9890050> 2c2c0000 41820020 7d8903a6
>>>>   2c:   28 07 23 e9     ld      r9,1832(r3)
>>>>   30:   50 00 89 e9     ld      r12,80(r9)
>>>>
>>>> Where r3 is *chip.
>>>> r9 is NULL, and 80 = 0x50.
>>>>
>>>> Looks like a NULL chip->ops, which oopses in:
>>>>
>>>> static int tpm_request_locality(struct tpm_chip *chip)
>>>> {
>>>> int rc;
>>>>
>>>> if (!chip->ops->request_locality)
>>>>
>>>>
>>>> Can you test the patch below?
>>>>
>>> It proceeds further but then run into following crash
>>>
>>> [  103.269574] Kernel attempted to read user page (18) - exploit attempt? (uid: 0)
>>> [  103.269589] BUG: Kernel NULL pointer dereference on read at 0x00000018
>>> [  103.269595] Faulting instruction address: 0xc0000000009dcf34
>>> [  103.269599] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [  103.269602] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>> [  103.269606] Modules linked in: dm_mod(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E) sunrpc(E) nf_tables(E) nfnetlink(E) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
>>> [  103.269644] CPU: 18 PID: 6872 Comm: kexec Kdump: loaded Tainted: G            E      6.4.0-rc6-dirty #8
>>> [  103.269649] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
>>> [  103.269653] NIP:  c0000000009dcf34 LR: c0000000009dd2bc CTR: c0000000009eaa60
>>> [  103.269656] REGS: c0000000a113f510 TRAP: 0300   Tainted: G            E       (6.4.0-rc6-dirty)
>>> [  103.269660] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88484886  XER: 00000001
>>> [  103.269669] CFAR: c0000000009dd2b8 DAR: 0000000000000018 DSISR: 40000000 IRQMASK: 0  [  103.269669] GPR00: c0000000009dd2bc c0000000a113f7b0 c0000000014a1500 c000000090310000  [  103.269669] GPR04: c00000009f770000 0000000000000016 0000060000007a01 0000000000000016  [  103.269669] GPR08: c00000009f770000 0000000000000000 0000000000000000 0000000000008000  [  103.269669] GPR12: c0000000009eaa60 c00000135fab7f00 0000000000000000 0000000000000000  [  103.269669] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000  [  103.269669] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000  [  103.269669] GPR24: 0000000000000000 0000000000000016 c000000090310000 0000000000001000  [  103.269669] GPR28: c00000009f770000 000000007a010000 c00000009f770000 c000000090310000  [  103.269707] NIP [c0000000009dcf34] tpm_try_transmit+0x74/0x300
>>> [  103.269713] LR [c0000000009dd2bc] tpm_transmit+0xfc/0x190
>>> [  103.269717] Call Trace:
>>> [  103.269718] [c0000000a113f7b0] [c0000000a113f880] 0xc0000000a113f880 (unreliable)
>>> [  103.269724] [c0000000a113f840] [c0000000009dd2bc] tpm_transmit+0xfc/0x190
>>> [  103.269727] [c0000000a113f900] [c0000000009dd398] tpm_transmit_cmd+0x48/0x110
>>> [  103.269731] [c0000000a113f980] [c0000000009df1b0] tpm2_get_tpm_pt+0x140/0x230
>>> [  103.269736] [c0000000a113fa20] [c0000000009db208] tpm_amd_is_rng_defective+0xb8/0x250
>>> [  103.269739] [c0000000a113faa0] [c0000000009db828] tpm_chip_unregister+0x138/0x160
>>> [  103.269743] [c0000000a113fae0] [c0000000009eaa94] tpm_ibmvtpm_remove+0x34/0x130
>>> [  103.269748] [c0000000a113fb50] [c000000000115738] vio_bus_remove+0x58/0xd0
>>> [  103.269754] [c0000000a113fb90] [c000000000a01dcc] device_shutdown+0x21c/0x39c
>>> [  103.269758] [c0000000a113fc20] [c0000000001a2684] kernel_restart_prepare+0x54/0x70
>>> [  103.269762] [c0000000a113fc40] [c000000000292c48] kernel_kexec+0xa8/0x100
>>> [  103.269766] [c0000000a113fcb0] [c0000000001a2cd4] __do_sys_reboot+0x214/0x2c0
>>> [  103.269770] [c0000000a113fe10] [c000000000034adc] system_call_exception+0x13c/0x340
>>> [  103.269776] [c0000000a113fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>>> [  103.269781] --- interrupt: 3000 at 0x7fff805459f0
>>> [  103.269784] NIP:  00007fff805459f0 LR: 0000000000000000 CTR: 0000000000000000
>>> [  103.269786] REGS: c0000000a113fe80 TRAP: 3000   Tainted: G            E       (6.4.0-rc6-dirty)
>>> [  103.269790] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 42422884  XER: 00000000
>>> [  103.269799] IRQMASK: 0  [  103.269799] GPR00: 0000000000000058 00007fffc07a68c0 0000000110437f00 fffffffffee1dead  [  103.269799] GPR04: 0000000028121969 0000000045584543 0000000000000000 0000000000000003  [  103.269799] GPR08: 0000000000100000 0000000000000000 0000000000000000 0000000000000000  [  103.269799] GPR12: 0000000000000000 00007fff8089b2c0 000000011042f598 0000000000000000  [  103.269799] GPR16: ffffffffffffffff 0000000000000000 000000011040fcc0 0000000000000000  [  103.269799] GPR20: 0000000000008913 0000000000008914 0000000149c61020 0000000000000003  [  103.269799] GPR24: 0000000000000000 0000000000000001 0000000000000003 00007fffc07a6a40  [  103.269799] GPR28: 0000000110409f10 00007fff806419c0 0000000149c61080 0000000149c61040  [  103.269833] NIP [00007fff805459f0] 0x7fff805459f0
>>> [  103.269836] LR [0000000000000000] 0x0
>>> [  103.269838] --- interrupt: 3000
>>> [  103.269839] Code: 83a40006 2c090000 41820208 7c0802a6 79250020 7c25d840 f80100a0 41810224 fbe10088 f8410018 7c7f1b78 e9230728 <e9890018> 7d8903a6 4e800421 e8410018  [  103.269852] ---[ end trace 0000000000000000 ]—
>>>
>>> - Sachin
