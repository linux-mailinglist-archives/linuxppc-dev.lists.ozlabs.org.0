Return-Path: <linuxppc-dev+bounces-11303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C1B355F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 09:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB07H2024z3dKC;
	Tue, 26 Aug 2025 17:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756194299;
	cv=none; b=Z7hJq433+guvf86wLPomS+AmUkIg9co0dUVRo/IyJvE5+UvCz+Q2TSUX0eNwmznxx5Hu7+xA/x8bBxWgr/r3HizQNhVmmCGNpurzKVwKdkFroEbLb90RA+lOrzg+C+QuRJrEe2iQkIjO0tyzuUZxAizjHJlRsfRKIpcw9veWDtX1wE9kwUAZl1NfBGCPvCAPQM4G1r10iMBBswrptsrK5xW2mQTWQEPCLqe3ODPTVz8/Donaizb7UAyvrOZgME4yToj5mILMy+cHkI8q/ZXSG3qWH523WU4DXivtO0Y7mdOwXHOBR8KtIboU6XcIpvd2cvAk6c6wLneMStdfiRErDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756194299; c=relaxed/relaxed;
	bh=BDrWwBla1QrTDzNI7yFzBveJvJXRu3aajUikrOKKqUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjMP6T0O6wlEh+hDwKEMuyuND6hsjTUgiGCnbjxG97v1MzzSm7yz66qhCLagqViRBFI+IZFxamjnVF62KHobuMRTjllyB4OsCKaDgBpxKpp+72Gc0kbt8qtMnGAQHbeg68A7cX//usLzxjh9qytkQm+hBLlEMbteETc+LHdAkPavTzXVtde4F2NXyiB2Q86pAgEAqYhdniZSudIuW6vDIokZnToQA6m40Ao1HighaS7CDE3XvfCefAhFrJbnG4yDI1DhwgmJHcToe99CUluUp2jBUamvttn0A0/N9Vq2KWzQawBQ86vSsL8mbPVxo9O7AGMKpJtlA9O8KbJ7Tq4l/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Avgil2AX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Avgil2AX; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Avgil2AX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Avgil2AX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB07F0L6sz3dJV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 17:44:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756194290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDrWwBla1QrTDzNI7yFzBveJvJXRu3aajUikrOKKqUc=;
	b=Avgil2AXMj/Y3XhyYlWzp32f0SMIEjaWBHc13KOiwultTMGDPXENjqeidDxDKHrmkEcva7
	81tOpRprLYv34tbvBzYXh1l8bv4uIRfTDPv79gje72XO8u/xG66YEuTmJOzaIxYbKye3sz
	7ewLqzl9/heqz7VkqeLo3ZzNzvTuhTc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756194290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDrWwBla1QrTDzNI7yFzBveJvJXRu3aajUikrOKKqUc=;
	b=Avgil2AXMj/Y3XhyYlWzp32f0SMIEjaWBHc13KOiwultTMGDPXENjqeidDxDKHrmkEcva7
	81tOpRprLYv34tbvBzYXh1l8bv4uIRfTDPv79gje72XO8u/xG66YEuTmJOzaIxYbKye3sz
	7ewLqzl9/heqz7VkqeLo3ZzNzvTuhTc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-oYXpHa2BNAGGrtkNd9PfCA-1; Tue, 26 Aug 2025 03:44:48 -0400
X-MC-Unique: oYXpHa2BNAGGrtkNd9PfCA-1
X-Mimecast-MFC-AGG-ID: oYXpHa2BNAGGrtkNd9PfCA_1756194288
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9a65c355so84805186d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 00:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756194288; x=1756799088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDrWwBla1QrTDzNI7yFzBveJvJXRu3aajUikrOKKqUc=;
        b=HqI6BjqA+iMUyRQmzJKFQQx57xvs0y1p+R06jPIvHo6btH5x7AtA6r8HuB2OEzKBQb
         kB6yocU7QAmpnWhSEx5KnjKX4pkZXkp4Q0KXdXuEps0a6Kvu3oblnPWAz8jhhIFo/u2U
         LNXJfY+EfFjHCtfTi7hatk7vmRy7UWq56lWHBaQ/IXy9+PXQ32wmHKn42Idhr/j/jTC0
         Guz1kT9mG+6GZmFrZfeEsZ2wrE7ZUfRUVvcuj18dhZpWk7jQPdPenJtuqDqadQMpWARS
         vNW2HDrgYKUMtfIdSCFZtYjIWWCtaGfLWsNwleyOoss+lY8V7q16t+IddgBftvM+D0Xe
         onCg==
