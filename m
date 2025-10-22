Return-Path: <linuxppc-dev+bounces-13147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65FBFAF4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs2ky22f8z3bfY;
	Wed, 22 Oct 2025 19:43:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761122634;
	cv=none; b=luC1i6eWHAu29l2wJxm+ylHvhhXHZdMr6WwIRAOu4NkdyYsQhwlKz26QRsS5Cjo4JsddSqY6gxHvhiAB/bYvjl3mesPJZ368b+BlenlqoUUm64rsyYCnvYc3aVFw/orQGhReyaBVCS5jld5756tVYWuB3vs86Z47nKfOb0utnoQgjBwtGgFSNdSM5g/Rjg+e0FbUxrx1gM/0XXUK2btyfAIctFStYGD1meuazDorkXaq+Qe3ub0t/Av2Vy+2L+A+IwnxirV+Bau0qLts91k7+w8VclAT5eSeEQ9CeQg1S4Z0w8asyMTMy9tYcXlG03SRomQJ7rLPzAvTT/3fHHxwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761122634; c=relaxed/relaxed;
	bh=jkHMky5mCobEjmAGe9TQAKstGmetuf8oWgBGBX4vP2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XvYKHbKiPUXurxKI1+okQ1Rx2V8me9e8xaHRSnypQzBeV1zfVHz962PBPl2wuBqC2/JvTf2j5mgZfg3Y0BYTBoZ1IiOiX6qxjGMOECzpZ//Td+GhV/b1hRA0BhbujjF+QXXCiCizn6ry+ua59spxq56W3g1nNdIYYx9b7/FOU20YVDkyRH4vMrnHUluXVmcfno9iNnnHwN3MoGZWx0k+c/YOOTCX/lOzPwvH52Jm2VD0C/hwL8ARbz6wlbWnvdkurgP9BD+jLKZjumDUcFwkH8lnaCcYqJYzLSa1oyq8aKCjg4pYRIyR44rsIyrnk6rEDUfvvUJJNg5LJMcY2CxVNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H/niiM1Z; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrAQH183; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H/niiM1Z;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrAQH183;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs2kx3KtQz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:43:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jkHMky5mCobEjmAGe9TQAKstGmetuf8oWgBGBX4vP2s=;
	b=H/niiM1ZYtr2S+9WmRrcF46HDQfkHsy8/yrHnRJv/2TKhLJ0X8uI3YID9tQbee74pY+9wN
	URlvDypR2oHnCN1PLorZ25wzjXtDGftplHM1p1A9LhxIxQC96hCbsxSE1yEIFGoPn0Ip+T
	1Pf23WJgjsNffshc7ARHgghWNcHJCmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jkHMky5mCobEjmAGe9TQAKstGmetuf8oWgBGBX4vP2s=;
	b=JrAQH183NjLCIb5Ts9MYwT8ncF8obJpGt7GZdY9tiIE0DtWORUw6bdRxAlrd/NLEhm0uw8
	9ociWoQz6Z1h4iDP1KvjB86uZumEtn9PglJTfUef3EbRsmff1pV6N6sIaQ9V83PjdKDvNv
	+TJPbn/yWOKIYU6gIH1MKSNdIOkiSI4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-8R8tw0bFPXaIdlvewkYkfA-1; Wed, 22 Oct 2025 04:43:49 -0400
