Return-Path: <linuxppc-dev+bounces-185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FFC9576DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 23:51:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnmWQ4KK0z2y71;
	Tue, 20 Aug 2024 07:51:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bo2X9Cdr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnhYl4HzBz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 04:52:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9EF8FCE009F;
	Mon, 19 Aug 2024 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9DCC32782;
	Mon, 19 Aug 2024 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724093575;
	bh=Wp8P3EgsiNnwHsyvJQy1pa44F8Ift7l2TbO0fFNdX+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo2X9Cdr8YfBof0Y+21pidQ9bPz8/eUiG8SHtFIpgb4EiOd5Ok3g8Wppp6R5mRP2Q
	 e7yVdHKDwlRmEWj+l713ykXFTH21hteVqrCg0oOMdOHJxC7ITQLFA+6RPcrM+ilNeD
	 91ABWUteHwZPfYZe7YlpwxdvK7jZ34rIjNCwwLW299GHqw/BrkRWhOdxnX5263QrkY
	 QGichqXoQWR5JvRxaw3CMRKPg6NmDEZyiyTOYXZgnqSBuWhLKUUvLncaPbww8s+cR5
	 nROe5YC5iZTtiU6GzbkWaw45SSBvnQQg7UZCV6HiNmhmypTkjO7FNtCLSWyvkQ8QMj
	 yu5DpggJJ8zhA==
Date: Mon, 19 Aug 2024 11:52:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	christophe.leroy@csgroup.eu, jeffxu@google.com,
	Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org,
	npiggin@gmail.com, oliver.sang@intel.com, pedro.falcato@gmail.com,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
Message-ID: <20240819185253.GA2333884@thelio-3990X>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812082605.743814-1-mpe@ellerman.id.au>

Hi Michael,

