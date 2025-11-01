Return-Path: <linuxppc-dev+bounces-13656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D1FC27DBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 13:15:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czGy16yffz2xQ6;
	Sat,  1 Nov 2025 23:15:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761999305;
	cv=none; b=SMwM7X8vydef6utHAw01CRs5cOE8s0M0oRZdBT1SjBjxCPSn4RrXBzeag+RTK9Si0+5ZFsJMM6CQutu9QQEe7xjprmA1CNDWM9Na+5B+A5QlbahJFLAAVNlzdt/X8XxKeRBShJnD5jFiBbPuLUi4IzWNgDwv6tpvuEfvMDYNY2z5q47XUTFlfKtqGe53xT8vT1IRsGsbgNF+GUGCHIkTJoNE/n8TIaNShybP6OhJr2i6GymVRCp2AaPp9p11HDs9j6S3NFGDFC+BMi00osLfXuwi8qPp262QtB4VFuyrRQT8VFkojCErxuy/wa/nzlCBR8UHVDprHyO2WzHbtfrd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761999305; c=relaxed/relaxed;
	bh=Wcrewv7OssaEm3gyvMk1iF/ClvQjL5UKQAK3UbLbS48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNmfrCBlRVowt/s9bT0L9H7kQGu1yEwDLHPNQL1SeeWdZIpE1CyzIcCnqHeioxmfDQr3s7jV06PlOFWlpNv+T9EuYsXsTx+PwlEFQrHh0Kd/EKd31pCQk3DaX4KvaFrNUhM7tjBVEyo69pptEFIrzzlVIrEskc/7z+KMZ6XkIVpyLG1Md9QwnN/PaVuUQMta8MdR0JuSC1msW+BnVmCMHJNSZfSi7U67plwFN+c77z2vR5ozwFGQnenuTsMDS1XyPvTipXsUahLLTXZbChqTjRPqhiKSi+objNBc/Ll/2bN3or9oSrtgZfc1J8mYYKSPfdEE58+htIDtgx2iksH7Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKZuXQk8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKZuXQk8; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKZuXQk8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKZuXQk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czGy10hRbz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 23:15:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wcrewv7OssaEm3gyvMk1iF/ClvQjL5UKQAK3UbLbS48=;
	b=fKZuXQk8rqZJ/qIysx25x3joyBTIxbXB8XcPFi4J9N2Yj5njYHqulAOsRv8iz09dipV9LP
	4J9HT7fN3PKAnu21VyLqhJLDFlpJyFJf3Yp6Vc4owm6inAA4ysdfUEsA8Ofo6Xkz/qsUjo
	GDmy51tKmV2b5sYfro/FmAi3rEkEG3w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wcrewv7OssaEm3gyvMk1iF/ClvQjL5UKQAK3UbLbS48=;
	b=fKZuXQk8rqZJ/qIysx25x3joyBTIxbXB8XcPFi4J9N2Yj5njYHqulAOsRv8iz09dipV9LP
	4J9HT7fN3PKAnu21VyLqhJLDFlpJyFJf3Yp6Vc4owm6inAA4ysdfUEsA8Ofo6Xkz/qsUjo
	GDmy51tKmV2b5sYfro/FmAi3rEkEG3w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-oAZWeNdSPKS0sVOvPzauaA-1; Sat, 01 Nov 2025 08:14:59 -0400
X-MC-Unique: oAZWeNdSPKS0sVOvPzauaA-1
X-Mimecast-MFC-AGG-ID: oAZWeNdSPKS0sVOvPzauaA_1761999298
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47106a388cfso25500285e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Nov 2025 05:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999298; x=1762604098;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wcrewv7OssaEm3gyvMk1iF/ClvQjL5UKQAK3UbLbS48=;
        b=ge74BFkmZj6x/TyLnmlhCJM7vBS7mbTVTZhSMxVJQgVgEEHTrwIw7uKUFTfpws1b5k
         w2E+f5SesPZd6R5pA7QMnYEKQ6q7aeo+LB2FT22T+3Nzm3QxvAbXfCp/PxOYfY59loDB
         MDv1Qh2CI9/1uKQGk0Fs44IgcsV9pkPyMyRADI9+ljv2OIekHcjC1ADGIJ36kCAOQQfe
         TXScyO3BCQde0d6jjQ4++7lNt1DN60J2V/sZGDCPyrgWLpDi/2HfB86n1BKNoqpXIzEE
         K+69sp7DrTWhyMgzjZIOQLfr7yeLkEDqsiDNEDDwz7/gSRlr5Nk/KgL8eijYIaC7vZvu
         gmKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA600nt3XHfgJYPPae9YJHGEkrWbulMPoiHYS9cac/fUc4DWyDj68KfuS1GOq0n9GAItl2eoeeWPJUpVA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuKBUsAK86/kcFV3j7g2B5JOXRDCfyNvKWMdVSOqGf8e+lzaeV
	kN2e0+bYPFcrzdw6UHYkVigZxtC1AWc2JBG5NlHzwoANsiL0QLOq6T+XfYiUIKZAQSwI0O9yZtW
	QIppsi2n9VZdXKjNFAXaAyDa+76c5qx4VckSfUwUe0Q+ghVz4q8JdrSRduzJv+S+pnsA=
X-Gm-Gg: ASbGncsMo/Add02iBah2Z2ESr4tNZDo07W/hqvqm9jfNa75E9GXZ0WDIHR+iIm/CVRp
	RFuvN8piNEDDDdRbQrC+qgqzspmmivXtfMPUPwFgggweny/8MizDwnM7le6xEOgVfduJy4i2HAK
	gmqNFXu15Q6geaqqubLjpGKDBUcW4D9XlMlzTLs+en9Nn7cmIj3yV+18XLqzJIWbgqlHMyiALSY
	DEGy4yAeUzjASn5OsBf+0Gb4UIME1Gc6SL41TyakAVC3exDWmafQtmJI8ZfY8eNCfgCa9xIhuw+
	rVQIOnCQy4AHLUcJCQscYiOhpOAn23tAPsDqHLvj/k1RsbVYahiR+sQz7p8bI+C9OKfqNvXromw
	EpZdq0yHYl2V3JbCZurXlk/2mvCyDtNx2OOC97ELTpawP8xPD14smEINe4dj/YEczWdoI3aEbA7
	/bsUF5CbkvWMchngDexhXXggv/zkQ=
X-Received: by 2002:a05:600c:64c5:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-477308aad21mr78192275e9.34.1761999298485;
        Sat, 01 Nov 2025 05:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpoAFpg0euM+1PM4mK/KRSGv+bWD5NPrehon1oy/C0JEyB0MU730bCFNURR8O9btag493PXg==
X-Received: by 2002:a05:600c:64c5:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-477308aad21mr78192025e9.34.1761999298113;
        Sat, 01 Nov 2025 05:14:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c9737830sm2218179f8f.16.2025.11.01.05.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:14:57 -0700 (PDT)
Message-ID: <15f832f9-b95d-4b08-8467-21a27cbf8450@redhat.com>
Date: Sat, 1 Nov 2025 13:14:55 +0100
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
Subject: Re: [PATCH v4 04/12] sparc/mm: implement arch_flush_lazy_mmu_mode()
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
 <20251029100909.3381140-5-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-5-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MD4ynxqAyrtYZVsWWiNMQBHFFwhaZXk-2UzJe4g2t2A_1761999298
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 11:09, Kevin Brodsky wrote:
> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
> 
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
> 
> Note: the additional this_cpu_ptr() on the
> arch_leave_lazy_mmu_mode() path will be removed in a subsequent
> patch.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


