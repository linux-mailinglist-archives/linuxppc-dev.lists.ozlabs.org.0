Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D539C46F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxgZ656L9z3bsf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 10:32:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=X074mGFT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X074mGFT; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxgYc38v3z2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 10:31:46 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id s14so7722595pfd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 17:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=MUq6X8/ZPIBrKdk3i3SE6IJReD3LrwPz//1n2EnyP3Q=;
 b=X074mGFT8XaS9PX3jk/A+Y5QmVPd3uxA8If6/e6C2ICQXasf98PrVS+wNyMdcKxZOo
 wwms5it3fD0KICYLv/aHwUrWzjADgMkMNSrtqnoM1U4q7EmoiHM5pwy3fUIV3a4s8+C8
 wrhA8BAUpJqLdkPdUJu/SHhn00mQSsNJ0mkv89Q4YfGcjSxlBG5mrPMqPh2hVz4Bhs6B
 bCQQAb4VB6h/9n3fRo0BoyqQe3kfi+6y0ay3C0D0nfGkjIQQDvq6yZrBdt45mm509iZO
 3QgRiElKJvfAIhmQXn0RAycoT8ThhOBxDkaeTZtqTiXT/4LjMHDMG5U7lBvi9PQtwWs9
 icVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=MUq6X8/ZPIBrKdk3i3SE6IJReD3LrwPz//1n2EnyP3Q=;
 b=cQLi/pgBr5cyBolrFAIZd/K6ZZokZ8CA7UsAMw0OnFoe5xZ+lpuaRJ+DhE8wsgBEmw
 FFV8AyTChLA9Y+wkakCs5xM6PFRCVcHZn4oT92OpaVWLrbjHmxdPuucsrMg5u4y6qH0B
 4Ve1kYY3YioosNTQKgj3OuRedZJFvwCeSHgRckVFvHdPKQZNl7geNu9nl39cpZ3MVmjf
 MUbvMhW70GJt0BnnvUJondDozG+RpuHD3nNFu5MFMwnJZZILSLSMxpXKxvGfxdLUxhux
 F3jCxmj9tJLX3TMwHgfbI9AFV+DWM9yqKju2Pk+ajuC7OhD5m2veL4pzGUBqZHtZwkoH
 ispQ==
X-Gm-Message-State: AOAM530R0z87KINClCxk7hT5clCvbjJakHEs8XFFeBsOapm9MwPp3ga8
 IerM9lGMbAVUSI2IVe4xH2w=
X-Google-Smtp-Source: ABdhPJwXiFnJQj4oLIJsGDkMxLgXqAQTko8IVI1OMYwx/T2aA9dKJF9QIzIoABl91TeiLJyK8K0lMQ==
X-Received: by 2002:a62:5444:0:b029:2e9:c69d:dc64 with SMTP id
 i65-20020a6254440000b02902e9c69ddc64mr6841873pfb.32.1622853102671; 
 Fri, 04 Jun 2021 17:31:42 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id 21sm2480032pfh.103.2021.06.04.17.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 17:31:42 -0700 (PDT)
Date: Sat, 05 Jun 2021 10:31:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/16] powerpc/vas: Create take/drop pid and mm
 references
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <16a319614a7ab4ce843f42a49c3ecf68ed03dd36.camel@linux.ibm.com>
 <1622693213.hz0uqko6dk.astroid@bobo.none>
 <6a67ebd5f728966312063e132c4f6aba70285c72.camel@linux.ibm.com>
