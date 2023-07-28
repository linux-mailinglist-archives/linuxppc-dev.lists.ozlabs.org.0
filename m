Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A27668C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 11:26:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yZlBBa+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC2Ly2G9Zz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 19:26:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yZlBBa+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=qperret@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC2L41l4pz308W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 19:25:30 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98de21518fbso274224266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690536326; x=1691141126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MyDeksRVqGtJNd0fe/itajI8E9fXoiZCjVyZ7emrXms=;
        b=yZlBBa+QgG6A3izqrAvYrZmjNARnJqe9UVJDDaWeo1ngnmOt9VRY93kWsBg3OxlgJ6
         BNgAnv6T/0ObsR7NeaCjk+WNJnmyD7Q59yeCq15kUZEqjsFvHdvXA60zH7S6F25/qIjt
         fm8Sg5o5MpunPrL/BqoXYGZy7msDjit8jc0wg2EmQ6Q8Th8F7S82AjrHRl+/FMq8bTJh
         sEoAOBkEqP29Krhf8xqYypp/joUWh9VUOF8DEcZIisv2V3iWTfC6qxmMhKHNjRW9HI9T
         TolK5KmZ7NzIlhfQCguxbwjQDJpXunGMqxws18N6XaE4FtdLuzrmk4BalRM99UvIXMiI
         LjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690536326; x=1691141126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyDeksRVqGtJNd0fe/itajI8E9fXoiZCjVyZ7emrXms=;
        b=cyo8vmf2S/9gjKYFJrgWae3jJRiQ7MehT4eG/uluW0fomptRfAos4L53PpgLhUb8As
         aQnIWjrmysz3znF6lFwdqAByn2QIH00opA2YnCwgREH7DwdZ9+N2QHqZh/xUjZ7M0Ram
         KNkL22oq0mCFgiDIrLboIy79C7MuUV8HADr9sj1xbNGAMUv00luCoESZR7Zv7Iy5bqof
         OjgpCzWlNsSiMRtOw75xt+mxmnzR6i1Yyf+/cYghhmp9cvHH2Y+Yv0zdXwKhvW2rngqv
         mCpYTg0PYNNBDXDt5e8fiVzQMjhgR9Bf27jNtXu5bq2JUS60kJlXs7g+qnaZp7v0uJwr
         112A==
X-Gm-Message-State: ABy/qLbvs8THcwX/OTlgfW9QLKqYh+/ZWr1ZxKF7Yz5fK5teK5O8qihw
	GqGh/1U0+qBXmCWMY6yVmXInXg==
X-Google-Smtp-Source: APBJJlG4DNtaaix3llwTkCcLiQNG9ALlnJv6ynH+2HDeVn6HzB3Xx8i5ieUEd323eDEBkV9C48RmSw==
X-Received: by 2002:a17:906:8454:b0:994:1fee:3065 with SMTP id e20-20020a170906845400b009941fee3065mr1975862ejy.15.1690536326590;
        Fri, 28 Jul 2023 02:25:26 -0700 (PDT)
Received: from google.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906688c00b00992c92af6f4sm1857653ejr.144.2023.07.28.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:25:26 -0700 (PDT)
Date: Fri, 28 Jul 2023 09:25:22 +0000
From: Quentin Perret <qperret@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Message-ID: <ZMOJgnyzzUNIx+Tn@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-7-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linu
 x-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
>  };
>  
> +/* for KVM_SET_USER_MEMORY_REGION2 */
> +struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size;
> +	__u64 userspace_addr;
> +	__u64 pad[16];

Should we replace that pad[16] with:

	__u64 size;

where 'size' is the size of the structure as seen by userspace? This is
used in other UAPIs (see struct sched_attr for example) and is a bit
more robust for future extensions (e.g. an 'old' kernel can correctly
reject a newer version of the struct with additional fields it doesn't
know about if that makes sense, etc).
