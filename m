Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D230ED43
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 08:25:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWVSp43d2zDwhX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 18:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b/7eEy+m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWVR61WtjzDwhH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 18:24:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11476I2t169485; Thu, 4 Feb 2021 02:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zbTtPV8YZ6E50Gf/gblK2W+c7FRYO2MNGiwlJyx7TAI=;
 b=b/7eEy+mFzjruw8yHaJBtHga8bgi2eadWGxw9ZGwt7UjHlBtKfekh3v1d0SfB7wWWgd2
 k7baB6LLcfH8NSJSZ6f+LBTBl6A0xe9azDw9c99+DFZFDMMVCQR0hKI/9FvUfQ1vPWYo
 xURf4G3+nc8L721gPwBT/KIvG9Lv5QsgcMCXRWXzaDy60Aq2hpGF+stzhVJrGX8dN+9Y
 Dg9szwCJjeLrKwT7Sqb9rZ4cBeRKRULD6t6Wwz+jtMx+rw8pQ5CYLWbtHw1nnO5wgcVt
 ZfGInlSasmglgo2WxSd2dSp7S7Y3/YuDt4BS5oOT0iLwy33CZIcOwhasfyQz58E+Xp9w Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36g8u6vw3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 02:23:55 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11477dhG175706;
 Thu, 4 Feb 2021 02:23:54 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36g8u6vw2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 02:23:54 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1147I4pu017245;
 Thu, 4 Feb 2021 07:23:52 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 36g8ker31q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 07:23:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1147NnP234341224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 07:23:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 198B411C04C;
 Thu,  4 Feb 2021 07:23:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2E6111C04A;
 Thu,  4 Feb 2021 07:23:46 +0000 (GMT)
Received: from [9.199.62.53] (unknown [9.199.62.53])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 07:23:46 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc: sstep: Fix load-store and update emulation
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
References: <20210204071432.116439-1-sandipan@linux.ibm.com>
Message-ID: <8d1021ea-0082-b3fb-1b71-ff6986a1ceb7@linux.ibm.com>
Date: Thu, 4 Feb 2021 12:53:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204071432.116439-1-sandipan@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040041
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 04/02/21 12:44 pm, Sandipan Das wrote:
> The Power ISA says that the fixed-point load and update
> instructions must neither use R0 for the base address (RA)
> nor have the destination (RT) and the base address (RA) as
> the same register. Similarly, for fixed-point stores and
> floating-point loads and stores, the instruction is invalid
> when R0 is used as the base address (RA).
> 
> This is applicable to the following instructions.
>   * Load Byte and Zero with Update (lbzu)
>   * Load Byte and Zero with Update Indexed (lbzux)
>   * Load Halfword and Zero with Update (lhzu)
>   * Load Halfword and Zero with Update Indexed (lhzux)
>   * Load Halfword Algebraic with Update (lhau)
>   * Load Halfword Algebraic with Update Indexed (lhaux)
>   * Load Word and Zero with Update (lwzu)
>   * Load Word and Zero with Update Indexed (lwzux)
>   * Load Word Algebraic with Update Indexed (lwaux)
>   * Load Doubleword with Update (ldu)
>   * Load Doubleword with Update Indexed (ldux)
>   * Load Floating Single with Update (lfsu)
>   * Load Floating Single with Update Indexed (lfsux)
>   * Load Floating Double with Update (lfdu)
>   * Load Floating Double with Update Indexed (lfdux)
>   * Store Byte with Update (stbu)
>   * Store Byte with Update Indexed (stbux)
>   * Store Halfword with Update (sthu)
>   * Store Halfword with Update Indexed (sthux)
>   * Store Word with Update (stwu)
>   * Store Word with Update Indexed (stwux)
>   * Store Doubleword with Update (stdu)
>   * Store Doubleword with Update Indexed (stdux)
>   * Store Floating Single with Update (stfsu)
>   * Store Floating Single with Update Indexed (stfsux)
>   * Store Floating Double with Update (stfdu)
>   * Store Floating Double with Update Indexed (stfdux)
> 
> E.g. the following behaviour is observed for an invalid
> load and update instruction having RA = RT.
> 
> While an userspace program having an instruction word like
> 0xe9ce0001, i.e. ldu r14, 0(r14), runs without getting
> receiving a SIGILL on a Power system (observed on P8 and
> P9), the outcome of executing that instruction word varies
> and its behaviour can be considered to be undefined.
> 
> Attaching an uprobe at that instruction's address results
> in emulation which currently performs the load as well as
> writes the effective address back to the base register.
> This might not match the outcome from hardware.
> 
> To remove any inconsistencies, this adds additional checks
> for the aforementioned instructions to make sure that the
> emulation infrastructure treats them as unknown. The kernel
> can then fallback to executing such instructions on hardware.
> 
> Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
> Previous versions can be found at:
> v2: https://lore.kernel.org/linuxppc-dev/20210203063841.431063-1-sandipan@linux.ibm.com/
> v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-1-sandipan@linux.ibm.com/
> 
> Changes in v3:
> - Dropped CONFIG_PPC_FPU check as suggested by Michael.
> - Consolidated the checks as suggested by Naveen.

Sorry. Missed these in the changelog:
- Consolidated load/store changes into a single patch.
- Included floating-point load/store and update instructions.


- Sandipan
