Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019B30D6AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 10:51:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVxlN2RtzzDx2T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 20:51:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MSXzOmOv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVxjM6Gn7zDwr0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 20:49:27 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1139cruU108287; Wed, 3 Feb 2021 04:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=uRGXtADEOdnEKyknsdR/s5Ui0Ub6+tGtNyGH9+tSCsU=;
 b=MSXzOmOvRsG1WsPADx/7oM/t1twtYStHMK7jaBGF7Lz3xaSCpt3UNFRQz6g1HSyOQcdA
 7vTD3JE7GtGz6AL2O6qTmESRn7WSU6P3SVI5vdzbVW4Z8ewrzRDqEHu3ldpOHQfK0xDs
 Wb1+BMb+xK3iX7gk+0NFfo9DdEEFiSxAeH+fYYWrYcHpAa1nKm0M7fz3vmwC/x1/KW4M
 1kZkyVm2oJmJ1seD7z1nxY1zh61CSibVxVRYRWGlrsDPrsIBprt+bhbUUoAqu9InjKO0
 KYnPg4Vrt/ryWwm/UApzAk3hIn3ivNJipzqx+AGaDpSrewFuWdSM6CRg0HFdVNRUz4bG Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fs4jrnx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 04:49:20 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1139dEPn111094;
 Wed, 3 Feb 2021 04:49:20 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fs4jrnw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 04:49:19 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1139YDok022384;
 Wed, 3 Feb 2021 09:49:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 36cy389xrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 09:49:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1139nDVQ26345764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 09:49:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD562A4054;
 Wed,  3 Feb 2021 09:49:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D3EAA4060;
 Wed,  3 Feb 2021 09:49:13 +0000 (GMT)
Received: from localhost (unknown [9.85.126.65])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 09:49:12 +0000 (GMT)
Date: Wed, 3 Feb 2021 15:19:09 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
Message-ID: <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203063841.431063-1-sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_04:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030057
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
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/02/03 12:08PM, Sandipan Das wrote:
> The Power ISA says that the fixed-point load and update
> instructions must neither use R0 for the base address (RA)
> nor have the destination (RT) and the base address (RA) as
> the same register. In these cases, the instruction is
> invalid. This applies to the following instructions.
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
> 
> However, the following behaviour is observed using some
> invalid opcodes where RA = RT.
> 
> An userspace program using an invalid instruction word like
> 0xe9ce0001, i.e. "ldu r14, 0(r14)", runs and exits without
> getting terminated abruptly. The instruction performs the
> load operation but does not write the effective address to
> the base address register. 

While the processor (p8 in my test) doesn't seem to be throwing an 
exception, I don't think it is necessarily loading the value. Qemu 
throws an exception though. It's probably best to term the behavior as 
being undefined.

> Attaching an uprobe at that
> instruction's address results in emulation which writes the
> effective address to the base register. Thus, the final value
> of the base address register is different.
> 
> To remove any inconsistencies, this adds an additional check
> for the aforementioned instructions to make sure that they
> are treated as unknown by the emulation infrastructure when
> RA = 0 or RA = RT. The kernel will then fallback to executing
> the instruction on hardware.
> 
> Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
> Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
> Previous versions can be found at:
> v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-1-sandipan@linux.ibm.com/
> 
> Changes in v2:
> - Jump to unknown_opcode instead of returning -1 for invalid
>   instruction forms.
> 
> ---
>  arch/powerpc/lib/sstep.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Wouldn't it be easier to just do the below at the end? Or, am I missing something?

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index ede093e9623472..a2d726d2a5e9d1 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2980,6 +2980,10 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
        }
 #endif /* CONFIG_VSX */

+       if (GETTYPE(op->type) == LOAD && (op->type & UPDATE) &&
+                       (ra == 0 || ra == rd))
+               goto unknown_opcode;
+
        return 0;

  logical_done:


- Naveen

