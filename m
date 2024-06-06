Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462448FDD2C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 05:07:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAAzqS7Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvq4f59ZCz3cXg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 13:07:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAAzqS7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvq3y6lS5z3c2t
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 13:06:38 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f62217f806so4519045ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 20:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717643195; x=1718247995; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjMuvcnH30KoyWBjd5euk3EXjF9nRQlbcgZhgbXTZgk=;
        b=lAAzqS7QNR7ZoDo2QpXozqgwVgby9VF3FMuaa3pBiLMjmL1lSV9d65NqvzgMJ7HjTg
         5ngzif0m3nZqQ81JQLeWd2d9vBlVTyxz8QlocFSLE3efBGI90FYPY/ZHk/wgtQv7Kk0t
         l4k2k46uf42aWkgzgEhhWBwxelr+88YXIP2f3uM7rytgXBhWkZe+7QSKBeu0UtSntR9z
         O6Q5ILHCiTfQMJBIgFt2PCaWn1RVo8VdIqQVxT3XMhfiheZHXtYYnanb5+3ZBkieLQ5+
         Aa3QJRWpDBAFPDw+9AZIcT4k0SIlqyLkbxloQu7fu8vwMrOiIsMgABI0LyIhrE4a5wfL
         k2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717643195; x=1718247995;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjMuvcnH30KoyWBjd5euk3EXjF9nRQlbcgZhgbXTZgk=;
        b=Wp96EOd9hCJu2OYLPKxYokFrt/eiK1cC2kmtBSF+Xs/7gS8aKUdoK8UDrMrNuNpZpX
         1Fop2Dd+AbhBHv7LhxZo5J8VyxWmv7B9YWiulxTz3d6vrqXxt+2s0oDFtZTmsAtB8RqG
         VkZMK2depvwYTQhgm9wfYb11nH0/PfrQpxUveeWMtLP1uohLcvEarigc5aGVBV6YtZq7
         ZAmAT2IMmqLe+fUzi0HIIlPsgJ3gpoKgS0OQVUACVT4hMlRi6/uUcA2nhwH11ewfFYzo
         4hoZnkNiE6UNGJcvosfXcSwGW0GGlYEd+9/MBx+UFjHhz/Jv3nsqBasB389l9FYBeUcH
         uQdA==
X-Forwarded-Encrypted: i=1; AJvYcCX+b6BeH41Fj7zXH0cDcCXzpbTf5Gd07YDtrnQp98j+JfiA8EY14fvjL7mwCmqZ/LZuwSAjZvwk6xDxyn59Iq5Eyv/8cgCuGH4PHjJGOg==
X-Gm-Message-State: AOJu0YypzQF6fz6DMFn7MV2vTxCeelCN5aTS0W0cIrfN3/p4RweLN24I
	g4Ia4BJDEoheKa8GTIQqYOqia91VvaQzbD2BbOPPTq6cNoG6X9qb
X-Google-Smtp-Source: AGHT+IFZESfAMwBlJNHmCynL0DhPXDEYi3w27GieK3vEDPShijCOjqUcQk+TWV8ZF55Do87jKArwPQ==
X-Received: by 2002:a17:902:e850:b0:1eb:fc2:1eed with SMTP id d9443c01a7336-1f6a5a33a69mr54209595ad.41.1717643194601;
        Wed, 05 Jun 2024 20:06:34 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e07edsm2702695ad.214.2024.06.05.20.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 20:06:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Jun 2024 13:06:26 +1000
Message-Id: <D1SLOYCQGIQ6.17Y5C9XJDHX33@gmail.com>
Subject: Re: [PATCH v2 0/8] KVM: PPC: Book3S HV: Nested guest migration
 fixes
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
In-Reply-To: <171759276071.1480.9356137231993600304.stgit@linux.ibm.com>
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

On Wed Jun 5, 2024 at 11:06 PM AEST, Shivaprasad G Bhat wrote:
> The series fixes the issues exposed by the kvm-unit-tests[1]
> sprs-migration test.
>
> The SDAR, MMCR3 were seen to have some typo/refactoring bugs.
> The first two patches fix them.
>
> The remaining patches take care of save-restoring the guest
> state elements for DEXCR, HASHKEYR and HASHPKEYR SPRs with PHYP
> during entry-exit. The KVM_PPC_REG too for them are missing which
> are added for use by the QEMU.

These and the qemu patches all look good now. I'll give them
some testing and send R-B in the next day or two. I'm trying
to write a k-u-t for the hashpkey migration case...

Thanks,
Nick

>
> References:
> [1]: https://github.com/kvm-unit-tests/kvm-unit-tests
>
> ---
>
> Changelog:
> v1: https://lore.kernel.org/kvm/171741555734.11675.17428208097186191736.s=
tgit@c0c876608f2d/
>  - Reordered the patches in a way to introduce the SPRs first as
>    suggested.
>  - Added Reviewed-bys to the reviewed ones.
>  - Added 2 more patches to handle the hashpkeyr state
>
> Shivaprasad G Bhat (8):
>       KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
>       KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
>       KVM: PPC: Book3S HV: Add one-reg interface for DEXCR register
>       KVM: PPC: Book3S HV nestedv2: Keep nested guest DEXCR in sync
>       KVM: PPC: Book3S HV: Add one-reg interface for HASHKEYR register
>       KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHKEYR in sync
>       KVM: PPC: Book3S HV: Add one-reg interface for HASHPKEYR register
>       KVM: PPC: Book3S HV nestedv2: Keep nested guest HASHPKEYR in sync
>
>
>  Documentation/virt/kvm/api.rst        |  3 +++
>  arch/powerpc/include/asm/kvm_host.h   |  3 +++
>  arch/powerpc/include/uapi/asm/kvm.h   |  3 +++
>  arch/powerpc/kvm/book3s_hv.c          | 22 ++++++++++++++++++++--
>  arch/powerpc/kvm/book3s_hv.h          |  3 +++
>  arch/powerpc/kvm/book3s_hv_nestedv2.c | 18 ++++++++++++++++++
>  6 files changed, 50 insertions(+), 2 deletions(-)
>
> --
> Signature

