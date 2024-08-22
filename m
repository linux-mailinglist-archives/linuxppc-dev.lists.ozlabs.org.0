Return-Path: <linuxppc-dev+bounces-401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7595C072
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 23:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqcRd4RdTz2ydR;
	Fri, 23 Aug 2024 07:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724351169;
	cv=none; b=cvEN71qf1do0VbsYoyl2Jojx1qpHFoHAYPAtNprFfooplnERlE7kZ8UUUWGczfNlXwWyQtpCNGjcKltQyCcohh7DYT8Nf40vInKfaewxrp+ga2DskA+nDeD7CVvzhAtJGg0gINHlAmWZ8gZBRBt+Ifie3ko2WrjS6JHJxEEXw0S/tnPqqpm4/MnPFU4Q3haJE+KpKR3nbrYiThbgu1Gcf0Nusks4xjL1HC8MA3U0izYeOZ56JmLsDfgPBTiSt32l1CsE4un1yZBEen8TSV6i3XHSSFuycQcp/PVVX5ZUenLyXkTJnvDh59KP2wGmJiWkdM1qd1FjL/ubLa0wAWhBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724351169; c=relaxed/relaxed;
	bh=6p418Z4MQi42oSf8ol2Xw4I/4J2hnbB9ETwflGJWaq4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	b=kgF9D1btP8n8NOi6fAP6rrok5ta/PlMiBTkwF9OP0SRsfEpK9k27JW+1It81bXQrDalzcJADiifV0ze76/16SDowr3v0tdA2g/54sKqL8bjy5iQr2CIuZ3pwIFY2qQMLse+u0Hv7kHfXS3DeRd7APXquV4j9308gqw+He05d35xhkN3JmUzIuWXSUZ+SEf52vVh9/Xm/wJwLqSOng7p6/ugW/YK1h/RJ3rezDTty7aoE5GrNVbOphf9iMGe65hs4F24n1AGI26u4dNvptb+DeSkIQhm/WTSdycm76gUUGGc7hyCH8FMalkBJQF8pvrA4afCd3evulcVTRGGAMFBhiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ehIFpalA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ehIFpalA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqWqN38sYz2xHx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 04:26:07 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4518d9fa2f4so48371cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724351164; x=1724955964; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p418Z4MQi42oSf8ol2Xw4I/4J2hnbB9ETwflGJWaq4=;
        b=ehIFpalAjScDHOPxrW2lj46BTmItdER8KpeIU0cWDjr3aMXQ6/7os7Y0qWs5YIoDTu
         Ti0PiK9l3hkhksFRo8IPMcNDf5dO2nNnK58oURjZcf36W84gnzXLZhq1DVzPl6ilqI7u
         7czlPKyfx4fXHV0O9blXfHAO2pVwYfSyH87NRXldcKlH0/5Bb77LfDkgKOsHEuguKl8T
         GU1vfrdAgBRuB51JHiBzKrT+oo38u1hSGjagT0Rl3E5skc2AIx3o0P6y7BxbhkMQJA/g
         SilcyIstb3C8/Dqlph40GulCy66n8StbiA9SOHeSjRMZJDkMOYQLAs5eh4NDIQyZGAAa
         Q7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351164; x=1724955964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6p418Z4MQi42oSf8ol2Xw4I/4J2hnbB9ETwflGJWaq4=;
        b=LFaZlW6+B8UbPlATxaSyKdicFDKnZ0jrkRgIwj4ZDt01mqwoYwAqqMBWJzGN1GFoLf
         NtYK7+uqPd6bkgvTayc9ofhXel4gJwQnfPDwxAfRPE5P2FPJuDZoMqPyWM1ztpi/MoyK
         vPkjWrQ9MuF+JAQahoo2CbOOQ5kwc3gDyPqHOT/Cm+vODZtUI27pptpa6eggYsKD0Ttv
         qBsC99utkZrZCP6uoZGIj6/6XfGkicRAcqUv3mbMAD69x3vxWv5X5GVj8krp6mHhLmBI
         WhgUxL0zx6c7Wdxm8BJe5kUwiwmKo3zzo7sfGO4jnjZQWDjEfFEUKTcZ3Ol/FEvpu2mL
         76pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCYFNzWPGuxjcCyHjgXZN3yMyFUyIumlZPKyrwrs/+OuPE2jt4NTgQlqSKYkfhk+G7YVmphIMbJB9xAWo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7Ff7T8uH7ia3F55sV4swISB64H/xqmkO1tAPdIDPu7x/L308p
	F/UxxdvRbxQQwtSg5Bfrwzp+C+Tmxc4cPwsDV0cozKKcQ815C9maloD/Jut6jEwdXoG0uxFo2Xw
	2enEr0LnUquRpmEAI0Ji8bK+VAzV7N/Y2JnaJ
