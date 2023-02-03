Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B868956B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Wv44NR4z3f8C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 21:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iGcWrv4W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iGcWrv4W;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Wt96df7z3c83
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 21:22:07 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so1578385pjw.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 02:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BC26glmyLYvqdRj/s/s6MK4qi5hy8JZOEYo3ZDI0Vnw=;
        b=iGcWrv4W143DbiJRKR8Be2u+UuFLvv+TMD04aaKkE8FyPZW/j/42Togzc26Of4xCHk
         L4O+J9J3KGooZvCPheaHtCVvhd+8yD7F+6cwfgRaYM7XlcjMHxjcBj+d00IuGOnZoxua
         p47HghzIR0V5V9BHB1MOTBO58vuNmWhvqwqTKzCWyKZoGTbMh0eeUZEg1LCG1i8w6yr+
         rGoonbhjlDDP0EM8BSTnSmM8hJ6sGKjQQ8ZQlho2AVRiZ9i9GSJGVG8WpNzZ88bsOJib
         p3nxwmBfaPRdS2D7OrOB+MkhuKe20M4wZIzbxooQQ7YLHch4yOj2EJIoaSWTjBZnOEHA
         LYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BC26glmyLYvqdRj/s/s6MK4qi5hy8JZOEYo3ZDI0Vnw=;
        b=Te0Pzye3gRxRK3PiXhqOhTIw4YS4kuJ1ShxC6em+mxuqoWe4F2oj4vgzOEXGbNJQes
         ANBWmmdJYAlaoGpnjG/5rrIobZkLmkau8B3p0wbZdQWKlbVMEhHTY7tPJvaQz/tzthho
         tH41aoAuPf30KPc4AdyvxF/s1cndRhj8ASjhANN0rPrtUYVQ3EZjpNrecZirE715umfm
         VItHSZwkMdsaplBp1Ov4HyszyGeyyARF8PiKaJRdgRMeevS2dpjTXdPm6Ky3zRD0iN3B
         j8BW67SyhlMDSE5FlDUCl/FFOsS+7e/SIoMcmMz0YB9+FUkjMubXSlZWne/vTpGqWHz2
         +u6A==
X-Gm-Message-State: AO0yUKVuFi97e6NwCmtmJxa2FRySpr26yL0x9I9bZdSyU656lSrQIHJy
	WxhuG2W4sFr8qcBnFTgTRcA=
X-Google-Smtp-Source: AK7set+WpN/kIwzQ9KpDMGx5dpl4PBMS/21AHFGf650c2cUKaoV8+4j20Irc5p0mFaig/53VJ2J67w==
X-Received: by 2002:a05:6a20:a002:b0:bb:aabe:7a56 with SMTP id p2-20020a056a20a00200b000bbaabe7a56mr12482709pzj.58.1675419724901;
        Fri, 03 Feb 2023 02:22:04 -0800 (PST)
Received: from localhost (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id l6-20020a639846000000b004768b74f208sm1233813pgo.4.2023.02.03.02.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:22:04 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Feb 2023 20:21:55 +1000
Message-Id: <CQ8UPZX0BERP.2TFM4914IGJZF@bobo>
Subject: Re: [PATCH 4/7] KVM: PPC: Standardize on "int" return types in the
 powerpc KVM code
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>, "Paolo Bonzini"
 <pbonzini@redhat.com>, "Sean Christopherson" <seanjc@google.com>
X-Mailer: aerc 0.13.0
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-5-thuth@redhat.com>
In-Reply-To: <20230203094230.266952-5-thuth@redhat.com>
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
Cc: Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Marc
 Zyngier <maz@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Zenghui Yu <yuzenghui@huawei.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 3, 2023 at 7:42 PM AEST, Thomas Huth wrote:
> Most functions that are related to kvm_arch_vm_ioctl() already use
> "int" as return type to pass error values back to the caller. Some
> outlier functions use "long" instead for no good reason (they do not
> really require long values here). Let's standardize on "int" here to
> avoid casting the values back and forth between the two types.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks for the patch. It looks fine to me, it should be okay to
go via Paolo's tree if he's going to take the series.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/kvm_ppc.h  | 14 +++++++-------
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 +++++++-------
>  arch/powerpc/kvm/book3s_64_vio.c    |  4 ++--
>  arch/powerpc/kvm/book3s_hv.c        |  6 +++---
>  arch/powerpc/kvm/book3s_pr.c        |  4 ++--
>  5 files changed, 21 insertions(+), 21 deletions(-)
