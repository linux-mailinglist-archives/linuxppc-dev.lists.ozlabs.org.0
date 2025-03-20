Return-Path: <linuxppc-dev+bounces-7234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A304AA6A6E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 14:14:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJQyN6rGNz303d;
	Fri, 21 Mar 2025 00:14:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742476444;
	cv=none; b=cKBSMDnEyKoqKlE/oJ31EqqGScckt+5peEqF0qGDLWZEWkeLyOwVwR6argXKrWFrGK2umtlE4PCG7JdrRT5+ieaMbvvcSpDYrt0y85XEdiaE7lGwxyMhGbReXUQ0Wwr+iLsa1RVu99+ZrlsWVvgSxQiuUhPCupsp1qrZ7qc/hfuXdGigBEcptPCcgol0YWKjJmUKN9WE8unYu0o4V2dztQG0vPLkc4Vcr6Lwd6fzv03ipxnevadpUfemehnRWtujLOHtTu+mVWnXxRJyirLxfy0r3eICI32FMhmhTuVCD2b6lC3P1sCTb2nIclr1w3RVqu9jVdPF2WnTKqoApmcl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742476444; c=relaxed/relaxed;
	bh=Po2YgksHr3V186DMdy3RPFY5+FN3Z16HLYpvoE/VpkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiQqtY7kFSGevjJYlacmOV8hqHNLQKqcem44l2Ka8l4zTz4A4hyqGFhG9+NHcmqbc+jsVez4e6DvcwMLCFoGJI2dU9b+gXu0XwKqw8P60VgRFD5uICCnM92mghdNMZfjrAmwV8OwQSuacyNdmpz9e3e4tCTf2/mJAOlzrsFC9wS63M4D00peQDkL3DuCeWZOdFwOLUnZ67A0J1hOoCrfQors9bLA1sJQ5M202A6tcXqlZdxlRQdpL1G/E/vqxdWUAlShSLuXf5BNmbS2CUEiU1t7BxgxHaVrvHEW49oBdGsDZO3tVAT4CRmBrLd3uywWu4VGVmBYmD/ub0NpK5Ag3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=blNl9jwF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=blNl9jwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJQyM6W9Dz2yS4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 00:14:03 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K3kFcB030483
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 13:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Po2Ygk
	sHr3V186DMdy3RPFY5+FN3Z16HLYpvoE/VpkU=; b=blNl9jwFVVsDq5CNFraaQu
	1nMHeEj1BIP0xZx7/fyBXIcRaUzd/M9a0FHma+36NaT4leBeN+LEXaF6VZxZzVPe
	wlLIakTmYUVsUNbWu/I3TxHpYxKUAkdhUEXf7q6AdJvEbBkZQKMD/1doZMs53+ZK
	KSJYtUOc2cRT4/ZSF3oxAxFmLZKuiwAXYTecNEeKxvjWUjjhd8ZgRnQR9+NBo9Bu
	pU+t+5/xY2hYteiPsL/OeBn1Fuxab9GGC93Oyd2itOg/ED5Agk4L8OziwevLDeiT
	Dm1wi+7g9bOVzIS68CeGaoa+CeClk3VkInR89cqhXbKdd2nFB7WIEpLBaHtaP37g
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gbd9jmu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 13:14:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52KBGP21012447
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 13:13:59 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dmvp84q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 13:13:59 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52KDDt3015270494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:13:55 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE4D75805D;
	Thu, 20 Mar 2025 13:13:55 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3780F5805C;
	Thu, 20 Mar 2025 13:13:52 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Mar 2025 13:13:51 +0000 (GMT)
Message-ID: <5411ccd9-6077-4f95-8b8b-92ab5d990d9d@linux.ibm.com>
Date: Thu, 20 Mar 2025 18:43:50 +0530
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
Subject: Re: [PATCH 0/9] Add support for configure and control of Hardware
 Trace Macro(HTM)
To: Athira Rajeev <atrajeev@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, adubey@linux.ibm.com, skb99@linux.ibm.com,
        sshegde@linux.ibm.com, riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
