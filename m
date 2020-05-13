Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8621D2072
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 22:57:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mn6z0JR3zDqcV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 06:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msc@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mn4S0RkbzDqc3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 06:55:15 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DKVcw4131455
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:55:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101ky906j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:55:11 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04DKVh5i131979
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:55:11 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101ky906c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 16:55:11 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04DKoItr009502;
 Wed, 13 May 2020 20:55:10 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3100uc3v27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 20:55:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04DKt9uM11207624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 20:55:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0C42AC05B;
 Wed, 13 May 2020 20:55:09 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BF2DAC059;
 Wed, 13 May 2020 20:55:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.148.48])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 13 May 2020 20:55:08 +0000 (GMT)
Subject: Re: [RFC PATCH 2/2] powerpc/64s: system call support for scv/rfscv
 instructions
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200430040202.1735506-1-npiggin@gmail.com>
 <20200430040202.1735506-3-npiggin@gmail.com>
From: Matheus Castanho <msc@linux.ibm.com>
Message-ID: <cc609f82-1d11-b1f9-2594-153936d7fe48@linux.ibm.com>
Date: Wed, 13 May 2020 17:55:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200430040202.1735506-3-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_09:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0
 cotscore=-2147483648 phishscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130171
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

Small comment below:

On 4/30/20 1:02 AM, Nicholas Piggin wrote:
> Add support for the scv instruction on POWER9 and later CPUs.
> 
> For now this implements the zeroth scv vector 'scv 0', as identical
> to 'sc' system calls, with the exception that lr is not preserved, and
> it is 64-bit only. There may yet be changes made to this ABI, so it's
> for testing only.
> 
> rfscv is implemented to return from scv type system calls. It can not
> be used to return from sc system calls because those are defined to
> preserve lr.
> 
> In a comparison of getpid syscall, the test program had scv taking
> about 3 more cycles in user mode (92 vs 89 for sc), due to lr handling.
> getpid syscall throughput on POWER9 is improved by 33%, mostly due to
> reducing mtmsr and mtspr.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  Documentation/powerpc/syscall64-abi.rst   |  42 ++++--

[...]

> +Return value
> +------------
> +- For the sc instruction, both a return value and a return error code are
> +  returned. cr0.SO is the return error code, and r3 is the return value or
> +  error code. When cr0.SO is clear, the syscall succeeded and r3 is the return
> +  value. When cr0.SO is set, the syscall failed and r3 is the error code that
> +  generally corresponds to errno.
> +
> +- For the scv 0 instruction, there is a return value indicates failure if it
> +  is >= -MAX_ERRNO (-4095) as an unsigned comparison, in which case it is the
> +  negated return error code. Otherwise it is the successful return value.

I believe this last paragraph is a bit confusing (didn't quite get the
unsigned comparison with negative values). So instead of cr0.SO to
indicate failure, scv returns the negated error code, and positive in
case of success?

Thanks,
Matheus Castanho
