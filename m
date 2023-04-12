Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF966DF763
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 15:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxP1r1yDtz3cjT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 23:38:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=B/jjBNST;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=B/jjBNST;
	dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxP0w3f0Vz3ccn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 23:38:06 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id p23so4367558qki.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681306682; x=1683898682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWdLpuhyNb11g+2phf0ujfTe5bokf6y5zMA0DxQiBiA=;
        b=B/jjBNSTypcC+joaCW6KBpHZMJp0zGfpqOXg+zBPIJ4NWlwYrPSMxjdSJy75T7U+3W
         U3p3HotHjbkZlaRKmFC8qc1Afx6oeTJ5uQpH2hG5w6sceSXtWvhwqD0ty4GTJOrTqqUL
         idO/30jacGJYN69+SVScPsn3OHD9k8oRdDeFIGHLcMZu3eu8rF9Xwdo+4T1+slcDtYsU
         YH0NOP8VGLe82rREMYx2QH+7wkX8dWpsJjPbWWLufPzhXmFeBT9DiKG3mgcWZ9nD2lka
         J4Q7aWlsb6BWQEoFbqY6WJkyrIjqnRCGYJf4CUJlNWaYPJ0je3GRhXlmjShv2pC79kPd
         uijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681306682; x=1683898682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWdLpuhyNb11g+2phf0ujfTe5bokf6y5zMA0DxQiBiA=;
        b=rXazwzfcJK/OwMJIeN92BujujJNSG9F4qp1lvOMpTxKbK7ENnImwsIxRL3qduAWuP0
         V99e5VPXcYoeaISrmKCzpsxKefPULCKbypyNMsAGdgKw4TaUqe5ZP5Yl6QtvW2Wxg/eK
         yU3bjLsMPk7TNIgXnwQtcKGXKMpfo2y+IxNPACZugt4oyzp08NzMk6SpBPmFqdn5xBFn
         3dEZQkoTfCGtnR1XuoHs0prI9Z+0XB+cSWRnTLkzS8oruqHF9xfnGyeg4Zj4XbDPMDhs
         6utluIZCtHc/2bwu21EAFoT8ZjsWQU2qus3BZi+7O+4ner5WYu61oSQfIjnjn0I8JzXR
         RQRg==
X-Gm-Message-State: AAQBX9e8zJ8es5R4IIXk141f5biOmM6dpZSYUixBEECy+7CrD9ofyuDB
	rS5EtPvYGXPADcPlFilM9p+P1vEBvIPXMpDp4IY=
X-Google-Smtp-Source: AKy350bQZX93U7KKOQF4PJTiOvTycKd+ntmsVru9e/foHUOInkoawqILTSPuq4LXHeg8osg4IFMokyT1/kYfdkvFekQ=
X-Received: by 2002:a05:620a:4482:b0:746:83cd:8d1d with SMTP id
 x2-20020a05620a448200b0074683cd8d1dmr2165203qkp.6.1681306681702; Wed, 12 Apr
 2023 06:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230405141710.3551-1-ubizjak@gmail.com> <20230405141710.3551-4-ubizjak@gmail.com>
 <20230412113231.GA628377@hirez.programming.kicks-ass.net>
In-Reply-To: <20230412113231.GA628377@hirez.programming.kicks-ass.net>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 12 Apr 2023 15:37:50 +0200
Message-ID: <CAFULd4aCNNcyQm3Av+KkWVXuU9Cb0G5H5cFmqVR_T5LwCW=YJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 1:33=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 05, 2023 at 04:17:08PM +0200, Uros Bizjak wrote:
> > diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/as=
m/local.h
> > index bc4bd19b7fc2..45492fb5bf22 100644
> > --- a/arch/powerpc/include/asm/local.h
> > +++ b/arch/powerpc/include/asm/local.h
> > @@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, lon=
g o, long n)
> >       return t;
> >  }
> >
> > +static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
> > +{
> > +     long o =3D *po, r;
> > +
> > +     r =3D local_cmpxchg(l, o, n);
> > +     if (unlikely(r !=3D o))
> > +             *po =3D r;
> > +
> > +     return likely(r =3D=3D o);
> > +}
> > +
>
> Why is the ppc one different from the rest? Why can't it use the
> try_cmpxchg_local() fallback and needs to have it open-coded?

Please note that ppc directly defines local_cmpxchg that bypasses
cmpxchg_local/arch_cmpxchg_local machinery. The patch takes the same
approach for local_try_cmpxchg, because fallbacks are using
arch_cmpxchg_local definitions.

PPC should be converted to use arch_cmpxchg_local (to also enable
instrumentation), but this is not the scope of the proposed patchset.

Uros.
