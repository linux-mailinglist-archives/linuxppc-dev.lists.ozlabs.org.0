Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2067CFA04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 14:56:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sCtq53AQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB7501lTpz3vX2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 23:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sCtq53AQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB7474ZkWz3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 23:55:35 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JClL9E009734;
	Thu, 19 Oct 2023 12:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=ZyTyEqjxXhJ2+P5EJDKRWQfGR1CIriFg+9zSkPJjKkg=;
 b=sCtq53AQlfM6ZtIMR68PGXJ0+Yzzim/sNqtOnnR4jD7s0Vuekeb72mBam8mX7R0LMmhc
 fJMZbM1v+8EkdLbmAD6LpTWr3Xqj7dShNkTQL4K+SD8AFog38D363x2SD481pPgHQENH
 MPlfKyKPd+0DpvBmyaoQM2XgBjr5cy8MfSQomelfvHXLk1fm2xVT5E0UK7n0kCfipgu2
 P/6mEQIbmXB51fznnNPSBjTze7mp+T9vscXeaxJ0ozhcUNTkhd26Gw2Xt+HCUA4/Piom
 Q6EEw4HSe4mLNxG4KMz1tfTpqfgg8c05YXkm6rZSNV7KotYzU+hdw6ljNQMypCBCHXk2 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu4s38bge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 12:55:11 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39JCmo0T017859;
	Thu, 19 Oct 2023 12:55:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu4s38b6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 12:55:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39JA0XFD026885;
	Thu, 19 Oct 2023 12:55:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr5ass4u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 12:55:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39JCt2wU40894966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Oct 2023 12:55:02 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0D9F20043;
	Thu, 19 Oct 2023 12:55:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9095520040;
	Thu, 19 Oct 2023 12:55:00 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 19 Oct 2023 12:55:00 +0000 (GMT)
Date: Thu, 19 Oct 2023 18:24:59 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 2/6] powerpc/smp: Enable Asym packing for cores on
 shared processor
Message-ID: <20231019125459.GG2194132@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
 <87v8b35ir3.fsf@mail.lhotse>
 <20231019074828.GM33217@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20231019074828.GM33217@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GMwsv4RQrWCOCQHjFaz6ZetskUR2dNHh
X-Proofpoint-GUID: TCOuYY8HizXlgRk3UK0VEd_N4sDLTwRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_11,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=826 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190110
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Peter Zijlstra <peterz@infradead.org> [2023-10-19 09:48:28]:

> On Thu, Oct 19, 2023 at 03:38:40PM +1100, Michael Ellerman wrote:
> > Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > > If there are shared processor LPARs, underlying Hypervisor can have more
> > > virtual cores to handle than actual physical cores.
> > >
> > > Starting with Power 9, a core has 2 nearly independent thread groups.
> > 
> > You need to be clearer here that you're talking about "big cores", not
> > SMT4 cores as seen on bare metal systems.
> 
> What is a 'big core' ? I'm thinking big.LITTLE, but I didn't think Power
> went that route (yet?).. help?
> 

Each independent thread group acts as a SMT4 core or a small core. A set of
2 thread groups form a SMT8 core aka big core. PowerVM aka pHYp schedules
at a big core granularity

So if we have 2 LPARS, each spanning 2 big cores, aka 16 CPUs, and if at
somepoint, each LPAR has only 2 threads to run, we are exploring if we can
run both the threads on just one big core, so that PhyP can schedule both
LPARS at the same time and avoid having to switch/multiplex between these
two LPARS.

-- 
Thanks and Regards
Srikar Dronamraju
