Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E091DA32
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 10:41:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CT3JYqtP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCKK33Jncz3fmX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:41:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CT3JYqtP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCKJG4LPFz3fRM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 18:41:01 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70675977d0eso1537826b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719823259; x=1720428059; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3x8OXlxrycHdfXvAIhFhHfcQNBUzKhTKnahatC6tJk=;
        b=CT3JYqtPjQ2x1ju0AfghgvKjQiNdin1qVntNsdg/iIGvaylqWIE0GVk6iqjX7lux/V
         zUGHJZrCYh2/mfqEZGKqJIFnK+CFbDYjy0LHcjjy6UDBzrIDBMGATmthOKlHUqC0vl9v
         4Yz6DeXQqbvRkcDi7SN+pZ9d/Z0FfFf7jobRZzVExmFs/R7Tlh6fVQ1HnqOZLWzR9ktr
         CHfhzjxHCHqkOH6DrnAPNmf14ttL/tMWj5J8Z32+m/3MKth37Jhc7VpyVYqD6fmu1lPr
         8Ti0r/0gEVOZWg6Jorcs3AylZPkLzUV0kdeigEJKVYSWGhpJTYAmMhFxtUOHcm2HyfnB
         Ilng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823259; x=1720428059;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3x8OXlxrycHdfXvAIhFhHfcQNBUzKhTKnahatC6tJk=;
        b=iSjSV5tv5/09+OZqfP2/fZucTQPXnJ18Je44C+9BSS9I2Ci3u2m1MI4Ek9BWe8yPTr
         fnzbUc5QMZd+QMeHeSf9jf2VA6kvqzVsna37hyFAXF0V9aFeL9CLOr6gnyUb+A4ZEo0A
         xQHGp/ySpV3S0ZC5VdoP2Lyaj1Wnt6nxbwU3ZEGQUa+lcgvBtmgWLllkWmuPHZjSfkl1
         ok6seJ+pp1vucEeqRaxVrKLhTRk5CkFdDrvcJQf4VUZKcOJVHmr1cDv5qlvUyFdH/zOH
         wkCo2WDAeIoZz+AgwPNpFrx0HP/IIXs1YJ8vsXrCz0ONblx3Y5PpLCujAjdCEnrxR4mm
         5Mhw==
X-Forwarded-Encrypted: i=1; AJvYcCXJSsbDSoiz+8ZKzLwTgjK+xP80yEuXhliv3694IkCijiHRJBZtTgthmrroE6CVsvmwBDApXVybHG6sCI/6QhqLxW/rL6UAatbojsjW0g==
X-Gm-Message-State: AOJu0Yyvof50oMoxo/6+7XyFcVsjuKXcZ5ahSkJyjZ462xMy15x2CeIh
	DX803GRtnfynHfPH6RJIzIWLuKxUtEc36mtSj84zRrTyKpuG9CK8fX1Mcg==
X-Google-Smtp-Source: AGHT+IFF3U5blfYc7cCFy2B2VWKUGh0mSRCO0j+ghWCasUVIR5uCy8kyNN9MdGKcEbR1V4mgvBeXng==
X-Received: by 2002:a05:6a00:4b54:b0:706:588b:d44b with SMTP id d2e1a72fcca58-70aaad60715mr3643920b3a.20.1719823259007;
        Mon, 01 Jul 2024 01:40:59 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e53ae0sm5943265b3a.23.2024.07.01.01.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:40:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 18:40:50 +1000
Message-Id: <D2E2GLXWB7TH.1L7TFQZO3149Y@gmail.com>
Subject: Re: [RFC PATCH v3 01/11] powerpc/kprobes: Use ftrace to determine
 if a probe is at function entry
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <2cd04be69e90adc34bcf98d405ab6b21f268cb6a.1718908016.git.naveen@kernel.org>
In-Reply-To: <2cd04be69e90adc34bcf98d405ab6b21f268cb6a.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> Rather than hard-coding the offset into a function to be used to
> determine if a kprobe is at function entry, use ftrace_location() to
> determine the ftrace location within the function and categorize all
> instructions till that offset to be function entry.
>
> For functions that cannot be traced, we fall back to using a fixed
> offset of 8 (two instructions) to categorize a probe as being at
> function entry for 64-bit elfv2, unless we are using pcrel.
>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/kernel/kprobes.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 14c5ddec3056..ca204f4f21c1 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -105,24 +105,22 @@ kprobe_opcode_t *kprobe_lookup_name(const char *nam=
e, unsigned int offset)
>  	return addr;
>  }
> =20
> -static bool arch_kprobe_on_func_entry(unsigned long offset)
> +static bool arch_kprobe_on_func_entry(unsigned long addr, unsigned long =
offset)
>  {
> -#ifdef CONFIG_PPC64_ELF_ABI_V2
> -#ifdef CONFIG_KPROBES_ON_FTRACE
> -	return offset <=3D 16;
> -#else
> -	return offset <=3D 8;
> -#endif
> -#else
> +	unsigned long ip =3D ftrace_location(addr);
> +
> +	if (ip)
> +		return offset <=3D (ip - addr);
> +	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNE=
L_PCREL))
> +		return offset <=3D 8;

If it is PCREL, why not offset =3D=3D 0 as well?

Thanks,
Nick
