Return-Path: <linuxppc-dev+bounces-399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318095C070
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 23:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqcPX0yYXz2yYn;
	Fri, 23 Aug 2024 07:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::832"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724349883;
	cv=none; b=fcK+LeJWbKAcrwqtk4mHm04HUj3td3aGoz3fHaegF8s1Po+3jZwOk6RfcmSDwHj9LqCx1S8UDGdTZBXc+DwepkcoLLe3Jd5F0x/XK9GKbX4/B030VL6JBKa3wT7M8SuXfVSIpKxsQVhoM/UX1+tjsvVbTP0JMWhEU5LXM47U0yATplhuB6Y46dBNDmnrabETE+GIh5PaDFMw9+8GeFTDhu60D6Ich+NN77bHivQv9o6FRJVsiHL9ueOcFzNixvKKofzGqCN98CYIhUiz9PTldv9+p4qAMadm8fiExnO/5zQQETUXCgPr4wr9lEccuq04MVAPCN2DOwHp2CTVBGpsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724349883; c=relaxed/relaxed;
	bh=fgakG6Vf5aO7Xmw9qVJPPNl+pSYJRKW/HFF09/qYve0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	b=SqAm26qzBaGe8b71yDJzVSA7GiVBm2pIBQbt3MLFWj+icbHhnmOy3LSyvXDQYesd5YubP6TVMGmWw0RyzxhPB2hYg6CzzsiWuIYDuFVZ8cumPB2f895KIhByee0XOc1CFMgIIiAWRy0ZPakLoR38um177Ta6CjRj8eBsV9VD9Pt64YYfPdNX3AZ1+gn/oMfYWgO/5OU/bkU8VF2iaMjGKHAt3lp2mVmvE7e84R+c3Zeu0z5WsjeHBs2GQqMV2xr8mXc5u1fWwztbPoAlvJzVR9e0Gsd2MqSRG71wGX3d8Nxr/k5tp30HHGgh7Swn3+0WYe45BNlcHz+8d7Zp5ss0ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JUgnETme; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JUgnETme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqWLf4fHLz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 04:04:41 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-454b1e08393so37731cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724349877; x=1724954677; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgakG6Vf5aO7Xmw9qVJPPNl+pSYJRKW/HFF09/qYve0=;
        b=JUgnETmeb9TUDmXPecyKPceU3BYahYQJciPQqv9eic4Ern0CK7tmZ3Z/jHeHm7uopf
         VF5+U/lUMZkmsQVrzFLm8I4DC28MeFLGuE6dspxcaJkE2bGVbpC8Pw1WhoKYA2xc1X7y
         7MDcQWUe3VY6MHIOTUzpSRARvCWzG+nnc/zRc1TUu9GyuVvf43So383UtM79GbqmTDeh
         35SbBNjmdE45xqwz5AlmHLJ2KqDRhqxVmREhYNdjMUXVMxLUgDaltlXqbPtrMDEwwmhm
         MuR/5b2jw9qucw0RI3dFkU+9jbLhczuoIkT9TFbLrbaHlVxBMFDpXEWQ+R5z/cAte5si
         AtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349877; x=1724954677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgakG6Vf5aO7Xmw9qVJPPNl+pSYJRKW/HFF09/qYve0=;
        b=vb0CAw2u3qgUagbS0XQkrE9p7cEhp0bBKgc/LS6sXzcpWyUsGpzFuJhf8YrVGbKeRR
         m/af9TY2ejmh/YLOo0gUKbZw+JX22zfAoNfM8q72GiWaHgkpgrAgwqKw+UIQO4QoO8QT
         mBd9mJnpTpx4MFupFDDN3VJ5eX1c1hFKUBq2S7l899HnGvK38Bq4qOTqaTw+ehS6HO+6
         JdBvYGliulFmx1mz/V1FbGNNTFBc/+R2ZmXCkbBX8hchm5CQquSjUZ4c5SeY9lCZs2Qh
         N5I3lMP1l8mpbSMroHvhHtpyMRO9Ukc06vALIkzmr6HtPWdesH7SJeHM+I5k7AusI84y
         qFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkSzLXU96MOrG9l7YBWI4bX8P1o5Hf6CCRY6vuQeiOS2NgnFzDaWKLxrBXBANmZF4y1OrFfNZCrjbysm0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpM5kJQcJbDI1isZiWLyNPe4iBcsgIKqoLkhRDbOjWBgeFCCV7
	e1tlHFh1Whp0g/uiKxpcmC/Jrer9vGK+UtzSG3myfx3u3ZLJu/oWI7/a5x8EFVVuPunAJgNA/8i
	I7tgurvFesjTbP8uGheOZznsIhV0DE/X9qd6q
