Return-Path: <linuxppc-dev+bounces-13654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98CC27DA5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 13:14:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czGxP413Cz3btS;
	Sat,  1 Nov 2025 23:14:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761999273;
	cv=none; b=k4l6LmdJZJ5nUu8rYo3558P+jwbetPauV25b28uSmdNs1Dx/E4OyTWeEkXarKK+ezwUoy2lR/qFgVzcGOODkNoj/quQqiPqyHn937a3edAfQrkgBifkhGqThLs/qVHkrq9S0oo9SDK6knwPCbEGSzn0pauh00SRbCuci4ZgAbhf3moXzm2yq+Bux3GMq+nP7YIlfZ3xzxK2hXa/pfKzJG+XXfbR7LESv9EydHI29I9AoVFPfYx1h51Ygxeh7GG9E+SLdZhEz0eCnNPJjThE8bGEpbSS9egdyF9CYHyuCwiM3FmOToB+TBOHDhJIhatoomWkAsZqFlm+4SpT9DavI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761999273; c=relaxed/relaxed;
	bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OE0fLmBVITrAx+yXM/35dW8wyPRz0dgUHpPqvKD30JivXAKQU4ysKFcBOdFbjWbBjvpbe5bnMH224SdAfy7e1lk3T5hd1ibT4WXJNN+vHTt9oFWkrtmI7WsGDJZwhnAdygzYsoZN+7Wm08Dut1dt3WGuDFx3Mbnol5cTNKd16VN/kXmFb6zLzYV9eZPCBxhvbnf9XFPKr9mUIEyD8dJvSvK8gJVKnEfXKMZb3rTCju32zHFdd862Z75soCDvErZs5F8PHPue+x/CjVpzxo4kSNUBUYEOHspesikZqPtY7TkmIpKOw6YhQfUsBhpVj4uoNxAjo+wrRAS3S/eyi88mhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hR6OaIdQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlhA66cX; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hR6OaIdQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlhA66cX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czGxN3shtz3btL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 23:14:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
	b=hR6OaIdQ/mskn2JcUFjIcD7cyYV2Uy38kvmgu2Fssn5ZDGGA+jTJWPrICQjJRX90YDApnh
	HcKBLYOiHGS78S3EvQTWgRPDBYYhfZz25B4VIWf2DtjG0RIfPBDAub+CRTO8ei+doJavPU
	onSH+pOIoF8Kt3NRLbAdKKviXA/0yDc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
	b=DlhA66cXtD86uIDQGJ6vKgiCCBO4VHOAsJliefyWAYl5vH0g5opYnZrdcuQc21jsrVhAGd
	os12cihNvDmVIHJxS2e2ByGjXZCxExf9iN70WCyzerLNMP6aqPwn6dYu4ZKWh7x1Pqs0Dt
	gRH4wcU5V6Z5DkNNSlv0+EwCD+9lQqU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-ri5M01JxPNebC12yh5D5rg-1; Sat, 01 Nov 2025 08:14:26 -0400
X-MC-Unique: ri5M01JxPNebC12yh5D5rg-1
X-Mimecast-MFC-AGG-ID: ri5M01JxPNebC12yh5D5rg_1761999265
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4298da9fc21so1835738f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Nov 2025 05:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999265; x=1762604065;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o048ati210LDdtQS+FOPO4jSMwtVqN57n5BUaVz6yTU=;
        b=Qjh6hCEMRpGjlm06E9koEUBrgvxIVtKlhGP37k+fqP/jlMFzYXQsviydeOgPjhRRht
         LeE9GN/3IvwLFccVcfAnDq8AwWW76MbnxW1sZTnDOrKFt/P3coef/aErAdHR70qpvKEu
         Dr40fhVtYFh9sT0WbLwzYgTuBlbPfclTsAvlhPGbEcyMYZkQsJH6DSXiQ1Y63cORE59n
         fP5NA+jx+K1MyYqPDVxdGOY4P1+LFtN+zyRrALG1miuUtYWsWqgMuSbzLRNYnc7aK8ey
         imnkN1fI5cxx5qxmpdDZDh3Q1aoMalRtRJOZUzPk2vHASWy6RG1R7km7Pkt8RLZiqjhf
         3wyA==
