Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 276FF314588
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:21:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQ8P53VSzDvY4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fVBcLtfS; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQ6N11TJzDsWZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:19:38 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id t25so11436801pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Q25NbHCvK7gvqlVtxwQxq2G5AgI2+835a54bSQpwDn0=;
 b=fVBcLtfSVh1eW6bR54qV61lT9c/3yOfFkQsVpj8aDzy7yF4JM51WSb78nXq2BP4l8K
 Sc6+GYZNMiGfdAzO+kPOxom2yHpPAGF0uKMSOrkOR0ufL9tEd6nYPp2996EHlR+N95O3
 OyGJoIy22guFiH0zI9nEN7AW+c4iKCuVXeV5u/V1rmNOhPaug0POjvt/VLMshYfB97vj
 YZw7h9QaWbUxeGAt+KNe2j7AkLQx6bjUmRix2etrBdNa8HQU50fQdEWzbE9uIVZJpxM7
 u77jpzh12Ubum+RoepuJCgUJd3Uk3R9CU4Jyl8iNfwUrammzHO2BJvgC7GA1vi1an+s7
 I5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Q25NbHCvK7gvqlVtxwQxq2G5AgI2+835a54bSQpwDn0=;
 b=uirqE97AqpPiXXv33lAkS4UHVRL93UN2nSZKIlKB3xp83yWYy3vxFM04bP9mYII9Ic
 hxppV8PffG4wUOxrZoRQrjKreKBez+nTkJ+ZEUweeVVDWRCoHt+kz6yg8MyaMXvhWESr
 Xbr8YavlH3UoYz9DEEEk3gg0hApmssJ2H+u1tWpp860YOx+PP/RRYgGrWQCf84lsrRp6
 yX9/6lZjZqdZLjuiqqLEORa4ZKen9jDS8+KHmwgL2hsvsxWDxfVwlFP1qfC4q5teVAxQ
 JWO0e6bhBvnL2HNzAAHWcTkNVRr9bjIVkWh04/ldtssUQSHuB2KSixtB7sNuudypKK7o
 x/Ug==
X-Gm-Message-State: AOAM533vVfH5zcK0CaI19DuJkWIPbCi8MLrdIEcbD5Lhn6I0JBKFMuBl
 lmaqaacjFOzHIpyEvKsTeEA=
X-Google-Smtp-Source: ABdhPJzo7j0aNVm/5aQtvGOfxjMGTHBx6h3FhDPMEKMjhASiAoAzlgfYIRECX8l6+Hb6vBjvgl8C5Q==
X-Received: by 2002:a63:545f:: with SMTP id e31mr17576118pgm.212.1612833575735; 
 Mon, 08 Feb 2021 17:19:35 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id b15sm14391884pgj.84.2021.02.08.17.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:19:34 -0800 (PST)
Date: Tue, 09 Feb 2021 11:19:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 07/22] powerpc/irq: Add stub irq_soft_mask_return() for
 PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <9b9f62c5e2e63cc121fd749a923aaaee92ee0da4.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <9b9f62c5e2e63cc121fd749a923aaaee92ee0da4.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612833316.dhtxt2p9gu.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> To allow building syscall_64.c smoothly on PPC32, add stub version
> of irq_soft_mask_return().
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Same kind of comment as the other soft mask stuff. Again not a big deal=20
but there might be a way to improve it. For example make a
debug_syscall_entry(regs) function that ppc64 could put the soft mask
checks into.

No big deal, if you don't make any changes now I might see about doing=20
something like that after your series goes in.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/hw_irq.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 4739f61e632c..56a98936a6a9 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -330,6 +330,11 @@ static inline void irq_soft_mask_regs_set_state(stru=
ct pt_regs *regs, unsigned l
>  }
>  #else /* CONFIG_PPC64 */
> =20
> +static inline notrace unsigned long irq_soft_mask_return(void)
> +{
> +	return 0;
> +}
> +
>  static inline unsigned long arch_local_save_flags(void)
>  {
>  	return mfmsr();
> --=20
> 2.25.0
>=20
>=20
