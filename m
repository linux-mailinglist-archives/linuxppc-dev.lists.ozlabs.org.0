Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4780792060
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 07:43:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aZcPor0N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfvYL0sRhz3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 15:43:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aZcPor0N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfvXQ1j4vz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 15:42:13 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3855b1Ge029127;
	Tue, 5 Sep 2023 05:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Hl6+ZTATI+6q3yMcVGGHJFj2PkpzwsWpa1T7EiqvydI=;
 b=aZcPor0NIbB11sJlTRgpxelrhNEj5voLhCHHIfNUArW/ywDd138l0ilFoaBw3y4FPoTb
 GTvFDEWDy2Kvbwo9kKQQtCEIBdRvwdVfmLnZ0fsYcnb9kthVgiziNwZVXNwSzXsBAQcW
 BMx7ShZATrA8ZhXg5cBvg+NWTyH9ZZ7wrBM/kLvEZeqv4C8PbVPtHfm1G8cPJJpnTRvP
 l7lbDFotumNmsi8qS63U+cQjKT1cec0O2G8bERiDT3rGADoWisko9EIvCha2uptS9O83
 dBLffIOpwofcYeA4hpOmgV4b3f8frh5XFohgmtSnBZtT1q7FGNfq6QVMlLOREv21AJkj Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3swvb4ta8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 05:41:48 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3855bsv9031415;
	Tue, 5 Sep 2023 05:41:12 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3swvb4t509-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 05:41:12 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385395DX012257;
	Tue, 5 Sep 2023 05:38:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkjqq0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 05:37:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3855bwcx43188820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 05:37:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 340B120043;
	Tue,  5 Sep 2023 05:37:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4933120040;
	Tue,  5 Sep 2023 05:37:56 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  5 Sep 2023 05:37:56 +0000 (GMT)
Date: Tue, 5 Sep 2023 11:07:55 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] powerpc/smp: Dynamically build powerpc topology
Message-ID: <20230905053755.GM1694454@linux.vnet.ibm.com>
References: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
 <20230904221004.GB2568@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230904221004.GB2568@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: flRABTS0mqzGxma6Wcjjxr0YL2jHdRcT
X-Proofpoint-ORIG-GUID: RE0ZdzZWJ2HvY3CgDRnJmmclmQxmlZO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_04,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=502
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309050049
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Peter Zijlstra <peterz@infradead.org> [2023-09-05 00:10:04]:

> On Wed, Aug 30, 2023 at 05:56:14PM +0530, Srikar Dronamraju wrote:
> > Currently there are four powerpc specific sched topologies.  These are
> > all statically defined.  However not all these topologies are used by
> > all powerpc systems.
> > 
> > To avoid unnecessary degenerations by the scheduler , masks and flags
> > are compared. However if the sched topologies are build dynamically then
> > the code is simpler and there are greater chances of avoiding
> > degenerations.
> > 
> > Even x86 builds its sched topologies dynamically and new changes are
> > very similar to the way x86 is building its topologies.
> 

Thanks Peter for taking a look.

> You're not stating it explicitly, but you're doing this as a performance
> optimization, right? The x86 thing didn't particularly care about
> avoiding degenerate topologies -- it's just that the fixed tables method
> grew unwieldy due to combinatorics.
> 

Yes, its an optimization. On Powerpc, there is an utility ppc64, which users
would use to set their SMT mode, and whenever they do we end up recreating
the topology. Hence avoiding degenerates esp on large systems, should help.

Also dynamic add of CPUs is more common on Powerpc. Hence there also we
would avoid degenerating unnecessary domains.

> And how does this patch relate to the other series touching this?
> 
>   powerpc/smp: Shared processor sched optimizations
> 

This patch will work independent of that patchset.
However Shared processor sched optimization patchset makes MC domain
avoid degeneration. Hence this patch will benefit from that patchset.

i.e without the Shared processor sched patchset, has_coregroup_support()
will return true on Power10 for even shared processor. And hence the
scheduler will create and destroy MC domains. If the patchset is already
present, on Power10 for shared processors, we will avoid MC domains.
Other that this there wont be any change.

-- 
Thanks and Regards
Srikar Dronamraju
