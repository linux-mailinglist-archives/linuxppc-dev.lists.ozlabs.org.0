Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535C11A86C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 11:00:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xsqw5G7tzDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 21:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=daniel@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xmqz0PNvzDqkG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 17:15:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBB6CAGf110389
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 01:15:00 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wsqc20bd7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 01:15:00 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <daniel@linux.ibm.com>;
 Wed, 11 Dec 2019 06:14:58 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Dec 2019 06:14:55 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBB6EsMb50200748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 06:14:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 109624C04A;
 Wed, 11 Dec 2019 06:14:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B473A4C040;
 Wed, 11 Dec 2019 06:14:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 06:14:53 +0000 (GMT)
Received: from volution.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2BC8CA0131;
 Wed, 11 Dec 2019 17:14:51 +1100 (AEDT)
Date: Wed, 11 Dec 2019 17:14:50 +1100
From: Daniel Black <daniel@linux.ibm.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] powerpc/fault: kernel can extend a user process's stack
In-Reply-To: <20191211014337.28128-1-dja@axtens.net>
References: <20191211014337.28128-1-dja@axtens.net>
Organization: IBM
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19121106-0028-0000-0000-000003C76D5C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121106-0029-0000-0000-0000248AA004
Message-Id: <20191211171450.5263d41a@volution.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_08:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 mlxscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110054
X-Mailman-Approved-At: Wed, 11 Dec 2019 20:58:22 +1100
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
Cc: Tom Lane <tgl@sss.pgh.pa.us>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Dec 2019 12:43:37 +1100
Daniel Axtens <dja@axtens.net> wrote:

> If a process page-faults trying to write beyond the end of its
> stack, we attempt to grow the stack.
> 
> However, if the kernel attempts to write beyond the end of a
> process's stack, it takes a bad fault. This can occur when the
> kernel is trying to set up a signal frame.
> 
> Permit the kernel to grow a process's stack. The same general
> limits as to how and when the stack can be grown apply: the kernel
> code still passes through expand_stack(), so anything that goes
> beyond e.g. the rlimit should still be blocked.


Thanks Daniel.

Looks good from a function perspective.

danielgb@ozrom2:~$ gcc -g -Wall -O stactest.c 
danielgb@ozrom2:~$ ./a.out 1240000 &
[1] 4223
danielgb@ozrom2:~$ cat /proc/$(pidof a.out)/maps | grep stack
^[[3~7ffff14d0000-7ffff1600000 rw-p 00000000 00:00 0                          [stack]
danielgb@ozrom2:~$  kill -USR1 %1
danielgb@ozrom2:~$ signal delivered, stack base 0x7ffff1600000 top 0x7ffff14d1427 (1240025 used)

[1]+  Done                    ./a.out 1240000
danielgb@ozrom2:~$  ./a.out 1241000 &
[1] 4227
danielgb@ozrom2:~$ kill -USR1 %1
danielgb@ozrom2:~$ signal delivered, stack base 0x7fffff630000 top 0x7fffff501057 (1241001 used)

[1]+  Done                    ./a.out 1241000
danielgb@ozrom2:~$ uname -a
Linux ozrom2 5.5.0-rc1-00001-g83ab444248c1 #1 SMP Wed Dec 11 17:01:50 AEDT 2019 ppc64le ppc64le ppc64le GNU/Linux

Tested-by: Daniel Black <daniel@linux.ibm.com>

> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205183
> Reported-by: Tom Lane <tgl@sss.pgh.pa.us>
> Cc: Daniel Black <daniel@linux.ibm.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  arch/powerpc/mm/fault.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index b5047f9b5dec..00183731ea22 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -287,7 +287,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>  			if (!res)
>  				return !store_updates_sp(inst);
>  			*must_retry = true;
> +		} else if ((flags & FAULT_FLAG_WRITE) &&
> +			   !(flags & FAULT_FLAG_USER)) {
> +			/*
> +			 * the kernel can also attempt to write beyond the end
> +			 * of a process's stack - for example setting up a
> +			 * signal frame. We assume this is valid, subject to
> +			 * the checks in expand_stack() later.
> +			 */
> +			return false;
>  		}
> +
>  		return true;
>  	}
>  	return false;

