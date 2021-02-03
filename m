Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BB30D8FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:43:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW0DY4nrdzDwwf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 22:43:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UaGjwigw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW06Q5z8DzDwqw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:37:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 113BVvWm084245; Wed, 3 Feb 2021 06:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vaCdCcQNFOj2AagB74kS9GwSa0Xl5q4zO9Kt6H1vfjM=;
 b=UaGjwigwMPlVxlkmtF30jT5hKTeQKwb7LGX1NenO2l5tJqVmdEpDTPGpuU1IxAJas2Dk
 vW1XyssfO8lmEY3Knbn82rrz9LvtLeKn8s4QJNTLmwUFqzrjCmN4r0JGugHZDSYSoUbp
 1YgpuJaZkYPEN+HEfJUwiK8FePlnmx3tDwQFIHm7135UDY9jHHkIz67KM+rh7XHf8IW9
 COpxOVd0NkMSWZoH5X4nxCJa7gjzDG/dteFmO7mOMHx/WZ2SDTzOnF45veuI6SNoTlbI
 kq/MiVzkctewsewIfmy2RYyWV/liXnuWNP0w/YwvZPjjXYIbeRKqVzUr0mEC1tN7dIgy 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ftf8sbuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:37:47 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 113BX6Z2091073;
 Wed, 3 Feb 2021 06:37:47 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ftf8sbtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:37:46 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 113BWaLP021835;
 Wed, 3 Feb 2021 11:37:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 36er8y9mpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 11:37:44 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 113BbW7U34472334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 11:37:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FF895204F;
 Wed,  3 Feb 2021 11:37:41 +0000 (GMT)
Received: from [9.85.94.182] (unknown [9.85.94.182])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D96835204E;
 Wed,  3 Feb 2021 11:37:39 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <8e675de3-51df-0711-c90c-f450a1585f65@linux.ibm.com>
Date: Wed, 3 Feb 2021 17:07:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_04:2021-02-03,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030069
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


On 03/02/21 3:19 pm, Naveen N. Rao wrote:
> [...]
> 
> Wouldn't it be easier to just do the below at the end? Or, am I missing something?
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index ede093e9623472..a2d726d2a5e9d1 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -2980,6 +2980,10 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>         }
>  #endif /* CONFIG_VSX */
> 
> +       if (GETTYPE(op->type) == LOAD && (op->type & UPDATE) &&
> +                       (ra == 0 || ra == rd))
> +               goto unknown_opcode;
> +
>         return 0;
> 
>   logical_done:
> 

This looks good?

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index e96cff845ef7..a9c149bfd2f5 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3017,6 +3017,21 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 
        }
 
+       if (op->type & UPDATE) {
+               if (ra == rd && GETTYPE(op->type) == LOAD)
+                       goto unknown_opcode;
+               else if (ra == 0)
+                       switch(GETTYPE(op->type)) {
+                       case LOAD:
+                       case STORE:
+#ifdef CONFIG_PPC_FPU
+                       case LOAD_FP:
+                       case STORE_FP:
+#endif
+                               goto unknown_opcode;
+                       }
+       }
+
 #ifdef CONFIG_VSX
        if ((GETTYPE(op->type) == LOAD_VSX ||
             GETTYPE(op->type) == STORE_VSX) &&


- Sandipan
