Return-Path: <linuxppc-dev+bounces-11988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33BB516F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 14:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMKpl4crCz3dCm;
	Wed, 10 Sep 2025 22:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757507583;
	cv=none; b=EKSt/AxAWmPczhLLWd3AAteR1KWB5dRCfXbs0BRwSDpDHSxDWZp5N4ZdNwp77b7cmfv+b2bMzm3cLzPzF1YjVOsIgcWHBufyfkG+pgLCRhBRaVXtdcyNs+mBTH5BrHTPuALoAh8IteUzz5RGt55l9yAbK/ldx/ksIlfO8n+UM/b5anVIO9eOyU0RAZWX4G0ksXh04kuTExwO8PCECZI0epYk45tRxD3o3W0fdbz8fcPW54Rj8mRXeaWm7oxL7wa4uQooOYurEA0gCvbIqRUEU9SGyXTYFQH2iRDu0BuabnAFJEAFUIOJRG/bWqLVh1Zv0S5G6ItpEzXydqddwRYVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757507583; c=relaxed/relaxed;
	bh=LViYUFGFqV7wdk7rT7+n+ckEpLRp2oc7FTXBWlnTc1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Em5t6KBHPS3bO+RNuIZdGqIQmGx89vMzCEXidpGs4+6MmYwquEooaOIiykpSCtS2Hu2B9Atpfu9/OT48Ges7n1oWVGg7vahQYGYTe1x5+PdcZ91jnz2nVlgobTU6Z2+K/Xfp86FBfSGsNLADO8iGumTUd7WnRaWwW1H+vohA7DT4KQeJLRS8eZs2k3pYldIP+er8HMVcZzvVTapIEfyqSOG4fXcHzL6gPoOgLdnatLKr1La0BHa/dL/lcg7pi5tSed8nVMEoS8tetn1t9rnW6+T9IVPZXOmiV8UMjvbJD9uL8aDS0A6fXzfJWmKKx84cK3ylp2HKzfJ1lNXiacj/vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V80lyMXO; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVgC3dIh; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V80lyMXO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVgC3dIh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMKpk3SZRz3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 22:32:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757507575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LViYUFGFqV7wdk7rT7+n+ckEpLRp2oc7FTXBWlnTc1s=;
	b=V80lyMXOmolY5pPL7O2ntngCvJiOiE9XDp7Yyd3augPB8o2xCOMD/k9+WEJizSjmYaRM0L
	BqQEossHvOmXeNwZO6zfTP85JXibloBUNy2dSCuHOuFKVzKXFCa6+UDo5k2jEr/291Y6UL
	v/2xa1kfjwLyTUOnNL6ESflGfaXyFDY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757507576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LViYUFGFqV7wdk7rT7+n+ckEpLRp2oc7FTXBWlnTc1s=;
	b=VVgC3dIhNjTh+MATJSIkn5UvNwllUlCKqlTxcOcIOxw1vM2XMtCCqet22XnxjwlsimXA2q
	yoM/nVGqUyqKULPtnUwkBQEMqu950hpw7SY3EdaM6a5bk1yTzZuks830PvYtkSbJGs/Pkn
	BEK5chCT0EhDszhWg6OHFlJLsRkViZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-6L1hY_-hMhC8Te6RHq2awA-1; Wed, 10 Sep 2025 08:32:52 -0400
