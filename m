Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27B3D7E5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 21:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ64Q1zgxz3bfl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 05:17:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XtVP3aKZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XtVP3aKZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ63v12bFz2yfg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 05:16:58 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16RJCSEB017230; Tue, 27 Jul 2021 15:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=S9WrCfkjSuekFZGHC4uhqiuih4pXzbHlc84xouUPS30=;
 b=XtVP3aKZR9Z1pNXNGsp2zrrSA1oIVqlmYRUJPfycxAbVOkY5aZf+STUn9HLRwdindj3l
 KayU7gSPFJF6TUFinKMIcypSlccNbLBBnSnc5ruZiyqnwmDoIislOsDVW4Te5vaOGJgZ
 b7kywMaOLrCGDMZRY+uKUt0OzvUQ34KEsan0jAdmN9/yBt+/+HMJBKo75rsn7qBS8mun
 gUQarU41NbCVnlybtddgQtb3CoZX8pZTDN0LmYM7pXhSRrMOgI/YBhMS1NwBf8j2iz9x
 emQXUe5DEH1yYeh2sRn1AWomHCowoydRrg2Gdsd2bZqQNw5BzKMv2r6i+GFg1iZ0otVG Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a2qtvg9j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 15:16:01 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16RJFBjg028792;
 Tue, 27 Jul 2021 15:16:00 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a2qtvg9h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 15:16:00 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RIumuQ029158;
 Tue, 27 Jul 2021 19:15:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3a235kgdeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 19:15:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16RJFthW28377476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 19:15:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF014A405F;
 Tue, 27 Jul 2021 19:15:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD9DBA4057;
 Tue, 27 Jul 2021 19:15:53 +0000 (GMT)
Received: from osiris (unknown [9.145.19.157])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Jul 2021 19:15:53 +0000 (GMT)
Date: Tue, 27 Jul 2021 21:15:52 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v5 4/6] mm: simplify compat numa syscalls
Message-ID: <YQBbaNqfBzX+pf1t@osiris>
References: <20210727144859.4150043-1-arnd@kernel.org>
 <20210727144859.4150043-5-arnd@kernel.org>
 <YQBB9yteAwtG2xyp@osiris>
 <CAK8P3a3itgCyc4jDBodTOcwG+XXsDYspZqQVBmy88cGXevY5Yw@mail.gmail.com>
 <YQBSpxZR4P/Phpf1@osiris>
 <CAK8P3a0WT36Lg4nRBWx_kqb9yKj0mHx8gTdzCsDfrx1tQSEqbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0WT36Lg4nRBWx_kqb9yKj0mHx8gTdzCsDfrx1tQSEqbA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -XM2aaOHmahf3GNtvPV0YNUK2TjKX7f3
X-Proofpoint-ORIG-GUID: TkiykJPEd5k1niuESQpMFCol9mhqnTsf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_13:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=984 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270113
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
Cc: Feng Tang <feng.tang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021 at 08:49:40PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 27, 2021 at 8:38 PM Heiko Carstens <hca@linux.ibm.com> wrote:
> >
> > -268  common    mbind                   sys_mbind                       compat_sys_mbind
> > -269  common    get_mempolicy           sys_get_mempolicy               compat_sys_get_mempolicy
> > -270  common    set_mempolicy           sys_set_mempolicy               compat_sys_set_mempolicy
> > +268  common    mbind                   sys_mbind                       sys_mbind
> > +269  common    get_mempolicy           sys_get_mempolicy               sys_get_mempolicy
> > +270  common    set_mempolicy           sys_set_mempolicy               sys_set_mempolicy
> >
> > would remove compat_ptr() conversion from nmask above if I'm not mistaken.
> 
> Maybe I'm misremembering how compat syscalls work on s390. Doesn't
> SYSCALL_DEFINEx(sys_mbind) still create two entry points __s390x_sys_mbind()
> and __s390_sys_mbind() with different argument conversion (__SC_CAST vs
> __SC_COMPAT_CAST)? I thought that was the whole point of the macros.

You are remembering correctly, probably because you implemented it ;)
I totally forgot - sorry for the noise!