X-Google-Smtp-Source: AGHT+IHPeiV99D7daRsKnTWDhstcTDm11fYIwJKMAhI238wQwqTBIaxq0HTyqyGFekhtKbBv8khbPbBFyLen6RpqTh8=
X-Received: by 2002:a05:622a:5c6:b0:441:5e6c:426c with SMTP id
 d75a77b69052e-45508582404mr133381cf.17.1724351164206; Thu, 22 Aug 2024
 11:26:04 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240629153128.4660755c@yea> <20240721010926.60efacc3@yea>
 <b5ae7797-7676-4abf-82be-e2ce4d9238a1@cs-soprasteria.com> <CAJuCfpH9e0zvrBK8A_TEHO=maHqijjPcC21=To7VU-mmp0ZYBQ@mail.gmail.com>
In-Reply-To: <CAJuCfpH9e0zvrBK8A_TEHO=maHqijjPcC21=To7VU-mmp0ZYBQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 22 Aug 2024 11:25:52 -0700
Message-ID: <CAJuCfpGDzaW9mA3TYxFJ0y6kM7bvNt0wbBy_vRdmN+pRGFNfQg@mail.gmail.com>
Subject: Re: Kernel build failure with MEM_ALLOC_PROFILING=y set (Talos II, v6.10-rc5)
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Erhard Furtner <erhard_f@mailbox.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:04=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Aug 22, 2024 at 10:18=E2=80=AFAM LEROY Christophe
> <christophe.leroy2@cs-soprasteria.com> wrote:
> >
> >
> >
> > Le 21/07/2024 =C3=A0 01:09, Erhard Furtner a =C3=A9crit :
> > > [Vous ne recevez pas souvent de courriers de erhard_f@mailbox.org. D?=
couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdenti=
fication ]
> > >
> > > On Sat, 29 Jun 2024 15:31:28 +0200
> > > Erhard Furtner <erhard_f@mailbox.org> wrote:
> > >
> > >> I get a build failure on v6.10-rc5 on my Talos II when MEM_ALLOC_PRO=
FILING=3Dy is enabled:
> > >>
> > >> [...]
> > >>    LD [M]  fs/xfs/xfs.o
> > >>    LD [M]  fs/bcachefs/bcachefs.o
> > >>    AR      built-in.a
> > >>    AR      vmlinux.a
> > >>    LD      vmlinux.o
> > >>    OBJCOPY modules.builtin.modinfo
> > >>    GEN     modules.builtin
> > >>    GEN     .vmlinux.objs
> > >>    MODPOST Module.symvers
> > >> ERROR: modpost: "page_ext_get" [arch/powerpc/kvm/kvm-hv.ko] undefine=
d!
> > >> ERROR: modpost: "mem_alloc_profiling_key" [arch/powerpc/kvm/kvm-hv.k=
o] undefined!
> > >> ERROR: modpost: "page_ext_put" [arch/powerpc/kvm/kvm-hv.ko] undefine=
d!
> > >> make[2]: *** [scripts/Makefile.modpost:145: Module.symvers] Fehler 1
> > >> make[1]: *** [/usr/src/linux-stable/Makefile:1886: modpost] Fehler 2
> > >> make: *** [Makefile:240: __sub-make] Fehler 2
> > >>
> > >> Same .config builds fine without MEM_ALLOC_PROFILING set. Kernel .co=
nfig attached.
> > >
> > > Build problem still there on now released v6.10 with MEM_ALLOC_PROFIL=
ING=3Dy.
> > >
> > > Can't bisect as build with MEM_ALLOC_PROFILING fails since it's intro=
duction in v6.10-rc1.
> > >
> >
> > I guess those three functions are missing EXPORT_SYMBOL_GPL() tagging.
>
> The issue should have been fixed by
> https://lore.kernel.org/all/20240717181239.2510054-1-surenb@google.com/
> patchset. I probably forgot to CC stable@ for these changes. Let me
> check and follow up.

The issue is fixed by the patch titled "alloc_tag: outline and export
free_reserved_page()" which has b3bebe44306e SHA in Linus' tree and
first appears in v6.10.3 with SHA 4a9a52b70cce.


> Thanks,
> Suren.
>
> >
> > Christophe

