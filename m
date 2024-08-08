Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F2E94BCC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 14:01:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FmSN8Pcm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WflxP5JZBz2yN3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 22:00:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FmSN8Pcm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WflwW0P0Vz2xg9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 22:00:09 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-369cb9f086aso502644f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723118403; x=1723723203; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8fBZbfSfQMp8/8SurSvfBz+MaimrqNdI2CubOLP3Ew=;
        b=FmSN8PcmC9y+b/5Vab5vn8xiFLeujhtIBYbIVTRP/sND3VZyUPPIKoH6piKjmWK0Pd
         DjGKhgtQs61L+rqFD/ykQuPbBzU7uGIQDM+3bovhKob9CT9ubM/AxtJnpKr4KYBejAr0
         IYvjQRWVU1ktnb04wmrF+weN4igu6cy3USATGE4sZJAOdyGPL6FAZV4aFlxCGTwCxrFL
         L+WdjTPGjgnCUUNB720/l9XdPdeLmEFVykgk3NbzI6LF5O0CjvYYUXmGPSPOlykc6Y+M
         eXGcFg1zqU3bJtsvATsi72SLBU5lZXPHKCo3SCqGKSmXx4b4eKXqlenR5JKkV7jC3tnK
         DZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723118403; x=1723723203;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8fBZbfSfQMp8/8SurSvfBz+MaimrqNdI2CubOLP3Ew=;
        b=c2RdDj4sI3iWeCSzKAb6QA1vCkLK/+Ebm5HNmGktNXMKhR1IenQn5Fh5Tar3mO+53E
         4+769fpEmDNd4fXdnbd26PDy8ab6z03K3fc76jTNRmVtLTRrBkNYw+LfqW4OX15LVlWn
         8QgfJMGSKjpKdCFsTRJy6oRDcBlXFrhKqS15BUitb6ufmzqsjhkt7/IK6Hcxx2fwgov0
         E29ZWToxWLccJ7juz/YXaDYh7YCtJZIoFgIgsJGBOgYSRISTCyPnP6syi9et9IYjsWcg
         kJEQBD0X4e6peNGC1lu1CUYVP8QXPzGw+j8qHWVP+FvUuVsnlk2Gpn221XA2H5YzxGjM
         C+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCV2zLDWnw1Js2CvT2M6hArRqDC5glaFjHS4HmXIdmKCWIpqhEyXEF8T1g2bFKalARwiOFZKSZWocBXiZGr8+HW8AAQEkI4Q7VOeyJcR2g==
X-Gm-Message-State: AOJu0YxgO9TrBLIW7QBgfj2CkWECeyv7hYwOg2ne+RgYcylR4TSSTmFQ
	5g28tXx825bKYfN4LtCKqwxAphQX2ttuNOi0YWvl6LkVeAi6EHmX/RlFl+BXOmc=
X-Google-Smtp-Source: AGHT+IHHX2fBYyF3bzrkIN6FI+lRc2WcNWD9HizbtFbwpwdbf6zDJoYFHOfDyhNaZKL5sM+Jijm6XQ==
X-Received: by 2002:a5d:698f:0:b0:367:8fee:443b with SMTP id ffacd0b85a97d-36d27561461mr1129489f8f.41.1723118402280;
        Thu, 08 Aug 2024 05:00:02 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27156c8asm1700288f8f.24.2024.08.08.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:00:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 751635F769;
	Thu,  8 Aug 2024 13:00:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <20240726235234.228822-14-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:22 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
Date: Thu, 08 Aug 2024 13:00:00 +0100
Message-ID: <87bk23ql6n.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Now that hva_to_pfn() no longer supports being called in atomic context,
> move the might_sleep() annotation from hva_to_pfn_slow() to
> hva_to_pfn().

The commentary for hva_to_pfn_fast disagrees.

  /*
   * The fast path to get the writable pfn which will be stored in @pfn,
   * true indicates success, otherwise false is returned.  It's also the
   * only part that runs if we can in atomic context.
   */
  static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)

At which point did it loose the ability to run in the atomic context? I
couldn't work it out from the commits.

>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 84c73b4fc804..03af1a0090b1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2807,8 +2807,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool=
 *async, bool write_fault,
>  	struct page *page;
>  	int npages;
>=20=20
> -	might_sleep();
> -
>  	if (writable)
>  		*writable =3D write_fault;
>=20=20
> @@ -2947,6 +2945,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool inter=
ruptible, bool *async,
>  	kvm_pfn_t pfn;
>  	int npages, r;
>=20=20
> +	might_sleep();
> +
>  	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
>  		return pfn;

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
