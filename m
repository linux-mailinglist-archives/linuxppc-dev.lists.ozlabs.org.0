Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17811759C2A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 19:14:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ks93h3vt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ks93h3vt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5j8n0GpLz3c4m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ks93h3vt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ks93h3vt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5j712Vpvz306p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:12:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689786746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkcPX3Osb4OA2D5IidduaA2zXjGkNlWKrQ0mhSge49c=;
	b=Ks93h3vtqS+uYmBR9wdp94NuYQOIw10HTA1wrD0Vi8kOR603y9p9aYfS6285k6gvUUZJCJ
	IbExLWZmtckmvuAf3M+poNZUTwwaSjlfneAb8yT+DHQP7rGvbZqwpzHPWEazHUJMw6fgCL
	Lblm47gR2vFKNgHNueyaLbmH/7ORU7M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689786746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkcPX3Osb4OA2D5IidduaA2zXjGkNlWKrQ0mhSge49c=;
	b=Ks93h3vtqS+uYmBR9wdp94NuYQOIw10HTA1wrD0Vi8kOR603y9p9aYfS6285k6gvUUZJCJ
	IbExLWZmtckmvuAf3M+poNZUTwwaSjlfneAb8yT+DHQP7rGvbZqwpzHPWEazHUJMw6fgCL
	Lblm47gR2vFKNgHNueyaLbmH/7ORU7M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-NEIEl-o6MSCj7Llm71YhVg-1; Wed, 19 Jul 2023 13:12:24 -0400
X-MC-Unique: NEIEl-o6MSCj7Llm71YhVg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-978a991c3f5so420149266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 10:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689786743; x=1692378743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkcPX3Osb4OA2D5IidduaA2zXjGkNlWKrQ0mhSge49c=;
        b=gcd5oMpGgbm/bmZ0u7WCV8B2T3VGJfsvvLNaGl2ZtxUJI2WGc/8b1jIUiL2JvN4UgM
         ckwpFv8Q317lvsPShrFvk7DbtBFawv1REefp13NsfijIK/QaFuQNia9WAGtpKuX+ei5/
         NeJx355+mg0oHHSgYxPeRlKP8NRCct193xOAlrUNa+Jg/EmPxNkim3LphcbG/EwHrDrJ
         lvK1W6jdo0ZRNalzgQC522qKcUZfScEQ8kzSdHuXO8Y8+Q/sIxBQDigy/czWLNYqKyFw
         dRpLdeyr8iFFX5pxJ+pGhqUxUoKsnh/KndC77bgDNyrBnHgViOeke5FhnqYoE0+rQw3P
         8EJA==
X-Gm-Message-State: ABy/qLYdl+x8EjVQHmJo/OMaV9n5JAy4JcRnJKPon9gn1W0jIS5A6OOJ
	TmUrWU2loDSsXPSAyH1BWLeITcUMyjkLbSXc7+4kbh+ZCJgMzRVD8ResfIo8jrLsLUGVj47FtHu
	J0EuRiGC32GnLgN7xqKILWjq+VA==
X-Received: by 2002:a17:906:d84:b0:994:54ff:10f6 with SMTP id m4-20020a1709060d8400b0099454ff10f6mr2451584eji.30.1689786743717;
        Wed, 19 Jul 2023 10:12:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGz54zGhPvYMbmpFt53PQK6LgNX37cQEB9yNTieid5ItMiwID6yFOylHPqQjVFsqfqQ8BKwkQ==
X-Received: by 2002:a17:906:d84:b0:994:54ff:10f6 with SMTP id m4-20020a1709060d8400b0099454ff10f6mr2451551eji.30.1689786743496;
        Wed, 19 Jul 2023 10:12:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id h24-20020a1709063c1800b00989828a42e8sm2589100ejg.154.2023.07.19.10.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 10:12:21 -0700 (PDT)
Message-ID: <095133d1-ad3a-8b5d-d000-10b0b377c7b3@redhat.com>
Date: Wed, 19 Jul 2023 19:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 02/29] KVM: Tweak kvm_hva_range and hva_handler_t
 to allow reusing for gfn ranges
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-3-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-3-seanjc@google.com>
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
> Signed-off-by: Sean Christopherson<seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

