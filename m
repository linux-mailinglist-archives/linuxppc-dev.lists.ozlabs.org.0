Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FFA7D9F9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 20:13:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R+S5bTdg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SH9kg5gHGz3cXJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 05:12:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R+S5bTdg;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH9jp11Brz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 05:12:14 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SH9jj2xwjz4x5K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 05:12:09 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SH9jj2s3bz4x2P; Sat, 28 Oct 2023 05:12:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R+S5bTdg;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SH9jh70Kcz4wy6;
	Sat, 28 Oct 2023 05:12:08 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RHwrSO014438;
	Fri, 27 Oct 2023 18:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=uxZQeuJmYftS+QBKpybqUAxdzwKzd914IvdqS7Kmw/4=;
 b=R+S5bTdgYbtv0IqHrHZNsJj4GvFJnJNB877fNc1o2lf75goJLlOUjLf/BYdmjM0vabnd
 iatSPz/r0R2fP6bfBVy+7BzwIgjLCfRXb7yhMpLTohB+qxDYXiKGdBUCo8u01DtU1+B7
 VVaPIT67Z0FjNM5zxd1DOByU2R5l+n70gtNWrruf/1InzuZ8SUb5yCFuwdRim1y/YhaQ
 KOUk8ZBmuYwyOlyc+E77wtVXccjZmSYL9Yf+IBhZ65xrGMD5AQpLRFaulLzpA4z8Ia1k
 3XzvOvnbw14NggHAd95FbXvixX7ICaYf8x54fOSQlfu5oy0oan8Td30clPJzWa9QF1Ua LQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u0h7f9rsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Oct 2023 18:12:06 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39RG0eRx026909;
	Fri, 27 Oct 2023 18:12:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tywqrpw6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Oct 2023 18:12:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39RIC2Pc11731546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 18:12:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B0692004B;
	Fri, 27 Oct 2023 18:12:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EE1C20040;
	Fri, 27 Oct 2023 18:12:00 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.179.24.245])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Oct 2023 18:11:59 +0000 (GMT)
Date: Fri, 27 Oct 2023 23:41:54 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] ppc64: add mmu information to vmcoreinfo
Message-ID: <d52bvisvucuiqhel3rr6fbonvkey4vqkob6u4oevk5ibgoxzcp@52fjqw77w7rh>
References: <20231023072612.50874-1-adityag@linux.ibm.com>
 <169840079688.2701453.15154354310571529574.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169840079688.2701453.15154354310571529574.b4-ty@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZK1Ld0OuRHV6JpNAfA9OVwhopq3Aj4Hz
X-Proofpoint-GUID: ZK1Ld0OuRHV6JpNAfA9OVwhopq3Aj4Hz
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_17,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=247 priorityscore=1501
 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310270157
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 08:59:56PM +1100, Michael Ellerman wrote:
> On Mon, 23 Oct 2023 12:56:12 +0530, Aditya Gupta wrote:
> > Since below commit, address mapping for vmemmap has changed for Radix
> > MMU, where address mapping is stored in kernel page table itself,
> > instead of earlier used 'vmemmap_list'.
> > 
> >     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
> >     a different vmemmap handling function")
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/1] ppc64: add mmu information to vmcoreinfo
>       https://git.kernel.org/powerpc/c/36e826b568e412f61d68fedc02a67b4d8b7583cc
> 
> cheers

Thank you.

