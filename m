Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0EF6860DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 08:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6DTM6xmzz3f3d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 18:44:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=plb39T26;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=plb39T26;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6DSR0hYFz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 18:43:49 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D0B333A5A;
	Wed,  1 Feb 2023 07:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675237424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIPupChmZWdqCbipzzk6WIge6ktn1mIlacRGTtLMASA=;
	b=plb39T261+q73vUMZloi+nvkH8nnyo+NMJ3mWpZsLfYYmeWt/WorRYCmo/s5C1ChCTGt2v
	3zeJW7/3Quy+a++wy39qc2ym1EPIKxsP++jtuZtDVsjGQBIcgFFF7gE5Hjqq1lrrCau9wl
	eZlhFhYILXyWtEI3TjhVbj0vmXaTico=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C2211348C;
	Wed,  1 Feb 2023 07:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UybHCTAY2mOWMwAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 01 Feb 2023 07:43:44 +0000
Date: Wed, 1 Feb 2023 08:43:43 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] mm: introduce vm_flags_reset_once to replace
 WRITE_ONCE vm_flags updates
Message-ID: <Y9oYL93beiezSf3V@dhcp22.suse.cz>
References: <20230201000116.1333160-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201000116.1333160-1-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, 42.hyeyoo@gmail.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingula
 rity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 31-01-23 16:01:16, Suren Baghdasaryan wrote:
> Provide vm_flags_reset_once() and replace the vm_flags updates which used
> WRITE_ONCE() to prevent compiler optimizations.
> 
> Fixes: 0cce31a0aa0e ("mm: replace vma->vm_flags direct modifications with modifier calls")
> Reported-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

This would have been better folded into the vm_flags modification patch
because it would be more obvious change. Hugh has provided a very nice
comment in mlock_vma_pages_range but the git blame would be more visible
when the conversion is from WRITE_ONCE.

One way or the other
Acked-by: Michal Hocko <mhocko@suse.com>

> ---
> Notes:
> - The patch applies cleanly over mm-unstable
> - The SHA in Fixes: line is from mm-unstable, so is... unstable
> 
>  include/linux/mm.h | 7 +++++++
>  mm/mlock.c         | 4 ++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5bf0ad48faaa..23ce04f6e91e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -648,6 +648,13 @@ static inline void vm_flags_reset(struct vm_area_struct *vma,
>  	vm_flags_init(vma, flags);
>  }
>  
> +static inline void vm_flags_reset_once(struct vm_area_struct *vma,
> +				       vm_flags_t flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
> +}
> +
>  static inline void vm_flags_set(struct vm_area_struct *vma,
>  				vm_flags_t flags)
>  {
> diff --git a/mm/mlock.c b/mm/mlock.c
> index ed49459e343e..617469fce96d 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -380,7 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  	 */
>  	if (newflags & VM_LOCKED)
>  		newflags |= VM_IO;
> -	vm_flags_reset(vma, newflags);
> +	vm_flags_reset_once(vma, newflags);
>  
>  	lru_add_drain();
>  	walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
> @@ -388,7 +388,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  
>  	if (newflags & VM_IO) {
>  		newflags &= ~VM_IO;
> -		vm_flags_reset(vma, newflags);
> +		vm_flags_reset_once(vma, newflags);
>  	}
>  }
>  
> -- 
> 2.39.1.456.gfc5497dd1b-goog

-- 
Michal Hocko
SUSE Labs
