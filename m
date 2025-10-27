Return-Path: <linuxppc-dev+bounces-13330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B03C0D843
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 13:29:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwCW80HjLz2yw7;
	Mon, 27 Oct 2025 23:29:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761568179;
	cv=none; b=cTzvvEgCNpp4EyB8XqsKIjTZHfpUFxC8A/6hZaW6m7+HPPpL8RshZwrWoFJIlHKDhNkDCAvBumbBZeQQzD6df6RwZolcm0gJ0o6Oacwy21UtbD/vFHOvVoITHqGKCjkXRQLqoQR436euEaB6+2PSvWCaw4RkkPiqxb2njjt7qoWyyw4AB4sIjb8xwYNwvtlOcb7JR759n2xYyAhVzb385OXW+u+cu7bDWAK4TqU17Q+2lrWK4VXcDO1vnk0glaq1HNidkrOzobD/KCs0wYyENmfuEvPt+2402VZe9BJz8HIfeMsHK9E87vQyTSYMll+LkD0cvTmdidOcXEzYJ/NMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761568179; c=relaxed/relaxed;
	bh=MxqhGs+kErj9QojSUYfqhMME1C+HzYz58U9mBz2oLoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Scz82yUZpJgP32XFuXV7FdnrZOap+o9SyiiNUwI28E7vgTMG720Xb4tIOMEo2Bciz28c7IBld7rma6ZOBjkIBwh/cw4K3O0vO+OJblB4U5gb4ccAasAOVKDQaXDpRIB23D3kI96MPHIFTL1KkuO6uDXS6ScXg3o1Oki/WecXp/6jrjpQrffQmDtA6G4P0+bKm7Y7iMCxR6W920FcPuQ6O1SKm7o8FUFBQW+xvEFTsAz1vX6kdCiclCbxziHspwWNpPUjoDgqFCoaa0NJ0f9Ebj/1yMnfkIK7yiRlHi8sUeMRaN3CEf+WwrvE1S3eSoHGiZJm0Zb1+tqPHfn4yL4OKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GjzL7CDj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f7WFq7sT; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GjzL7CDj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f7WFq7sT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwCW64kBzz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 23:29:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761568168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MxqhGs+kErj9QojSUYfqhMME1C+HzYz58U9mBz2oLoo=;
	b=GjzL7CDj0S0BLc5W69u1/FuWZP+xXmM0qsQ+oWjgr07ChdsV2F/b3jTNxuBUL6QHHgCelZ
	VLDaz/WWXZURQtMj2RN7LzIXgDso00pMrUat2qCbJ5oxy6Fs0IuzdP7yXHugMpLoCclouv
	QKCKBey16vgVRZWgmpx9u/rIram8z1E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761568169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MxqhGs+kErj9QojSUYfqhMME1C+HzYz58U9mBz2oLoo=;
	b=f7WFq7sT9dU1QdkfZpnj1ZkfghTfnDBopjD2fOI/jYhzIBQunc1HGicR1Rk4k19NKzJbRk
	HvVF+XxOWL7LqClI+CxSh2OMf3VlYe9er4AI9h0NVTkeKVlcNuCQpo9faE52e+QcF6djbg
	LpjD3vRl1CXLPf8txqYIjEmnsNHIhGw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-e5hbey43O-ubVs8rsiZmbg-1; Mon, 27 Oct 2025 08:29:27 -0400
