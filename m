Return-Path: <linuxppc-dev+bounces-3399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F59D0B5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 10:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsMBh65CBz2yN8;
	Mon, 18 Nov 2024 20:04:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731920668;
	cv=none; b=HraNPf7C55XQaWuY4q+9Va3On5pp0QTK5BxvXLB0+q4cCjMvdIjRk64uZ/cXyWu4EtUAmY8KY/MRlgvRiYGxOb026WTOI/HXUDQI3k2bE78AXCBZoG8VBoFYD6Wd1fdhkuIvqyVxWdIO4QVxODeeve8Erat/I3p5sADyO5QFDRjn1lKud+w7YfQS3eq20hKBkvx/3hAqsX4bcQLCt77uUKt22F5nO+xNNkea695WzVK7hfovXQAIx0/YWTYUNMW38GsLn3hj9xI4rzLziGnMPGMfI/QqQK/GWj8ir0PnsPE0ttY4SshsPrS0u1x+wb9O1WtI3ae5MR02ycD5HekPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731920668; c=relaxed/relaxed;
	bh=Ws/rbfiwFMNWy8k0tnCWfMeaJzWW6S4EceX0n9OoukE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2qeAazOyJDUNzL0WIgS+U1Bc08GUzbpnfvGTwJx1stYRIjypL0SXauL6nDdL9gXJxmmDCxbTix71tcBLEv7oUMJKVn/h1aHB9m+f//OsdqkV4M97lB5h7enppXi/UlXofuF76L1w7uZn2tJFcsGoijk8RFACGmJLw8zS4MFQvM0nyI0GU2Ikog7vLAvuzkrQlraF85I7InEszXzZpSzJW5T4hZHLlIjlOnQqNBgmhyngcoY3UkOuaUbixPdQ5/RsRgJkXdpe+gZoTwjKvS3qgY/g+ejvEhuG/pw3BdHGRpRlpxaRbeMBMA07LMxak02SIwMg5pAKfunWv8xMzphRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SBaCu+6h; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SBaCu+6h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsMBf3GZcz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 20:04:24 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa1f73966a5so374469366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731920660; x=1732525460; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ws/rbfiwFMNWy8k0tnCWfMeaJzWW6S4EceX0n9OoukE=;
        b=SBaCu+6hHoQwtL/SaA1YV5+x101s/0Khi66Z/gkCulbEQmZHXAfin0XdJ/dXJeM8hF
         YdqXnbG51wlIRFuWvojav9xbaip9JE3R7mat4Jn7JahOXX21zwNZnVGUVsQ+v6BEyL1P
         pKHktIBZfumKwzLbEJwRkGoDMwopFHMAmC10QI58GWrJoO411Ca5EexpNDzwxwcbNATU
         wg4c/jvqhFjJqbQzOxoEeA5wRmSZSwbty9gZN4OjycBemj4FnWlHhC15g2/3owuAui85
         NiNoDGJq81Y7xJn71S9svg18FGLhJe61kDxMad108m0KCVYRfkzlA0RVZNP8ZQ686B8i
         r6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731920660; x=1732525460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws/rbfiwFMNWy8k0tnCWfMeaJzWW6S4EceX0n9OoukE=;
        b=c2PsHO+XzURBI5bLrBDnJNhlBqDIseyoaw6OYRb3fQLGQwW2f9u0NdIBf1LLZ5dkWG
         66eIHNQ+QBK9QHPO19UKNJ5CuRv7gclESEQA+xG3uf6irNhbryEkb56U4xsFlzznbnnK
         m365i4QYLKMeSHqoCgX9knnUKkPQArvjetgZnWiiXYZwfVkm2D/LBALNOMBvQwGfPF8h
         rfnTc98RDy1S9DEsbGDfg1gADNdlOXgTc+aG7JtWciBG/tVorF/MlZ7frsWSJLchEEO5
         4WXqP27/7lRllbmh/dPawJUlEMCCsQTehqyOwi2qCDIaK5jrhg4UV4G0DrNq6PSLOyC3
         I6cw==
X-Forwarded-Encrypted: i=1; AJvYcCXA3Xga3N2BDoYeITogGXUH2pI5e6GT9RBsbPVz0nbZgaJZhJ26GE3r/j9RMNDkuHz4aN0iowSM0ajwsN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLDYOOm24idjVjEfXPZUq8Gw1SvtNJ5AyI8Mrdi8LWmytx5tJ4
	CI5oD9cxI8jNbcR7wAcx/gbX9JKdR9ubdd6PFSmZXqucvIZRgWBvIyxDT3d+XkE=
X-Google-Smtp-Source: AGHT+IHiDm/bz3WEh1enyRl0N1th54dk8RHN4GA3K1qzcDnriUz2+DDQ+dD96pBdIfYZ9dcNHYkGjA==
X-Received: by 2002:a17:907:7284:b0:a9e:c263:29a7 with SMTP id a640c23a62f3a-aa483420a9amr1096106266b.23.1731920659889;
        Mon, 18 Nov 2024 01:04:19 -0800 (PST)
Received: from localhost (109-81-88-120.rct.o2.cz. [109.81.88.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df50defsm513526566b.50.2024.11.18.01.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:04:19 -0800 (PST)
Date: Mon, 18 Nov 2024 10:04:18 +0100
From: Michal Hocko <mhocko@suse.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Peter Zijlstra <peterz@infradead.org>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <ZzsDEvJn-vauz9gE@tiehlicka>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029055133.121418-1-nysal@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

I do not see this patch staged in any tree (e.g. linux-next). Is this on
its way to be merged?

Thanks!

On Tue 29-10-24 11:21:28, Nysal Jan K.A. wrote:
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
> -- 
> 2.47.0
> 

-- 
Michal Hocko
SUSE Labs

