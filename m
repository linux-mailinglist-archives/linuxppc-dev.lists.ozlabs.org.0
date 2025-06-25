Return-Path: <linuxppc-dev+bounces-9760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF6AE857C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 16:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3Rp3hWWz3bkg;
	Thu, 26 Jun 2025 00:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750855869;
	cv=none; b=Z2DE7oGzB1KCkANsgOkRI5vH7Rnm055dJ/Kb9W8oQioY/7rPQMHahl9x78BzhuE8dbZhr1p0iYrQNXmrTSkbsU2zdMMTpRIECmKVMxCshbIQ8ztAiFclzji/aNplwezFpZWdVA7M3OHv0++VzM0RZdGJpeUsHTj1zM76/jrI4IeO1SAljgkBn0C0o1wAzBI8RebemSBC9L2SlBPjWeHqOAibE1ji7NR+KU/lZvrXpODBTx4we0ywb2cXLvSn5IEvujNl7901o7zOqeftX1/NxZXvRSdECrUMnXNO0m0G1zXewXQi44b/5q/t/Teu87C6OLERwycxxdMzqELGiXAppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750855869; c=relaxed/relaxed;
	bh=CRwRhM1MtMEUcOGQgquJfle4LDepcccXWla+ZKxsdwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XK7aIxkgsaz9myx4ktn12hvDvysqBPIPIAhGCISFRa3NdPqZIlVQCOohzLmO6khC6miWtJpm3rN3P0bH85WixaJevwURj5i2LjhTzO4PAQSD5uUpRhfyxbOBOgLxv0aIFLTph92/ms9NLxs8wtA+FfJ70Dj4dg6xscUGCYcq5HxAzxEmPHl+BH8F2obzyEgGaqRSzS0CwSfFQYUwHRg80rg+HztNiLVJnSEFMlpKXZ9qWcX0VNGBFCxXiLtk8T3JjoSbngsIR1+FuJVn8UjV1J4sk9iHBQr17rZeXdJG7mkJj9FxeV9QlAkj3zf1isKRkMuaVWa9oGqqxMsOb4wrwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NTuYj7lD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NTuYj7lD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS1s84zqNz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 22:51:07 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553b3316160so5027755e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750855864; x=1751460664; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRwRhM1MtMEUcOGQgquJfle4LDepcccXWla+ZKxsdwI=;
        b=NTuYj7lD+CmrtCe76HYl23t4eHZnUpuLyxgWvGKBWGQrwHKj3CQIbchSK25CrTYQAL
         MwAMJz6H5K4qoESiMFWo6o8q/JVV+SYu41rzfIX79v6P21tc1EVk8E5YF+GBPStOvkkI
         qYSOUQfx3DAE2R1jEx3OoYWzG/QDN3YMbLJX37PcWbZa0YcF6gJPka7sg4dsyjubxCgY
         fUeQexRTviDsLbVSihS2ZHG/Pdd7AQaJqyEgLEX8Jvpd3RjjAb23vCqdlyYbO8hn1qT/
         UbU5q0tvM0Xqbsn154O+euLvDfATR9elfsIdiaMWpR6VVOryqYxBbGG3eCZKJxlXsDxt
         pcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855864; x=1751460664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRwRhM1MtMEUcOGQgquJfle4LDepcccXWla+ZKxsdwI=;
        b=Rg3pt4lUmQUgvc05aWGqlrMLPVb2czwukPfL+RFWO5T87N9BcHiC3/2/CTM3lmGe5f
         5psfDW2tPSCHlu5y9zmDSP7JA4UGrssWc5s0ss8jtZGc8qEGB3siEjIWPP3e8JOrR9mY
         934xEphHXtQAIbYSSlF6z/p+PW/fHyrZdTw4g1RkNtFcLAXRjIJrmFymHG+FbEkube6C
         qQlRoUJ8mNxMFcLvleCAGeCFE1PC/A9fYCa948AT5x98eV8ZjDekGIr/eXW86vJFLn56
         8i9Cqkwx/6wn2kZySJnOPcg2re1wn+NzzKYPjlfHBDpvh+NxG91n7Iggq6q1PsI0AU4p
         QlEg==
