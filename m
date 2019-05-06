Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7014703
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:03:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yGxW4PSJzDqHn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:03:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yGw93Dm5zDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 19:02:31 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 90E2F68AFE; Mon,  6 May 2019 11:02:10 +0200 (CEST)
Date: Mon, 6 May 2019 11:02:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Message-ID: <20190506090210.GA2064@lst.de>
References: <20190426124917.23789-1-hch@lst.de>
 <20190426124917.23789-2-hch@lst.de>
 <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 06, 2019 at 10:46:11AM +0200, Frederic Barrat wrote:
> Hi,
>
> The PCI p2p and tunnel code is used by the Mellanox CX5 driver, at least 
> their latest, out of tree version, which is used for CORAL. My 
> understanding is that they'll upstream it at some point, though I don't 
> know what their schedule is like.

As said before, we only keep exports in tree for in-tree users.  If the
CX5 driver grows special P2P support it will have to use the proper
existing kernel infrastructure for that anyway.
