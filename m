Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC3737B96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 09:01:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4/dwi8X;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SM0gMEZk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmDtj55ZQz3bXT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 17:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S4/dwi8X;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SM0gMEZk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 21 Jun 2023 17:00:27 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmDsl5Cp5z30MS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 17:00:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687330824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuzW986Oh57o03Ud0LW0uuDmVkkVmOnsnpeZZQrxEjg=;
	b=S4/dwi8XrwjN8wqv/uBZkJLu2fmHF4dPfyk37LlE2H2mqBnzOjkXvxxqJrW3PHUv6aemLV
	kv+0g2vPsO1AEYOq0yRKTGp9tEbZM5vubUkQeKKZLfritGPDwOpx5gL2fqYDnzhFWXU09/
	vXh/685SkHF3QfMQt9Kn8Lu4ghrVg0Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687330825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuzW986Oh57o03Ud0LW0uuDmVkkVmOnsnpeZZQrxEjg=;
	b=SM0gMEZkplNsxjRekp+8GmcISrDEPs1bLY0deZ6wfeEcM+HyOzsAz4jj5Ssmfi1Q/nXpBn
	90NNjMWE9yPGj64khMeL/mrGc3Vqh0doZqu31VYIBRfCvHFMsmojWtPGPO0ogROIEjmPJn
	xlY5qB/YX5k4laSSMxHrl7hZFhIJhgk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-bQP5nKWbPYKsOqpuZEzB2A-1; Wed, 21 Jun 2023 02:59:16 -0400
X-MC-Unique: bQP5nKWbPYKsOqpuZEzB2A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-311182a5253so2402303f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 23:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687330755; x=1689922755;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuzW986Oh57o03Ud0LW0uuDmVkkVmOnsnpeZZQrxEjg=;
        b=ZVeWvukOGx2/yDkK4xGERP8gpe9KM4eLlePs0g86B8wYgGAbnGJFWogAy90W03vhJe
         yYP6Nr/JIwSCIGn5AEjE8k5dqWUbhZeIPPp5AUeDMbzQWSQQddILaRaA4s3zqsgl5TN3
         e6KSasHNPfoPGaB7s7Vnt+gY2wa6hN6gm3IuoaBbGm48mVtKMKfIpOpfEoLLe7+vEmjq
         LLGpHXfCH+6twUgXDjYfHe+o+9ULs5/HvefldLzB9B8YBgIJcmIjuZs5KxfIk9v6L2Hv
         xhG5ftEXk6D+DbPPFr1L0OjWp+LesDvR+UBtkHAJfmNbIbrzBUQR5x9kkGScGyWDvDCp
         s70Q==
X-Gm-Message-State: AC+VfDw56y9SBAHpSkRdcCQdWI6gXVvLxPFQ40oJm+za99+cloqFNlWt
	mFXIxIBgeK0NXz1G1ulRrGLUJlVUdaun7cCN0dBzERxZAp1bs00TsfohSGihwGHgxRTNez5Dy2z
	qp8eKz3NQfNwX2YJF+tAIpKvMiQ==
X-Received: by 2002:a5d:6a46:0:b0:311:10ae:123c with SMTP id t6-20020a5d6a46000000b0031110ae123cmr16496684wrw.16.1687330755035;
        Tue, 20 Jun 2023 23:59:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Lnb4eisjyBnzGcAmSFCrScGjHWe5u1J7aiMZuAWqDSIGeTZEHHVALXwEoRCGczl/rdY1zEw==
X-Received: by 2002:a5d:6a46:0:b0:311:10ae:123c with SMTP id t6-20020a5d6a46000000b0031110ae123cmr16496666wrw.16.1687330754720;
        Tue, 20 Jun 2023 23:59:14 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003f50d6ee334sm4032687wmc.47.2023.06.20.23.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 23:59:13 -0700 (PDT)
Message-ID: <53365339-ddba-b581-0582-336d96ed969d@redhat.com>
Date: Wed, 21 Jun 2023 08:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] KVM: PPC: remove unneeded variable
To: baomingtong001@208suo.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, pbonzini@redhat.com, paulus@ozlabs.org,
 maz@kernel.org
References: <20230614055354.27565-1-luojianhong@cdjrlc.com>
 <a231e235fc55e782e70e5f186ecd7588@208suo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a231e235fc55e782e70e5f186ecd7588@208suo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Graf <graf@amazon.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/06/2023 07.58, baomingtong001@208suo.com wrote:
> fix the following coccicheck warning:
> 
> arch/powerpc/kvm/book3s_pr.c:424:5-6: Unneeded variable: "r".
> 
> Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
> ---
>   arch/powerpc/kvm/book3s_pr.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
> index 9118242063fb..1b68de369b88 100644
> --- a/arch/powerpc/kvm/book3s_pr.c
> +++ b/arch/powerpc/kvm/book3s_pr.c
> @@ -421,14 +421,13 @@ void kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu)
> 
>   static int kvmppc_core_check_requests_pr(struct kvm_vcpu *vcpu)
>   {
> -    int r = 1; /* Indicate we want to get back into the guest */
> 
>       /* We misuse TLB_FLUSH to indicate that we want to clear
>          all shadow cache entries */
>       if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
>           kvmppc_mmu_pte_flush(vcpu, 0, 0);
> -
> -    return r;
> +    /* Indicate we want to get back into the guest */
> +    return 1;
>   }
> 
>   /************* MMU Notifiers *************/
> 

Please make sure to CC: linuxppc-dev@lists.ozlabs.org when sending patches 
for KVM on ppc.

Reviewed-by: Thomas Huth <thuth@redhat.com>

