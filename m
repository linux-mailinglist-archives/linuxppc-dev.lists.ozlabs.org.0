Return-Path: <linuxppc-dev+bounces-9950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A1AEF062
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 10:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWbCD4vrsz2yqn;
	Tue,  1 Jul 2025 18:04:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751357048;
	cv=none; b=QtXOy9+qf9M7Zkd5a+kZ+ZlqDpPaNJJT3/2LK6PlpqM6/cDLgRsIxQRMbo3+ygQuXyucJXZUDSnw9B6IzTBDha/rknP2HG7qhTUrfdFwpnx9EAss/IBQqbIv8NB/l0IlcjjYC/rkFkrx0KtdYOR1AI8r6oOy94Y4jex2mlE3bjdpAbnui1WrZ248GZQ4E0oVrFdlCefCNlHKKik1aoOepNc/VO1pnXAG/8RUhvSZ2aaWofOh2fLBdOfd9kYuMF190BiTNNm3Cn/wkYBhYNQYXpW71xHqUaCftOcrCk/LdwGOu79y+QF8y0aagg+EZ+fQjp5h3wRYGXumEeCR4SdrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751357048; c=relaxed/relaxed;
	bh=pUfxa+nNjdWULRVVJvn16LKseq+jCWAXhMIO+TN4r9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoAH2DflEoVWzQVM5EVmQjvUmebMVo5R98pCDsJAQWjdkfeX8lMhhzAf+KOfOE8N2e01ynPgPyfehJ3opcwsoceyVIlQSWnqDNpAAvHmE6TFa7vrpjZzJPb4DzEEiU0v42i+aml+QliHaQLNzXy5QgRozT2sMcRiBK++9vlG1mxCOWraAKBZV7Zf/m7nE911PKClrHg3CTHY8IraeHKfdCEEitLn24wBBmor+qQOAC4vLJyOA7ilhITNVof6mhgAwezuQ3+RfzRDn6vsTgrRI9xv1jwLzcX38z4FcZSOlCTBMnJQQHwlgeM3D4/ZkkAbtS3NW6iydqtIJy8zwuvUiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ta5oHIlP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ta5oHIlP; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ta5oHIlP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ta5oHIlP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWbCC6FwLz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 18:04:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pUfxa+nNjdWULRVVJvn16LKseq+jCWAXhMIO+TN4r9c=;
	b=Ta5oHIlPNOiMjKpBO28OYZSC8J69mm+5phRdv+/aOcl4NriOkVVgZGACgGr8AKYkqv/qLl
	5LsJnXtJdtX9gN9NYyagw3XdBljKMV/ae9BcRzm9+L3FTM7Y5aSajxZYt6hqpi/xNgkx/R
	ckLZerUjgdZftNZ9fILJ/FSxDOzCCCg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pUfxa+nNjdWULRVVJvn16LKseq+jCWAXhMIO+TN4r9c=;
	b=Ta5oHIlPNOiMjKpBO28OYZSC8J69mm+5phRdv+/aOcl4NriOkVVgZGACgGr8AKYkqv/qLl
	5LsJnXtJdtX9gN9NYyagw3XdBljKMV/ae9BcRzm9+L3FTM7Y5aSajxZYt6hqpi/xNgkx/R
	ckLZerUjgdZftNZ9fILJ/FSxDOzCCCg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-UEOI4SnhNkuwG8ApSR6oug-1; Tue, 01 Jul 2025 04:04:02 -0400
X-MC-Unique: UEOI4SnhNkuwG8ApSR6oug-1
X-Mimecast-MFC-AGG-ID: UEOI4SnhNkuwG8ApSR6oug_1751357042
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso17390665e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 01:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357042; x=1751961842;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pUfxa+nNjdWULRVVJvn16LKseq+jCWAXhMIO+TN4r9c=;
        b=dM5lkfDSUt5tjg0LPPVarjDy3jsthW+z2TNExLSfSthSztfH9S1vBcItKYbp2jZ9OA
         +37UpHLj9sFpB/4zoHIjH1pg6pFK/SXrvMoapL8N+JpA5W2pmJc+gV4ch2HVyjwlFMpW
         zPkBPOw0tgrsd4TfNSuRiCYOD1EX4s12Pop8B9RMJfSyrXbEk3X9TxTiEbCT9naG8qCK
         dRg8MycPzYtPNFMorRuwWC8ZpDSbAb0Ay03hphS1O75IqX0DqytfgIXB0spaOjN+v2B2
         42OZA7raQVl1yiS6Un9TtB74c8qKv23vI6PrcaAmWTmPEb6uVwhJLstggBlny3/l02EJ
         DYFg==
X-Forwarded-Encrypted: i=1; AJvYcCVtpq0EmHOTAADxkpqo66nA4q0Z3hgaIifMBR2wme4uNDoBblksZaK5jVM/vfS6US+o544QlpKwq+k5iQ8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwunHbSdxXFn3oeGla3sDrWaEm70w41JhjWs15nag+nEZV7WGMt
	Q9+HcLFMUv0yt5K1h88D4YhDEk+CXChkcmKSZ8BEvQK9vZkqx+YUCaruTEUOVFBVhRt0zN4Rd6G
	KSyGcs/YKoxnFvt3p+vET2p0rcf5dj9XXQTdleyB9B6Lp/QDu3ShZ79TNy1IgFVxg6qc=
