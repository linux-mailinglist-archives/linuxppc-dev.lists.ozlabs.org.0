Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9A2E23F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 04:15:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1Zw74tnnzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 14:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QiX9dZis; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1ZtW5pnLzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Dec 2020 14:14:27 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BO31wFi090316; Wed, 23 Dec 2020 22:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=J+i6gcZmOD8HUoz+lDJFoOvh/g8DQKNaaWL0fWsv2dk=;
 b=QiX9dZispPraRPQVUc+b0oB2TUQIi7r6UN4WYdXH6UMSS2EdgjwrItKMI+Ksu6e2KOws
 EE+pTTAhAE/CkvOHIfXrqGYq2cMa9AhMEQl+3eh+5vyliR+0kRlOUXn/uG4/hQ4zkJ6Y
 I27VZ9+wdeGTU2b6qED+9N5vncFMJ3+7cBZ/b6foFDvcQH6ic4PGIPrfQLcvVcdARcBf
 DeGQ3lHfghq4wBgTh0UDhrlSxjkXkC0rtIg4o9nijyxHG1GmkFPJhjbgBzCA/FgkkMhK
 4CFhSYU836MCNndqpF6BGbyQAuqIbNDcNDWDGExSTdqbptm7g4WlQ+0H/Xdo0sU0ffAI Zg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35mhta1a7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Dec 2020 22:14:19 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BO3DHGW012721;
 Thu, 24 Dec 2020 03:14:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 35hdgut98h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Dec 2020 03:14:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BO3EEO023527682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Dec 2020 03:14:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4ABDA404D;
 Thu, 24 Dec 2020 03:14:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A716A4040;
 Thu, 24 Dec 2020 03:14:12 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.80.236.76])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Dec 2020 03:14:12 +0000 (GMT)
Date: Wed, 23 Dec 2020 19:14:09 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Limit allocation of SWIOTLB on server machines
Message-ID: <20201224031409.GB4102@ram-ibm-com.ibm.com>
References: <20201218062103.76102-1-bauerman@linux.ibm.com>
 <20201223205838.GA4102@ram-ibm-com.ibm.com>
 <87o8ikukye.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8ikukye.fsf@manicouagan.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-23_14:2020-12-23,
 2020-12-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012240014
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 23, 2020 at 09:06:01PM -0300, Thiago Jung Bauermann wrote:
> 
> Hi Ram,
> 
> Thanks for reviewing this patch.
> 
> Ram Pai <linuxram@us.ibm.com> writes:
> 
> > On Fri, Dec 18, 2020 at 03:21:03AM -0300, Thiago Jung Bauermann wrote:
> >> On server-class POWER machines, we don't need the SWIOTLB unless we're a
> >> secure VM. Nevertheless, if CONFIG_SWIOTLB is enabled we unconditionally
> >> allocate it.
> >> 
> >> In most cases this is harmless, but on a few machine configurations (e.g.,
> >> POWER9 powernv systems with 4 GB area reserved for crashdump kernel) it can
> >> happen that memblock can't find a 64 MB chunk of memory for the SWIOTLB and
> >> fails with a scary-looking WARN_ONCE:
> >> 
> >>  ------------[ cut here ]------------
> >>  memblock: bottom-up allocation failed, memory hotremove may be affected
> >>  WARNING: CPU: 0 PID: 0 at mm/memblock.c:332 memblock_find_in_range_node+0x328/0x340
> >>  Modules linked in:
> >>  CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc2-orig+ #6
> >>  NIP:  c000000000442f38 LR: c000000000442f34 CTR: c0000000001e0080
> >>  REGS: c000000001def900 TRAP: 0700   Not tainted  (5.10.0-rc2-orig+)
> >>  MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28022222  XER: 20040000
> >>  CFAR: c00000000014b7b4 IRQMASK: 1
> >>  GPR00: c000000000442f34 c000000001defba0 c000000001deff00 0000000000000047
> >>  GPR04: 00000000ffff7fff c000000001def828 c000000001def820 0000000000000000
> >>  GPR08: 0000001ffc3e0000 c000000001b75478 c000000001b75478 0000000000000001
> >>  GPR12: 0000000000002000 c000000002030000 0000000000000000 0000000000000000
> >>  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000002030000
> >>  GPR20: 0000000000000000 0000000000010000 0000000000010000 c000000001defc10
> >>  GPR24: c000000001defc08 c000000001c91868 c000000001defc18 c000000001c91890
> >>  GPR28: 0000000000000000 ffffffffffffffff 0000000004000000 00000000ffffffff
> >>  NIP [c000000000442f38] memblock_find_in_range_node+0x328/0x340
> >>  LR [c000000000442f34] memblock_find_in_range_node+0x324/0x340
> >>  Call Trace:
> >>  [c000000001defba0] [c000000000442f34] memblock_find_in_range_node+0x324/0x340 (unreliable)
> >>  [c000000001defc90] [c0000000015ac088] memblock_alloc_range_nid+0xec/0x1b0
> >>  [c000000001defd40] [c0000000015ac1f8] memblock_alloc_internal+0xac/0x110
> >>  [c000000001defda0] [c0000000015ac4d0] memblock_alloc_try_nid+0x94/0xcc
> >>  [c000000001defe30] [c00000000159c3c8] swiotlb_init+0x78/0x104
> >>  [c000000001defea0] [c00000000158378c] mem_init+0x4c/0x98
> >>  [c000000001defec0] [c00000000157457c] start_kernel+0x714/0xac8
> >>  [c000000001deff90] [c00000000000d244] start_here_common+0x1c/0x58
> >>  Instruction dump:
> >>  2c230000 4182ffd4 ea610088 ea810090 4bfffe84 39200001 3d42fff4 3c62ff60
> >>  3863c560 992a8bfc 4bd0881d 60000000 <0fe00000> ea610088 4bfffd94 60000000
> >>  random: get_random_bytes called from __warn+0x128/0x184 with crng_init=0
> >>  ---[ end trace 0000000000000000 ]---
> >>  software IO TLB: Cannot allocate buffer
> >> 
> >> Unless this is a secure VM the message can actually be ignored, because the
> >> SWIOTLB isn't needed. Therefore, let's avoid the SWIOTLB in those cases.
> >
> > The above warn_on is conveying a genuine warning. Should it be silenced?
> 
> Not sure I understand your point. This patch doesn't silence the
> warning, it avoids the problem it is warning about.

Sorry, I should have explained it better. My point is...  

	If CONFIG_SWIOTLB is enabled, it means that the kernel is
	promising the bounce buffering capability. I know, currently we
	do not have any kernel subsystems that use bounce buffers on
	non-secure-pseries-kernel or powernv-kernel.  But that does not
	mean, there wont be any. In case there is such a third-party
	module needing bounce buffering, it wont be able to operate,
	because of the proposed change in your patch.

	Is that a good thing or a bad thing, I do not know. I will let
	the experts opine.

RP
