Return-Path: <linuxppc-dev+bounces-10378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102DB0F123
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 13:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnBgf6n0mz3bh0;
	Wed, 23 Jul 2025 21:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753270046;
	cv=none; b=lFujujEAv7MRtOPwm/NQlUDV7/hODtG/n/A1ILqciSxtibeIdnh1jQ+5c1jz7gysbxTklqjdX/cJJPkYHbEIayWk+hFGoP1nS7TCzaKsjAoVbHSeTwrJmUyDHTMiFGHCwgno9YMmnXhKwyu8UHxEcohymCrd+ONCRIRIlFtsfP2nplOJmbTQ8SbRvZAXZ9ByJidsioz+U1RF/DwtVFV3zA3SMmAKysfUaESqdFpYidMWulqootoMz+kh0yHXXOO/LKgr+3p8OREM2pbSLp1vTlgQvwXFK+am7eiu6/HfuRfd+dNRhuSBhXWMkFxoU31113sqFAsb39sKTQcoWsQ/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753270046; c=relaxed/relaxed;
	bh=HCWuYRG63599CeGL0cu+BIdFInFPtoPb0KezmWqBc2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anbHiC7si2L3pWMVawqng7Xsak+0RFmP8hzBf+hh65218IvaU8/LcylogEQXhqEy9egSVAdgB4LdZATzGj/oWHb9Gefo7lHkSTfjnxg2+0FHHa/vK6z98SgiMMs8gRStBDfWG4niOFpSGTXtGdxNwRkzJyI6lGn28fHSLAfu9osKDMQRbcMjMCNDCP3iJrnZiAuVwP3wpsH+7w59Q5U+Apq0bOgoOdW5YGCt2VMI8Z5Cv7I9yjoTVw/GKv3HSq891VcdVPPBg3AW6Iye4ZaihhKyyXaPnw2CWW/BRihATSnTPLzX/5OiSBtffL8om2YGab5ktTnY0gz22MNzFXrYNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUdVHNc/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SUdVHNc/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnBgf1GrBz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 21:27:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 320C15C0C32
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 11:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E81C4CEF6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753270043;
	bh=hD86L6FsrlkjppEeAolQw2+wF9G9eL2p4jeufpqBKxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SUdVHNc/aWpcFyqi0c/ImfOYjRQUiFP+rK1f80HK+AmhVgduX5msiRWhEhg1s+hiW
	 s7V5fsU/uhIBFeKySwzuXQ9BfdxVoYhid9ufOAKrdUj+5KF33m3lRUe8oxf0Cwfa3G
	 PAj6KQ4HGDysGEzUeqbGoXcEsGrTE+WGU8uiIskXtyhHc5ZVmHBzSVzbhah+PdKtkJ
	 B6bYI7NyCgjopp5nxtJIfyi2MQl9rYFcv0L6MFftn+yL2G/Azg205ACyhpuudVcnZK
	 Tw9kNx5J4K7v3JXj2/qR5a6ofMcynO7+qNQVdxzBIuF42MddOCjUhYN2cf+cvhsSyT
	 WFbNCzvSwVVDA==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-615950642d9so3685529eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 04:27:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkZxF3z/F715/zWwiLrTNnbcrqUlrFXcfB5M6epJmBmBCdc1crWWU07VBfmPTLwaq2QqUAaI7uxEJQuXo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YynQJUVOX2psU7gt3JSVI57ANWBDZ00L6QlUzGVe6el1gy35Mgg
	5wKrAAOLkza96671W05uE1c7XLd7y9k5xjl9Bci83aFWimgVQoU4nenIc8qiyXGeMniJj2kGAIC
	XSqDmSkxsUEF68M23yGBX+BOEien/rN4=
X-Google-Smtp-Source: AGHT+IFBBrTSzcKsgRsjEmVEi3AQj37BeFlkMYzSpLg5VvEYvowlyBOnql/yOqAWuu2WwDYjxLgaMwyjRGbr4TyyCQA=
X-Received: by 2002:a05:6820:1792:b0:615:d742:6672 with SMTP id
 006d021491bc7-6187d90ed5dmr1918110eaf.8.1753270043105; Wed, 23 Jul 2025
 04:27:23 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh> <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh> <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
 <2025072218-decipher-spree-327d@gregkh> <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
