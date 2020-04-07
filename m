Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 485001A088C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 09:43:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xKCp55xczDr6q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 17:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xKB26kSszDq72
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 17:42:18 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0377XnEJ086213
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 03:42:16 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 306kuw816e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 03:42:16 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 7 Apr 2020 08:41:47 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 08:41:45 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0377f60448169468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 07:41:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62DFD42042;
 Tue,  7 Apr 2020 07:42:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 249A842041;
 Tue,  7 Apr 2020 07:42:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.51.145])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 07:42:09 +0000 (GMT)
Subject: Re: [PATCH v5 07/21] powerpc: Use a function for byte swapping
 instructions
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 07 Apr 2020 13:12:09 +0530
In-Reply-To: <20200406080936.7180-8-jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-8-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20040707-0020-0000-0000-000003C32465
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040707-0021-0000-0000-0000221BE113
Message-Id: <d6dd4d8ae30b7e10e0a7ca6687a10d902014069e.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 mlxlogscore=974 clxscore=1015 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070059
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
Cc: alistair@popple.id.au, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> Use a function for byte swapping instructions in preparation of a more
> complicated instruction type.

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>

> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/inst.h | 5 +++++
>  arch/powerpc/kernel/align.c     | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h
> index 15f570bef936..78eb1481f1f6 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -18,4 +18,9 @@ static inline int ppc_inst_opcode(u32 x)
>  	return x >> 26;
>  }
>  
> +static inline u32 ppc_inst_swab(u32 x)
> +{
> +	return ppc_inst(swab32(ppc_inst_val(x)));
> +}
> +
>  #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index a83d32c6513d..46870cf6a6dc 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -310,7 +310,7 @@ int fix_alignment(struct pt_regs *regs)
>  		/* We don't handle PPC little-endian any more... */
>  		if (cpu_has_feature(CPU_FTR_PPC_LE))
>  			return -EIO;
> -		instr = swab32(instr);
> +		instr = ppc_inst_swab(instr);
>  	}
>  
>  #ifdef CONFIG_SPE

