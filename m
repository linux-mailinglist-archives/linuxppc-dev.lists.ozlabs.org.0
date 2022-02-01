Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA814A6065
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 16:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp8R44q3Vz3bVL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 02:45:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20210112.gappssmtp.com header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dNCxlG7n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=brainfault.org
 (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=brainfault-org.20210112.gappssmtp.com
 header.i=@brainfault-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=dNCxlG7n; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp8QM0B5Xz2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 02:45:13 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id v123so13049794wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 07:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LCcU9g3LWk+Ni1MDTb90PSlSH2Ejv1l38RdD5isGmzA=;
 b=dNCxlG7n/ZWCDBHispxymrFtrSs4c9YqEglHxbiG1ucYsKtBOTQqyfDQwy3eotCMjP
 uLM2L/H5EOfuyuixCibGBeRPuEqC7JcUChO4/5W88/l97mdNAgNvT/xqYmtLFgbKxh5n
 w5nISZOS0HKXiiexKQd+CqHtqM0kejpiHufa6rVenmJHxnYBkcSCvAZ+K0lfDvYe8v8/
 paGmxHQs3RqMpJLOQQe5QQ5vAOhsHvaHBxJGkYOele0OKszptBqf8ga7cK7KXkXhM0iv
 Gsb4gJ97geGtk3lJlPWcjuPmCn1m0Qbge+0Fy+Y8HGop/fCzxMmzbROs7ofYWtG8VEDd
 mjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LCcU9g3LWk+Ni1MDTb90PSlSH2Ejv1l38RdD5isGmzA=;
 b=Dt2W0aripkOVSBaUMD32U8dgHjRCOP4sBxI+4A0Y60iS4ewdn3H0jCqf0keELtODFH
 5YYGRyTqiUy3+BMA5eDGrsZmZrv7ErknaXV36z8RY6AOCF6Otx5u89euubvkRyHotO9m
 8ryDwsyLmRDmR8vwyRJTKe5gr0RDHOrzOD5vEtS3g+X/08op5+aOEAycFMQm/1QKthdm
 o4FSMYdqFScyZ839EbkqX0PH2pUj6NMS6pHRqLQGDzoOpXDHt0TH7dchhjUOtfnhBwqf
 i4bAXPw9R7SNqhU1ePL5w70ojXNGEgwu7GG28aoeMIZcAk1ecloOWX7jkwa6NzEc8QNv
 ZMOA==
X-Gm-Message-State: AOAM5318r/NzmLmC4SW9GGUSrQXBPhv1H+QwGQTE3pgScgFtnikEGcvc
 i384+qHrIjHcxfzHRgxflMsXJMpk+6a1H2DN6C9ArA==
X-Google-Smtp-Source: ABdhPJzLJXIjzEoU+zr9xqvCLUKq64QKzCzT5/D/E4v9iXKOT2PZW4bgO0vZKGKExLFNyrBqW6Lzx4h6BrcWo4/kvAI=
X-Received: by 2002:a7b:c929:: with SMTP id h9mr2237691wml.176.1643730307764; 
 Tue, 01 Feb 2022 07:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
In-Reply-To: <20220201150545.1512822-22-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Feb 2022 21:14:56 +0530
Message-ID: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Guo Ren <guoren@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Guo Ren <guoren@linux.alibaba.com>, KVM General <kvm@vger.kernel.org>,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 x86@kernel.org, linux-csky@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, Drew Fustini <drew@beagleboard.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 liush <liush@allwinnertech.com>, linuxppc-dev@lists.ozlabs.org,
 Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+Paolo

On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Current riscv doesn't support the 32bit KVM API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>

This looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
>  config HAVE_KVM_IRQ_BYPASS
>         bool
> --
> 2.25.1
>
