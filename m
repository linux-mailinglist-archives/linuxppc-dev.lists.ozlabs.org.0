Return-Path: <linuxppc-dev+bounces-13143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01493BFAEE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs2bX3VGKz3069;
	Wed, 22 Oct 2025 19:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761122248;
	cv=none; b=fuuoZ/ueJ5ZMLXbDtHctZNsbVh54o4dVDrsgni4O9YA0vNpGAeHfEORv6cjjYSiaGEEDJk7n01kZOD1Ffc6P0fcieh4HJtvSBCnNgwEsLovX5p4zJuqVYHxJPwTA7YiILKPZ9oiICDRGOpFw29ze0FIlGN+EQGlT++lWTISsq8LF7F5e2+ciCMJZjJZJqCD2KBRjILGjrfcPFtCEyMXpeXRSlNabRcDGlPg3wdLo+dTz8BfBfuDYNIGaIbUYJTp7ullhSP2i7ulKn1wRGTwEFHuWLmKUNSQ4RHagP50j6PaXaPBMoqpk9CnCz0k6g2wzlkumyzMskGyx8tdv6TQB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761122248; c=relaxed/relaxed;
	bh=PowtbTWFPJpvinHpTKYrok9CuCgmG5go5XaSSmfJb6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmFXyDQZmjLH0lxohVB5kEBjI0jbHeLFGLO82j0kxBEB9QHww86jUFp88xpPrU9IGFudBMLJWXLW3OgAZBF64g9nKvpU9YgNIQWkgOHHN+R0o4oLyT7PhEvQ0b5OVFkrAxUuRZNHJezpxCo8IsV3Q+FoPQJhi1SQWQMEtYJN60YiEb7sTBnPJvbE9xYQ9h2DwKHlKC9KtQZc34gywIhyTiWySTU1oq4V4+5Ee5nvQQIlhSIVAaPTc1s22bg/CqZt9vkji/GzvPv+jWHZwsuUc9prW2XezGintlBEJ+i95MjiUK7xsY1om0pf1efeeZOAvtG7sQIKZHm4FMnCXJ9+Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IX1nxqej; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IX1nxqej; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IX1nxqej;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IX1nxqej;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs2bW24gVz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:37:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PowtbTWFPJpvinHpTKYrok9CuCgmG5go5XaSSmfJb6o=;
	b=IX1nxqejHII1Cml2O6ULLcXE2blsQ3AT1JffMiScTCH1wqfvm1duMi9PS8ifNiiO2HaYXP
	pq+QmVHzTegTewPOCg3AhmhcdG4TARfnV9Ev82+IAAm81olBVF/N+2GOFroqvKvsa/i2O3
	CZkfmmnl3lW6sRKIcrjYP9q690Am0mY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PowtbTWFPJpvinHpTKYrok9CuCgmG5go5XaSSmfJb6o=;
	b=IX1nxqejHII1Cml2O6ULLcXE2blsQ3AT1JffMiScTCH1wqfvm1duMi9PS8ifNiiO2HaYXP
	pq+QmVHzTegTewPOCg3AhmhcdG4TARfnV9Ev82+IAAm81olBVF/N+2GOFroqvKvsa/i2O3
	CZkfmmnl3lW6sRKIcrjYP9q690Am0mY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-GiCrpeu3NwSYIdF-sUOuFQ-1; Wed, 22 Oct 2025 04:37:20 -0400
X-MC-Unique: GiCrpeu3NwSYIdF-sUOuFQ-1
X-Mimecast-MFC-AGG-ID: GiCrpeu3NwSYIdF-sUOuFQ_1761122239
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so55320945e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 01:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122239; x=1761727039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PowtbTWFPJpvinHpTKYrok9CuCgmG5go5XaSSmfJb6o=;
        b=CNWHGPTNWxAM1/xxtGi1I10MKz62gaNp0AUJQecgOX+cN3xAaZZ/F8iyZaXXzX44PJ
         9mEGHufoSaIZzSaAyz8Xli1e6/XCCHf/PyfChMkrxNBz5++2bEoZQ1qmBIiAaY4fULFz
         yXEO9yl09VmUtBCw4gXozXTq5djaJ9qR2rA+XxlhkM9hSMAPOaksun5vrBFtkBl5phiU
         fIbpEp2XehDWVYj7IhHcyoZ49RuaTZP2zmAU0GqglJCDR5O4v0jrA9OAvVoVMGIWNp9h
         iDnoxi/NLowHNKv05GVBWBDN0Kp7QUzNKpLU9arDE0nu9RbqT9pD+M3Tk1WZMWKlaE2Q
         ndyw==
