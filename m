Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA8975C648
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 14:00:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YHXM7KcA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SI/EYGMP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6p6F71Lsz3cNB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 22:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YHXM7KcA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SI/EYGMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6p5K1BpRz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 21:59:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689940784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Y7rbnaDJbn/YejSF4mQVA8Z4grlfMZHjKPnDFxLZ8A=;
	b=YHXM7KcASdfLkCmk6CoRB72/QDK4OrdLrBvJOV0dmj6dvtr5W4iyzaQ8zq5ogSIW2K8sd2
	AyrJDQhEqno3eUs4XUImLLHNqJ+5X7vtpDt+XkEJiEODpN8WBJJ3vyZr7sWNMiH0QK1Cq8
	BFx00o/DhAWw79gVMgpmqqsHqxndlNQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689940785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Y7rbnaDJbn/YejSF4mQVA8Z4grlfMZHjKPnDFxLZ8A=;
	b=SI/EYGMPxs3sG0Shg+mAasgdK1Wr6g2Do0jHrrOve0q6stPYvVWL2LPrG2ZkSWzWOLNOP4
	AyvrGguHF6snlrCbgDU0e8eXg6aHYdwRB2AO4nFliTDOyMgicfULEBLBeu9QRY7sNPoDuy
	IfMUVBN5S/dHd9qLjQRNsw6jR2o0NvA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-_igoYDMcOXyYSW77IVCNiw-1; Fri, 21 Jul 2023 07:59:41 -0400
X-MC-Unique: _igoYDMcOXyYSW77IVCNiw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993c2d9e496so119393266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 04:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689940780; x=1690545580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y7rbnaDJbn/YejSF4mQVA8Z4grlfMZHjKPnDFxLZ8A=;
        b=XQPKizXYCsVP9s0tObnVOsrZHcwlov7XgHP7CKQSXccYYnJ/aS4mjlJKvGKxyS34JO
         O5AAJIsvqOfyocSQ0J4IBLeXUh47hnbCfeAN5VAJ9Dnnz+PlYK0FGYgBPAYnDduntwrE
         LsCvJx4JE+MsZ/cf/5ux9DbX83YZMC4MMXGn5KbpraGsLW4EEHhA05pShZMr5zf8RBfQ
         XEkTwpdUtVEjOWvKty8EhTX1gLFJxOSXhydPqfYuVQIdDmVmneDsG04iycibS9kJvtZB
         29gQQDEluXflRb2PgHm4QxPzb3yaPFxBZWD033m50MQqfDOLmNqi6PXOJZFaf9zii7GU
         KgNg==
X-Gm-Message-State: ABy/qLbg0+wz5kML3Q4sA2NhavCH9DZdT0DUPqHgIYy5JvnJw51gYfTu
	FzoLba9XlBI30HQ6AB2TR4jJ52SdCY3jEu3eGljdXbgcob8cS2iM55+91b/0WT+4vzZtMm8apIM
	qUBykHLM57KX+ObzJKDtYF4P7ng==
X-Received: by 2002:a17:906:2da:b0:994:54af:e282 with SMTP id 26-20020a17090602da00b0099454afe282mr1360618ejk.10.1689940779999;
        Fri, 21 Jul 2023 04:59:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEk/l1rT7vVGyK6B+M0/vN6OF6CipTv2G0AE0UWGqg9sgFPNWcoUSGmc+Sw2v1G9OPem3PIcQ==
X-Received: by 2002:a17:906:2da:b0:994:54af:e282 with SMTP id 26-20020a17090602da00b0099454afe282mr1360600ejk.10.1689940779630;
        Fri, 21 Jul 2023 04:59:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id um15-20020a170906cf8f00b00992b3ea1ee3sm2078970ejb.159.2023.07.21.04.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 04:59:38 -0700 (PDT)
Message-ID: <6118063e-5c91-acc4-129f-3bacc19f25ce@redhat.com>
Date: Fri, 21 Jul 2023 13:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-10-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-10-seanjc@google.com>
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
> +static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
> +			    unsigned long attrs)
> +{
> +	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	unsigned long index;
> +	bool has_attrs;
> +	void *entry;
> +
> +	rcu_read_lock();
> +
> +	if (!attrs) {
> +		has_attrs = !xas_find(&xas, end);
> +		goto out;
> +	}
> +
> +	has_attrs = true;
> +	for (index = start; index < end; index++) {
> +		do {
> +			entry = xas_next(&xas);
> +		} while (xas_retry(&xas, entry));
> +
> +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> +			has_attrs = false;
> +			break;
> +		}
> +	}
> +
> +out:
> +	rcu_read_unlock();
> +	return has_attrs;
> +}
> +

Can you move this function to virt/kvm/kvm_main.c?

Thanks,

Paolo