X-Forwarded-Encrypted: i=1; AJvYcCX3XG06AmqV2Ne6Z9BDbHirbmxeHCXhEeVsH/QFzkAfnPWRxnWK2D5qKUvb9CYhpVNUJB0ITjjUZ3c+9Ec=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6Ayj+aQcQLsv5/FtgRj9xDol2GLdoVwF9fG3DuLI+xBYK3bKg
	23TWp0Ltq38sHqWCAvbxy3oB2ZkMzHEKRg7rPskRJYg1aS45fszp+ZAsgo96r0jL2AJbHzuY8PV
	jn0yxVZapBXPqZGKwyLP5nEAeu1u2MauP6z/brK/m0p/of9k4pZRc/3cwDHLe4Co99JU=
X-Gm-Gg: ASbGncvi6PRo7rVyeNKpi5zHFSlffL41Zdcqn2PtwvXAONWaHJ5rPVTM+/ZRYln5PUg
	cU86nnrMI04Y3UBW1/53qB823+RW408mi5vR4yWIny9/m0LZIKDCKAcYDDujeidBx2UuuLDNwbC
	cV6POGQgGo45/tVC3jMSMFLJA+hFJkZQG/I4SEPh4GInXrkrVxDR1n9WHVrOLjcQosq8VgTlOWU
	pwb2IHdD/GYBYkkz9WkxRCIZR4pCp97ctDJySUKra9ggLA1afzTailZYaMkdOk0bONHJ8dQNZqG
	19o8SodFRIeKZ/4pLDEdFHzpWf3+ZWyd5Nfm8kjHcet0orD2IutuxTcGfi8jKVpfPThG7DycZ6r
	De9RbpXu173c=
X-Received: by 2002:a05:6214:acc:b0:70d:c4b3:9443 with SMTP id 6a1803df08f44-70dd59c1759mr4350916d6.31.1756194287964;
        Tue, 26 Aug 2025 00:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhzhn5+Yg77HtcZk5KiF7sJitx0Vz2y9+jpRKcTifYsTOJze6b9AG3bPnC6Fl6hT2Uuy6Org==
X-Received: by 2002:a05:6214:acc:b0:70d:c4b3:9443 with SMTP id 6a1803df08f44-70dd59c1759mr4350726d6.31.1756194287545;
        Tue, 26 Aug 2025 00:44:47 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72d6a53sm60101456d6.72.2025.08.26.00.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 00:44:46 -0700 (PDT)
Message-ID: <fcd38381-b5d8-412e-bc22-f1f5e4fc0b4a@redhat.com>
Date: Tue, 26 Aug 2025 09:44:43 +0200
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
Subject: Re: [PATCH net-next RESEND v4] ibmvnic: Increase max subcrq indirect
 entries with fallback
To: Mingming Cao <mmc@linux.ibm.com>, netdev@vger.kernel.org
Cc: horms@kernel.org, bjking1@linux.ibm.com, haren@linux.ibm.com,
 ricklind@linux.ibm.com, kuba@kernel.org, edumazet@google.com,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au
References: <20250821130215.97960-1-mmc@linux.ibm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250821130215.97960-1-mmc@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvUOwp4RJT9Le-_92dhJhgFCvLmskjSAFhFFTTKbVVI_1756194288
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/21/25 3:02 PM, Mingming Cao wrote:
> POWER8 support a maximum of 16 subcrq indirect descriptor entries per
>  H_SEND_SUB_CRQ_INDIRECT call, while POWER9 and newer hypervisors
>  support up to 128 entries. Increasing the max number of indirect
> descriptor entries improves batching efficiency and reduces
> hcall overhead, which enhances throughput under large workload on POWER9+.
> 
> Currently, ibmvnic driver always uses a fixed number of max indirect
> descriptor entries (16). send_subcrq_indirect() treats all hypervisor
> errors the same:
>  - Cleanup and Drop the entire batch of descriptors.
>  - Return an error to the caller.
>  - Rely on TCP/IP retransmissions to recover.
>  - If the hypervisor returns H_PARAMETER (e.g., because 128
>    entries are not supported on POWER8), the driver will continue
>    to drop batches, resulting in unnecessary packet loss.
> 
> In this patch:
> Raise the default maximum indirect entries to 128 to improve ibmvnic
> batching on morden platform. But also gracefully fall back to
> 16 entries for Power 8 systems.
> 
> Since there is no VIO interface to query the hypervisor’s supported
> limit, vnic handles send_subcrq_indirect() H_PARAMETER errors:
>  - On first H_PARAMETER failure, log the failure context
>  - Reduce max_indirect_entries to 16 and allow the single batch to drop.
>  - Subsequent calls automatically use the correct lower limit,
>     avoiding repeated drops.
> 
> The goal is to  optimizes performance on modern systems while handles
> falling back for older POWER8 hypervisors.
> 
> Performance shows 40% improvements with MTU (1500) on largework load.
> 
> Signed-off-by: Mingming Cao <mmc@linux.ibm.com>
> Reviewed-by: Brian King <bjking1@linux.ibm.com>
> Reviewed-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> --------------------------------------
> Changes since v3:
> Link to v3: https://www.spinics.net/lists/netdev/msg1112828.html

For future memory: please use lore links instead.

Thanks,

Paolo


