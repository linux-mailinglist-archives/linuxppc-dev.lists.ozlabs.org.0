Return-Path: <linuxppc-dev+bounces-13144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB4BFAEEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs2cC3nMtz30Qk;
	Wed, 22 Oct 2025 19:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761122283;
	cv=none; b=KL1gUMlmqw9v7kuQL4pfzYUvLSlcpIkvKSHFTL7HPOjqifHRbYhe7BSP+qrv1X0bQKRpW6bTMB6x/jCgvKwkZMB42nBGV1cR15nEP7YsyOBRpiYcWcI93eRcuGXCSkGmNOeMfWh9ti/mnCLp4PERFzqWyp4w+HuovwFfWqp6+FXyTIml9FPbiQH3T4CxFvS0nA951n0dHmm+yljQrLiGYVB22ULHhG18vB3RHkdvYhgYaGcWsknwLcPn/OgixWC52RsnoiRRG+S0NYnwwWIS+X4BLz8ph22XiGZvbHOlB6Bul6q7WbYhlLqKZvx5OHEwklvdwBn0jlcZ8vrNx55LgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761122283; c=relaxed/relaxed;
	bh=HORYs91dLQQexQDsveH7tAbNx9ev00vg3VpMbAGTK3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIKFzeQoikBHP4syS800apWUmYnezciHaHozMO5T/qoNEdaRYMXKsgpLB9gzuxk/5hgohLE7zXSLmMi/cRio1e7u2Xko6sXUHJqdH/aHTfc0Q1kuODniCKRwudBsckdhZmmPXhGKSkCMFizCyGWBLHA+1cGE7HZdnXVo28c1O7xc8GyJSEwQA5ebO7u2yoTUnOn/5gtx9s7FSHv+ht5guzZeulqvqS0uiCXYqOdk985ZSazRyNuJ/oxaU3Un9VtKCazp1wS4OGiJwAJVieWgIItHuEDhFLx2E0CKM92yuclfQQena2XU74bcUB3BRhEwhcLtZPlnexDDg/6t1UcUkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b8kQSL5F; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b8kQSL5F; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b8kQSL5F;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b8kQSL5F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs2cB4TCYz2yrb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:38:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HORYs91dLQQexQDsveH7tAbNx9ev00vg3VpMbAGTK3I=;
	b=b8kQSL5FciQ3K6ACiLOeas4zkEkQi4ZUJCgqCo7jLvSLxBOnFXBkm+TLdsRIaB3Zo8zs3c
	yD4juoQQ7d+UH+zpgG6Stq19QAcQY8hV3MsjgEpWEsA+bKdeVewU0rm38SNtoxrttwRopX
	ksDV2oFV3DZ3yjhPyxFJ1tzh9Te8Zjs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HORYs91dLQQexQDsveH7tAbNx9ev00vg3VpMbAGTK3I=;
	b=b8kQSL5FciQ3K6ACiLOeas4zkEkQi4ZUJCgqCo7jLvSLxBOnFXBkm+TLdsRIaB3Zo8zs3c
	yD4juoQQ7d+UH+zpgG6Stq19QAcQY8hV3MsjgEpWEsA+bKdeVewU0rm38SNtoxrttwRopX
	ksDV2oFV3DZ3yjhPyxFJ1tzh9Te8Zjs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-_Bwtg9XNNla-ratvAYBB3A-1; Wed, 22 Oct 2025 04:37:57 -0400
X-MC-Unique: _Bwtg9XNNla-ratvAYBB3A-1
X-Mimecast-MFC-AGG-ID: _Bwtg9XNNla-ratvAYBB3A_1761122276
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-471168953bdso5385485e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 01:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122276; x=1761727076;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HORYs91dLQQexQDsveH7tAbNx9ev00vg3VpMbAGTK3I=;
        b=canXWwAKXNRjukt9PlZ6XI5PpNU2YUvrxejZII3wiAfsdPXFh9xiuKovXsdUz/vOYL
         Sb2DQyyDMAothoRCE1vQP3lfDvXBwwNZuymQyTN+deTafnQe9swFJuOdBAPrgp2J2EHX
         69QpxC+EMBMCq+SdcXvjhHKdcBVPwzJGicuWNUfu24nrBmDwTfeFeeWxxtPwkYpaKEQQ
         m+NKzpc39WjC3InaHPihRFQryRfCSkLQ9BalKWElpj08z2RlUgYZXAmww7xHM/W9yONa
         8bY5R+i+355PxsR1O4KFqWxPTxV1Q8D1xK8SOpIhiBi10vUkgMqP7axsCTMFLkY9LtBB
         SkSw==
