Return-Path: <linuxppc-dev+bounces-12917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4AEBDE7EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 14:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmrF4190lz3dBp;
	Wed, 15 Oct 2025 23:36:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760531816;
	cv=none; b=YdYsU3hdX2A9dwQqpiL5QDb1Pi/ewnuEyDiO+CoJX5Tm0lMdIH2bwHRgFPHMzbYOVkH6y81lueEB8sk6V7HtQIQvKsdV8HE2y2rdqAJr4T3Pnpzus+xEQvCPYD1gUpKlyNCJY2HUTokjoy82/ezvXU4+fke+iVvtPjpMkp4Cig4SnfFKH1ojP1+Dbrb5pksJ2TP0Tyqxc62AYYS0+4zKy4+8eEWZdUvQAbVYJrXGMjgKl5EpzhtJOaO1yCTlWjas6ySK7n6+lWustQKyR/zRCnVhVedwlQpIAP3ANXrf4q+/vHvdlfFqExby+9jDSqP4jK5CohxVuu4ywjKAnCuutA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760531816; c=relaxed/relaxed;
	bh=Ooy0+P+qSQZ9PBAsL6C2FQjAzQTmePqNdX02r+q1V8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjYH0JmMAcdkUDMquY8cE/UTCGCwdVlkQ/rzOoUHh7Gx1wE2ZbmijFdbSfzclquQp1gN0qcVnhJF4/Gn0L+Ci4pmpXKFz3Osmgu0mKLLUXyfv5zBO9rvrvWyowLfT0/h16XczyVzRVlMCI9v0/hTdRoKnveTG5zeX6laoWYGnynCwwoALeJeCyXX29ONhe4EhPvWwolSc68WMAFZ+8qRBrRVlbRzKLIM7b48WPIr5/J6iGo0TEnpKK6lBocB/xI9Qn/HPaAQbF34ovK6okI9c2qi4cnhLmGbgGe0MlMj9L890vyfHB7ONEkKmjbNEWgWDoD+OIuTxt2vQr+hTT/Qiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcg/wW4D; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcg/wW4D; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcg/wW4D;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bcg/wW4D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmrF26Wkmz3dBb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 23:36:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760531800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ooy0+P+qSQZ9PBAsL6C2FQjAzQTmePqNdX02r+q1V8o=;
	b=bcg/wW4D4WYREviPnPbGaDMGVJyVK4QZX4O6RT99er1gCcR5o/dR3elilC9PJNKfIQ1t+i
	8DIg/MZLgLOr/siM5KNYhSP6NFEhUSlOi7MV5qCtjgwX9x3lmGgl4PAdrgUy+l1CeL7rpr
	/zwST2DslLZ2zSp6ykaFnmMnwbKrlZU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760531800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ooy0+P+qSQZ9PBAsL6C2FQjAzQTmePqNdX02r+q1V8o=;
	b=bcg/wW4D4WYREviPnPbGaDMGVJyVK4QZX4O6RT99er1gCcR5o/dR3elilC9PJNKfIQ1t+i
	8DIg/MZLgLOr/siM5KNYhSP6NFEhUSlOi7MV5qCtjgwX9x3lmGgl4PAdrgUy+l1CeL7rpr
	/zwST2DslLZ2zSp6ykaFnmMnwbKrlZU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-EQmjAtaONwqooS0NJuv7lg-1; Wed, 15 Oct 2025 08:36:34 -0400
X-MC-Unique: EQmjAtaONwqooS0NJuv7lg-1
X-Mimecast-MFC-AGG-ID: EQmjAtaONwqooS0NJuv7lg_1760531790
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ee888281c3so1616619f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 05:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531790; x=1761136590;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ooy0+P+qSQZ9PBAsL6C2FQjAzQTmePqNdX02r+q1V8o=;
        b=sg0AW5qGAb+pRubS4DaE3JQp/BZTyGOsH/rC/+soXCSx9Vqp1fB8aigIgQYpaU8WwX
         ni/gpuiXaD9m/lx9u96Fk2+hrHZnWFAhD9KbB+tfaJHcXJ7hxs5ZyQ5ep0gnDJ4wzQjF
         1WnViC/MGnw5RY+xr1jCZuwg0uqC7G7LpeicGMBGpOjX3QF1go2FByyycu+UOA44I+E4
         TqR8SWjGP3sn+lA9kl9IINrq/DrsSCBb03TDnZHMGRRuaprstaRx4t1yY7LaCqNOTxjo
         aF5XiFPUz+mlWM+llN1o6TQwnr/3MwJiOHr0eXG+R010+ew6vkHx/tr4tYwJq2mTzG4H
         VqLw==
