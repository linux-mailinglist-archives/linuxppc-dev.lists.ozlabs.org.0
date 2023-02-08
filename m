Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726968E5AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 02:55:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBNPf7181z3bVJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:55:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JkO4G2i5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JkO4G2i5;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBNNm3Hj6z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 12:55:04 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id i2so4270238ple.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 17:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yFAeINwYtb2cLRVJgVtc+kWYFXCI8f2NbANQERXXFd0=;
        b=JkO4G2i5cU/E6yafLtwtlFjL7+8wulry7a3Ey9V3mhwaVhE5SCUWQDoZVhZPaJxlGI
         W7d/w1XtEKV7IhqrixH+q71lyrUCd8HJl3B1ld0dIhUjEdwxgt3fFM20XarQ1VkKO68i
         9i/rKN56pXvZLCaBQyFAMpCf+59UHwOB4r0b/+K3XrymyynR9/FfXqj9Yjbx7MwmAcFH
         lUmt0Te8AJSpvDmDxzZmo5tvAucslU2O8+4fKnourd8kcCtO//6Yj6ESjtdIMXQUhd37
         j5cJnwVsAZWJJbRYLXcDvSWPhMMUSTPCa/Vje6uZyqu6YN5P5QfJQgrNvgX53OlNUlZW
         gMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFAeINwYtb2cLRVJgVtc+kWYFXCI8f2NbANQERXXFd0=;
        b=LU//Hd+1s9oGoynCKs2ZqwMfGcS74e0cpZ/bCCl3s+rogrG5veElSdzTS+uA3737YG
         HasQlt8U59IEQVW7QW8+y3vPpGfpJ7SmdttVx/+OSkGNCZeY35G8YKVOniTP5C3fthIk
         logWmq4liTF712M3hcmmjpJA2opwO+WYS0eFySeIlfM/WHWqo4V6lUuF7699H7xsr0Ay
         qGRMPyEfrIQ/kCtXtsL2XHxyA3e4R6S9rzK1ASXNp4jTBStrmDO8l/0zVDtoi1IxJyxA
         0ReZiKI7+cbQB3e+1fMKiAuJHQLnVdVg/5heR+3PJpzfnF9isJneBdEycPvKoqXQjq4F
         LbuA==
X-Gm-Message-State: AO0yUKVrJn7I4qPJ9VtI5d5q1o5GxgmFYpAsTwbfKH7O08mTSElclIK6
	0GstDwIvhiEgukjpTRcJywE=
X-Google-Smtp-Source: AK7set9mvmEYqv3hl2OrC0zKo+qq3fUo4V5nX2RfOnU0+7cYrKdJNxD+cYH5ETHUyGXyK29itm5v/w==
X-Received: by 2002:a05:6a20:8e08:b0:be:abb2:66ff with SMTP id y8-20020a056a208e0800b000beabb266ffmr6740582pzj.60.1675821302133;
        Tue, 07 Feb 2023 17:55:02 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id q20-20020a638c54000000b004eecc3080f8sm8635372pgn.29.2023.02.07.17.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 17:54:59 -0800 (PST)
Date: Wed, 8 Feb 2023 01:54:47 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 5/7] mm: replace vma->vm_flags indirect modification
 in ksm_madvise
Message-ID: <Y+MA5wUYgtq6Ll++@localhost>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-6-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126193752.297968-6-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity
 .net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:37:50AM -0800, Suren Baghdasaryan wrote:
> Replace indirect modifications to vma->vm_flags with calls to modifier
> functions to be able to track flag changes and to keep vma locking
> correctness.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 6 +++++-
>  arch/s390/mm/gmap.c                | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 1d67baa5557a..709ebd578394 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -393,6 +393,7 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  {
>  	unsigned long gfn = memslot->base_gfn;
>  	unsigned long end, start = gfn_to_hva(kvm, gfn);
> +	unsigned long vm_flags;
>  	int ret = 0;
>  	struct vm_area_struct *vma;
>  	int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
> @@ -409,12 +410,15 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  			ret = H_STATE;
>  			break;
>  		}
> +		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
> +		vm_flags = vma->vm_flags;
>  		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> -			  merge_flag, &vma->vm_flags);
> +			  merge_flag, &vm_flags);
>  		if (ret) {
>  			ret = H_STATE;
>  			break;
>  		}
> +		vm_flags_reset(vma, vm_flags);
>  		start = vma->vm_end;
>  	} while (end > vma->vm_end);
>  
> diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> index ab836597419d..5a716bdcba05 100644
> --- a/arch/s390/mm/gmap.c
> +++ b/arch/s390/mm/gmap.c
> @@ -2587,14 +2587,18 @@ int gmap_mark_unmergeable(void)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> +	unsigned long vm_flags;
>  	int ret;
>  	VMA_ITERATOR(vmi, mm, 0);
>  
>  	for_each_vma(vmi, vma) {
> +		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
> +		vm_flags = vma->vm_flags;
>  		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> -				  MADV_UNMERGEABLE, &vma->vm_flags);
> +				  MADV_UNMERGEABLE, &vm_flags);
>  		if (ret)
>  			return ret;
> +		vm_flags_reset(vma, vm_flags);
>  	}
>  	mm->def_flags &= ~VM_MERGEABLE;
>  	return 0;
> -- 

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

> 2.39.1
> 
> 
