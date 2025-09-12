Return-Path: <linuxppc-dev+bounces-12070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA9B5460F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 10:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNSvQ3DP4z3c2k;
	Fri, 12 Sep 2025 18:56:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757667362;
	cv=none; b=AQb3cBf7msw+q0rtc4bR6T5dwsq/GHNrZj5pk6y1PqEPx2AiBsUB9MsdhTLz4GSctf7bR1wG/k8yFtcnzyCBnv6I8x8AK6fumNjWCD+QFnI1IVcbc4mKhp6Et+pwY13G3f9lQF1SFetmjSfzCwkewZQAknwNeq11WHbfDeXOJ1+Kz7HvIQuoAFHPOGSsvFf6VSuSp4X0ZcZsAtW1rc3qlLiGMMtDr+niqp0qB4VxeWxuNfwZi7lOqSyfZw3brGpn0XGeAXSvDLqyZ+hsrRJFAIb+n+btVCsciQSM+gMTeyvgABnVzYv3Oku65podlb5AMmYgRuycrOGYCgDPlWdNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757667362; c=relaxed/relaxed;
	bh=yhSXL+2pa9oDbDGRuQ4gQlpl18vQ+30/sPKc3K6z7Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmW/cmnm9/eUzhNDd1tWvmxVgyYX5hIvVwqaJ+PHqmSTNdwuSyUjDY6EPJ2mzBwm68Lx7Q7qlhhnk4iHHVF8bC5bWOG1qbWnQWc1sRSE1XWRryCnt30saABNEhmofF0j2FSZKDw/PfeqoXidmBRio9yg0IvjllW7c6DV2QE1Wp+H/WyNkOv1d8vQqey8mtF7vc21t8vS8XYXFZLwrHLsvYuyR7lWxIBYJigCFCVBQePKjPMKnsQMmeRN3WZBpALP0u/diM9POCSZdDwx3j0oPOgZjevW75E6xg8TImWVfWpE642YlLYdG/WS62GG8vY3TP5k66TzkR9DTezpugzdVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IveBiTgu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IveBiTgu; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IveBiTgu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IveBiTgu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNSvP3Z9Vz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:56:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757667356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhSXL+2pa9oDbDGRuQ4gQlpl18vQ+30/sPKc3K6z7Uo=;
	b=IveBiTgu6K6wb46I3mtmTdpkQZdEaqeL7kwT/a8yxdSlKW8E78iZo7pxHlYZUQtPHxFiux
	ab9FzjtoPCb2eSDilf1UonpvzWM9HIJYBUUXLpll/e4fZlMu3/EBp+6NQjhHgc7kmlbz7v
	K1OjrPcQbN3bxuuhO2kLH+8V/cZFQEk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757667356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yhSXL+2pa9oDbDGRuQ4gQlpl18vQ+30/sPKc3K6z7Uo=;
	b=IveBiTgu6K6wb46I3mtmTdpkQZdEaqeL7kwT/a8yxdSlKW8E78iZo7pxHlYZUQtPHxFiux
	ab9FzjtoPCb2eSDilf1UonpvzWM9HIJYBUUXLpll/e4fZlMu3/EBp+6NQjhHgc7kmlbz7v
	K1OjrPcQbN3bxuuhO2kLH+8V/cZFQEk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-iKE36pBjPtmhDOmLrmVxuQ-1; Fri, 12 Sep 2025 04:55:54 -0400
