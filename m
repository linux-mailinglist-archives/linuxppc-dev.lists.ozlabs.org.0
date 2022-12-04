Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893F641ABB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 05:52:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NPvRw1MQJz3cDM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 15:52:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k5mVMRjq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k5mVMRjq;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NPvQ74GKSz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Dec 2022 15:50:54 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id d128so10640572ybf.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Dec 2022 20:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll505mTuuhfLc1+XZSIHO0whLDL6v0gWWrPnec0ii4Y=;
        b=k5mVMRjqX7Si5uG9z+Uscvrtps9Lm4l+J08vtkBLLMictjduN7yw83tsE++Hu+Y+Aj
         tzGMjHp1B1DVBsHBeaAno3yi2BVO1izqPQNjfE9efhoNad2WkUqtmN+u5ck7CRIJRDjF
         YM/dl+7BGD8/nxeEUA1XSJ81WAfcs6vkCLEGMF0P2bL6CTiqD6TUfX0qPUwprGQelNlI
         Y8aZ2lCfq+dEaYid+X7MscI8qzgPVVQAZJUwygBrxro7blbU3pOBNekJtI9+G2UshZ3G
         GHc7S9u550foOhzqlp8cvkhkpghQSTF1P8bew1u3cg2NPkmwUqUch+maLgoYjzwwvL3H
         yPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll505mTuuhfLc1+XZSIHO0whLDL6v0gWWrPnec0ii4Y=;
        b=WbW0MdGPfhTBAS6HS0kWCmdp4VQRt6v0luWWOxAbpOqNMD/DauvIPsgOcU5Cq7sa4s
         RCoRRXDwYC6WgIcC4YybaCM25UIkrt/bBLguqA9h3tVxI/NmKrs/KgGgsceJbX9yK+Eq
         JlTzPiXIGoV9TUjo/weWJcVCP4CRqssQdDLssO+UC24NyCqbvZuejbmhmo24lGnRgsmv
         3Bf95lrKcrIA2CPdNGtgBgGWVRm21XIUCefvlrw3q37B2ENlJ+oflocIuj95BZPjjCVy
         f26lvpH8k4sO6PWkyVcMmrmHiqt/f2hotKn7ihoknf1xERpBXGRJbIpFrP5mUvu9bEnx
         e2ig==
X-Gm-Message-State: ANoB5pltdEHGc9tTOlux0cVnNEfcs9SzmwPtQBt7iZsK3uzXPTumPCsO
	OTMR96cEJXvS68CblzmqWRtEA7xw72Fck0ktfwNL9A==
X-Google-Smtp-Source: AA0mqf52pBcclC9lDKWIBghKNsRoQBaHiaJZlm0JdUCM7v2WBwAs6EPMpN3sOutADe/7qyKy21QWPgWJqBBadM6ij9I=
X-Received: by 2002:a25:ae08:0:b0:6fc:e336:3785 with SMTP id
 a8-20020a25ae08000000b006fce3363785mr10299755ybj.166.1670129451952; Sat, 03
 Dec 2022 20:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
 <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu> <20221115004625.x4wl6zbg4iiuxl5t@google.com>
In-Reply-To: <20221115004625.x4wl6zbg4iiuxl5t@google.com>
From: Fangrui Song <maskray@google.com>
Date: Sat, 3 Dec 2022 20:50:40 -0800
Message-ID: <CAFP8O3LdSJCChGEwT57e=iZopceYkBFuW9XD=yhO1ZszVZGm4g@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 14, 2022 at 4:46 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-11-14, Christophe Leroy wrote:
> >
> >
> >Le 28/09/2022 =C3=A0 07:25, Fangrui Song a =C3=A9crit :
> >> On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> wro=
te:
> >>>
> >>> On 2022-08-30, Fangrui Song wrote:
> >>>> The actual intention is that no dynamic relocation exists. However, =
some
> >>>> GNU ld ports produce unneeded R_*_NONE. (If a port is not care enoug=
h to
> >>>> determine the exact .rel[a].dyn size, the trailing zeros become R_*_=
NONE
> >>>> relocations. E.g. powerpc64le ld as of 2.38 has the issue with
> >>>> defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So =
just
> >>>> ignore them.
> >>>>
> >>>> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS =
is a
> >>>> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which =
are
> >>>> not called "absolute relocations". (The patch is motivated by the ar=
m64
> >>>> port missing R_AARCH64_RELATIVE.)
> >>>>
> >>>> While here, replace "egrep" with "grep" as "egrep" is deprecated in =
GNU
> >>>> grep 3.7.
> >>>>
> >>>> Signed-off-by: Fangrui Song <maskray@google.com>
> >>>> ---
> >>>> [...]
> >>>>
> >>>
> >>> Ping.
> >>
> >> Ping^2 :)
> >
> >Can you explain which ARCH_REL_TYPE_ABS can be removed with this change =
?
> >How is the verification done if ARCH_REL_TYPE_ABS is removed ?
>
> All ARCH_REL_TYPE_ABS relocation types can be removed. As explained, the
> real intention is to check no dynamic relocation, and this is done by
> the new
>
>    cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q "R_\=
w*_"; \
>
> in this patch.
>
> grep -v _NONE is to work around some GNU ld ports (and likely older relea=
ses
> of some ports even if their latest versions are fixed) which produce
> unneeded R_*_NONE dynamic relocations.

Ping :)
