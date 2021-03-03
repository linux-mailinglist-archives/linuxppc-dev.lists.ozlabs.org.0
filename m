Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF932CC30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 06:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drg5z4r2kz3d36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:53:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qd2PNrfe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qd2PNrfe; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drg5W1mcyz30hv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 16:53:18 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1245YeH7023665; Thu, 4 Mar 2021 00:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=stD51Cwh0PBw2jVPz+wq8+JTQ+EbuSUeug7kepXC/So=;
 b=Qd2PNrfeqIJ82upORJKhyVZ3uxJwo2ELQSq/Kn593g4Jy4GSz7Oj72mCkViV0z9vHN0p
 RLomUPNXB9Vf1btRnDen5qY4dGQJ7m7Z2EocwYSsJGjGcwu4JJJ6HISuiczXOQ/P6QQn
 kAU2uXWA3WmxMZgN2J8BaxbUzniL3tgN8IxJtK7NvBT/ceVa23y826EENpii3qHb3x+e
 jlp5wNUo6QTH05GQZliNL46aNHZLDC/cDiOTiIkA19skBSmDa2a9q94Fis9bQe3ZtZ64
 uo+mdVxQ3ZHQlO7IuLgZFGaHxhpYj/inOSFTWKmtB+Qy7Pczj6AnfLCkoaE9oT9qwCZC OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372rk4sq29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 00:52:45 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1245aKsB027231;
 Thu, 4 Mar 2021 00:52:44 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372rk4sq1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 00:52:44 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1245hAeE016194;
 Thu, 4 Mar 2021 05:52:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 37150cs7hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 05:52:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1245qPTW34734540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 05:52:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 544994C044;
 Thu,  4 Mar 2021 05:52:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D74454C04A;
 Thu,  4 Mar 2021 05:52:38 +0000 (GMT)
Received: from localhost (unknown [9.85.101.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 05:52:38 +0000 (GMT)
Date: Wed, 3 Mar 2021 14:08:36 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/uprobes: Validation for prefixed instruction
Message-ID: <20210303083836.GD1913@DESKTOP-TDPLP67.localdomain>
References: <20210304050529.59391-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304050529.59391-1-ravi.bangoria@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_01:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040023
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
Cc: oleg@redhat.com, rostedt@goodmis.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/03/04 10:35AM, Ravi Bangoria wrote:
> As per ISA 3.1, prefixed instruction should not cross 64-byte
> boundary. So don't allow Uprobe on such prefixed instruction.
> 
> There are two ways probed instruction is changed in mapped pages.
> First, when Uprobe is activated, it searches for all the relevant
> pages and replace instruction in them. In this case, if that probe
> is on the 64-byte unaligned prefixed instruction, error out
> directly. Second, when Uprobe is already active and user maps a
> relevant page via mmap(), instruction is replaced via mmap() code
> path. But because Uprobe is invalid, entire mmap() operation can
> not be stopped. In this case just print an error and continue.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
> v2: https://lore.kernel.org/r/20210204104703.273429-1-ravi.bangoria@linux.ibm.com
> v2->v3:
>   - Drop restriction for Uprobe on suffix of prefixed instruction.
>     It needs lot of code change including generic code but what
>     we get in return is not worth it.
> 
>  arch/powerpc/kernel/uprobes.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index e8a63713e655..c400971ebe70 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -41,6 +41,14 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>  	if (addr & 0x03)
>  		return -EINVAL;
>  
> +	if (!IS_ENABLED(CONFIG_PPC64) || !cpu_has_feature(CPU_FTR_ARCH_31))
> +		return 0;

Sorry, I missed this last time, but I think we can drop the above 
checks. ppc_inst_prefixed() already factors in the dependency on 
CONFIG_PPC64, and I don't think we need to confirm if we're running on a 
ISA V3.1 for the below check.

With that:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

> +
> +	if (ppc_inst_prefixed(auprobe->insn) && (addr & 0x3F) == 0x3C) {
> +		pr_info_ratelimited("Cannot register a uprobe on 64 byte unaligned prefixed instruction\n");
> +		return -EINVAL;
> +	}
> +

- Naveen
