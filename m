Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3F459F03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:13:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hyz2N0xD4z2yfm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:13:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wltUiAyg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=brainfault.org
 (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=brainfault-org.20210112.gappssmtp.com
 header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=wltUiAyg; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyz1h3cmdz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:12:39 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id t30so37636605wra.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HYs1wzwF6+J9dSOANXB9y6loDw9qWfCXBI2HZhWySNA=;
 b=wltUiAygiHWsBEmc25AjNkPWeRE3z9px4T/cVrqarPBht3N5GOBcMj472TjSJxLh+F
 0GPEkZ82ElidOxCepsH3qkVpZpghdJFzn6w8QY0bBYX7GfBGAa5PebvvpwYx1AMsWy+/
 Hy0tXtM5hguM8ULFAxaSFY9L9pHflRmc5oBmZlGzdmDGxSVWLmJgoXyeLvirR3+EDdYc
 x6uL63V8O6CZSV6meLPQPSVnuq81aNx6LBTQbWdIxp70MyirIsOfKBJ+3yy5wRokBv7P
 ZHDdSS5XrKlSNk/fVqI4v77GmiM6rni3n8Pmp1gAXvY2q32B2g9mUwyOWVLBU2DWazev
 nV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYs1wzwF6+J9dSOANXB9y6loDw9qWfCXBI2HZhWySNA=;
 b=x6ePgexxXQTbEaF9yhfVPj9RhxcVaWzq+gSC+NEWsqE8SDKCA8BZ46OZIM5jCaKMwG
 geWI7/Im6rLHWNyGCiQnk0ATGaawCYyOKem1myuhpyN+s66hE1cM4pzhxOKmdW9PT3li
 /u1T8HC1qPGuFkSuk8go9QnJqSegEDmfCek8Zx91INAAKFMAde3HwYOaR+VPnL7Um286
 9L+IJ0MD4O34g13cWo4x1Xms+umLAnjRDVGqsrcKQLO2RgUuPGqb8V4PPFEhlCLudBWc
 ohBrMW9+wc3brAaKkYp4nA/IdrsBz2VlyWcb8xvMSSL5KuUnhfYd14Msr1Zemfyb+yYK
 3sFg==
X-Gm-Message-State: AOAM530rxDsEMP52EI270YVLAYXTfbj7ckvLDwinGj4mSuBgI2+OoWp7
 zN/+KmCCxpkZ0MDwg8gX+tkZ+J+ISiH0xwVpF0FpwA==
X-Google-Smtp-Source: ABdhPJw3107qjhtYHlg0VKfoxcrKNwhATIgpuvcrTNAjZTbcT3w/UYNbeW1BEW91PyajE9x5O252/D9Dk01cQ3/AShU=
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr5400365wry.306.1637658753498; 
 Tue, 23 Nov 2021 01:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-6-dwmw2@infradead.org>
In-Reply-To: <20211121125451.9489-6-dwmw2@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 14:42:21 +0530
Message-ID: <CAAhSdy307DqNuQEFCu2ze2jXJ7taDE6y6SwY9nHGA8yNPfggiQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] KVM: RISC-V: Use Makefile.kvm for common files
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>, kvm <kvm@vger.kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets @ redhat . com" <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 21, 2021 at 6:25 PM David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Looks good to me.

For KVM RISC-V,
Acked-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>

Thanks,
Anup

> ---
>  arch/riscv/kvm/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 30cdd1df0098..300590225348 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -5,14 +5,10 @@
>
>  ccflags-y += -I $(srctree)/$(src)
>
> -KVM := ../../../virt/kvm
> +include $(srctree)/virt/kvm/Makefile.kvm
>
>  obj-$(CONFIG_KVM) += kvm.o
>
> -kvm-y += $(KVM)/kvm_main.o
> -kvm-y += $(KVM)/coalesced_mmio.o
> -kvm-y += $(KVM)/binary_stats.o
> -kvm-y += $(KVM)/eventfd.o
>  kvm-y += main.o
>  kvm-y += vm.o
>  kvm-y += vmid.o
> --
> 2.31.1
>
