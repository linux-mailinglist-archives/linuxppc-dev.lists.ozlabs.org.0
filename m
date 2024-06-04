Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D7A8FAA3A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 07:49:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bw0R06Gp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtfmH3RpMz3cXL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:49:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bw0R06Gp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtflb2VhSz3cLk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 15:48:26 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-701ae8698d8so3921219b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 22:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717480104; x=1718084904; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p61Hce8IkWwKux3VG8miwDHGw7bU+KFjOmsb4t+oZQc=;
        b=bw0R06GpFur5wKDEBDSUpVq16NuwR9EDknki/8gMowAh7r5Jxd3oKdvgUx87OPK192
         AfTkkw1NhAqm+jXAefMm5GIxmwPpBgz1+azZhX0ClXK8yJLICI+qWQ8VJr9Zzg4LN2AP
         AYhr8V9BmbcatWeTxo/NjAt14cAnKqgHVGkC7ZvZWQKuhxNGhHSH4Tm+U6+9g6P6YWT4
         i9GnHEbipdTVribUdFxl08zV1akGozlDiL8zPeTWkBICLUztkkhkIRZ1fJ4HOrMJUWcP
         nU4h2BLO1j8OB4rBeVfY+ztQ+/lzdgkjTuMr1O0NvuXodPThl4Jof67TIwMOdI5u7QT3
         Swwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717480104; x=1718084904;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p61Hce8IkWwKux3VG8miwDHGw7bU+KFjOmsb4t+oZQc=;
        b=ZrnYEJ6hM/9WDWbka56z9pC1G0b2jkH8MejxuEMzgOjw/tldIYazbhxDRHVQElbuis
         vWmAlIj2XJkvDlyYn/dIGZxMXuN4Jd/1Wzd7WAqhwx6ema4e0PESJ+o9phDW7aLGwB4o
         d+WEkjHv51A9RZE9Vyb8kHfU7D678ynDkjkho8TKSh5TGH0gta32mfQ5nD+1sluu6SzA
         dzQiCWj5MYJeILh2TrYcmGkK3eAs8rB7m7fr85aGBx6NPYX0DgsAQ7saBCqcInQ3fCY7
         Bwb65FzxARocnA6ViM0DhhQX860Mlrz584K0JyzbP3eeUsn7NkjuzmhxGjSv+cfeI2ng
         IlCw==
X-Forwarded-Encrypted: i=1; AJvYcCVGOrdBuiEl77QFOr4k5fh1eFWUM/X+kQJyiW3E8luOUW2qGlOH+OnaO9GNjdwAZYTWIYHEmcEVY5WyPsI83VPN9s0NRKd3wSNjdyDKcw==
X-Gm-Message-State: AOJu0YztUmz9oVHB6ENGkaiqo/KXynKrQfhBcrrWWxRmSp7radB8R9eF
	y8MuuQvZjDZdTVyhl4Wg3Nerytknjo0cfzK/GvVsa4QGgOGhCiVjhTnX+A==
X-Google-Smtp-Source: AGHT+IEerX2qhhDnie48IrgDghI2cbk0LGDGIPJRG6DPWms4QfaexRHMPMrgovshUNKM5LzZTnLjaA==
X-Received: by 2002:a05:6a00:23c6:b0:6f8:d51b:1ccf with SMTP id d2e1a72fcca58-702477beb2amr11602978b3a.6.1717480104182;
        Mon, 03 Jun 2024 22:48:24 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e2c23sm6395956b3a.85.2024.06.03.22.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 22:48:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 15:48:16 +1000
Message-Id: <D1QZVS0ZCVBX.2UISITKQZRZHU@gmail.com>
Subject: Re: [PATCH 0/6] KVM: PPC: Book3S HV: Nested guest migration fixes
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
In-Reply-To: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, corbet@lwn.net, linux-kernel@vger.kernel.org, namhyung@kernel.org, naveen.n.rao@linux.ibm.com, pbonzini@redhat.com, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 3, 2024 at 9:13 PM AEST, Shivaprasad G Bhat wrote:
> The series fixes the issues exposed by the kvm-unit-tests[1]
> sprs-migration test.
>
> The SDAR, MMCR3 were seen to have some typo/refactoring bugs.
> The first two patches fix them.
>
> Though the nestedv2 APIs defined the guest state elements for
> Power ISA 3.1B SPRs to save-restore with PHYP during entry-exit,
> the DEXCR and HASHKEYR were ignored in code. The KVM_PPC_REG too
> for them are missing without which the Qemu is not setting them
> to their 'previous' value during guest migration at destination.
> The remaining patches take care of this.

These aren't just fixes for nested v2 or even just migration,
by the way. Good fixes.

Thanks,
Nick

>
> References:
> [1]: https://github.com/kvm-unit-tests/kvm-unit-tests
>
> ---
>
> Shivaprasad G Bhat (6):
>       KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
>       KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
>       KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in sync
>       KVM: PPC: Book3S HV: Add one-reg interface for DEXCR register
>       KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHKEYR in sync
>       KVM: PPC: Book3S HV: Add one-reg interface for HASHKEYR register
>
>
>  Documentation/virt/kvm/api.rst            |  2 ++
>  arch/powerpc/include/asm/kvm_host.h       |  2 ++
>  arch/powerpc/include/uapi/asm/kvm.h       |  2 ++
>  arch/powerpc/kvm/book3s_hv.c              | 16 ++++++++++++++--
>  arch/powerpc/kvm/book3s_hv.h              |  2 ++
>  arch/powerpc/kvm/book3s_hv_nestedv2.c     | 12 ++++++++++++
>  tools/arch/powerpc/include/uapi/asm/kvm.h |  2 ++
>  7 files changed, 36 insertions(+), 2 deletions(-)
>
> --
> Signature

