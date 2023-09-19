Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA967A5D96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 11:18:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlxigwKu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqbg739BVz3cBd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 19:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlxigwKu;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqbfB4phKz2ytG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 19:17:22 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rqbf94LwCz4x5m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 19:17:21 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rqbf94DZQz4x5j; Tue, 19 Sep 2023 19:17:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MlxigwKu;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Rqbf91vGwz4x09;
	Tue, 19 Sep 2023 19:17:20 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38J97UYx021838;
	Tue, 19 Sep 2023 09:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=lYtQzxO7vZLtkwijp3Rra+6OuS2XFzjWbwp76i65g4Q=;
 b=MlxigwKuhOoc6qEKyMwXlIM8zEDZMYFWzFVrjeoliOon4BJSoMemBNeSdnd7SNNhO17O
 4HaYNsrl4ijYdIH7nlhdFrGW9e09qtlq+SziCFUkxddS6AkxPc8VilibD0XSnDIjdYvA
 FgmlXdgEuAGh5h77md9OQNt73JQY+ickyWcpJrjjuaXlSMg4qYxBXPgp5M5X83KULISw
 rmbS3UrObzAH5MAoSvplycn+ZdxgqEkJN1jAMSItjfDhCW33fkeuEeF7wC+R83u8Mbzz
 G4kSIinhqeipp2ynQSRoqrc0FoWcqqK4SzxAeA5E8GeQD6Zi51O1aaYS9k87ET7OJJYP Aw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t78gr0mdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:17:18 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38J80btL016432;
	Tue, 19 Sep 2023 09:17:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t5sd1t8nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:17:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38J9HEfY23265852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Sep 2023 09:17:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB8FF2004E;
	Tue, 19 Sep 2023 09:17:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80B4020043;
	Tue, 19 Sep 2023 09:17:13 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 19 Sep 2023 09:17:13 +0000 (GMT)
Date: Tue, 19 Sep 2023 14:47:11 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Message-ID: <vypicgtriqlikpzoxqmojm4ung755nvgvwb7fthjzfyh2uznod@rabazeoqhg2t>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
 <87sf7g7uu7.fsf@mail.lhotse>
 <E74C5EA6-8720-47D5-ABD4-5AC6CE38BAE7@linux.ibm.com>
 <87fs3g6xt3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs3g6xt3.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hnEwEuxJ-Bup9sW1HC15IKD2uSP82rag
X-Proofpoint-GUID: hnEwEuxJ-Bup9sW1HC15IKD2uSP82rag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_03,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190076
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

Hello mpe,

On Fri, Sep 15, 2023 at 11:16:08AM +1000, Michael Ellerman wrote:
> Sachin Sant <sachinp@linux.ibm.com> writes:
> >> On 14-Sep-2023, at 6:52 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> 
> >> Sachin Sant <sachinp@linux.ibm.com> writes:
> >>>> On 11-Sep-2023, at 2:44 PM, Aditya Gupta <adityag@linux.ibm.com> wrote:
> >>>> 
> >>>> Presently, while reading a vmcore, makedumpfile uses
> >>>> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> >>>> RADIX MMU or not.
> >>>> 
> >>>> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> >>>> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> >>>> assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> >>>> MMU to be hash MMU.
> >>>> 
> >>>> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> >>>> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
> >>>> is accessible to makedumpfile, without needing the vmlinux file
> >>>> 
> >>>> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
> >>>> ---
> >>> 
> >>> Thanks for the patch. With this patch applied (along with makedumpfile changes)
> >>> I am able to capture vmcore against a kernel which contains commit 8dc9a0ad0c3e
> >> 
> >> I can't find that commit? Was just wondering if it should be referenced
> >> in the commit message.
> >> 
> >
> > My bad, I copied that commit id from the email when I first reported this issue
> > against linux-next.
> >
> > The commit should be 
> > 368a0590d954: (powerpc/book3s64/vmemmap: switch radix to use a
> > different vmemmap handling function)
> 
> OK thanks.
> 
> Aditya, can you please rephrase the commit message to mention how that
> commit broke the previous behaviour.

Offsets were being wrongly assigned, in makedumpfile, in Radix MMU case (unless
-x vmlinux was passed to makedumpfile, which generally isn't the case)

That was happening even before the '368a0590d954' commit mentioned, it's just
that we hit the issue now, since with above commit, we needed to use those
offsets for page traversal, in makedumpfile. And those offsets were incorrecly
assigned, and hence page traversal failed.

For the offsets/shifts to be correctly assigned in makedumpfile,
`cur_cpu_spec.mmu_features` needs to be exported in VMCOREINFO by kernel.

> 
> Also I don't know what pgd_offset_l4 is?

Sure, I will try to explain with more context in commit description in next
version, or directly mention the particular shifts that was wrong.

In makedumpfile, it is the offset of pgdir from the kernel pgd, for a given
virtual address

It is same as what the `pgd_index` function returns, in the powerpc
kernel source.

> 
> cheers

Thanks

