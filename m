Return-Path: <linuxppc-dev+bounces-4515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 753139FE315
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 08:04:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM6XX2Q7Rz2yk6;
	Mon, 30 Dec 2024 18:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735542252;
	cv=none; b=QNptKd5R1NIeSFsdCIoHFX/lXoAsNRmkazWjhqDjOBBd/5PLNxsk9Hw0LKEbEaLAMlko9Pjzr+qe/gjmwJiDWUovQL48NRvY5A25ZZomvPeQS/GYreE2A55YHBIoI1ITyXn3YMoTrYffDHjtJ2XBWV2BVEhks3UIP52/yEjFuCFudxrcuSS4TapjV7nudS9pI70B19g+8HohEw+VGykNEtv6iQQj8nVzQLHap0n9xmvjUdAEnampxP3Nj78arplJwYuTs5FKRRgYuF3y3Q2WYfNCTlUFvRRmyB4xmfMVTkA88f76/BCMgEVS2ujm6ARMIpZSy7emsXa8UfNwO7Hnug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735542252; c=relaxed/relaxed;
	bh=xUSMbY89H5WSfPtVNMoAeMf0ZXSlFHMT/P3toWiTG7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QczKHTlabw9IScziijy08tWbwQ11fK+XS5oaBco8L7tGgSZf1bY6lz8dDy9XERIy8rozBaSsgLom0nCUvF8ivzM1+3WMquFE8dGHMunvDtoVMa9RDtJ6FTWTTa3Yyd1S6eJJHH97FVGmXCWoENQjYa4i+6FV3QtgJinUbSwO5EzUB796uHBEWDZUzrimcNVjnfQxojJAAjrrC/JbKTdYBkw75lQqpxcEZIiWw4nAOFNZS9mmd2K0uJI5gdMwaIwj1hOl/MeSurY6zEoJ+rt8W1CIZczH9MTmCwIcE6N/4+aOnzgp94VZEmZadI0U0urXFRoKbuUD+7hLt29VYIGzKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yz6kdZ7d; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yz6kdZ7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM6XV6WDzz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 18:04:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BTNbTC9025760;
	Mon, 30 Dec 2024 07:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xUSMbY89H5WSfPtVNMoAeMf0ZXSlFH
	MT/P3toWiTG7Y=; b=Yz6kdZ7d8OJnuSEXeE8/raCurL/g9unqwyaSjf9DhsbEH9
	yxcuG8VFKJwpoJp6kQMQbLXXaK1a+eG9u8/BAAsSo6j6Yhl1e6gkr78J4gqkQi2O
	q4lPShUsxxU8cjiu86arYOoVYze9qJyXD7O0kIugVuzltS1F0Dl53QWCvOCS2NBL
	NgSYvXww2KpK04SIiCITsj7WYPPWcGDZ4r3RT/8mrK0dSX7DiVNGELZ5GXfpGPlK
	lUtnmNAJyLfkPL8QwO2tRObit+heZRBX2ue2JOYR0RIvCZcX8YdebfgZx0BjlRqU
	vG8SpRSZzPq3i8MCIe6dHGKLA8/o6/99f5HgtFDA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ug8a10rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:03:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BU73wxA012671;
	Mon, 30 Dec 2024 07:03:59 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ug8a10rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:03:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU5Z8VL014022;
	Mon, 30 Dec 2024 07:03:58 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tv1xvmqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:03:58 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BU73sAE19529986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Dec 2024 07:03:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FC4B20040;
	Mon, 30 Dec 2024 07:03:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B23020043;
	Mon, 30 Dec 2024 07:03:51 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.28.22])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Dec 2024 07:03:51 +0000 (GMT)
Date: Mon, 30 Dec 2024 12:33:42 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-doc@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com
Subject: Re: [PATCH 1/6] [DOC] powerpc: Document APIv2 KVM hcall spec for
 Hostwide counters
Message-ID: <fimq6f367gj3ypuke2slogz4i3zt4jfst4kwnrlzps3xinkoh5@arkajtap562s>
References: <20241222140247.174998-1-vaibhav@linux.ibm.com>
 <20241222140247.174998-2-vaibhav@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222140247.174998-2-vaibhav@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d6aAhfS7Z7wGfRoxHAP5oyfsVoACgzBP
