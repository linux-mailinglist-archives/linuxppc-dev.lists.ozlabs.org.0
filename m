Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98F4E37D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 11:26:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VYGD10g7zDqlm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 19:26:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VYDS1pTQzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 19:24:39 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0F90068C4E; Fri, 21 Jun 2019 11:24:07 +0200 (CEST)
Date: Fri, 21 Jun 2019 11:24:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH 2/4] powerpc/powernv: remove the unused tunneling exports
Message-ID: <20190621092406.GA18894@lst.de>
References: <20190523074924.19659-1-hch@lst.de>
 <20190523074924.19659-3-hch@lst.de>
 <CAOSf1CFu_T=7weW0eagzjTc8474ntVx1uCKdQh8sX85bfaPxCQ@mail.gmail.com>
 <048e1242-a6ea-5d56-dc9a-e16f9eedf6d9@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048e1242-a6ea-5d56-dc9a-e16f9eedf6d9@linux.ibm.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2019 at 11:21:38AM +0200, Frederic Barrat wrote:
> The as-notify can be used in both CAPI mode and PCI mode. In capi mode, 
> it's integrated in the capi protocol, so the cxl driver doesn't need to do 
> extra setup, compared to what's already done to activate capi.
> As mentioned in a previous iteration of that patchset, those APIs are to be 
> used by the Mellanox CX5 driver. The in-tree driver is always a step behind 
> their latest, but word is they are working on upstreaming those 
> interactions.

We can review them together with the driver.  Especially as we need to
consider if we even want to support it if there is no generic platform
independent inferface.