X-Forwarded-Encrypted: i=1; AJvYcCWKy1DfQExtRzpo6buV/Jdt0YVEIV7VRewD752NGEVUpD16YILfnyFRhVkDbhWVDE9xW7hJPlVFZEZcFug=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywx6OzxhWDzHnW+YACUggramRY9pdHxXMg1IxiPcEWdxnA1QGDK
	1FgFeZbqAQn4XURLwT7aVX8KS0OHVP+uz/lxWuyHXJ2e9wqGAX2tj9Bh9seyVi8gMOgt6E5HNxR
	ViBSwLNr90QtozQKTABxzVEZ3u7Tdm2IFFaE/YQ7rLIHjnCjPG436+5547/VNx9Da7TA=
X-Gm-Gg: ASbGnct+Qt2k37TCbZjQwwQUv71VNGySDCWJnQ2h3w93x85Lli8JA87H4IGXnCD1AR5
	EIbBU8whKsEYP7oaqUV8amhVdy0N8Z8amNEx0YmZyct05+JddSV8oD31Bnzoh2nmolaTh77ya3C
	AoRv5+V+sqZjIk4h8V81Gf/2MDbbWcS7HXqIl2aCK3jG4I1rI28cHgmNYOIWluRuF++QrBOE4Bn
	jZYgCCwW/X3xMvxKydAvf0UP2bxMbfwk6oZKE9oJmmT6MSh+MkBOmQgaz9q0zsgiPqAxO5FwvqI
	EFhHFE8If027GtvkWhYbH1lLgZnZ2V+72QmNRvDFEhZt+U3drHdnf5ECVZRN+Eo=
X-Received: by 2002:a05:600c:46cf:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-46fa9b02cebmr189549125e9.27.1760531790265;
        Wed, 15 Oct 2025 05:36:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQEv7n4XLXJaSEJX/SITQ4VMcrjiffoRvPhoDRdJduQpEbyWpYgYfRJYQt1Ld4+uLtEwQ9Ow==
X-Received: by 2002:a05:600c:46cf:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-46fa9b02cebmr189548825e9.27.1760531789835;
        Wed, 15 Oct 2025 05:36:29 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426f2f72e18sm7689658f8f.0.2025.10.15.05.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:36:29 -0700 (PDT)
Message-ID: <ed99ffc0-4a70-416d-9bf3-58c4a3ebe566@redhat.com>
Date: Wed, 15 Oct 2025 14:36:28 +0200
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
Subject: Re: [PATCH v2 1/2] drivers/base/node: Fold register_node() into
 register_one_node()
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Jiang <dave.jiang@intel.com>
References: <cover.1760097207.git.donettom@linux.ibm.com>
 <910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a6hBVM1cE0H0Y2LGfsJHPMZt8rH3yOGb7hgpQv4dv4o_1760531790
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 14.10.25 17:39, Donet Tom wrote:
> The function register_node() is only called from register_one_node().
> This patch folds register_node() into its only caller and renames
> register_one_node() to register_node().
> 
> This reduces unnecessary indirection and simplifies the code structure.
> No functional changes are introduced.
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
[...]

>   /**
>    * unregister_node - unregister a node device
>    * @node: node going away
> @@ -907,7 +880,13 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
>   }
>   #endif /* CONFIG_MEMORY_HOTPLUG */
>   
> -int register_one_node(int nid)
> +/**
> + * register_node - Initialize and register the node device.
> + * @nid - Node number to use when creating the device.
>

I assume that should be "@nid: ..." to silence the warning.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


