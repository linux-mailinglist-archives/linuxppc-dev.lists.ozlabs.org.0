Return-Path: <linuxppc-dev+bounces-11690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F255BB42991
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 21:13:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHC224wQzz30VL;
	Thu,  4 Sep 2025 05:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756926810;
	cv=none; b=LF4AqSnOwaJyY0+fL4SztG0HZxZcvFTZR+cD7xHc+e4Blj7hw+QsXo31qAOh64pfYt0QSuiH0cKyGJ+zl5zDWbVhknNybu06hi/y863AEYdQYc9JqAJrGVwQWP044w7J4Z4qX1GPpuizpzmst65Ld44CBSfCbAcCZki8wsWtsAoNLpzaul/khwcyos4fHmS81mB4+2vV14pnfO1fFRPPSSpxNOGtzMcHRL7s2j/SomX8jCbyfzbvzT6cE2D0UkkOV3j9mXYnz7+af1Pj8Dl6uVHD29lhdxZ1QTdg/9dfNstGotwsGcUwI6tHm8ux+ACu2fW3pPt4K1iE713Xm5NlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756926810; c=relaxed/relaxed;
	bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGeX52BvQp49JHwfWgJGxwUZY1VoIxRw3U5MyqpWFvQNC09sE5UTm+bllfzDUIqFaFYHwTFY4IF7pnc/pwidz7XLJercc7yoAhU2XKIbm0rSslqM2kqfl33aoQ3li3+d409cPrtBr9ZmvVprtlCIoQwgrSUBe7rh6uslTFqqxbnOCmTBPkP7ePUkIB5TQNdhcVkUnPcHqP8smdlZVeJYK/iEeIVuB8p7vZUt3QIz8hrs0kKBYwzCc86rdb95t9FR8nxOnILq8KaAWBHBgltA9ojqA21ccvMIZQjCjy5JSgoMjGBYurE4+9dL+ezhhrUNQ1qK+ebACRtTmVfu91cTVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WU+u29Rt; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WU+u29Rt; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WU+u29Rt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WU+u29Rt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHC2143frz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 05:13:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756926802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=;
	b=WU+u29RtJu4lAULgCriIIcl9PQjrVX6KnsDtjGtp69DBiuPnMqGEzuHXfB2c6otv603tBZ
	5a9ZMTXfl10PUlkM0W09nzJTigq2JEeiCq18Dwln7Bupy7Qkr7z/RbvvCB583Hi1Nyoop/
	44t0sMZ0WRLvHx+mHXSegnfv8qzg3KY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756926802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=;
	b=WU+u29RtJu4lAULgCriIIcl9PQjrVX6KnsDtjGtp69DBiuPnMqGEzuHXfB2c6otv603tBZ
	5a9ZMTXfl10PUlkM0W09nzJTigq2JEeiCq18Dwln7Bupy7Qkr7z/RbvvCB583Hi1Nyoop/
	44t0sMZ0WRLvHx+mHXSegnfv8qzg3KY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-mF1GdhoIPLeO78cbcORl-A-1; Wed, 03 Sep 2025 15:13:20 -0400
X-MC-Unique: mF1GdhoIPLeO78cbcORl-A-1
X-Mimecast-MFC-AGG-ID: mF1GdhoIPLeO78cbcORl-A_1756926800
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3e067ef24aaso128611f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 12:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926799; x=1757531599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=;
        b=Nblx9UjVheIlXkTRveJjY73a0ehrQVQ5cAjJAlv/2M6wHD6oFkIdSnIhrp9vEerTHS
         tUmj2KMx/Hcv6adJfGapHpOSuNQDuUaq1l0QYjEbD7cBumWT4xsr7TultiW9Unhs9uK5
         fjTUWXy7mPATrwlAT9uz9bFFAsO4H4mWvXXlxHWolVh3pk8JV+0WLf3PTEzVcwnVRx4y
         jvke/OBWmMXpTeR+Md+coYY0NErENE46VWqdU0BCKpMnbXf5DXA+FWQJU7LsV5KwXrJn
         HPd0XK+W3pIVWGL9ik2CRCpSGFiQrJtLHTI++Jbxv/DF5XY6IlFn+IFyOweAkqkbrvBC
         bK3A==
X-Forwarded-Encrypted: i=1; AJvYcCVZTLDOK5NxyEJ7ya0cTdVNo43LLFcynOpy0dai0EUK7vJHsbJKh7JQ3fpNJOk1R9TPgv3vtN0vtPeXb5U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNnPbt+YXwFgl/OP2d0QLAsBSYNPM7RqLpmGirpHoQLVgW5C8X
	BniZ7iDtNpJ8JiyZz0izqhS7AD5n13V6JtPb8XlFmEBZZs3y+MW1VbYZZoxCKQ96OjnCZ0hLePG
	KbzVUIMO8OfdkxNBY9/9PcZzz2X6iG0E7MNAidI8qnyP5Npd7g8EMkoVtRKEF/knE5JY=
X-Gm-Gg: ASbGncseGaV+nmbPwHma+ZoixycYHqZ65W8K/fD8U7RVcVdE6uzgd6S8FfkZRiUxcwf
	ChwkdCEpwO/LzdA7QFv4JDmrrwHOErtnb/fC32v47zo8Cx5tGbvWkPLvTIhAFbT6OxBYSdLnWec
	pAxvjuia15wXEMVhjd+xRzy5af88HxQzDkHUvMngwK7i/m8wyRcNGGE0bKHu0FO3PdTekFO4LQS
	wKHXuF7X6qsatSfwQ9A26EJ6qm8s36sficruK27ItPKnRySbz6AS+tmt8cdTTNvnAeKkS0EI9Pf
	jhIyG5Xwbf5/8G7utwK9P20b2YhPcBQUj+2FXN0a0fjaxMx+ir4tJLKz0uMgfQA0W9RXZOXa9q/
	s00fjVtEKBjbCZhnJ9Vq7QAdrQohhav+sxh1/Zy8uGCU25XYulXJV87E0aF3t3qyyg9E=
X-Received: by 2002:a05:6000:26c4:b0:3d0:e908:a10b with SMTP id ffacd0b85a97d-3d1e0a98afdmr12916658f8f.56.1756926799522;
        Wed, 03 Sep 2025 12:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ/vbJZF7Gnq5OOkQLM1RIJN39KlfIKUtJSN0ttlFYZVmCF5jsL7cMmb4EZqATRVjN+d4Mbg==
X-Received: by 2002:a05:6000:26c4:b0:3d0:e908:a10b with SMTP id ffacd0b85a97d-3d1e0a98afdmr12916642f8f.56.1756926799082;
        Wed, 03 Sep 2025 12:13:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f09:9c00:8173:2a94:640d:dd31? (p200300d82f099c0081732a94640ddd31.dip0.t-ipconnect.de. [2003:d8:2f09:9c00:8173:2a94:640d:dd31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d66b013b7dsm13632800f8f.28.2025.09.03.12.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 12:13:18 -0700 (PDT)
Message-ID: <8ac6e37b-15f0-40ee-b60c-8893156f8cbd@redhat.com>
Date: Wed, 3 Sep 2025 21:13:17 +0200
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
Subject: Re: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in
 free_pages()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-8-vishal.moola@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8CQMywv8CISA78S1m8h-uJw4mLaSwAh44e4i9UUAhjw_1756926800
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 03.09.25 20:59, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


