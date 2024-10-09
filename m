Return-Path: <linuxppc-dev+bounces-1876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3E399658A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 11:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNnph0BLPz2yY1;
	Wed,  9 Oct 2024 20:37:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728466619;
	cv=none; b=GXWQetzdP/ELZwM6oyUCEnjMLCBlNLkXpwNU8Y9/7B1nvoFjDfQiKPYarrZmbJXxMz5fVnUQzWX0aw03nwj7sgiDb0WCjV7iF543xk0mlsLqQEvk/bZWKDFa8KIOpN9lpXU1orMY6F9kJPOLpGaHMb8UJCdikaErwA4xUK2XM982pUdotbwNfFqKckkw+ZSOacajln/nqbom9mFPwSFtqeWVaFCBwewR+05KjvFgRPv1Aq8x0Bb7GytRCl3NVsoZe1jnyNRkEKWJ4xJcGLO1CMrhcN53kC4TNdw8D4U4kHTBcFjYtO2CIzOmqSYUFeimZliESyksAASRN67Wm0GssA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728466619; c=relaxed/relaxed;
	bh=/KRpb8zcw131KFpG0zawx6jslbJXCySZOnhN/pbyBoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kjyGk8gV9BTJ1ZCKaPBSh0SqsKB5aSs4I2p6su9NmXl4Za5rwjhf1FngtQ0uZpP0uDQ1BKPRw0JnGRqhvz/v34Xyx97F6KOpTT7AaQJ9O93F3YFA/t1RzqFm6yegG5PfbYvUpYKTyRGpbXhJ0oxILXDdbMb9/4cV6tIYRibdjS8vICfixx4M5fyLrGcG2nBIK1CSqQNsuXzodXqGlq/QEhG0/ibYft0yJm92Oh7DqkJEOYLZYRhXzg+5yLGUYj22pyvrJ8E1j8ok4Xhl7S/431nx1ANpV3epVGtsjLogsE2F7MEsVSuf6K/YJdW0sLtH3UrLK6e2hCjyK2dn5Dl70Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o1Z1OCDC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o1Z1OCDC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNnpf4RTWz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 20:36:57 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4998sjTA001582;
	Wed, 9 Oct 2024 09:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=pp1; bh=/KRpb8zcw131KFpG0zawx6jslbJ
	XCySZOnhN/pbyBoY=; b=o1Z1OCDCy87dqeYp4gOCmTovg+fJc06qUC9TZPqVxYN
	BpC3WcA02AEKbX0KnpVcRpe1KvGi1JKoU5RYiW8izcIX5d6FuKtfiAkuJkj/GqbS
	iC4v6X0HwlnsmitRsjSs4EfT0tpO+z1N3QzY4xL+O+qHRblqNb0iFbkDVEvzq+lY
	xLfleYE0kPm67FWB80KKFjNRGyYk9+CeRTXOF2QRFOhophedOYes7F54OolBsAzQ
	bNSB301yHb4GiX+gu7m/pfw489Lgf5GUDvJygX7VAmdnVI6p3PQQeVXJoKzqZekW
	94/4cicQqYt8Fr8Hul4GUOH+Zxb07zZkvAJeaGzkISQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425pqw85c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:36:15 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4999aE65031934;
	Wed, 9 Oct 2024 09:36:14 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 425pqw85c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:36:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4997SUcV013790;
	Wed, 9 Oct 2024 09:36:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 423fss95x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 09:36:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4999a9Rw56885668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Oct 2024 09:36:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D6182004B;
	Wed,  9 Oct 2024 09:36:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 956BF20040;
	Wed,  9 Oct 2024 09:36:08 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Oct 2024 09:36:08 +0000 (GMT)
Date: Wed, 9 Oct 2024 11:36:06 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ftrace: Make ftrace_regs abstract and consolidate
 code
Message-ID: <20241009093606.8007-B-hca@linux.ibm.com>
References: <20241008230527.674939311@goodmis.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008230527.674939311@goodmis.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: blRXi90ehFSdmaBi91d1C7PKbODuT15R
X-Proofpoint-GUID: ts_V-pIkFtxTWzK5FdoMQ7BilExQIxn3
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_08,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=577 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 07:05:27PM -0400, Steven Rostedt wrote:
> 
> This is based on:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/
>      ftrace/for-next
> 
> ftrace_regs was created to hold registers that store information to save
> function parameters, return value and stack. Since it is a subset of
> pt_regs, it should only be used by its accessor functions. But because
> pt_regs can easily be taken from ftrace_regs (on most archs), it is
> tempting to use it directly. But when running on other architectures, it
> may fail to build or worse, build but crash the kernel!
> 
> Instead, make struct ftrace_regs an empty structure and have the
> architectures define __arch_ftrace_regs and all the accessor functions
> will typecast to it to get to the actual fields. This will help avoid
> usage of ftrace_regs directly.
> 
> I again compiled all the affected architectures (except for 32bit ppc).
> I got s390 built when disabling bcachefs.

Build fix for this problem is commit 2007d28ec009 ("bcachefs: rename
version -> bversion for big endian builds").

