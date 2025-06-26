Return-Path: <linuxppc-dev+bounces-9803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94317AE9A06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 11:31:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSYNN68Ghz2xYl;
	Thu, 26 Jun 2025 19:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750930292;
	cv=none; b=B/dDd2JfE9gQkbyc93bSMRUjx9pKzkgn3vqHENlCeejW2AAoX6qtQXLJt1CqFDOWK8zf84OXhKqd0zMqI7CRD+69nbRO8xAaZgwnoadqMLJyAQKeHx1S8Rma30GIIKH3PyJMrWUWxV0IYAfZFTTjoSWMvg6JQq4EY0/YHSfiQs6uv+2tUPAKEwGz/PfdGqElPm/x0bxdBl0xL4+qKln5/v+bANlScxPiOJY1s5oU1dGqVOM+Cfm8B2CNpji88HeWk2ADEFUaTfLzFOxTeZPiHrdBmIIglBWVauuYaduNf4glThP4Czd0G0fA3SAGY50VW+2t7s9tpFdamXX6uxtTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750930292; c=relaxed/relaxed;
	bh=iuFmqpRengejqXGMt8z0krXQLsPU94kcoziX8PACH+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oetHe4cN+B2pGy85nDJTVe4wNsmdm2PF4GVFooGNwX+OmnoyiozrIijej0mzbHGAvPBaIWBPdJpsuMd8XM8yDnIh9OdcUgxHnbKm1KwAWAkqcOiQxMg1Q8Bn/DJZU95SASiriMcjgzGAaEsZnpGb4dHr1Hh+jd73wZcyfFepenNOr0bh+CCEbNtb2JrLcdufFdyf8jA+np79XNQ77BSRqxL/m9UDOL6/y5gJnsjLQELNKeKUjhxKGQTZotrJ9HMS+FqUdj/wW84SEy17yFkCyDrnJ3SqW7rU6uMmwJY5bIr0QwHWjIm9viKSMhRM1eMxMa9PdpfYEVU9ImHds/ZEKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hrEnCOWe; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hrEnCOWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSYNJ27vyz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 19:31:27 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553644b8f56so739420e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750930283; x=1751535083; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuFmqpRengejqXGMt8z0krXQLsPU94kcoziX8PACH+I=;
        b=hrEnCOWe+ZfEMAipNKH6E8QKCzi02ws+5MKOnj7q84veltrnUul0K3Tg7+cefwzTRw
         C/MP38LiuobDNnI9VWdiLgc8RpXs7hm1MHEf9NLzZXFRJQ/akxCxI97wdRZS0YlxWEJB
         vraREw5peZ1j5z1B8yL9i/SLZD/mXxYKhCNQUEWiGaiHBYxYE0OHPerOo5iwZRxZANtz
         0wfDM3u1akV2yOwnWIYIwe/QJIuRlatSGHWpmMeITcdettEHK+pirO2dpcqmF33kMjJ2
         H0YJQ4OTDXrlJr9+8XRuo64Vbg4H6Rnd3E4/E9MP/yBXFuJDBA5/8ji6NGgiNlH3h+jx
         nZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930283; x=1751535083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuFmqpRengejqXGMt8z0krXQLsPU94kcoziX8PACH+I=;
        b=L+3MLMVF1205dHhefgAXlQJlwBO6gZYCeJXS3ekmXbQx9MO60NzYqJQe15NYE2hL2j
         CwSaJpgDliW68dvQ7deSJViRibHMG982lcBrkBjVIWTBRhGA013pNHdUpqV4UIM45wSz
         dfPG0Qn3dIBmaBZz6+iuoO4VCS+98vXtak8anGBcq7n5q9HPK9LkUTswdh+V2Q29+Mam
         JuAfeIRzsxpj0nuXhEt+whURWFHz7W7z7oFFliOBYf6iRmgxkrPP+t+giY0tfysNiKhk
         5tHcTLI0R3U1hq1FB2bW6CUJ02e6fYxVaVslUIndOmk3O7ouqwgCZlxcHMoHkWhPvmar
         roQA==
X-Forwarded-Encrypted: i=1; AJvYcCVidxNRe89WCEahrwWe6ZPWKLsRbvJiRRFADXlzhP73HR7mklyOpxoIQLAur0t7efAXyaLvDEzpABvd8y8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRQWMeb62MqMzdL2ZBMPStngT/VAqSyAYgP6ZLq4ZXZH9uarSP
	MeFV9L5u3zlQb0VgqY4Jar/Hr788DPDcokiez5u2hFVHDFIQEmWnN+YBi3coYY0DQk0suVcqhPC
	56nOq95n2nHqzrkuwzPfbkuf4aDx3asM=
