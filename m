Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A027966E1B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 16:10:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxC463Bchz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:09:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=TGjBsFbb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=TGjBsFbb;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxC3B6wlwz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 02:09:10 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D0CF21AA6;
	Tue, 17 Jan 2023 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673968143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GbRWdJrQA5rsGsQ15mZxy3lCZu74wCpPmVNydKoLMQ0=;
	b=TGjBsFbbafNCK59Ka/VR2n3p3wpABbf1jdsLyLdBJ3nwlM81bSVbkGWncSt2v0Z7QlPHV+
	u2cV4TXTMNYj/wu/K7fGSFWcsGtrQGAVpnh9L+yTbsUCjJmx2u9rCmnO1NQn20Q+zSniqu
	+i9vScb+qAT6y46Eo/yiLU6fB6xX9bo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 249E21390C;
	Tue, 17 Jan 2023 15:09:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TMVsCA+6xmNhQQAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 17 Jan 2023 15:09:03 +0000
Date: Tue, 17 Jan 2023 16:09:02 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 13/41] mm: introduce vma->vm_flags modifier functions
Message-ID: <Y8a6DhA6o3jcZaM3@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-14-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109205336.3665937-14-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 09-01-23 12:53:08, Suren Baghdasaryan wrote:
> To keep vma locking correctness when vm_flags are modified, add modifier
> functions to be used whenever flags are updated.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h       | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mm_types.h |  8 +++++++-
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ec2c4c227d51..35cf0a6cbcc2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -702,6 +702,44 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
>  	vma_init_lock(vma);
>  }
>  
> +/* Use when VMA is not part of the VMA tree and needs no locking */
> +static inline
> +void init_vm_flags(struct vm_area_struct *vma, unsigned long flags)
> +{
> +	WRITE_ONCE(vma->vm_flags, flags);
> +}

Why do we need WRITE_ONCE here? Isn't vma invisible during its
initialization?

> +
> +/* Use when VMA is part of the VMA tree and needs appropriate locking */
> +static inline
> +void reset_vm_flags(struct vm_area_struct *vma, unsigned long flags)
> +{
> +	vma_write_lock(vma);
> +	init_vm_flags(vma, flags);
> +}
> +
> +static inline
> +void set_vm_flags(struct vm_area_struct *vma, unsigned long flags)
> +{
> +	vma_write_lock(vma);
> +	vma->vm_flags |= flags;
> +}
> +
> +static inline
> +void clear_vm_flags(struct vm_area_struct *vma, unsigned long flags)
> +{
> +	vma_write_lock(vma);
> +	vma->vm_flags &= ~flags;
> +}
> +
> +static inline
> +void mod_vm_flags(struct vm_area_struct *vma,
> +		  unsigned long set, unsigned long clear)
> +{
> +	vma_write_lock(vma);
> +	vma->vm_flags |= set;
> +	vma->vm_flags &= ~clear;
> +}
> +

This is rather unusual pattern. There is no note about locking involved
in the naming and also why is the locking part of this interface in the
first place? I can see reason for access functions to actually check for
lock asserts.
-- 
Michal Hocko
SUSE Labs
