Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FF7A5DED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 11:30:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AWzU2wP9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqbx52cxyz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 19:30:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AWzU2wP9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqbwC1GHnz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 19:29:31 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RqbwB5rcMz4xQS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 19:29:30 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RqbwB5hzWz4xQQ; Tue, 19 Sep 2023 19:29:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AWzU2wP9;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RqbwB3N9Qz4xM6;
	Tue, 19 Sep 2023 19:29:29 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38J9NScM027241;
	Tue, 19 Sep 2023 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=jsMRrCqoFkAmj/OFs1WAEfevyyOfjPTuYYHY6enGi34=;
 b=AWzU2wP9xqTTx2vtY7bp/OMF96CaO5OqnhI3cx+CVlnTV1wxNuknfBt9A8d3HDMGeU5v
 gFTgakzXRjOc2XFV4x1Q7U5DSn5goni8UoEwshakKN6H4TwnTzjFe93guZH0HjzAj0uI
 6cgWMNN2w2Q12Zj0BBCyDOTAMIX+Q4OJZbFSagAbRrcUC97SYT7qL73mLXc4MktvSkBy
 PZzvNY1MrgIeDLhA1j8jJB/rj74nOL6e111QvYA41S5S7gTC0L/8QQJYDpnEVxbL+toy
 /NIrucOIrjybotIf6eXHAe/ZGdUbYhLn/CB+1FQewjneADUoecaSCf2sTARbTDZYwisD oA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t78yhr47f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:29:27 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38J8QHtu011666;
	Tue, 19 Sep 2023 09:29:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t5qpnaww3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:29:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38J9TNjs20644376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Sep 2023 09:29:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 396B920043;
	Tue, 19 Sep 2023 09:29:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 027EE20040;
	Tue, 19 Sep 2023 09:29:22 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 19 Sep 2023 09:29:21 +0000 (GMT)
Date: Tue, 19 Sep 2023 14:59:19 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-ID: <7wyh7samvysbs5t3uo5txdxxf3kn4dh3ydgkwjwfvewayyi4ej@n6jbmivlnshz>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <87v8cc7uva.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8cc7uva.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nOdWbxdZpIWNzeOQmL02bSxTZ6zfF1fz
X-Proofpoint-ORIG-GUID: nOdWbxdZpIWNzeOQmL02bSxTZ6zfF1fz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_03,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=638 clxscore=1015
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190076
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

On Thu, Sep 14, 2023 at 11:22:01PM +1000, Michael Ellerman wrote:
> Aditya Gupta <adityag@linux.ibm.com> writes:
> > Presently, while reading a vmcore, makedumpfile uses
> > `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> > RADIX MMU or not.
> >
> > Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> > a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> > assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> > MMU to be hash MMU.
> >
> > Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> > `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
> > is accessible to makedumpfile, without needing the vmlinux file
> 
> This looks fine.
> 
> Seems like cpu_features would be needed or at least pretty useful too?
> 
> cheers

Sure, that can be added too, to the vmcoreinfo. Not sure if it's used now, but
sure it can help to identify features in makedumpfile.

Will add it, in next version.

Thanks
- Aditya Gupta
