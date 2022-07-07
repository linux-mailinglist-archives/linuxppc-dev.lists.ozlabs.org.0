Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F7A56A1CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 14:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdwNm5qX4z3c6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 22:15:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c6GPYqCO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c6GPYqCO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c6GPYqCO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c6GPYqCO;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdwN26LNwz3bk9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 22:15:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657196108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbs481tHsGM89XED3giouE72pimnkluKaWbGcj8hSD4=;
	b=c6GPYqCOG8Dcbh+Jj5vdktJuQX2UUTLhMwe++n+Vxi0NPVxmAIyLQqGyFoJhqYyG1xgBpn
	AtsrnaBo48jv6qYhxeC6SbPIqbjo+SLcvanApg5uqkhhcf2+/O4tz85MGn6P4NpW7SllM4
	rh9fNxJNXpyAmY/Z0Pre9DLBbkqQhHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657196108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbs481tHsGM89XED3giouE72pimnkluKaWbGcj8hSD4=;
	b=c6GPYqCOG8Dcbh+Jj5vdktJuQX2UUTLhMwe++n+Vxi0NPVxmAIyLQqGyFoJhqYyG1xgBpn
	AtsrnaBo48jv6qYhxeC6SbPIqbjo+SLcvanApg5uqkhhcf2+/O4tz85MGn6P4NpW7SllM4
	rh9fNxJNXpyAmY/Z0Pre9DLBbkqQhHo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-ENJQs2zLMa2gMWQ8TDz6Zw-1; Thu, 07 Jul 2022 08:15:06 -0400
X-MC-Unique: ENJQs2zLMa2gMWQ8TDz6Zw-1
Received: by mail-lj1-f199.google.com with SMTP id k3-20020a2ea283000000b0025bcd580d43so5306549lja.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jul 2022 05:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mbs481tHsGM89XED3giouE72pimnkluKaWbGcj8hSD4=;
        b=XQkrHJx6nMrKNT7+GVXX+7y7uAmWGToId8YdRo8Sz8j6qOFTZlDg2MA776JCXowb8T
         qC3oeREgEU/IJJI8yd3JV4NsMsx9YY+1Aybn5OwrTfJ2DDBfVGP07hA37kAs/wQvKfqD
         U0VVCtpEjNOGyBMoB3zsGlik5m0GbgqGbT2xeQO7KaaErfd+MBrobxVc59DYA1A+vaHi
         Q0N4AQnkEk2B9N7b/OJcfTdr+H/Ordzf60rHS1Qin1vFMXCtR77kA46Ki3JHODLGaf6H
         +BKlrK6aOuZnpCFVW8kzNdjC9yZbMCQIQ6W8ixiL3iVuxNJKK4y6wIqSowM09Mp6Hn+k
         ZZNQ==
X-Gm-Message-State: AJIora/7/MifpXT3vl4vZRcZEkHxKU/ecCSuHXQVBVuITMIUajzfJBMe
	10l0+QXZRSgA+v6ifekdy/PpHiU5iRqFy2XbwDsh9Ikpm8FR3EmzvuefEN/V2359fQtTEHc6dqW
	YzSv5cTenuWwCoUjcrTDWw7g6Xsa3JO3RXOrhtJZDgA==
X-Received: by 2002:a2e:bf21:0:b0:25d:4b4b:f2aa with SMTP id c33-20020a2ebf21000000b0025d4b4bf2aamr3103342ljr.503.1657196103242;
        Thu, 07 Jul 2022 05:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMcH0UiUDOPP/H8I4asZFfJr+vM8ihLQnz0V+NqvLvZrKYzOgKLoxJDbByYdvsOJ1Z+jbM8lUG9WQnWttAA2M=
X-Received: by 2002:a2e:bf21:0:b0:25d:4b4b:f2aa with SMTP id
 c33-20020a2ebf21000000b0025d4b4bf2aamr3103326ljr.503.1657196103018; Thu, 07
 Jul 2022 05:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <920acea9aa18e4f2956581a8e158bdaa376fdf63.1629203945.git.jstancek@redhat.com>
 <95f35287-3d66-1788-e54c-7275fdba16ac@csgroup.eu>
In-Reply-To: <95f35287-3d66-1788-e54c-7275fdba16ac@csgroup.eu>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 7 Jul 2022 14:14:47 +0200
Message-ID: <CAASaF6xZXjEYEUnkMQh0Ke24d=iJo-SZFdwuGQgrqZbbmMtGfg@mail.gmail.com>
Subject: Re: [PATCH/RFC] powerpc/module_64: allow .init_array constructors to run
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: lkml <linux-kernel@vger.kernel.org>, Wedson Almeida Filho <wedsonaf@google.com>, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 7, 2022 at 1:20 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 17/08/2021 =C3=A0 15:02, Jan Stancek a =C3=A9crit :
> > gcov and kasan rely on compiler generated constructor code.
> > For modules, gcc-8 with gcov enabled generates .init_array section,
> > but on ppc64le it doesn't get executed. find_module_sections() never
> > finds .init_array section, because module_frob_arch_sections() renames
> > it to _init_array.
> >
> > Avoid renaming .init_array section, so do_mod_ctors() can use it.
> >
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
>
> Does commit d4be60fe66b7 ("powerpc/module_64: use module_init_section
> instead of patching names") fixes your issue ?

Yes, it does gcov for me. Thanks

>
> If not, please rebase and resubmit.
>
> Thanks
> Christophe
>
>
> > ---
> > I wasn't able to trace the comment:
> >    "We don't handle .init for the moment: rename to _init"
> > to original patch (it pre-dates .git). I'm not sure if it
> > still applies today, so I limited patch to .init_array. This
> > fixes gcov for modules for me on ppc64le 5.14.0-rc6.
> >
> > Renaming issue is also mentioned in kasan patches here:
> >    https://patchwork.ozlabs.org/project/linuxppc-dev/cover/202103191440=
58.772525-1-dja@axtens
> >
> >   arch/powerpc/kernel/module_64.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/modu=
le_64.c
> > index 6baa676e7cb6..c604b13ea6bf 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -299,8 +299,16 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
> >                                         sechdrs[i].sh_size);
> >
> >               /* We don't handle .init for the moment: rename to _init =
*/
> > -             while ((p =3D strstr(secstrings + sechdrs[i].sh_name, ".i=
nit")))
> > +             while ((p =3D strstr(secstrings + sechdrs[i].sh_name, ".i=
nit"))) {
> > +#ifdef CONFIG_CONSTRUCTORS
> > +                     /* find_module_sections() needs .init_array intac=
t */
> > +                     if (strstr(secstrings + sechdrs[i].sh_name,
> > +                             ".init_array")) {
> > +                             break;
> > +                     }
> > +#endif
> >                       p[0] =3D '_';
> > +             }
> >
> >               if (sechdrs[i].sh_type =3D=3D SHT_SYMTAB)
> >                       dedotify((void *)hdr + sechdrs[i].sh_offset,
>

