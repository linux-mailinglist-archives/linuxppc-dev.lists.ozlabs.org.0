Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4E18364F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 17:38:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dZKB52X6zDqSp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 03:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dZHR2yxJzDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 03:37:22 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CG46R8141698; Thu, 12 Mar 2020 12:09:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqr96rgq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 12:09:55 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02CG4BdJ142095;
 Thu, 12 Mar 2020 12:09:04 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqr96rf7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 12:09:01 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02CG1mo4012262;
 Thu, 12 Mar 2020 16:07:06 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 2ypjxrhkj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 16:07:06 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02CG75pa13763468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 16:07:05 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59613124055;
 Thu, 12 Mar 2020 16:07:05 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D8D312405C;
 Thu, 12 Mar 2020 16:07:05 +0000 (GMT)
Received: from localhost (unknown [9.41.179.32])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Mar 2020 16:07:05 +0000 (GMT)
Date: Thu, 12 Mar 2020 11:07:04 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [RFC PATCH v1] pseries/drmem: don't cache node id in drmem_lmb
 struct
Message-ID: <20200312160704.cmmo7titbh7u4jia@rascal.austin.ibm.com>
References: <20200311230815.1432367-1-cheloha@linux.ibm.com>
 <20200312050237.GP1776@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200312050237.GP1776@kitsune.suse.cz>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_09:2020-03-11,
 2020-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120083
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Fontenont <ndfont@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michal,

On Thu, Mar 12, 2020 at 06:02:37AM +0100, Michal Suchánek wrote:
> On Wed, Mar 11, 2020 at 06:08:15PM -0500, Scott Cheloha wrote:
> > At memory hot-remove time we can retrieve an LMB's nid from its
> > corresponding memory_block.  There is no need to store the nid
> > in multiple locations.
> > 
> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> > ---
> > The linear search in powerpc's memory_add_physaddr_to_nid() has become a
> > bottleneck at boot on systems with many LMBs.
> > 
> > As described in this patch here:
> > 
> > https://lore.kernel.org/linuxppc-dev/20200221172901.1596249-2-cheloha@linux.ibm.com/
> > 
> > the linear search seriously cripples drmem_init().
> > 
> > The obvious solution (shown in that patch) is to just make the search
> > in memory_add_physaddr_to_nid() faster.  An XArray seems well-suited
> > to the task of mapping an address range to an LMB object.
> > 
> > The less obvious approach is to just call memory_add_physaddr_to_nid()
> > in fewer places.
> > 
> > I'm not sure which approach is correct, hence the RFC.
> 
> You basically revert the below which will likely cause the very error
> that was fixed there:
> 
> commit b2d3b5ee66f2a04a918cc043cec0c9ed3de58f40
> Author: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> Date:   Tue Oct 2 10:35:59 2018 -0500
> 
>     powerpc/pseries: Track LMB nid instead of using device tree
>     
>     When removing memory we need to remove the memory from the node
>     it was added to instead of looking up the node it should be in
>     in the device tree.
>     
>     During testing we have seen scenarios where the affinity for a
>     LMB changes due to a partition migration or PRRN event. In these
>     cases the node the LMB exists in may not match the node the device
>     tree indicates it belongs in. This can lead to a system crash
>     when trying to DLPAR remove the LMB after a migration or PRRN
>     event. The current code looks up the node in the device tree to
>     remove the LMB from, the crash occurs when we try to offline this
>     node and it does not have any data, i.e. node_data[nid] == NULL.

I'm aware of this patch and that this is a near-total revert.

I'm not reintroducing the original behavior, though.  Instead of going
to the device tree to recompute the expected node id I'm retrieving it
from the LMB's corresponding memory_block.

That crucial difference is this chunk:

--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -376,25 +376,29 @@ static int dlpar_add_lmb(struct drmem_lmb *);
 
 static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 {
+	struct memory_block *mem_block;
 	unsigned long block_sz;
 	int rc;
 
 	if (!lmb_is_removable(lmb))
 		return -EINVAL;
 
+	mem_block = lmb_to_memblock(lmb);
+	if (mem_block == NULL)
+		return -EINVAL;
+
 	rc = dlpar_offline_lmb(lmb);
 	if (rc)
 		return rc;
 
 	block_sz = pseries_memory_block_size();
 
-	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
+	__remove_memory(mem_block->nid, lmb->base_addr, block_sz);
 
 	/* Update memory regions for memory remove */
 	memblock_remove(lmb->base_addr, block_sz);
 
 	invalidate_lmb_associativity_index(lmb);
-	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 
 	return 0;
---

Unless it's possible that the call:

	__add_memory(my_nid, my_addr, my_size);

does not yield the following:

	memory_block.nid == my_nid

on success, then I think the solution in my patch is equivalent to and
simpler than the one introduced in the patch you quote.

Can you see a way the above would not hold?

Then again, maybe there's a good reason not to retrieve the node id in
this way.  I'm thinking David Hildenbrand and/or Nathan Fontenont may
have some insight on that.
