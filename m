Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9036118F0A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 09:10:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m6WK3j3HzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 19:10:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t4J1405A; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m6Ms0N5QzDqv2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:03:52 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id g9so1649922pjp.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=X9VGstawfsuKwCedA/dcJRRw1tBlA/+3GmTwcGSoDjs=;
 b=t4J1405AUBbf61kpCMOVnk7SZbTFsohbAOcG8npvgO8THflwa+peFR5r96lWoYoGmv
 /+685lC9gpXLrceVABx4aO2Q5XP57yW+3vnSbJgRqgZgb6pHL6wYamexPcUf/c3Wz3ut
 H5WIC2l5EiX6mqNZh21LxgVIjvE0yY9R3fcBmJGI97f/XHL3OcGUiqP66dV2RUNcLaFF
 Pem1FdK1tORRKUDOEzRLTwwT4Eni3/BneUc8E7Fi4I1SfBSoN2za+0qBJN0brfrzJ9PX
 E9b0NSHKcL5X+KcpUShTc7GpLM1v9Il0tCq64H/qYh2WWWiBgiBLFszmp0alL7DIw4ff
 3oYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=X9VGstawfsuKwCedA/dcJRRw1tBlA/+3GmTwcGSoDjs=;
 b=Y7fvbLuTZPuUBghl1tKINo66QSLR/JvaBZdUnPxdHcDxUjJtLsW47N3ubWaMze308b
 IN1AvxrIfRgJU75VAxj7W//oA45INSf/Fmz6R8IeSGLJ45jlRcP2UvtjhUncpmt/7wsH
 URzCHfuxTBbUjDUqdbscDud3B00jessV86NOZWyd4U2zmO3X75tkLC98OR3s1xvdzLAZ
 PF40BOinKi5S+dCvhATl/q8Wro3WtR2CqaOcTj4mK+BCVxp+PcVqoZ6fi67zk/I8eTIE
 Y41s5+TVv+z51l2qVhqKwoVZRTeQI2HpPQQBpCR/YulXv1qCjFU7g7IQ9VBKm9iO4Os8
 /FDw==
X-Gm-Message-State: ANhLgQ0nX7NCL2VJ3qpBTQnWSCQSJCMM7FIwapkWPGHQVNwHjY6psPCi
 xkM32MrUEt3nXhsGJg3fCLmOq/Zw
X-Google-Smtp-Source: ADFU+vtdnHmQLgyWGffbkB160WqBozqoaPcss0Et7byIHnun2Il9GEtGLUnAD0OPVBA1him/XRzAxw==
X-Received: by 2002:a17:90a:c08f:: with SMTP id
 o15mr24526492pjs.155.1584950630958; 
 Mon, 23 Mar 2020 01:03:50 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id t15sm5200438pgv.61.2020.03.23.01.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 01:03:50 -0700 (PDT)
Date: Mon, 23 Mar 2020 18:00:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/16] powerpc: Use a function for reading instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-10-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-10-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584946118.tw98vo7hqx.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:18 pm:
> Prefixed instructions will mean there are instructions of different
> length. As a result dereferencing a pointer to an instruction will not
> necessarily give the desired result. Introduce a function for reading
> instructions from memory into the instruction data type.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>  arch/powerpc/include/asm/uprobes.h |  4 ++--
>  arch/powerpc/kernel/kprobes.c      |  8 ++++----
>  arch/powerpc/kernel/mce_power.c    |  2 +-
>  arch/powerpc/kernel/optprobes.c    |  6 +++---
>  arch/powerpc/kernel/trace/ftrace.c | 33 +++++++++++++++++++-----------
>  arch/powerpc/kernel/uprobes.c      |  2 +-
>  arch/powerpc/lib/code-patching.c   | 22 ++++++++++----------
>  arch/powerpc/lib/feature-fixups.c  |  6 +++---
>  arch/powerpc/xmon/xmon.c           |  6 +++---
>  9 files changed, 49 insertions(+), 40 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/as=
m/uprobes.h
> index 2bbdf27d09b5..fff3c5fc90b5 100644
> --- a/arch/powerpc/include/asm/uprobes.h
> +++ b/arch/powerpc/include/asm/uprobes.h
> @@ -23,8 +23,8 @@ typedef ppc_opcode_t uprobe_opcode_t;
> =20
>  struct arch_uprobe {
>  	union {
> -		u32	insn;
> -		u32	ixol;
> +		u8	insn[MAX_UINSN_BYTES];
> +		u8	ixol[MAX_UINSN_BYTES];
>  	};
>  };

Hmm. I wonder if this should be a different patch. Not sure if raw
bytes is a good idea here. ppc probes also has a ppc_opcode_t, maybe
could be replaced with ppc_insn_t and used here instead?

Also can't find where you define ppc_inst_read.

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 7614a9f537fd..ad451205f268 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -41,6 +41,12 @@
>  #define	NUM_FTRACE_TRAMPS	8
>  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> =20
> +static long
> +read_inst(ppc_inst *inst, const void *src)
> +{
> +	return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
> +}

Humbly suggest probe_kernel_inst_read.

Thanks,
Nick

=
