Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA4136539
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 03:06:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v5vJ3Dv3zDqW1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 13:06:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v5s30cCSzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 13:04:37 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00A22XP7022851
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Jan 2020 21:04:35 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xe7m2yn99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 21:04:34 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00A20ZdE026221
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:04:33 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2xajb6tuss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:04:33 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00A24XCZ13435698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:04:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04ACCAE05F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:04:33 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE3D3AE05C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:04:32 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 02:04:32 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 566922E0F44; Thu,  9 Jan 2020 18:04:31 -0800 (PST)
Date: Thu, 9 Jan 2020 18:04:31 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: maddy <maddy@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/pseries/svm: Disable BHRB/EBB/PMU access
Message-ID: <20200110020431.GA29470@us.ibm.com>
References: <20191225051634.3262-1-sukadev@linux.ibm.com>
 <20191225051634.3262-2-sukadev@linux.ibm.com>
 <20191227052932.GA20946@us.ibm.com>
 <10bfdea4-3237-b6d1-2ac0-034404a94dfc@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bfdea4-3237-b6d1-2ac0-034404a94dfc@linux.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_06:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0 mlxlogscore=735
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001100017
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

maddy [maddy@linux.ibm.com] wrote:
> 
> >   __init_PMU:
> > +#ifdef CONFIG_PPC_SVM
> > +	/*
> > +	 * SVM's are restricted from accessing PMU, so skip.
> > +	 */
> > +	mfmsr   r5
> > +	rldicl  r5, r5, 64-MSR_S_LG, 62
> > +	cmpwi   r5,1
> > +	beq     skip1
> 
> I know all MMCR* are loaded with 0. But
> it is better if PEF code load the MMCR0
> with freeze bits on. I will send a separate
> patch to handle in the non-svm case.

Quick question: 
By PEF code you mean the Ultravisor and not here in
the SVM right? - bc SVMs cannot access PMU registers.
> 
> Rest looks good.
> Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

Cool, Thanks,

Sukadev