X-MC-Unique: 6L1hY_-hMhC8Te6RHq2awA-1
X-Mimecast-MFC-AGG-ID: 6L1hY_-hMhC8Te6RHq2awA_1757507571
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so3919115e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 05:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757507571; x=1758112371;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LViYUFGFqV7wdk7rT7+n+ckEpLRp2oc7FTXBWlnTc1s=;
        b=jIGjQ/gMlPR4IsfjrqR44izN78xCGmDe0fAlpL6PFl8xi9XwdqVrks+k3Sr1PYpDm2
         6mVyHwhBRGUPLk/q/SHPKgu3YKRNjSwBViLYscnNvVV5NpH8ADVAgSsuBmtJgBCewf89
         x0DayaCBLze8rMOMNY/f92ZUmPI0BJuFrJ4heYhTbKHfN43u9/apgqBC6flaE4bCZxWN
         l/k8w98ubQ2UQYBQS7wO+azJPJQsQntufgjsxi+mOPPyPFSfGLUcgo2dlf2NHqznVXv5
         073nush+C+JjWUQ7rjrpmttxkdCelHW2/N4+NNY9yxkKVP3hLqw+t+jKzkDepu5IgmUb
         uJxw==
X-Forwarded-Encrypted: i=1; AJvYcCVd0hZUxmjnFI0kKjlsXDOaj56CKA5bXEycDFU/PVS4XBFSc6v/Nsl3SHediG2Dv7HPHoN9KDH/NYJXD1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFnhHrtdyllzWkNl0EmkNrZipbSlc/vJgul1OOOcQzhYOmuhAR
	qnRHrHYejgqneG9GZK6480jn5CiBLIXQvxALimqBWIVZFKS0+PSNOj3eDZfsqjcoFnyj1vGjuDs
	duWRHMFWmLVCBPWc1uNF3D8C+qbr5e8371GlJh4uPPWg9oF8+2VN/GwxMOL48JxxyTRE=
X-Gm-Gg: ASbGncs6OIbkCFinOR0hxH4r9Mk3bizYGbVq7l7G9x8qWVMEsV3CG6Kr77fAtAXOhd2
	kVNTUSL2W1bLHjFXQtyI6nQYAI68RUgW2bzYYD6C0FlE5lEirAefjF3dwh1FnbGJOaCTAXvl8eI
	kP6W4n5G9C94GGO/ul5lLhiSOtNxWLWLSzFRWNAqZrq0comaGymiiIhRMA6FrXTEV7mnSAx0hJM
	p3wQ3reBR1nKzTFyHSCvBpBSUSMdw2U+fx4ucVNFz3ezqNpvYVA3l24rWrk+zf0ytDB8p22C2VF
	4NfOJgfwczMfnySDb0NFxLpWufhg4TZ0F95J7kUtZiKG7C1i5HGx0/zGEsYOIzYzDqHiC2RI6HJ
	yIeyFtJA/PtF8tL+RZQzEl02rxeoqmTQhHdYrOcfroBgtu2JDkfXk0t/4R+nM31R+YG8=
X-Received: by 2002:a05:600c:3b1d:b0:45b:8ac2:9761 with SMTP id 5b1f17b1804b1-45dde20e5c0mr148260835e9.13.1757507570809;
        Wed, 10 Sep 2025 05:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/W9Mmo72Y7k0e/5lev9LwiyPK0j0L4lMPmSP/XxC16yAcbXhF14eU/SqL+2U67nqcP2mA5Q==
