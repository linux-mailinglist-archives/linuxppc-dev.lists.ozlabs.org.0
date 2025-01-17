Return-Path: <linuxppc-dev+bounces-5363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AF8A152F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 16:38:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZP610dZ9z30fK;
	Sat, 18 Jan 2025 02:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737128329;
	cv=none; b=FTwMlZiRGIiJrFJwwvIeS0K6tix/r4OrvQitIQNdVqJ9HmIPVfJWa9yOvXfyt/chYRnWIQwAbXTIBJNR/Atn1jwbKLC0Y7NGvi9otwmu20XImbuZLXkyW1pnhTPjop6EXmcITatQlhqd4vM8z15KqKOKdco0zQmFJh2b+yRGel2O/kzWcK8FJ4YcBxiZEBiv7+7I/9lffEskTm/UzqwnX9YvaK2l2RkdOgNMIChwpvAav7xLr6zwqXCz/fGTxVKKrnEQ0ky4d8JY7QGsF7lnG4DNDYfiql0K+VVor11aPb0sIpBs4Y/YhOsWYh3soe0G87bSSYR0CBjvgcF5CjUm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737128329; c=relaxed/relaxed;
	bh=ZqZi/+qOvKvRD2F60tKo/w7+dG7N/baAsUvvd45l5A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mm+IO4zNMvY7EACbC7gsbDVSoMVAsRWDaJP0zxcgT7ViIqVMmBo9ito1ucc7wX5sIjAzsqAZ+nnAyMPR+b3mBE9yooPDP13rhtis4puvbctcQ/AeVzJUNdNaQaGiLuRKgUTcw1sDzgZuDo8hkRSTJRAWem09pdc9pDiKu7pdFftyeUVetF99LZ9UsaXl12vKeiqLcumwBCMIMHohVHZyKtDJ3rj1dvhAQs241EQh5Rmk8VaUFijtteMfkh3A86+MzvMHslbijqQ//huVE7cUtXcaNmdfWYOPWJbYQpa60W0fa3hoJ5m+uhVrjGdSR3LaBsjx5TU0TRgsEb6h58519Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eSqlPpGI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eSqlPpGI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZP600HDXz30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 02:38:47 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HBbQHJ010213;
	Fri, 17 Jan 2025 15:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ZqZi/+qOvKvRD2F60tKo/w7+dG7N/b
	aAsUvvd45l5A8=; b=eSqlPpGIJqjO5fJ1t1GTfmocUQxEezYDOXDGpvcuNtjd5w
	uu2KcokVtWV7wJYWHOvEOOwck+96WRpFSy7ERJet2vhGjWLhfgbXLlcRliVytjvL
	ZhU7jAVuwpNXKcGzjVBa8+DQe7ZiNNs7NTjZ0i8bVL4NhdBiEncPYVeUCKjNiXKY
	Sxqqkow4ijinUXfqXnVDIFNeS4ra+dLwNYx/uE70htWCzjr8VdT4/kpjRsVYzeCB
	phepN08IFmb9hXTyf2ZiK8PDhvMlimmmL3kuBC+a+iBD5o/TI2VXG/Lv73FK+nLX
	6JKVL6ZycI3zn/nKCIC39USZ2bHeJ7z+e4r4wJZQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 447c8jbrb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 15:38:37 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50HFWCBd029891;
	Fri, 17 Jan 2025 15:38:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 447c8jbrax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 15:38:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50HEoe54007519;
	Fri, 17 Jan 2025 15:38:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443ynkgmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 15:38:36 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50HFcWqx32899790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:38:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 168502004B;
	Fri, 17 Jan 2025 15:38:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1178B20040;
	Fri, 17 Jan 2025 15:38:27 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.124.211.105])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 17 Jan 2025 15:38:26 +0000 (GMT)
Date: Fri, 17 Jan 2025 21:08:21 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] powerpc: Document APIv2 KVM hcall spec for
 Hostwide counters
Message-ID: <6iwl3xbqdo52measqi3i3lofnyqrb7xxu32ilzkqrhoe4u5cb4@mvba3u6xejgo>
References: <20250115143948.369379-1-vaibhav@linux.ibm.com>
 <20250115143948.369379-2-vaibhav@linux.ibm.com>
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
In-Reply-To: <20250115143948.369379-2-vaibhav@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EbjF8vYTi_uy3d6gqXQ_6e74lThexosK
X-Proofpoint-ORIG-GUID: 5hd36WOsQFjx6bw_vid3prNnBydZ0dcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170122
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 15, 2025 at 08:09:42PM +0530, Vaibhav Jain wrote:
> Update kvm-nested APIv2 documentation to include five new
> Guest-State-Elements to fetch the hostwide counters. These counters are
> per L1-Lpar and indicate the amount of Heap/Page-table memory allocated,
> available and Page-table memory reclaimed for all L2-Guests active
> instances
> 
> Cc: linux-doc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> 
> ---
> Changelog
> 
> v1->v2:
> * Reworded section on GSID [Gautam]
> ---
>  Documentation/arch/powerpc/kvm-nested.rst | 40 +++++++++++++++++------
>  1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentation/arch/powerpc/kvm-nested.rst
> index 5defd13cc6c1..8e468a4db0dc 100644
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
>           Bits 2-63: Reserved
>        guestId: ID obtained from H_GUEST_CREATE
>        vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
> @@ -406,9 +402,10 @@ the partition like the timebase offset and partition scoped page
>  table information.
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
> @@ -434,6 +431,29 @@ table information.
>  |        |       |    |        |- 0x8 Table size.                 |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x0007-|       |    |        | Reserved                         |
> +| 0x07FF |       |    |        |                                  |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0800 | 0x08  | R  |   H    | Current usage in bytes of the    |
> +|        |       |    |        | L0's Guest Management Space      |
> +|        |       |    |        | for an L1-Lpar.                  |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0801 | 0x08  | R  |   H    | Max bytes available in the       |
> +|        |       |    |        | L0's Guest Management Space for  |
> +|        |       |    |        | an L1-Lpar                       |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0802 | 0x08  | R  |   H    | Current usage in bytes of the    |
> +|        |       |    |        | L0's Guest Page Table Management |
> +|        |       |    |        | Space for an L1-Lpar             |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0803 | 0x08  | R  |   H    | Max bytes available in the L0's  |
> +|        |       |    |        | Guest Page Table Management      |
> +|        |       |    |        | Space for an L1-Lpar             |
> ++--------+-------+----+--------+----------------------------------+
> +| 0x0804 | 0x08  | R  |   H    | Amount of reclaimed L0 Guest's   |
> +|        |       |    |        | Page Table Management Space due  |
> +|        |       |    |        | to overcommit for an L1-Lpar     |

Nit s/Amount of reclaimed/Space in bytes reclaimed in

> ++--------+-------+----+--------+----------------------------------+
> +| 0x0805-|       |    |        | Reserved                         |
>  | 0x0BFF |       |    |        |                                  |
>  +--------+-------+----+--------+----------------------------------+
>  | 0x0C00 | 0x10  | RW |   T    |Run vCPU Input Buffer:            |
> -- 
> 2.47.1
> 