On Mon, Aug 12, 2024 at 06:26:02PM +1000, Michael Ellerman wrote:
> Add an optional close() callback to struct vm_special_mapping. It will
> be used, by powerpc at least, to handle unmapping of the VDSO.
> 
> Although support for unmapping the VDSO was initially added
> for CRIU[1], it is not desirable to guard that support behind
> CONFIG_CHECKPOINT_RESTORE.
> 
> There are other known users of unmapping the VDSO which are not related
> to CRIU, eg. Valgrind [2] and void-ship [3].
> 
> The powerpc arch_unmap() hook has been in place for ~9 years, with no
> ifdef, so there may be other unknown users that have come to rely on
> unmapping the VDSO. Even if the code was behind an ifdef, major distros
> enable CHECKPOINT_RESTORE so users may not realise unmapping the VDSO
> depends on that configuration option.
> 
> It's also undesirable to have such core mm behaviour behind a relatively
> obscure CONFIG option.
> 
> Longer term the unmap behaviour should be standardised across
> architectures, however that is complicated by the fact the VDSO pointer
> is stored differently across architectures. There was a previous attempt
> to unify that handling [4], which could be revived.
> 
> See [5] for further discussion.
> 
> [1]: commit 83d3f0e90c6c ("powerpc/mm: tracking vDSO remap")
> [2]: https://sourceware.org/git/?p=valgrind.git;a=commit;h=3a004915a2cbdcdebafc1612427576bf3321eef5
> [3]: https://github.com/insanitybit/void-ship
> [4]: https://lore.kernel.org/lkml/20210611180242.711399-17-dima@arista.com/
> [5]: https://lore.kernel.org/linuxppc-dev/shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/mm_types.h | 3 +++
>  mm/mmap.c                | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> v2:
> - Add some blank lines as requested.
> - Expand special_mapping_close() comment.
> - Add David's reviewed-by.
> - Expand change log to capture review discussion.
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 485424979254..78bdfc59abe5 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1313,6 +1313,9 @@ struct vm_special_mapping {
>  
>  	int (*mremap)(const struct vm_special_mapping *sm,
>  		     struct vm_area_struct *new_vma);
> +
> +	void (*close)(const struct vm_special_mapping *sm,
> +		      struct vm_area_struct *vma);
>  };
>  
>  enum tlb_flush_reason {
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d0dfc85b209b..af4dbf0d3bd4 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3620,10 +3620,16 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
>  static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
>  
>  /*
> + * Close hook, called for unmap() and on the old vma for mremap().
> + *
>   * Having a close hook prevents vma merging regardless of flags.
>   */
>  static void special_mapping_close(struct vm_area_struct *vma)
>  {
> +	const struct vm_special_mapping *sm = vma->vm_private_data;
> +
> +	if (sm->close)
> +		sm->close(sm, vma);
>  }
>  
>  static const char *special_mapping_name(struct vm_area_struct *vma)
> -- 
> 2.45.2
> 

This change is now in -next and I bisected a crash that our CI sees with
ARCH=um to it:

$ make -skj"$(nproc)" ARCH=um CROSS_COMPILE=x86_64-linux- defconfig linux

$ ./linux ubd0=$PWD/rootfs.ext4
...
Linux version 6.11.0-rc4-next-20240819 (nathan@thelio-3990X) (x86_64-linux-gcc (GCC) 14.2.0, GNU ld (GNU Binutils) 2.42) #1 Mon Aug 19 11:42:20 MST 2024
...
Run /sbin/init as init process

Modules linked in:
Pid: 24, comm: mount Not tainted 6.11.0-rc4-next-20240819
RIP: 0033:0x68006f6c
RSP: 000000006c8bfc68  EFLAGS: 00010206
RAX: 0000000068006f6c RBX: 0000000068a0aa18 RCX: 00000000600d8b09
RDX: 0000000000000000 RSI: 0000000068a0aa18 RDI: 0000000068805120
RBP: 000000006c8bfc70 R08: 0000000000000001 R09: 0000000068ae0308
R10: 000000000000000e R11: ffffffffffffffff R12: 0000000000000001
R13: 0000000068a0aa18 R14: 0000000000000015 R15: 0000000068944a88
Kernel panic - not syncing: Segfault with no mm
CPU: 0 UID: 0 PID: 24 Comm: mount Not tainted 6.11.0-rc4-next-20240819 #1
Stack:
 600caeff 6c8bfc90 600d8b2a 68944a80
 00000047 6c8bfda0 600cbfd9 6c8bfd50
 68944ad0 68944a88 7f7ffff000 7f7fffffff
Call Trace:
 [<600caeff>] ? special_mapping_close+0x16/0x19
 [<600d8b2a>] remove_vma+0x21/0x59
 [<600cbfd9>] exit_mmap+0x1f3/0x2bc
 [<60032a0c>] ? unblock_signals+0x0/0xbd
 [<600329fd>] ? block_signals+0x0/0xf
 [<6003831c>] __mmput+0x24/0x94
 [<60067262>] ? up_read+0x0/0x2c
 [<600383a1>] mmput+0x15/0x18
 [<6003ce97>] do_exit+0x381/0x9b8
 [<600e4b8d>] ? kfree+0x107/0x11b
 [<6003d752>] sys_exit_group+0x0/0x16
 [<6003d768>] pid_child_should_wake+0x0/0x42
 [<60022e7a>] handle_syscall+0x79/0xa7
 [<600358de>] userspace+0x4d3/0x505
 [<60020927>] fork_handler+0x84/0x8b

Passing this through scripts/decode_stacktrace.sh results in

? special_mapping_close (mm/mmap.c:2056)
remove_vma (mm/vma.c:144)
exit_mmap (include/linux/sched.h:2049 mm/mmap.c:1947)
? unblock_signals (arch/um/os-Linux/signal.c:296)
? block_signals (arch/um/os-Linux/signal.c:282)
__mmput (kernel/fork.c:1349)
? up_read (arch/x86/include/asm/atomic64_64.h:79 (discriminator 5) include/linux/atomic/atomic-arch-fallback.h:2749 (discriminator 5) include/linux/atomic/atomic-long.h:184 (discriminator 5) include/linux/atomic/atomic-instrumented.h:3317 (discriminator 5) kernel/locking/rwsem.c:1347 (discriminator 5) kernel/locking/rwsem.c:1622 (discriminator 5))
mmput (kernel/fork.c:1370)
do_exit (arch/um/include/asm/thread_info.h:46 kernel/exit.c:572 kernel/exit.c:926)
? kfree (mm/slub.c:4482 (discriminator 2) mm/slub.c:4522 (discriminator 2) mm/slub.c:4669 (discriminator 2))
sys_exit_group (kernel/exit.c:1099 kernel/exit.c:1097)
pid_child_should_wake (kernel/exit.c:1106 kernel/exit.c:1565)
handle_syscall (arch/um/kernel/skas/syscall.c:45 (discriminator 1))
userspace (arch/um/os-Linux/skas/process.c:466)
fork_handler (arch/um/kernel/process.c:137)

This change seems pretty innocuous but the bisect log does not lie :) I
am guessing UML is just special here somehow?

