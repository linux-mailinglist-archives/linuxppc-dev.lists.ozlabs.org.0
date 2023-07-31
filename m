Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F618769B9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 17:59:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkTMS+Xr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkTMS+Xr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF2ws2Rh6z30YQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 01:59:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkTMS+Xr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkTMS+Xr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF2vw75Jxz2xqB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:58:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690819095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fe6hbS0UUlu2v7dj0yh2sFuv9miEav3h35iCM+LzrA=;
	b=hkTMS+Xra4BlA2Q1DQQc0MQ+OKfxR+/EzJqHIqYgSVtLNhbH2aIiwrm61fkZ6ZYMmzDKeE
	hUcxfT2NDdgkzqAV8QeSkz7cHeDUlEarwIqNaDnyN/1yuApl0442ehw7X7Eu2y+P16jbUT
	UzkdqIr8rGZa8LvKmC3DN/5a0J7qDMc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690819095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fe6hbS0UUlu2v7dj0yh2sFuv9miEav3h35iCM+LzrA=;
	b=hkTMS+Xra4BlA2Q1DQQc0MQ+OKfxR+/EzJqHIqYgSVtLNhbH2aIiwrm61fkZ6ZYMmzDKeE
	hUcxfT2NDdgkzqAV8QeSkz7cHeDUlEarwIqNaDnyN/1yuApl0442ehw7X7Eu2y+P16jbUT
	UzkdqIr8rGZa8LvKmC3DN/5a0J7qDMc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-bqUFA4BGNCmG4lOvWKFt0Q-1; Mon, 31 Jul 2023 11:58:12 -0400
X-MC-Unique: bqUFA4BGNCmG4lOvWKFt0Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bfe6a531bso158725366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 08:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690819091; x=1691423891;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4fe6hbS0UUlu2v7dj0yh2sFuv9miEav3h35iCM+LzrA=;
        b=a45i4TcWj18ff8tx6SRwGqNLBM8e6FGYC7Dbkiax9WcneOAv1IwXWpHjxA9Xd7Yo1u
         xuyFve+MZgbw+3CJ+8ejva9H+QYe9J2hAaLj5xZwDe34k8MfjB2yVwJv5ROPzHVzyfYO
         YyRhYnuY2Ny0AcGzi1GBI49B2DfqYn6QegAJVy20ZTTEl/++Dc1RDh+JSi5wuUezWaTD
         IsLLO8n1Wq1beXaqcEtGmKPnZiha4uzGwryolcUzc7zFDXigPgTjLTv8FfUbdzI/RMLH
         8FBhCD0qJceWjAS4jdSBB7Mht8W4QM2NbsRWom9A4NJfeWHYn3XWipu6GaxckiZ38rsu
         eSIw==
X-Gm-Message-State: ABy/qLbU2LvQXahvQ0noeIyuE59MC6eUNK7Cv9M+jai6DBx7cy8TFJhz
	1jjt9DONR9jqjnpbQIyAJYRSVIGJByjEUEXV4wAV3yWMkAKe2U8MfD5fPfZcXr9/2pQ3KiGX4ym
	LdncMvOYF3To44hRbf+7pD1W2cQ==
X-Received: by 2002:a17:906:11:b0:993:f744:d235 with SMTP id 17-20020a170906001100b00993f744d235mr164016eja.6.1690819091657;
        Mon, 31 Jul 2023 08:58:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4qcb0DCH0D/UYAr1wihMNcJs7WXVHvdtoT78VyrDkWJveoJUy2CwgTeDnMx93k7Ts+Uy66g==
X-Received: by 2002:a17:906:11:b0:993:f744:d235 with SMTP id 17-20020a170906001100b00993f744d235mr163994eja.6.1690819091362;
        Mon, 31 Jul 2023 08:58:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f21-20020a170906139500b00992dcae806bsm6371003ejc.5.2023.07.31.08.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 08:58:10 -0700 (PDT)
Message-ID: <eb356cf1-c661-930b-2175-427a59267d1f@redhat.com>
Date: Mon, 31 Jul 2023 17:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Sean Christopherson <seanjc@google.com>,
 Quentin Perret <qperret@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com> <ZMOJgnyzzUNIx+Tn@google.com>
 <ZMRXVZYaJ9wojGtS@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZMRXVZYaJ9wojGtS@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palme
 r Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/29/23 02:03, Sean Christopherson wrote:
> KVM would need to do multiple uaccess reads, but that's not a big
> deal.  Am I missing something, or did past us just get too clever and
> miss the obvious solution?

You would have to introduce struct kvm_userspace_memory_region2 anyway, 
though not a new ioctl, for two reasons:

1) the current size of the struct is part of the userspace API via the 
KVM_SET_USER_MEMORY_REGION #define, so introducing a new struct is the 
easiest way to preserve this

2) the struct can (at least theoretically) enter the ABI of a shared 
library, and such mismatches are really hard to detect and resolve.  So 
it's better to add the padding to a new struct, and keep struct 
kvm_userspace_memory_region backwards-compatible.


As to whether we should introduce a new ioctl: doing so makes 
KVM_SET_USER_MEMORY_REGION's detection of bad flags a bit more robust; 
it's not like we cannot introduce new flags at all, of course, but 
having out-of-bounds reads as a side effect of new flags is a bit nasty. 
  Protecting programs from their own bugs gets into diminishing returns 
very quickly, but introducing a new ioctl can make exploits a bit harder 
when struct kvm_userspace_memory_region is on the stack and adjacent to 
an attacker-controlled location.

Paolo