In-Reply-To: <awvdox3bgabbc42aamezlg33k4cje6y75qoxn7ruh3nhd4qv5n@u3spdahehad4>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Jul 2025 13:27:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iYBOephv29sj0DSKZVyF3JLBsoUCckhTbGcbYHUUhYyQ@mail.gmail.com>
X-Gm-Features: Ac12FXzC6e4YCoK78tnnsrW1OvCOkcpvLKri7HC2f5clbN5j5h64RJlwkH_QRPE
Message-ID: <CAJZ5v0iYBOephv29sj0DSKZVyF3JLBsoUCckhTbGcbYHUUhYyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 11:01=E2=80=AFAM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> On Tue, Jul 22, 2025 at 04:08:09PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> > > On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrot=
e:
> > > > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > > [...]
> > > > >         struct syscore;
> > > > >
> > > > >         struct syscore_ops {
> > > > >                 int (*suspend)(struct syscore *syscore);
> > > > >                 void (*resume)(struct syscore *syscore);
> > > > >                 void (*shutdown)(struct syscore *syscore);
> > > > >         };
> > > > >
> > > > >         struct syscore {
> > > > >                 const struct syscore_ops *ops;
> > > > >                 struct list_head node;
> > > > >         };
> > > > >
> > > > > Is that what you had in mind?
> > > >
> > > > I missed the list_head, so yes, this would be better, but don't pas=
s
> > > > back the syscore structure, how about just a void * instead, making=
 the
> > > > whole container_of() stuff go away?
> > >
> > > Yeah, that's a possibility. I personally don't like passing the void =
*
> > > around because it's easier to make mistakes that way. I also find it
> > > unintuitive because it doesn't immediately show you what the function=
s
> > > expect.
> > >
> > > My understanding is that the container_of() should get optimized away
> > > most of the time, so there aren't any obvious downsides that I can se=
e.
> >
> > container_of() is just pointer math, but a cast is even faster :)
> >
> > > But I don't feel very strongly, so if you have a strong preference fo=
r
> > > void pointers, I can do that.
> >
> > That's what you really want to have here, it's a syscore data type
> > thing, that the callback wants to reference.  Just like a irqrequest_t
> > function passes back a void * that the handler "knows" how to deal with
> > properly.
>
> IRQ handlers are different, though, because you pass the void * data
> when you register the interrupt. That void * then gets stored and passed
> to the handler when the interrupt is processed.
>
> We'd have to change it to something like this:
>
>         struct syscore_ops {
>                 /* parameters now changed to driver-specific data */
>                 int (*suspend)(void *data);
>                 void (*resume)(void *data);
>                 void (*shutdown)(void *data);
>         };
>
>         struct syscore {
>                 const struct syscore_ops *ops;
>                 struct list_head node;
>                 /* NEW driver-specific data */
>                 void *data;
>         };

I like this more than the original, but I would do

struct syscore_ops_ops {
                 int (*suspend)(void *data);
                 void (*resume)(void *data);
                 void (*shutdown)(void *data);
};

struct syscore_ops {
                 struct list_head node;
                 const struct syscore_ops_ops *ops;
                 void *data;
};

and change register_syscore_ops() to take three arguments, the struct
syscore_ops pointer, the (constified) struct syscore_ops_ops one, and
the (void *) data one.

Note that it is not necessary to change the signature of
unregister_syscore_ops() in this case.

> It ends up increasing the syscore structure's size, about 33%, though
> given that there aren't a lot of these that's probably negligible.

That's not a problem IMV.

> What I think is a bit more unnatural about it in this case is that we
> embed the struct syscore into some driver-private data anyway so that
> it becomes per instance, and then we have a circular reference:
>
>         foo->syscore.ops =3D &foo_syscore_ops;
>         foo->syscore.data =3D foo;

That depends because "data" need not be "foo" in all cases, but also
see above.  If the initialization of struct syscore_ops is all done by
register_syscore_ops(), it doesn't look circular any more.

> Which looks kind of weird. Alternatively I suppose we could completely
> rework it and make register_syscore_ops() allocate struct syscore, and
> hide the internals from drivers completely:
>
>         err =3D register_syscore(&foo_syscore_ops, foo);
>
> With that it may be problematic that register_syscore() can now fail.

Yes, that might be a problem.

