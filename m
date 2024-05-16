Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F78C7DBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 22:38:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YV1Dcd8F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgMNq5JzMz3fs5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 06:38:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YV1Dcd8F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=axelrasmussen@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgMN063QCz3fnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 06:37:19 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-34db6a29998so6689172f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 13:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715891836; x=1716496636; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZSwX2jBcRCBdUFcHdErZ/3QKMz3PjihBzuXDa6XBd8=;
        b=YV1Dcd8FvTHDslxHCopJz2JQlVYhvwHLXAWvVTT2/80mMiHZft4LXnXCNG+p/9D8v1
         yRx2N198GVG2HwYx5BLlMr5vVrtUDPszKjGVYTbYOOCDjF3A4OOQ98TVCd7gvH4CIOD/
         2CZ0qGgdX+KmLRLoRrm1Aa0o0wdffg9B78GCi9yIUgnAUJP4sIcQ4pBl6P9ZfiF63YtJ
         3Anh1OriveZazEliPFhF0PM5sii8CXstjLdXq1T8yunV8iD7m3Q5nqHSznt8v0Q11vg/
         9/PfnZqoAcjMMcSmfP1eN1hRUH2bgj2IrlJ7/3FnAxaDspjXWqQXeTo41AvaYud+CP8J
         Qw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715891836; x=1716496636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZSwX2jBcRCBdUFcHdErZ/3QKMz3PjihBzuXDa6XBd8=;
        b=BHehUwPvEFJzsIqEglKe4Vs+cMz3w94TFtoD2HMDh+n3C4/XY/qkWCausCn0bFBZcE
         upFgKARH74R4Rq8Hi4db7ZBhjtnJ/Nh5z0lweRqv8+hh3rXt+xJXAeuud4zZRyFwUogj
         QSt/QI2HrLHiaWA4qeX4p/ibVZg9SgeTiq9oQ8oFRqri1re8Pl6xm6iQZWXgw9vO1TwJ
         Rj83/014jScGFWjauWx0dFGHj8Fsia2vr3DMsl5vJKB+jTuqjdBlcQzpa8Q+HWKyFZH+
         FvaLUpeaAPv1vUk/QrgoyoZx2meGftuFm7v67zulIQrGFU95iN3jl81R86cRlqqkiXBe
         nhIA==
X-Forwarded-Encrypted: i=1; AJvYcCWhtS13nVvJIho7Uhz9YNBLBtLmE2zkXNydDLphhK/0T6k6Fl7zyXAhfVEvdfMM+OwQkwrLz8nGMT5n4m+RorX5za6TpUojV/WeVIeA9g==
X-Gm-Message-State: AOJu0YzHuWXXbIkyMrdHi/pDWbbrsgAyfsiHfj9gzmFXutgIJX4GSPWN
	xuX3tP1bAY80hkS/xPRhY4x2FMwbzshTJiTSCTbEjST95Hrz8c7AA4l3Zi8/Q9LDJLheJF1zKR4
	P+giKSvPUfY9oozjIC1DT9FA/i6gQ2mvNz3VHkPd5aqfxVEtcVg==
X-Google-Smtp-Source: AGHT+IHSs0PnvLr7K65U0pIJasei0dLnQZzcKZVqtNdpsde/9sHa0rl6+tv66pbq/0+Y0GTi9KV6Q72LZ1sl+YrcQZc=
X-Received: by 2002:a05:6000:280d:b0:351:b2db:d7d2 with SMTP id
 ffacd0b85a97d-351b2dbd889mr9447250f8f.27.1715891324087; Thu, 16 May 2024
 13:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com> <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain> <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
 <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local> <CAJHvVcj+YBpLbjLy+M+b8K7fj0XvFSZLpsuY-RbCCn9ouV1WjQ@mail.gmail.com>
 <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
