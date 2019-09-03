Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D8A6173
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 08:30:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mxrw1ylRzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 16:30:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mxlk3kJczDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 16:25:37 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x836MepX098850
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Sep 2019 02:25:34 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ushh3adxq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 02:25:34 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 3 Sep 2019 07:25:32 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 07:25:27 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x836PQg359244784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 06:25:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBAC85204F;
 Tue,  3 Sep 2019 06:25:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 28F7152050;
 Tue,  3 Sep 2019 06:25:26 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 021B4A00EC;
 Tue,  3 Sep 2019 16:25:22 +1000 (AEST)
Subject: Re: [PATCH v2 4/6] powerpc: Chunk calls to flush_dcache_range in
 arch_*_memory
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Tue, 03 Sep 2019 16:25:21 +1000
In-Reply-To: <3bde4dbc-5176-0df5-a0bf-993eef2a333b@c-s.fr>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
 <20190903052407.16638-5-alastair@au1.ibm.com>
 <3bde4dbc-5176-0df5-a0bf-993eef2a333b@c-s.fr>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090306-0016-0000-0000-000002A5F6ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090306-0017-0000-0000-000033065C00
Message-Id: <f49d3a861ecd35b5c62ea1cd96a88751a3ad3649.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030070
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

On Tue, 2019-09-03 at 08:19 +0200, Christophe Leroy wrote:
> 
> Le 03/09/2019 à 07:23, Alastair D'Silva a écrit :
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
> >   arch/powerpc/mm/mem.c | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index cd540123874d..854aaea2c6ae 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -104,11 +104,14 @@ int __weak remove_section_mapping(unsigned
> > long start, unsigned long end)
> >   	return -ENODEV;
> >   }
> >   
> > +#define FLUSH_CHUNK_SIZE SZ_1G
> 
> Maybe the name is a bit long for a local define. See if we could
> reduce 
> code line splits below by shortening this name.
> 
> > +
> >   int __ref arch_add_memory(int nid, u64 start, u64 size,
> >   			struct mhp_restrictions *restrictions)
> >   {
> >   	unsigned long start_pfn = start >> PAGE_SHIFT;
> >   	unsigned long nr_pages = size >> PAGE_SHIFT;
> > +	u64 i;
> >   	int rc;
> >   
> >   	resize_hpt_for_hotplug(memblock_phys_mem_size());
> > @@ -120,7 +123,12 @@ int __ref arch_add_memory(int nid, u64 start,
> > u64 size,
> >   			start, start + size, rc);
> >   		return -EFAULT;
> >   	}
> > -	flush_dcache_range(start, start + size);
> > +
> > +	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
> > +		flush_dcache_range(start + i,
> > +				   min(start + size, start + i +
> > FLUSH_CHUNK_SIZE));
> 
> My eyes don't like it.
> 
> What about
> 	for (; i < size; i += FLUSH_CHUNK_SIZE) {
> 		int len = min(size - i, FLUSH_CHUNK_SIZE);
> 
> 		flush_dcache_range(start + i, start + i + len);
> 		cond_resched();
> 	}
> 
> or
> 
> 	end = start + size;
> 	for (; start < end; start += FLUSH_CHUNK_SIZE, size -=
> FLUSH_CHUNK_SIZE) {
> 		int len = min(size, FLUSH_CHUNK_SIZE);
> 
> 		flush_dcache_range(start, start + len);
> 		cond_resched();
> 	}
> 
> > +		cond_resched();
> > +	}
> >   
> >   	return __add_pages(nid, start_pfn, nr_pages, restrictions);
> >   }
> > @@ -131,13 +139,19 @@ void __ref arch_remove_memory(int nid, u64
> > start, u64 size,
> >   	unsigned long start_pfn = start >> PAGE_SHIFT;
> >   	unsigned long nr_pages = size >> PAGE_SHIFT;
> >   	struct page *page = pfn_to_page(start_pfn) +
> > vmem_altmap_offset(altmap);
> > +	u64 i;
> >   	int ret;
> >   
> >   	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
> >   
> >   	/* Remove htab bolted mappings for this section of memory */
> >   	start = (unsigned long)__va(start);
> > -	flush_dcache_range(start, start + size);
> > +	for (i = 0; i < size; i += FLUSH_CHUNK_SIZE) {
> > +		flush_dcache_range(start + i,
> > +				   min(start + size, start + i +
> > FLUSH_CHUNK_SIZE));
> > +		cond_resched();
> > +	}
> > +
> 
> This piece of code looks pretty similar to the one before. Can we 
> refactor into a small helper ?
> 

Not much point, it's removed in a subsequent patch.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

