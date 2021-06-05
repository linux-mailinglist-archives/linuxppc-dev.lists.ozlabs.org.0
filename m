Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5939C55D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 05:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxkxH6vNRz3btd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 13:04:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NgyNMGpS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NgyNMGpS; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fxkwk2Nxmz301J
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 13:03:33 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d16so8754668pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jun 2021 20:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6ob8ViHrSzfg361BtFQpURsQIK3mlIA8DcA6xiMt0/Y=;
 b=NgyNMGpSYjP7VUSY93IXdD/QyYg3DCz1ccAM7E/Uwk8aVXPwQlLvCBXEDBTpTF15e+
 QSqU5R6WxYnUfme64iAVwJUW6EG8z+agcwGkvmAi3ELQZ77b4o5tCW9syrOKUd5/4o9v
 wenIyvk9hidY2qelEZ8AA9AYhz1LmmetpETYO561NmCTrZih8k6+BNploatx567MlPpo
 sDQo+N8wHil/uuUOmb8vYBDn9XX87SDKCwtWVodFQ9YbXGaDBncgRjKKXZp3aLkPMw6s
 u8Xn/zQn9VJFjD0Yi0A5eaTQf+ilsHFu6K0ovT2wcNkWsBjuP8qf7owL+1wVVYudb6CX
 Gn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6ob8ViHrSzfg361BtFQpURsQIK3mlIA8DcA6xiMt0/Y=;
 b=XzL+i3SPSepvQwupTBYj/ekj45HNZVGk6b4zbLj2B3+E998D+rxKTl61ydOgHistvB
 LEDPG0Rn0/tPXig9GfBN5VMtgYNyINrqQ6ITzLtXVMWXPt/7/+iGrSN0ylxZlZPZk+y0
 3o2vTczHbk8CLZK2MKTXg/cha9yua61gYkcAPwGCqtmjPvWGGN1EccKmNdOJ1GtSODSf
 POMUx1TgHOHoZrxCFMKNE9aapVBTvoDe4ztYg6CD9/JlES0lRyD3geAgLarkJ5/8y7mj
 ShStPMI/4kZteHmLCizi3nk3vhD5rsA7x9JHDoj/ZKzq5/oc4O4W7ok0YttQqleppHj2
 ccDA==
X-Gm-Message-State: AOAM5320MM86sVTsYssJ4IDeEEtIKVrUayGHZ5ns1lXjWEWy5PwDEb0X
 IYVis+9gNEVq/xzZNIdZ3vA=
X-Google-Smtp-Source: ABdhPJytZR+Q8T/wxrdX2fQki3D9fGBfBjDzsFlPeLcGujhHKDyEoD9EqJ8Ucjbaf/iPqb9DIkse8Q==
X-Received: by 2002:a63:2ac4:: with SMTP id q187mr5985345pgq.370.1622862209949; 
 Fri, 04 Jun 2021 20:03:29 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id u23sm3508402pgk.38.2021.06.04.20.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 20:03:29 -0700 (PDT)
Date: Sat, 05 Jun 2021 13:03:24 +1000
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
 <1622852830.f2v4xyjvwu.astroid@bobo.none>
