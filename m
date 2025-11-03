Return-Path: <linuxppc-dev+bounces-13699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA2C2CF94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 17:05:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0bzS1fLLz30RJ;
	Tue,  4 Nov 2025 03:05:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762185956;
	cv=none; b=HR1txk43nLHtTvVnBM1WJ7Zq8RvLGdWX6Vg7QuyXi+1/rM6HldpTdcK12uiQpbiljXE1ZSqSnVZeqy9FoDz8mrUcBMUu7MHqXqnFTu8/izq0Ni5AEYrGsfCof5cLmjhaNB/7NZO6NNVcTleamb1KD9MR09edfQ2R3r4Au4apFXrM2v+1PVksrIC/5jdcFsb7J3sIAjsUMfUuL1Y7koLOWLvPJfhSTfEe35ZHbdDTdKmVNasSMHXYlSKh6ufrduHFke5H1jOPRsMImFzidbpFIiBgqGdhImZcggoGa5YA+Wfst4a8ZWWi5XNxUukIsOERHqnCGJEpgcVmQmUAraeT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762185956; c=relaxed/relaxed;
	bh=h7zqPFP4se4OIaFzLrGpOU2VTLQJoOSY+ZZS4O5etWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jI3Ni9F1RzirVPnOCSdho8UvZoyJlurrFnEKAw+oBujfUCjYHoMgm4Kqu2OpUtMRT6zAzFQ9ynA/44IDAmY07m8JDHR85rraybD/xf/ArN2h7vTvxA4GWxck3VtkUdSHPbi+IsfnEwDZzajZ6lImuYrcEQhx6YR2dMrdU2IYRRVq5JYZ6XD8ieo6Kl5uA7MFrY5qqlC0UOzKtXf33/vdCCcYmi3Uibz+c9dPayEOnYIRVoxhbJoM4oS4fGcVIA2zX8IijYBeiNF55/30CXSv5hBywDY0OmZmrv3icsfnu0wDQPwYGw3zROLry9kKkmRQo+P09UMi+eWu+YtpenHtdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I8WPIVXf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I8WPIVXf; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I8WPIVXf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I8WPIVXf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0bzR2Xtnz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 03:05:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762185952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h7zqPFP4se4OIaFzLrGpOU2VTLQJoOSY+ZZS4O5etWY=;
	b=I8WPIVXfQ8hstwRzvy+5Mg0KF7C8NqbZsAaxFu8pXwPEf+YQtKL2P41CzhhJSLWq+gg9Gz
	f+goi73XTGqnZnVhEL0jhgOPpeNzSCshLIp0h3t1S5KsG1TSDlfZL939/3GvuJ7sHS676c
	0CVT8U+Euf0gNc9xr87UdlMCvEb6Emc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762185952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h7zqPFP4se4OIaFzLrGpOU2VTLQJoOSY+ZZS4O5etWY=;
	b=I8WPIVXfQ8hstwRzvy+5Mg0KF7C8NqbZsAaxFu8pXwPEf+YQtKL2P41CzhhJSLWq+gg9Gz
	f+goi73XTGqnZnVhEL0jhgOPpeNzSCshLIp0h3t1S5KsG1TSDlfZL939/3GvuJ7sHS676c
	0CVT8U+Euf0gNc9xr87UdlMCvEb6Emc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-_zZ3LfpXMN-82TSiEa8AXA-1; Mon, 03 Nov 2025 11:05:49 -0500
X-MC-Unique: _zZ3LfpXMN-82TSiEa8AXA-1
X-Mimecast-MFC-AGG-ID: _zZ3LfpXMN-82TSiEa8AXA_1762185949
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429ca3e7245so1246296f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Nov 2025 08:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762185948; x=1762790748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7zqPFP4se4OIaFzLrGpOU2VTLQJoOSY+ZZS4O5etWY=;
        b=CXc3nD/GvdVh9WwsIJXA8Ziwg0OcsuhtiGsGBaKvee3xEte0rBk5CEEaFQTCbOKJvD
         naVyH8BFhT8uDQxRQ/mByoGRZ/dUjnff9krER65LCppxEZi01f/OnfHCuejSZAwqfGMd
         TedwxiDvExLZYrQPkpJYnF+NV3gYE058pMrE2YY5bUOcvjmj7sXwsXXM4l2jcDvYEjQr
         Oti/Lanr3RCMcUhtkbc1DiyXaZnJ2280DbQ5yYaeK3hiqqowBmAHBfMWdxwbQXQCEPQp
         CP4+L2hnF/l7ljIZrtdS5v2CRLA7EF9PdGAnQB2FBH4h6z1GC/tFSEUrqcM/tbKb+lYY
         qGWg==
