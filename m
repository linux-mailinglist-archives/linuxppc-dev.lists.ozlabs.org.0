Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AC2FFD20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 08:12:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMVp534gqzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 18:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fbrAU9I3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMVl73QbkzDrYf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 18:10:11 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10M715pU183970; Fri, 22 Jan 2021 02:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=o/Wi46Po8EfNgxhLKSPEVTnztyUcvwRvBp4pLrJtSsI=;
 b=fbrAU9I36skKK69tLgSehPLp0cIq+ymrHYDiopfg4QuzVzCc9zVAPKrimHt0byC9qP3f
 qOSepHGy3DfZxmvqb8r03bqLuPcI7vG8doxmeo8wk1xm2R9/5lZG9NT9VBl0824IcWYA
 ljycig5itadGt+bKNBkO72v8LSXWNMuFjt5t/Q/4CMjmACTH1VAp/NHfj7Txw9WE7Vha
 +c2f02M1+/6D/vaBPAMVF20JVwVWrctoKAH+TzxbJXPPBG0u/JcrGIboAx+p79p0wPRr
 ZERdCa7+IBP0I5Qrmyf3MCi3FMjCQOEIJGpRuZUfw23Tz0xmwmEsIZEhrdvBsrD8UuxJ Aw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367q7vc70c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 02:10:04 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10M73tFM001800;
 Fri, 22 Jan 2021 07:10:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 367k12ga8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 07:10:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10M79r5r34537938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 07:09:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B701F11C050;
 Fri, 22 Jan 2021 07:09:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94D7A11C04C;
 Fri, 22 Jan 2021 07:09:57 +0000 (GMT)
Received: from [9.85.113.47] (unknown [9.85.113.47])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jan 2021 07:09:56 +0000 (GMT)
Subject: Re: [PATCH] lib/sstep: Fix incorrect return from analyze_instr()
To: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
References: <161124771457.333703.14641179082577500423.stgit@thinktux.local>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <9da75a52-7ec9-dd19-eeae-91c172385a92@linux.ibm.com>
Date: Fri, 22 Jan 2021 12:39:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161124771457.333703.14641179082577500423.stgit@thinktux.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_02:2021-01-21,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220034
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
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, paulus@samba.org,
 ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 21/01/21 10:18 pm, Ananth N Mavinakayanahalli wrote:
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
> 

Thanks for fixing this.

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