In-Reply-To: <1622852830.f2v4xyjvwu.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1622862059.kaqxo7y4wv.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of June 5, 2021 10:31 am:
> Excerpts from Haren Myneni's message of June 4, 2021 2:08 pm:
>> On Thu, 2021-06-03 at 14:21 +1000, Nicholas Piggin wrote:
>>> Excerpts from Haren Myneni's message of May 21, 2021 7:31 pm:
>>> > Take pid and mm references when each window opens and drops during
>>> > close. This functionality is needed for powerNV and pseries. So
>>> > this patch defines the existing code as functions in common book3s
>>> > platform vas-api.c
>>> >=20
>>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>>>=20
>>> Seems like a good idea to put these into their own helper functions.
>>>=20
>>> > ---
>>> >  arch/powerpc/include/asm/vas.h              | 25 +++++++++
>>> >  arch/powerpc/platforms/book3s/vas-api.c     | 51
>>> > ++++++++++++++++++
>>> >  arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++--
>>> >  arch/powerpc/platforms/powernv/vas-window.c | 57 ++---------------
>>> > ----
>>> >  arch/powerpc/platforms/powernv/vas.h        |  6 +--
>>> >  5 files changed, 88 insertions(+), 61 deletions(-)
>>> >=20
>>> > diff --git a/arch/powerpc/include/asm/vas.h
>>> > b/arch/powerpc/include/asm/vas.h
>>> > index 668303198772..3f2b02461a76 100644
>>> > --- a/arch/powerpc/include/asm/vas.h
>>> > +++ b/arch/powerpc/include/asm/vas.h
>>> > @@ -5,6 +5,9 @@
>>> > =20
>>> >  #ifndef _ASM_POWERPC_VAS_H
>>> >  #define _ASM_POWERPC_VAS_H
>>> > +#include <linux/sched/mm.h>
>>> > +#include <linux/mmu_context.h>
>>> > +#include <asm/icswx.h>
>>> >  #include <uapi/asm/vas-api.h>
>>> > =20
>>> >  struct vas_window;
>>> > @@ -49,6 +52,17 @@ enum vas_cop_type {
>>> >  	VAS_COP_TYPE_MAX,
>>> >  };
>>> > =20
>>> > +/*
>>> > + * User space VAS windows are opened by tasks and take references
>>> > + * to pid and mm until windows are closed.
>>> > + * Stores pid, mm, and tgid for each window.
>>> > + */
>>> > +struct vas_user_win_ref {
>>> > +	struct pid *pid;	/* PID of owner */
>>> > +	struct pid *tgid;	/* Thread group ID of owner */
>>> > +	struct mm_struct *mm;	/* Linux process mm_struct */
>>> > +};
>>> > +
>>> >  /*
>>> >   * User space window operations used for powernv and powerVM
>>> >   */
>>> > @@ -59,6 +73,16 @@ struct vas_user_win_ops {
>>> >  	int (*close_win)(void *);
>>> >  };
>>> > =20
>>> > +static inline void vas_drop_reference_pid_mm(struct
>>> > vas_user_win_ref *ref)
>>> > +{
>>> > +	/* Drop references to pid and mm */
>>> > +	put_pid(ref->pid);
>>> > +	if (ref->mm) {
>>> > +		mm_context_remove_vas_window(ref->mm);
>>> > +		mmdrop(ref->mm);
>>> > +	}
>>> > +}
>>>=20
>>> You don't have to make up a new name for such a thing because you=20
>>> already have one
>>>=20
>>> put_vas_user_win_ref(struct vas_user_win_ref *ref)
>>>=20
>>>=20
>>> > +
>>> >  /*
>>> >   * Receive window attributes specified by the (in-kernel) owner of
>>> > window.
>>> >   */
>>> > @@ -192,4 +216,5 @@ int vas_register_coproc_api(struct module *mod,
>>> > enum vas_cop_type cop_type,
>>> >  			    struct vas_user_win_ops *vops);
>>> >  void vas_unregister_coproc_api(void);
>>> > =20
>>> > +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref);
>>> >  #endif /* __ASM_POWERPC_VAS_H */
>>> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
>>> > b/arch/powerpc/platforms/book3s/vas-api.c
>>> > index 6c39320bfb9b..a0141bfb2e4b 100644
>>> > --- a/arch/powerpc/platforms/book3s/vas-api.c
>>> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
>>> > @@ -55,6 +55,57 @@ static char *coproc_devnode(struct device *dev,
>>> > umode_t *mode)
>>> >  	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
>>> >  }
>>> > =20
>>> > +/*
>>> > + * Take reference to pid and mm
>>> > + */
>>> > +int vas_reference_pid_mm(struct vas_user_win_ref *task_ref)
>>> > +{
>>>=20
>>> So this is quite different from a typical refcount object in that
>>> it's=20
>>> opening it for access as well. I would split it in two functions, one
>>> matching put_vas_user_win_ref() and appearing in the same place in
>>> code,
>>> which is up to about mmput and another function that adds the window
>>> and
>>> does the CP_ABORT etc... hmm, where do you release tgid?
>>=20
>> Basically copied the existing code in to these functions
>> (vas_reference_pid_mm/vas_drop_reference_pid_mm) so that useful for
>> both platforms.=20
>>=20
>> mm_context_add/remove_vas_window() is also like taking reference. So
>> instead of adding 2 seperate functions, how about naming
>> get/put_vas_user_win_ref()=20
>=20
> It's actually different though. What I'm asking is the parts where you=20
> interact with core kernel data structure refcounts go into their own=20
> get/put functions.
>=20
> Someone who understands that refcounting and looks at the code will care=20
> about those bits, so having them all together I think is helpful. They=20
> don't know about adding vas windows or CP_ABORT.
>=20
>> Regarding tgid, the reference is taking only with pid, but not tgid.
>> pid reuse can happen only in the case of multithread applications when
>> the child that opened VAS window exits. But these windows will be
>> closed when tgid exists. So do not need tgid reference.
>=20
> I don't understand you.  The code you added does take a reference to=20
> tgid...
>=20
>>> > +	/*
>>> > +	 * Window opened by a child thread may not be closed when
>>> > +	 * it exits. So take reference to its pid and release it
>>> > +	 * when the window is free by parent thread.
>>> > +	 * Acquire a reference to the task's pid to make sure
>>> > +	 * pid will not be re-used - needed only for multithread
>>> > +	 * applications.
>>> > +	 */
>>> > +	task_ref->pid =3D get_task_pid(current, PIDTYPE_PID);

Quoted the wrong bit obviously:

+       /*
+        * Process closes window during exit. In the case of
+        * multithread application, the child thread can open
+        * window and can exit without closing it. Expects parent
+        * thread to use and close the window. So do not need
+        * to take pid reference for parent thread.
+        */
+       task_ref->tgid =3D find_get_pid(task_tgid_vnr(current));

aka vas_tx_win_open() in upstream code.

It's not a comment about this patch specificlaly, I just noticed it and=20
I wanted to make sure I'm not missing somehting or the existing code=20
isn't buggy before the patch goes in.

Thanks,
Nick
