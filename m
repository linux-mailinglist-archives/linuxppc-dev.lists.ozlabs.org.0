Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E90D5F0282
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 04:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdtlH2f4Yz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 12:02:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jD6yuYCP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mdtkk65HGz2xr1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 12:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jD6yuYCP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mdtkf2S4Rz4xDn;
	Fri, 30 Sep 2022 12:01:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664503290;
	bh=y/ZzcHj3m7ppYjfgllLZmaZ3OodsE5D5kgJOuPr05u8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jD6yuYCPy43qCovdOn/1NAr/vJUojhVdgtpXxwOlcQTGTqaefnyYwVv55pymF2rwj
	 tP6uTKhP4cN0z51jMKz2oy9jN3H0jNRlRsrishg/RNRal4TRFR2TzFWBahbsW7hxYw
	 gnslXG43mpCz6Vbes57wJ3HpgLh91EyaYu7+HU9J75uIIKvh71g9QrPVBNFt3O00fy
	 YIKw6N4Fltsj7eCo6pSRlw7FL0L66Yg5gQrEqRldinzsnF15S+cqXo8AHtHLq1uYvY
	 ejpfMdAAjbz+2hNM+jU7YDvP5dH8TLcW+JWf2/IRY8F3EuJsi+iyNFgKGfFUOmjGmT
	 OH0VtaCxrliEQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Wilcox <willy@infradead.org>, Zorro Lang <zlang@kernel.org>
Subject: Re: [Bug report] BUG: Kernel NULL pointer dereference at
 0x00000069, filemap_release_folio+0x88/0xb0
In-Reply-To: <YzYN4JqbKdxLd6oA@casper.infradead.org>
References: <20220927011720.7jmugevxc7ax26qw@zlang-mailbox>
 <YzYN4JqbKdxLd6oA@casper.infradead.org>
