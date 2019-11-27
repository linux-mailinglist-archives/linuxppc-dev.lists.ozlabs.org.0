Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D551610A941
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 05:02:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N6Y235KSzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 15:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UA8cQT4s"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N6Vh3VRWzDqk8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 15:00:04 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id k1so1738083pga.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=tPzDWP52pMIW0y9GhlwYX53ztb59aZtQFUquyPdBxfQ=;
 b=UA8cQT4sPPzDAk/yTmdElxaXyjFhnyRrpJcZyeNQEMYcKEux7hM1c6kIoFx1I+yZuQ
 wN9kOvOYAVbLuLJgFdUCiA93CNslXHAYkYU3YhHVBar9wTtwlvW4T1is/gL3v2G+qHAe
 2dHdKnVESFH0+imrOfB2xhv6HRYVpoAapdyhCtotxrTInZD0aaLaqfC8ShIPlUDnPnm6
 hMaAUCobOX6QapYVbPDqtF11Z+brEgBxb6KoiNMrE8ELQja4mIfRiRA5m/wmUn6OuN/V
 FmfyMc+d8Ryyd2YkcVQKs4IdCof104zjZEnhS5YbupC5ASsJtZhUFtQj7Io1kcfMVCTJ
 ic+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=tPzDWP52pMIW0y9GhlwYX53ztb59aZtQFUquyPdBxfQ=;
 b=Bi/a5HnbgTwrESMhrIUeTkZ+77BvVavy/2bIAQPg834ywaQzkJRbZXUtg1cOALQlHa
 nV9uarKL8nwzUKVMhYp95kTPBEorJJPU10AWYbfwBRY7g7N1FYzHiuugGJRiDZgQMuGh
 Fn1+qvzkLm64iXFs4pbgQDe65/B3NmIoopLj5TC62Z9ggFMPIC5ecPLLIH6lL480b52Q
 48wHz95i7no+UuJOSKbiC1kjHcUEKW2aygT9dyBSYFRyeATgXYGEzEj1V7mHl9GM3hOL
 /yGRQybfw3Oq+RxWAWJbX4whj7NOQjSn+WpZWVeNHfEH7jBv5Q8UqLgu7k25TyNRKcec
 QEVA==
X-Gm-Message-State: APjAAAVZdiQ8cTmAf4s4R9pX/w3sj66DYdFbd0UHZCD+otF47MBfoZMK
 5K2UWGVuPtq02kr+LYQd4SvElQ==
X-Google-Smtp-Source: APXvYqxNhIt4XZITVq9WPYXV1dSIMA6E+ZrqrkYj3fsimovUhhlRrArdOtsqQOIYfGGnTZLFn9wNGw==
X-Received: by 2002:a63:6d4f:: with SMTP id i76mr146712pgc.301.1574827200514; 
 Tue, 26 Nov 2019 20:00:00 -0800 (PST)
Received: from [100.112.92.218] ([104.133.9.106])
 by smtp.gmail.com with ESMTPSA id m5sm4479407pjl.30.2019.11.26.19.59.58
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 26 Nov 2019 19:59:59 -0800 (PST)
Date: Tue, 26 Nov 2019 19:59:49 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v11 1/7] mm: ksm: Export ksm_madvise()
In-Reply-To: <20191125030631.7716-2-bharata@linux.ibm.com>
Message-ID: <alpine.LSU.2.11.1911261834380.1600@eggly.anvils>
References: <20191125030631.7716-1-bharata@linux.ibm.com>
 <20191125030631.7716-2-bharata@linux.ibm.com>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>,
 linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 Nov 2019, Bharata B Rao wrote:

> On PEF-enabled POWER platforms that support running of secure guests,
> secure pages of the guest are represented by device private pages
> in the host. Such pages needn't participate in KSM merging. This is
> achieved by using ksm_madvise() call which need to be exported
> since KVM PPC can be a kernel module.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
> Cc: Andrea Arcangeli <aarcange@redhat.com>
> Cc: Hugh Dickins <hughd@google.com>

I can say
Acked-by: Hugh Dickins <hughd@google.com>
to this one.

But not to your 2/7 which actually makes use of it: because sadly it
needs down_write(&kvm->mm->mmap_sem) for the case when it switches off
VM_MERGEABLE in vma->vm_flags.  That's frustrating, since I think it's
the only operation for which down_read() is not good enough.

I have no idea how contended that mmap_sem is likely to be, nor how
many to-be-secured pages that vma is likely to contain: you might find
it okay simply to go with it down_write throughout, or you might want
to start out with it down_read, and only restart with down_write (then
perhaps downgrade_write later) when you see VM_MERGEABLE is set.

The crash you got (thanks for the link): that will be because your
migrate_vma_pages() had already been applied to a page that was
already being shared via KSM.

But if these secure pages are expected to be few and far between,
maybe you'd prefer to keep VM_MERGEABLE, and add per-page checks
of some kind into mm/ksm.c, to skip over these surprising hybrids.

Hugh

> ---
>  mm/ksm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index dbee2eb4dd05..e45b02ad3f0b 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -2478,6 +2478,7 @@ int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(ksm_madvise);
>  
>  int __ksm_enter(struct mm_struct *mm)
>  {
> -- 
> 2.21.0