X-Forwarded-Encrypted: i=1; AJvYcCWrz+bph9GedRoJbFuNE2B/iLXrQvKBVqZLXi4/FXcGB5nzbLcio/W8Nbyu7CsMqXK1wWvZhCC98Le+dT4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwohG31wbD6UY2KQE8wOVFEKIRPbnZeZKjXmiSSCENDLaarwl0X
	4o5eg9zDPgbuV9Kht+FkrZqOeJg/idnUmathDAmd+II1BAcab3p6d81F2Fjf+/q1zwjsWuEjABq
	uoW0vO8PXi1x6HlsO1QkK10y1MJhO1K59EsmBbSoKLmg4dyQoEv2PgFEWZ6joL5rw9io=
X-Gm-Gg: ASbGncuag3vKCRUH7i98m2O1g2hczX10hCrwWYcxIUcWl3/RRfH8I4BRn8ttlhpGpDY
	QCP2IP//ZmHFVCs6bk1XEspX/bJgWRF7Jg9gDewAXSBcrovHuIFCjeSgxokB/2NGMUUhqDHim4w
	GomJi0enW63n1lEVNR6OFYlQyaIxNQYxZeee3u9sKski27GRl7RDmTDTr7AyeEzB4BRfPNBWAAb
	W0fHV27U3dtx3JT4RFM7ekuGbN0IBebUzsu7QjYSg9/Yg+5SpmPSOF9fmtIv+slBhBIHT5brvYv
	wlpoRxx0kek24K9wQcmDfQ5UyAr/SkqRI/rBlYjyu10ue1JJGtkRUS350CSyFRSyQ0tIEulOtOy
	oK7z9zflcJhrlMfAOGPwAxuBI77wdZ3/Y6jlZaUJLnriUdB7L9KdJIMXoIs/Z9ZE6PlE0cYEcEe
	Knpe9NDTP+o+9Cxd7+hcv33V+G/3c=
X-Received: by 2002:a05:600c:8b17:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-475c3fe35f4mr18215415e9.16.1761122276479;
        Wed, 22 Oct 2025 01:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZox5bLuD2Cm8JqdEWshafSicQuJ3K5TI0WpKQPM9/qTM/uKldxHeAV/RdhcTW+7Drr2Molg==
X-Received: by 2002:a05:600c:8b17:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-475c3fe35f4mr18214965e9.16.1761122276037;
        Wed, 22 Oct 2025 01:37:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a534sm37256955e9.6.2025.10.22.01.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:37:55 -0700 (PDT)
Message-ID: <2fa9f196-12e4-4c1a-a1f7-cfdded93cc94@redhat.com>
Date: Wed, 22 Oct 2025 10:37:53 +0200
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
Subject: Re: [PATCH v1 04/23] mm/balloon_compaction: centralize basic page
 migration handling
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
 <20251021125929.377194-5-david@redhat.com>
 <20251021164916-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251021164916-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vHSL2rrkpzrin9cJP4zbS-FgR4vijwnJTcaFWjLBiFU_1761122276
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21.10.25 22:50, Michael S. Tsirkin wrote:
> On Tue, Oct 21, 2025 at 02:59:09PM +0200, David Hildenbrand wrote:
>> Let's update the balloon page references, the balloon page list, the
>> BALLOON_MIGRATE counter and the isolated-pages counter in
>> balloon_page_migrate(), after letting the balloon->migratepage()
>> callback deal with the actual inflation+deflation.
>>
>> Note that we now perform the balloon list modifications outside of any
>> implementation-specific locks: which is fine, there is nothing special
>> about these page actions that the lock would be protecting.
>>
>> The old page is already no longer in the list (isolated) and the new page
>> is not yet in the list.
>>
>> Let's use -ENOENT to communicate the special "inflation of new page
>> failed after already deflating the old page" to balloon_page_migrate() so
>> it can handle it accordingly.
>>
>> While at it, rename balloon->b_dev_info to make it mach the other
> 
> match

Thanks!

-- 
Cheers

David / dhildenb