In-Reply-To: <20240515201831.GDZkUYlybfejSh79ix@fat_crate.local>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Thu, 16 May 2024 13:28:04 -0700
Message-ID: <CAJHvVchVA4B8DCW=yUGQ6jg1sYXiMX2B-cWziyR3KiTkYNkX-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker poison errors
To: Borislav Petkov <bp@alien8.de>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 1:19=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, May 15, 2024 at 12:19:16PM -0700, Axel Rasmussen wrote:
> > An unprivileged process can allocate a VMA, use the userfaultfd API to
> > install one of these PTE markers, and then register a no-op SIGBUS
> > handler. Now it can access that address in a tight loop,
>
> Maybe the userfaultfd should not allow this, I dunno. You made me look
> at this thing and to me it all sounds weird. One thread does page fault
> handling for the other and that helps with live migration somehow. OMG,
> whaaat?
>
> Maybe I don't understand it and probably never will...
>
> But, for example, membarrier used do to a stupid thing of allowing one
> thread to hammer another with an IPI storm. Bad bad idea. So it got
> fixed.
>
> All I'm saying is, if unprivileged processes can do crap, they should be
> prevented from doing crap. Like ratelimiting the pagefaults or whatnot.
>
> One of the recovery action strategies from memory poison is, well, you
> kill the process. If you can detect the hammering process which
> installed that page marker, you kill it. Problem solved.
>
> But again, this userfaultfd thing sounds really weird so I could very
> well be way wrong.
>
> > Even in a non-contrived / non-malicious case, use of this API could
> > have similar effects. If nothing else, the log message can be
> > confusing to administrators: they state that an MCE occurred, whereas
> > with the simulated poison API, this is not the case; it isn't a "real"
> > MCE / hardware error.
>
> Yeah, I read that part in
>
> Documentation/admin-guide/mm/userfaultfd.rst
>
> Simulated poison huh? Another WTF.
>
> > In the KVM use case, the host can't just allocate a new page, because
> > it doesn't know what the guest might have had stored there. Best we
>
> Ok, let's think of real hw poison.
>
> When doing the recovery, you don't care what's stored there because as
> far as the hardware is concerned, if you consume that poison the *whole*
> machine might go down.
>
> So you lose the page. Plain and simple. And the guest can go visit the
> bureau of complaints and grievances.
>
> Still better than killing the guest or even the whole host with other
> guests running on it.
>
> > can do is propagate the poison into the guest, and let the guest OS
> > deal with it as it sees fit, and mark the page poisoned on the host.
>
> You mark the page as poison on the host and you yank it from under the
> guest. That physical frame is gone and the faster all the actors
> involved understand that, the better.
>
> > I don't disagree the guest *shouldn't* reaccess it in this case. :)
> > But if it did, it should get another poison event just as you say.
>
> Yes, it shouldn't. Look at memory_failure(). This will kill whole
> processes if it has to, depending on what the page is used for.
>
> > And, live migration between physical hosts should be transparent to
> > the guest. So if the guest gets a poison, and then we live migrate it,
>
> So if I were to design this, I'd do it this way:
>
> 0. guest gets hw poison injected
>
> 1. it runs memory_failure() and it kills the processes using the page.
>
> 2. page is marked poisoned on the host so no other guest gets it.
>
> That's it. No second accesses whatsoever. At least this is how it works
> on baremetal.

I agree with almost all of the above. But one point is, I don't think
we can trust the guest to be reasonable. :)

Public cloud provider customers might run some OS other than Linux, or
an old / buggy kernel, or one with out-of-tree patches which make it
do who knows what. There can also be users who are actively malicious.

Some customers may try to do fancy "poison recovery" where they can
avoid killing the in-guest process when a poison event occurs. These
implementations can be buggy :) and unintentionally reaccess.


>
> This hw poisoning emulation is just silly and unnecessary.
>
> But again, I probably am missing some aspects. It all just sounded
> really weird to me that's why I thought I should ask what's behind all
> that.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
