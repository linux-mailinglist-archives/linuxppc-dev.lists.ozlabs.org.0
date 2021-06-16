Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4073A8E35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 03:19:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4S5N5TQ6z3bwp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 11:19:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S9Eqp1OT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S9Eqp1OT; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4S4x03Yfz2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 11:18:56 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id u18so822251pfk.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=EIKXApFrEura5FRXpVV8f8e+7Zk3a0C0NOTcF/0+y38=;
 b=S9Eqp1OTVx7wOFdzu+drz73pOATwym8k07yNCe3JTGK+5r9YDftTW9eLntozF1aywI
 /tUIkVgoLUzXmWDSytLoRS87Di5Dd6vb+dXo5b63vJHT0UJ20gcDIV17Nhrig8qBtyL/
 hNNyeP3XczFotkj2Bi55+snKJY+zRDEA9aKOwOp2N6gobmxY1CAyueBF9EcTXkhqqM0a
 saeQ3DZO0Eb5Dq3C5XnTRkYdYg0z1V8kIxGhohe6K7JFnYc/mX+hXsfuLuCFdW1KVsMh
 TSKQ2LbyEzFUy+bwxudHvd8YPZp/yRz+WfYstELXunP+o4SlMpGdogetk/BmbHsBvU7M
 qdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=EIKXApFrEura5FRXpVV8f8e+7Zk3a0C0NOTcF/0+y38=;
 b=RJfBt/BUqiLXPUJu4gqWzi+cjtTPHIwXKj9+r2lFBeqR9a9Xpi/q7eZgUWP96/ReEl
 gLFT94yMWwS+JwxgBySGWS+k+sqf5TdPUr8YYVAInB+9H28Kbs7/CV/sBZE/2IN/cUfn
 Tbn2epYXMz/tqTNpK72xED6mNOjkpi2ZuA/dp5g00GieEAs5QDjZRZcyGzCAqjFxmhR0
 DbrKCUoLAEqzS8OQoeCSldNemROkR+it0+ddyWhsoTgG6JjNx+B6d5AUKibetEL5hrDA
 jsy8RksRsmPb4IqSpFPLlorVx7b4vlc401mO1i1xdSQlEwcjRpea/zvx6a7JGw29YOrc
 ETzw==
X-Gm-Message-State: AOAM533uCHlsAE4478meWbaARVQ9mdUlA9cKouREwS9MJbJhrXa/atrf
 hFZxKlrMs7tM1sZLDfbbl/z6Dpaj/MI=
X-Google-Smtp-Source: ABdhPJzPzY4tmFQv21hMXSBZ7dDmevVy8o24B5mTkxjvDGi4dChnQmPLE+DFdpZFTdvnOUslgbSwyA==
X-Received: by 2002:a62:1583:0:b029:2e9:dcb1:148e with SMTP id
 125-20020a6215830000b02902e9dcb1148emr7119646pfv.0.1623806330636; 
 Tue, 15 Jun 2021 18:18:50 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id v10sm319100pgb.46.2021.06.15.18.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:18:50 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:18:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/2] module: add elf_check_module_arch for module
 specific elf arch checks
To: Jessica Yu <jeyu@kernel.org>
References: <20210611093959.821525-1-npiggin@gmail.com>
 <20210611093959.821525-2-npiggin@gmail.com>
 <YMdGWjBOmcstBwOl@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
 <1623722110.amu32mwaqs.astroid@bobo.none>
 <YMiaZOqhHck9iy0n@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
In-Reply-To: <YMiaZOqhHck9iy0n@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
MIME-Version: 1.0
Message-Id: <1623805495.qdikm5ks8v.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Jessica Yu's message of June 15, 2021 10:17 pm:
> +++ Nicholas Piggin [15/06/21 12:05 +1000]:
>>Excerpts from Jessica Yu's message of June 14, 2021 10:06 pm:
>>> +++ Nicholas Piggin [11/06/21 19:39 +1000]:
>>>>The elf_check_arch() function is used to test usermode binaries, but
>>>>kernel modules may have more specific requirements. powerpc would like
>>>>to test for ABI version compatibility.
>>>>
>>>>Add an arch-overridable function elf_check_module_arch() that defaults
>>>>to elf_check_arch() and use it in elf_validity_check().
>>>>
>>>>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>>>[np: split patch, added changelog]
>>>>Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>---
>>>> include/linux/moduleloader.h | 5 +++++
>>>> kernel/module.c              | 2 +-
>>>> 2 files changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>>diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.=
h
>>>>index 9e09d11ffe5b..fdc042a84562 100644
>>>>--- a/include/linux/moduleloader.h
>>>>+++ b/include/linux/moduleloader.h
>>>>@@ -13,6 +13,11 @@
>>>>  * must be implemented by each architecture.
>>>>  */
>>>>
>>>>+// Allow arch to optionally do additional checking of module ELF heade=
r
>>>>+#ifndef elf_check_module_arch
>>>>+#define elf_check_module_arch elf_check_arch
>>>>+#endif
>>>
>>> Hi Nicholas,
>>>
>>> Why not make elf_check_module_arch() consistent with the other
>>> arch-specific functions? Please see module_frob_arch_sections(),
>>> module_{init,exit}_section(), etc in moduleloader.h. That is, they are
>>> all __weak functions that are overridable by arches. We can maybe make
>>> elf_check_module_arch() a weak symbol, available for arches to
>>> override if they want to perform additional elf checks. Then we don't
>>> have to have this one-off #define.
>>
>>
>>Like this? I like it. Good idea.
>=20
> Yeah! Also, maybe we can alternatively make elf_check_module_arch() a
> separate check entirely so that the powerpc implementation doesn't
> have to include that extra elf_check_arch() call. Something like this may=
be?

Yeah we can do that. Would you be okay if it goes via powerpc tree? If=20
yes, then we should get your Ack (or SOB because it seems to be entirely=20
your patch now :D)

Thanks,
Nick

>=20
> diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> index 9e09d11ffe5b..2f9ebd593b4f 100644
> --- a/include/linux/moduleloader.h
> +++ b/include/linux/moduleloader.h
> @@ -39,6 +39,9 @@ bool module_init_section(const char *name);
>    */
>   bool module_exit_section(const char *name);
>=20
> +/* Arch may override to do additional checking of ELF header architectur=
e */
> +int elf_check_module_arch(Elf_Ehdr *hdr);
> +
>   /*
>    * Apply the given relocation to the (simplified) ELF.  Return -error
>    * or 0.
> diff --git a/kernel/module.c b/kernel/module.c
> index fdd6047728df..9963a979ed54 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2923,6 +2923,11 @@ static int validate_section_offset(struct load_inf=
o *info, Elf_Shdr *shdr)
>          return 0;
>   }
>=20
> +int __weak elf_check_module_arch(Elf_Ehdr *hdr)
> +{
> +       return 1;
> +}
> +
>   /*
>    * Sanity checks against invalid binaries, wrong arch, weird elf versio=
n.
>    *
> @@ -2941,6 +2946,7 @@ static int elf_validity_check(struct load_info *inf=
o)
>          if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) !=3D 0
>              || info->hdr->e_type !=3D ET_REL
>              || !elf_check_arch(info->hdr)
> +           || !elf_check_module_arch(info->hdr)
>              || info->hdr->e_shentsize !=3D sizeof(Elf_Shdr))
>                  return -ENOEXEC;
>  =20
>=20
>=20
