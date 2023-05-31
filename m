Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB77189F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 21:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWfDS5tMNz3fFy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 05:18:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XsEc9zVF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XsEc9zVF;
	dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWfCY4CYkz3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 05:17:11 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6af8b25fc72so92218a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685560628; x=1688152628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHtweHA3SWHMpKKRoTnSYY+2sgOnMlETASaKZp5cnWg=;
        b=XsEc9zVFJou7Y3nnebryiByVBn6LMK4Wf9l4nO5gpford+hJUA/H2QpOG0COLFuX5a
         URGPWFQpc3LDA6bntwf8mYCOUR7LRedzET0Ewd0rzO9PgVPKYEFRaNqy9Tly9asRKiaJ
         uFEF3kE4Sc6oLXyO2nGQxY+xPOxeWYxp2VOpLq6pkzybqeLXldDHEX36YE+JV0/2WgYR
         MEZP0OGJ34Wk74uKTPmjaR3f2Bt+Qidy74lDTyE54KXWUVya+wI2fELz6WmymjadQ0vz
         6R6qPRykBkgotiP004pJgvChmAdW+rE0X9JyPAJunztg1ytyzcjhuhEpYuoYimbwCbpO
         ox3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560628; x=1688152628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHtweHA3SWHMpKKRoTnSYY+2sgOnMlETASaKZp5cnWg=;
        b=FJgdxewTz6EURff1/ZaQNMvF+ga1tvhyJrzStnoDWimqfOzNe1B2aYll/95xknEZ4O
         z5RWyRuNTf8GeCuED8A2wNm1lxqRy3mmU824ehsMOwmBAX//Vz0Ix7xhkcY1YWC5b1wG
         n7Kv+NrRjJr6FFQFsqXTZ3sOoTCLzxJ4+5I/euQbGSsMKCnNyOTwu0sLRsfS9eB0k0l9
         M3gU1eAu7qBpxMttou3pIRIUL6/ptCZKhJqzvmCK+avOtCjgB+dYVs/s/z65EQgNPCnl
         ZlDnatPbNWBgQ02veQ7d1zzGNe8zSUSWIYETtI3MV/ICmwtVBi3SKM+NP9871pmYS2HB
         06fw==
X-Gm-Message-State: AC+VfDwpPz1Ar/t96G0gH62a+3cRU+spMNKyFAtDa6LpiXrsfBajzdih
	/DHIrUEqqHXTCaYib6l2/6StaQ==
X-Google-Smtp-Source: ACHHUZ5EAb6uxqk7kkbizac+JrcIuoYNmIlHHRhpUDjRmBZ8boj1JThitoXP6J0DZ/TEoplrWHjlbg==
X-Received: by 2002:a05:6358:7e9b:b0:123:3203:928a with SMTP id o27-20020a0563587e9b00b001233203928amr1487114rwn.27.1685560627568;
        Wed, 31 May 2023 12:17:07 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a300300b00250d670306esm1594668pjb.35.2023.05.31.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:17:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q4RJh-0017d4-7W;
	Wed, 31 May 2023 16:17:05 -0300
Date: Wed, 31 May 2023 16:17:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add
 mmu_notifier_ops->test_clear_young()
Message-ID: <ZHedMX470b7EMwbe@ziepe.ca>
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-2-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526234435.662652-2-yuzhao@google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.co
 m>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023 at 05:44:26PM -0600, Yu Zhao wrote:
> @@ -122,6 +124,10 @@ struct mmu_notifier_ops {
>  			  struct mm_struct *mm,
>  			  unsigned long address);
>  
> +	int (*test_clear_young)(struct mmu_notifier *mn, struct mm_struct *mm,
> +				unsigned long start, unsigned long end,
> +				bool clear, unsigned long *bitmap);
> +

Why leave clear_young behind? Just make a NULL bitmap mean
clear_young?

Jason
