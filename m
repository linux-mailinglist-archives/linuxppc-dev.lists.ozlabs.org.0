Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7373617E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 04:20:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sNHrZ1LK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlVjS2cK6z30fL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 12:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sNHrZ1LK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlVhT4HrXz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 12:19:52 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-3f9d619103dso454291cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687227588; x=1689819588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EPXA9p2JzuvzKzWgCYYXlon3hk90pdnuUAk2cg5+oQ=;
        b=sNHrZ1LKYtFz3X1H+MgLDy6o0nbrrhrd1YKD6rtJcW3ttYHs9f5dyY0axzWJCvpzWF
         3o0ncsgfP5UDH7NTvRyQAcsGgg9JpLu+jFVAH3FJLnLMFYG+fxywkAC28XwfvqNqZmQK
         IFUklgGtHIOC3T2HblFwLsGfrEizS/eFOyfR59HJGCj3NLATeWYbP+Pg2p8UrZWBeMpa
         32bFBxdll4sSVTWVtOqWKiuT2J6FqgQ2hp7Mod9/Sx0Ak+MTgWCQUN9kS8y1HoT2CBgL
         iZLyV4YibsmMoTiVxXer72V03w1CLB/TQXGwBB9khGhCUst7GGbzHBkJpPmgooW/jTiW
         nYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687227588; x=1689819588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EPXA9p2JzuvzKzWgCYYXlon3hk90pdnuUAk2cg5+oQ=;
        b=l1Lq8bo6S+RtW/rk2jCddvMQ1PFZWWEogAZ/yP116OuYeRFA9bJBDKUld/QuVZwXnQ
         uIvuyd4Epi5/FCVQGPuFnV/xHbYWrq7JhA1nlq9JvmYyG08RkY5Toa/1jzwhBVZ4Ir8O
         4uJYbRfUUcxMvj9kn6Wby8PJQykiRrB9dgpZk4AXoBmZCL6yamlncpARWyzlLftVh9pN
         wFOdBYNsLPjubMe64yR+he14ASbKX6VxHAlDKMVYoOX0KP26VfoBqWEpDwKpdgz7SZr0
         VSCesm+mVf2FuDeldpdQ+4EsXQYqkswLRxpr/kXyAzw5pa4/v9xAdJsMTVyOrxH6DTmi
         SBtw==
X-Gm-Message-State: AC+VfDyRviBQPyruCe36miyuz5AfSozmUFq7q2yDOUALDNbVSZEW6okw
	tZOYCFqxEl5ZouT7qjoks7nw5BgkC+pBAJn4/zY7RA==
X-Google-Smtp-Source: ACHHUZ4X3CzpwwHdrmJnCxXIBAk6HQXykSsn31iNLJMOP1aC/6DP8FnJZ+MTQ6AdfTjiGdmwOfd3hduXZamO7zy5qTQ=
X-Received: by 2002:ac8:7f93:0:b0:3ef:404a:b291 with SMTP id
 z19-20020ac87f93000000b003ef404ab291mr104628qtj.7.1687227587619; Mon, 19 Jun
 2023 19:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <26cf0b0a-cda5-08a9-a669-6966f9e626b1@redhat.com>
In-Reply-To: <26cf0b0a-cda5-08a9-a669-6966f9e626b1@redhat.com>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 19 Jun 2023 20:19:11 -0600
Message-ID: <CAOUHufagkd2Jk3_HrVoFFptRXM=hX2CV8f+M-dka-hJU4bP8kw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/10] mm/kvm: locklessly clear the
 accessed bit
To: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 9, 2023 at 3:08=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> On 5/27/23 01:44, Yu Zhao wrote:
> > TLDR
> > =3D=3D=3D=3D
> > This patchset adds a fast path to clear the accessed bit without
> > taking kvm->mmu_lock. It can significantly improve the performance of
> > guests when the host is under heavy memory pressure.
> >
> > ChromeOS has been using a similar approach [1] since mid 2021 and it
> > was proven successful on tens of millions devices.
> >
> > This v2 addressed previous requests [2] on refactoring code, removing
> > inaccurate/redundant texts, etc.
> >
> > [1]https://crrev.com/c/2987928
> > [2]https://lore.kernel.org/r/20230217041230.2417228-1-yuzhao@google.com=
/
>
>  From the KVM point of view the patches look good (though I wouldn't
> mind if Nicholas took a look at the ppc part).  Jason's comment on the
> MMU notifier side are promising as well.  Can you send v3 with Oliver's
> comments addressed?

Thanks. I'll address all the comments in v3 and post it asap.

Meanwhile, some updates on the recent progress from my side:
1. I've asked some downstream kernels to pick up v2 for testing, the
Archlinux Zen kernel did. I don't really expect its enthusiastic
testers to find this series relevant to their use cases. But who
knows.
2. I've also asked openbenchmarking.org to run their popular highmem
benchmark suites with v2. Hopefully they'll have some independent
results soon.
3. I've backported v2 to v5.15 and v6.1 and started an A/B experiment
involving ~1 million devices, as I mentioned in another email in this
thread. I should have some results to share when posting v3.
