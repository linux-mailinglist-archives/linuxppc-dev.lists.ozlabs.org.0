Return-Path: <linuxppc-dev+bounces-13659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A097C27DE7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 13:22:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czH712GfNz3chF;
	Sat,  1 Nov 2025 23:22:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761999773;
	cv=none; b=ALxJLsnA8oOF7BbtSK8J7Fe92T52At70rzv568+h0VUAX29qhdxPhAEmy5IM400YllzPo5zAysK41kkFfbp/dcT5+0UEzVHYCtC2H2dz5oF9jcn0syzN1bLIncVH+jOzVorxcYNIL1yXAEFInmtaywrM5+PsjuE+RlQ6H2GTzUEZyN7nGZoo2HuZAGS2VP4sfD9KAOW/tS9obbPFUATJe5pfSAuvvyh8XB6h6Wzd1hCvw2Vwollh0fkLgvHleyZpRVtiKm0wujcMIBy9DuFxSmv7VN8W/jnyNaTwoW1SfEa8JoG6taehJvqlirgvJtcENC6jUMQ+P+U/vaWGZhI/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761999773; c=relaxed/relaxed;
	bh=iR1r/3xhU7MVcJwVYZUltUXo3c7eUSFIQ+pGKdoQg2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERF5ZWWbwdkJSirgEy6IBICTq0k/z891fACfnPD8iS8YwQvHGXkmKcfVYhYWZTPki+ihYMXYSjnqLQr/KF42ct1XASyhBNdF+6kE27SHKKvQVxeRx9rEh9tnaJjXaKUphB5+3frGIQmL9nBaqU7dpOycqIv9f1u9PBWbnBriW1bHmf0h6BQi3ckzuxZs8EyVSKIouty+l9pdoKoGBDGdR+d/T4zRKU0U98M8XIxJ/T+J9/kKvAIEipMKmoxLcy9tBwi2FMesJDxKoleDdqupZZDVffkNDUriSyRKfbgZ3rkcMibEVqvhjNgea88tNnI6lw3a4KNdafcVgbOZQe30Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQMSLWUr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQMSLWUr; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQMSLWUr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQMSLWUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czH702xGbz3btM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 23:22:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iR1r/3xhU7MVcJwVYZUltUXo3c7eUSFIQ+pGKdoQg2M=;
	b=UQMSLWUrkXO0pRNmu8worlMcsAfloA1RfS0gSaJ8hYaZrQeHS8G6qzI1H6FBWx3ObyL3cS
	FP3g4/q9KDVDqqaiOBnF9y7k1pshb9IlvbnKxyuZPllG2xIEbguTmAy9IVadJDjBlPxbpB
	5O1lVBWdk5ES8R5IQRu8hDJhyI54HmI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iR1r/3xhU7MVcJwVYZUltUXo3c7eUSFIQ+pGKdoQg2M=;
	b=UQMSLWUrkXO0pRNmu8worlMcsAfloA1RfS0gSaJ8hYaZrQeHS8G6qzI1H6FBWx3ObyL3cS
	FP3g4/q9KDVDqqaiOBnF9y7k1pshb9IlvbnKxyuZPllG2xIEbguTmAy9IVadJDjBlPxbpB
	5O1lVBWdk5ES8R5IQRu8hDJhyI54HmI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-Ga8YfWZkODqe7p4FPy_y0w-1; Sat, 01 Nov 2025 08:22:47 -0400
