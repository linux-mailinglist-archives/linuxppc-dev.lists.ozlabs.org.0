Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4189B341
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 19:20:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vy+JfL7+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCJsJ4zl5z3vYb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 03:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vy+JfL7+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCJrY0hNMz3brL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 03:20:12 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 437GxAvB025509;
	Sun, 7 Apr 2024 17:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=F86vIyT96NLScE6Zk6mOrLIIbnCvATnEMB/X/BdWurM=;
 b=Vy+JfL7+GdlmHij4DY9+FF6bZBGKIzybu3H9TGxNhGMOiNojOX6vU1kcZiUile2ZWzzj
 xdBoUwoyOtYP6C2NH8E73yzr2geuDlQWgZsDTp5+Iatp3+IrlT56kZKLZgVECtOMYtPR
 LkTDs7Vdk/Yc3lJ1Mhn4FEZpQa9kh78F+6mul9elFYjbxv3mkUAXeNoCQwKRAvQioEsg
 vgXqRrAovajP2pMj78xg4rCIrdAvqZLlapXXlRbIUAU2z5zYjzt5z1bvp1jNwpY6p5vk
 Fclj73uOz2kJ1MmHrqV2Io+jRhoaAhECrFGmyWtX2RAlax5j2OLWRZiZvB7LbEkaYT1J Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xbyf4r11k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:19:12 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 437HJBOd027129;
	Sun, 7 Apr 2024 17:19:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xbyf4r11d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:19:11 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 437EiDmP021485;
	Sun, 7 Apr 2024 17:19:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbjxkb7y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:19:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 437HJ5ah37552504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Apr 2024 17:19:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2FE620049;
	Sun,  7 Apr 2024 17:19:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C46CC20040;
	Sun,  7 Apr 2024 17:19:03 +0000 (GMT)
Received: from osiris (unknown [9.179.2.159])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun,  7 Apr 2024 17:19:03 +0000 (GMT)
Date: Sun, 7 Apr 2024 19:19:02 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 0/7] arch/mm/fault: accelerate pagefault when badaccess
Message-ID: <20240407171902.5958-A-hca@linux.ibm.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403134539.fde3a6c594f2d88409be30ed@linux-foundation.org>
 <4d45fffc-877a-4ad1-ad02-a33341e467e7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d45fffc-877a-4ad1-ad02-a33341e467e7@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y3MmKFoPZYTA6URYFqSoHvL5OT_14Ypp
X-Proofpoint-ORIG-GUID: Ts9vZ863gBFIi5c6rKKJKZ5ZbhTxcstc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-07_11,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=950 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404070139
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
Cc: Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, surenb@google.com, linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 07, 2024 at 03:49:53PM +0800, Kefeng Wang wrote:
> On 2024/4/4 4:45, Andrew Morton wrote:
> > On Wed, 3 Apr 2024 16:37:58 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> > 
> > > After VMA lock-based page fault handling enabled, if bad access met
> > > under per-vma lock, it will fallback to mmap_lock-based handling,
> > > so it leads to unnessary mmap lock and vma find again. A test from
> > > lmbench shows 34% improve after this changes on arm64,
> > > 
> > >    lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198
> > > 
> > > Only build test on other archs except arm64.
> > 
> > Thanks.  So we now want a bunch of architectures to runtime test this.  Do
> > we have a selftest in place which will adequately do this?
> 
> I don't find such selftest, and badaccess would lead to coredump, the
> performance should not affect most scene, so no selftest is acceptable.
> lmbench is easy to use to measure the performance.

The rationale for this series (performance improvement) is a bit odd,
since I would expect that the changed code is usually never executed.