X-Received: by 2002:a05:600c:3b1d:b0:45b:8ac2:9761 with SMTP id 5b1f17b1804b1-45dde20e5c0mr148260265e9.13.1757507570271;
        Wed, 10 Sep 2025 05:32:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f17:9c00:d650:ab5f:74c2:2175? (p200300d82f179c00d650ab5f74c22175.dip0.t-ipconnect.de. [2003:d8:2f17:9c00:d650:ab5f:74c2:2175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bfd08sm6588369f8f.4.2025.09.10.05.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:32:49 -0700 (PDT)
Message-ID: <b908b8a9-8860-4464-b86c-467797f1fafd@redhat.com>
Date: Wed, 10 Sep 2025 14:32:47 +0200
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
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <aMDYdp3H-yOHU1Pm@casper.infradead.org>
 <b60310f3-25d3-4f2b-88cb-ad65d5f55ec2@app.fastmail.com>
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
In-Reply-To: <b60310f3-25d3-4f2b-88cb-ad65d5f55ec2@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ntx7VmUXQ2IpWw52o4pw1urbb8H6j4YMX_kkh3vHUy8_1757507571
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10.09.25 14:17, Arnd Bergmann wrote:
> On Wed, Sep 10, 2025, at 03:46, Matthew Wilcox wrote:
>> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>>> While removing a feature that is actively used is clearly a regression
>>> and not normally done, I expect removing highmem is going to happen
>>> at some point anyway when there are few enough users, but the question
>>> is when that time will be.
>>
>> I don't mind that the feature remains ... unless it causes us trouble.
>> Which it currently does.  Perhaps we could start by removing HIGHPTE?
>> There was a certain amount of complexity introduced into the page fault
>> path when support for that was introduced.  x86 removed support for it,
>> so it's just ARM left before we can remove the complexity again.
>>
>> Most of the other pain points are around storing metadata (directories,
>> superblocks, etc) in page cache highmem.  I think we can get rid of that
>> now too.
> 
> Agreed, this is roughly what I meant with the suggestion of removing
> __GFP_HIGHMEM allocations from as many places as possible, while leaving
> the pagecache and zram. I already brought up HIGHPTE earlier this year
> since it already has an separate Kconfig symbol, but Russell was worried
> about increasing the lowmem usage at all.
> 
> Maybe we could go back to the earlier idea of first categorizing
> the important highmem users better, and make it possible to
> use Kconfig symbols to enable highpte/highmem-anonymous/highmem-file/
> highmem-metadata/highmem-zram/... individually as well as count the
> actual usage for each of them. Having statistics in /proc/meminfo or
> similar would allow more informed decision about no longer supporting
> some of the categories later.

That makes sense.

Essentially, let's move out as much of the 
now-possibly-unnecessary-complexity while still leaving basic highmem 
support in. To mean that implies removing highpte first.

> 
> Not sure how many __GFP_ flags we could reasonably spend on categorizing,
> as we are already up to 26 out of 32 (not counting CONFIG_ASAN_HW_TAGS,
> which is 64-bit only and uses two more bits), or what alternative
> would work.
> 
>> I don't see any particular need to gt rid of file data stored in highmem,
>> nor anonymous memory stored in highmem.  And if we're only talking
>> about hundreds of megabytes of memory, I think anon+ file pagecache is
>> probably most of the memory in the system already unless you have some
>> very weird workloads.
> 
> The main problem I see with the pagecache itself is that the fewer
> highmem machines people test on, the harder it gets to spot regressions
> where new code fails to kmap() the pages correctly.

Yes. Whenever I touch highmem I'm concerned I will silently break 
something and nobody notices.

Then I find myself booting a x86-pat in a VM and wonder why we are still 
supporting that and why it is so hard for me to get it tested. If we 
manage to not have that testing part so annoying, it would already eb a 
big win.

(did ever anybody look into simulating highmem on 64bit to make it 
easier to test?)

> 
> Another concern is the number of memory zones, but it does not appear
> that we would completely remove ZONE_HIGHMEM as long as ZRAM or pagecache
> uses it.
> 
>> Where we may want to be a bit careful is some people have Plans to
>> reuse the kmap infrastructure to support things like unmapping the
>> pagecacheto protect against spectre-eqsue attacks.  I know Intel was
>> working on this when 3dxp was going to be a Thing, but it's recently
>> been brought back:
>>
>> https://lore.kernel.org/linux-mm/20250812173109.295750-1-jackmanb@google.com/
> 
> If that gets merged, it would at least address the concern about
> testing, since presumably many bugs around missing kmap/kumap then
> also show up on x86-64 kernels with ASI enabled.

Right. Likely we should at some point cleanup the api to not talk about 
map/unmap but rather something along the lines of "start access / end 
access".

-- 
Cheers

David / dhildenb


