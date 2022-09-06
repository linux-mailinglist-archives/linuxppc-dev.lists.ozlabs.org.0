Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC055AF485
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 21:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMbMv1zypz3blJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 05:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fkVb6eK7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fkVb6eK7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fkVb6eK7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fkVb6eK7;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMbM75C6bz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 05:40:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662493197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipDmQ48fSdnKUDgmzFqHXYya44lh/1wuhiABbNwvM7Y=;
	b=fkVb6eK7o2pqwScSpO2ePg521/b9HhEOLGxN4rCB9W/75tQawHxT5Lk3EKCYFOQkwWPgUJ
	q1jI9Wh2+cdzZ7k5Wna7Wk6tis12C7EV/o4uDRkuLMJv8PpK2dSVW+6Bb1otzfWW3N6zKx
	uIuFOf/BqEznJXavw4WdJTik/yoq9CE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662493197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipDmQ48fSdnKUDgmzFqHXYya44lh/1wuhiABbNwvM7Y=;
	b=fkVb6eK7o2pqwScSpO2ePg521/b9HhEOLGxN4rCB9W/75tQawHxT5Lk3EKCYFOQkwWPgUJ
	q1jI9Wh2+cdzZ7k5Wna7Wk6tis12C7EV/o4uDRkuLMJv8PpK2dSVW+6Bb1otzfWW3N6zKx
	uIuFOf/BqEznJXavw4WdJTik/yoq9CE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-TiyOAArVPhGoXMhtSoWFJg-1; Tue, 06 Sep 2022 15:39:55 -0400
X-MC-Unique: TiyOAArVPhGoXMhtSoWFJg-1
Received: by mail-qk1-f200.google.com with SMTP id f1-20020a05620a280100b006bc4966f463so10070261qkp.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 12:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ipDmQ48fSdnKUDgmzFqHXYya44lh/1wuhiABbNwvM7Y=;
        b=RuPUlhvcTUppqGgZIF9zRGJ6jXqc6My4BIv5JMVifjXB+mOblegxLwS/B7Be81HhAZ
         vxxFjyJuO02OwyUaT5eEnInuMXOR1sqsrQx1OjqVOEocisL49kyZSIBwxAwmG3dLzzgP
         JjdpEOMYsX3kIG5j7PO2WJU9LZ2x3oF6iwmJESJGVaJxpPzwwlZ2yEhurXiud2/32Fme
         4pART2YTqyElLsHIuWgyOq1uvJHlUrWGiSdjaRB8JGiWlrmDCmCw15UAIHA8OhLVwZA6
         hxTqIQNq0/DMYj59W1WmcNGvg8QgLlzy60VH7ssVF6gGy6jLutudL80rtyVbMPteGVb2
         piEg==
X-Gm-Message-State: ACgBeo3oKtvBqKNJ/WeEvBQL5tKD7O/o3S38ORpdFzIhh7nmtcyayTHk
	7BLhx7p4fJhdF6cjaDEiSEKEgvwwjpGfW3bqQv6D5GagIZQghvuz75Eds1w6kykTnceMf70WZiy
	gnLl7CWmabUPWJLQspQ3PdzMXeA==
X-Received: by 2002:a05:620a:2591:b0:6c9:cc85:87e3 with SMTP id x17-20020a05620a259100b006c9cc8587e3mr165306qko.577.1662493195375;
        Tue, 06 Sep 2022 12:39:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ttYQWiRMBv+iRAUF0TI1KrYDEUj4oUMahpKt92mQKBQU68PcCAvUwsnwEAqRUP4s0fa6Zng==
X-Received: by 2002:a05:620a:2591:b0:6c9:cc85:87e3 with SMTP id x17-20020a05620a259100b006c9cc8587e3mr165268qko.577.1662493195065;
        Tue, 06 Sep 2022 12:39:55 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id bk22-20020a05620a1a1600b006b9c9b7db8bsm12167528qkb.82.2022.09.06.12.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:39:54 -0700 (PDT)
Date: Tue, 6 Sep 2022 15:39:51 -0400
From: Peter Xu <peterx@redhat.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 19/28] mm: disallow do_swap_page to handle
 page faults under VMA lock
Message-ID: <YxeiB2la/9fZEzLO@xz-m1.local>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-20-surenb@google.com>
MIME-Version: 1.0
In-Reply-To: <20220901173516.702122-20-surenb@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 10:35:07AM -0700, Suren Baghdasaryan wrote:
> Due to the possibility of do_swap_page dropping mmap_lock, abort fault
> handling under VMA lock and retry holding mmap_lock. This can be handled
> more gracefully in the future.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/memory.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 9ac9944e8c62..29d2f49f922a 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3738,6 +3738,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  	vm_fault_t ret = 0;
>  	void *shadow = NULL;
>  
> +	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> +		ret = VM_FAULT_RETRY;
> +		goto out;
> +	}
> +

May want to fail early similarly for handle_userfault() too for similar
reason.  Thanks,

-- 
Peter Xu

