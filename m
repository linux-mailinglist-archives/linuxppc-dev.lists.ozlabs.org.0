Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0AC3C163A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 17:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLLFW32K2z3bYH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 01:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=plw/pOcD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=plw/pOcD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLLF10z3Lz30JY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 01:44:04 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168Fe3wO099191; Thu, 8 Jul 2021 11:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=oogCIMQk/TkjuW28N2Xop1sy7pZBJQKfbtCVqD5uznI=;
 b=plw/pOcDmxQ79kFMIOTKemcZHYJeLQ6C8X1a3aQn+7ZpOPCbtncEXPV0SIdrTL6fc7zF
 U762wlgL1s1hqV3r47LKb+6cWi0LTPGg3HD/p8VnnnTR+zk8CwzL9iKHtQanVDEi+Uct
 FlhfS/HOo0fNtWa0gP04msBxisYV+A/lGIEhD5ynuNKJe8fnBsD/o2sz9A1QdgNbLFv1
 astv3rzSMemNxabBtKlcDOAXGsLTpSr9waz32l4Kp/T0XC4mpOgKUj9dDjhH21Fz5C0t
 FdL5ceppIhmMyCPsd17Gb1JSKI65bUxATsJ6Hs33O+7+0n5REzI9C3XrAvtRxW7wSezF SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mts1rcd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 11:43:57 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168FeExV099876;
 Thu, 8 Jul 2021 11:43:57 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mts1rcc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 11:43:57 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168FaUbT029012;
 Thu, 8 Jul 2021 15:43:56 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 39jfhdw37k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 15:43:56 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168FhsJ342467584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 15:43:54 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABF5A12405B;
 Thu,  8 Jul 2021 15:43:54 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D51A12405E;
 Thu,  8 Jul 2021 15:43:54 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.80.227.146]) by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 15:43:54 +0000 (GMT)
Date: Thu, 8 Jul 2021 10:43:52 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix cycles/instructions as
 PM_CYC/PM_INST_CMPL in power10
Message-ID: <20210708154352.GA11710@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <1625639981-1424-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1625748771.problnjoqz.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625748771.problnjoqz.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A8T8VvUKGTIgHthO4aVrymu5SwGX3wN9
X-Proofpoint-GUID: QADGXKondkQ88VrBtQhlIS4_EKKZpwHn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_06:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080083
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 08, 2021 at 10:56:57PM +1000, Nicholas Piggin wrote:
> Excerpts from Athira Rajeev's message of July 7, 2021 4:39 pm:
> > From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
> > 
> > Power10 performance monitoring unit (PMU) driver uses performance
> > monitor counter 5 (PMC5) and performance monitor counter 6 (PMC6)
> > for counting instructions and cycles. Event used for cycles is
> > PM_RUN_CYC and instructions is PM_RUN_INST_CMPL. But counting of these
> > events in wait state is controlled by the CC56RUN bit setting in
> > Monitor Mode Control Register0 (MMCR0). If the CC56RUN bit is not
> > set, PMC5/6 will not count when CTRL[RUN] is zero.
> 
> What's the acutal bug here, can you explain a bit more? I thought
> PM_RUN_CYC is supposed to be gated by the runlatch.

Would this renaming break compatibility with existing tools that
presume PM_RUN_CYC and PM_RUN_INST_CMPL exist generically?

PC
