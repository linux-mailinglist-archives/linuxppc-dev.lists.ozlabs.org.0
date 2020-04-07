Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3503A1A03E4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 02:53:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x8636bPrzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:53:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CqEj5G+G; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x84P1Y8QzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 10:51:47 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a24so8462843pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 17:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=tAw8KW0bFK0Yz8fIQWiF5l2yjocFDcbB0anIbqS6PMQ=;
 b=CqEj5G+G1Sj4eY6jp4z1gwYVVfP3ETQnuFn7UF14pAzWnqbjMtwoznXsx7fbhBZ3xx
 SfE7Wcbx04ZI0XVPq+w0HsmW6uLefMOG6+x/k1RYvEaUjUoTBZ1xMHzuJYN2VfDMo+rN
 xwbW3q//wywrDHb3RgR8RnRdXvYXUfHFmvXA2GjclllReOVuFY3IcPOr6lySEPouZvTI
 SZaWhnsVBPesQsSW59bWFclTF+EZ2amlNN+n38mbG9tssPXWypwA/q2SGOfFgqnfj9HI
 XIHrmdopSuoZ1bTv193cBLOYcZJqpaWksg9cLZ60IFbf5laJuNZjUXuIXybMHqhnZunN
 T98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=tAw8KW0bFK0Yz8fIQWiF5l2yjocFDcbB0anIbqS6PMQ=;
 b=DvRpr3Cj4Qg7OZ6jIUMFRUpXgdARYt48wCtYxfQDYRV8ETceDeTzM7u12mU7QjVjrw
 4iwCOM4VvKrNRYleathMWslS5KqfzUEJ/PlFoDXY5mZcJImqUv37gISk31DcGfVKZE56
 TKesi4LSygjVCtvzvvKOmDFBkmfHiEiJvCneEKk26TXZFEe9MPCIay4Dn+zetbcfVslY
 pla3c3lL1vEahxf7BCxOpAgmQwim8+rOciMPmzlonR1Vet30/9fKiJZMts9D2awVvpGm
 C0yCobJsk/Y6DBM41x0f0Gr+0wy5jLkYb/cmI75MY7GUro51EgfheGCtCM/KDX3gQ1sk
 IppA==
X-Gm-Message-State: AGi0PuYfx+1SQapW6txpuR/yLAHjyAHKPOpzqcLgFIoJ/iECVRhpokp+
 xRUy08SM/XynVUZxNdwv4PA=
X-Google-Smtp-Source: APiQypJiXLxaPiaqtXc+2hUQni5NRszaSjpfE6ESZh4OGo/SjydSw+b7jjk1VPM3FGSAKr2kgTwqcA==
X-Received: by 2002:a65:670e:: with SMTP id u14mr1842173pgf.264.1586220705440; 
 Mon, 06 Apr 2020 17:51:45 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o15sm11699220pgj.60.2020.04.06.17.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 17:51:44 -0700 (PDT)
Date: Tue, 07 Apr 2020 10:50:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v3 05/15] powerpc/irq: Add helpers to get and set
 regs->softe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
 <f9f0bd58f9e75e8e3826f25d9db9ff2c6ad9c84b.1586196948.git.christophe.leroy@c-s.fr>
In-Reply-To: <f9f0bd58f9e75e8e3826f25d9db9ff2c6ad9c84b.1586196948.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586219567.cl8bye6kgu.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 7, 2020 4:16 am:
> regs->softe doesn't exist on PPC32.
>=20
> Add helpers to get and set regs->softe.
> Those helpers will void on PPC32.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index e0e71777961f..e69466867d5f 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -39,6 +39,8 @@
>  #define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE)
>  #endif
> =20
> +#endif /* CONFIG_PPC64 */
> +
>  /*
>   * flags for paca->irq_soft_mask
>   */
> @@ -47,8 +49,6 @@
>  #define IRQS_PMI_DISABLED	2
>  #define IRQS_ALL_DISABLED	(IRQS_DISABLED | IRQS_PMI_DISABLED)
> =20
> -#endif /* CONFIG_PPC64 */
> -
>  #ifndef __ASSEMBLY__
> =20
>  extern void replay_system_reset(void);
> @@ -282,6 +282,15 @@ extern void irq_set_pending_from_srr1(unsigned long =
srr1);
> =20
>  extern void force_external_irq_replay(void);
> =20
> +static inline unsigned long get_softe(struct pt_regs *regs)
> +{
> +	return regs->softe;
> +}
> +
> +static inline void set_softe(struct pt_regs *regs, unsigned long val)
> +{
> +	regs->softe =3D val;
> +}
>  #else /* CONFIG_PPC64 */
> =20
>  static inline unsigned long arch_local_save_flags(void)
> @@ -350,6 +359,14 @@ static inline bool arch_irq_disabled_regs(struct pt_=
regs *regs)
> =20
>  static inline void may_hard_irq_enable(void) { }
> =20
> +static inline unsigned long get_softe(struct pt_regs *regs)
> +{
> +	return 0;
> +}
> +
> +static inline void set_softe(struct pt_regs *regs, unsigned long val)
> +{
> +}

If this goes into a general shared header, I would prefer if we could
do something a bit more general (at least with the name).

I think get_softe() could just be replaced with arch_irq_disabled_regs().

For set, could we call it irq_soft_mask_regs_set_state()? 32 has no soft
mask state in regs, so it's more obvious that it's a no-op. Or you could
make 32-bit version a BUG(), and then always guard it with IS_ENABLED().

Thanks,
Nick
=
