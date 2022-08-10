Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439758E6DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 07:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2fP46J3Cz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 15:58:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLWr4oj6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sLWr4oj6;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2fNL0GXWz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 15:57:21 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27A5bAc0030902
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 05:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=KZh3cVMcDJxf041GJe7GP0zhoaEKRiS9Ibe00/rCv3Y=;
 b=sLWr4oj6Zobz/4B0vxedy7hBfGmi4OVy5BnRIXOvAU8cuRTGR6yUGUZP6ReF3CkxWI0L
 j9mvqqp33lftC1m3bTFDNme+f5KmJ5vtFT9SUhnU8GuFWzGOOKq/W2wIno4Mv6ig+jvk
 it1RdJ+OlGRQlnsqIuk5DWKG+HcZ/rdX30o3ms6Zj8+ESipKYySWAQKuWpntFw5A0fE8
 yYbUQOl2DogQAMahuMAk5crhx1kKtOI6f6b/e8u2sdP4qAekSpH516Y9A9IM8V57FjO3
 UOEOM97w9IUP+UA6t3stDz3xNUvJyPTTQIJp/EtwrC3xWtcddtNieIRHcm68ERsV/KCh mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv5r61snb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 05:57:18 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27A5o8ib019156
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 05:57:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv5r61smv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 05:57:17 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27A5ZGUq004880;
	Wed, 10 Aug 2022 05:57:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03fra.de.ibm.com with ESMTP id 3huwvfrayj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 05:57:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27A5vDcL33948154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Aug 2022 05:57:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4996EA4051;
	Wed, 10 Aug 2022 05:57:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6E68A404D;
	Wed, 10 Aug 2022 05:57:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 10 Aug 2022 05:57:12 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A720F602C2;
	Wed, 10 Aug 2022 15:57:09 +1000 (AEST)
Message-ID: <0d0c1bde39b8129185f79d6ac93abde7ad08f2de.camel@linux.ibm.com>
Subject: Re: [PATCH v2 06/14] powerpc: Include all arch-specific syscall
 prototypes
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 15:57:09 +1000
In-Reply-To: <9109e768d3b7d141d1b0095773cd737bf9ae497c.camel@linux.ibm.com>
References: <20220725062750.119476-1-rmclure@linux.ibm.com>
	 <9109e768d3b7d141d1b0095773cd737bf9ae497c.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9X5CsmGnEzVmBcAMRJ-ntv4VO4Kh7nfg
X-Proofpoint-ORIG-GUID: 0vO1JCWeFSGE9kmVQ-3tG4RPpZJjXNa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_01,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=662 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100016
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-08-08 at 15:24 +1000, Andrew Donnellan wrote:
> > diff --git a/arch/powerpc/include/asm/syscalls.h
> > b/arch/powerpc/include/asm/syscalls.h
> > index 025d4b877161..8b2757d7f423 100644
> > --- a/arch/powerpc/include/asm/syscalls.h
> > +++ b/arch/powerpc/include/asm/syscalls.h
> > @@ -8,49 +8,93 @@
> >  #include <linux/types.h>
> >  #include <linux/compat.h>
> >  
> > +#ifdef CONFIG_PPC64
> > +#include <asm/ppc32.h>
> > +#endif
> > +#include <asm/unistd.h>
> > +#include <asm/ucontext.h>
> > +
> >  struct rtas_args;
> >  
> > -asmlinkage long sys_mmap(unsigned long addr, size_t len,
> > -               unsigned long prot, unsigned long flags,
> > -               unsigned long fd, off_t offset);
> > -asmlinkage long sys_mmap2(unsigned long addr, size_t len,
> > -               unsigned long prot, unsigned long flags,
> > -               unsigned long fd, unsigned long pgoff);
> > -asmlinkage long sys_ppc64_personality(unsigned long personality);
> > +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER

Introduce this ifdef once it starts mattering at patch 10, I think.

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

