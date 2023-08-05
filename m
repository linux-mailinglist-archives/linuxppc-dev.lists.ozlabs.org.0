Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3B770C9A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:15:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O7h8BHhb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHjm85mKJz3cVJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 10:15:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=O7h8BHhb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHjlF5cZ3z2yVk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 10:15:04 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso4519524e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691194496; x=1691799296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BOt/owxzUYbRmdYSMwC2b72ailgyx1LyngYZzbpA3ng=;
        b=O7h8BHhbymu1I4d9ZaPLh23xuuUDRqcwMsszrhc+cDntNODV23CcvQ9/lPL6ayYxbV
         jyui6NxhOjTNrewE2jlD9bplqx5j8albhlxXcvxYqRHg4f4+NsmTwofjBMmJwPkZSliC
         0J8AFv8huk2XGYV/Lg1bQ5SEGFapAZa4lVZdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691194496; x=1691799296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOt/owxzUYbRmdYSMwC2b72ailgyx1LyngYZzbpA3ng=;
        b=c0QGWjh0XikIrnaxH61rRZbuJHORybnqc1bz9ZoOCZOVCcDC0YFk9z4z6501iKpheN
         en7D6Tkpp/EpcAoJGkvmzsTWyS5eXO/Tot9ZvhskRzN9RjIhMz4Epc3OxU4hzJ9fQRWr
         H8xtpSpsp15+LbzgelqJPq2JEDeygRsI5V7c8lYpTOVaB658zOjdfkV9oTMbSf4zXw8S
         dLRxaTqst4oCFXRTIJIP4EXWUGlnMfj/aXPpYgHo0Xf63XA6S8ph63Yjo5pccBSHc6eV
         9eMiWEZvF6MjrM51cny0TtA52ub7ouQ/KloE5BR+WB6BKRRDJlESsFcDxqpQ1fVuuI40
         eh2g==
X-Gm-Message-State: AOJu0Yy8ZB6nE8kT/v3zSPLUUw4iyDRfI0tXvZED2BfuBQu/OEvuD0uv
	y+0Go87I54SqBciYu6dIVtl9TF8AbuLXG6tJL9L07z+0
X-Google-Smtp-Source: AGHT+IEt8GfyGTy3qSuGmQ5ZtH5SDmN7k5DD3dopswTa1fea3vBzFPSNaprzWsEHyZMGHBaIMCdHDg==
X-Received: by 2002:a05:6512:6d2:b0:4fd:f7a8:a9f3 with SMTP id u18-20020a05651206d200b004fdf7a8a9f3mr2816745lff.38.1691194496538;
        Fri, 04 Aug 2023 17:14:56 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id q19-20020ac246f3000000b004f3ab100161sm566191lfo.15.2023.08.04.17.14.55
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 17:14:56 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4511767e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 17:14:55 -0700 (PDT)
X-Received: by 2002:a05:6512:74e:b0:4fb:ca59:42d7 with SMTP id
 c14-20020a056512074e00b004fbca5942d7mr2051745lfs.33.1691194495615; Fri, 04
 Aug 2023 17:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
In-Reply-To: <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Aug 2023 17:14:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
Message-ID: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Mateusz Guzik <mjguzik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I know of these guys, I think they are excluded as is -- they go
> through access_remote_vm, starting with:
>         if (mmap_read_lock_killable(mm))
>                 return 0;
>
> while dup_mmap already write locks the parent's mm.

Oh, you're only worried about vma_start_write()?

That's a non-issue. It doesn't take the lock normally, since it starts off with

        if (__is_vma_write_locked(vma, &mm_lock_seq))
                return;

which catches on the lock sequence number already being set.

So no extra locking there.

Well, technically there's extra locking because the code stupidly
doesn't initialize new vma allocations to the right sequence number,
but that was talked about here:

    https://lore.kernel.org/all/CAHk-=wiCrWAoEesBuoGoqqufvesicbGp3cX0LyKgEvsFaZNpDA@mail.gmail.com/

and it's a separate issue.

          Linus