X-Google-Smtp-Source: AGHT+IEXJr25zlT2/Or5jyoEG/qxGlU0q4T86mW4zw4Fy3ho9UHUUSDfdVUJceCuGyGcOczXXANaLsG7KyVrMz2kH8o=
X-Received: by 2002:a05:622a:548b:b0:453:5961:b880 with SMTP id
 d75a77b69052e-455080f464amr257731cf.10.1724349876431; Thu, 22 Aug 2024
 11:04:36 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240629153128.4660755c@yea> <20240721010926.60efacc3@yea> <b5ae7797-7676-4abf-82be-e2ce4d9238a1@cs-soprasteria.com>
In-Reply-To: <b5ae7797-7676-4abf-82be-e2ce4d9238a1@cs-soprasteria.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 22 Aug 2024 11:04:22 -0700
Message-ID: <CAJuCfpH9e0zvrBK8A_TEHO=maHqijjPcC21=To7VU-mmp0ZYBQ@mail.gmail.com>
Subject: Re: Kernel build failure with MEM_ALLOC_PROFILING=y set (Talos II, v6.10-rc5)
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Erhard Furtner <erhard_f@mailbox.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 10:18=E2=80=AFAM LEROY Christophe
<christophe.leroy2@cs-soprasteria.com> wrote:
>
>
>
> Le 21/07/2024 =C3=A0 01:09, Erhard Furtner a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de erhard_f@mailbox.org. D?co=
uvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentifi=
cation ]
> >
> > On Sat, 29 Jun 2024 15:31:28 +0200
> > Erhard Furtner <erhard_f@mailbox.org> wrote:
> >
> >> I get a build failure on v6.10-rc5 on my Talos II when MEM_ALLOC_PROFI=
LING=3Dy is enabled:
> >>
> >> [...]
> >>    LD [M]  fs/xfs/xfs.o
> >>    LD [M]  fs/bcachefs/bcachefs.o
> >>    AR      built-in.a
> >>    AR      vmlinux.a
> >>    LD      vmlinux.o
> >>    OBJCOPY modules.builtin.modinfo
> >>    GEN     modules.builtin
> >>    GEN     .vmlinux.objs
> >>    MODPOST Module.symvers
> >> ERROR: modpost: "page_ext_get" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> >> ERROR: modpost: "mem_alloc_profiling_key" [arch/powerpc/kvm/kvm-hv.ko]=
 undefined!
> >> ERROR: modpost: "page_ext_put" [arch/powerpc/kvm/kvm-hv.ko] undefined!
> >> make[2]: *** [scripts/Makefile.modpost:145: Module.symvers] Fehler 1
> >> make[1]: *** [/usr/src/linux-stable/Makefile:1886: modpost] Fehler 2
> >> make: *** [Makefile:240: __sub-make] Fehler 2
> >>
> >> Same .config builds fine without MEM_ALLOC_PROFILING set. Kernel .conf=
ig attached.
> >
> > Build problem still there on now released v6.10 with MEM_ALLOC_PROFILIN=
G=3Dy.
> >
> > Can't bisect as build with MEM_ALLOC_PROFILING fails since it's introdu=
ction in v6.10-rc1.
> >
>
> I guess those three functions are missing EXPORT_SYMBOL_GPL() tagging.

The issue should have been fixed by
https://lore.kernel.org/all/20240717181239.2510054-1-surenb@google.com/
patchset. I probably forgot to CC stable@ for these changes. Let me
check and follow up.
Thanks,
Suren.

>
> Christophe

