Return-Path: <linuxppc-dev+bounces-12573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F71B9E24C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 10:55:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXSGk1Zw3z301N;
	Thu, 25 Sep 2025 18:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758790526;
	cv=none; b=VPpFNTJQoNOJZG0RblCTz7JE0MKnYq517Tg0L1prVMSlBRVXYmRcJ71K8pMEuZtNLucTIVBmhQ8jKrJk+usWEU+QknAo5NUMxEyATrB5xAFjbOuq3+ZR8o7RLd2f5/kCZcHJq4S47XI23R6k73YlYng/tfxcLUahN+Bm/p9ZG5EQezyMw20uAZwXqrmAZS5BgauEbK30y89kfZvmMTzi9Ah17GRw6mCZLCSXp2/b6jNZl7uFyn2U4uCCTsWvbj9hw9izTDqPgBHYs1SMWeSONzrjeCn3MCeuk/BWPeMXPqBdn1J/RYfs2406rOKzqpVE7GlbdhByrC2b5UnRRJhjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758790526; c=relaxed/relaxed;
	bh=vIdozAElu728Q2YAT29hpoWcoxXkb/so7CcmQuDvfV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4MmMsR+c6WDowm9o1r+brZZ/MMFHaTcaSgsIOfWS829bZUwygzxTdrJoMticF5xSwzuVoMl/GXymmGKkERHTZeUbehnqa7f1vgR1zqA8jqQQNl2WTtF9iTgjdXdwIi0d51eU7Zk9ZNjGJmLJTTQe7RFrey6PgVlmNIJ4dFMOrxdt7yNAfVBYqza/1WE6tMY5bhocGRBfttWGwJne0KZ6UId+A3Q/xqjclW1RWWtY2n6OCC4bGfDWIspfS7ZM68QqGUFs+G77+xlKIrHRrlGHrLAl76nWnq0Tkx/9V3DeRcIpbiDwHNn5TuESP6gKJFmhc6Lc0ZZxfVJwiTD4JgmrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0HDD/DB; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0HDD/DB; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0HDD/DB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0HDD/DB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXSGj2SdZz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 18:55:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758790522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vIdozAElu728Q2YAT29hpoWcoxXkb/so7CcmQuDvfV0=;
	b=I0HDD/DBxhkpzL6EDuWfH0B/XIlsg9VfS12ZvmoJbRzu3/oMuShSTk/iTmVRT2cgLzC3jl
	Z0m+sz3Twt+QuVXBo+M6YTsxbh4cfMfwemm6bF00RT4GMXaXceXAehF4eN80umWXU6V2EO
	kyKsPC/jI4rD3xdqs+Xvi3nzdK8Dv74=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758790522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vIdozAElu728Q2YAT29hpoWcoxXkb/so7CcmQuDvfV0=;
	b=I0HDD/DBxhkpzL6EDuWfH0B/XIlsg9VfS12ZvmoJbRzu3/oMuShSTk/iTmVRT2cgLzC3jl
	Z0m+sz3Twt+QuVXBo+M6YTsxbh4cfMfwemm6bF00RT4GMXaXceXAehF4eN80umWXU6V2EO
	kyKsPC/jI4rD3xdqs+Xvi3nzdK8Dv74=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-kb9GMmzfNpaYXkiFeARz6g-1; Thu, 25 Sep 2025 04:55:19 -0400