References: <20250314135541.1831-1-atrajeev@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250314135541.1831-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qN_RJHCiqPcH9xcxMOFj2nzX-rqR95YY
X-Proofpoint-GUID: qN_RJHCiqPcH9xcxMOFj2nzX-rqR95YY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503200080
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 14/03/25 7:25 pm, Athira Rajeev wrote:
> H_HTM (Hardware Trace Macro) hypervisor call is an HCALL to export
> data from Hardware Trace Macro (HTM) function. The debugfs interface
> to export the HTM function data in a partition currently supports only
> dumping of HTM data in an lpar. Patchset add support for configuration
> and control of HTM function via debugfs interface.
>
> With the patchset, after loading htmdump module,
> below files are present:
>
> ls /sys/kernel/debug/powerpc/htmdump/
>    coreindexonchip  htmcaps  htmconfigure  htmflags  htminfo  htmsetup
>    htmstart  htmstatus  htmtype  nodalchipindex  nodeindex  trace
>
> - nodeindex, nodalchipindex, coreindexonchip specifies which
>    partition to configure the HTM for.
> - htmtype: specifies the type of HTM. Supported target is
>    hardwareTarget.
> - trace: is to read the HTM data.
> - htmconfigure: Configure/Deconfigure the HTM. Writing 1 to
>    the file will configure the trace, writing 0 to the file
>    will do deconfigure.
> - htmstart: start/Stop the HTM. Writing 1 to the file will
>    start the tracing, writing 0 to the file will stop the tracing.
> - htmstatus: get the status of HTM. This is needed to understand
>    the HTM state after each operation.
> - htmsetup: set the HTM buffer size. Size of HTM buffer is in
>    power of 2.
> - htminfo: provides the system processor configuration details.
>    This is needed to understand the appropriate values for nodeindex,
>    nodalchipindex, coreindexonchip.
> - htmcaps : provides the HTM capabilities like minimum/maximum buffer
>    size, what kind of tracing the HTM supports etc.
> - htmflags : allows to pass flags to hcall. Currently supports
>    controlling the wrapping of HTM buffer.
>
> Example usage:
> To collect HTM traces for a partition represented by nodeindex as
> zero, nodalchipindex as 1 and coreindexonchip as 12.
>
>    # cd /sys/kernel/debug/powerpc/htmdump/
>    # echo 2 > htmtype
>    # echo 0 > nodeindex
>    # echo 1 > nodalchipindex
>    # echo 12 > coreindexonchip
>    # echo 1 > htmflags     # to set noWrap for HTM buffers
>    # echo 1 > htmconfigure # Configure the HTM
>    # echo 1 > htmstart     # Start the HTM
>    # echo 0 > htmstart     # Stop the HTM
>    # echo 0 > htmconfigure # Deconfigure the HTM
>    # cat htmstatus         # Dump the status of HTM entries as data
>
> Athira Rajeev (9):
>    powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm
>      operations
>    powerpc/pseries/htmdump: Add htm configure support to htmdump module
>    powerpc/pseries/htmdump: Add htm start support to htmdump module
>    powerpc/pseries/htmdump: Add htm status support to htmdump module
>    powerpc/pseries/htmdump: Add htm info support to htmdump module
>    powerpc/pseries/htmdump: Add htm setup support to htmdump module
>    powerpc/pseries/htmdump: Add htm flags support to htmdump module
>    powerpc/pseries/htmdump: Add htm capabilities support to htmdump
>      module
>    powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface
>
>   Documentation/arch/powerpc/htm.rst        | 104 ++++++
>   arch/powerpc/include/asm/plpar_wrappers.h |  20 +-
>   arch/powerpc/platforms/pseries/htmdump.c  | 370 +++++++++++++++++++++-
>   3 files changed, 475 insertions(+), 19 deletions(-)
>   create mode 100644 Documentation/arch/powerpc/htm.rst
>
Hello Athira,

I tried to apply this patch set on powerpc-next repo, but pacth 007 
failed. Please refer the failure below.


Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
--------------------------
Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all: a
Applying: powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate 
other htm operations
Applying: powerpc/pseries/htmdump: Add htm configure support to htmdump 
module
Applying: powerpc/pseries/htmdump: Add htm start support to htmdump module
Applying: powerpc/pseries/htmdump: Add htm status support to htmdump module
Applying: powerpc/pseries/htmdump: Add htm info support to htmdump module
Applying: powerpc/pseries/htmdump: Add htm setup support to htmdump module
Applying: powerpc/pseries/htmdump: Add htm flags support to htmdump module
error: patch failed: arch/powerpc/platforms/pseries/htmdump.c:180
error: arch/powerpc/platforms/pseries/htmdump.c: patch does not apply
Patch failed at 0007 powerpc/pseries/htmdump: Add htm flags support to 
htmdump module
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


Regards,

Venkat.