In-Reply-To: <6a67ebd5f728966312063e132c4f6aba70285c72.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622852830.f2v4xyjvwu.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of June 4, 2021 2:08 pm:
> On Thu, 2021-06-03 at 14:21 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of May 21, 2021 7:31 pm:
>> > Take pid and mm references when each window opens and drops during
>> > close. This functionality is needed for powerNV and pseries. So
>> > this patch defines the existing code as functions in common book3s
>> > platform vas-api.c
>> >=20
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>>=20
>> Seems like a good idea to put these into their own helper functions.
>>=20
>> > ---
>> >  arch/powerpc/include/asm/vas.h              | 25 +++++++++
>> >  arch/powerpc/platforms/book3s/vas-api.c     | 51
>> > ++++++++++++++++++
>> >  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
>> >  arch/powerpc/platforms/powernv/vas-window.c | 57 ++---------------
>> > ----
>> >  arch/powerpc/platforms/powernv/vas.h        |  6 +--
>> >  5 files changed, 88 insertions(+), 61 deletions(-)
>> >=20
>> > diff --git a/arch/powerpc/include/asm/vas.h
>> > b/arch/powerpc/include/asm/vas.h
>> > index 668303198772..3f2b02461a76 100644
>> > --- a/arch/powerpc/include/asm/vas.h
>> > +++ b/arch/powerpc/include/asm/vas.h
>> > @@ -5,6 +5,9 @@
>> > =20
>> >  #ifndef _ASM_POWERPC_VAS_H
>> >  #define _ASM_POWERPC_VAS_H
>> > +#include <linux/sched/mm.h>
>> > +#include <linux/mmu_context.h>
>> > +#include <asm/icswx.h>
>> >  #include <uapi/asm/vas-api.h>
>> > =20
>> >  struct vas_window;
>> > @@ -49,6 +52,17 @@ enum vas_cop_type {
>> >  	VAS_COP_TYPE_MAX,
>> >  };
>> > =20
>> > +/*
>> > + * User space VAS windows are opened by tasks and take references
>> > + * to pid and mm until windows are closed.
>> > + * Stores pid, mm, and tgid for each window.
>> > + */
>> > +struct vas_user_win_ref {
>> > +	struct pid *pid;	/* PID of owner */
>> > +	struct pid *tgid;	/* Thread group ID of owner */
>> > +	struct mm_struct *mm;	/* Linux process mm_struct */
>> > +};
>> > +
>> >  /*
>> >   * User space window operations used for powernv and powerVM
>> >   */
>> > @@ -59,6 +73,16 @@ struct vas_user_win_ops {
>> >  	int (*close_win)(void *);
>> >  };
>> > =20
>> > +static inline void vas_drop_reference_pid_mm(struct
>> > vas_user_win_ref *ref)
>> > +{
>> > +	/* Drop references to pid and mm */
>> > +	put_pid(ref->pid);
>> > +	if (ref->mm) {
>> > +		mm_context_remove_vas_window(ref->mm);
>> > +		mmdrop(ref->mm);
>> > +	}
>> > +}
>>=20
>> You don't have to make up a new name for such a thing because you=20
>> already have one
>>=20
>> put_vas_user_win_ref(struct vas_user_win_ref *ref)
>>=20
>>=20
>> > +
>> >  /*
>> >   * Receive window attributes specified by the (in-kernel) owner of
>> > window.
>> >   */
>> > @@ -192,4 +216,5 @@ int vas_register_coproc_api(struct module *mod,
>> > enum vas_cop_type cop_type,
>> >  			    struct vas_user_win_ops *vops);
>> >  void vas_unregister_coproc_api(void);
>> > =20
>> > +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref);
>> >  #endif /* __ASM_POWERPC_VAS_H */
>> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
>> > b/arch/powerpc/platforms/book3s/vas-api.c
>> > index 6c39320bfb9b..a0141bfb2e4b 100644
>> > --- a/arch/powerpc/platforms/book3s/vas-api.c
>> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
>> > @@ -55,6 +55,57 @@ static char *coproc_devnode(struct device *dev,
>> > umode_t *mode)
>> >  	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
>> >  }
>> > =20
>> > +/*
>> > + * Take reference to pid and mm
>> > + */
>> > +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref)
>> > +{
>>=20
>> So this is quite different from a typical refcount object in that
>> it's=20
>> opening it for access as well. I would split it in two functions, one
>> matching put_vas_user_win_ref() and appearing in the same place in
>> code,
>> which is up to about mmput and another function that adds the window
>> and
>> does the CP_ABORT etc... hmm, where do you release tgid?
>=20
> Basically copied the existing code in to these functions
> (vas_reference_pid_mm/vas_drop_reference_pid_mm) so that useful for
> both platforms.=20
>=20
> mm_context_add/remove_vas_window() is also like taking reference. So
> instead of adding 2 seperate functions, how about naming
> get/put_vas_user_win_ref()=20

It's actually different though. What I'm asking is the parts where you=20
interact with core kernel data structure refcounts go into their own=20
get/put functions.

Someone who understands that refcounting and looks at the code will care=20
about those bits, so having them all together I think is helpful. They=20
don't know about adding vas windows or CP_ABORT.

> Regarding tgid, the reference is taking only with pid, but not tgid.
> pid reuse can happen only in the case of multithread applications when
> the child that opened VAS window exits. But these windows will be
> closed when tgid exists. So do not need tgid reference.

I don't understand you.  The code you added does take a reference to=20
tgid...

>> > +	/*
>> > +	 * Window opened by a child thread may not be closed when
>> > +	 * it exits. So take reference to its pid and release it
>> > +	 * when the window is free by parent thread.
>> > +	 * Acquire a reference to the task's pid to make sure
>> > +	 * pid will not be re-used - needed only for multithread
>> > +	 * applications.
>> > +	 */
>> > +	task_ref->pid =3D get_task_pid(current, PIDTYPE_PID);

My question is, where is this reference released. I can't see it. I'm=20
asking about existing upstream code really because this patch is just=20
copying existing code around.

Thanks,
Nick

