Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B14112FFCB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 07:29:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMTqs56HGzDr8g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 17:29:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LqHCfYwl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMTp50MQgzDq7t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 17:27:40 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10M64BH3139323; Fri, 22 Jan 2021 01:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=mrIMMXJOuLRakOQNjp08/x8vEzPoOJLi2V2YRrH4/UE=;
 b=LqHCfYwlxbmUtGZ0z4NelvUQ62UUD4Lqg9tHCi981CrT80tbBLPurXMFUPPE9iAmxrHP
 BG4tdIETvINiHQe2RXuy4to8E17UI0UVllEbwG+j/sA614BiAPttxkFdSS7uNt70C13K
 wpk49MxLyoTiVZjTDPF768PMVxUJCFvnCOWuQRT9eYgwa+RrcLf3EJi+HzmN/g04TRRL
 mbgH6nd41o/0IbWWealJf9g84UFkiO1jw3p4ld+P2Li06V9uL8+jyFtz2AmkhXeN0lHj
 tHG53EZuUuCch5v3zEla54L7TPGe+r3vZjsC2VvtM0zlW/1D2reiBWdU9agrzPLNH3BD 7w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367qx7a56g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 01:27:34 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10M6EEOs007738;
 Fri, 22 Jan 2021 06:27:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 367k10g4rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 06:27:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10M6RTrW39649726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 06:27:30 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7B5BAE04D;
 Fri, 22 Jan 2021 06:27:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05D8AAE045;
 Fri, 22 Jan 2021 06:27:29 +0000 (GMT)
Received: from localhost (unknown [9.102.22.219])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jan 2021 06:27:28 +0000 (GMT)
Date: Fri, 22 Jan 2021 11:57:25 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Subject: Re: [PATCH] lib/sstep: Fix incorrect return from analyze_instr()
Message-ID: <20210122062725.GD9569@DESKTOP-TDPLP67.localdomain>
References: <161124771457.333703.14641179082577500423.stgit@thinktux.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161124771457.333703.14641179082577500423.stgit@thinktux.local>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_02:2021-01-21,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=976 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220032
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
Cc: ravi.bangoria@linux.ibm.com, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/01/21 10:18PM, Ananth N Mavinakayanahalli wrote:
> We currently just percolate the return value from analyze_instr()
> to the caller of emulate_step(), especially if it is a -1.
> 
> For one particular case (opcode = 4) for instructions that
> aren't currently emulated, we are returning 'should not be
> single-stepped' while we should have returned 0 which says
> 'did not emulate, may have to single-step'.
> 
> Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
> Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c |   49 +++++++++++++++++++++++++---------------------
>  1 file changed, 27 insertions(+), 22 deletions(-)

Fixes: 930d6288a26787 ("powerpc: sstep: Add support for maddhd, maddhdu, maddld instructions")
Reviewed-by: Naveen N. Rao < naveen.n.rao@linux.vnet.ibm.com>

- Naveen

