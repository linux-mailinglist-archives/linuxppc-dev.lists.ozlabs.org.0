Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22950770CE1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 03:07:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JWEJoBXO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHkvN6lbHz3cV1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 11:07:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JWEJoBXO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHktQ5Hb2z3cND
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 11:06:21 +1000 (AEST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1bb58b4c513so1882838fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691197574; x=1691802374;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5wLxtngQDf95laPzAr998ewYrpc6/LmQcNIxOteIueI=;
        b=JWEJoBXO0UGnBg4xLdw9KEUhTH4lf77t4U6moAOmDX1C3WqbrVn5+P7FXQ8ajzo70m
         3e/bt6Yn9H5A6cs+o19Z4C1zxcT4Et4m5abUWYZInQ1vxhkrUERvFXsImX2e/W3YpV0y
         MJDLZNtb6Mz6g1WmggiYRNxAYKbjQPfE9Hl/4M9hLwFDdXJi166vWIcQYeRTPnhJJYOa
         ijF8FYpFkp7oqHhWSIXvlxrG+UOuYO3wy+mJ2meE07tjEMkje7c42ME9yAweWkUXz+33
         4uV3V8Ld4pJPhV1V1BINXfsLX3bscp/Uu7w4V/Rj3IlZV3giEvAfAcTDasK9x9+ZBd7c
         HYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691197574; x=1691802374;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wLxtngQDf95laPzAr998ewYrpc6/LmQcNIxOteIueI=;
        b=JL67KTagp5kl/sdJAckSJTJakA0EEvthz47EZIGTb4UXKgcAuok24WipNwfg0Nb6vH
         R0LrA3rf+sHdpM7uo7/nwNZfJWtcNYS8NEchOn/fOnUxEdp/1jtDPNZOvj+VgWnGMS2U
         OaP/ej/7dRCLZcOgmF9ACZhMyj9UjXQqWqubTrUBCi8t7SYyHwIL1QzQr2Eq3zykEqFX
         wFdZACdS3pJlB3gmYyicy5ABymfbDX95erZ6BqH4zy2Zjr4yLdr6Gnma+6hB9FDamDQu
         V8Qfk02dfz/xrVEN6URj7nzjjcT1eJ/zOPaMofj5gCdcKNRicE09tGeLkGqI8n7WdsiU
         XcZw==
X-Gm-Message-State: AOJu0YyrJNTze+38ZTSDpcdkBsGY2eG9AdhVJnm2KxSZF29+lms41h77
	FnTbXcE6BtWSRFuCqpVYdoHFxsIpl+gDazQMst4=
X-Google-Smtp-Source: AGHT+IG8PbrHRgIVAkXmrYRri3sk0mgD3rxRszibk3mbzi2/k2uRhFt/+JykTBC0PKuE3GPwCgYcPa9/gb2M+tKCYKM=
X-Received: by 2002:a05:6870:82a2:b0:1b0:449e:cff9 with SMTP id
 q34-20020a05687082a200b001b0449ecff9mr4064524oae.57.1691197573686; Fri, 04
 Aug 2023 18:06:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7b87:0:b0:4f0:1250:dd51 with HTTP; Fri, 4 Aug 2023
 18:06:13 -0700 (PDT)
In-Reply-To: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com> <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Aug 2023 03:06:13 +0200
Message-ID: <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
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

On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>>
>> I know of these guys, I think they are excluded as is -- they go
>> through access_remote_vm, starting with:
>>         if (mmap_read_lock_killable(mm))
>>                 return 0;
>>
>> while dup_mmap already write locks the parent's mm.
>
> Oh, you're only worried about vma_start_write()?
>
> That's a non-issue. It doesn't take the lock normally, since it starts off
> with
>
>         if (__is_vma_write_locked(vma, &mm_lock_seq))
>                 return;
>
> which catches on the lock sequence number already being set.
>
> So no extra locking there.
>
> Well, technically there's extra locking because the code stupidly
> doesn't initialize new vma allocations to the right sequence number,
> but that was talked about here:
>
>
> https://lore.kernel.org/all/CAHk-=wiCrWAoEesBuoGoqqufvesicbGp3cX0LyKgEvsFaZNpDA@mail.gmail.com/
>
> and it's a separate issue.
>

I'm going to bet one beer this is the issue.

The patch I'm responding to only consists of adding the call to
vma_start_write and claims the 5% slowdown from it, while fixing
crashes if the forking process is multithreaded.

For the fix to work it has to lock something against the parent.

        VMA_ITERATOR(old_vmi, oldmm, 0);
[..]
        for_each_vma(old_vmi, mpnt) {
[..]
                vma_start_write(mpnt);

the added line locks an obj in the parent's vm space.

The problem you linked looks like pessimization for freshly allocated
vmas, but that's what is being operated on here.

-- 
Mateusz Guzik <mjguzik gmail.com>
