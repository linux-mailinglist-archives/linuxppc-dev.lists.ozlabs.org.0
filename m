Return-Path: <linuxppc-dev+bounces-13117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D587BF76BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:37:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crbz86FkDz30D3;
	Wed, 22 Oct 2025 02:37:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761061076;
	cv=none; b=Jn6rdzWZE/8lot5dxXpaVN2ji9jn8cw3Lq4lbqG+G+U8fJp2SwSKFmOCXMGR3tcpBgDoN5MXfjKlDQNrkYx9dhyAaN3eRFez2fjHFAUelDO3HnxtDdOjtcXM39tEbqRBRZyt8oY8RVj3ALAaVDuFPDxQGnSFyAEFe0O+EzLecLVKWZ475ln2I7eWHfeyjO1ZA6FjQ5YPo0mqhXWYM4gemYYE+j7KLtE2VCl9Vec+lVkgyHIbFOAYhjedX6K8Nqv8qVDGvW6ihiaNsHTR47meNVPVl8KRgSHeEDqeUQCw8Qexr6HoiI5Dx5hbfEQIkNwHaHBpW7iVo+YJEYMLwwoj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761061076; c=relaxed/relaxed;
	bh=E/7c5A5jjBJdHFU5IeWULrzoKt5LxZ5pQlNBoEOn3xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtroOexKGEjMw3NfWrNo23I1J3cLvC7CEb5Vql5XQ5iUz7WF2mXbakpx5XxGOvVSKxaKx09cxLcpSRRAv/oY7++PIVMczJHab+5TW4oF6IMVG5Avp7yLYE/HvZpS0UkN74+xAM18h8n2rrO7Yy6+RmVT1ysRxSWGs1jj6cbHAkcXTLCCfx39Jn1/SJwF1c8drCk+97U10pjO+vROYZDDpoqWun8Pol4p4v79t33Q9yY9M0vkUaGKSY0nmc8L7SYNGshnNEP37bu6C/YMylj3249taqf0ji01ny6B21vX7+V8hDCN4oKKFc9/8etARnTnBHoFGYw03O5TrlIwWkcQsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHn9QZNA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IxWIt941; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHn9QZNA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IxWIt941;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crbz809PSz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:37:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761061072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E/7c5A5jjBJdHFU5IeWULrzoKt5LxZ5pQlNBoEOn3xM=;
	b=MHn9QZNAYF1pyXm5ov60r9gLdAhWTAc4/LoLaIVsIyF6V/dTp1Sz2DR2gwYEpQlkHqhrJF
	GZsdvxwfnwDil3fR2NCz0YCHlor5yLsXgf3LDZa9DQJ85UbypzFRnLrun/cjW8VHeL3gcR
	Cs8OyKOTJwjyLZcNHpaVMPmtnKZTteM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761061073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E/7c5A5jjBJdHFU5IeWULrzoKt5LxZ5pQlNBoEOn3xM=;
	b=IxWIt941Mlh+TSW94v6yNjZ6afU2rhxnV3ni03Yb1eRqyUOJ7XtxlWPAx31KFKDipZnGh5
	OQlS7atkgHFaSDSlVoj7sb/CUBqzLhKl6DuFW2VV5lnGr7sm8kviyF8IK75fg0c8OMpsHf
	GviKtSz8KbtZqxm10VkPS2cl1str0u8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-Ct3E_VW7PwSIVWHLZucLdA-1; Tue, 21 Oct 2025 11:37:51 -0400