X-Gm-Gg: ASbGnctrtMANT8SwXM6uA0dcOPBr50BOQG0HMtAZjnLJzX7ipK8KHyTBg11aqUHif8I
	OwsSoa3irnrIYiS/buRSKEClqcDsNbMEQR/6kABBGgv7y9f3azT9Qe7iwjpzU2sm7Ao71dzYmSK
	lzKJ/eNje74pirLKxb8z34CQtLe4V+H+aAv5lKd9Z5HGpLw3C/AssvQeSCKA6uKtHub8x0SrMX+
	L9VryafqJsLOrUrI5JHKjrzkX0O/tw494qUzTP5OaWLIqETgh/6p0qcbU94lSo4/RD9syFjgRC/
	v1+lsBbklGyPk3fpdBCeqLIU7+7YAZI99gPRGEmel2P5PEcqEvZ55sGDweAHseGRZLNBuNxvoTd
	jYXeHHpKWBhcM+UKSn6jwD2wg2UEczZGpEQvRAa+LGTf6KMiXOQ==
X-Received: by 2002:a05:600c:348b:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-453929a6d39mr150001535e9.9.1751357041444;
        Tue, 01 Jul 2025 01:04:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm6r359RgTt8m7jA8PuYlLgOkMn1+oAKNYFF6zANtJXeownWBFwaSRu8IR5EUD4wI8vxIgKQ==
X-Received: by 2002:a05:600c:348b:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-453929a6d39mr150000635e9.9.1751357040906;
        Tue, 01 Jul 2025 01:04:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c463asm186965025e9.39.2025.07.01.01.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:04:00 -0700 (PDT)
Message-ID: <411b94bb-4662-4357-86a3-05478f2f8c8f@redhat.com>
Date: Tue, 1 Jul 2025 10:03:57 +0200
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
Subject: Re: [PATCH v1 03/29] mm/zsmalloc: drop PageIsolated() related
 VM_BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-4-david@redhat.com>
 <ccc333aa-46c2-49ae-8d0f-ffbde95cb22d@lucifer.local>
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
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ccc333aa-46c2-49ae-8d0f-ffbde95cb22d@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q6yq1JXgaqeXJYCLQoeNJBvNIb6WibG5x0Pd9DKa90U_1751357042
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 17:17, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:44PM +0200, David Hildenbrand wrote:
>> Let's drop these checks; these are conditions the core migration code
>> must make sure will hold either way, no need to double check.
>>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM, one comment below.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 

Thanks!

>> ---
>>   mm/zpdesc.h   | 5 -----
>>   mm/zsmalloc.c | 5 -----
>>   2 files changed, 10 deletions(-)
>>
>> diff --git a/mm/zpdesc.h b/mm/zpdesc.h
>> index d3df316e5bb7b..5cb7e3de43952 100644
>> --- a/mm/zpdesc.h
>> +++ b/mm/zpdesc.h
>> @@ -168,11 +168,6 @@ static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
>>   	__ClearPageZsmalloc(zpdesc_page(zpdesc));
>>   }
>>
>> -static inline bool zpdesc_is_isolated(struct zpdesc *zpdesc)
>> -{
>> -	return PageIsolated(zpdesc_page(zpdesc));
>> -}
>> -
>>   static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
>>   {
>>   	return page_zone(zpdesc_page(zpdesc));
>> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
>> index 999b513c7fdff..7f1431f2be98f 100644
>> --- a/mm/zsmalloc.c
>> +++ b/mm/zsmalloc.c
>> @@ -1719,8 +1719,6 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
>>   	 * Page is locked so zspage couldn't be destroyed. For detail, look at
>>   	 * lock_zspage in free_zspage.
>>   	 */
>> -	VM_BUG_ON_PAGE(PageIsolated(page), page);
>> -
>>   	return true;
>>   }
>>
>> @@ -1739,8 +1737,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>>   	unsigned long old_obj, new_obj;
>>   	unsigned int obj_idx;
>>
>> -	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
>> -
>>   	/* The page is locked, so this pointer must remain valid */
>>   	zspage = get_zspage(zpdesc);
>>   	pool = zspage->pool;
>> @@ -1811,7 +1807,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>>
>>   static void zs_page_putback(struct page *page)
>>   {
>> -	VM_BUG_ON_PAGE(!PageIsolated(page), page);
>>   }
> 
> Can we just drop zs_page_putback from movable_operations() now this is empty?

Common code expects there to be a callback, and I don't want to change 
that. Long-term I assume it will rather indicate a BUG if there is no 
putback handler, not something we want to encourage.

Likely, once we rework that isolated pages cannot get freed here, we'd 
have to handle stuff on the putback path (realize that the page can be 
freed and free it) -- TODO for that is added in #12.

-- 
Cheers,

David / dhildenb


