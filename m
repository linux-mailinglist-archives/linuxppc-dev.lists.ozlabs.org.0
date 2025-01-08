Return-Path: <linuxppc-dev+bounces-4843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2EFA05A17
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 12:39:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSmDL1Jwzz30TG;
	Wed,  8 Jan 2025 22:39:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736336386;
	cv=none; b=LjeWgwpoaw2XALqMHS9zjeskLsGh9tf+QA/r39AhZoftdV1CHyEnLMRcJcTUgPgFHxJeSGH2Chzw1hQ1m8Rzz/VU6MtEB1LNHAk/ojmBEbByHVFC3Pswxzjd/xlWZ2n5UD15dQEmMuvwUAA6rveJx1zMVcU6XsTE6BzxqD745UPQNm2f09WI/t96BBlUrCCAccPq1S8Tk4j59pPJIfGxhnEFM1KJ4qrplZ9g2ZyvzEbdsS48lM5HuUjI18EUfPEoMdZKJ8G63jkcgNx0BaKPs/aVA8VTSuwb4IN1avRIZZXOKrc60HvNpFdL1z5buaFHpN+j9ePssQyOysbEtMulZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736336386; c=relaxed/relaxed;
	bh=uA4of6RlcxZAbgA2Z8vduXo/qnfVApJjLKxtUFTyI38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R05KY8CRqxF5NX+b84AJ/SE51AGYFFAdk4iHm4gLnt3oS9chVq1M3pIu6cSQSR7QKrtLQJE2JpN5lLokLLWzA0fo3xBdGbxxaEWqohu1uupjiZUPOBIyXKNquPFGQG2x3DWSMZVt0ODwXqnkrhkEkZi3a5Tn911HyOxnoma3A512M59/5BnWuDyJ8Q8O7FxEpoXJ1pd4voiG22vCfoRU+uyUboOWnLWqxS0T4lyFg1MCiL5NjzN6lVAU9X9uPE0frP/nvKFtwXxRXOL9N3FlRwcrhK/A0nnPtgJqEnJgbUWGIoidy4RGegjyR2tByd5Ru32vAxkoE7RxTmFv50TVQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fp1EQrVS; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fp1EQrVS; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fp1EQrVS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fp1EQrVS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSmDJ63zDz30Qy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 22:39:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736336378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uA4of6RlcxZAbgA2Z8vduXo/qnfVApJjLKxtUFTyI38=;
	b=Fp1EQrVSW4EiLSeUY0LdgFd/c2FuWPq452ak0RRWC836W3RqXsHWRuq+gGEyon6VKf/OWu
	qLR60EZbCcIALtf9aFiBYHcA63hHHh9XZXRRk+n6+uCHceDZpIrD37GGjE4THYkojhEUNW
	ial8Bzh3GuKsB0wZMENjZ/5qezPjDcw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736336378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uA4of6RlcxZAbgA2Z8vduXo/qnfVApJjLKxtUFTyI38=;
	b=Fp1EQrVSW4EiLSeUY0LdgFd/c2FuWPq452ak0RRWC836W3RqXsHWRuq+gGEyon6VKf/OWu
	qLR60EZbCcIALtf9aFiBYHcA63hHHh9XZXRRk+n6+uCHceDZpIrD37GGjE4THYkojhEUNW
	ial8Bzh3GuKsB0wZMENjZ/5qezPjDcw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-iWpE5GpyP-m3fwd1BjczMg-1; Wed,
 08 Jan 2025 06:39:32 -0500
X-MC-Unique: iWpE5GpyP-m3fwd1BjczMg-1
X-Mimecast-MFC-AGG-ID: iWpE5GpyP-m3fwd1BjczMg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACDA719560B4;
	Wed,  8 Jan 2025 11:39:30 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F4E419560AA;
	Wed,  8 Jan 2025 11:39:11 +0000 (UTC)
Date: Wed, 8 Jan 2025 19:38:13 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1 5/5] crash: option to let arch decide mem range
 is usable
Message-ID: <Z35jpYq4GvCAXiII@MiWiFi-R3L-srv>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-6-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108101458.406806-6-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/08/25 at 03:44pm, Sourabh Jain wrote:
...snip...
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index f0e9f8eda7a3..407f8b0346aa 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -205,6 +205,15 @@ static inline int arch_kimage_file_post_load_cleanup(struct kimage *image)
>  }
>  #endif
>  
> +#ifndef arch_check_excluded_range
> +static inline int arch_check_excluded_range(struct kimage *image,
> +					    unsigned long start,
> +					    unsigned long end)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_KEXEC_SIG
>  #ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
>  int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 3eedb8c226ad..52e1480dbfa1 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -464,6 +464,12 @@ static int locate_mem_hole_top_down(unsigned long start, unsigned long end,
>  			continue;
>  		}
>  
> +		/* Make sure this does not conflict exclude range */
                                                   ^
                Make sure this doesn't conflict with excluded range?

> +		if (arch_check_excluded_range(image, temp_start, temp_end)) {
> +			temp_start = temp_start - PAGE_SIZE;
> +			continue;
> +		}
> +
>  		/* We found a suitable memory range */
>  		break;
>  	} while (1);
> @@ -498,6 +504,12 @@ static int locate_mem_hole_bottom_up(unsigned long start, unsigned long end,
>  			continue;
>  		}
>  
> +		/* Make sure this does not conflict exclude range */
                                                   ^
                                                 Ditto.

> +		if (arch_check_excluded_range(image, temp_start, temp_end)) {
> +			temp_start = temp_start + PAGE_SIZE;
> +			continue;
> +		}
> +
>  		/* We found a suitable memory range */
>  		break;
>  	} while (1);
> -- 
> 2.47.1
> 


