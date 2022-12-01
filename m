Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6363F687
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNlq33rFz3f57
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:45:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzHg60Uf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=xadimgnik@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AzHg60Uf;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNCNJ3Qznz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 21:43:28 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1160389wms.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=34xRbeJm4Ksf3agn72vdHuQrCy+xFaOAkMI20jSUs8E=;
        b=AzHg60UfqWIuniRDwSV0kUn58L84AxRbLj1KxaWUpkExnaz9Jf0mpMJsRIxs0KObgd
         soQ1W7t6DClFqZL5Sz4pVLJxPODSdcfWH2JFiVW2zEBMerlLvjkR1+DJoc4+WpNBKL+I
         PW6xkLEEUmN/Se6yT0vIWJph39WzqIA+SJPH1Jsv7h7dKXsKvjwPoKUClZhTIgXjAbFD
         m9zWUx0GIE8Dv1vkZzsH73Fq4mPpvgYZnpRmT8AL17xzVUC4+XcR3wej4y3vY5DfOIdr
         5pF7L9v5/ffa3NIJyyFg3JxW0kRC69giw2m5lejSbkJhsGZxR9w1oE4BDHpBORKVLYtO
         3/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34xRbeJm4Ksf3agn72vdHuQrCy+xFaOAkMI20jSUs8E=;
        b=XoXKNOhm0Ucm4Bmd4bJhDOrZUhlUff4JcUZXFsqTLOc0RLLMZL9r4oM/CTCV2iP/74
         3PwAIJjvi4rQygwJcZEt9+rxMxWyRvaLdp1DJUH4wquJKlbzItT0qt4c22iNSXxODaqN
         uk+zEkv9t1yMNrfzZSENaWznqXLfa5vwrdwTvmzWaaIkCnhNosjjE+iegzth+Mfap4j3
         Xfvq40/Rup4l+BKzheRPjQIpMnqFPjZQbEHwvMyE+FUx/pcW0z7D5JoCJ8+4rTZO/Q/b
         09B4ESPAxS3VPdHSvAws2B+Zd1ccc8UIfuLZ9jqfKtAZ2zpOqJJuz+x/9tjCTcmQvqV7
         HTkg==
X-Gm-Message-State: ANoB5pk+enBcQ8Qu03sIxRHGywr75RAAiBMpEwjLOzQbHXWYuuNLQSBq
	tgGgTuOrHmOmjFU2n9z7TAw=
X-Google-Smtp-Source: AA0mqf6f8L9W/LFpuxiieU1hwL0SgbBmWKJep4VDP/7W75bGJuJSe0KFg6OoADvN7w7dpRP5siL0uQ==
X-Received: by 2002:a05:600c:1f16:b0:3cf:66a2:d440 with SMTP id bd22-20020a05600c1f1600b003cf66a2d440mr47429561wmb.108.1669891402569;
        Thu, 01 Dec 2022 02:43:22 -0800 (PST)
Received: from [192.168.0.248] (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id i10-20020a1c540a000000b003cfc02ab8basm8303094wmb.33.2022.12.01.02.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:43:22 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <aa3be096-4f05-b653-b801-e102abe01903@xen.org>
Date: Thu, 1 Dec 2022 10:43:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 34/50] KVM: x86: Unify pr_fmt to use module name for
 all KVM modules
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-35-seanjc@google.com>
Organization: Xen Project
In-Reply-To: <20221130230934.1014142-35-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/11/2022 23:09, Sean Christopherson wrote:
> Define pr_fmt using KBUILD_MODNAME for all KVM x86 code so that printks
> use consistent formatting across common x86, Intel, and AMD code.  In
> addition to providing consistent print formatting, using KBUILD_MODNAME,
> e.g. kvm_amd and kvm_intel, allows referencing SVM and VMX (and SEV and
> SGX and ...) as technologies without generating weird messages, and
> without causing naming conflicts with other kernel code, e.g. "SEV: ",
> "tdx: ", "sgx: " etc.. are all used by the kernel for non-KVM subsystems.
> 
> Opportunistically move away from printk() for prints that need to be
> modified anyways, e.g. to drop a manual "kvm: " prefix.
> 
> Opportunistically convert a few SGX WARNs that are similarly modified to
> WARN_ONCE; in the very unlikely event that the WARNs fire, odds are good
> that they would fire repeatedly and spam the kernel log without providing
> unique information in each print.
> 
> Note, defining pr_fmt yields undesirable results for code that uses KVM's
> printk wrappers, e.g. vcpu_unimpl().  But, that's a pre-existing problem
> as SVM/kvm_amd already defines a pr_fmt, and thankfully use of KVM's
> wrappers is relatively limited in KVM x86 code.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
[snip]
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index b246decb53a9..3bf7d69373cf 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -5,6 +5,7 @@
>    *
>    * KVM Xen emulation
>    */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include "x86.h"
>   #include "xen.h"

Reviewed-by: Paul Durrant <paul@xen.org>