X-Gm-Gg: ASbGncs/9OEar0KHKpbG7JQH1VJXwA45XpYmn2crXDGeXAzzVCDVFarY6TlZgPW+byj
	V3jq32nBzCcygG7B/40BoOMmFwH6U8F6e4qOAta9yI0BbjbfYsfe8D6DmeyNdmNSKOmKoqtBCwL
	Every72Ef6RsWfupAy7UPaTLpmI/hA4DsuvF49bTQJEEwUM/lshN1X
X-Google-Smtp-Source: AGHT+IHKD9vv7E6n80MsMeNjpJwBWGKsDmTjk3A0J3+cAywyuJ59mQfEiaL2YVTpTIc2tcdraTY+Dh5qWDg83RmXaIY=
X-Received: by 2002:a05:6512:1150:b0:553:36b7:7b14 with SMTP id
 2adb3069b0e04-554fdf96ec2mr2102615e87.37.1750930282937; Thu, 26 Jun 2025
 02:31:22 -0700 (PDT)
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
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-2-snovitoll@gmail.com>
 <db30beb6-a331-46b7-92a3-1ee7782e317a@csgroup.eu>
In-Reply-To: <db30beb6-a331-46b7-92a3-1ee7782e317a@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 26 Jun 2025 14:31:05 +0500
X-Gm-Features: Ac12FXyxTyp0b2hD3uhdVzbeUTYpXnyKRANJYa2mQoNch15i1MQX1xBLZECmC3k
Message-ID: <CACzwLxj3KWdy-mBu-te1OFf2FZ8eTp5CieYswF5NVY4qPWD93Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] kasan: unify static kasan_flag_enabled across modes
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, dave.hansen@linux.intel.com, luto@kernel.org, 
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

On Wed, Jun 25, 2025 at 3:35=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit :
> > Historically the fast-path static key `kasan_flag_enabled` existed
> > only for `CONFIG_KASAN_HW_TAGS`. Generic and SW_TAGS either relied on
> > `kasan_arch_is_ready()` or evaluated KASAN checks unconditionally.
> > As a result every architecture had to toggle a private flag
> > in its `kasan_init()`.
> >
> > This patch turns the flag into a single global runtime predicate that
> > is built for every `CONFIG_KASAN` mode and adds a helper that flips
> > the key once KASAN is ready.
>
> Shouldn't kasan_init_generic() also perform the following line to reduce
> even more code duplication between architectures ?
>
>         init_task.kasan_depth =3D 0;

I've tried to introduce a new function kasan_mark_ready() to gather
all arch duplicated code in one place:

In mm/kasan/common.c:

void __init kasan_mark_ready(void)
{
        /* Enable error reporting */
        init_task.kasan_depth =3D 0;
        /* Mark KASAN as ready */
        static_branch_enable(&kasan_flag_enabled);
}

So we could've called it
in mm/kasan/generic.c:
void __init kasan_init_generic(void)
{
        kasan_mark_ready();
        pr_info("KernelAddressSanitizer initialized (generic)\n");
}

in mm/kasan/sw_tags.c:
void __init kasan_init_sw_tags(void)
{
...
        kasan_mark_ready();
        pr_info("KernelAddressSanitizer initialized ..");
}

in mm/kasan/hw_tags.c:
void __init kasan_init_hw_tags(void)
{
...
        kasan_mark_ready();
        pr_info("KernelAddressSanitizer initialized ..");
}

But it works only for CONFIG_KASAN_GENERIC mode,
when arch code calls kasan_init(), for example, arm64:

void __init kasan_init(void)
{
        kasan_init_shadow();
        kasan_init_generic();
}

And for HW_TAGS, SW_TAGS it won't work.
Fails during compiling:
mm/kasan/common.c:45:12: error: no member named 'kasan_depth' in
'struct task_struct'
   45 |         init_task.kasan_depth =3D 0;

because kasan_init_sw_tags(), kasan_init_hw_tags() are called
once on CPU boot. For arm64, where these KASAN modes are supported,
both functions are called in smp_prepare_boot_cpu().

So I guess, every arch kasan_init() has to set in kasan_init()
       init_task.kasan_depth =3D 0;
to enable error messages before switching KASAN readiness
via enabling kasan_flag_enabled key.

>
> Christophe
>

