Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F88C6CC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 21:20:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=I1oH+X3M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vfjk86bLgz3d2c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 05:20:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=I1oH+X3M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=axelrasmussen@google.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfjjN34JZz3cb1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 05:20:07 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso108402301fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 12:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715800795; x=1716405595; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXjROtfQXycrwTZbHgAfwgBM9LbMzawmBcCZtk8pkcY=;
        b=I1oH+X3Mk/n3BdMicSHEZ9rwSESSvL8domrENU8JFKd0OiKjAWf5rqUZk6ib4Va71H
         zL1Crqz1n2nGZJvl0/1pI0aoylWeoiA89BOVrbCiADm7bCQHAeEIxoKMemx90MmuI4gj
         hEz4skgt1ghVbm2sJA6JnlvbnFJD9b0USYOyi49Ok5IfG2fpswmo7cOcztg3wpFGrHB5
         s9hVzDm7Z5Z3dzIjOS7c58hfIF4LLYq7F5R5jntDyfFvUcLYbIg1qplHzALRJgYwOnWZ
         /EIZ5+aftf2ZGiD1rxTqpc/oKQsT4GVAqU1XxNKDSEBV1s7/7rD/oyF7MPK4Y/pHVVkF
         541w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715800795; x=1716405595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXjROtfQXycrwTZbHgAfwgBM9LbMzawmBcCZtk8pkcY=;
        b=APQkgazsYx6+GefFCFrdG712JH7DlbOWNZXJDz7AsjI8TXCi6D6fUe79HCiDSdUqJj
         yrrgXy9hEyVJBWNjypQI+TpHPJLagQiUPMNiE8F/xyx135zR4Y0lMKDuY4kdPp25YXHD
         u54MYYzD59+tyD9uQ6mBmR5XGRJDVV8KGjj74TRavAsDkTzplpV6ma7+UQu5pXVibIIG
         uW5bwhTQx3riz0WVRh2tbKhpNq1jylS7oZSJ8oBsjGkJ1aJUHMWrZebMFMYlmEGt1mrf
         +GsrRSeLhIHePWVCnhAquKL5vbyLr/sLYLHsWGc5LlANVOep3x+2lmng0fnsA05KNbck
         gUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWhNzfkwsuRnpLZ7KTo9F21DZ5ap635mpEEglMp8BrSpDerZoXu9vfECKa34RjOQYSyJPRyEk82afWiukRM0dHQ4Gy2ByBt8xXT6RJ8Q==
X-Gm-Message-State: AOJu0YzU9Ursix1l4IqxPJxgGo7dL965CVdI4ZZoNsDf0vXhMhFctbji
	AsLYhTDz/WsJHnQp2WBDIOEEKNrl3G9hKFjm5gtbu9REmrhuge3nwt5Q92TGYx3NxTXNJkEolov
	lc5RGeqpff4Dgf8uXB96bMw2hvgadto1aDFn3
X-Google-Smtp-Source: AGHT+IEsh1fgFOZ5mQCmTXHCQZJjsjH7zDpAl9YdV3FVukl1MJHO71DKDwXJtDNtSkwq75f+AarVWw4jtJy3Fg3K69Q=
X-Received: by 2002:a2e:a591:0:b0:2e2:9416:a649 with SMTP id
 38308e7fff4ca-2e5205c3760mr118614971fa.53.1715800795037; Wed, 15 May 2024
 12:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com> <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
 <ZkSUaVx3uCIPkpkJ@localhost.localdomain> <CAJHvVchGGJkEX=qroW=+N-RJDMDGuxM4xoGe7iOtRu9YcfxEEw@mail.gmail.com>
 <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
In-Reply-To: <20240515183222.GCZkT_tvEffgYtah4T@fat_crate.local>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Wed, 15 May 2024 12:19:16 -0700
Message-ID: <CAJHvVcj+YBpLbjLy+M+b8K7fj0XvFSZLpsuY-RbCCn9ouV1WjQ@mail.gmail.com>
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

On Wed, May 15, 2024 at 11:33=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Wed, May 15, 2024 at 10:33:03AM -0700, Axel Rasmussen wrote:
> > Right, the goal is to still have the process get a SIGBUS, but to
> > avoid the "MCE error" log message. The basic issue is, unprivileged
> > users can set these markers up, and thereby completely spam up the
> > log.
>
> What is the real attack scenario you want to protect against?
>
> Or is this something hypothetical?

An unprivileged process can allocate a VMA, use the userfaultfd API to
install one of these PTE markers, and then register a no-op SIGBUS
handler. Now it can access that address in a tight loop, generating a
huge number of kernel log messages. This can e.g. bog down the system,
or at least drown out other important log messages.

For example the userfaultfd selftest does something similar to this to
test that the API works properly. :)

Even in a non-contrived / non-malicious case, use of this API could
have similar effects. If nothing else, the log message can be
confusing to administrators: they state that an MCE occurred, whereas
with the simulated poison API, this is not the case; it isn't a "real"
MCE / hardware error.

>
> > That said, one thing I'm not sure about is whether or not
> > VM_FAULT_SIGBUS is a viable alternative (returned for a new PTE marker
> > type specific to simulated poison). The goal of the simulated poison
> > feature is to "closely simulate" a real hardware poison event. If you
> > live migrate a VM from a host with real poisoned memory, to a new
> > host: you'd want to keep the same behavior if the guest accessed those
> > addresses again, so as not to confuse the guest about why it suddenly
> > became "un-poisoned".
>
> Well, the recovery action is to poison the page and the process should
> be resilient enough and allocate a new, clean page which doesn't trigger
> hw poison hopefully, if possible.
>
> It doesn't make a whole lotta sense if poison "remains". Hardware poison
> you don't want to touch a second time either - otherwise you might
> consume that poison and die.

In the KVM use case, the host can't just allocate a new page, because
it doesn't know what the guest might have had stored there. Best we
can do is propagate the poison into the guest, and let the guest OS
deal with it as it sees fit, and mark the page poisoned on the host. I
don't disagree the guest *shouldn't* reaccess it in this case. :) But
if it did, it should get another poison event just as you say.

And, live migration between physical hosts should be transparent to
the guest. So if the guest gets a poison, and then we live migrate it,
and then it accesses that address again, it should likewise get
another poison event, just as before. Even though the underlying
physical memory is *not* poisoned on the new host machine.

So the use case is, after live migration, we install one of these PTE
markers to simulate a poison event in case the address is accessed
again. But since it isn't *really* a hardware error on the new host,
no reason to spam the host kernel log when / if this occurs.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
