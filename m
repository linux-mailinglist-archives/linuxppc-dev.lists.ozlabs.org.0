Return-Path: <linuxppc-dev+bounces-7309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F1A6D90D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 12:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLrJc1S7Tz2ySM;
	Mon, 24 Mar 2025 22:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742815392;
	cv=none; b=RJfCRRdKrFlRYPUzAdxhdNne9zOX1FqzRDGcw57hrK+5fonB9e/uK/36gg6fc6KmI7cAiCRxgcSytf8F3Wn10gFrD7MiRKWCA492lq1qvucQU2mAF8U2bNRmVMBjWPLbIcjVOHUWc41Hl9QPGvEOsCMQe9P+eKSzjQXsSLxanHIK/CIOxYlTb07olohHnzFCs4BGbOhPFMZ3aWronh3o+PSku/nexzVwWBb8rrGgUmStbwhCuTkjcuv3s5sy+YbQJBr4qWf4Mrrv3psH+wW0BPsAU1KPcd9phpEFA8YmV1YiWu8BTVRWmK6ntWZxMmjY8YZQjLng6J96QTWE5em7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742815392; c=relaxed/relaxed;
	bh=SmIJCrdnZiS9LyBNRIEFDLuIdNMTPIBs0oBYhF22FcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAFQfce5mt5ZY19iKrbyq2WnNfEuKtIUvtzlkxXpAw6K2di4SesVytPto+XMbkdpqCOl8bvcj7eQSb9owe4xkcNDSK0Is84h2Q30jHkzRb96JXkkOznG5yHIChz3a08TCV2DtWd9EtKbwgbvQqw3W+npA/a9qjv1k/KEHh+MniC3i4so15YwH89EUsR9eXvhj3yuV2Xn6hn1krvqyUaa7mkcxr7btdbBxvytducQvg1U+0MyusJitvzlGHLBznrHfimWN+PcunrkkPn/6MQ12WxZxUPFV4bCnOW5vQp8phFWZrk5aVtqJgjo/LyNPPcDOlZwSTqhSkyRh5b3k2yGVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jAWZYXNS; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jAWZYXNS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLrJZ71xWz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 22:23:10 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9HRdp030463
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 11:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SmIJCr
	dnZiS9LyBNRIEFDLuIdNMTPIBs0oBYhF22FcM=; b=jAWZYXNS0yrXfTsQAnSQET
	2qa1WAQ5f5ogQZ0exymjetEvSgI9GXE2r5oGgavnvMNPVO3gRh39cXOxtAmN39pl
	G4QHXSjm6PGKUJ/SMExW+aLzLQCeOo0Gif9OBHo+uc2m84tyzTNTwqLEhKXQWA8f
	qlSnQ+6F8ASKmi+d9/uL+M6APaP5snndnZ/v/YHE3NpyBUmoY1iHvwtGtFz/1QCe
	W4j7Q7XLX0sMlDB66GcPySHIP4CGVZ6Yr5hiVR1TB7BxVddvYhq5a8BwO2FsS+y6
	kWkvR/Bh9yx4lGNZAesZZLauvTfbche35yHLVaDJn3z2HBzASJ4SMTdT1c+HCGug
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jpfwumge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 11:23:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52O7rTJG019995
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 11:23:01 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j8hnnxym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 11:23:01 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52OBLhK430081560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Mar 2025 11:21:44 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5BA05805A;
	Mon, 24 Mar 2025 11:21:43 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53D7658056;
	Mon, 24 Mar 2025 11:21:40 +0000 (GMT)
Received: from [9.61.251.240] (unknown [9.61.251.240])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Mar 2025 11:21:40 +0000 (GMT)
Message-ID: <011428fb-b04f-45b0-89a4-4593f64df8f9@linux.ibm.com>
Date: Mon, 24 Mar 2025 16:51:38 +0530
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
Subject: Re: [PATCH V2 0/9] Add support for configure and control of Hardware
 Trace Macro(HTM)
To: Athira Rajeev <atrajeev@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, adubey@linux.ibm.com, skb99@linux.ibm.com,
        sshegde@linux.ibm.com, riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com
References: <20250321072152.7414-1-atrajeev@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250321072152.7414-1-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zc2uZL7N8HKFtTyuEzg7x0Dwl4WiixOQ
X-Proofpoint-GUID: zc2uZL7N8HKFtTyuEzg7x0Dwl4WiixOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503240079
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 21/03/25 12:51 pm, Athira Rajeev wrote:
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
> Changelog:
> V2: Venkat reported that patch 7 failed to apply on powerpc-next.
> Fixed that in V2.
V2 pacth series applies cleanly on powerpc-next repo. Issue found with 
V1 is fixed.
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
Applied the patches and verified all that functionalities are working as 
expected.

Corss verified with the phyp data, and it matches.

For the series please add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


