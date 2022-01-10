Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EEC488F8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 06:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXMfc6nj6z2xrq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 16:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RBIpfuVQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RBIpfuVQ; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXMdx6jgHz2xWx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 16:22:27 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id t19so9664912pfg.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jan 2022 21:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IG6cyA2PEBju74W6OZ9xTgqBPjnFRHCrixS8tldCOQ4=;
 b=RBIpfuVQYt1Ns6K0R7W+OiG2VdDpeM0lwzBCcykMqKjsDKaJmCX14b3I0fQutaU/FX
 eteC7JM6RcsLt2iDY+OWGyvzXFjHEBUSaN1SwabtqcyScHQu0b2yqi9x/xgrcxJZ5rrL
 1gN5gMLyWmUIM+GvQ4wkaosGerHCiBwvNi+43asslNAr23oG+1Q/bC6SYMjX0O/e7yu0
 yPipkNTWq5iyNhRK5isXQPx9KhxFwj821LJywu6rfwTCZx52asYxU/xU+j543AAOFeAC
 q1nJkLJcNku3ZR/Aqx1L7qo8hst4IR0gYGJRkSQEJlHObR9/xcwJCbpJpSoE99o2N/ge
 6Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IG6cyA2PEBju74W6OZ9xTgqBPjnFRHCrixS8tldCOQ4=;
 b=lvSIKq/L/pr5qyBuz3z2XiXDVYv7f6DnURJ38rUgtbazTXv6O0b2DC6wZAntVZjFld
 a3ZzdLHzth3mubFuTasq57NNNxghiEmr5Prmmr93+1uWUmgYZJuV+y7rcdXlxktTOAjY
 ypw05UbQDi9i6THbSCOHv3tDkb/C9mj5SnXL3qB92IPCkeasWPS6MQlb+ggXF/VRjuvC
 UEH0V23E1y1hTyLLcCJD1bat0Y3aESFEy7C33l2/aGnlB023LbTlaV/B7IR5kYeF31N/
 oiBxZpTV3yH6CuNGqjLOqRhiSd8DHxb9tGE+gWtlS+IkLhSFZ/ZAKv1QhXaHXyU/IrQU
 5TmA==
X-Gm-Message-State: AOAM531ed+7lO/Y6Tk4cRbE9N0Kw9eDbA9LWIIKBST2HXKdOztJPGXZK
 seQCL5d5IbyeRcHVoQlALBA=
X-Google-Smtp-Source: ABdhPJxVpWasdjpezgcL8UqnvvI10G/t43xjTtNFk/sWDgjyjPzLN6xxlCTmj61XPa0LbqcNaTdC3g==
X-Received: by 2002:a63:b544:: with SMTP id u4mr38738300pgo.160.1641792144714; 
 Sun, 09 Jan 2022 21:22:24 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id i11sm5167623pfq.206.2022.01.09.21.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 21:22:24 -0800 (PST)
Date: Mon, 10 Jan 2022 15:22:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/6] KVM: PPC: Don't use pr_emerg when mmio emulation
 fails
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-4-farosas@linux.ibm.com>
In-Reply-To: <20220107210012.4091153-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1641791924.shozt0u4v5.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
> If MMIO emulation fails we deliver a Program interrupt to the
> guest. This is a normal event for the host, so use pr_info.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---

Should it be rate limited to prevent guest spamming host log? In the=20
case of informational messages it's always good if it gives the=20
administrator some idea of what to do with it. If it's normal
for the host does it even need a message? If yes, then identifying which
guest and adding something like "(this might becaused by a bug in guest=20
driver)" would set the poor admin's mind at rest.

Thanks,
Nick

>  arch/powerpc/kvm/powerpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 92e552ab5a77..4d7d0d080232 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -308,7 +308,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
> =20
>  		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>  		/* XXX Deliver Program interrupt to guest. */
> -		pr_emerg("%s: emulation failed (%08x)\n", __func__, last_inst);
> +		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>  		r =3D RESUME_HOST;
>  		break;
>  	}
> --=20
> 2.33.1
>=20
>=20
