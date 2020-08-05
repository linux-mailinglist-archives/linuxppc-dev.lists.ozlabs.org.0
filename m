Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15023C4D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:57:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLzrx62glzDqf1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 14:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLzqJ4gbGzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 14:56:28 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0754X1tX171658; Wed, 5 Aug 2020 00:56:17 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qcf1vtw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 00:56:17 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0754txw0022017;
 Wed, 5 Aug 2020 04:56:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 32nyyd1n42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 04:56:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0754uDld34210222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 04:56:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E87D911C050;
 Wed,  5 Aug 2020 04:56:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 096CC11C04A;
 Wed,  5 Aug 2020 04:56:12 +0000 (GMT)
Received: from [9.85.68.248] (unknown [9.85.68.248])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Aug 2020 04:56:11 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: [PATCH v4] selftests/powerpc: Fix pkey syscall redefinitions
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <a4956d838bf59b0a71a2553c5ca81131ea8b49b9.1596561758.git.sandipan@linux.ibm.com>
Date: Wed, 5 Aug 2020 10:26:11 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <6E920CCA-7931-4C93-9147-C9D80A74F943@linux.vnet.ibm.com>
References: <a4956d838bf59b0a71a2553c5ca81131ea8b49b9.1596561758.git.sandipan@linux.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_03:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=832 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008050040
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
Cc: David Laight <david.laight@aculab.com>, linuxppc-dev@lists.ozlabs.org,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 04-Aug-2020, at 11:01 PM, Sandipan Das <sandipan@linux.ibm.com> wrote:
> 
> On distros using older glibc versions, the pkey tests
> encounter build failures due to redefinition of the
> pkey syscall numbers.
> 
> For compatibility, commit 743f3544fffb added a wrapper
> for the gettid() syscall and included syscall.h if the
> version of glibc used is older than 2.30. This leads
> to different definitions of SYS_pkey_* as the ones in
> the pkey test header set numeric constants where as the
> ones from syscall.h reuse __NR_pkey_*. The compiler
> complains about redefinitions since they are different.
> 
> This replaces SYS_pkey_* definitions with __NR_pkey_*
> such that the definitions in both syscall.h and pkeys.h
> are alike. This way, if syscall.h has to be included
> for compatibility reasons, builds will still succeed.
> 
> Fixes: 743f3544fffb ("selftests/powerpc: Add wrapper for gettid")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Suggested-by: David Laight <david.laight@aculab.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin
