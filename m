Return-Path: <linuxppc-dev+bounces-9857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1CAEC69A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jun 2025 12:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTqBC4z2Pz2xgX;
	Sat, 28 Jun 2025 20:57:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751108227;
	cv=none; b=dIjV0rLSRzIyHzC29RMJ8MmSkrdSqHUN3JIRCfX5wi2x4zyhc/fEe/6LmG66mceLEo0YODRVp5qcNjEq8ojUV8pgHHwrxukv7rdigul9ckIKJfGqxePU96CD3s1tGbRQOVlgggSFm/tfDv0lOURXWp4fkxABV7papGuKxlQVgbcIViaVnEhxuqotAvHHg6iICKgYmv7rE1h2ZRqx2eXVyUf8s/v4j7CQnJ6wKxzNDVJr5J4cPtJSDtT+kj3EP1kUY6X4IlAee5NJrV/fuiaQLEfY7xHzs/seejxfx2+eOC0uIRWh2N0M37RZ9MUlLU1KH0/JTQvdb7pSh55iMoUTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751108227; c=relaxed/relaxed;
	bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFXYHs7e+s3DWxGb3yfEqqtZqBpyDhPRmmQ7uKMWoaN1zTy33P3QPBI3wsldBQiA/4eSrRGKj8oRk5uL08PLg74aRtSXeCG4ughYbnU4j9G+OWfmWXRgJVzBN2IYNoMG29Q8s4a/L7GDcI4a26+C93kqxvoGiGeh2zhiX+hMvdFWWYiXPh6R/rTBz+w2wgYiMAk2vH4dywpkVcjONywB2g8ohnmgcqa/rwStkhg4jg8EB6b1zhQ3BXJzytkeiTnfWNJNxeh/a+en1D+vdGOxGNd9gYZHqpxNbWKl6ce4iv53Wa9xR+STKXhZ0IGMsEX6ZvnYwdEkt/GJFxmaeusT0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GzWhEt9E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GzWhEt9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTqB940RZz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 20:57:04 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1713817f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jun 2025 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751108219; x=1751713019; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
        b=GzWhEt9EdJMB/xmK+NXd/NVvTKOb/B3g6NrUFFfC18hO5Nlgc0KXlfOepvB2BuJuf/
         zm9uMKPDmzObcRTPdizyETkkuPAlE60Sc+PNDBo5ur8ZofS7ku8Xrr2O4h9l1hbBuIyM
         tshrnRHATHKiwJNFDs0XmjjV9dbJPNuvX+dqdITExNMurdFrjXdtUcN/1ibKWWgxOKDE
         KT0Yisxcjrv/lNoDnxcIRaf3gt0XWLTIh+Ga87kKpRs3GnSx7FSoG8tQzJRRCruswO/7
         +AYtx2UXIMzz4k593cMkbTohyC7+yO+a4S2qTNixZr1quG0L+vMOhKRuE0EiLwfhP2Hf
         Thew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751108219; x=1751713019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
        b=aiv0L8t/m2B1l2G10Q5MwAN92RMpT/B9dC304j0qowuk6aygGok7paU2Pzqwa10Qc0
         QhblVFIAtuoLAPPfznjqjtbY7R5k4iWafnJ0umHNKDoru+sLeJ/m3f+B33WRbZt8mG0u
         eclXIZXDBZYTeU2e2TFoNw5GUUdT8ddBeMbVoTtDWGoHnM0/oS8vRq6IfMgmRdB+XzjF
         08k+goyy7QU9vIAVHaNzp5alzkZO/yR0cuJapXFxzl/Dki4YmqUfmoR3hiMvm6e6T7fo
         HoPJLN9y3/q1wKjbc9Rb0SwQR9yw/DXMJJAUmlpQcMB8annM0TV4gDYavfW3EphOnXiY
         cWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoAkLmMBQQinGDIq4vDbMd7xwrRE+ZJ+D5Pfs4ly/J0y+TP3GbhaTUJhw8TMjjB5CJGOP5c4HDVdJ88h4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGhRL5eHsIyAAYrBqiJUNuBcc2L+1W34zlDM3JpVmyBt2WvI/9
	v2GcIF/CSCxSTydTH9WhcDvsbA0+4W1SFmcgjox6WKBHDecfanXjjRT4AxQQDqp3yNi+53vhAEt
	qhYnZEIdJvawt006+aefb0EsYoV7D5vs=
