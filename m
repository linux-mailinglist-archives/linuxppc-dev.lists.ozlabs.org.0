Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2A189A31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 12:03:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j6bt29swzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 22:03:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j6ZG3rKYzDqrN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 22:02:28 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IB1VuD116891
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 07:02:25 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7d9ddy2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 07:02:25 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 18 Mar 2020 11:02:23 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 11:02:20 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IB2I8g38207562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 11:02:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B48C24204F;
 Wed, 18 Mar 2020 11:02:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73A7B4204C;
 Wed, 18 Mar 2020 11:02:16 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 18 Mar 2020 11:02:16 +0000 (GMT)
Date: Wed, 18 Mar 2020 16:32:15 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v2 1/4] mm: Check for node_online in node_present_pages
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
 <20200318072810.9735-2-srikar@linux.vnet.ibm.com>
 <20200318100256.GH21362@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200318100256.GH21362@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20031811-0008-0000-0000-0000035F48CF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031811-0009-0000-0000-00004A80A2E9
Message-Id: <20200318110215.GC27520@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180052
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Mel Gorman <mgorman@suse.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Hocko <mhocko@suse.com> [2020-03-18 11:02:56]:

> On Wed 18-03-20 12:58:07, Srikar Dronamraju wrote:
> > Calling a kmalloc_node on a possible node which is not yet onlined can
> > lead to panic. Currently node_present_pages() doesn't verify the node is
> > online before accessing the pgdat for the node. However pgdat struct may
> > not be available resulting in a crash.
> >
> > NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
> > LR [c0000000003d5b94] __slab_alloc+0x34/0x60
> > Call Trace:
> > [c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
> > [c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
> > [c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
> > [c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
> > [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
> > [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
> > [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
> > [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
> > [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
> > [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
> > [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
> > [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
> >
> > Fix this by verifying the node is online before accessing the pgdat
> > structure. Fix the same for node_spanned_pages() too.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: linux-mm@kvack.org
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > Cc: Michal Hocko <mhocko@kernel.org>
> > Cc: Christopher Lameter <cl@linux.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > Cc: Bharata B Rao <bharata@linux.ibm.com>
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> >
> > Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  include/linux/mmzone.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index f3f264826423..88078a3b95e5 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -756,8 +756,10 @@ typedef struct pglist_data {
> >  	atomic_long_t		vm_stat[NR_VM_NODE_STAT_ITEMS];
> >  } pg_data_t;
> >
> > -#define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
> > -#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> > +#define node_present_pages(nid)		\
> > +	(node_online(nid) ? NODE_DATA(nid)->node_present_pages : 0)
> > +#define node_spanned_pages(nid)		\
> > +	(node_online(nid) ? NODE_DATA(nid)->node_spanned_pages : 0)
>
> I believe this is a wrong approach. We really do not want to special
> case all the places which require NODE_DATA. Can we please go and
> allocate pgdat for all possible nodes?
>

I can do that but the question I had was should we make this change just for
Powerpc or should the change be for other archs.

NODE_DATA initialization always seems to be in arch specific code.

The other archs that are affected seem to be mips, sh and sparc
These archs seem to have making an assumption that NODE_DATA has to be local
only,

For example on sparc / arch/sparc/mm/init_64.c in allocate_node_data function.

  NODE_DATA(nid) = memblock_alloc_node(sizeof(struct pglist_data),
                                             SMP_CACHE_BYTES, nid);
        if (!NODE_DATA(nid)) {
                prom_printf("Cannot allocate pglist_data for nid[%d]\n", nid);
                prom_halt();
        }

        NODE_DATA(nid)->node_id = nid;

So even if I make changes to allocate NODE_DATA from fallback node, I may not
be able to test them.

So please let me know your thoughts around the same.

> The current state of memory less hacks subtle bugs poping up here and
> there just prove that we should have done that from the very begining
> IMHO.
>
> >  #ifdef CONFIG_FLAT_NODE_MEM_MAP
> >  #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
> >  #else
> > --
> > 2.18.1
>
> --
> Michal Hocko
> SUSE Labs
>

--
Thanks and Regards
Srikar Dronamraju

