Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB97620A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 19:53:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gc7eZf6q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gc7eZf6q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Pm258Nwz3cX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 03:53:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gc7eZf6q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gc7eZf6q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Pl52JTwz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 03:53:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690307581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhsIKhJOMjLclgZb1QtIPzHXmM7gsIrhFZSVOnrOq6E=;
	b=Gc7eZf6qEciNbhT2r4AGoPVHEjlqRo8ISmcGoqjQrREer22IXDTAcdhkyCCxTRaIjH92gv
	ATFEgpzqOrksOWvsv18t9zixiAWwflv202yBeLmaRfHDmYCX+QsFYliefea6SWUjZCjf6Y
	/MMpUymaJkdW+usBioXJpV5JAj5IkMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690307581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhsIKhJOMjLclgZb1QtIPzHXmM7gsIrhFZSVOnrOq6E=;
	b=Gc7eZf6qEciNbhT2r4AGoPVHEjlqRo8ISmcGoqjQrREer22IXDTAcdhkyCCxTRaIjH92gv
	ATFEgpzqOrksOWvsv18t9zixiAWwflv202yBeLmaRfHDmYCX+QsFYliefea6SWUjZCjf6Y
	/MMpUymaJkdW+usBioXJpV5JAj5IkMs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-bp32rc-uN82aEtJWlhuL6Q-1; Tue, 25 Jul 2023 13:52:59 -0400
X-MC-Unique: bp32rc-uN82aEtJWlhuL6Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fc07d4c2f4so35047105e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 10:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690307579; x=1690912379;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhsIKhJOMjLclgZb1QtIPzHXmM7gsIrhFZSVOnrOq6E=;
        b=ALSjC3m8NiXl9M7V3isHij8Ihn9DsGiPAJ7Cbe86L+EGfCv7mSHpHbltmRiOxiLg77
         4m0ZeHrGdWjVYchWS87FQeYigxxpVi6TW+r3ZWDPKfJsL7u0hOauHbC2UEtQQSG9zlYh
         tPCvrjMTolJxSpTpPaD1U+edSsRI8PQh2BZ7ZY33rqcPsL5gUaX0fT+TGPBPiGsdE+h9
         0zQAywp08ARYDTSEiGjwxdIWUC+34kEmg9dCS4JdPFQ6OMsHlKUnL8UxrU7e9eppQBiU
         nbN0OiV6iEApeQN1RpRTl4jhDs9LLHeZjXixAnXzvqgGxiYGRrWZbejsNVUZwHvctfvH
         +BNw==
X-Gm-Message-State: ABy/qLb1+nLwG7kGXkFS1JRi60kfRhXkA4I77tG5Hjhulya8rBsIV5XU
	z8t0cy5TqHeC5h6jwc4Vsf8Ki1xblzTj4JNHaTAZeUHZOar9iMbQ1wiIjCYK2U0gIiPFyueTIYd
	OB7BZhTie1WJPaUDyqDaMk5n5SA==
X-Received: by 2002:a05:600c:2047:b0:3fb:e643:1225 with SMTP id p7-20020a05600c204700b003fbe6431225mr10753260wmg.13.1690307578756;
        Tue, 25 Jul 2023 10:52:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHctGB+eZC1RdaLfQPwtkcFFFiPIFM5dX/E7ZTSeMEbnqbLnJDcTKJPkwmfuiL7KsoL1d5LjQ==
X-Received: by 2002:a05:600c:2047:b0:3fb:e643:1225 with SMTP id p7-20020a05600c204700b003fbe6431225mr10753241wmg.13.1690307578383;
        Tue, 25 Jul 2023 10:52:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:e900:3b0d:87a6:2953:20d1? (p200300cbc73fe9003b0d87a6295320d1.dip0.t-ipconnect.de. [2003:cb:c73f:e900:3b0d:87a6:2953:20d1])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c511400b003f7f475c3bcsm4381939wms.1.2023.07.25.10.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 10:52:57 -0700 (PDT)
Message-ID: <1686400c-a086-a8e5-325a-3b5edc2bf588@redhat.com>
Date: Tue, 25 Jul 2023 19:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 7/7] mm/hotplug: Enable runtime update of
 memmap_on_memory parameter
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-8-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230725100212.531277-8-aneesh.kumar@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25.07.23 12:02, Aneesh Kumar K.V wrote:
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   mm/memory_hotplug.c | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 96e794f39313..6cb6eac1aee5 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -95,7 +95,12 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
>   		mode =  MEMMAP_ON_MEMORY_DISABLE;
>   
>   matched:
> +	/*
> +	 * Avoid changing memmap mode during hotplug.
> +	 */
> +	get_online_mems();
>   	*((int *)kp->arg) =  mode;
> +	put_online_mems();
>   	if (mode == MEMMAP_ON_MEMORY_FORCE) {
>   		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
>   
> @@ -116,7 +121,7 @@ static const struct kernel_param_ops memmap_mode_ops = {
>   	.set = set_memmap_mode,
>   	.get = get_memmap_mode,
>   };
> -module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0444);
> +module_param_cb(memmap_on_memory, &memmap_mode_ops, &memmap_mode, 0644);
>   MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug\n"
>   		 "With value \"force\" it could result in memory wastage due "
>   		 "to memmap size limitations (Y/N/force)");
> @@ -2175,18 +2180,16 @@ static int __ref try_remove_memory(u64 start, u64 size)
>   	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
>   	 * the same granularity it was added - a single memory block.
>   	 */
> -	if (mhp_memmap_on_memory()) {
> -		ret = walk_memory_blocks(start, size, &mhp_altmap,
> -					 get_vmemmap_altmap_cb);
> -		if (ret) {
> -			if (size != memory_block_size_bytes()) {
> -				pr_warn("Refuse to remove %#llx - %#llx,"
> -					"wrong granularity\n",
> -					start, start + size);
> -				return -EINVAL;
> -			}
> -			altmap = &mhp_altmap;
> +	ret = walk_memory_blocks(start, size, &mhp_altmap,
> +				 get_vmemmap_altmap_cb);
> +	if (ret) {
> +		if (size != memory_block_size_bytes()) {
> +			pr_warn("Refuse to remove %#llx - %#llx,"
> +				"wrong granularity\n",
> +				start, start + size);
> +			return -EINVAL;
>   		}
> +		altmap = &mhp_altmap;
>   	}
>   
>   	/* remove memmap entry */


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

