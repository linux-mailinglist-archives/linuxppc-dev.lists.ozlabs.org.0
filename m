Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F18FAA7F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 08:08:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HLIV8Wed;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtgBY5mpyz3cWx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 16:08:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HLIV8Wed;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtg9p2r5Dz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 16:07:41 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2bfdae7997aso4145042a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 23:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717481259; x=1718086059; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHKS9jT7MB7hE/EEMjAH9yW7M5wSwmZc93mWcC255Cs=;
        b=HLIV8WedlII8f1mCi6zpm+8yuj3ooEt//GlHgeFDDN98A5Dqutu/pG1C7f8obw2UWy
         5cwbVxqJN392sYdhDM5aCoBPwx9i8sg6jBqLd+i5glBLIZa/jbRTLkosloBfoL+QQayA
         bj4t8o9boNmqonBsLhj+l2/3qH2H4xi+N1EQjV5fqyCG7nN48Ho5fu4qvmYwhlKBy9FH
         093gu5R2LL2rjdUi8QxqYD3gRFNVy3/j1CVAGLnbx6UgKneKYm2veddRWF1MHBG6CNgq
         a49ytO9QGev5pcd/W076ZCJxWBeNB3wlPT73ObK5n544vJNhVVzrOekv8658MqPUVlor
         7PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717481259; x=1718086059;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHKS9jT7MB7hE/EEMjAH9yW7M5wSwmZc93mWcC255Cs=;
        b=NwLDUJKr+khU2kNxEYeOnHdbVHD7qDF/VRfVMU1AjlWwQf9jZFHWw6MkBZ6VVj6LzK
         FyWzm51J5TKvcdvLGEjVcmjq29E6HJTVkXVYjClv3rSP23Fsa9jieDmXUqSz9GkM+SJ8
         05QD3r1HhoDhrhDv4DCzg3tUUxa7YMJZEDglUYQEnLQNXxr1zGwQzFZIyVLJFHOYWIkJ
         FimAQyx0C0BVuY1mast4nREFkQluxPbrUTXw6cSjTdoaflBcttHxfA3bpnnfCexLIpxJ
         0ZgrtPTIHfifGkfRS+MFy7ZTdIypRZmvkSKPjcaJwNaLcKWfmsq8vSVMkYqaFbLCgGdh
         EYPw==
X-Forwarded-Encrypted: i=1; AJvYcCUSfhR0d9AYjLBBo2kIM7dObFvEqkjTV4QSp9aR85K80JPuuT6WV0MmylMOJ1pv89DdAXvzY9SVx2sZqWBExG+4IUS57VxOpJuylIPHJA==
X-Gm-Message-State: AOJu0Yx9izABqU1s5litKE5UDEYx9BHbN85YjiQctSGbD3t2oLzPfv2l
	un8od4HsLUS2lKtjDJ4mh3B9Fr2zo1PttFdcvsvkCCE3f0WcNKwP
X-Google-Smtp-Source: AGHT+IGgduKGfFqGFxTIMZY4kIpEo9UbSeOpJKQ2EBgCxLKHZbKJzMZPFI7lJBVexL750l4Obga0Eg==
X-Received: by 2002:a17:90b:d95:b0:2be:9549:799e with SMTP id 98e67ed59e1d1-2c1dc56db3bmr10075761a91.9.1717481259042;
        Mon, 03 Jun 2024 23:07:39 -0700 (PDT)
Received: from localhost ([1.146.11.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2411633e0sm2535857a91.30.2024.06.03.23.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 23:07:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Jun 2024 16:07:29 +1000
Message-Id: <D1R0AHN2MCOS.BPHUJKSV7YSO@gmail.com>
Subject: Re: [PATCH 6/6] KVM: PPC: Book3S HV: Add one-reg interface for
 HASHKEYR register
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Shivaprasad G Bhat" <sbhat@linux.ibm.com>, <kvm@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <171741323521.6631.11242552089199677395.stgit@linux.ibm.com>
 <171741330411.6631.10739157625274499060.stgit@linux.ibm.com>
In-Reply-To: <171741330411.6631.10739157625274499060.stgit@linux.ibm.com>
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

On Mon Jun 3, 2024 at 9:15 PM AEST, Shivaprasad G Bhat wrote:
> The patch adds a one-reg register identifier which can be used to
> read and set the virtual HASHKEYR for the guest during enter/exit
> with KVM_REG_PPC_HASHKEYR. The specific SPR KVM API documentation
> too updated.
>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst            |    1 +
>  arch/powerpc/include/uapi/asm/kvm.h       |    1 +
>  arch/powerpc/kvm/book3s_hv.c              |    6 ++++++
>  tools/arch/powerpc/include/uapi/asm/kvm.h |    1 +
>  4 files changed, 9 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 81077c654281..0c22cb4196d8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -2439,6 +2439,7 @@ registers, find a list below:
>    PPC     KVM_REG_PPC_PSSCR               64
>    PPC     KVM_REG_PPC_DEC_EXPIRY          64
>    PPC     KVM_REG_PPC_PTCR                64
> +  PPC     KVM_REG_PPC_HASHKEYR            64

Just looking at the QEMU side of this change made me think... AFAIKS
we need to also set and get and migrate the HASHPKEY SPR.

The hashst/hashchk test cases might be "working" by chance if the SPR
is always zero :/

Thanks,
Nick
