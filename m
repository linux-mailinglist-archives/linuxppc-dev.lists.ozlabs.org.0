Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42069A874B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 20:37:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nsy15sShzDqxq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 04:37:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nsvx2sMczDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 04:35:56 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30F66AC0C;
 Wed,  4 Sep 2019 18:35:52 +0000 (UTC)
Date: Wed, 4 Sep 2019 20:35:51 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/fadump: when fadump is supported register
 the fadump sysfs files.
Message-ID: <20190904203551.5b06abb6@naga>
In-Reply-To: <15be95b0-4cb2-1cf1-2fc1-ec313b9aa6f0@linux.ibm.com>
References: <e7fad352-48f3-f01d-1b19-a589a3b95c07@linux.ibm.com>
 <20190828172742.18378-1-msuchanek@suse.de>
 <15be95b0-4cb2-1cf1-2fc1-ec313b9aa6f0@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Yangtao Li <tiny.windzz@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Hari Bathini <hbathini@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Aug 2019 10:58:16 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> On 28/08/19 10:57 PM, Michal Suchanek wrote:
> > Currently it is not possible to distinguish the case when fadump is
> > supported by firmware and disabled in kernel and completely unsupported
> > using the kernel sysfs interface. User can investigate the devicetree
> > but it is more reasonable to provide sysfs files in case we get some
> > fadumpv2 in the future.
> > 
> > With this patch sysfs files are available whenever fadump is supported
> > by firmware.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---  
> 
> [...]
> 
> > -	if (!fw_dump.fadump_supported) {
> > +	if (!fw_dump.fadump_supported && fw_dump.fadump_enabled) {
> >  		printk(KERN_ERR "Firmware-assisted dump is not supported on"
> >  			" this hardware\n");
> > -		return 0;
> >  	}  
> 
> The above hunk is redundant with similar message already logged during
> early boot in fadump_reserve_mem() function. I am not strongly against
> this though. So...

I see this:
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] Firmware-assisted dump is not supported on this hardware
[    0.000000] Reserving 256MB of memory at 128MB for crashkernel (System RAM: 8192MB)
[    0.000000] Allocated 5832704 bytes for 2048 pacas at c000000007a80000
[    0.000000] Page sizes from device-tree:
[    0.000000] base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] Page orders: linear mapping = 16, virtual = 16, io = 16, vmemmap = 16
[    0.000000] Using 1TB segments
[    0.000000] Initializing hash mmu with SLB

Clearly the second message is logged from the above code. The duplicate
is capitalized: "Firmware-Assisted Dump is not supported on this
hardware" and I don't see it logged. So if anything is duplicate that
should be removed it is the message in fadump_reserve_mem(). It is not
clear why that one is not seen, though.

Thanks

Michal
