Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C772EFD37
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 03:55:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DCPj16cL8zDqvV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 13:55:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=alpha.franken.de
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DCKnF71WNzDr95
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 10:58:40 +1100 (AEDT)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1ky1e2-0007pu-00; Sat, 09 Jan 2021 00:58:14 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 804DDC086F; Sat,  9 Jan 2021 00:58:05 +0100 (CET)
Date: Sat, 9 Jan 2021 00:58:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Message-ID: <20210108235805.GA17543@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
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

On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> Hi Thomas,
> 
> 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> 
> Any idea what could be happening?

not yet, kernel crash log of a Malta QEMU is below.

Thomas.

Kernel bug detected[#1]:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc1-00017-gccb21774863a #2
$ 0   : 00000000 00000001 00000000 00000010
$ 4   : 00000001 000005cf 9e00059f 00000000
$ 8   : 00118173 809e6db8 9e00059f 00000000
$12   : 82023c00 00000001 810da04c 0212422f
$16   : 810da000 00027800 000005cf 80b4bf9c
$20   : 809e968c 82602400 810da000 0000000b
$24   : 021558f9 00000000                  
$28   : 820e0000 820e3928 80b10000 802710d0
Hi    : 0000346c
Lo    : 000002dd
epc   : 80271114 __kmap_local_pfn_prot+0x78/0x1c0
ra    : 802710d0 __kmap_local_pfn_prot+0x34/0x1c0
Status: 1000a403	KERNEL EXL IE 
Cause : 00800034 (ExcCode 0d)
PrId  : 0001a800 (MIPS P5600)
Modules linked in:
Process swapper/0 (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=00000000)
Stack : 7fffffff 820c2408 820e3990 ffffff04 ffff0a00 80518224 000081a4 810da000
        00000001 000005cf fff64000 8011c77c 820e3b26 ffffff04 ffff0a00 80518440
        80b30000 80b4bf64 9e0005cf 000005cf fff64000 80271188 00000000 820e3a60
        80b10000 80194478 0000005e 80954406 809e0000 810da000 00000001 000005cf
        fff68000 8011c77c 8088fd44 809f6074 000000f4 00000000 00000000 80b4bf68
        ...
Call Trace:
[<80271114>] __kmap_local_pfn_prot+0x78/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<8011c77c>] __update_cache+0x16c/0x174
[<80271188>] __kmap_local_pfn_prot+0xec/0x1c0
[<802c49a0>] copy_string_kernel+0x168/0x264
[<802c5d18>] kernel_execve+0xd0/0x164
[<801006cc>] try_to_run_init_process+0x18/0x5c
[<80859e0c>] kernel_init+0xd0/0x120
[<801037f8>] ret_from_kernel_thread+0x14/0x1c

Code: 8c630564  28640010  38840001 <00040336> 8f82000c  2463ffff  00021100  00431021  2403ffbf 

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