# bad: [367b5c3d53e57d51a5878816804652963da90950] Add linux-next specific files for 20240816
# good: [e724918b3786252b985b0c2764c16a57d1937707] Merge tag 'hardening-v6.11-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect start '367b5c3d53e57d51a5878816804652963da90950' 'e724918b3786252b985b0c2764c16a57d1937707'
# bad: [b12bdbe2615f5426953ae1e64d74176674618edb] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
git bisect bad b12bdbe2615f5426953ae1e64d74176674618edb
# bad: [9ad9c8d6eea9063fe7309cdc8e76bd12377cd613] Merge branch 'for-next' of https://github.com/sophgo/linux.git
git bisect bad 9ad9c8d6eea9063fe7309cdc8e76bd12377cd613
# bad: [57c53c832b28ca79eddca47c5b599036be10d347] Merge branch 'perf-tools-next' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
git bisect bad 57c53c832b28ca79eddca47c5b599036be10d347
# bad: [cbaf19e941bcd83cf50f569b3888f7db6dcaccfc] foo
git bisect bad cbaf19e941bcd83cf50f569b3888f7db6dcaccfc
# good: [cdb0e8eb648858f37bbe1d6245c3a3c49f265c1c] fixup! selftests/mm: Add mseal test for no-discard madvise
git bisect good cdb0e8eb648858f37bbe1d6245c3a3c49f265c1c
# bad: [4fdacc9ec44f04a9edc4ddd0c782ab698cd15257] mm: shmem: support large folio allocation for shmem_replace_folio()
git bisect bad 4fdacc9ec44f04a9edc4ddd0c782ab698cd15257
# good: [90f91965eee8256ffad811a6da097bc13b66aa2e] mm: reduce deferred struct page init ifdeffery
git bisect good 90f91965eee8256ffad811a6da097bc13b66aa2e
# good: [5ae759160c5df466f4ae7cb89c05cd963e91cc3c] mm: introduce a pageflag for partially mapped folios
git bisect good 5ae759160c5df466f4ae7cb89c05cd963e91cc3c
# good: [03683572685d2f8febfc022b758fdb4bddf8d783] maple_tree: fix comment typo with corresponding maple_status
git bisect good 03683572685d2f8febfc022b758fdb4bddf8d783
# bad: [74ef5018120b2a441428400a5f92891307d41b82] powerpc/vdso: refactor error handling
git bisect bad 74ef5018120b2a441428400a5f92891307d41b82
# bad: [5077f828c08424b81279341813a18b8923ebd42e] mm: add optional close() to struct vm_special_mapping
git bisect bad 5077f828c08424b81279341813a18b8923ebd42e
# good: [0ebac8817b5dce7b3a1afd6ff7197a75829d50ad] kfence: save freeing stack trace at calling time instead of freeing time
git bisect good 0ebac8817b5dce7b3a1afd6ff7197a75829d50ad
# first bad commit: [5077f828c08424b81279341813a18b8923ebd42e] mm: add optional close() to struct vm_special_mapping

The rootfs is available from [1] in case it matters
(x86_64-rootfs.ext4.zst, decompress it with zstd first); it just shuts
down the machine on boot.

Cheers,
Nathan

[1]: https://github.com/ClangBuiltLinux/boot-utils/releases/latest

