Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D467A79E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 12:59:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIpK5v8B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrFt127Zdz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIpK5v8B;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrFqx1P9kz3cCr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:58:05 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RrFqx0pHzz4xDB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:58:05 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RrFqx0k9cz4x5q; Wed, 20 Sep 2023 20:58:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oIpK5v8B;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RrFqw5RWHz4wxd;
	Wed, 20 Sep 2023 20:58:04 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KAd3Cj014979;
	Wed, 20 Sep 2023 10:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=D3yzwA4fL6y6IvRJ7LdbURdxpy8pkoS8GdWy9JJhPPc=;
 b=oIpK5v8BopmEaDWuVFHXmW/F/zX1qokC5TAh9gf5maQ4ZT65HiHJVBrw4vFPe+c76D05
 IgQ+6DWq6X1e4ZeJMdS2d3I+M6fHLycqXLrUN0hj7PGlDqcmXIGh/nOpPJ1r6gzrwehW
 KytYHgkW/amitT72Dk+KBDh9EI/CmhGJZSCirnHGLo0e6uBuBwXrQt8Y67XlzsZTJyiJ
 TB/MRJPprsv9aZnK/DMPvYU7Ks4JkNxlwbgqCBSClhpv2u+yTLHC4hb9/XZeJ+9JaT/h
 qo4We/0D8FlhrRkjRxl7iAQPWcfRpkrDavh7plKKn/odXhAXDdTnPhv6guMAV/eXtjlX iw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t7xhg9krx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 10:58:02 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38KA6l6O005542;
	Wed, 20 Sep 2023 10:58:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t5q2yw9qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 10:58:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38KAvw8F22020808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 10:57:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 588FE20043;
	Wed, 20 Sep 2023 10:57:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 285EF20040;
	Wed, 20 Sep 2023 10:57:57 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 20 Sep 2023 10:57:56 +0000 (GMT)
Date: Wed, 20 Sep 2023 16:27:51 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-ID: <n6ccpni5whaedryykonfeisgnd2du3dx4lcl3nhnuxwmffvx3e@at4qodx63gem>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <87v8cc7uva.fsf@mail.lhotse>
 <7wyh7samvysbs5t3uo5txdxxf3kn4dh3ydgkwjwfvewayyi4ej@n6jbmivlnshz>
 <87led2tr1o.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87led2tr1o.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fORIKAtdCAiUZfnYYvFgf-iM7nyqM99z
X-Proofpoint-GUID: fORIKAtdCAiUZfnYYvFgf-iM7nyqM99z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_05,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=627 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200084
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 19, 2023 at 08:07:15PM +1000, Michael Ellerman wrote:
> Aditya Gupta <adityag@linux.ibm.com> writes:
> > On Thu, Sep 14, 2023 at 11:22:01PM +1000, Michael Ellerman wrote:
> >> Aditya Gupta <adityag@linux.ibm.com> writes:
> >> > Presently, while reading a vmcore, makedumpfile uses
> >> > `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> >> > RADIX MMU or not.
> >> >
> >> > Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> >> > a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> >> > assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> >> > MMU to be hash MMU.
> >> >
> >> > Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> >> > `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
> >> > is accessible to makedumpfile, without needing the vmlinux file
> >> 
> >> This looks fine.
> >> 
> >> Seems like cpu_features would be needed or at least pretty useful too?
> >> 
> >> cheers
> >
> > Sure, that can be added too, to the vmcoreinfo. Not sure if it's used now, but
> > sure it can help to identify features in makedumpfile.
> >
> > Will add it, in next version.
> 
> Please do it in a separate commit to the mmu_features :)
> 
> cheers

Sure, have done it in a separate patch in V2.

Thanks
