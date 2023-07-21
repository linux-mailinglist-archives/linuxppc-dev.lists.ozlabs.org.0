Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33975C522
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 12:58:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SiAePRvN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VEz5gCws;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6mk92ZDyz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 20:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SiAePRvN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VEz5gCws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6mjD5Lwhz2yF9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 20:57:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689937035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCcb9xtScqAyMOStlm7ewhQnyFA6r02pOvdu3ozJ8ms=;
	b=SiAePRvNJr9R9f0/coSAadNl1sPpJUg4WJnYbnS+td6QjG068tu6JYm488GLI07gDstLJf
	Fo+Q1LyAXYuINlNK/myGfoFgRO/qqg/SKMGro4N9SvL6rP17KfZi5zvQQWx+812+RxjwqU
	V10UMW0xcpXWd/Lob/tw3BBDhUSaj30=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689937036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCcb9xtScqAyMOStlm7ewhQnyFA6r02pOvdu3ozJ8ms=;
	b=VEz5gCwscuh5LqfXyEnzS8lrA/fMhZxeXyAVnZa0fOpQLFzAEFwXZ9pnpnEhqbTHNsfISf
	A8E7m9iD49Risgcv68+gM04ENe4w4M2/Haa7r4VRTLEXvWylwE5SyLayikfBwRyZsFGdnw
	L9fZUHBmw4IkegdWMF4KrW8mS5rHyMo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-DLvzDS4JNsyDmyfGV8fnNQ-1; Fri, 21 Jul 2023 06:57:11 -0400
X-MC-Unique: DLvzDS4JNsyDmyfGV8fnNQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-98e1085308eso338395266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 03:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689937031; x=1690541831;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCcb9xtScqAyMOStlm7ewhQnyFA6r02pOvdu3ozJ8ms=;
        b=OrNuEEbRV2nDORZSw66Z1lYWy2V+mWLC+OQggk6hc3ekN6DHGxOICw4yPUzwReSgFl
         3lSmWQY1I5Za5BMcWhnlxPT2eqoi+yt7NdjAbfH8riTVaT0fX2YagJ7FB3A4Rfnm7Jqv
         C1B+vEvBlC+FGRI9A37eEwlGv3E5BsAZPTdum0dT7xO1a2A2ZcA4k9NhWMJkG7yHAVys
         BwNuM2GABpY3L33+UVgoRC6EtXmP8bjxLsyiY4NXBFPawHayTmX4lGpNHqh5pLa1zykb
         95veXvspEi0zPmFwaDzz3Gw/+dpRNUrWje8yjbeCqF36TlunMG5yexEKxivE+5o4mLIa
         LhzQ==
X-Gm-Message-State: ABy/qLbIYxXyuJcf324vOjMG4HsY9lUdqDFJz8ZRHCLRd/IwKQZ7jt7z
	GqJipe53CGHBQigXyrDxlcLyq1FYDRa74BlHml5qph/IJY6N6E1wPZcw2pPOQNsElB81+tHGmW6
	ecnDKy7BhNcmjsGXdQASOiVbqrg==
X-Received: by 2002:a17:907:d8a:b0:991:d414:d889 with SMTP id go10-20020a1709070d8a00b00991d414d889mr8230244ejc.15.1689937030832;
        Fri, 21 Jul 2023 03:57:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHG8R7IreJRTfdc0Wq/Yo7PIzOhZZy/jcnGLgxDY0N1OVv0CFUqys6sH346KYqEVj6MNTbrkQ==
X-Received: by 2002:a17:907:d8a:b0:991:d414:d889 with SMTP id go10-20020a1709070d8a00b00991d414d889mr8230204ejc.15.1689937030548;
        Fri, 21 Jul 2023 03:57:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f21-20020a170906049500b0099364d9f0e9sm2025435eja.102.2023.07.21.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 03:57:09 -0700 (PDT)
Message-ID: <0c033063-5d20-4522-87e2-80ad3cca3602@redhat.com>
Date: Fri, 21 Jul 2023 12:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-9-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/19/23 01:44, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> In confidential computing usages, whether a page is private or shared is
> necessary information for KVM to perform operations like page fault
> handling, page zapping etc. There are other potential use cases for
> per-page memory attributes, e.g. to make memory read-only (or no-exec,
> or exec-only, etc.) without having to modify memslots.
> 
> Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> userspace to operate on the per-page memory attributes.
>    - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
>      a guest memory range.
>    - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
>      memory attributes.
> 
> Use an xarray to store the per-page attributes internally, with a naive,
> not fully optimized implementation, i.e. prioritize correctness over
> performance for the initial implementation.
> 
> Because setting memory attributes is roughly analogous to mprotect() on
> memory that is mapped into the guest, zap existing mappings prior to
> updating the memory attributes.  Opportunistically provide an arch hook
> for the post-set path (needed to complete invalidation anyways) in
> anticipation of x86 needing the hook to update metadata related to
> determining whether or not a given gfn can be backed with various sizes
> of hugepages.
> 
> It's possible that future usages may not require an invalidation, e.g.
> if KVM ends up supporting RWX protections and userspace grants _more_
> protections, but again opt for simplicity and punt optimizations to
> if/when they are needed.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
> Cc: Fuad Tabba <tabba@google.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

