Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04811330B6D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 11:41:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvFHs0YCNz3ckJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 21:41:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XcVRf1+I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XcVRf1+I; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvFHP5rfwz3cLN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 21:40:48 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128AXKxM093640; Mon, 8 Mar 2021 05:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=I9pkCqcopJ0DSYA3ZRB1mKxx9JOkddnnnaF04MxzMXo=;
 b=XcVRf1+ItJOKXdYaDP9zdTwX4lkxtnHhIQmaNk6LikRcGWUMumpcmkwe01OQS91UXjDw
 AG9ShFUr+H4wqwPVWOkYkoIB6nXd4SsXzk6+xkvLC4kWQdtLty4xd1DD3u31PWFxF+Jf
 sG1JWSolRiddV3SJCy/5KW6kebyO4jiNK68HemvV/X7WxkmHgN+BK3m79mFCWFq0bRcM
 pEaekuMnv4ZADMsIq4fS93/Zh/7a+7KmiehNmbMv8C1dTBn69ctv2HARVUyX7kmh2wKQ
 /mNmZhwnVQxsoeQVEkuuiyDDOCT3VZjYQ7iXBugBJQ3IdjCaVkOk2LGPdi/yXEhNaHIy 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375bhcj2j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 05:40:39 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 128AYxNe102836;
 Mon, 8 Mar 2021 05:40:39 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375bhcj2hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 05:40:39 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128AY2Fb014311;
 Mon, 8 Mar 2021 10:40:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37410h9rmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:40:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128AeZma36634894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 10:40:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 343A2AE053;
 Mon,  8 Mar 2021 10:40:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8163DAE045;
 Mon,  8 Mar 2021 10:40:34 +0000 (GMT)
Received: from localhost (unknown [9.77.201.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 10:40:34 +0000 (GMT)
Date: Mon, 8 Mar 2021 16:10:32 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Fix instruction encoding for lis in
 ppc_function_entry()
Message-ID: <20210308104032.GB145@DESKTOP-TDPLP67.localdomain>
References: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
 <870c42dd-9862-bb86-6e06-2e0164f4ae85@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <870c42dd-9862-bb86-6e06-2e0164f4ae85@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_04:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080055
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
Cc: Jiri Olsa <jolsa@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/03/05 12:37PM, Christophe Leroy wrote:
> 
> 
> Le 04/03/2021 à 03:04, Naveen N. Rao a écrit :
> > 'lis r2,N' is 'addis r2,0,N' and the instruction encoding in the macro
> > LIS_R2 is incorrect (it currently maps to 'addis 0,r2,N'). Fix the same.
> > 
> > Fixes: c71b7eff426fa7 ("powerpc: Add ABIv2 support to ppc_function_entry")
> > Reported-by: Jiri Olsa <jolsa@redhat.com>
> > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > ---
> >   arch/powerpc/include/asm/code-patching.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> > index eacc9102c2515c..d5b3c3bb95b400 100644
> > --- a/arch/powerpc/include/asm/code-patching.h
> > +++ b/arch/powerpc/include/asm/code-patching.h
> > @@ -73,7 +73,7 @@ void __patch_exception(int exc, unsigned long addr);
> >   #endif
> >   #define OP_RT_RA_MASK	0xffff0000UL
> > -#define LIS_R2		0x3c020000UL
> > +#define LIS_R2		0x3c400000UL
> >   #define ADDIS_R2_R12	0x3c4c0000UL
> >   #define ADDI_R2_R2	0x38420000UL
> 
> That probably goes beyond the scope of this patch, but it would be more
> readable and less error prone to use macros defined in ppc-opcode.h just
> like kernel/module_64.c does for instance:
> 
> #define LIS_R2	(PPC_INST_ADDIS | __PPC_RT(R2))
> #define ADDIS_R2_R12	(PPC_INST_ADDIS | __PPC_RT(R2) | __PPC_RA(R12))
> #define ADDI_R2_R2	(PPC_INST_ADDI | __PPC_RT(R2) | __PPC_RA(R2))

Good point. While that would have made it harder to spot the error, it 
probably would have avoided the error in the first place.

Your change looks good to me.

Thanks,
Naveen

