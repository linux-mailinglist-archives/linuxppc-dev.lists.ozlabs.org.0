Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE08A1EE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 20:48:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pk5ljdD0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=imMqXDly;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFpcr6mqGz3vZL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 04:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pk5ljdD0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=imMqXDly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFpc56N1hz3dh2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 04:48:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712861281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZYsCvW//u/CQQXOA7VquWR1RJVn5i/6cYVGpW0idNY=;
	b=Pk5ljdD0oUnRW7iDww4rX/ryDsWMssYKEBjKNDWG0I1v1F+zHYUkdxQPphS+2poSu45fzn
	Fef4Lw9JtRd/hcKF1Y8vT5CM5UMLzDufWU/GZt9VbKq2m8CDiwAqCrbE5xEm25d9XaesOx
	zrgyrv2V0iqSb98Pz8Blpc9aLNI8YsM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712861282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZYsCvW//u/CQQXOA7VquWR1RJVn5i/6cYVGpW0idNY=;
	b=imMqXDlyYRB3gASRX7MzCg2dE5VCfCb3OpbDsrjxtY6cIb/uw9+y3HiKQ5YQqCyD2oX5/1
	vAw8UKke3EXmDQXiW/G5/dj8WLnBoyFPEwW1vevz900eSgZSN3aP/izEvxGx6JbHuyvLlO
	+lF1ize9TRw+1dYEl+MIu5zqu+24ylk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-gHjaQA7IOpi29HLxarAC_w-1; Thu, 11 Apr 2024 14:48:00 -0400
X-MC-Unique: gHjaQA7IOpi29HLxarAC_w-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69a01201ca0so696856d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 11:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861280; x=1713466080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZYsCvW//u/CQQXOA7VquWR1RJVn5i/6cYVGpW0idNY=;
        b=r5eaUqx9s53Iu+TA442aqiIDRxNKuIyMG9ZujVg6AdUF31OQ6jzAzpRD/8ORi0owpJ
         2S8LcEtZMQhKBFbBw4/MrIqLixlciTezwpGqQ/fx5TJEpv6Am1GsDb0B4loYbVxNCx3v
         BirPAQKDDKMLnmSLGWJqeDeY5lTzXxfV1IpJcLa/WcnKlwtP4qBCrgq7WtBMkmO1UqGC
         FqaErfVeAEkVQoZpIA8kbpjeMS+mVh7ebkn3oyAvPT3B/T1NOmeHIo3CJDfAXb4pai0s
         Lnw8th8DetK7CPcxr+wb/D1wPla/6VL0sFzik9vwVcACG8/XaF/rFo2c6hEm4Z1e1FuX
         NEeA==
X-Forwarded-Encrypted: i=1; AJvYcCVa3NZAVD8A7Rjtbza/f74G++T/pXm5kU2Z/k4yRQCveBvOqu4DYifgakTh9aLLxsi5FBBl962hp0YN1mHIPsq1gsb5Tv7iaBFlgbd4/Q==
X-Gm-Message-State: AOJu0Yya+YId9BBLoxCgzIvOEnqhQVLgzTQ0rR4qRciypKUsmc1DOYQV
	qixO9wPWSxHIc/1yD+Kgw5eSkyp8z67uI1MpB4sY4gw+iBK6Yjo+sIBt+oqvD+FZI+OJsBayrw2
	XlYpFyBA6D5417jgRiptS0Y7t3JrE9hMPpx4MZZG4ZFOWLxGW0Vem6D4x2VoncXE=
X-Received: by 2002:a05:6214:5299:b0:69b:1c5c:28fb with SMTP id kj25-20020a056214529900b0069b1c5c28fbmr648128qvb.0.1712861279769;
        Thu, 11 Apr 2024 11:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7S/NCpZfvRlaXUMSJjHCJMO0BUAFkMZwp6uvumqLHKeYZXzRRk2gozszNqWEk8Im7F5OglA==
X-Received: by 2002:a05:6214:5299:b0:69b:1c5c:28fb with SMTP id kj25-20020a056214529900b0069b1c5c28fbmr648100qvb.0.1712861279132;
        Thu, 11 Apr 2024 11:47:59 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ej6-20020ad45a46000000b00696b1050be8sm1276159qvb.133.2024.04.11.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:47:58 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:47:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
Message-ID: <ZhgwXGuUeXbFjrCp@x1n>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
 <ZhP3hDhe2Qwo9oCL@x1n>
 <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfYwwXy9gQap-PJyOrVCcUr-VfK90AKNaRe0VO-G00G8SQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>, Marc Zyngier <maz@kernel.org>, linux-trace-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 06:55:44PM +0200, Paolo Bonzini wrote:
> On Mon, Apr 8, 2024 at 3:56 PM Peter Xu <peterx@redhat.com> wrote:
> > Paolo,
> >
> > I may miss a bunch of details here (as I still remember some change_pte
> > patches previously on the list..), however not sure whether we considered
> > enable it?  Asked because I remember Andrea used to have a custom tree
> > maintaining that part:
> >
> > https://github.com/aagit/aa/commit/c761078df7a77d13ddfaeebe56a0f4bc128b1968
> 
> The patch enables it only for KSM, so it would still require a bunch
> of cleanups, for example I also would still use set_pte_at() in all
> the places that are not KSM. This would at least fix the issue with
> the poor documentation of where to use set_pte_at_notify() vs
> set_pte_at().
> 
> With regard to the implementation, I like the idea of disabling the
> invalidation on the MMU notifier side, but I would rather have
> MMU_NOTIFIER_CHANGE_PTE as a separate field in the range instead of
> overloading the event field.
> 
> > Maybe it can't be enabled for some reason that I overlooked in the current
> > tree, or we just decided to not to?
> 
> I have just learnt about the patch, nobody had ever mentioned it even
> though it's almost 2 years old... It's a lot of code though and no one
> has ever reported an issue for over 10 years, so I think it's easiest
> to just rip the code out.

Right, it was pretty old and I have no idea if that was discussed or
published before..  It would be better to have discussed this earlier.

As long as we have a decision with that being aware and in mind, then it
looks fine to me to take either way to go, and I also agree either way is
better than keep the status quo.

I also have Andrea copied anyway when I replied, so I guess he should be
aware of this and he can chim in anytime.

Thanks!

-- 
Peter Xu

