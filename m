Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285F7DC24F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 23:08:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hxk+/HDz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK6pt31k1z3cVg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 09:08:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hxk+/HDz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3jclazqykdkczlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK6nz2nvgz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 09:07:35 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc3ad55c75so13204005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698703652; x=1699308452; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkAABuzKmGyzNibmrxwxoleV2c1qCswFjV4kStA9p5Y=;
        b=hxk+/HDzwAhc8PlY7dsWj9wtWOBQY9H/nOVf3ewbjVqS9tcNbDtsz2C0j5L3Znaxo0
         pLpOLx3d20PdCOHIdGJM+ui8UiyRWR9EoEYRkCKFLWgI2ZJlTKcZQyMfoRjQ0SqHJPd0
         8mViVqnuy/cFTUDddsIN8zO8pM9+t9xxq46YTFkBc5QZgE+cpi78eAxipLJNVA1xJcxb
         2xvXJyFUJcdki2ft22wfUdlkULETKA+Bc7H7cCo/FUeDvBIc3WPBD4sbwfHUkFMkK/iJ
         STyvLWJq9DK5QoEm8Aq/fbe6MrYZopY+m96Y+nIearNGutPzs9cN8vNBMDE+KxTks5QT
         io9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698703652; x=1699308452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkAABuzKmGyzNibmrxwxoleV2c1qCswFjV4kStA9p5Y=;
        b=FknL9trDj6wm6DgWxMxszqY/G5QhnBWIudq8Wy+GCUkKmRkSDDQKEbXF6rPXk+tpaB
         L3v4ykgxmqv+Mm9tXGJZlPP/Y9/P64yst7R2afZ/jNkpfB/+1sRJqzLC1BEpgKaNHkgP
         xrFhLllumRWRgQHHCijL8OztfW+N5PfBVV/NnZESUjGue2uH9dzRyiFfDaFX+h0nABLq
         7jhidjysvMwE6VYDP8E/9rAx5SErdeCuWRc7ibIG6kps1PQNXLgv53HJnAv4DaBECsRa
         2WACsbvAUn+jc0Ho0RcDiQaOELubNLWW3wjvG2ftbYMCPmrnpy73+bjf4MVLEmiJ0lvC
         ZJMw==
X-Gm-Message-State: AOJu0Yxa5AiI2GBF+tMA1qb294Dhke9jjCusFN+rYgrayDZiCaH2qNk6
	lzMUAkuTroC2o0g0QStvpnpHdmtQhnE=
X-Google-Smtp-Source: AGHT+IHfmttfYISWufdVkZGI1GGv3oPE0CaVU/9uw2yWegmaBLqLOedbYI1/usu4SKmN8TEK3NCdArCTZyE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ed45:b0:1cc:533e:f52b with SMTP id
 y5-20020a170902ed4500b001cc533ef52bmr49726plb.4.1698703652255; Mon, 30 Oct
 2023 15:07:32 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:07:30 -0700
In-Reply-To: <077cec97-7920-4d20-8bd3-fe07ab8bcc29@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <077cec97-7920-4d20-8bd3-fe07ab8bcc29@redhat.com>
Message-ID: <ZUApIvo_gIdsfEEV@google.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, l
 inux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023, Paolo Bonzini wrote:
> On 10/27/23 20:21, Sean Christopherson wrote:
> > @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
> >  			 * the second or later invocation of the handler).
> >  			 */
> >  			gfn_range.arg = range->arg;
> > +
> > +			/*
> > +			 * HVA-based notifications aren't relevant to private
> > +			 * mappings as they don't have a userspace mapping.
> 
> It's confusing who "they" is.  Maybe
> 
> 	 * HVA-based notifications provide a userspace address,
> 	 * and as such are only relevant for shared mappings.

Works for me.
