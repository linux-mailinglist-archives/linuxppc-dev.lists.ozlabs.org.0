Return-Path: <linuxppc-dev+bounces-7279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53DA6C386
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 20:48:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKCfr38TWz3089;
	Sat, 22 Mar 2025 06:48:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742586500;
	cv=none; b=ienDPDHnxnAz8S6WjLFCG3XuBqUv0clwbM6c3U7HlV6URpULXY2ZEVexxXMy9e9ZyCfVCN6Thm/nog6DuYJM/fJ5V1m8+B0lvuNqTrXolotGpvOOATTeFsrf2LRWzf/E9JxNQWS9Hl4Jm3YZNSF7CcC78XbtrLWr8IGO94/XNnODkI7yP7VSQDOnhOpXfBRjgcLmwxTDSEbtcNhNPjugXGt5x72RHEeKU7cOiYrc33yZ3P9nLmUiIhXx4+URJWIFx3GOOGIt6yNuHiB6F7ABM7KnICfz3ynNnHx4b9qY/PteIXNCq1NN1mq+zi+NpMWjtfLFtTSXvGITCuxtBk8OMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742586500; c=relaxed/relaxed;
	bh=Ly0rkqyd4u96pt3sfW6/+4RipbpAyl94DbrB3bUCuwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYZcWFPitGJtv/6hlcA1nOtb25kfKBFoRYQwvQj2iMk22EMoU7SWqeBDD36YTyFhAdwhDV0mzKq7HfLKum3Hi/TvrkJE6QwIknKfeB5nwNC25aH9TCVVMv/0j/1mA2jAi6L9wLSdaJ2syatxmlIDhs9QeLFkPEJ1e9GTpNR9cFyVnIjGqz2a3sK4wI+6rxHEL82/j7MwumrzflSTCWoSPTe8511K1LOjR+hcKgoJPKw/Umu81s+aNpZ/4ljvCK4SWb3nwGkerhBwQGzS7uzQSCvMPAwY8L9QsreHU8EGY9GEZyxyZL+4IfYDQ9RfVihWaETInGgyScwAlldImISEXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KDMJuY8l; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KDMJuY8l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKCfp3XlZz306d
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 06:48:17 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2413580e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742586492; x=1743191292; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ly0rkqyd4u96pt3sfW6/+4RipbpAyl94DbrB3bUCuwk=;
        b=KDMJuY8l3PqHTQHqT+JN1CA+jJSdI9+7RSN41ijz3fgY3tIs/R9Ck0JbfDxWcdrFaz
         fXQaBEJYBtFH2IQeLurSNdSapTTBzscwfBF3SXcNTPZkl6mWbVdJXYI0p6KvKANjhH7N
         ztauCNeaGYXLw6aiEUJ8ilK+/Jqb0lRWKzz2+AFSYy7w9a9yGoheyYCqPlGCjaRgA+S2
         rwuepevzsL3t+pBugTvWfgqieHbcx42ba7oP37d9s/ZW8HALwxNd/Tjq2DdmsRP2yrki
         /ajTeueAP8l8DENbWGe2Kyf51HO82kdgavqoYpAiLkgUXlK6WS/i911U5ZcIefdJ66aJ
         QAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742586492; x=1743191292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ly0rkqyd4u96pt3sfW6/+4RipbpAyl94DbrB3bUCuwk=;
        b=vgB0W0+RzHn21hXWrFBImb77JVIzzQXBwYAAIsmuF4L/igEuKFe8WymTxwwj1SQzNr
         sesLSs2uG9REWMLHdOTNcUvXhDr8EtgrOAyY+NvymB8rrtpOd3AVw6qLMo3YgnvClkuH
         dPiiuLtDz31qkzTKFoVsNgSP6rUHtL67n7vOYIrf8PV5Ls1h1DycneZuGNzgPKUk+hm8
         Ln2nKPfvr2Ftl+OMy5pr6JE+tRTKjMAjR1E+aes2+MCSxPShNxodFDLwQ3jBdyotAgbg
         6UphROshFBGpGtFKTUxtYJGi2viClxdWcFEYI3U5NaL9jsordqpLrk7sLZnnqjcMkGHx
         k/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUhDuhG6aRZ87//eQRQ9My958GiWTnt4r6HUEUZzYTI41cgUF87kcnzrZIWmUWCVWADvIosM4W3qtZvKjQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzCgxEBCVuPDITVtIAqinA/nZcJ8Grh4/IEgsFoQmeqvFhEcYJ
	zbNfOX9DlkD4iKd0H3KT/rFCtojb420R0qWVDs/snlTheqJFgoYhZquoqYT9g7eN650dZ1uZRig
	wKu8LJoNpJ14/xcUFoygBe0K5IgM=
