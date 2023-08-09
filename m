Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F1776ABF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:08:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EUnhMb2X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLjMx2ZFRz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 07:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EUnhMb2X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLjLz65Ypz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 07:07:54 +1000 (AEST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1bed90ee8b7so202448fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Aug 2023 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691615266; x=1692220066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQhPymUQatLez9OhAXnkjteLBnvrlDrlwzKYnLXCkIU=;
        b=EUnhMb2XtpgZMeivppTYpKUPHU/1tJTVNBvx8vjB6hgiPMyGsMKylvyif+u5Dy9rTO
         MbQnLpB9E25ZjsusJDPz5b2JQva54uSYWYx+1c4sA6X4S0vkJkRcrz01EIBvZMxr57Zl
         srRkBKI4gD1LySDPQnA8AFHo8eQclUdgOBu5zQe0t6UHyPNBGHga2x38AT3tJopFblRM
         /wolOhfa4YMk3v7GqzGSVnmS01EF8XvsSnMK4eMdDmRPLskyVcvqMA2jHa5XPkMH7CaF
         wrnnPYbeFBNeFTymBA7lA6EtgvuuWWPGNhHBn4V9roF47dPo0wrijxcmSVNKIse63GnY
         Eupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691615266; x=1692220066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQhPymUQatLez9OhAXnkjteLBnvrlDrlwzKYnLXCkIU=;
        b=XUkZaSPagwIcC1QQ1JQTTjQS1A/x54jlxTo9m4xHdhe0SguZptH4I0Hw0WW/QP7Nmw
         YCMfKMWCERbOQxOMc6338pDrQ7m1qj+sZtGAgBWlWwVlzRgyzq7Twk5g0awZPjmNbjuE
         YIhjsTbw1MOFsrYQChZ2prFYvEQttRilq75dy977ILT/EKfgDA1F9kPpCKIAglOHOvPs
         FCrbGZ6y1g+hUG3VvcPvDONcmT4fVM62UpYA6deunvzLa4aFFUVvc7j9WFWM2/ZNxPgs
         X/6LisgLZG0i/TB81cVDwIEVni5xTkMI+OEYSVPqKOw2qiZ89vvKAKyBZxqhttRMZUDW
         5Ryg==
X-Gm-Message-State: AOJu0YzQAIFaee+iHMdNjQOgAW32XEWXVbigDS+dIdMgGjezjPAXnQzS
	Zzx3I3Kzz2eaCSlThZDY8/ouNjTKrpvqQAqPXqY=
X-Google-Smtp-Source: AGHT+IEfcjCJMWcdPFDkWHU7lh8NId2uR9ZSbF4zjNWL5iX3wKgvPA5uGM4+ivUnywUPI0zMEhF9Oh8mRWxuJA61RBA=
X-Received: by 2002:a05:6870:88a9:b0:1b4:7411:5c0c with SMTP id
 m41-20020a05687088a900b001b474115c0cmr443843oam.13.1691615265775; Wed, 09 Aug
 2023 14:07:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:129a:0:b0:4f0:1250:dd51 with HTTP; Wed, 9 Aug 2023
 14:07:45 -0700 (PDT)
In-Reply-To: <CAJuCfpE6K6x7EKAr2rtW1Gn+1oht6w2qZSZ2bGATfoe8C8fJhA@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com> <CAJuCfpE6K6x7EKAr2rtW1Gn+1oht6w2qZSZ2bGATfoe8C8fJhA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 9 Aug 2023 23:07:45 +0200
Message-ID: <CAGudoHEU62Rpp+uJakCFgKC36y3th=Qx+jE+b7KJh6_jeH7cNg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/5/23, Suren Baghdasaryan <surenb@google.com> wrote:
> On Fri, Aug 4, 2023 at 6:06=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> =
wrote:
>>
>> On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>> >>
>> >> I know of these guys, I think they are excluded as is -- they go
>> >> through access_remote_vm, starting with:
>> >>         if (mmap_read_lock_killable(mm))
>> >>                 return 0;
>> >>
>> >> while dup_mmap already write locks the parent's mm.
>> >
>> > Oh, you're only worried about vma_start_write()?
>> >
>> > That's a non-issue. It doesn't take the lock normally, since it starts
>> > off
>> > with
>> >
>> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
>> >                 return;
>> >
>> > which catches on the lock sequence number already being set.
>> >
>> > So no extra locking there.
>> >
>> > Well, technically there's extra locking because the code stupidly
>> > doesn't initialize new vma allocations to the right sequence number,
>> > but that was talked about here:
>> >
>> >
>> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0LyK=
gEvsFaZNpDA@mail.gmail.com/
>> >
>> > and it's a separate issue.
>> >
>>
>> I'm going to bet one beer this is the issue.
>>
>> The patch I'm responding to only consists of adding the call to
>> vma_start_write and claims the 5% slowdown from it, while fixing
>> crashes if the forking process is multithreaded.
>>
>> For the fix to work it has to lock something against the parent.
>>
>>         VMA_ITERATOR(old_vmi, oldmm, 0);
>> [..]
>>         for_each_vma(old_vmi, mpnt) {
>> [..]
>>                 vma_start_write(mpnt);
>>
>> the added line locks an obj in the parent's vm space.
>>
>> The problem you linked looks like pessimization for freshly allocated
>> vmas, but that's what is being operated on here.
>
> Sorry, now I'm having trouble understanding the problem you are
> describing. We are locking the parent's vma before copying it and the
> newly created vma is locked before it's added into the vma tree. What
> is the problem then?
>

Sorry for the late reply!

Looks there has been a bunch of weird talking past one another in this
thread and I don't think trying to straighten it all out is worth any
time.

I think at least the two of us agree that if a single-threaded process
enters dup_mmap an
down_writes the mmap semaphore, then no new thread can pop up in said
process, thus no surprise page faults from that angle. 3rd parties are
supposed to interfaces like access_remote_vm, which down_read said
semaphore and are consequently also not a problem. The only worry here
is that someone is messing with another process memory without the
semaphore, but is very unlikely and patchable in the worst case -- but
someone(tm) has to audit. With all these conditions satisfied one can
elide vma_start_write for a perf win.

Finally, I think we agreed you are going to do the audit ;)

Cheers,
--=20
Mateusz Guzik <mjguzik gmail.com>
