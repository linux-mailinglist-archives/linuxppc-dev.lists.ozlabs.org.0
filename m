Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422928570C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:26:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5fr35DgczDqKh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:26:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkK6RKFzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4C5fkK2rYCz9sTt; Wed,  7 Oct 2020 14:21:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkK0TDQz9sTm; Wed,  7 Oct 2020 14:21:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200916145122.3408129-1-cheloha@linux.ibm.com>
References: <20200916145122.3408129-1-cheloha@linux.ibm.com>
Subject: Re: [PATCH v4] pseries/hotplug-memory: hot-add: skip redundant LMB
 lookup
Message-Id: <160204083787.257875.8998297635560571.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:12 +1100 (AEDT)
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Sep 2020 09:51:22 -0500, Scott Cheloha wrote:
> During memory hot-add, dlpar_add_lmb() calls memory_add_physaddr_to_nid()
> to determine which node id (nid) to use when later calling __add_memory().
> 
> This is wasteful.  On pseries, memory_add_physaddr_to_nid() finds an
> appropriate nid for a given address by looking up the LMB containing the
> address and then passing that LMB to of_drconf_to_nid_single() to get the
> nid.  In dlpar_add_lmb() we get this address from the LMB itself.
> 
> [...]

Applied to powerpc/next.

[1/1] pseries/hotplug-memory: hot-add: skip redundant LMB lookup
      https://git.kernel.org/powerpc/c/72cdd117c449896c707fc6cfe5b90978160697d0

cheers
