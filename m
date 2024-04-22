Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8A8ACC89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 14:11:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q1BsL9i4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNPHF6qMkz3d24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 22:11:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q1BsL9i4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNPGV2fK7z3cTv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 22:10:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52C9CCE0B65
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 12:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218B6C4AF0A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713787836;
	bh=a/jkvHDgvp+aCgDbduR+rR6Jv2ent2+kn/DG9bps3JA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q1BsL9i4sLhSthk7FETePYybI8nJ8qcbcLdVs5boz4b9rThuxt5r/RpZrPZNIF0Z7
	 DBwZFAX3OuhHc64ZdDaPyerKaO+/+0iyeJKt902BPRglrCUwBDobb/Ph9NvaBf8uFd
	 EoJjvR5yc1ECv2nIzJGez86vy+c8YdMKLUb9QwCecu9Axy+w+GwY5FreO/hJeIiSUO
	 BNSmCAACQcl9bV11rVORk4WwYXdloG4mLfIwvvvtiiycBgADiEytWqk0MFD97F1rYx
	 mxxAKsW+L9BX5IJ8oc1DBC3qSthSadefDWtP62Fyfo6GdMZWXR0n/PyHFd9gHPeLZE
	 3Fuo8P8FV4zyA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d895138ce6so61010051fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 05:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQTmC7UQDfMF24gvGgkMToH02OOwDx++2Jhj74Sr3WqLy4gWADuTWt+AfN7ND0rJXLBFo2XsVkcex7gs0+QoMzLeFf2tqWgLtVZEz1lg==
X-Gm-Message-State: AOJu0Yz+n9u/OwLnOT2nmaHchhUylwTEzNuGM0V0EDdKRcSpyA3BhVss
	wG2xnkBN70tmpMQ44gVHQOvRLgej1eZU1JWF8lfB2qq7rLVUf6Kr6146wsipfO4ArugGojA4ivi
	+XfZxJI6MfPbk3BdCIvcNFfr7sbg=
X-Google-Smtp-Source: AGHT+IFnT9oIlydPM9slHFIGQ4nlDyC4pxuRciGfVPGp92isj1tegycIlBBjmx5VvPj+2j4jccvDvssOYt9K0St2uGM=
X-Received: by 2002:a2e:a554:0:b0:2da:50f8:dfab with SMTP id
 e20-20020a2ea554000000b002da50f8dfabmr6690473ljn.7.1713787834707; Mon, 22 Apr
 2024 05:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240422092206.147078-1-sv@linux.ibm.com>
In-Reply-To: <20240422092206.147078-1-sv@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Apr 2024 21:09:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
Message-ID: <CAK7LNAR3R2MfP69pbXNYx3TCeQiaC-Pjb=zfnMifHRUvhCQA6w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] objtool: Run objtool only if either of the config
 options are selected
To: Sathvika Vasireddy <sv@linux.ibm.com>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, peterz@infradead.org, mahesh@linux.ibm.com, mingo@kernel.org, nathan@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 22, 2024 at 6:25=E2=80=AFPM Sathvika Vasireddy <sv@linux.ibm.co=
m> wrote:
>
> Currently, when objtool is enabled and none of the supported options
> are triggered, kernel build errors out with the below error:
> error: objtool: At least one command required.


Then, I think CONFIG_OBJTOOL should be disabled.


>
> To address this, ensure that objtool is run only when either of the
> config options are selected.
>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  scripts/Makefile.lib | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3179747cbd2c..c65bb0fbd136 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -286,7 +286,10 @@ objtool-args =3D $(objtool-args-y)                  =
                 \
>
>  delay-objtool :=3D $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
>
> +ifneq ($(objtool-args-y),)
>  cmd_objtool =3D $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@=
)
> +endif
> +
>  cmd_gen_objtooldep =3D $(if $(objtool-enabled), { echo ; echo '$@: $$(wi=
ldcard $(objtool))' ; } >> $(dot-target).cmd)
>
>  endif # CONFIG_OBJTOOL
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada
