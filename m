Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA76AC261
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 15:08:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVgQx6ycWz3cHs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:08:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0TLLEC8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0TLLEC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0TLLEC8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N0TLLEC8;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVgQ10mMPz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 01:07:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678111653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1f7BkqHsqYuuBJD//EQRq+OWvr3phzSas2ytUULbFM=;
	b=N0TLLEC8o5vNUfyW9VTUj4Lr1egFiiB4ilCr1/dyjOIjGWH+NzhaDC3LRY7GDuSGs81+00
	yBzOZ7NYAF34gwMSg5VmL3D381FZl6VJTjWpyzvQMnNQ4ZjeapBUQZiLvzF1phOTN51aAz
	8V+mRV4iV+J8oZK6zvHPHYyyhEKP/+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678111653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1f7BkqHsqYuuBJD//EQRq+OWvr3phzSas2ytUULbFM=;
	b=N0TLLEC8o5vNUfyW9VTUj4Lr1egFiiB4ilCr1/dyjOIjGWH+NzhaDC3LRY7GDuSGs81+00
	yBzOZ7NYAF34gwMSg5VmL3D381FZl6VJTjWpyzvQMnNQ4ZjeapBUQZiLvzF1phOTN51aAz
	8V+mRV4iV+J8oZK6zvHPHYyyhEKP/+s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-8WG5qqGnN6qc01oK0AtQ8Q-1; Mon, 06 Mar 2023 09:07:29 -0500
X-MC-Unique: 8WG5qqGnN6qc01oK0AtQ8Q-1
Received: by mail-wm1-f69.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so6804062wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 06:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678111648;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1f7BkqHsqYuuBJD//EQRq+OWvr3phzSas2ytUULbFM=;
        b=UkhwacwAPuE2IoiqjfpbAYDMY606Xv/QKN7oACExGKFWXQpmGuT7RloHC8n1aO4bIG
         bqVy7Wyagm6ad3b7r72yy4L7HBJEXATM5/tfYzjZIL1YMaEdt6saXHOGaGHgSrlY2nOh
         Sg1tM2j+3LxBN52L3DUF7+UTZlDFsP0kA0S2OipgSAydfty93maYctG87thXo1KTvUAN
         zUO9B7tt/wdmSBj9reDQE7cND8P/JgfJgf8LvFU+Gtu7GQhfwK4BI/AO0bOJi0/2EP0+
         3YOY6P2YiOgQ5QosjSJlJ7Pw+RtUZGxDWDmXwwQE6k1cYJiVTRwLDZiWR+49dglQsIPI
         5A4A==
X-Gm-Message-State: AO0yUKULYsdl43HiXgk/1WyXIInRhg9EzrzbQUopEWgk76LvRqZ/xgmF
	p7L4n5ZAHpmPmQVu2T+372BK3/3irln3AJrjdNus2s3850cyTt5YWXAFNxRo+FABd0a3yCUbuiq
	PGSayG5SODQScMY3wudSLgWF30A==
X-Received: by 2002:a5d:634f:0:b0:2bf:f4f7:be9c with SMTP id b15-20020a5d634f000000b002bff4f7be9cmr6987958wrw.14.1678111648532;
        Mon, 06 Mar 2023 06:07:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9zQx0DQ7OFEY5rXzIBR9BgwoqiDbJm4GwjhVCPZ3OJTonv+Bu/TB7sGcLdUCIOC1uneLB/IQ==
X-Received: by 2002:a5d:634f:0:b0:2bf:f4f7:be9c with SMTP id b15-20020a5d634f000000b002bff4f7be9cmr6987936wrw.14.1678111648145;
        Mon, 06 Mar 2023 06:07:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05? (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de. [2003:cb:c704:3500:b8a3:191c:eae:cc05])
        by smtp.gmail.com with ESMTPSA id u8-20020a5d4688000000b002c5544b3a69sm10081903wrq.89.2023.03.06.06.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:07:27 -0800 (PST)
Message-ID: <7161f75e-9f40-f881-84b8-1eaaec0b0e3f@redhat.com>
Date: Mon, 6 Mar 2023 15:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] powerpc/mm: fix mmap_lock bad unlock
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org
References: <20230306135520.4222-1-ldufour@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230306135520.4222-1-ldufour@linux.ibm.com>
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
Cc: Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.03.23 14:55, Laurent Dufour wrote:
> When page fault is tried holding the per VMA lock, bad_access_pkey() and
> bad_access() should not be called because it is assuming the mmap_lock is
> held.
> In the case a bad access is detected, fall back to the default path,
> grabbing the mmap_lock to handle the fault and report the error.
> 
> Fixes: 169db3bb4609 ("powerc/mm: try VMA lock-based page fault handling first")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Link: https://lore.kernel.org/linux-mm/842502FB-F99C-417C-9648-A37D0ECDC9CE@linux.ibm.com
> Cc: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>   arch/powerpc/mm/fault.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index c7ae86b04b8a..e191b3ebd8d6 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -479,17 +479,13 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>   
>   	if (unlikely(access_pkey_error(is_write, is_exec,
>   				       (error_code & DSISR_KEYFAULT), vma))) {
> -		int rc = bad_access_pkey(regs, address, vma);
> -
>   		vma_end_read(vma);
> -		return rc;
> +		goto lock_mmap;
>   	}
>   
>   	if (unlikely(access_error(is_write, is_exec, vma))) {
> -		int rc = bad_access(regs, address);
> -
>   		vma_end_read(vma);
> -		return rc;
> +		goto lock_mmap;
>   	}
>   
>   	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);

IIUC, that commit is neither upstream not in mm-stable -- it's unstable. 
Maybe raise that as a review comment in reply to the original patch, so 
we can easily connect the dots and squash it into the original, 
problematic patch that is still under review.

-- 
Thanks,

David / dhildenb