X-MC-Unique: e5hbey43O-ubVs8rsiZmbg-1
X-Mimecast-MFC-AGG-ID: e5hbey43O-ubVs8rsiZmbg_1761568166
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4770e0910a1so6371815e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 05:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568166; x=1762172966;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxqhGs+kErj9QojSUYfqhMME1C+HzYz58U9mBz2oLoo=;
        b=nsDL8mYUPKu6Stwln3wd5ohjFl97UiDqC1ZvbGSpfIscn7zL8hi8BozS6qnlEriRPr
         WwGHiEf8DpYuLLsASruMA+31BwQCEeKEG07dtdAq6Si+4IJEpUC8xHv4VIPnnZgFLHlE
         HCBV3nsYAh3HA+oS1wvuolFYBG2TuMMGUQLCblOYN8zP9tNv1VkDmT3bWNfvrKzFJk02
         cf9n9iHuUKZx1NsqAf3I/JKKc724O+5wCuskad0qUrol0/l+Y85O5P+tLm/e4Ioa61EW
         IFRzcpK9EiX8dDdzT3QKU2YtNTXcbxPJFwils6mZ2SQ2kmFm6IsbEe38JT34bQnw3S4P
         XPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTsoXd2kmf5oyIPUgQ6jCegEE2K9t4IDarrqezzgyqbS835LuLzAlFnMjJTbpLH31BOStW56G6rGwxCds=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAQRw/dgO5mHLUKt5t1CO+UJtRXXQrOpFUOmCTGA7J/qM6qBJ8
	Nz1nJy6FZlXqOH06hrWyGuysIKFhvaNieu0Fgnf3IQ9EcLqzu6ePiTiaJrAslNOBZNsQBjfliZH
	/EPIscCI0qXh/LcAHQhPdpaSx+GfVEO/HH+dtTPMqOW00pDYAxQnKffOAKvXy0IJ3Y8g=
X-Gm-Gg: ASbGncsTsEj6/+6vGMMS2R3L8eEF38Guaw5zFFEe3+lhQvs+uYVVMR+lmETQsZFeMb2
	WvGcE3aqG/SxBKjxOqa22DUN+yibKQ8/CJTzDHsVl56APro67cKvLAVpVvefq32teh17KeLG+Rs
	BX5/fkM+abewdAy5ym19JuCv4ni53NZ4VOh2Mxq9NqecTlFxVWuUrXQoSS/lsPUANMwQUCG+u21
	TA21NCxmPkyz15n0p9ffNx6aTuj+HHKtVPRunoR0ZcLpGgeieoDMNO7zuSODcjB0p/VmIaOyfoz
	Ysv4TrPcNV/D7yhscKfBB7Yd9cRRjjg+7s+j6u06IH8r5rnt6qYon17oYWr9SfkwHbRWsJtbbtU
	eI73fnixRWTpQhxSfvjQAgOwUewQa8FeBNHFL+US0sxldi3Q9N0nBGwRLkEqLr0Hz19ZFP9S/vq
	8DYx6X9EQcLnq/fFxo3I0BVCrWcak=
X-Received: by 2002:a05:600c:6814:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-475d2ed2703mr122459355e9.32.1761568165620;
        Mon, 27 Oct 2025 05:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERhDOSgpdu7IOhGUhd5vG2oGfH+FtLLHQ8h3X53cAF/bER/zOT53Nw9I8J5TYzsbcubMUbyA==
X-Received: by 2002:a05:600c:6814:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-475d2ed2703mr122458775e9.32.1761568165180;
        Mon, 27 Oct 2025 05:29:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db99asm14109118f8f.32.2025.10.27.05.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:29:24 -0700 (PDT)
Message-ID: <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Date: Mon, 27 Oct 2025 13:29:22 +0100
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
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: Demi Marie Obenour <demiobenour@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
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
In-Reply-To: <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YJ7bhQCZtmpWmV891DQvmnfxPYUvJRZXW_itEoHgBg4_1761568166
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 25.10.25 00:52, Demi Marie Obenour wrote:
> On 10/24/25 10:51, David Hildenbrand wrote:
>> On 24.10.25 16:47, David Woodhouse wrote:
>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>> again.
>>>>>
>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>> state when switching to the new task, instead of using a separate
>>>>> TIF flag.
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>>
>>>>
>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>> folks.
>>>
>>>
>>> I know tglx has shouted at me in the past for precisely this reminder,
>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>> to actually run Xen? Has this been boot tested?
>>
>> And after that, boot-testing sparc as well? :D
>>
>> If it's easy, why not. But other people should not suffer for all the
>> XEN hacks we keep dragging along.
> 
> Which hacks?  Serious question.  Is this just for Xen PV or is HVM
> also affected?

In the context of this series, XEN_LAZY_MMU.

Your question regarding PV/HVM emphasizes my point: how is a submitter 
supposed to know which XEN combinations to test (and how to test them), 
to not confidentially break something here.

We really need guidance+help from the XEN folks here.

-- 
Cheers

David / dhildenb


