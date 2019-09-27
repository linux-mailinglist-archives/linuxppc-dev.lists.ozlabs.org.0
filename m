Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B5BFF5A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 08:48:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fj6z5dByzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 16:48:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fj5N0GFQzDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 16:47:03 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8R6kiqu026902
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 02:46:59 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9byptg1j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 02:46:58 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 27 Sep 2019 07:46:56 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 07:46:50 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8R6knIB54460588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 06:46:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6546EA408A;
 Fri, 27 Sep 2019 06:46:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C17CDA4093;
 Fri, 27 Sep 2019 06:46:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 06:46:48 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2E6A4A00F9;
 Fri, 27 Sep 2019 16:46:46 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Mark Marshall <markmarshall14@gmail.com>
Date: Fri, 27 Sep 2019 16:46:46 +1000
In-Reply-To: <CAD4b4WLdMgunRoBDVtNZbhaMPbMw57AbcJgkKfmy2zpshgVyqQ@mail.gmail.com>
References: <20190926045419.22827-1-alastair@au1.ibm.com>
 <20190926045419.22827-6-alastair@au1.ibm.com>
 <CAD4b4WLdMgunRoBDVtNZbhaMPbMw57AbcJgkKfmy2zpshgVyqQ@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092706-0020-0000-0000-0000037232A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092706-0021-0000-0000-000021C8019F
Message-Id: <a3f037f14e50ab6c6ee5b50fcc4e2f6eb8151613.camel@au1.ibm.com>
Subject: RE: [PATCH v4 5/6] powerpc: Chunk calls to flush_dcache_range in
 arch_*_memory
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270062
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-09-27 at 08:37 +0200, Mark Marshall wrote:
> Comment below...
> 
> On Thu, 26 Sep 2019 at 12:18, Alastair D'Silva <alastair@au1.ibm.com>
> wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > When presented with large amounts of memory being hotplugged
> > (in my test case, ~890GB), the call to flush_dcache_range takes
> > a while (~50 seconds), triggering RCU stalls.
> > 
> > This patch breaks up the call into 1GB chunks, calling
> > cond_resched() inbetween to allow the scheduler to run.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >  arch/powerpc/mm/mem.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index cff947cb2a84..a2758e473d58 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -104,6 +104,27 @@ int __weak remove_section_mapping(unsigned
> > long start, unsigned long end)
> >         return -ENODEV;
> >  }
> > 
> > +#define FLUSH_CHUNK_SIZE SZ_1G
> > +/**
> > + * flush_dcache_range_chunked(): Write any modified data cache
> > blocks out to
> > + * memory and invalidate them, in chunks of up to FLUSH_CHUNK_SIZE
> > + * Does not invalidate the corresponding instruction cache blocks.
> > + *
> > + * @start: the start address
> > + * @stop: the stop address (exclusive)
> > + * @chunk: the max size of the chunks
> > + */
> > +static void flush_dcache_range_chunked(unsigned long start,
> > unsigned long stop,
> > +                                      unsigned long chunk)
> > +{
> > +       unsigned long i;
> > +
> > +       for (i = start; i < stop; i += FLUSH_CHUNK_SIZE) {
> Here you ignore the function parameter "chunk" and use the define
> FLUSH_CHUNK_SIZE.
> You should do one or the other; use the parameter or remove it.

Good catch, thankyou :)

> > +               flush_dcache_range(i, min(stop, start +
> > FLUSH_CHUNK_SIZE));
> > +               cond_resched();
> > +       }
> > +}
> > +
> >  int __ref arch_add_memory(int nid, u64 start, u64 size,
> >                         struct mhp_restrictions *restrictions)
> >  {
> > @@ -120,7 +141,8 @@ int __ref arch_add_memory(int nid, u64 start,
> > u64 size,
> >                         start, start + size, rc);
> >                 return -EFAULT;
> >         }
> > -       flush_dcache_range(start, start + size);
> > +
> > +       flush_dcache_range_chunked(start, start + size,
> > FLUSH_CHUNK_SIZE);
> > 
> >         return __add_pages(nid, start_pfn, nr_pages, restrictions);
> >  }
> > @@ -137,7 +159,8 @@ void __ref arch_remove_memory(int nid, u64
> > start, u64 size,
> > 
> >         /* Remove htab bolted mappings for this section of memory
> > */
> >         start = (unsigned long)__va(start);
> > -       flush_dcache_range(start, start + size);
> > +       flush_dcache_range_chunked(start, start + size,
> > FLUSH_CHUNK_SIZE);
> > +
> >         ret = remove_section_mapping(start, start + size);
> >         WARN_ON_ONCE(ret);
> > 
> > --
> > 2.21.0
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