X-Forwarded-Encrypted: i=1; AJvYcCW8A4FfsksCQpBDkz3/+b3xcWuCO7zAOVbWNTpNWnWa6ISANLia6cOjttfGSI5+/7B6Pq3hOE6ePXYCczQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywq+Eq9kqS7UEPy7VeglClODXUZasMdA/0q1JANIMOutcl0QBzU
	ACj/IB3aqg7lQpxXIdmSdewUbyS4QCZC8cbOvrmQXSLImKfvynXNIkUvSvkynkuAyLlQl9Gca0S
	NZT2oPZ39A1yfL8Gh/JXsoc/TKlsImAU=
X-Gm-Gg: ASbGncuRl52GfF27xSXQbCoQN1wBzR5GlVvSc16yfpB1ihyfder8/g0Kb2rbkAHhZNs
	ehowrDDL39C4Wp5YfUREMKiSBSbPIq4N8qAQkSF7n18n4KRX6kGUQO7mxRhgjAbydbGDb43R3QH
	RHDodakjMwCX3lJPChN2zXepu2Z/fo4UxeQ99favwiUQ==
X-Google-Smtp-Source: AGHT+IH4AdTi7obPWXsCps0Kqqd3RJ5D/he3Lezfcy1G4Eg5fA0HGJmj1VDSyHt6qyIqHAybfxlMpWZQjVgI2Xx3Mto=
X-Received: by 2002:a05:6512:4011:b0:553:297b:3d45 with SMTP id
 2adb3069b0e04-554fde58124mr1020525e87.43.1750855863865; Wed, 25 Jun 2025
 05:51:03 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-3-snovitoll@gmail.com>
 <750b6617-7abf-4adc-b3e6-6194ff10c547@csgroup.eu> <81a8b60be5b99ecd9b322d188738016376aff4aa.camel@sipsolutions.net>
In-Reply-To: <81a8b60be5b99ecd9b322d188738016376aff4aa.camel@sipsolutions.net>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 25 Jun 2025 17:50:46 +0500
X-Gm-Features: Ac12FXwt1iee6Yaba3PMavifTn-RFaMv0HhE7s3qnJv0p52DgpRl1n7RcMDkzZs
Message-ID: <CACzwLxgCH6KuVDRS3d9MrmA=wY_rMA6R5TPB_v37BkD8-A9yuw@mail.gmail.com>
Subject: Re: [PATCH 2/9] kasan: replace kasan_arch_is_ready with kasan_enabled
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, geert@linux-m68k.org, 
	rppt@kernel.org, tiwei.btw@antgroup.com, richard.weiyang@gmail.com, 
	benjamin.berg@intel.com, kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 5:24=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Wed, 2025-06-25 at 12:27 +0200, Christophe Leroy wrote:
> >
> > Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit :
> > > Replace the existing kasan_arch_is_ready() calls with kasan_enabled()=
.
> > > Drop checks where the caller is already under kasan_enabled() conditi=
on.
> >
> > If I understand correctly, it means that KASAN won't work anymore
> > between patch 2 and 9, because until the arch calls kasan_init_generic(=
)
> > kasan_enabled() will return false.
> >
> > The transition should be smooth and your series should remain bisectabl=
e.
> >
> > Or am I missing something ?
> >
>
> Seems right to me, it won't work for architectures that define
> kasan_arch_is_ready themselves I think?
>
> But since they have to literally #define it, could #ifdef on that
> temporarily?

Thanks for catching it. You're right. I need to change the order of patches=
 :

- kasan: unify static kasan_flag_enabled across modes

, then we should apply arch specific changes
where we call kasan_init_generic in kasan_init.

- kasan: replace kasan_arch_is_ready with kasan_enabled

>
> johannes