X-Gm-Gg: ASbGncvpJE1HnCyH7r2KGNSdN44tdhonhf/15srK9LTKi/B56UKhgWssAKsLAmX66e9
	KnRzvJ8Sk1FCQRdlP2z9qwKdkdD494UMj52VqjmuvwNau7a2PipY10uC1+Z68++VI/pBirDTqKT
	iO0XctfwwFCSO58V/8re7SF/ZUQNQTzY7lM0I/U6R/bmuo0GQ/O/RR/t4V
X-Google-Smtp-Source: AGHT+IGAGkRhQdbRpH6HhS1J+gxMpfj97HGV7cZaVPURx7gE9Aj/9LEPZdgznOP2vFFz/ZEWLwEewnTNwxfxlbsYcE0=
X-Received: by 2002:adf:a1cb:0:b0:3a5:3b14:1ba3 with SMTP id
 ffacd0b85a97d-3a90b8c99bdmr4338216f8f.49.1751108219175; Sat, 28 Jun 2025
 03:56:59 -0700 (PDT)
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
References: <20250626153147.145312-1-snovitoll@gmail.com>
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 28 Jun 2025 12:56:46 +0200
X-Gm-Features: Ac12FXzas27xdNkixqmlGojlaGpK_Gh1QoVs4xiB8K_jsjOjMmn0UG8i3tUlU1Q
Message-ID: <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, arnd@arndb.de, rppt@kernel.org, 
	geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com, 
	tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 5:32=E2=80=AFPM Sabyrzhan Tasbolatov
<snovitoll@gmail.com> wrote:
>
> This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
> interfaces by extending the existing kasan_enabled() infrastructure to
> work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).
>
> Currently, kasan_enabled() only works for HW_TAGS mode using a static key=
,
> while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
> constant) or rely on architecture-specific kasan_arch_is_ready()
> implementations with custom static keys and global variables.
>
> This leads to:
> - Code duplication across architectures
> - Inconsistent runtime behavior between KASAN modes
> - Architecture-specific readiness tracking
>
> After this series:
> - All KASAN modes use the same kasan_flag_enabled static key
> - Consistent runtime enable/disable behavior across modes
> - Simplified architecture code with unified kasan_init_generic() calls
> - Elimination of arch specific kasan_arch_is_ready() implementations
> - Unified vmalloc integration using kasan_enabled() checks
>
> This addresses the bugzilla issue [1] about making
> kasan_flag_enabled and kasan_enabled() work for Generic mode,
> and extends it to provide true unification across all modes.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217049

Hi Sabyrzhan,

Thank you for working on this!

One aspect that is missing from the patches is moving the
kasan_arch_is_ready() calls into the include/linux/kasan.h (this is
not explicitly mentioned in the issue, but this is what the "adding
__wrappers" part is about).

Another thing that needs careful consideration is whether it's
possible to combine kasan_arch_is_ready() and kasan_enabled() into the
same check logically at all. There's one issue mentioned in [1]:

> In kasan_cache_create() we unconditionally allocate a metadata buffer,
> but the kasan_init_slab_obj() call to initialise it is guarded by
> kasan_enabled(). But later parts of the code only check the presence of
> the buffer before using it, so bad things happen if kasan_enabled()
> later turns on (I was getting some error about invalid lock state).

And there might be other callbacks that should be executed even before
kasan_init_...() completes. But then for the HW_TAGS mode, if
kasan_enabled() is off, then we don't want to execute any callbacks.

So maybe we do actually need a separate static key for
kasan_arch_is_ready(). But even if so, it still makes sense to move
kasan_arch_is_ready() into the __wrappers for the affected callbacks.

Thanks!

[1] https://lore.kernel.org/linux-mm/CA+fCnZf7JqTH46C7oG2Wk9NnLU7hgiVDEK0EA=
8RAtyr-KgkHdg@mail.gmail.com/