X-Forwarded-Encrypted: i=1; AJvYcCUK8B3XvgYS2/BXL20S8h2/aJQDTSPk9Izo94nPFHhXEf9FYdJ/Q5y/voimmDudNGY9I5omS4lGvZBHhLw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznPsHa8kpLfmHUlUyqwFG5PwP/e9pNJZxtS89JkRNokbTbWVGk
	IktSl3VLR5i8rj7y1njz2sYC6NOYCpPURtVSYILq8PoJptPtFhy4doVtU1H1H1P5BbGSzmBuTjQ
	VjNebbKjpkw7DaUxSOH1wkbOCx2fDc8OLtL6U2nnAGPbGb9TJbZ8U+k/y5Hypmispx74=
X-Gm-Gg: ASbGncuqJ4fSIiHEFJtDchn2cypVbygSWH0NdMivvZyNuyHJ3OZ+HDNu02VyOMGFaJm
	ON4JTFv4L1yYbP+9r0W3YHrK59E/V24Nt8tvm5Tr71vO240mwlxaEsSNhRtnOD59TISX/HZgKmm
	wI7D4fa/p7gm1NCeM5xnlfo07oC2fHbQU9Zwb2QwYw1sDj05raL4I26oBYvKk9QZ92viGJBd/ev
	nqPQj1cGds9Y7fbMe+l2efLqS8XDam8VRhSzKxrljAVjm5hxt0PFpxaKnMqiaGz8tPqHP4wrk84
	eHjyrQJ7Y9WScefUPkpiMxyeZzkMatZba4Mx9zZ0ugXCqwu/s82FhG0Rwyyul62NQEO9rX1ZIHF
	7EZ0t/Kif2fBPbz2jpOdIxl71Rao8aiztMSdrFdtXdpsjilW3CaCNYDFfvzLJJ1beLDpZ6n0D/6
	L+8tPQkU4FTi4csH4XXq6AhZ2d2L8=
X-Received: by 2002:a05:6000:4006:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-429bd6c1e9emr5632369f8f.58.1761999265093;
        Sat, 01 Nov 2025 05:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUnlqEI4i/IitGbkGmSb5mhRBlBddO47B8HgBUkc3NNZF05OsloV2rMzQDwADfEurYYBklUw==
X-Received: by 2002:a05:6000:4006:b0:429:b1e4:1f79 with SMTP id ffacd0b85a97d-429bd6c1e9emr5632339f8f.58.1761999264653;
        Sat, 01 Nov 2025 05:14:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c10ff584sm9569867f8f.2.2025.11.01.05.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:14:24 -0700 (PDT)
Message-ID: <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Date: Sat, 1 Nov 2025 13:14:21 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-3-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: za7HpuVA4W-S40D_LgU_A7TUOHGC46r7h4mwWq64guc_1761999265
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 11:08, Kevin Brodsky wrote:
> arch_flush_lazy_mmu_mode() is called when outstanding batched
> pgtable operations must be completed immediately. There should
> however be no need to leave and re-enter lazy MMU completely. The
> only part of that sequence that we really need is xen_mc_flush();
> call it directly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   arch/x86/xen/mmu_pv.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 2a4a8deaf612..7a35c3393df4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2139,10 +2139,8 @@ static void xen_flush_lazy_mmu(void)
>   {
>   	preempt_disable();
>   
> -	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> -		arch_enter_lazy_mmu_mode();
> -	}
> +	if (xen_get_lazy_mode() == XEN_LAZY_MMU)
> +		xen_mc_flush();
>   
>   	preempt_enable();
>   }

Looks like that was moved to XEN code in

commit a4a7644c15096f57f92252dd6e1046bf269c87d8
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Sep 13 13:38:27 2023 +0200

     x86/xen: move paravirt lazy code


And essentially the previous implementation lived in 
arch/x86/kernel/paravirt.c:paravirt_flush_lazy_mmu(void) in an 
implementation-agnostic way:

void paravirt_flush_lazy_mmu(void)
{
        preempt_disable();

        if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_MMU) {
                arch_leave_lazy_mmu_mode();
                arch_enter_lazy_mmu_mode();
        }

        preempt_enable();
}


So indeed, I assume just doing the flush here is sufficient.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


