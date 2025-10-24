Return-Path: <linuxppc-dev+bounces-13277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 476C8C06BE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 16:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctQbc355zz3bfQ;
	Sat, 25 Oct 2025 01:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761316940;
	cv=none; b=O53TniBg8oDdRkK0mZadtxRsef/UlWgl0XB8fIO5KKr14sS2IAd1sNyObnV+CMb48T6AGgPowdh/E4x5mYP8f1P8N4KJkhH0/cvCcXmNRZUz2Yw+GOJXqS9LDEGZ1KU43u5ZylAfJN2HqfFbms2ozdMDAX+eSsxCcutRNKlc2I2QHq3JmNSrYRGhCHEcTDYK88VQ8EcM08l/kdrbAzDFfN+p3HfrYyrg5wMWXcXZWZFq5Jez7Asfa0v4Y9hpzGY3Gak9dBB9xkrpiteorDKbHsD9RwoDUzBWBIcEMeUlDDW15st1yUTdAfTgo0bnJCajEMqLc38fEIkJZzfWVg+/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761316940; c=relaxed/relaxed;
	bh=zuMO3Gm17MlJedQR/JASyV8PKolk4umw1nTXePw16OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozAYqu12MAQOYX7218L4FBFh+zJvBtqMVEaU3ksD2UGAZ2J91WabgvBoKo0VaXUty88wUoPjEnNbM/1GShU3GyuoKqf0GIt0BHIdC/a+aAGEiebhqqDCP+tSIblyQr0EM9riAMDuRKBDOrNzIxI6EU5IINfoH8O+pNaLD3wxQRRmwTm/ep2gcXUZy7LMgz0m4JFx/9d36QxKF22kp8WrO47HO80F0VMQCfH1nKqgQtSlpfqw4NfTm3Ct2eLrPySVMGCJfUlmHtxfiYoirqCREKBqCaHZUstv8WEQ5ugpxsW/ecCQzADVUiht1p1M6eRDG9MLbKNNx5xtXrZdj8duqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=afWfOESk; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=afWfOESk; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=afWfOESk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=afWfOESk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctQbb1RqHz2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 01:42:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761316934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zuMO3Gm17MlJedQR/JASyV8PKolk4umw1nTXePw16OU=;
	b=afWfOESkDtwzZGo5pJQet3VG9cTO8tHC6nwtnUSbHnQCxnd/HlMR2cIApLL+Uwa+PxXcjz
	W37bi6MvfgCmAfN/4tb2YmpA/N1HCCnpCo/lXLmjdZ5NazVIotlX7gYZ/oz5NMF8o7xnGt
	zR14fWmmgnCkUjZ1edWTe67axk80fZU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761316934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zuMO3Gm17MlJedQR/JASyV8PKolk4umw1nTXePw16OU=;
	b=afWfOESkDtwzZGo5pJQet3VG9cTO8tHC6nwtnUSbHnQCxnd/HlMR2cIApLL+Uwa+PxXcjz
	W37bi6MvfgCmAfN/4tb2YmpA/N1HCCnpCo/lXLmjdZ5NazVIotlX7gYZ/oz5NMF8o7xnGt
	zR14fWmmgnCkUjZ1edWTe67axk80fZU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-1tlxC6-bOuWKeMVVtzLOig-1; Fri, 24 Oct 2025 10:42:13 -0400
X-MC-Unique: 1tlxC6-bOuWKeMVVtzLOig-1
X-Mimecast-MFC-AGG-ID: 1tlxC6-bOuWKeMVVtzLOig_1761316932
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-472ce95ed1dso13921395e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761316932; x=1761921732;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuMO3Gm17MlJedQR/JASyV8PKolk4umw1nTXePw16OU=;
        b=bj6OgP0ZErOAwEsiIgPkWx6NyjvnrLM8jBN8Y581hAXpAb1FW4TBZrPZxM/TFdrxmd
         6DSa05/KjPlUOU7IvTn4+1rzEiaTQ5UT+MvMc1GMqrdStGiJdC66ldZf5estnumkn5+s
         y0OQEsp743TZYaIBOiagj51bfTErpQ70BgLe6oerLzuvRoZqvPYCwyKCHETZpCbp6P6/
         JzSExasx+TtBEdVVDIFzg4fJMBxLkwmaRdfTIFamlQAeQQi+jWnURZKqw9VXD64VrLjN
         /ND+NhWgE5nD5bNsNnZgfPoi6QexWuIiEMBFWphYThWbz26ifOqnQ+ZomZG8jr76CdNZ
         +0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZqHokO+Zj4EpAnDFQJj9p9pYEMU5j9Vz7V5J8qbT+QBEN4a9D2DUmYtMvE55/BmPWxXJEjyRjGaeP8I4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwV26fZO86TSEUKfexXPnePSRgqa8KcJQU2KhLdA0BOkFYIjzSn
	4UnZ65OFn0UW1PYLloxdA1cmJQLcOt36v8j5hLGU8xTpBKKp/Ux5hyHpsVAjnq8/ygmeFULAhpE
	O7cHgu79O4XtPkYC5yyk2V6eQS/HgXIxR+o4C94b4+ZLSNp12hbQ9tCHVI/xHfJFucDM=
