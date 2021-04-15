Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EF2360939
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 14:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLdkC2swDz2ysm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 22:21:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lqnNjMkD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lqnNjMkD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLdjn1CNmz2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 22:21:16 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FC3NUN037904; Thu, 15 Apr 2021 08:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=BJ8vT+zdtijIJ63F5bRpUZcIpEAXyB7xSiiu0EiR3AE=;
 b=lqnNjMkDdKOIVL9emzvdhra3fldjBHU/IOeopSt1uinqa1JfIVINDUkhZWf3dUdXLgXP
 5Cd6+opDn4W14eIXi+4RSA4lZ5lG/Hgm0myxACaCn9zTl4IBvaEZy6SawVvOsYN2McOZ
 y3v7ks+qYtAC2WI3Iw33EKRu7KLiIMFvb2r+F9gZVdCIj3b6szJfmeeDjc9bCew+pryD
 TVDPhVsS9q+bI0y9zNpLLvC8ZQ8Lcdy/WXGWjA0mUFjXprGZMClHofcNrwqSGEGZUsMz
 3EufkW6Zf/xnbygvhgrUBSbNDBu6xDoX8Xxp87yhHHzvn/KVh6CCXQIkYYv0sYXjZa/+ vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88j2vgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:20:55 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FC5j7G060273;
 Thu, 15 Apr 2021 08:20:55 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88j2vf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:20:55 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FCCeu1011734;
 Thu, 15 Apr 2021 12:20:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 37u3n8a33e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:20:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FCKoQB39911756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 12:20:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F12A052050;
 Thu, 15 Apr 2021 12:20:49 +0000 (GMT)
Received: from osiris (unknown [9.171.3.254])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 37F265204E;
 Thu, 15 Apr 2021 12:20:49 +0000 (GMT)
Date: Thu, 15 Apr 2021 14:20:48 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: consolidate the flock uapi definitions
Message-ID: <YHgvoCpqLrcbQETJ@osiris>
References: <20210412085545.2595431-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412085545.2595431-1-hch@lst.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GYiuXa6MwPoYPHEW5dNs6OA4IVhEE-Qd
X-Proofpoint-ORIG-GUID: WIGbMGvshmA6lDf2tv4RGrRtJ4XbrxTC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=762 clxscore=1011
 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150081
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 10:55:40AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> currently we deal with the slight differents in the various architecture
> variants of the flock and flock64 stuctures in a very cruft way.  This
> series switches to just use small arch hooks and define the rest in
> asm-generic and linux/compat.h instead.
> 
> Diffstat:
>  arch/arm64/include/asm/compat.h        |   20 --------------------
>  arch/mips/include/asm/compat.h         |   23 ++---------------------
>  arch/mips/include/uapi/asm/fcntl.h     |   28 +++-------------------------
>  arch/parisc/include/asm/compat.h       |   16 ----------------
>  arch/powerpc/include/asm/compat.h      |   20 --------------------
>  arch/s390/include/asm/compat.h         |   20 --------------------
>  arch/sparc/include/asm/compat.h        |   22 +---------------------
>  arch/x86/include/asm/compat.h          |   24 +++---------------------
>  include/linux/compat.h                 |   31 +++++++++++++++++++++++++++++++
>  include/uapi/asm-generic/fcntl.h       |   21 +++++++--------------
>  tools/include/uapi/asm-generic/fcntl.h |   21 +++++++--------------
>  11 files changed, 54 insertions(+), 192 deletions(-)

for the s390 bits:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
