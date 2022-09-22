Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859D5E6370
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 15:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYG7f4jf4z3c5w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 23:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.174; helo=mail-vk1-f174.google.com; envelope-from=philippe.mathieu.daude@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYG7B3trrz302k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 23:18:12 +1000 (AEST)
Received: by mail-vk1-f174.google.com with SMTP id g85so4901067vkf.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FmC3Wnd/dYfP2uqwVfxKzutzBThKJES4nPc9HEeo7QQ=;
        b=CpO4RtVOSwZMScoKYND+pKb8duXkVco77/U17BGjaOYLr4X2veJrZDeW6BGzpAzmPP
         iGguFglmzlOgHCgFvSp4nRxkhCpPX4Ui+w7YEERYcfDX8eCUNePL1OqfY4z2bfe75uaY
         0F1LUDHDecouy8acxuFKu5wcIUzgb+fYygMJAkooEHtBcZq4gk+Svx3KDwnsm3OYlfgV
         QZGUpduuNuVq0M3Msvg/H3EuiritizJJRknk8YMkhHKU6Q3BsJXxHWPKShpKLXhUcSBx
         kX6tizn2ei4XKnSOQTjpZ8t3hk05kNE0oKCICE0+2Zj8/LxdqF+/4ZJtpKxmEz6P9dhI
         qtlw==
X-Gm-Message-State: ACrzQf2iqwUpiX7KW4TbP8xI+PQUeM3AGuWXi+wFnKGriiTnV+sknRxl
	u46Wmr3uCFYWGEcMVW3mxOL/QtzIkSph20Cm5Ps=
X-Google-Smtp-Source: AMsMyM5hAS5sGeCyGhDs3JB8ybhSoe0SBFugJqR9UWsYlOLvGt3tSKkrbx2I2RYfB9/ZOUlHboLppHif1VOrjItnvws=
X-Received: by 2002:a05:6122:10dc:b0:3a3:4904:2941 with SMTP id
 l28-20020a05612210dc00b003a349042941mr1265866vko.24.1663852689165; Thu, 22
 Sep 2022 06:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com> <20220921003201.1441511-12-seanjc@google.com>
In-Reply-To: <20220921003201.1441511-12-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 22 Sep 2022 15:17:56 +0200
Message-ID: <CAAdtpL4yFdh3V0Be05OKxUFBTSgFs6oTy9U5FjSRGwOhi=tDMQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, open list <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atishp@atishpatra.org>, Alexandru Elisei <alexandru.elisei@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, l
 inuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 21, 2022 at 2:34 AM Sean Christopherson <seanjc@google.com> wro=
te:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> KVM_REQ_UNHALT is a weird request that simply reports the value of
> kvm_arch_vcpu_runnable() on exit from kvm_vcpu_halt().  Only
> MIPS and x86 are looking at it, the others just clear it.  Check
> the state of the vCPU directly so that the request is handled
> as a nop on all architectures.
>
> No functional change intended, except for corner cases where an
> event arrive immediately after a signal become pending or after
> another similar host-side event.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/mips/kvm/emulate.c | 7 +++----
>  arch/x86/kvm/x86.c      | 9 ++++++++-
>  2 files changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
