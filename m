Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B7770CA9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:27:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IDYaS2Jl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHk245zN9z3cSR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 10:27:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IDYaS2Jl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHk0p4ttsz2ytr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 10:26:49 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d29a5f7dc74so2641322276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 17:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691195206; x=1691800006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxe81u7udmo92GKvP+siVLCAkn/wI0aAvKtL6yx1U3g=;
        b=IDYaS2Jlq4whyIHc7JhRYfrcrAbZnELtmh2woo/KuYYzAzsbayvQ4sj8qrACxQTt3E
         lYDAcPv0oqswtU0a+8JiNOxwSOMnlBuWRX/kUju4NfI2bkeIEoUd+hpoIymCGCrg+HOd
         rOReOu27oMxzSRZka0CWgiWvfvyFOK0RrE0oxXSXuHZ/6hvL8HbaMJh2bTXme5gHpVfp
         p1jGS/SX43x7wyiaKixT6DLKPsA1RnNYoqMQNguxmupUlnDjz4f6JHVu8pmLvpu1YxU+
         2jSfSQVlNRKHZayvnNhSQsr4CW9cqxboPyMOci7lrIrxoLjF91f9DZPkkFJiVd1YSI5t
         wB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691195206; x=1691800006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxe81u7udmo92GKvP+siVLCAkn/wI0aAvKtL6yx1U3g=;
        b=Xohrs6DuHtZjrQXKuy4wRp7OWYaZcyGxZ187Qhlk1mWn6w1sNSvJPW2FBZaBE2diH2
         LWKMTByixqxVTD1a7smC23oazn/Bpp57HgvDI87sK5nfVkDmEQz5vF9ZwWdSO1diqPDa
         aindUb/OQ1vl1xZsz5RHO7WZGEPDz2FXNYo1wYRlXwryrhFP2SfdUOteDfybB3OjDONG
         VY/MfWDe3d56iGXxT0U0ll42av6Z9Y17g3DbcI5CDPiirk1TUt2tEWd7QdEun24IOkOS
         ByCwkojVE6IYTG63751sW4HfO9TkLxpgk0aLQFdqLdcvUMRMKUWSBjO+nRXMSgYrP0A/
         au1w==
X-Gm-Message-State: AOJu0Yw4OQSd47LsfwFaekp0jbylZZWX3SyoneW9r08/zCOYRGyk1IIF
	pA+1TlqMgxgmpXOngzmn1+DO+EVxmxDweCzpBf9xcg==
X-Google-Smtp-Source: AGHT+IFV5JuRf10Of18+lGhJEPb7ELh0VS/HhAfs0nhr73hV/LaKvg8puQls+izXLadWiO6FQO7JuYQNY8dwcMbQzOg=
X-Received: by 2002:a25:361b:0:b0:d0f:846c:ef7b with SMTP id
 d27-20020a25361b000000b00d0f846cef7bmr3175751yba.17.1691195206375; Fri, 04
 Aug 2023 17:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com> <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
In-Reply-To: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 17:26:33 -0700
Message-ID: <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: jacobly.alt@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > I know of these guys, I think they are excluded as is -- they go
> > through access_remote_vm, starting with:
> >         if (mmap_read_lock_killable(mm))
> >                 return 0;
> >
> > while dup_mmap already write locks the parent's mm.
>
> Oh, you're only worried about vma_start_write()?
>
> That's a non-issue. It doesn't take the lock normally, since it starts of=
f with
>
>         if (__is_vma_write_locked(vma, &mm_lock_seq))
>                 return;
>
> which catches on the lock sequence number already being set.

That check will prevent re-locking but if vma is not already locked
then the call will proceed with obtaining the lock and setting
vma->vm_lock_seq to mm->mm_lock_seq.

>
> So no extra locking there.
>
> Well, technically there's extra locking because the code stupidly
> doesn't initialize new vma allocations to the right sequence number,
> but that was talked about here:
>
>     https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0Ly=
KgEvsFaZNpDA@mail.gmail.com/
>
> and it's a separate issue.
>
>           Linus
