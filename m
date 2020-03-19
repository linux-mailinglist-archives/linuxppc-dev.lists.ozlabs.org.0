Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D418AD76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 08:46:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jf9H2kzYzDr9P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jf7d1xy7zDr7C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 18:44:44 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0E7E9AE3A;
 Thu, 19 Mar 2020 07:44:38 +0000 (UTC)
Date: Thu, 19 Mar 2020 08:44:36 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christopher Lameter <cl@linux.com>
Subject: Re: [PATCH v2 3/4] mm: Implement reset_numa_mem
Message-ID: <20200319074436.GX21362@dhcp22.suse.cz>
References: <20200318072810.9735-1-srikar@linux.vnet.ibm.com>
 <20200318072810.9735-4-srikar@linux.vnet.ibm.com>
 <alpine.DEB.2.21.2003181919450.18605@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003181919450.18605@www.lameter.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 18-03-20 19:20:41, Cristopher Lameter wrote:
> On Wed, 18 Mar 2020, Srikar Dronamraju wrote:
> 
> > For a memoryless or offline nodes, node_numa_mem refers to a N_MEMORY
> > fallback node. Currently kernel has an API set_numa_mem that sets
> > node_numa_mem for memoryless node. However this API cannot be used for
> > offline nodes. Hence all offline nodes will have their node_numa_mem set
> > to 0. However systems can themselves have node 0 as offline i.e
> 
> That is a significant change to the basic assumptions for memory less
> nodes. Node 0 needed to have memory and processors. Not sure what else
> may break.

This assumption is simply incorrect. There many examples but just
one from top of my head 3e8589963773 ("memcg: make it work on sparse
non-0-node systems"). We simply have to forget that some nodes are
special.
-- 
Michal Hocko
SUSE Labs
