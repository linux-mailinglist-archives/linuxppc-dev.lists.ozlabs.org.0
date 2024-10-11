Return-Path: <linuxppc-dev+bounces-2104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C699A0F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:13:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ2WG6r43z3btj;
	Fri, 11 Oct 2024 21:12:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728641578;
	cv=none; b=Y56TkJH7vXDj9+I2yL4dqTUapm6ieJtVZdvFkmPCfwrEI/SEZgWGrKWFxqz5V89fSOGtTf8O/mn3i+4U0ASfTYLECTEAzuRZDs0DM7/wKpnQRpgHloi2dbKzgCa+XBH32Q2pKR9V2zCJLtCfr039djwfkzYXQI3zLcC/u0gm8UfMJo7MnT6HZ6ELuAZA7yBFxDVVbSothMNjz2hmE3JW607VW2xPsiAiGDWNCU0Bld+NJ0TXY32dA5t2ciitb/nMP3JYPHVwOIhKSMOYNRLRD15dMFWA/uzF9+P50ICueZ3np7aJSfLu2HLdzmh+EcLJdpZgmtfrLQ9MxtXVJGRngg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728641578; c=relaxed/relaxed;
	bh=WQWsLiswUAEolJ5Zq+g89OXnK9lDNhB/HZWV87yKp0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5/s8khQl69guuU5NouQN32+rQkyepxpbNH+qdgkQ6dGSH7xr6N07/MP0hQrvH2FyEf6lGQpo7qN2f66wY1hRVvPLbbpYtqemfRkzWSCPhPKXwgclsqiA/IG76WinbxoeI+5XKcJYI7rgFotMdeqBzB960yC6NRK8g9JvLT3gvGohsLaKGodkWLkIUu5yUl6ecxHXPvC/lBtoxsCZDle15f8CLIbeZKQ3Y6fy/NZ8WbfJH08ZmvU+qve8iAMqJISOhL0LA4teQPYpuOFQnYEmB/ojSIxm9PpKDt12ETSE8dLGEjcL2CGakEvA4hGcOLSKmrG7bi1a/tfxZCJVfFOZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dXdq8yye; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dXdq8yye; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dXdq8yye;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dXdq8yye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ2WF68RLz3bg4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:12:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728641573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WQWsLiswUAEolJ5Zq+g89OXnK9lDNhB/HZWV87yKp0E=;
	b=dXdq8yye7vvpG751rRYOg+ZJdILsjyarBxQMbb6w2/DuE7XEwRpkpPpTdGreGxATYXEtp2
	s9HEqjFXltKpknpeq1r7lMijH/2Nt1gGdIUA2NGwNYgaFRBo96KyZUTkcXP2gf97bonDYH
	1PHFhue9ylr9U/5SPWtm7vfLFTF23PU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728641573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WQWsLiswUAEolJ5Zq+g89OXnK9lDNhB/HZWV87yKp0E=;
	b=dXdq8yye7vvpG751rRYOg+ZJdILsjyarBxQMbb6w2/DuE7XEwRpkpPpTdGreGxATYXEtp2
	s9HEqjFXltKpknpeq1r7lMijH/2Nt1gGdIUA2NGwNYgaFRBo96KyZUTkcXP2gf97bonDYH
	1PHFhue9ylr9U/5SPWtm7vfLFTF23PU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-l1waYH7UOJGzDjTFvIYgJQ-1; Fri, 11 Oct 2024 06:12:51 -0400
X-MC-Unique: l1waYH7UOJGzDjTFvIYgJQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2fae60b3ea9so16208461fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 03:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641570; x=1729246370;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQWsLiswUAEolJ5Zq+g89OXnK9lDNhB/HZWV87yKp0E=;
        b=lMS2MYSZmEPLGnRYUR44BnuCyR6Rbl6CWL7yKTaoJnfxJR3eEu8miHQ8B2HmH6JqUV
         WMeUDjKrSSJbNL6YzenlWS1r2C7l0EzKZ/R+Tq7iDkDf5HQFcq/XF/ZjrvB+ZTEu32NR
         iJQjDpR3+L8l31HFJxCq5L0sUhhGShYKUydn1/AWfCzQT/bthbxu6Ocaf1ptdbFbTlZJ
         KE9EbryUJkoSb1WB9/8ylOIE4Ye1wBdpkjqvMaSwY9aRsJPqtY1fj4EgMMlqRuOqIp7m
         WQGd69D8tI+HBb4FCIuzSHg3k4RwjK5mABVfxfdBlUQfEeuHjNS9EtWI0vDfmJssv7eW
         JESQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk63rC/6/oOK6f0SQhr7V7FdnuOoJekbua9jMfF0PBEMqt/QZTqV+pZq8FO2V734ENKdjgKOuoGyHEzj8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXJF1e/i7fai/eKhayS1FVlG2YfCumGP0bUPlu+M7Qk0z9Aubn
	aJQ6OALVZSCbxGLIyj0RuNrw+l2Ucx0dd2Py4PQSfxvf0PDBMJZD/ztk8BLIE9kIKsZSQ+yPN2B
	NTriS21qgt7ePH4RMVu8hDoeKzgpZtkVYuKnhSlvtsB5FLVJexTPzK6TGvoiJz6M=
X-Received: by 2002:a05:6512:12d4:b0:539:a3cd:97ca with SMTP id 2adb3069b0e04-539da50f0c9mr1054403e87.36.1728641570297;
        Fri, 11 Oct 2024 03:12:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN+eYs3u1dWQ+McbGmavTYymimZPrm22yBmTSLd/38O6XNRnZ0tYqOCLDaL1+Rkdsb4vOoxw==
X-Received: by 2002:a05:6512:12d4:b0:539:a3cd:97ca with SMTP id 2adb3069b0e04-539da50f0c9mr1054357e87.36.1728641569770;
        Fri, 11 Oct 2024 03:12:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c749:9100:c078:eec6:f2f4:dd3b? (p200300cbc7499100c078eec6f2f4dd3b.dip0.t-ipconnect.de. [2003:cb:c749:9100:c078:eec6:f2f4:dd3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d7934sm38293995e9.3.2024.10.11.03.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 03:12:49 -0700 (PDT)
Message-ID: <e894f6f2-d93f-4787-af40-7f021a40b156@redhat.com>
Date: Fri, 11 Oct 2024 12:12:48 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/4] cma: Enforce non-zero pageblock_order during
 cma_init_reserved_mem()
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
 <8579f887412720bd6f2fbce513c1c9904772ead4.1728585512.git.ritesh.list@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8579f887412720bd6f2fbce513c1c9904772ead4.1728585512.git.ritesh.list@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11.10.24 09:23, Ritesh Harjani (IBM) wrote:
> cma_init_reserved_mem() checks base and size alignment with
> CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
> early boot when pageblock_order is 0. That means if base and size does
> not have pageblock_order alignment, it can cause functional failures
> during cma activate area.
> 
> So let's enforce pageblock_order to be non-zero during
> cma_init_reserved_mem().
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   mm/cma.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 3e9724716bad..36d753e7a0bf 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -182,6 +182,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
>   	if (!size || !memblock_is_region_reserved(base, size))
>   		return -EINVAL;
>   
> +	/*
> +	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
> +	 * needs pageblock_order to be initialized. Let's enforce it.
> +	 */
> +	if (!pageblock_order) {
> +		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
> +		return -EINVAL;
> +	}
> +
>   	/* ensure minimal alignment required by mm core */
>   	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
>   		return -EINVAL;


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


