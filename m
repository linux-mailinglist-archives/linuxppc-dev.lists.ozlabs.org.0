Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E0416626
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 21:46:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFlzW3QT4z3bmf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 05:46:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o2g9xUdg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rppt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o2g9xUdg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFlyn025Sz2ywr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 05:46:08 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NJW36f031236; 
 Thu, 23 Sep 2021 15:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=OlfxwL5SxCQJGsEygNnP+Bd9S5CycoibyIwI1T9qbFQ=;
 b=o2g9xUdg4iWokOSpifGukNkZK7jrG3PCnBFvuz4C7oP+gzjHDglARWvYTHBDYKWgrmUN
 nywTanPgUpTOTd5/xMfhi1L+mJwrCvVoKxej3UCLp5sG7C25GVynwAmr4q0nxjw5T5YF
 XfSS+haqO/MAAWW7EoLHEph+pIjpH8koxcOuzA2lkqyOwZ+Lt0jX5schDBGsmjxT7nCn
 nj0KpCKZ1MAIxT1dHKe+ArroeI/VY7R10b19vbUGLmbRaxdWWrC+tHtvcRU2gpGyiZee
 fQz965XLLMlLTgvc9SCxBhiIocufoeoMuCL9s+OrHLUbKOqWsHzC5EoSrMfU3XKh1xK9 Bg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8wkuupat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 15:45:58 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NJRuDe003688;
 Thu, 23 Sep 2021 19:45:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3b7q6kd587-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 19:45:56 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18NJjrxv44106172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 19:45:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A19734C04A;
 Thu, 23 Sep 2021 19:45:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 903DC4C05A;
 Thu, 23 Sep 2021 19:45:51 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.159.121])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Sep 2021 19:45:51 +0000 (GMT)
Date: Thu, 23 Sep 2021 22:45:49 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/3] memblock: cleanup memblock_free interface
Message-ID: <YUzZberbgZE+7HEo@linux.ibm.com>
References: <20210923074335.12583-1-rppt@kernel.org>
 <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NmcKtlYbna1qS7iyZ4wr-YnA7UP6mwwQ
X-Proofpoint-ORIG-GUID: NmcKtlYbna1qS7iyZ4wr-YnA7UP6mwwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_06,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=691 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109230115
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, iommu <iommu@lists.linux-foundation.org>,
 linux-usb@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 alpha <linux-alpha@vger.kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Linus,

On Thu, Sep 23, 2021 at 09:01:46AM -0700, Linus Torvalds wrote:
> On Thu, Sep 23, 2021 at 12:43 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> You need to be a LOT more careful.
> 
> From a trivial check - exactly because I looked at doing it with a
> script, and decided it's not so easy - I found cases like this:
> 
> -               memblock_free(__pa(paca_ptrs) + new_ptrs_size,
> +               memblock_free(paca_ptrs + new_ptrs_size,
> 
> which is COMPLETELY wrong.

I did use a coccinelle script that's slightly more robust that a sed you've
sent, but then I did a manual review, hence the two small patches with
fixes. Indeed I missed this one, so to be on the safe side I'll rename only
the obvious cases where coccinelle can be used reliably and leave all the
rest as it's now. If somebody cares enough they can update it later.
 
> And no, making the scripting just replace '__pa(x)' with '(void *)(x)'

These were actually manual and they are required for variables that
used as virtual addresses but have unsigned long type, like e.g.
initrd_start. So it's either __pa(x) or (void *).

-- 
Sincerely yours,
Mike.
