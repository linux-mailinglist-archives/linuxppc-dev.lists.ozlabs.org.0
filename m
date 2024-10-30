Return-Path: <linuxppc-dev+bounces-2729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E39B6490
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 14:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdpMV2nJwz2ygx;
	Thu, 31 Oct 2024 00:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730296022;
	cv=none; b=TCv7onEM0zSSLgpOZCUmWrhZj5kTuQuhUK1J0xa1pk1/0o05q8A5ezFdy2xxubjDKsfpmSwYLRF25uThia9B4Vjztc1GWR9OxnkDI8t3NCDMdbZsu7shn3VswHs+cYWxK7lx5zEm2a1433ZMdxYvolnf4UEBg8v5alPQMKOV9etl2imzFvTkz6koLBi0JqIB/lBL4gSYQqS67vlhxFGK/E+TYppChQAgGH7LiTGGk83zhJNgsCwlZiitZWb8JixYlB/jwK5VShifyisSLCleL1capqrUYhnJFUmgAS8Y8jcoxJEHT7UM3kO6wEXfz/f3dTYPvXn8TTXvOqGc/S8R3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730296022; c=relaxed/relaxed;
	bh=QJw8nbraYtSMTnotHfpfDJuWx3E00xR2tPPyMSWzqzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiXcPPlpBYK9v+WVJFGyS0JTISXP7V+FKePrvvBCENh/hmPBiPgpd6t9UWp3+skpE4jbnUnarok9sxhUlA6YXizN+xZAH7B/gHfEXftDJwO8nY0v1ak/K9wlkl9i495F8ROmGxDw31Wc+V85FzzCI2ObjyyjvxcMu1gdZHSw+Prgk5/KN0t7rAEy8Xpa4f7HzjzV3zbEcakLxK+EKcSgPTENd+2KutGqOubCide1EGrI7fxBxxi1fCQrmew0VpH5KtvjEGDw7+44pgIRxEYVhI7BV/Gj56BK1W3CkuCwkdQ1vpNZBePFY1v1ut2VH5ViWrbXC3vlUv0XC7XSiSi9vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdpMS00KXz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 00:46:58 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49UDXklJ032424;
	Wed, 30 Oct 2024 08:33:46 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 49UDXe5O032403;
	Wed, 30 Oct 2024 08:33:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 30 Oct 2024 08:33:39 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of membarrier_state
Message-ID: <20241030133339.GQ29862@gate.crashing.org>
References: <20241007053936.833392-1-nysal@linux.ibm.com> <20241029055133.121418-1-nysal@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029055133.121418-1-nysal@linux.ibm.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Tue, Oct 29, 2024 at 11:21:28AM +0530, Nysal Jan K.A. wrote:
> On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> is not selected, sync_core_before_usermode() is a no-op.
> In membarrier_mm_sync_core_before_usermode() the compiler does not
> eliminate redundant branches and load of mm->membarrier_state
> for this case as the atomic_read() cannot be optimized away.
> 
> Here's a snippet of the code generated for finish_task_switch() on powerpc
> prior to this change:
> 
> 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
> .......
> 1b78c8:   cmpdi   cr7,r26,0
> 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
> 1b78d0:   ld      r9,2312(r13)    # current
> 1b78d4:   ld      r9,1888(r9)     # current->mm
> 1b78d8:   cmpd    cr7,r26,r9
> 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
> 1b78e0:   hwsync
> 1b78e4:   cmplwi  cr7,r27,128
> .......
> 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
> 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>
> 
> This was found while analyzing "perf c2c" reports on kernels prior
> to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
> where mm_count was false sharing with membarrier_state.
> 
> There is a minor improvement in the size of finish_task_switch().
> The following are results from bloat-o-meter for ppc64le:
> 
> GCC 7.5.0
> ---------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch                           884     852     -32
> 
> GCC 12.2.1
> ----------
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> finish_task_switch.isra                      852     820     -32
> 
> LLVM 17.0.6
> -----------
> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
> Function                                     old     new   delta
> rt_mutex_schedule                            120     104     -16
> finish_task_switch                           792     772     -20
> 
> Results on aarch64:
> 
> GCC 14.1.1
> ----------
> add/remove: 0/2 grow/shrink: 1/1 up/down: 4/-60 (-56)
> Function                                     old     new   delta
> get_nohz_timer_target                        352     356      +4
> e843419@0b02_0000d7e7_408                      8       -      -8
> e843419@01bb_000021d2_868                      8       -      -8
> finish_task_switch.isra                      592     548     -44
> 
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
> V1 -> V2:
> - Add results for aarch64
> - Add a comment describing the changes
> ---
>  include/linux/sched/mm.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..b13474825130 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -531,6 +531,13 @@ enum {
>  
>  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>  {
> +	/*
> +	 * The atomic_read() below prevents CSE. The following should
> +	 * help the compiler generate more efficient code on architectures
> +	 * where sync_core_before_usermode() is a no-op.
> +	 */
> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> +		return;
>  	if (current->mm != mm)
>  		return;
>  	if (likely(!(atomic_read(&mm->membarrier_state) &

I'd say "CSE and similar transformations", but yeah, in this case CSE.
The point is that any access to a volatile object is a necessary side-
effect, so it has to be performed on the actual machine just as on the
abstract machine (on all the same paths, and as often).  It might be
nice to have an atomic_read (for PowerPC) that can generate better
machine code.  Not a trivial task though!

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher

