Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1949A798
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:27:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjXMy68mjz3bTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 14:27:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ipey0nRX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ipey0nRX; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjXMJ39dJz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 14:26:34 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id a8so12736504pfa.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 19:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4wBvCDwSPnNaYiptEl6hW8BISTRdTug2mLfsez5vYL0=;
 b=Ipey0nRXa+7FG2iXOvDjo82mcIPH+ChWUgS1twDf8fJDgpV/y4PSaDP5DPFcQjUygg
 M5lNOaxJlBDwuvfNfNkPlDk3y0uQB5/BMbSKO4z0cFZYe7KWFVNoRuL2tSLQCvM67c8e
 EKh9Ex2SzxpbCtsFH51K7cP2Ry7bMds8NIjuF9RyWaCFYpTnbaCdAk0qvbS9KsKmXbct
 9fpXnIwz08EIZTmAEodKYWq29SteHERKghIilxefYOK+OYGGF6mHmZUuPhj/miXmf9QS
 CESG1XcjS6fIOXSBy5P+gjMCmEmgp74HCkVIS/jP84TEmBN554LgoXdWzvn8Mv70hggR
 tWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4wBvCDwSPnNaYiptEl6hW8BISTRdTug2mLfsez5vYL0=;
 b=zaKyTi/v1dM4LomrRDUgqmgR9yiWozQ4b3UozRUncP9ZL/mqRyMpkAzyuf2wQyWh5C
 9py4uUE+o+nj7jkuq6NmKHfVxNKoWjsR2BALNAiIImpvsctI69/l9/oRRkCc9ybdHZ61
 tEll4AotJtqVH4g3IfncSLhVij+wq9P3ppaPUQAjgDsoWM5JOOIfjXOWlqzIfk3c4ULx
 EmKMG91PJAYHgG/xXG/14Uharn5Sk/OdnqpDKe58pD5DJDgwE6COBDzXxsRqH5CUnjcn
 KoRSdq4hVlmJcWTE2vNI+kFM4/Cpj3GYULZcIBLsC7Z5lF27HeGB/u/ceSeiIwbk95wF
 bsEQ==
X-Gm-Message-State: AOAM532ootJFn44n8WTPYVRiO6d9nlPHmiwku3SStzDMM9h54loFXFSt
 PUihzFADMytE98Y74iuzWps=
X-Google-Smtp-Source: ABdhPJysDGHAS7KJCYLI37rnYJjzRCbW9pVwgdi85e5w7kDeBkES8UoQ3MODGurXAr5Hm+/ssgu3iw==
X-Received: by 2002:a63:f412:: with SMTP id g18mr13748168pgi.463.1643081192743; 
 Mon, 24 Jan 2022 19:26:32 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id n22sm17165683pfu.160.2022.01.24.19.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 19:26:32 -0800 (PST)
Date: Tue, 25 Jan 2022 13:26:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 4/5] KVM: PPC: mmio: Return to guest after emulation
 failure
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220121222626.972495-1-farosas@linux.ibm.com>
 <20220121222626.972495-5-farosas@linux.ibm.com>
In-Reply-To: <20220121222626.972495-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1643080025.cz96zd90xb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of January 22, 2022 8:26 am:
> If MMIO emulation fails we don't want to crash the whole guest by
> returning to userspace.
>=20
> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
> implementation") added a todo:
>=20
>   /* XXX Deliver Program interrupt to guest. */
>=20
> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
> emulation from priv emulation") added the Program interrupt injection
> but in another file, so I'm assuming it was missed that this block
> needed to be altered.
>=20
> Also change the message to a ratelimited one since we're letting the
> guest run and it could flood the host logs.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

One small thing...

> ---
>  arch/powerpc/kvm/powerpc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 27fb2b70f631..214602c58f13 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -307,9 +307,9 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>  		u32 last_inst;
> =20
>  		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
> -		/* XXX Deliver Program interrupt to guest. */
> -		pr_emerg("%s: emulation failed (%08x)\n", __func__, last_inst);
> -		r =3D RESUME_HOST;
> +		pr_info_ratelimited("KVM: guest access to device memory using unsuppor=
ted instruction (PID: %d opcode: %#08x)\n",
> +				    current->pid, last_inst);

Minor thing but KVM now has some particular printing helpers so I wonder=20
if we should start moving to them in general with our messages.

vcpu_debug_ratelimited() maybe?

Thanks,
Nick