X-MC-Unique: Ga8YfWZkODqe7p4FPy_y0w-1
X-Mimecast-MFC-AGG-ID: Ga8YfWZkODqe7p4FPy_y0w_1761999766
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426ce339084so2435519f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Nov 2025 05:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999766; x=1762604566;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR1r/3xhU7MVcJwVYZUltUXo3c7eUSFIQ+pGKdoQg2M=;
        b=dgg6vJ4HQpGjImlmJOBg8AXtFP3P8VHQQw8laf291D76+pnmzEoJWU8PZc9XBPu1h6
         dl1kMHJxOLKTgZHlyujMgcgGk/ICDV1TGcRdRQ8lMtlBBX3rWUNf3ApN0ctIJ16o3KX/
         P/3LR+hzU2MgPO1zmlyeS7GRfbUWoBbeNb199BYhgCtCojoUrZkeeGshV6YeQjL7gPN7
         ab+eWhJ1ZaN+5uIujQYLYxwzsBtvJADHqzTR+RkA7+tTiivocBxoCbXcvzyG1blNvX5y
         0tbTD/dqZ2QrnU5jdIdAlA4kErAjmHsaVTRBac/s5bsDXafsrpVr8SYelATUTWSs6Ykt
         HQLg==
X-Forwarded-Encrypted: i=1; AJvYcCXRX8GFpC+VYt2MYSWnpUydDsDP7EsH3lFyxgWEyNnqpSfcLywFnwg4pZQKNwDbgQSJfia2p1ADftzwzFc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwnZAGQQrLrZgtYGy1tu5XrCIpUKM2J0WhYWmlJmCHA9hZpKo1w
	qPt7ipJj3k1d4H+VQdYayD3DHRw/vkymlWAV5QZx5dbe9WBCjCEZC65IMOHWlt3lwZhYx5xpKMX
	I7xOBB+YqFSuwu/GAXiGrvexIB0CFaKncX9GjF7Lvd6pWAonKLF8onYoNrUkxogTHioM=
X-Gm-Gg: ASbGnctJosKkjgUIyUpvzdB7LSY3MRsnWwZ8jkf3m6xfhpNuYzA3bh51Y94ltmuZOlo
	GugWphzhkk4/TUAVXG9yjJerUmuhRZ0SuQhk0/hF8OcpuZnPrAGk5Nyaa31QhjPcdqAP7YglLQr
	0qos3CP4x6cI6jqzxGdyQAcuULPT4ePkv4pZzdnlLjS1SIpQg+1w/1pD5xbFdJrjbJIkp9TF+4c
	RBuvZGOY9di0et/eV7XwBS0XT69Rwb7UVgT14E2NHXtaIGwXJ5aeZDvg8qQotUO4rNfvmxI8jMY
	nmVuRVZMKIZSrG0F9TE8BeD3VZ5eZQIKRe2aCZ9Tva1QPZXo01+CdyKSHHSVMNEf0USQOC+Wbd+
	uGLCAEidNBCgHCJM7ubeht/kbdi5ICcSi4PUVGKKr5UN8M/jgYL+A/DdU28jFr2JyvfnuRSEyBB
	zmUTvk0vbXO3OpKvdlKEMIj1cNIbw=
X-Received: by 2002:a05:6000:2f86:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-429bd6860d5mr4833002f8f.21.1761999765963;
        Sat, 01 Nov 2025 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ+TTH/VeYpEYhd62jH/WbFLaTQZ/6xytSCDTH7QTl8AfN9d4nyTXPMxG2nY+bN2wOvpiPqw==
X-Received: by 2002:a05:6000:2f86:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-429bd6860d5mr4832980f8f.21.1761999765533;
        Sat, 01 Nov 2025 05:22:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c110037asm9461926f8f.3.2025.11.01.05.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:22:45 -0700 (PDT)
Message-ID: <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Date: Sat, 1 Nov 2025 13:22:42 +0100
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
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
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
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-8-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jdrbpzaehpvRmKS4mACJipxMCI-X1ET5dgc_paFmXqY_1761999766
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


>   static inline void lazy_mmu_mode_pause(void)
>   {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);
> +
> +	state->active = false;
>   	arch_leave_lazy_mmu_mode();

Just one question:

Don't we want to allow for pause/resume when not enabled? Would seem 
valid to me, because pause/resume code should actually not worry about 
that, right?

if (!state->nesting_level) {
	VM_WARN_ON(state->active);
	return;
}
VM_WARN_ON(!state->active);
state->active = false;
arch_leave_lazy_mmu_mode();

-- 
Cheers

David / dhildenb


