Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2933594F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 07:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGnHr1wBKz30HC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 15:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YyMwNbM4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YyMwNbM4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGnHN4pK1z302p
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 15:48:31 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1395Wlux036030; Fri, 9 Apr 2021 01:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=A6CDzsFW5lSvkHSVN7nbejpxY0pFS7f1ZpOhqbwqFQ4=;
 b=YyMwNbM4eJxM2o/ceUsl4cX5uQPCUXcMDeovin4KFgoLxFpZTrLmL/LnPS8xTluUYeDk
 l/42OgC500QOnHn6Bo6wC5S8GLRCCDmy+Xm5v/J/h4n4lvfd5RKykHeyBFk0tW/nNmUm
 cR7eYjeaLNNNtlnuHQOQOwCejy+T5ZuOjjIh+vrYTdFoRjx0VPXf5wePrsLPHA7ohPFI
 Ot40eJQedM7sRQbubGS0qRTrtWI1oQNP/KLu0jmzuyptQ303klZdtu2RGAiquO3ojSGr
 du+ED7MTEJ1lLFbaSBUtlu5MovEuutDAVbsjNIcIGDkRrR51pxTf1/WjUb/Rp0gfVROv bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37tgd0165c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 01:48:23 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1395g62O090587;
 Fri, 9 Apr 2021 01:48:23 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37tgd0164v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 01:48:23 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1395lgeT013889;
 Fri, 9 Apr 2021 05:48:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 37rvu2a4k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:48:21 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1395mL6c31719882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 05:48:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AF9A112061;
 Fri,  9 Apr 2021 05:48:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 130FB112063;
 Fri,  9 Apr 2021 05:48:19 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.88.218])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  9 Apr 2021 05:48:18 +0000 (GMT)
X-Mailer: emacs 27.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH v3 0/9] Speedup mremap on ppc64
In-Reply-To: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
Date: Fri, 09 Apr 2021 11:18:16 +0530
Message-ID: <87h7kgatzz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2rnZItzo2797eMmJ18YmpBmIEeABtPpK
X-Proofpoint-GUID: dcPmjbP--NX3GghEGtquWhl_ZnzDo_JQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090041
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
> the platform to support updating higher-level page tables without
> updating page table entries. This also needs to invalidate the Page Walk
> Cache on architecture supporting the same.
>
> Changes from v2:
> * switch from using mmu_gather to flush_pte_tlb_pwc_range() 
>
> Changes from v1:
> * Rebase to recent upstream
> * Fix build issues with tlb_gather_mmu changes
>

Gentle ping. Any objections for this series? 

-aneesh
