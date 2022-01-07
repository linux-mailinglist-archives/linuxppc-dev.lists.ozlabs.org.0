Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3216486EDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 01:31:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVPK93llYz30gg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 11:31:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ptMDyqLP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ptMDyqLP; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVPJV6R6sz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 11:30:32 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so10306146pjf.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jan 2022 16:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lprQNZoVyIwFc88+ZDsWucdXRZyZ/0iZgJO/DKb46sA=;
 b=ptMDyqLPCn0qgrelpm9g0SFYXuZ9+k1AxI3GqMBAx5ljQa0KLdtpKA5+534nIVZ667
 zsRB1dw6XBxQYqTuZlXIy2ehqdTamVi7dgloC6l4/4fke+qF92V9XNzxXrLVKOfnQDgf
 E76yAC0NQtrlZwQwbPpexftfklvQY2ndBArQarD2AQsjGKuVbU5NFClyY/oEmxrJIpll
 F2l4mQNC5n9RkJibo9Z/MHQlGGkkKeMY/3jb3F3agGYr//AA1rA5JflfXB3q+3dz9zwj
 9uL+fKG7WKCjnAOj/fbXqTWgG/B8vwTa0eaNRhgCz5OnEX1JnVIYXgHSbTnEnHY1xKYS
 c56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lprQNZoVyIwFc88+ZDsWucdXRZyZ/0iZgJO/DKb46sA=;
 b=HYAirgFdH2nMJTwu20nPDEYmPc7yWX0m/wMHlyED3MnqXFdeyUMFEsCOMHS/lzkRl5
 U3Itm1eW3fTiKVtDi9BXGx7yJSO+qxqjvfJjVM5JK+FiOkOfwzBZeRuThJgRpvDbxMhe
 QbjbV9U+endC9u3kLwGRg8s+4nkE1/ny7e9OtZniMSbc1SIcYEDZ6M6PYTTVmwmcOSfD
 ss+vW27n69UcD+U/2Lto+2pDWlx+jyFZRQyu3Dy2gIGJRI6VKgyS3LFsUi2oChGUS4bw
 s56LYmK4llFYGlNRZtTEWLwDHeLvGQz65so6KcNvyjZQ1FMg9M58rR3T+2DmOGO43Zxp
 ItYQ==
X-Gm-Message-State: AOAM530/Sb2Sw3mJzudymAAoQaLEJdYM5t8nOv/fCJk0ri27jk7kCkVA
 I4u/RwVyLNnN1W1ShbQg54+5sQ==
X-Google-Smtp-Source: ABdhPJyJY0plWYKVlHuKluYNR3d3Reap36XUR5DXgofbxpefsTl/LoWg0jdSfot5s5qeDhLwPkd1Lw==
X-Received: by 2002:a17:902:c784:b0:148:ef6f:fc4a with SMTP id
 w4-20020a170902c78400b00148ef6ffc4amr61583580pla.165.1641515429634; 
 Thu, 06 Jan 2022 16:30:29 -0800 (PST)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id t8sm3505589pfj.114.2022.01.06.16.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:30:29 -0800 (PST)
Message-ID: <4ceb77f5-4c31-1d18-e29e-849ab111475c@ozlabs.ru>
Date: Fri, 7 Jan 2022 11:30:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v2 7/7] KVM: PPC: mmio: Reject instructions that access
 more than mmio.data size
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220106200304.4070825-1-farosas@linux.ibm.com>
 <20220106200304.4070825-8-farosas@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220106200304.4070825-8-farosas@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/01/2022 07:03, Fabiano Rosas wrote:
> The MMIO interface between the kernel and userspace uses a structure
> that supports a maximum of 8-bytes of data. Instructions that access
> more than that need to be emulated in parts.
> 
> We currently don't have generic support for splitting the emulation in
> parts and each set of instructions needs to be explicitly included.
> 
> There's already an error message being printed when a load or store
> exceeds the mmio.data buffer but we don't fail the emulation until
> later at kvmppc_complete_mmio_load and even then we allow userspace to
> make a partial copy of the data, which ends up overwriting some fields
> of the mmio structure.
> 
> This patch makes the emulation fail earlier at kvmppc_handle_load|store,
> which will send a Program interrupt to the guest. This is better than
> allowing the guest to proceed with partial data.
> 
> Note that this was caught in a somewhat artificial scenario using
> quadword instructions (lq/stq), there's no account of an actual guest
> in the wild running instructions that are not properly emulated.



Ah thereee it is :-)
I'd merge it into 3/7.

anyway,
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   arch/powerpc/kvm/powerpc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 50e08635e18a..a1643ca988e0 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1247,6 +1247,7 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vcpu,
>   	if (bytes > sizeof(run->mmio.data)) {
>   		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
>   		       bytes);
> +		return EMULATE_FAIL;
>   	}
>   
>   	run->mmio.phys_addr = vcpu->arch.paddr_accessed;
> @@ -1336,6 +1337,7 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
>   	if (bytes > sizeof(run->mmio.data)) {
>   		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
>   		       bytes);
> +		return EMULATE_FAIL;
>   	}
>   
>   	run->mmio.phys_addr = vcpu->arch.paddr_accessed;

-- 
Alexey
