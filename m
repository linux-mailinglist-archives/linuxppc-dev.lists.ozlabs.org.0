Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B939A94C4EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 20:53:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCC4XuQW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfx5L4flQz2yMt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 04:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCC4XuQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=jeffxu@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfx4f3swHz2xft
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 04:52:49 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso782a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723143165; x=1723747965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTr7QPxZOv6ZANTvHJnD7itspZcoPGqbySruN9g+g4c=;
        b=BCC4XuQWJRhlzer/jFbM7wBQlo4/aTqI6Qgkw7ikA+1jbbxWZiuESzimRcnPuHMMdc
         olMkeSRS+B/AgxsvoffqgDjSxmA9o2l1XCWGqjzNcJEMIQu0EMNpBM+imeSe+eXyOr85
         GDin2SYeMNXTQLYQmz8Vt1t6/gAchqwZhJcbNoNP9FK9gbsbW78U772Yf0eYrOAFy1Xr
         YYeiafdCZzeNv0xbYxdZ33tB0GU1ILZCgSH4Ul+ZHIdzmKDSbd8L6LSCsvZrfSEHme+o
         pgwy+5lLEVCPkK1xJw+azkoQCkg3aKg14IZbN2vSox33dNk+3lEms+lwKcy2FvdzaxNc
         t80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143165; x=1723747965;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTr7QPxZOv6ZANTvHJnD7itspZcoPGqbySruN9g+g4c=;
        b=Jpa2x9vidboWlzamSflokB9BmiP2p27RMhnMrBF0BmbPHpYq/Fl9Z0H2ZwR9nte2x8
         RiLCQFHCb+4OnAAhbzdTZTCLsRfFdKLw4G5Ox8q94eo2pd23vZZTqW8DISs5CwsMyWJ8
         kjc5MHRQxgnwBOlQHD3XiVWWoF/JuQ2lmC1VDvbtRSTb+7GTvwI3DJWrhlRKHKcIlxrn
         fOUZzpaYFji7u8fq1K6FVcJBdwbJTmVqhNNBg3XEyt1fZldEbWUQF4Twk2SeKz3uSDmM
         m5Fa3d+6PshWtSPyZn+F1C+6hnvH18X7X5iWmYgGf/XXjd7ytV7G9AqjcMBBxTt9k/zt
         U7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXZQguoG4Us13xLzdi3b/45C+LTewHuyC3SMd7tC6Xijv5oL1lcHHgiR9rzWirTaqAKO2Y1fNyNs/Mjf02hVSALp/dsVoJHF4J0IkNobQ==
X-Gm-Message-State: AOJu0YzNoI9q2aWmyWVdWAmhl62jEI7vTam/gy8ExDAnCFXuy2uuqPAs
	4cvj6529+0Dr3yzthkKmPkLUuIA9G3StuTCjFcZyy0pKA/aXqDNtQ9jg+0Yq5glGBeTevFCt1iw
	fI9Qk74apv4a0E7+zc6rcm9A93pKQ3hVC5vdA
X-Google-Smtp-Source: AGHT+IFCgJzX0rsSfextMUWKoTY+8ON0bM39EuVj+wqU5VsofAbRLMRUfcqJbeBCecOmrdKT/V+64+NhNCnphbPoezs=
X-Received: by 2002:a05:6402:268f:b0:58b:93:b624 with SMTP id
 4fb4d7f45d1cf-5bbbc7c62c2mr22073a12.1.1723143165252; Thu, 08 Aug 2024
 11:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
 <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
 <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
 <CALmYWFtAenAQmUCSrW8Pu6eNYMcfDe9R4f87XgUxaO4gsfzVQg@mail.gmail.com>
 <6i3f5bvcppm4bkpphcb7sxsopmeani5mg5irytc3nr464p24ka@jpno77j7cgyd>
 <CALmYWFvXKdfyvZTfu9D4GdBgeVHzLR2rXshqZMFPjU+FuAHJkQ@mail.gmail.com> <mayqavxl6vpod2tcgb6f727dqcbifaubfgeiiy2sdfsqhwrgej@tbm72lvz2lof>
In-Reply-To: <mayqavxl6vpod2tcgb6f727dqcbifaubfgeiiy2sdfsqhwrgej@tbm72lvz2lof>
From: Jeff Xu <jeffxu@google.com>
Date: Thu, 8 Aug 2024 11:52:07 -0700
Message-ID: <CALmYWFux0UbdX2WObsy5kiEMvgKThoKrShpCVpC6CVa2PuNSnA@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jeff Xu <jeffxu@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 8, 2024 at 11:46=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Jeff Xu <jeffxu@google.com> [240808 14:37]:
> > On Thu, Aug 8, 2024 at 11:08=E2=80=AFAM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Jeff Xu <jeffxu@google.com> [240807 23:37]:
> > > > On Wed, Aug 7, 2024 at 8:21=E2=80=AFPM Linus Torvalds
> > > > <torvalds@linux-foundation.org> wrote:
> > > > >
> > > > > On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
> > > > > >
> > > > > > Okay, I'm going to try one more time here.  You are suggesting =
to have a
> > > > > > conf flag to leave the vdso pointer unchanged when it is unmapp=
ed.
> > > > > > Having the close behind the conf option will not prevent it fro=
m being
> > > > > > unmapped or mapped over, so what you are suggesting is have a
> > > > > > configuration option that leaves a pointer, mm->context.vdso, t=
o be
> > > > > > unsafe if it is unmapped if you disable checkpoint restore.
> > > > >
> > > > This is a new point that I didn't realize before, if we are going t=
o handle
> > > > unmap vdso safely, yes, this is a bugfix that should be applied eve=
rywhere
> > > > for all arch, without CHECKPOINT_RESTORE config.
> > > >
> > > > Do we need to worry about mmap(fixed) ? which can have the same eff=
ect
> > > > as mremap.
> > >
> > > Yes, but it should be handled by vm_ops->close() when MAP_FIXED unmap=
s
> > > the vdso.  Note that you cannot MAP_FIXED over half of the vma as the
> > > vm_ops->may_split() is special_mapping_split(), which just returns
> > > -EINVAL.
> > >
> > The may_split() failure logic is specific to vm_special_mapping, right =
?
>
> Not really, it's just what exists for these vmas vm_ops struct.  It's
> called on every vma for every split in __split_vma().
>
> >
> > Do we still need to keep vm_special_mapping struct , if we are going to
> > treat  special vma as normal vma ?
>
> No, just set the vm_ops may_split to something that returns -EINVAL.
>
OK, that makes sense.

Thanks