Date: Fri, 30 Sep 2022 12:01:26 +1000
Message-ID: <87wn9lei2x.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matthew Wilcox <willy@infradead.org> writes:
> On Tue, Sep 27, 2022 at 09:17:20AM +0800, Zorro Lang wrote:
>> Hi mm and ppc list,
>> 
>> Recently I started to hit a kernel panic [2] rarely on *ppc64le* with *1k
>> blocksize* ext4. It's not easy to reproduce, but still has chance to trigger
>> by loop running generic/048 on ppc64le (not sure all kind of ppc64le can
>> reproduce it).
>> 
>> Although I've reported a bug to ext4 [1] (more details refer to [1]), but I only
>> hit it on ppc64le until now, and I'm not sure if it's an ext4 related bug, more
>> likes folio related issue, so I cc mm and ppc mail list, hope to get more
>> reviewing.
>
> Argh.  This is the wrong way to do it.  Please stop using bugzilla.
> Now there's discussion in two places and there's nowhere to see all
> of it.
>
>> [ 4681.230907] BUG: Kernel NULL pointer dereference at 0x00000069 
>> [ 4681.230922] Faulting instruction address: 0xc00000000068ee0c 
>> [ 4681.230929] Oops: Kernel access of bad area, sig: 11 [#1] 
>> [ 4681.230934] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries 
>> [ 4681.230991] CPU: 0 PID: 82 Comm: kswapd0 Kdump: loaded Not tainted 6.0.0-rc6+ #1 
>> [ 4681.230999] NIP:  c00000000068ee0c LR: c00000000068f2b8 CTR: 0000000000000000 
>> [ 4681.238525] REGS: c000000006c0b560 TRAP: 0380   Not tainted  (6.0.0-rc6+) 
>> [ 4681.238532] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24028242  XER: 00000000 
>> [ 4681.238556] CFAR: c00000000068edf4 IRQMASK: 0  
>> [ 4681.238556] GPR00: c00000000068f2b8 c000000006c0b800 c000000002cf1700 c00c00000042f1c0  
>> [ 4681.238556] GPR04: c000000006c0b860 0000000000000000 0000000000000002 0000000000000000  
>> [ 4681.238556] GPR08: c000000002d404b0 0000000000000000 c00c00000042f1c0 0000000000000000  
>> [ 4681.238556] GPR12: c0000000001cf080 c000000005100000 c000000000194298 c0000001fff9c480  
>> [ 4681.238556] GPR16: c000000048cdb850 0000000000000007 0000000000000000 0000000000000000  
>> [ 4681.238556] GPR20: 0000000000000001 c000000006c0b8f8 c00000000146b9d8 5deadbeef0000100  
>> [ 4681.238556] GPR24: 5deadbeef0000122 c000000048cdb800 c000000006c0bc00 c000000006c0b8e8  
>> [ 4681.238556] GPR28: c000000006c0b860 c00c00000042f1c0 0000000000000009 0000000000000009  
>> [ 4681.238634] NIP [c00000000068ee0c] drop_buffers.constprop.0+0x4c/0x1c0 
>> [ 4681.238643] LR [c00000000068f2b8] try_to_free_buffers+0x128/0x150 
>> [ 4681.238650] Call Trace: 
>> [ 4681.238654] [c000000006c0b800] [c000000006c0b880] 0xc000000006c0b880 (unreliable) 
>> [ 4681.238663] [c000000006c0b840] [c000000006c0bc00] 0xc000000006c0bc00 
>> [ 4681.238670] [c000000006c0b890] [c000000000498708] filemap_release_folio+0x88/0xb0 
>> [ 4681.238679] [c000000006c0b8b0] [c0000000004c51c0] shrink_active_list+0x490/0x750 
>> [ 4681.238688] [c000000006c0b9b0] [c0000000004c9f88] shrink_lruvec+0x3f8/0x430 
>> [ 4681.238697] [c000000006c0baa0] [c0000000004ca1f4] shrink_node_memcgs+0x234/0x290 
>> [ 4681.238704] [c000000006c0bb10] [c0000000004ca3c4] shrink_node+0x174/0x6b0 
>> [ 4681.238711] [c000000006c0bbc0] [c0000000004cacf0] balance_pgdat+0x3f0/0x970 
>> [ 4681.238718] [c000000006c0bd20] [c0000000004cb440] kswapd+0x1d0/0x450 
>> [ 4681.238726] [c000000006c0bdc0] [c0000000001943d8] kthread+0x148/0x150 
>> [ 4681.238735] [c000000006c0be10] [c00000000000cbe4] ret_from_kernel_thread+0x5c/0x64 
>> [ 4681.238745] Instruction dump: 
>> [ 4681.238749] fbc1fff0 f821ffc1 7c7d1b78 7c9c2378 ebc30028 7fdff378 48000018 60000000  
>> [ 4681.238765] 60000000 ebff0008 7c3ef840 41820048 <815f0060> e93f0000 5529077c 7d295378  
>
> Running that through scripts/decodecode (with some minor hacks .. how
> do PPC people do this properly?)

We've just always used our own scripts. Mine is here: https://github.com/mpe/misc-scripts/blob/master/ppc/ppc-disasm

I've added an issue to our tracker for us to get scripts/decodecode
working on our oopses (eventually).

> I get:
>
>    0:	fb c1 ff f0 	std     r30,-16(r1)
>    4:	f8 21 ff c1 	stdu    r1,-64(r1)
>    8:	7c 7d 1b 78 	mr      r29,r3
>    c:	7c 9c 23 78 	mr      r28,r4
>   10:	eb c3 00 28 	ld      r30,40(r3)
>   14:	7f df f3 78 	mr      r31,r30
>   18:	48 00 00 18 	b       0x30
>   1c:	60 00 00 00 	nop
>   20:	60 00 00 00 	nop
>   24:	eb ff 00 08 	ld      r31,8(r31)
>   28:	7c 3e f8 40 	cmpld   r30,r31
>   2c:	41 82 00 48 	beq     0x74
>   30:*	81 5f 00 60 	lwz     r10,96(r31)		<-- trapping instruction
>   34:	e9 3f 00 00 	ld      r9,0(r31)
>   38:	55 29 07 7c 	rlwinm  r9,r9,0,29,30
>   3c:	7d 29 53 78 	or      r9,r9,r10
>
> That would seem to track; 96 is 0x60 and r31 contains 0x00..09, giving
> us an effective address of 0x69.
>
> It would be nice to know what source line that corresponds to.  Could
> you use scripts/faddr2line to turn drop_buffers.constprop.0+0x4c/0x1c0
> into a line number?  I can't because it needs the vmlinux you generated.

You'll need: https://lore.kernel.org/all/20220927075211.897152-1-srikar@linux.vnet.ibm.com/

I don't have the same vmlinux obviously, but mine seems to match up
pretty closely, I get:

c0000000004e3900 <drop_buffers.constprop.0>:
c0000000004e3900:       b9 00 4c 3c     addis   r2,r12,185
c0000000004e3904:       00 c5 42 38     addi    r2,r2,-15104
c0000000004e3908:       a6 02 08 7c     mflr    r0
c0000000004e390c:       29 4f b8 4b     bl      c000000000068834 <_mcount>      # ^ entry & ftrace stuff
c0000000004e3910:       e0 ff 81 fb     std     r28,-32(r1)
c0000000004e3914:       e8 ff a1 fb     std     r29,-24(r1)
c0000000004e3918:       78 23 9c 7c     mr      r28,r4
c0000000004e391c:       78 1b 7d 7c     mr      r29,r3
c0000000004e3920:       f8 ff e1 fb     std     r31,-8(r1)
c0000000004e3924:       f0 ff c1 fb     std     r30,-16(r1)
c0000000004e3928:       c1 ff 21 f8     stdu    r1,-64(r1)                      # ^ save regs and create stack frame
c0000000004e392c:       28 00 c3 eb     ld      r30,40(r3)                      # r30 = folio->private (0000000000000009)
c0000000004e3930:       78 f3 df 7f     mr      r31,r30                         # r31 = folio->private = head = bh
c0000000004e3934:       18 00 00 48     b       c0000000004e394c <drop_buffers.constprop.0+0x4c>        ->
c0000000004e3938:       00 00 00 60     nop
c0000000004e393c:       00 00 42 60     ori     r2,r2,0
c0000000004e3940:       08 00 ff eb     ld      r31,8(r31)
c0000000004e3944:       40 f8 3e 7c     cmpld   r30,r31
c0000000004e3948:       48 00 82 41     beq     c0000000004e3990 <drop_buffers.constprop.0+0x90>
c0000000004e394c:       60 00 5f 81     lwz     r10,96(r31)                     # r10 = bh->b_count

$ ./scripts/faddr2line .build/vmlinux drop_buffers.constprop.0+0x4c
drop_buffers.constprop.0+0x4c/0x170:
arch_atomic_read at arch/powerpc/include/asm/atomic.h:30
(inlined by) atomic_read at include/linux/atomic/atomic-instrumented.h:28
(inlined by) buffer_busy at fs/buffer.c:2859
(inlined by) drop_buffers at fs/buffer.c:2871

static inline int buffer_busy(struct buffer_head *bh)
{
	return atomic_read(&bh->b_count) |
		(bh->b_state & ((1 << BH_Dirty) | (1 << BH_Lock)));
}

struct folio {
        union {
                struct {
                        long unsigned int flags;         /*     0     8 */
                        union {
                                struct list_head lru;    /*     8    16 */
                                struct {
                                        void * __filler; /*     8     8 */
                                        unsigned int mlock_count; /*    16     4 */
                                };                       /*     8    16 */
                        };                               /*     8    16 */
                        struct address_space * mapping;  /*    24     8 */
                        long unsigned int index;         /*    32     8 */
                        void *     private;              /*    40     8 */      <----

struct buffer_head {
        long unsigned int          b_state;              /*     0     8 */
        struct buffer_head *       b_this_page;          /*     8     8 */
        struct page *              b_page;               /*    16     8 */
        sector_t                   b_blocknr;            /*    24     8 */
        size_t                     b_size;               /*    32     8 */
        char *                     b_data;               /*    40     8 */
        struct block_device *      b_bdev;               /*    48     8 */
        bh_end_io_t *              b_end_io;             /*    56     8 */
        void *                     b_private;            /*    64     8 */
        struct list_head           b_assoc_buffers;      /*    72    16 */
        struct address_space *     b_assoc_map;          /*    88     8 */
        atomic_t                   b_count;              /*    96     4 */      <----

The buffer_head comes from folio_buffers(folio):

static bool
drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
{
	struct buffer_head *head = folio_buffers(folio);

Which is == folio_get_private()

r3 and r29 still hold folio = c00c00000042f1c0 

That's a valid looking vmemmap address.

So we have a valid folio, but its private field == 9 ?

Seems like all sorts of things get stuffed into page->private, so
presumably 9 is not necessarily a corrupt value, just not what we're
expecting. But I'm out of my depth so over to you :)

cheers