X-Gm-Gg: ASbGncuDA83OilZer4lIFQgKJTNxDC5mA+zkEq85pWK1Vzd8fwQZ7DTmXmaMxV+Ppnl
	qtIrroKnAvRzctxDXr31I4HoMyL6f/Tm+Ex68nfEiAJDR1pjzScrJVyJXsxM/tvgN/VVWNmyJpe
	u9cnqwSrEv6Pj9eN6nj++Dnj6mlLTKm/BI2yIVtUe7HuFNnOq2oC/hqOQzsb+zHJfmwaSWvO2WL
	jyd7lZw5MPRSXbrYxZweueQWzcs32FQCczfBp1nscWpq9Ys3lDIfxjKH641ghy19++iiJWJZ3/s
	T7+bWi+SjPL7ErvJLnwcyFnZivCSI3KJfKGZ8ncVx6tQ9DBZQ4He0LHUblaeAU7+p168efMdKzM
	gPUWk2VNDnuCE1DLDt6n2WSvs4h3aWGysjV5ty8fDt1HTmmV9hiULW/Es0nubbXqyBGANCTmVb9
	WE7deB8VQm6v2Iihu+DhRtF2C/GxM=
X-Received: by 2002:a05:600c:a4e:b0:46e:711c:efeb with SMTP id 5b1f17b1804b1-475cb02f5b9mr48174185e9.25.1761316931737;
        Fri, 24 Oct 2025 07:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVhLeriCo5qSkw1pxItKV2BmVweLyKW9vHw/E1IK25wn/MrmDSTPV2yNrI2gB0tW1RttofMw==
X-Received: by 2002:a05:600c:a4e:b0:46e:711c:efeb with SMTP id 5b1f17b1804b1-475cb02f5b9mr48173845e9.25.1761316931347;
        Fri, 24 Oct 2025 07:42:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf152absm113608615e9.9.2025.10.24.07.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 07:42:10 -0700 (PDT)
Message-ID: <5d5a85ec-0213-4af3-92a9-c02bb13da073@redhat.com>
Date: Fri, 24 Oct 2025 16:42:08 +0200
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
Subject: Re: [PATCH v3 03/13] powerpc/mm: implement arch_flush_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-4-kevin.brodsky@arm.com>
 <60c55686-87dd-46d0-884e-80f7d423663b@redhat.com>
 <604f26cb-46c6-4533-8110-0b174eed821d@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <604f26cb-46c6-4533-8110-0b174eed821d@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gLJ8pxCEbQKWIQHYyC282XVs3R-3LvVkoJQHhf3jgeE_1761316932
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.10.25 14:09, Kevin Brodsky wrote:
> On 23/10/2025 21:36, David Hildenbrand wrote:
>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>> [...]
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> index 146287d9580f..7704dbe8e88d 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>>> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>>>        batch->active = 1;
>>>    }
>>>    +static inline void arch_flush_lazy_mmu_mode(void)
>>> +{
>>> +    struct ppc64_tlb_batch *batch;
>>> +
>>> +    batch = this_cpu_ptr(&ppc64_tlb_batch);
>>
>> The downside is the double this_cpu_ptr() now on the
>> arch_leave_lazy_mmu_mode() path.
> 
> This is only temporary, patch 9 removes it from arch_enter(). I don't
> think having a redundant this_cpu_ptr() for a few commits is really a
> concern?

Oh, right. Consider mentioning in the patch description

"Note that follow-up patches will remove the double this_cpu_ptr() on 
the arch_leave_lazy_mmu_mode() path again."

-- 
Cheers

David / dhildenb


