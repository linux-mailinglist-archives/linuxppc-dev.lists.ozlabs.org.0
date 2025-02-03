Return-Path: <linuxppc-dev+bounces-5782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8887A255DD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 10:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ymh731yQjz2xgv;
	Mon,  3 Feb 2025 20:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738575023;
	cv=none; b=c7Rja48K+akCJbrkuYPTIqMjbsk/mSdr4gRm8pPhtVIwnyaeWWat4mUJiMpaz/KZyjce0DZixCeGYTNaPO/0rhkEJYO3efBvfp0PBFkSgzS1x853+EqZ6U4kOzK5OH2MWNay9qhPOqZM6TLQXpcI0f645kNnIR5w8BPUUekgiIceZhpTaT/pGeXSi+pIVTX9LOUFd9rO9e6CSoZUe4lKSBnfL58xzZh9Rcb/BhAQN04niCTER2N8EoGWUGtY2ztQDK3jXGA7NgGLQUOtmT3OsqnKRROONyDF5m/qYm6VlXNXYsUJU+GU/Ha+s+3mu6/glRwVDqwCkGIURP3V3o67aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738575023; c=relaxed/relaxed;
	bh=HOOVTMKGmYfDs61vIKKu/2n6mo1Uqhrzh3Nw0X9R5us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPuJuVvNJkmMw3ggT/xK6JBglTLcLVDyB6hMqreEfKavxQ0r+VWoq6AfSgcQ/VrFOn3FrHT5FhIl+NF8kswsp/D4NzQlLzYw11w5nOYiOtDrYgraAdYmRntvuP21RLv8JXusjhZkUZcSkAb3+TauX9EiJUdOoP3ctCwxyTR47yz0ZyJpvjb5dUNrO7M0//hFMnKVJgkpPf/Z7vrkr0I9fs/ThfPU75Us5nqBDPeobx06IODXSIwYSWVTratZBvF/f5TKZawfRDh0fwgHZ9zeAwWJ/9gRDELNELhcJIeyzckcCozfAGIwOVlQUoj3eGLwoidBze+KsTYLvgLqjP5PdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sc7OrPzM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sc7OrPzM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymh722M7wz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 20:30:21 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51320bgd006146;
	Mon, 3 Feb 2025 09:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=HOOVTMKGmYfDs61vIKKu/2n6mo1Uqh
	rzh3Nw0X9R5us=; b=sc7OrPzM94Qro1TPoi9WldL23dl8EhUQA0uUcOii03fm/0
	ZWjWgFI+dUHnyykPX4KurBljs5VF0FTUDOZVPKQ0Nic1W5aixU4tXgMwUo9Ej4Sp
	IhX2kpJQptytYHQ7XzYAy9RoZviZkDVVyjToIShTjmSz3tGfHU97EQ/GMBty3KDe
	U7Y/o3wrR/8Po81HWdFM8acEVLigG7jG/rrAvF0q3j95Qgp65mDoim4AyXlTi4+s
	JSs5sBEVEVSX1pC6uB3pEJ+UczNnVeDbO13pZiffvHI9SIwAVPdnyEwhgbJoiLlY
	rEhklncisvpySSfLHaTqfnQztgOZ+zZlXlJpmmmA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jmmy9m6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 09:29:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5136tpND016288;
	Mon, 3 Feb 2025 09:29:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44hwxs5syv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 09:29:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5139Th5c21955204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 09:29:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F9EF200D4;
	Mon,  3 Feb 2025 09:29:43 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A882200D3;
	Mon,  3 Feb 2025 09:29:39 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.179.20.74])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  3 Feb 2025 09:29:39 +0000 (GMT)
Date: Mon, 3 Feb 2025 10:29:37 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrew Morton <akpm@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>,
        Alexey Gladkov <legion@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Eugene Syromyatnikov <evgsyr@gmail.com>,
        Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>,
        Davide Berardi <berardi.dav@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Shuah Khan <shuah@kernel.org>, strace-devel@lists.strace.io,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-api@vger.kernel.org
Subject: Re: [PATCH v4 0/7] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
Message-ID: <Z6CMgVm8QKEMRf8L@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250203065849.GA14120@strace.io>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203065849.GA14120@strace.io>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tAr2MtM5PWIBRxaWi6Br0hi8CNE4am_9
X-Proofpoint-ORIG-GUID: tAr2MtM5PWIBRxaWi6Br0hi8CNE4am_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=836 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030071
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 03, 2025 at 08:58:49AM +0200, Dmitry V. Levin wrote:

Hi Dmitry,

> PTRACE_SET_SYSCALL_INFO is a generic ptrace API that complements
> PTRACE_GET_SYSCALL_INFO by letting the ptracer modify details of
> system calls the tracee is blocked in.
...

FWIW, I am getting these on s390:

# ./tools/testing/selftests/ptrace/set_syscall_info 
TAP version 13
1..1
# Starting 1 tests from 1 test cases.
#  RUN           global.set_syscall_info ...
# set_syscall_info.c:87:set_syscall_info:Expected exp_entry->nr (-1) == info->entry.nr (65535)
# set_syscall_info.c:88:set_syscall_info:wait #3: PTRACE_GET_SYSCALL_INFO #2: syscall nr mismatch
# set_syscall_info: Test terminated by assertion
#          FAIL  global.set_syscall_info
not ok 1 global.set_syscall_info
# FAILED: 0 / 1 tests passed.
# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

I remember one of the earlier versions (v1 or v2) was working for me.

Thanks!