X-MC-Unique: iKE36pBjPtmhDOmLrmVxuQ-1
X-Mimecast-MFC-AGG-ID: iKE36pBjPtmhDOmLrmVxuQ_1757667353
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45de27bf706so7924325e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 01:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667353; x=1758272153;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhSXL+2pa9oDbDGRuQ4gQlpl18vQ+30/sPKc3K6z7Uo=;
        b=w4LprwZ4O1Ze8JRh1TppLk2XOjDTud62AJzqn1tUvHNY0FNQiA+L4VMU7M6amENRvk
         vqgbRfQKnZyMMao7tG2Kec/MjcewIIGQkt91vHgouGHmsb2WssamqkTXpEbOPx+VoFBM
         BvosUWAH3ckC2SH1rhtkccngPTFT0KzvTqdepKmSIYcsVCXrrMSJ7pp4Ga94Bh0HLoUy
         5NpFJZvsC0/chBgLm3Hdond3h20ByqogS45JLja7dphgpbIjLd8IS+0m48s2HcAPNJxX
         HUFA3pHLk2V5gsbIAnKVA1PODvvJP8Fzp+NY5ivNapFOPtee38AvpX5QHiPg6YdS2wsp
         sqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWDracQpGAXZNqmkrdrou/gsYaJ7AmMRkDsWXYgctgFgHBvb4tNq+SEOa73NDgAtsOOPuyVFO26vpV3gI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyA9jXV+JcVIF5V0BUsHf9z2vIfAC2bxQuIqzuJ0O68UUXveVAp
	bOgnapN6PoeVj9Pt0cwBJ+zaboxUST4StpXXbfVrcbJ2WB4hKTWjIysa/LskY+5V7FmejVcMJUR
	KX+T7sDzLboIcF6NPmux3lBQjmOw5Oc/cX0UkDqglatPPUprtOiGQfulmBhpe/p1xRmA=
X-Gm-Gg: ASbGncu7b5ZghRzdjltqiHAfiw5nTT1cj0ixmqetXQwtmPTAtHtIGCtHaxDNpUE1DqV
	8YcR3SzYynUZb5rxads0grF6MKae0iSNOH+vM8heI2EJKUj9pRlIqfcbcyUfYpla2W7jYKzq7pz
	yEHD3stjSt/v4EpHhuNWuB+i79eAR+RA03J4sfTrRLwkCm6R1sYnOpWAGE70IMV0q/eXT/AQfAL
	YIGZJY2looSPitrJxIBQd62dqKGqy5Med3P8vHY9dNkIqK8UNb+V7tNVCStoxSoAACDWE979bWX
	Egg/U69P4OWRhl5BXFnfAetj85hzpuQzlY8lAXinWWt0vYt99DsZVFKvqP7XePArQsFiVKTmRBd
	qN4yLMAEg8/NVGYHeTob2bwzMi7rm+7vX2bmn+x/vmYpOlVPyPV88uU4nY4PPvyON05I=
X-Received: by 2002:a05:600c:228f:b0:45b:6743:2242 with SMTP id 5b1f17b1804b1-45f211f86c5mr15325875e9.22.1757667353232;
        Fri, 12 Sep 2025 01:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWDKbJzbJR4/u84XZSgPwx14/k9hN3sfQaLT2TQm5sKZh16Dp+Cgzni1IYyZJBI43U7rR/8A==
X-Received: by 2002:a05:600c:228f:b0:45b:6743:2242 with SMTP id 5b1f17b1804b1-45f211f86c5mr15325425e9.22.1757667352826;
        Fri, 12 Sep 2025 01:55:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c3ce5sm54255495e9.16.2025.09.12.01.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:55:52 -0700 (PDT)
Message-ID: <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
Date: Fri, 12 Sep 2025 10:55:50 +0200
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
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
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
In-Reply-To: <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kRI2nuoRNaA40fHbwcUFeSWhWfPsvYUzfEifRlzsI9g_1757667353
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> I also wondered about that. I think the safest is to make them
> respectively arch_leave() and arch_enter() - the flushing entailed by
> arch_leave() might not be required, but it is safer. Additionally,
> powerpc/sparc disable preemption while in lazy_mmu, so it seems like a
> good idea to re-enable it while paused (by calling arch_leave()).

Great, looking forward to seeing this all getting cleaned up and done 
properly for good.

-- 
Cheers

David / dhildenb


