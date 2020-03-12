Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BAA182803
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 06:04:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dGvc4bVczDqMV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 16:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dGsy3gY8zDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 16:02:43 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3646ADAA;
 Thu, 12 Mar 2020 05:02:38 +0000 (UTC)
Date: Thu, 12 Mar 2020 06:02:37 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [RFC PATCH v1] pseries/drmem: don't cache node id in drmem_lmb
 struct
Message-ID: <20200312050237.GP1776@kitsune.suse.cz>
References: <20200311230815.1432367-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311230815.1432367-1-cheloha@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Mar 11, 2020 at 06:08:15PM -0500, Scott Cheloha wrote:
> At memory hot-remove time we can retrieve an LMB's nid from its
> corresponding memory_block.  There is no need to store the nid
> in multiple locations.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
> The linear search in powerpc's memory_add_physaddr_to_nid() has become a
> bottleneck at boot on systems with many LMBs.
> 
> As described in this patch here:
> 
> https://lore.kernel.org/linuxppc-dev/20200221172901.1596249-2-cheloha@linux.ibm.com/
> 
> the linear search seriously cripples drmem_init().
> 
> The obvious solution (shown in that patch) is to just make the search
> in memory_add_physaddr_to_nid() faster.  An XArray seems well-suited
> to the task of mapping an address range to an LMB object.
> 
> The less obvious approach is to just call memory_add_physaddr_to_nid()
> in fewer places.
> 
> I'm not sure which approach is correct, hence the RFC.

You basically revert the below which will likely cause the very error
that was fixed there:

commit b2d3b5ee66f2a04a918cc043cec0c9ed3de58f40
Author: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Date:   Tue Oct 2 10:35:59 2018 -0500

    powerpc/pseries: Track LMB nid instead of using device tree
    
    When removing memory we need to remove the memory from the node
    it was added to instead of looking up the node it should be in
    in the device tree.
    
    During testing we have seen scenarios where the affinity for a
    LMB changes due to a partition migration or PRRN event. In these
    cases the node the LMB exists in may not match the node the device
    tree indicates it belongs in. This can lead to a system crash
    when trying to DLPAR remove the LMB after a migration or PRRN
    event. The current code looks up the node in the device tree to
    remove the LMB from, the crash occurs when we try to offline this
    node and it does not have any data, i.e. node_data[nid] == NULL.

Thanks

Michal
