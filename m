Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C09B591277F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:21:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fjrdfSXq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KKc2ZPtz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:21:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fjrdfSXq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5KJv1fqJz30Vd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:20:47 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LDpjwd007918;
	Fri, 21 Jun 2024 14:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=sJJqCuieG7oXQ6BEgRLEOKCBvgY
	hb+zAYJQBFLYnTZg=; b=fjrdfSXqB/WD9xddv5VQuyP8JhdNDSB9dZNjWi46S4w
	Xw44JjUlI4LQieEWSqAt2at+16Znm1Skf5x65TV/adGvT7CQpYYeowsC83MAemwv
	THbcKszsl5psJ4Xx1cYRkPdKiqqWSvloOGk9BgtrP3LaxZ69yL+023iw8mdczChq
	jlkXeFbQUfj50sB7Lpi/eFXF68lz4A/WA75cqSqb6Q3a3AKFXWMyprLWg4IZm6vn
	F+Uw+6bHsGAUPYISefAy9iOIJmAk/5ilNpKVTEzYATdTxa7Bi0BS6R8DKWfZZ+Pg
	CXJpBMnSWxNx/BscnHmx7NH8tKzzKCsiKDXVXusyefw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ywajp049w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 14:20:04 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45LEK3u1031783;
	Fri, 21 Jun 2024 14:20:03 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ywajp049s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 14:20:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45LCAh6E025663;
	Fri, 21 Jun 2024 14:20:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yvrqv7kug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 14:20:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45LEJwsl50921746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 14:20:01 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7C1920043;
	Fri, 21 Jun 2024 14:19:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62BBC20040;
	Fri, 21 Jun 2024 14:19:57 +0000 (GMT)
Received: from osiris (unknown [9.171.32.192])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 21 Jun 2024 14:19:57 +0000 (GMT)
Date: Fri, 21 Jun 2024 16:19:55 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 02/15] syscalls: fix compat_sys_io_pgetevents_time64 usage
Message-ID: <20240621141955.14882-C-hca@linux.ibm.com>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-3-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620162316.3674955-3-arnd@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YXfrRffn6TYyLSwBDXqaZzkqoKWr1mYq
X-Proofpoint-GUID: Z5Ojicv41iCrwMxI3gZzmAFXZezdhIwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_06,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=379 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406210101
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, linux-csky@vger.kernel.org, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024 at 06:23:03PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using sys_io_pgetevents() as the entry point for compat mode tasks
> works almost correctly, but misses the sign extension for the min_nr
> and nr arguments.
> 
> This was addressed on parisc by switching to
> compat_sys_io_pgetevents_time64() in commit 6431e92fc827 ("parisc:
> io_pgetevents_time64() needs compat syscall in 32-bit compat mode"),
> as well as by using more sophisticated system call wrappers on x86 and
> s390. However, arm64, mips, powerpc, sparc and riscv still have the
> same bug.
> 
> Changes all of them over to use compat_sys_io_pgetevents_time64()
> like parisc already does. This was clearly the intention when the
> function was originally added, but it got hooked up incorrectly in
> the tables.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48166e6ea47d ("y2038: add 64-bit time_t syscalls to all 32-bit architectures")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/unistd32.h         | 2 +-
>  arch/mips/kernel/syscalls/syscall_n32.tbl | 2 +-
>  arch/mips/kernel/syscalls/syscall_o32.tbl | 2 +-
>  arch/powerpc/kernel/syscalls/syscall.tbl  | 2 +-
>  arch/s390/kernel/syscalls/syscall.tbl     | 2 +-
>  arch/sparc/kernel/syscalls/syscall.tbl    | 2 +-
>  arch/x86/entry/syscalls/syscall_32.tbl    | 2 +-
>  include/uapi/asm-generic/unistd.h         | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
