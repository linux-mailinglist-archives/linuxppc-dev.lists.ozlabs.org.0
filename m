Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AB671499
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:03:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxcCp2G3Zz3bfy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 18:03:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DSgHVawM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DSgHVawM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxcBr22wqz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 18:02:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA13CB81B79
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 07:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B30FC4339C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674025327;
	bh=hpCZZmsqf4/6Mxu3Z+UTxXvwuRL1LaW+0KrqiGLzrlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DSgHVawM2Lsbp1jqLhhrzzbXJt2A/+zta9eAwgCv3451lTKsCGx3Xy0LDIRX49ICc
	 NK+gQKeOG47zXzt54pg53kZEJ0P+rQrFot+WzXi/WdNiD/QGHjAVcP6LhEYXIuneX7
	 aV8/FNmafMuswBPQHR2WAe4H+Ii+7BaO5BA3DNheJdnY+dpib9ZU1WdrN9gxvSo6a6
	 i7suaS0Ta2qvPrl2vJf/2GkourBl7CrW5Tb9VSF1uGS0nGGIbKyFchzA8bVZhYYyaE
	 SqkgWJM/vhO98tSNVK2vAX4kmmPVlGuM3Cvzjjgc8pmU5wNZPIC2PJxGWK4P2z/JhW
	 TwZ8CbFBzGKyA==
Received: by mail-oi1-f181.google.com with SMTP id d188so16767267oia.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 23:02:07 -0800 (PST)
X-Gm-Message-State: AFqh2ko7zQ3tcRsCB/8xj9Am722SQPX/v8g0b25Pb85DwAXyNlhVxzaY
	X2zhSnfh4oxSdAjsa4ZPeTzBL+trYIZ31Xg6+pY=
X-Google-Smtp-Source: AMrXdXsA6TO3KoaA5mmSLZluzpXf4b6ZeQmXmJvwyWq+RJVZeL/soOW8ymGGgGshJhB/twbLBiGcGi2bdeQkWA3W1WE=
X-Received: by 2002:aca:acd5:0:b0:364:5d10:7202 with SMTP id
 v204-20020acaacd5000000b003645d107202mr275302oie.194.1674025326155; Tue, 17
 Jan 2023 23:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20230111161155.1349375-1-gary@garyguo.net> <20230112214059.o4vq474c47edjup6@ldmartin-desk2>
 <20230113181841.4d378a24.gary@garyguo.net> <20230117175144.GI16547@kitsune.suse.cz>
 <20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
In-Reply-To: <20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Jan 2023 16:01:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsuszFR7JB5ZkqVS1W=hWr9=E7bTf+MvgJ+NXT3aZNwg@mail.gmail.com>
Message-ID: <CAK7LNATsuszFR7JB5ZkqVS1W=hWr9=E7bTf+MvgJ+NXT3aZNwg@mail.gmail.com>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Gary Guo <gary@garyguo.net>, Nicolas Schier <nicolas@fjasle.eu>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 4:23 AM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Tue, Jan 17, 2023 at 06:51:44PM +0100, Michal Such=C3=A1nek wrote:
> >Hello,
> >
> >On Fri, Jan 13, 2023 at 06:18:41PM +0000, Gary Guo wrote:
> >> On Thu, 12 Jan 2023 14:40:59 -0700
> >> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >>
> >> > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:
> >> > >
> >> > > struct modversion_info {
> >> > >- unsigned long crc;
> >> > >- char name[MODULE_NAME_LEN];
> >> > >+ /* Offset of the next modversion entry in relation to this one. *=
/
> >> > >+ u32 next;
> >> > >+ u32 crc;
> >> > >+ char name[0];
> >> >
> >> > although not really exported as uapi, this will break userspace as t=
his is
> >> > used in the  elf file generated for the modules. I think
> >> > this change must be made in a backward compatible way and kmod updat=
ed
> >> > to deal with the variable name length:
> >> >
> >> > kmod $ git grep "\[64"
> >> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint32_t)];
> >> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint64_t)];
> >> >
> >> > in kmod we have both 32 and 64 because a 64-bit kmod can read both 3=
2
> >> > and 64 bit module, and vice versa.
> >> >
> >>
> >> Hi Lucas,
> >>
> >> Thanks for the information.
> >>
> >> The change can't be "truly" backward compatible, in a sense that
> >> regardless of the new format we choose, kmod would not be able to deco=
de
> >> symbols longer than "64 - sizeof(long)" bytes. So the list it retrieve=
s
> >> is going to be incomplete, isn't it?
> >>
> >> What kind of backward compatibility should be expected? It could be:
> >> * short symbols can still be found by old versions of kmod, but not
> >>   long symbols;
> >
> >That sounds good. Not everyone is using rust, and with this option
> >people who do will need to upgrade tooling, and people who don't care
> >don't need to do anything.
>
> that could be it indeed. My main worry here is:
>
> "After the support is added in kmod, kmod needs to be able to output the
> correct information regardless if the module is from before/after the
> change in the kernel and also without relying on kernel version."
> Just changing the struct modversion_info doesn't make that possible.
>
> Maybe adding the long symbols in another section? Or ble
> just increase to 512 and add the size to a
> "__versions_hdr" section. If we then output a max size per module,
> this would offset a little bit the additional size gained for the
> modules using rust. And the additional 0's should compress well
> so I'm not sure the additional size is that much relevant here.





I also thought of new section(s) for long symbols.



One idea is to have separate sections for CRCs and symbol names.




section __version_crc:
   0x12345678
   0x23456789
   0x34567890


section __version_sym:
  "very_very_very_very_long_symbol"
  "another_very_very_very_very_very_long_symbol"
  "yet_another_very_very_very_very_very_long_symbol"




You can iterate in each section with this:

   crc +=3D sizeof(u32);
   name +=3D strlen(name) + 1;


Benefits:
  - No next pointer
  - No padding
    - *.mod.c is kept human readable.





BTW, the following is impossible
because the pointer reference to .rodata
is not available at this point?

struct modversion_info {
     u32 crc;
     const char *name:
};



--=20
Best Regards
Masahiro Yamada