X-Forwarded-Encrypted: i=1; AJvYcCWI2O+fz+N3pJaJ8BTwEDYWhaBBTrzjhouBaYgHPEn+Y8PN69mhr+K3FZXJxv/WxIA+EeNiGqWG328NYWA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrLEUozmynrr4i9DmEmiC+aUTibQSVOUi0DtbDFxGdMFGaJytl
	iK+UI2TR91i6XMHcYVNjcxLqP84pqq32F0RVKygrlmSVCTrGAr8AvpBAR34EpL0X1FLlcs6C18X
	ES3H+muGrOixsQfzRUaCVWeTxfBczTgMLzlnEVUxUMhJkoowD8FStMM4uPyzuKbXjb74=
X-Gm-Gg: ASbGncs9oEswHnxHPxnAbxlQZ63J2S6OVqbeaZABshaiE9vyHNkXKBACjBWHibgLKCK
	CT19hW7ei1sLR8MdE9HLUQtMc+MKC1pzhrrygjuYRBnErbPlCeMfFPdsxfYFWkLxGFDNwA1mQGh
	byzFknV6cbKqETBCYufPGGblEE2m7x7EcddQuyQVQETw/+CV6FzGkqyPZwYP3RkSVuIv2n3owdO
	AS4Cf67Cx+T/sfUzbB4H+seuvwGGvhkOwCmpo/qdW8jLHoCwm7mE9y5JUxjeXFw2vwhLV4/MVyt
	PSdmOmJkfRwmB9JyhHRiqReu1Dao1SlMk9I2TCSmiyoLD3JbvYn784WVBhXvMofCqucNUce1mzi
	owZBflSbmBfyknlGH+m9i+PMQ3MzkyZooodYwD5xyvNpT1YtwAHEQOr5DwYdmlhgNB+LUjQML1k
	77AO3AzX4/up9DKIej8b+4mEn5boA=
X-Received: by 2002:a05:600c:64cf:b0:471:12ed:f698 with SMTP id 5b1f17b1804b1-4711786c793mr157782605e9.8.1761122239146;
        Wed, 22 Oct 2025 01:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFItCI5iZhW1a4GMCfGAtG97A/+uLrq+f4lTV3/dPOqU9C5XR4W+DY4bimzCkihYZ5ekVZbVw==
X-Received: by 2002:a05:600c:64cf:b0:471:12ed:f698 with SMTP id 5b1f17b1804b1-4711786c793mr157782285e9.8.1761122238693;
        Wed, 22 Oct 2025 01:37:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427c3bfsm37040815e9.3.2025.10.22.01.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:37:18 -0700 (PDT)
Message-ID: <5be0d531-aa15-4852-b29d-cc3d71334894@redhat.com>
Date: Wed, 22 Oct 2025 10:37:16 +0200
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
Subject: Re: [PATCH v1 03/23] powerpc/pseries/cmm: remove
 cmm_balloon_compaction_init()
To: "Michael S. Tsirkin" <mst@redhat.com>
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
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-4-david@redhat.com>
 <20251021164220-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251021164220-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w9wEQjZy6OHW4vQYFKcxHvcIInxWQpxSglJ-uhZ4Knk_1761122239
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21.10.25 22:43, Michael S. Tsirkin wrote:
> On Tue, Oct 21, 2025 at 02:59:08PM +0200, David Hildenbrand wrote:
>> Now that there is not a lot of logic left, let's just inline setting up
>> the migration function.
>>
>> To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
>> the compiler happy by only providing the function declaration.
>>
>> Now that the function is gone, drop the "out_balloon_compaction" label.
>> Note that before commit 68f2736a8583 ("mm: Convert all PageMovable users
>> to movable_operations"), now not anymore.
> 
> What does this sentence mean?

Should have been "... we actually had to undo something, now not anymore."

Thanks!

-- 
Cheers

David / dhildenb


