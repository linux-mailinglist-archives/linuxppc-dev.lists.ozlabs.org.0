Return-Path: <linuxppc-dev+bounces-13145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AF0BFAF04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs2gL6Gcsz3bf8;
	Wed, 22 Oct 2025 19:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761122446;
	cv=none; b=FsvwnzC3afad/OpXUQGYwaz56H622XE8nB2AhvHe2VAGWSDySAdc30RbH6B0Rv4ThgSIwTwuGZnWKtHWfcteK6vd6e+ToLpHjjn1L+ft4PFF82Ig4J9dElLbCC6FXpjX9CTR7morjjBPyyr447toFrPWBvl5GHPIWD8QeiTtX4vrsARID+dMGeP4P5kKZuZ95Y2SnvKQDPkWI4k8h4vwbZvwsv4dUudzb4s8h4eyN+d6Vy0wVqdjFe8rDtpQXlXfbYw9/vE+4KfWSZNxyiBys2aJ2Ccn+cfk2mYMkYTmXJzAyrEpFHFeR2bCCFr4houAdFIQaBCyiXhGPkfsaNlCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761122446; c=relaxed/relaxed;
	bh=IyII8qs2AWA9eUNKWYj/GrkMP/2s9uE4zP2DrnDC69E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZErIav8VoCiHDFDCyXiZpyqJJJRakuyzCf3AHIK/ze/TSvsoGulSDpI50BQgg29ytQMoYPrpXjEbslrbOQ3V3tEBLp+m53UGQa9QTBOiUK6gzQ5yvGpzkJgmVf62VMQgN5s2Ka/jilYv1w33xagf6JPDpevWewPSXvkkre66c0JjT8ErA6jRk9Um50lbuwDtJCdtGRlLyhUoZf8HDobzipYSreZY9bQE7f7ryf7Nr4x86mox4WM40gLH+ghB3PLdG+qLtHjwALgd/QoFugtx6diEgnDo1qDLscnZg/BfjoPXORZ7i+qx/pYqZOMH3g6y55IhbeOW66aWdLS+KDUXKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UE+LCqRr; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UE+LCqRr; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UE+LCqRr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UE+LCqRr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs2gK6DJ1z30Pl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IyII8qs2AWA9eUNKWYj/GrkMP/2s9uE4zP2DrnDC69E=;
	b=UE+LCqRrpoJldId3xjqzDmpJ8YI+YChnbuFzsem2R6MXWkes9hAyhXD6Qeax/shau+dWxx
	DJ+QbacpDOO9Sqfqb2OxV9dPwonVbvhcixejX32Jxl9nOjAMjtQiWvd7Da2Vkxju6bZrO0
	ruURINO7C59u36tMfDEnds9uxJ0ax3c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761122443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IyII8qs2AWA9eUNKWYj/GrkMP/2s9uE4zP2DrnDC69E=;
	b=UE+LCqRrpoJldId3xjqzDmpJ8YI+YChnbuFzsem2R6MXWkes9hAyhXD6Qeax/shau+dWxx
	DJ+QbacpDOO9Sqfqb2OxV9dPwonVbvhcixejX32Jxl9nOjAMjtQiWvd7Da2Vkxju6bZrO0
	ruURINO7C59u36tMfDEnds9uxJ0ax3c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-PG8K48FNOJCpBYJfAl6ZMA-1; Wed, 22 Oct 2025 04:40:41 -0400
