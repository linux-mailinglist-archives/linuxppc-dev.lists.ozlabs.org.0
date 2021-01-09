Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B94D02EFD3D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 03:57:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DCPl52KzVzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 13:57:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=alpha.franken.de
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DCLZb1sX6zDr95
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 11:34:31 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1ky2D2-0008AZ-00; Sat, 09 Jan 2021 01:34:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id AFC99C0870; Sat,  9 Jan 2021 01:33:52 +0100 (CET)
Date: Sat, 9 Jan 2021 01:33:52 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Message-ID: <20210109003352.GA18102@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108235805.GA17543@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 09 Jan 2021 13:54:00 +1100
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
Cc: juri.lelli@redhat.com, linux-aio@kvack.org, airlied@linux.ie,
 nouveau@lists.freedesktop.org, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 bsegall@google.com, jcmvbkbc@gmail.com, ray.huang@amd.com, paulus@samba.org,
 kraxel@redhat.com, sparclinux@vger.kernel.org, deanbo422@gmail.com, hch@lst.de,
 vincent.guittot@linaro.org, paulmck@kernel.org, x86@kernel.org,
 linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@kernel.org,
 peterz@infradead.org, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 airlied@redhat.com, linux-snps-arc@lists.infradead.org, linux-mm@kvack.org,
 mgorman@suse.de, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 intel-gfx@lists.freedesktop.org, sroland@vmware.com, josef@toxicpanda.com,
 rostedt@goodmis.org, torvalds@linuxfoundation.org, green.hu@gmail.com,
 rodrigo.vivi@intel.com, dsterba@suse.com, tglx@linutronix.de,
 virtualization@lists.linux-foundation.org, dietmar.eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu,
 nickhu@andestech.com, clm@fb.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com, bcrl@kvack.org,
 spice-devel@lists.freedesktop.org, vgupta@synopsys.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, bristot@redhat.com,
 davem@davemloft.net, linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
> On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> > Hi Thomas,
> > 
> > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> > 
> > Any idea what could be happening?
> 
> not yet, kernel crash log of a Malta QEMU is below.

update:

This dirty hack lets the Malta QEMU boot again:

diff --git a/mm/highmem.c b/mm/highmem.c
index c3a9ea7875ef..190cdda1149d 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 	pteval = pfn_pte(pfn, prot);
-	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
+	set_pte(kmap_pte - idx, pteval);
 	arch_kmap_local_post_map(vaddr, pteval);
 	current->kmap_ctrl.pteval[kmap_local_idx()] = pteval;
 	preempt_enable();

set_pte_at() tries to update cache and could do an kmap_atomic() there.
Not sure, if this is allowed at this point.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