X-Gm-Gg: ASbGncuIxPG23l9Z3xnyCz3L2LrwIzMFdogOGTDMlRMccGkl4Rli22eCkZ+q1o5RQqf
	IM6SZ1H5FTXhIp1FCnMBkevN1F2aVMRvf3w1SmP4Zk5mCEhrC6BdjSvry4jheD9Dd+TczHDRmzk
	r2+boj42u5o/2SG41utMC9vfl4ehqdOEOf/gwGInFX+A==
X-Google-Smtp-Source: AGHT+IFBFgrCJ/bchlWOwIv9rI77Cq+9FheTeIgSI10PI3pRLX14sLGNW1KkGbOtKsmpfb5BqidS5A6BsnbPgS9nwoo=
X-Received: by 2002:a05:6512:ea2:b0:544:ffbe:cd22 with SMTP id
 2adb3069b0e04-54ad6500d8fmr1778451e87.46.1742586492037; Fri, 21 Mar 2025
 12:48:12 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad>
 <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
 <CAJ-ks9mevv68v1Mh0GdGd9Y2EEp3_kdV6FygOiAenYG0=e4=Tw@mail.gmail.com> <Z92w13L8v1MvPC8_@thinkpad>
In-Reply-To: <Z92w13L8v1MvPC8_@thinkpad>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 21 Mar 2025 15:47:36 -0400
X-Gm-Features: AQ5f1Jqo7tJbB2wPNw7jN7SKqpquKkjt9eOhuuAS5_i6zceZK37QYCYbQ3pr-GM
Message-ID: <CAJ-ks9ktTpUaBPk9rEp8UX9P5dZPeDuuGWfuSiR+dL3jXVb1+g@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 2:32=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Mar 21, 2025 at 12:53:36PM -0400, Tamir Duberstein wrote:
> > Hi all, now that the printf and scanf series have been taken via kees'
> > tree[0] and sent in for v6.15-rc1[1], I wonder if we'd like to revisit
> > this discussion.
> >
> > As I understand it, the primary objections to moving bitmap to KUnit we=
re:
> > - Unclear benefits.
> > - Source churn.
> > - Extra dependencies for benchmarks.
> >
> > Hopefully David's enumeration of the benefits of KUnit was compelling.
> > Regarding source churn: it is inevitable, but I did pay attention to
> > this and minimized the diff where possible.
> >
> > The last point is trickiest, because KUnit doesn't have first-class
> > benchmark support, but nor is there a blessed benchmark facility in
> > the kernel generally. I'd prefer not to tie this series to distros
> > enabling KUNIT_CONFIG by default, which will take $time.
> >
> > I think the most sensible thing we can do - if we accept that KUnit
> > has benefits to offer - is to split test_bitmap.c into
> > benchmark_bitmap.c and bitmap_kunit.c.
> >
> > Please let me know your thoughts.
>
> Sure, no problem.
>
> I asked you to answer to 4 very simple and specific questions. You
> didn't answer any of them. David sent a lengthy email that doesn't
> address them, either.

OK, that's fair I suppose. Let me try and address them now:

> - What do the tests miss now?

The tests do not _miss_ anything. They are just inconvenient to run,
particularly from automation, because they do not report success in a
way that is trivially understood by automation. In other words, I'm
not aware of something trivial I can run that will exit 0 if and only
if the bitmap tests pass.

> - What do _you_ need from the tests? Describe your test scenario.

I want kernel tests to be easier to run, and for more of them to be
run by existing automation such as LKP[0]. I know for sure that KUnit
tests are automatically run by LKP because other tests I converted to
KUnit subsequently had warnings reported by LKP.

> - How exactly KUNIT helps you testing bitmaps and friends better?

KUnit reports test results in a standard protocol (KTAP) that is
machine-friendly. It comes with userspace tools that understand this
protocol and produce useful exit codes, as well as human-friendly
output.

> - Is there a way to meet your needs with a less invasive approach,
> particularly without run-time dependencies?

I'm not aware of such a way, but if you know of one, I would be very
interested to learn.

> None of you guys submitted anything to bitmaps - neither in library,
> nor in tests. Your opinion about what is good for bitmap development
> and what's not is purely theoretical.
>
> Real contributors never concerned about current testing model.
>
> I think that you don't care about bitmaps. If bitmaps testing will get
> broken one day, or more complicated, you will not come to help. If I'm
> wrong and you are willing to contribute, you're warmly welcome! I always
> encourage people to increase testing coverage.
>
> If you'd like to add new cases to existing tests - I'll be happy. If
> you'd like to add completely new tests based on KUNITs or whatever
> else - I'll be happy just as well.

I can't speak for David, but you are right about me; I do not have an
interest in bitmap in particular. My interest is in kernel testing
generally, which I hope I have adequately explained above. As for my
willingness to help people obtain and keep good workflows, well,
you're welcome to examine my history in OSS. I've contributed to
dozens of projects, many for far longer than my professional goals
required.

Let's keep talking.
Tamir

[0] https://github.com/intel/lkp-tests

