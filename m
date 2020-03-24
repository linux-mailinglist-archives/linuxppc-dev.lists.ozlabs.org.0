Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6F190814
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 09:50:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mlLx0YgqzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 19:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vA3p3t11; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mlJt2ZPtzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 19:48:30 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id nu11so1142250pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=bt3cOsdr0C8cVmPItgi4WdtrPk2V3/FsORYh/CBY/lI=;
 b=vA3p3t11FbBNkJKydmTaNNK3N5QW4gtpYzmlrgSF1JIT3wXicBoyZQ6X2qPv4Qvl27
 atW1VCrGbGDlTg1jxwlWdC53pfi5pO12GqKqWwzjPJCi8yZkG6OkVtvJw1OLGhqdMKWJ
 YVITCgHIF79H5pfiZs2gYUgZSyX4kEOcNHQAOMwGVYaxcpUJsAqTXPerqQZwYHyBEzGP
 +AvKs5zDXWGhMNjVuH2KjgkSnFMBn/CbVRXP9QCpCiofOD2/GVjOn735K6I/pb/gBuj3
 IWQbe9lei2ON6VbPeMLYajngQQ1HgV/7UZkMxmMQH9Ng01J1kjTH9anTeMvW0mB2L1lX
 KhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=bt3cOsdr0C8cVmPItgi4WdtrPk2V3/FsORYh/CBY/lI=;
 b=UgDKqw02LBF2EQgkfsOR2+iMi8PYZ2GfRhC7C3SPDjfCyQk8u113IBAL/8EJ7I5pAt
 jdfuE4wzNFfhdiqa/DUnor9k5SuwO6GHmRWsID7bGPG1VxtRnyzqlGIuNcSpIqvZWlLf
 tLdlJdYSkzmDIStsXz1MB6Z2ALupa0EkzQH9+VTN1FdaOfikQLKLh1vkjBEhAFxeEbCj
 xmKlQ2yfBZC08V4Jtud4H+48CfQm6dpcww06dZMHOJsPXEfdxjbEQ6bZ4GKWaepoGjz8
 naiHultvLfyo2vB7/zo4ys9ZCIftSDFSdUwOfnS9ttqHd/i3sByDB/WGY/J8sabLsu40
 gblA==
X-Gm-Message-State: ANhLgQ3ZH/6H7nfbVTlrap3Z032TiDMOASYW2ZxA56fqbMgaug4TsaYH
 Ml3X/HCd1YIm+odZuUyF2fW/aplJ
X-Google-Smtp-Source: ADFU+vvkxp5PNoeenVejrf8tpB2gV5C4JXUjlzG5rk+czBLRFZq2ATdOuyQvst6hI/VEssCwU4vvrg==
X-Received: by 2002:a17:90a:37c4:: with SMTP id
 v62mr4006668pjb.151.1585039706935; 
 Tue, 24 Mar 2020 01:48:26 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id f22sm10687021pgl.20.2020.03.24.01.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 01:48:26 -0700 (PDT)
Date: Tue, 24 Mar 2020 18:48:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 3/8] powerpc/perf: consolidate read_user_stack_32
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <184347595442b4ca664613008a09e8cea7188c36.1584620202.git.msuchanek@suse.de>
In-Reply-To: <184347595442b4ca664613008a09e8cea7188c36.1584620202.git.msuchanek@suse.de>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585039473.da4762n2s0.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek's on March 19, 2020 10:19 pm:
> There are two almost identical copies for 32bit and 64bit.
>=20
> The function is used only in 32bit code which will be split out in next
> patch so consolidate to one function.
>=20
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v6:  new patch
> v8:  move the consolidated function out of the ifdef block.
> v11: rebase on top of def0bfdbd603
> ---
>  arch/powerpc/perf/callchain.c | 48 +++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.=
c
> index cbc251981209..c9a78c6e4361 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -161,18 +161,6 @@ static int read_user_stack_64(unsigned long __user *=
ptr, unsigned long *ret)
>  	return read_user_stack_slow(ptr, ret, 8);
>  }
> =20
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *re=
t)
> -{
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	if (!probe_user_read(ret, ptr, sizeof(*ret)))
> -		return 0;
> -
> -	return read_user_stack_slow(ptr, ret, 4);
> -}
> -
>  static inline int valid_user_sp(unsigned long sp, int is_64)
>  {
>  	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
> @@ -277,19 +265,9 @@ static void perf_callchain_user_64(struct perf_callc=
hain_entry_ctx *entry,
>  }
> =20
>  #else  /* CONFIG_PPC64 */
> -/*
> - * On 32-bit we just access the address and let hash_page create a
> - * HPTE if necessary, so there is no need to fall back to reading
> - * the page tables.  Since this is called at interrupt level,
> - * do_page_fault() won't treat a DSI as a page fault.
> - */
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *re=
t)
> +static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
>  {
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	return probe_user_read(ret, ptr, sizeof(*ret));
> +	return 0;
>  }
> =20
>  static inline void perf_callchain_user_64(struct perf_callchain_entry_ct=
x *entry,
> @@ -312,6 +290,28 @@ static inline int valid_user_sp(unsigned long sp, in=
t is_64)
> =20
>  #endif /* CONFIG_PPC64 */
> =20
> +/*
> + * On 32-bit we just access the address and let hash_page create a
> + * HPTE if necessary, so there is no need to fall back to reading
> + * the page tables.  Since this is called at interrupt level,
> + * do_page_fault() won't treat a DSI as a page fault.
> + */

The comment is actually probably better to stay in the 32-bit
read_user_stack_slow implementation. Is that function defined
on 32-bit purely so that you can use IS_ENABLED()? In that case
I would prefer to put a BUG() there which makes it self documenting.

Thanks,
Nick

> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *re=
t)
> +{
> +	int rc;
> +
> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> +	    ((unsigned long)ptr & 3))
> +		return -EFAULT;
> +
> +	rc =3D probe_user_read(ret, ptr, sizeof(*ret));
> +
> +	if (IS_ENABLED(CONFIG_PPC64) && rc)
> +		return read_user_stack_slow(ptr, ret, 4);
> +
> +	return rc;
> +}
> +
>  /*
>   * Layout for non-RT signal frames
>   */
> --=20
> 2.23.0
>=20
>=20
=