X-MC-Unique: 8R8tw0bFPXaIdlvewkYkfA-1
X-Mimecast-MFC-AGG-ID: 8R8tw0bFPXaIdlvewkYkfA_1761122628
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-427015f63faso3297046f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 01:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122628; x=1761727428;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkHMky5mCobEjmAGe9TQAKstGmetuf8oWgBGBX4vP2s=;
        b=EJ44rWMvu/71RLXgZx49EHaqZB2vq2293ENi8ATP8srR7GJEaTYs7ZBm0+NlX0vMPt
         1TeAXHcksQnoSap0fszAkyvPl/Sdq5C4045MskRj0+kHBgkU+6/Y18hJ8jqjdb8ws2K2
         /SRrKUXUOnxZekrbMMlukiv/5Tqu+Vfn13R9PIuv2GIO3ThsnAlN76LLLw8GySc0Pz3G
         DmzN1oHnr+49kldwzME0Avy/FJmwKxCy2ENQWI1pAEfG+hCuAEAQjL6vuWth6BdzQZFe
         RnPE//ir/ycuXVpAZL+arxrovBsTk8tUSD9fNS22FJcTiF6xWUrQmEl275pfZ/y1JQg9
         1WsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEabXDN61sT+P09VauyJsxhGlCp2KQXjoBQV4hCTstyL31yGgZUthMkbvrQbrsc1tbd+f4q1BOzY4mCSQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAmwEFZyhcqbr9jNnjWwmTwZQCZ7H77WiFlmf6ZJRE5L7BRf6M
	MuH1WYQ7l9GwUsFYvJkRHGFzzG8LyR/u+U62CTD/vzzDFXbsEGzBficS1BvZ9BobzkbMgghxg8a
	Fm5YcwBKyj+uR28qWLxX5Y9Fke8sutqGiD5XynptqQi+r1HZN51CAQRNOSZ1O9ye9o7E=
X-Gm-Gg: ASbGnctCx6Gu1HavdKChY9ZMVCzYnA4fRJRYf7d3UjRy+//zS+e2OnTfyr1D5Qdwq98
	NHKnMGNxUkccYK/Kg6rV1NoZawTXF8CWrR0ZsJxvrhSN/wnf7WUWO2bva8arIg6zjMLARUUQgSk
	BTix70TTAutzA8ajl65Z+dBRmt9esYP+loxNjK132qZf6xL5tM8pUbHojwZO7k1Ckjd/+KEElmt
	AOpQ7lWUqp9skzI666O86+qCFXK1RVDfnD7gVQ7Kc64mBhE+NgUdF3ZDaKEjHkApFuJvA+E6DQX
	jmFlTbBZWMYNRZN4RtpUVa9KM3TmSxBQXbV/JiUDfEwU6ZLyhf4CU8eb5N9nCrp9+FsejPInFEY
	1yDs8jgy5wYiofQjGVLHkg37A0ulGj3KSa8lhFjjqBVc3kK77SHENNRnQcEEuEuV/EJo+72ZBDv
	kGSxTKiXWehGzXpJ7+inFcge+qmA8=
X-Received: by 2002:a05:6000:25c5:b0:428:55c3:ced7 with SMTP id ffacd0b85a97d-42855c3d35amr870755f8f.28.1761122628112;
        Wed, 22 Oct 2025 01:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwoT3C4h+2nYRtAEAp4gukXLbzQesuywB6jEq9IZ/b7/4k/4nUiirxc9OucZncsYgrM1Y8ag==
X-Received: by 2002:a05:6000:25c5:b0:428:55c3:ced7 with SMTP id ffacd0b85a97d-42855c3d35amr870716f8f.28.1761122627657;
        Wed, 22 Oct 2025 01:43:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-428566a7906sm1313560f8f.38.2025.10.22.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:43:47 -0700 (PDT)
Message-ID: <4b280f08-7ed3-416e-8f8a-d30cf0b34c01@redhat.com>
Date: Wed, 22 Oct 2025 10:43:45 +0200
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
Subject: Re: [PATCH v1 11/23] drivers/virtio/virtio_balloon: stop using
 balloon_page_push/pop()
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
 <20251021125929.377194-12-david@redhat.com>
 <20251021165854-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251021165854-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SVz606fjLCLWnDSda1Gc3nL01BV-wlv4SH5iUCFG15g_1761122628
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21.10.25 22:59, Michael S. Tsirkin wrote:
> On Tue, Oct 21, 2025 at 02:59:16PM +0200, David Hildenbrand wrote:
>> Let's stop using these function
> 
> these functions

Fixed, thanks!

-- 
Cheers

David / dhildenb