X-MC-Unique: PG8K48FNOJCpBYJfAl6ZMA-1
X-Mimecast-MFC-AGG-ID: PG8K48FNOJCpBYJfAl6ZMA_1761122440
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-472ce95ed1dso25000425e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 01:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122440; x=1761727240;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyII8qs2AWA9eUNKWYj/GrkMP/2s9uE4zP2DrnDC69E=;
        b=KI0MSCEIqVSt4ySB3zFIyMFe39trMdf1AOjtX2xShk2c158bHyCwXvTWOL68ezUKCu
         41OxXiTrYMF6i5xprdCv3VzkDTN46GkoM27dzuJr8E8ARep5/ccHSnmFoeCOah9flmMs
         6UWthyuSh5EL/Wll4B2Cm6cTE+oeqVwP6KA/UjmDDKJblZ4YKn+ptY/X4wwCayY5r4Hg
         Ph8+qAC8cmqls8QgB7GWxMUNfs2q4VUoYuNgzbsquTvD2pXlIDSAKxzkl3iZZ1zewLdk
         khP3WDZJ8KoxREmmSxtF4JFq2wjebgcmdVYjcvRzovNMxiDosnqb1xQ7vEOTWLHYFIYt
         9wsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7MYbc7p0iRJlHreZIUIvxKQH942KhGgACwemR32nl3BXBnIwpxAkSuq3vtlmwXEjDdjEj04skb8TTV6M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzB87p3lER9DvVxjpY10x4glaNcMkcqHhJhe0cRoU3D9f4sdSAM
	p8RusHM+WUmBp3tDc2vwEsMNMM+PcVWX2S4kCLxK7HR9c7dhoWz7yEvia8E7roMLO5DPfDn3MVe
	Md8GBfoiftyF92CZSwXN2CLLW023wc0Azlkq9gURyenbQ/5PLe+BQqFDDLoghyH551RS3XjQJJ7
	Y=
X-Gm-Gg: ASbGncs7iR8t5qWQrpibNOQ7XnXU/w7SpRNJSBJbhYPwKp7ZEs0JWzWzLVK7yTU7Dom
	H80OGHUUJGwK2h2WgpwCWMeHdvjHN1DmA3+Hn1SnbsG4tDj8/LPBzTY/QcDzaGvrjyrP7iY3OYF
	Sdk+K7KBXbXfv0dQSX128Boz8Q3gdQzUM8sx9n3NnX6tgzvLSmHI0B2gpzo3XuXlSn52rXQgEMa
	tJURgKi6kEIlOYYzAS+dTgpEndTME9UfBol50gBd0BVJqKRvn/1XCoVWuy3jquQ9nfEe8MmUia5
	5AoRxcnv94B0nYcmSawlaljeWa+m1IkwjoH0ZHbqKuTG2cHDFkjD5v8fb2qH5WGnXMSUqTR32Yk
	+tdaCuDSX9vLdMnrVKkd/Zf6wanuAIElFuFI+1S07ODfdcOu1J0oKVqjiiRHIQYhtAnwHIlXK5W
	VFEzvA2vg2AyVwDm98BhiJxBk8dQw=
X-Received: by 2002:a05:600c:458b:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-4711791cb4cmr174181705e9.32.1761122439915;
        Wed, 22 Oct 2025 01:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoS2FDFL4u1V3mpEYxjOqKBNemC1wS2eap0hBA+VfSeySp1O0SWfSuGs5C/jtt/9Qw6UCYsw==
X-Received: by 2002:a05:600c:458b:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-4711791cb4cmr174181335e9.32.1761122439450;
        Wed, 22 Oct 2025 01:40:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b3esm31744665e9.13.2025.10.22.01.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:40:38 -0700 (PDT)
Message-ID: <99ce6f94-9b66-4d16-81de-8dd753a6d606@redhat.com>
Date: Wed, 22 Oct 2025 10:40:36 +0200
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
Subject: Re: [PATCH v1 06/23] vmw_balloon: stop using the balloon_dev_info
 lock
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
 <20251021125929.377194-7-david@redhat.com>
 <20251021165626-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251021165626-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XbsZyL6U1O_e116Httb8gbvxcN4hdAlaEzYEijCNUOk_1761122440
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 21.10.25 22:57, Michael S. Tsirkin wrote:
> On Tue, Oct 21, 2025 at 02:59:11PM +0200, David Hildenbrand wrote:
>> Let's not piggy-back on the existing lock and use a separate lock for the
>> huge page list.
> 
> which is fine but it is worth documenting that we are also
> no longer disabling interrupts while taking this lock.

Indeed, I'll add

"Now that we use a separate lock, there is no need to disable 
interrupts, so use the non-irqsave variants."

-- 
Cheers

David / dhildenb