X-Forwarded-Encrypted: i=1; AJvYcCW9lSSPBj00ymGwzdZsyW06EjBqYvj8DZe0DZjaMQ+4tz5YBZuFrD6Ilve+V7jmbMEMH90Ee6bbVsAyp28=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLzT12gnZtKH4S9LXEj1YvvO2isNa5epPNB7XC1CyrfbB4wFGf
	DvfwDDl8A4SKbSFdldb6Z9MXuLSuGyH2WLRZ++M6B6OaQQbp2XKARHDm9hJqdltHi8242f6Ge+d
	QIbe1tRCA2j2I8La/D7KD5NaSOpDuNUmcxw4N9GW2aauvDcR6t4DvqyawZCVcroGGVhk=
X-Gm-Gg: ASbGnctJVCoTD1RHMz5laPqSFIS9N2XBgdmz3PPEmuG4AHFm1FVwDisaILs5tjdk2J2
	eehcPqOs2ctk3ovoOOonAxlACAtfkIaM/PxMgMb77XbGUuSlxS1pl0kWYReoXGi+u3NO38qWny0
	feRPZej4+oEtZJS2UD9NU2MPBT43VXIsx+7pXxh9R981HtdIGWaT2u9Fj6U7vNMR42ALURKVSpB
	Iq0egu523nT0p/400vsON3Z7FtWmiOZanB2BLTPB7DmrQOrRW5JOk7NV1M6vldzo+HY2fkNKsn5
	CRFsLmOqYw9+OVVMg77MohxAzCHQqCTxYcg+kF2ff1e+HY70dtv4aD33AuInCOgLDHBSr/qCQf3
	ZsNQ9qb1PYPva7vJsVrkHlTUbqaK3g+gegEA0MyPL9MDTNgBfss/z3LAAdNOSUFdcKWUCdLWOxA
	C6h+z6TimQJTaXqNSb4NtteRl/dYI=
X-Received: by 2002:a05:6000:2411:b0:427:928:789e with SMTP id ffacd0b85a97d-429bd6d583dmr11477174f8f.61.1762185948385;
        Mon, 03 Nov 2025 08:05:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc7QNXPV2goDccZBoudQ7Gvk8PWg7e8ZaWNXwQcsQ4X2jdmxCnoJTtoWX7k3mSPaCwOvUqEA==
X-Received: by 2002:a05:6000:2411:b0:427:928:789e with SMTP id ffacd0b85a97d-429bd6d583dmr11477100f8f.61.1762185947708;
        Mon, 03 Nov 2025 08:05:47 -0800 (PST)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c102dfd2sm21748638f8f.0.2025.11.03.08.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:05:46 -0800 (PST)
Message-ID: <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Date: Mon, 3 Nov 2025 17:05:44 +0100
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
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with
 in_lazy_mmu_mode()
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
 <20251029100909.3381140-10-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-10-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nNwdPY_HLVKfMXVAg3f0s96kZ57UK3ScseFQNiDBySs_1762185949
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
> A per-CPU batch struct is activated when entering lazy MMU mode; its
> lifetime is the same as the lazy MMU section (it is deactivated when
> leaving the mode). Preemption is disabled in that interval to ensure
> that the per-CPU reference remains valid.
> 
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. We can therefore use the generic helper in_lazy_mmu_mode()
> to tell whether a batch struct is active instead of tracking it
> explicitly.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

I suspect you were not able to test this on real HW. Some help from the 
ppc folks would be appreciated.

LGTM, but the interaction with pause/resume adds a bit of complication 
on top.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David