X-MC-Unique: Ct3E_VW7PwSIVWHLZucLdA-1
X-Mimecast-MFC-AGG-ID: Ct3E_VW7PwSIVWHLZucLdA_1761061070
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-427091d7f2fso1750608f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761061070; x=1761665870;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/7c5A5jjBJdHFU5IeWULrzoKt5LxZ5pQlNBoEOn3xM=;
        b=KoMF7iA1DSk/MkQ01qZMDieNf8AzvJEuP6dD76N52n0vzvlEYUHpqBh84mXnKBQVn0
         uSW7Wv1yJrSbecFdGmf02GPRIf7YndixcmRRTLVJDqt2D0x2+5Wyh32sT63FCHGWXsLA
         kTDdjoJfrKsz7UfzLQKzh/fb5uk6hinaFhp3pr5N+mEs0j1SNn1jlgkF+iqxd9XqneFk
         1zIpYiOdepu9hT/yPllteg0VoJyxTxrbxuoITIcbK65HZoo4/nA3XJbXT59Ut+8wd7/Y
         aYIeCCNcv01COi/7R1ulDYZCqKIqX+3q+JdZB7W2LWy2mJlZSa9cPczUH49N2ba+6oTv
         mSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2EVXyKKzP6r0ooUo1fLRwFOLHfnpdK9FQp6MxXODtKxxO5N6866sVEXppcucYAaYPlVljZl4EyhhAqq0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMOpIzhTgTqPpZm2/E3cxayAP5YgSfJjGJg/ximMMMBPgxstV3
	ZxX4kaayc2aZUTc75lvyVO848hS4e02U9WHO532/rgEXeXd27QjvHNIgdoKT+4ImAn5fmLCYVli
	zHNf2HMKriZvvIWHKorePOi4vb+rdqJMw24YFzLNTUl5VpK6cm32l1E2/ZtuREdQqJzY=
X-Gm-Gg: ASbGnct4pbU7VrC/cu0X9BnjFQc3SAqtCdiV+1vFr2qqBAE2QIE8vFOElfiC6RRDaR1
	sE1XOG07lOP7xvZJylGeQJUGqJYduJtPky+O/y8ksPaUWAvZkW0btmdTXN1g8CflQ/xb3i5NpEC
	VfCqiqRSvx7v1x6NVUDwqrfVpf+3rsZExk3BZhZBccHI+1pqwgm40GtdBSo0wyl8TAqZ1lG0j+t
	UScY+SdFcLdhMTENSD3lVJMiOzu1KObhrmSN1O33e/+gedU79kIs/qxmOvZty/m3/XVdadQKmDp
	WV4dnF1j6yiN52EN4g7y1QMfeTQ4+wKUKpxsDBbSIj+L/1FgAheUDpm7ROQtNz9dOwCcWZDCTrk
	Ylb/uO5eECKuMPBdNalpVrlxEYCCf2ebyiot22lZnWQf28xluBF6T5IjN988dzINojkwKOE6C/J
	OFOD+LupyqYh3m0HNLeUjCNIrZ0xw=
X-Received: by 2002:a05:6000:2dc7:b0:428:4354:aa36 with SMTP id ffacd0b85a97d-4284354abd1mr6785993f8f.58.1761061069855;
        Tue, 21 Oct 2025 08:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV8Htnc2zerYOltHWq7nqPdBH+VgpCEEL3l5nIU7iiXfnT5bpNfFWhrGmLn4T4UZuxhmt8jQ==
X-Received: by 2002:a05:6000:2dc7:b0:428:4354:aa36 with SMTP id ffacd0b85a97d-4284354abd1mr6785942f8f.58.1761061069356;
        Tue, 21 Oct 2025 08:37:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm21478704f8f.28.2025.10.21.08.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:37:48 -0700 (PDT)
Message-ID: <79f01115-3c9e-4316-92d5-bd050eeb3b76@redhat.com>
Date: Tue, 21 Oct 2025 17:37:47 +0200
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
Subject: Re: [PATCH v1 14/23] mm/balloon_compaction: move internal helpers to
 memory_compaction.c
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-15-david@redhat.com>
 <C2893E27-CA03-4416-9444-62929A740691@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <C2893E27-CA03-4416-9444-62929A740691@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: twEULI8mvnTZ1o4kNR1-ZBSKKmb5uQLY-2OZ8W4BFgQ_1761061070
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21.10.25 17:36, Zi Yan wrote:
> On 21 Oct 2025, at 8:59, David Hildenbrand wrote:
> 
>> Let's move the helpers that are not required by drivers anymore.
>>
>> While at it, drop the doc of balloon_page_device() as it is trivial.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/linux/balloon_compaction.h | 44 ------------------------------
>>   mm/balloon_compaction.c            | 38 ++++++++++++++++++++++++++
>>   2 files changed, 38 insertions(+), 44 deletions(-)
>>
> 
> In the email subject, s/memory_compaction/balloon_compaction/

Indeed, thanks!

-- 
Cheers

David / dhildenb