X-MC-Unique: kb9GMmzfNpaYXkiFeARz6g-1
X-Mimecast-MFC-AGG-ID: kb9GMmzfNpaYXkiFeARz6g_1758790518
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46da436df64so8071905e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 01:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790518; x=1759395318;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIdozAElu728Q2YAT29hpoWcoxXkb/so7CcmQuDvfV0=;
        b=tfQd3TYkEIqrskCNq/OUw9qj+mx7idTR4htHdYnsNXo6vHNVNiPZagR4jxFprvBTmD
         Gz1AwOJGxsvEB7PuEIdYFVNbyT+l1Cty7DGRnfHV6S8YAWjf9Uo53xaR0uJ4IGRGDmuf
         h5QXc8AS/pJRbk05g6I3vpKA3JY0iaX/3WSjFUsezL6uEuHtMMRQKVKUjMJBEU+bIPF2
         S6h6zoBtxHXAscLomtmGToyiKfB5NMwIZNrreOKGH8rsw2kXWTaSknBNLzIFa85k1mM9
         xEoor3Z/YSjqyVzAL9+YIKW2lxLU8thmR1zTDgfhvUOTWlmvW3pxaAlkMqCQ8ggsm6M6
         A54Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5PMlB6HIw69V3RCIDJmuz6noNlsokhHCbWUhMUYmCp/rUrZ1qwtbxdXZqdFLjhIbfLQRpy+HoHrWCktU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYtsi3YHSQVPBUoAeOY2OdfeCkQ6FgI6/qhXYmqsTqxFjMvJf1
	AR3oqb343WwsH9tmYq7+zFvmKp3wazVGXoJyqbO3N90orqKdSO6bk4nN1iNKTgv/BR7+s5pkhjh
	ordwyGM7gUUtJD7WGWb0KnvVLNxQXQVdaVzVR0BUT/E7jIxXUjiHlG1cexQqmK9ST3hw=
X-Gm-Gg: ASbGncvcCsDXtC9588tCr7vIlTY1QeTuhfw3i10EF1JiJaSeIKitLZdXZoTxk+TQzJQ
	UI8ADHJbAQj/KKhKZI0wn9ZE8u+PzLKgB6l+evC52LtQ8wEjgxT/KM3dVLGK+feYkd3CvP4mwrB
	pX69KwJ4jFznE8BBlpFU9REdHhkvhI18zU9s+CYZy4Wqlym95WqERX8Z7OY84VIkzc0WgRyIooY
	QxtOdjNOEWdhaRhYeXmvqwhDKhvoVaia36zCeWwB9MVAAS9VUbjonWJnszE2TGjOQj0/ANtOVJ2
	rfKdKlFijDzz7XhFJXeq2hoaQs+2WNjnoQMlUAM58n8ckqIIq3oGJqGK3h/KBoQ/cnyrHVbxl2I
	AX6Bn0xe+P3LbgqSpYxGHm/OI5B0HwiMylwokbPI7HkIFqxChcKM5g/iafuxwaM2AnDAV
X-Received: by 2002:a05:600c:1ca5:b0:46e:2637:d182 with SMTP id 5b1f17b1804b1-46e32a08feamr31537695e9.28.1758790518240;
        Thu, 25 Sep 2025 01:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEum28AGUsf/Leenhf3W6Y9umKKEHuPguoH/ZgJbvMiqBUf3p8uOrHXnJzc2Xma2XLm2+kAOQ==
X-Received: by 2002:a05:600c:1ca5:b0:46e:2637:d182 with SMTP id 5b1f17b1804b1-46e32a08feamr31537295e9.28.1758790517769;
        Thu, 25 Sep 2025 01:55:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08? (p200300d82f3ff800c1015c9f3bc93d08.dip0.t-ipconnect.de. [2003:d8:2f3f:f800:c101:5c9f:3bc9:3d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31ea3sm66391125e9.12.2025.09.25.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:55:17 -0700 (PDT)
Message-ID: <f93d4271-b601-4fb5-8d95-2e1caa7efe5f@redhat.com>
Date: Thu, 25 Sep 2025 10:55:15 +0200
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
Subject: Re: [PATCH 2/2] drivers/base/node: merge unregister_one_node() and
 unregister_node() to a single function.
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>
References: <cover.1758736423.git.donettom@linux.ibm.com>
 <c99d97e253378455f1b3b7bec5b0c830d4e73074.1758736423.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <c99d97e253378455f1b3b7bec5b0c830d4e73074.1758736423.git.donettom@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: biloc6OvqjD4ULAQJMiPNFRu-HLyUc1DhF1-zLUhCVQ_1758790518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24.09.25 20:40, Donet Tom wrote:
> unregister_one_node() and unregister_node() are small functions.
> This patch merges them into a single function named unregister_node()
> to improve code readability.
> 
> No functional changes are introduced.
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---

LGTM with the description adjusted and "extern" dropped

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