X-Proofpoint-ORIG-GUID: Q8_Tw7QByTCwtHvkwxcqqr37KD7uI3Yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=971 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300058
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024 at 07:32:29PM +0530, Vaibhav Jain wrote:
> Update kvm-nested APIv2 documentation to include five new
> Guest-State-Elements to fetch the hostwide counters. These counters are
> per L1-Lpar and indicate the amount of Heap/Page-table memory allocated,
> available and Page-table memory reclaimed for all L2-Guests active
> instances
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  Documentation/arch/powerpc/kvm-nested.rst | 40 ++++++++++++++++-------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentation/arch/powerpc/kvm-nested.rst
> index 5defd13cc6c1..c506192f3f98 100644
> --- a/Documentation/arch/powerpc/kvm-nested.rst
> +++ b/Documentation/arch/powerpc/kvm-nested.rst
> @@ -208,13 +208,9 @@ associated values for each ID in the GSB::
>        flags:
>           Bit 0: getGuestWideState: Request state of the Guest instead
>             of an individual VCPU.
> -         Bit 1: takeOwnershipOfVcpuState Indicate the L1 is taking
> -           over ownership of the VCPU state and that the L0 can free
> -           the storage holding the state. The VCPU state will need to
> -           be returned to the Hypervisor via H_GUEST_SET_STATE prior
> -           to H_GUEST_RUN_VCPU being called for this VCPU. The data
> -           returned in the dataBuffer is in a Hypervisor internal
> -           format.
> +         Bit 1: getHostWideState: Request stats of the Host. This causes
> +           the guestId and vcpuId parameters to be ignored and attempting
> +           to get the VCPU/Guest state will cause an error.

s/Request stats/Request state

>           Bits 2-63: Reserved
>        guestId: ID obtained from H_GUEST_CREATE
>        vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
> @@ -402,13 +398,14 @@ GSB element:
>  
>  The ID in the GSB element specifies what is to be set. This includes
>  archtected state like GPRs, VSRs, SPRs, plus also some meta data about
> -the partition like the timebase offset and partition scoped page
> +the partition and  like the timebase offset and partition scoped page
>  table information.

The statement that is already there looks correct IMO.

>  
>  +--------+-------+----+--------+----------------------------------+
> -|   ID   | Size  | RW | Thread | Details                          |
> -|        | Bytes |    | Guest  |                                  |
> -|        |       |    | Scope  |                                  |
> +|   ID   | Size  | RW |(H)ost  | Details                          |
> +|        | Bytes |    |(G)uest |                                  |
> +|        |       |    |(T)hread|                                  |
> +|        |       |    |Scope   |                                  |
>  +========+=======+====+========+==================================+
>  | 0x0000 |       | RW |   TG   | NOP element                      |
>  +--------+-------+----+--------+----------------------------------+
> @@ -434,6 +431,27 @@ table information.
>  |        |       |    |        |- 0x8 Table size.                 |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x0007-|       |    |        | Reserved                         |
> +| 0x07FF |       |    |        |                                  |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0800 | 0x08  | R  |   H    | Current usage in bytes of the    |
> +|        |       |    |        | L0's Guest Management Space      |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0801 | 0x08  | R  |   H    | Max bytes available in the       |
> +|        |       |    |        | L0's Guest Management Space      |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0802 | 0x08  | R  |   H    | Current usage in bytes of the    |
> +|        |       |    |        | L0's Guest Page Table Management |
> +|        |       |    |        | Space                            |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0803 | 0x08  | R  |   H    | Max bytes available in the L0's  |
> +|        |       |    |        | Guest Page Table Management      |
> +|        |       |    |        | Space                            |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0804 | 0x08  | R  |   H    | Amount of reclaimed L0 Guest's   |
> +|        |       |    |        | Page Table Management Space due  |
> +|        |       |    |        | to overcommit                    |

I think it would be more clear to specify "... Management space for L1
..." in the details of all above entries.

> ++--------+-------+----+--------+----------------------------------+
> +| 0x0805-|       |    |        | Reserved                         |
>  | 0x0BFF |       |    |        |                                  |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x0C00 | 0x10  | RW |   T    |Run vCPU Input Buffer:            |
> -- 

Also, the row 2 of this table mentions the 'takeOwnershipOfVcpuState' flag
which is no longer supported. You can remove that as well.

> 2.47.1
> 

