Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDB01314D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:36:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wbpG0hpFzDqsC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 01:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wbmn6jmNzDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 01:35:21 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x43FZBDB027504;
 Fri, 3 May 2019 10:35:11 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x43FZAMT027503;
 Fri, 3 May 2019 10:35:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 3 May 2019 10:35:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stewart Smith <stewart@linux.ibm.com>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190503153510.GO8599@gate.crashing.org>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <20190502042702.GH13618@umbus.fritz.box> <87bm0ktn1q.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bm0ktn1q.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2019 at 10:10:57AM +1000, Stewart Smith wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> > On Wed, May 01, 2019 at 01:42:21PM +1000, Alexey Kardashevskiy wrote:
> >> At the moment, on 256CPU + 256 PCI devices guest, it takes the guest
> >> about 8.5sec to fetch the entire device tree via the client interface
> >> as the DT is traversed twice - for strings blob and for struct blob.
> >> Also, "getprop" is quite slow too as SLOF stores properties in a linked
> >> list.
> >> 
> >> However, since [1] SLOF builds flattened device tree (FDT) for another
> >> purpose. [2] adds a new "fdt-fetch" client interface for the OS to fetch
> >> the FDT.
> >> 
> >> This tries the new method; if not supported, this falls back to
> >> the old method.
> >> 
> >> There is a change in the FDT layout - the old method produced
> >> (reserved map, strings, structs), the new one receives only strings and
> >> structs from the firmware and adds the final reserved map to the end,
> >> so it is (fw reserved map, strings, structs, reserved map).
> >> This still produces the same unflattened device tree.
> >> 
> >> This merges the reserved map from the firmware into the kernel's reserved
> >> map. At the moment SLOF generates an empty reserved map so this does not
> >> change the existing behaviour in regard of reservations.
> >> 
> >> This supports only v17 onward as only that version provides dt_struct_size
> >> which works as "fdt-fetch" only produces v17 blobs.
> >> 
> >> If "fdt-fetch" is not available, the old method of fetching the DT is used.
> >> 
> >> [1] https://git.qemu.org/?p=SLOF.git;a=commitdiff;h=e6fc84652c9c00
> >> [2] https://git.qemu.org/?p=SLOF.git;a=commit;h=ecda95906930b80
> >> 
> >> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >
> > Hrm.  I've gotta say I'm not terribly convinced that it's worth adding
> > a new interface we'll need to maintain to save 8s on a somewhat
> > contrived testcase.
> 
> 256CPUs aren't that many anymore though. Although I guess that many PCI
> devices is still a little uncommon.
> 
> A 4 socket POWER8 or POWER9 can easily be that large, and a small test
> kernel/userspace will boot in ~2.5-4 seconds. So it's possible that
> the device tree fetch could be surprisingly non-trivial percentage of boot
> time at least on some machines.

All client interface calls are really heavy, and you need to do a lot of
them if you have a big device tree.  This takes time, even if the linked
list stuff does not kill you :-)


Segher
