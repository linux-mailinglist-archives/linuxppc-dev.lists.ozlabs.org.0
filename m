Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F9480F42A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:14:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=frt2DgIx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQFg3Dwpz3cYM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:14:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=frt2DgIx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqQDK1xSLz3vvp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:13:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8FE53CE1B13
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 17:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BC4C433D9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401182;
	bh=4yWYmE/DRvHAlnZ1tMbGP2mLOASDX61NVZr6sxZQp08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=frt2DgIxxVUIDpz9ugeUKQdbgoXakx5eSLeVHTSQYujVg+4pizCwq0H62/MdjQge5
	 LYwpolivJTZrBAMW7iL94iV/9pleEi4htc54wCMr/4rJcxGoT5veMFGNHV9a535du0
	 3Zn2YwwKCQ8ZAZCzfpC6+qqjCX2RPUrDiyyol8NUU6/rYiZQUDgASIqM/M4GVvohxK
	 4bE5RTjVfMDcczu0jM+tdpCXmibdcBvLwZUUr24DqkjgLecyda4JudFC4NhOyMOy8L
	 +8icuNT21bXLZ/jXarnG9GOivCZqW6g06NhYlz+J6Coha4uiVoSRLpNxwDVm45aRum
	 yrpcOhywmBptg==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1fa1c3755afso2712998fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 09:13:02 -0800 (PST)
X-Gm-Message-State: AOJu0YwOF9TpcKwZQgnQR7d62nClCs5jG5MumT7MUcMMH4gUrrKtUoj0
	dwlVW7yYUsdmhkbx4yYBy/ffP8M5le1+q0zczsQ=
X-Google-Smtp-Source: AGHT+IHraLbF7YjSFhetachJvzxO22AYS7Jip6CX8bYSjGuoeCO31kySDnGI6gF/HNEhU6tnDdqj+rkvRnvfAasT2Co=
X-Received: by 2002:a05:6871:721:b0:1fb:75a:6792 with SMTP id
 f33-20020a056871072100b001fb075a6792mr2998266oap.57.1702401181327; Tue, 12
 Dec 2023 09:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20231212161610.100862-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20231212161610.100862-1-matthias.schiffer@ew.tq-group.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 Dec 2023 02:12:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQhVJ6kYC_+LutUzE9m-dQmaZ2HnWbLcOj54w5LZJe2FA@mail.gmail.com>
Message-ID: <CAK7LNAQhVJ6kYC_+LutUzE9m-dQmaZ2HnWbLcOj54w5LZJe2FA@mail.gmail.com>
Subject: Re: [PATCH] Reapply "kbuild: Create directory for target DTB"
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 13, 2023 at 1:17=E2=80=AFAM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> This reverts commit dd7699e37f289fa433f42c6bcc108468c8b198c0.
>
> On powerpc, dtb-y is usually empty unless CONFIG_OF_ALL_DTBS is set. Whil=
e
> passing a DTB as a make target explicitly works fine, individual DTB
> builds may also be pulled in as dependencies by cuImage.% and similar
> targets. In this case, nothing creates the arch/powerpc/dts directory,
> causing out-of-tree builds to fail.
>
> Fixes: dd7699e37f28 ("Revert "kbuild: Create directory for target DTB"")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---



NACK.

%.dtb is generated by if_changed_dep.

Each Makefile is responsible for adding %.dtb to 'targets'
if it is pulled in as dependencies of other images.

If it does not work for PowerPC, it is a bug in PowerPC Makefile.


Just checking arch/powerpc/boot/Makefile,
it adds dts/%.dtb and dts/fsl/%.dtb to 'targets'. [1] [2]

cuImage.% should be file, but it does not cover all images.

Fix arch/powerpc/boot/Makefile.



[1] https://github.com/torvalds/linux/blob/v6.7-rc5/arch/powerpc/boot/Makef=
ile#L386
[2] https://github.com/torvalds/linux/blob/v6.7-rc5/arch/powerpc/boot/Makef=
ile#L388



>  scripts/Makefile.lib | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1a965fe68e011..3fe0fc46badfe 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -389,7 +389,8 @@ $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
>         $(call if_changed,wrap_S_dtb)
>
>  quiet_cmd_dtc =3D DTC     $@
> -cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc=
-tmp) $< ; \
> +cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
> +       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp)=
 $< ; \
>         $(DTC) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>


--
Best Regards

Masahiro Yamada
