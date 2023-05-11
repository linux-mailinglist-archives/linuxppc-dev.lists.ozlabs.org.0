Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE06F6FED4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 09:58:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH4644RYvz3fKR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 17:58:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LFq957ax;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LFq957ax;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH45860RBz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 17:58:04 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34B7dgUa004840;
	Thu, 11 May 2023 07:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=yfYCleIUn+xWJ9AcJe62X2wnauCgiMhHoQILlx/ttD4=;
 b=LFq957axn1UNzTUzhvNVYlDHbCfcqhQ2pRD8ZLsFp/RSpjT1uBMJ/d7ENLNjdQvs8b/O
 ETkXd8kuOadcVr2pCLjNWw4G6MBgssGxGpZMpJIuASv1SpR0PUK34wuL0h5qEW2QJh35
 I82bYrl1LLcaa8T78oJT6a6wtEhLMGPImsQm6ZZ7OMLR004RU4Y4gi9OSAsfKRz/2fjX
 JzkG3CzcsaF9fSk6t5lnZ7W3md1J2Vb7gFuVV3BeMsGsW3QU1zaunkYp8Yy88gnQ5l6D
 XVrXeBgHCOF+7Jj5+rSLVfvXlTFdfCzT/ZEvy3XYrdn6a7Y8+/7BRN1ptdRgFVOcV3xn Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcdvax5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 07:57:23 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34B7vMqo010805;
	Thu, 11 May 2023 07:57:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcdvax4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 07:57:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34B4RaPD016221;
	Thu, 11 May 2023 07:57:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh1hc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 07:57:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34B7vF6226739210
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 May 2023 07:57:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8227920043;
	Thu, 11 May 2023 07:57:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7766720040;
	Thu, 11 May 2023 07:57:13 +0000 (GMT)
Received: from osiris (unknown [9.179.19.134])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 11 May 2023 07:57:13 +0000 (GMT)
Date: Thu, 11 May 2023 09:57:11 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Nhat Pham <nphamcs@gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Message-ID: <ZFyf195PuoBmaV2N@osiris>
References: <20230510195806.2902878-1-nphamcs@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4wqLDbk2I-cFtsb56SrteodOnFigMIFv
X-Proofpoint-GUID: fOUzFmhABUHi7ZZwffU3nGIoi4bBWM03
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0 mlxlogscore=301
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110065
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, linux-mm@kvack.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, linux@armlinux.org.uk, geert@linux-m68k.org, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, kernel-team@meta.com, richard.henderson@linaro.org, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, glaubitz@physik.fu-berlin.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 10, 2023 at 12:58:06PM -0700, Nhat Pham wrote:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
> 
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
> 
> This patch wires cachestat in for all the other architectures.
> 
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
...
>  arch/s390/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
