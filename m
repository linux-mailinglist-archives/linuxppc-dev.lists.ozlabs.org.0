Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4310AAD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 07:54:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NBNF0NjMzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 17:54:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NBLP1vxGzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 17:53:16 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR6pij1082467
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 01:53:13 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxr45bm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 01:53:13 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 27 Nov 2019 06:53:10 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Nov 2019 06:53:07 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAR6qQR448628122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 06:52:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A65AA4054;
 Wed, 27 Nov 2019 06:53:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37B7BA405B;
 Wed, 27 Nov 2019 06:53:03 +0000 (GMT)
Received: from in.ibm.com (unknown [9.124.35.39])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Nov 2019 06:53:03 +0000 (GMT)
Date: Wed, 27 Nov 2019 12:23:00 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v11 1/7] mm: ksm: Export ksm_madvise()
References: <20191125030631.7716-1-bharata@linux.ibm.com>
 <20191125030631.7716-2-bharata@linux.ibm.com>
 <alpine.LSU.2.11.1911261834380.1600@eggly.anvils>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.11.1911261834380.1600@eggly.anvils>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19112706-4275-0000-0000-00000386EB10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112706-4276-0000-0000-0000389A783E
Message-Id: <20191127065300.GE23438@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_01:2019-11-26,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=539
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270055
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
Reply-To: bharata@linux.ibm.com
Cc: Andrea Arcangeli <aarcange@redhat.com>, linuxram@us.ibm.com,
 cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 07:59:49PM -0800, Hugh Dickins wrote:
> On Mon, 25 Nov 2019, Bharata B Rao wrote:
> 
> > On PEF-enabled POWER platforms that support running of secure guests,
> > secure pages of the guest are represented by device private pages
> > in the host. Such pages needn't participate in KSM merging. This is
> > achieved by using ksm_madvise() call which need to be exported
> > since KVM PPC can be a kernel module.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > Acked-by: Paul Mackerras <paulus@ozlabs.org>
> > Cc: Andrea Arcangeli <aarcange@redhat.com>
> > Cc: Hugh Dickins <hughd@google.com>
> 
> I can say
> Acked-by: Hugh Dickins <hughd@google.com>
> to this one.
> 
> But not to your 2/7 which actually makes use of it: because sadly it
> needs down_write(&kvm->mm->mmap_sem) for the case when it switches off
> VM_MERGEABLE in vma->vm_flags.  That's frustrating, since I think it's
> the only operation for which down_read() is not good enough.

Oh ok! Thanks for pointing this out.

> 
> I have no idea how contended that mmap_sem is likely to be, nor how
> many to-be-secured pages that vma is likely to contain: you might find
> it okay simply to go with it down_write throughout, or you might want
> to start out with it down_read, and only restart with down_write (then
> perhaps downgrade_write later) when you see VM_MERGEABLE is set.

Using down_write throughtout is not easy as we do migrate_vma_pages()
from fault path (->migrate_to_ram()) too. Here we come with down_read
already held.

Starting with down_read and restarting with down_write if VM_MERGEABLE
is set -- this also looks a bit difficult as we will have challenges
with locking order if we release mmap_sem in between and re-acquire.

So I think I will start with down_write in this particular case
and will downgrade_write as soon as ksm_madvise() is complete.

> 
> The crash you got (thanks for the link): that will be because your
> migrate_vma_pages() had already been applied to a page that was
> already being shared via KSM.
> 
> But if these secure pages are expected to be few and far between,
> maybe you'd prefer to keep VM_MERGEABLE, and add per-page checks
> of some kind into mm/ksm.c, to skip over these surprising hybrids.

I did bail out from a few routines in mm/ksm.c with
is_device_private_page(page) check, but that wasn't good enough and
I encountered crashes in different code paths. Guess a bit more
understanding of KSM internals would be required before retrying that.

However since all the pages of the guest except for a few will be turned
into secure pages early during boot, it appears better if secure guests
don't participate in in KSM merging at all.

Regards,
Bharata.

