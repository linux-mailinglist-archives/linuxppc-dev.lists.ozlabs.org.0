Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7830D7B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:37:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVyn16JGnzDxWR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 21:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GKrBlr89; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVykz0xFkzDwx8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 21:35:54 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 113AWZeD186305; Wed, 3 Feb 2021 05:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r7tyUioJqvwWpCpo7enlmm91s4u6yw/r1FOBsaDHHU0=;
 b=GKrBlr89B2hXxBJ48EyhBx57GUHhLxSwgr6x3EdCdzxVUJXOj83AFmRFKjQN6Dl06Qff
 IReGejo9fSkKsfal9J1/+3Vza68Fdr7SIZaWSFERYyVX7B4x/ecsRvfEc6M/agQUmuda
 3xHsblsWHVQtK3Tt+dQhLfYzQo9Couw8+CE+oMOEeyoR0rWYPz36dxSS67M9xuoh7G+1
 wHmJlt5WXngn9oAp5WL9cFjeZ3IFHReysujbd7IwaCiC9P37bWXRt+YJGRLHmWQ5pYqx
 WUBx04a7hG7UxRHu+YRaY/H4lR2Th6mBb/sFGWTmSdPlAzeeLE8FBS/jMjraRTRUJYaS QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ft1y082y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 05:35:47 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 113AWjqT186633;
 Wed, 3 Feb 2021 05:35:46 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ft1y081q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 05:35:46 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 113AXR4h005117;
 Wed, 3 Feb 2021 10:35:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 36cy389yc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 10:35:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 113AZe2b36897074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 10:35:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E32B452057;
 Wed,  3 Feb 2021 10:35:40 +0000 (GMT)
Received: from [9.85.94.182] (unknown [9.85.94.182])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id AE6B252054;
 Wed,  3 Feb 2021 10:35:38 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <468638a9-ba77-10f4-00b8-3289e5aae3a9@linux.ibm.com>
Date: Wed, 3 Feb 2021 16:05:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_04:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030065
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

Thanks that's much cleaner! We might need something similar for
the FP load/store and update instructions where an instruction is
invalid if RA is 0. I'll send a new revision with these changes.

- Sandipan
