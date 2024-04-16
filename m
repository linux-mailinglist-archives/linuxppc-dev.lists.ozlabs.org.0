Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A908A6743
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 11:37:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mWmzgx3Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJf814dZKz3vb2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 19:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mWmzgx3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=nadav.amit@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJf7H0H4Qz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 19:36:26 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso4546224e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713260183; x=1713864983; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOrASS+GeLuk5Z7lZoVL6cbT4rY+jK9WGpd682BgxR8=;
        b=mWmzgx3YL0K/zlW0Qq5q91Xz4WAsQ2qQDLnWKgwEbYSztV9tXYvLIEW/x7deQhxPSu
         txJLIoVXp3lS5x2NqEAwB2cCkD2k3RQ26ZV1Li0Bom+EDNKjSzY4M4wHX/Iy8fMvoTZm
         35d1pHf5orgt3v/veqIBZL3yBd0gTFwiiLG6AhWPRSii/Nl94Dtt8zLsv0ts1dWN6E4j
         6qqipV8/kkojhIM86ycr/PxBuEe+LYOZY0vYdODsAdtXibMvggaEzEn7m2jRaY/CA12d
         H641YMu22rAaOfjm0O0PWdTOQscBVsvr9y9FMUwJ74UdrtXykIvdnk4lqpn+TNj8F0Cj
         /WEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713260183; x=1713864983;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOrASS+GeLuk5Z7lZoVL6cbT4rY+jK9WGpd682BgxR8=;
        b=F+XwM34s2c0dnIlT/X3XIc0xE1JUzbQKHK//iyXWCy82Cu4SOpKaCc75wofMEfCMFw
         S/WY0Zt7tdsd5Pjx+qKMJwan8WSTNGMbBYCo3Fo/U2RXS1gH9E7SsPIrz2TSlh8DJYVe
         b0dMbk1WLTWF3PGJytLWwZTERH9CFMaDPd8KNVYJ5K200Vk/JMGJNK9F9ndkVEag/jih
         2h1g6gUe4SqW3Qwbh59gZ2f5HeK0eMnRQsYUe0JA2UBaKKXaNSIkc6vu2OKM9s5V7xQq
         /7WRpg/6KaWCPKMCSul6Bz/HnX1AWum4u1c9z/tv+flgRBUYkm8HA88SsMa7lyQTSm1/
         gJkA==
X-Forwarded-Encrypted: i=1; AJvYcCVLuAEqMbpuPx/2EEMqEmmVw6UeLQBbBCUSJi8NUkINUwjcwiHz00dvHMmacrc/seVJXkEg7XPZ9M82eA2O5eDHzWyHfc+pAiBk1J9XBA==
X-Gm-Message-State: AOJu0Yw0hLEN360gHypW9MatuSJUu6L6CqlBHqRLowoK/H577tSsaoXR
	yUlgNsUIkOasamwAvRqC0No0AewBobpO1NQRfNM5mBdw7yAM6iQo
X-Google-Smtp-Source: AGHT+IHJL+kGebuWf568L4j1/19JnbEd5orWvCbxsHgvPeVxrnDNkney9hr1xgtB5xtFbL8mR9qM0Q==
X-Received: by 2002:ac2:5f87:0:b0:516:cdfa:1802 with SMTP id r7-20020ac25f87000000b00516cdfa1802mr9934425lfe.63.1713260182555;
        Tue, 16 Apr 2024 02:36:22 -0700 (PDT)
Received: from smtpclient.apple ([132.68.46.107])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090615c100b00a524e3f2f9esm4249223ejd.98.2024.04.16.02.36.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2024 02:36:22 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [RFC PATCH 3/7] module: prepare to handle ROX allocations for
 text
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20240411160526.2093408-4-rppt@kernel.org>
Date: Tue, 16 Apr 2024 12:36:08 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masa
 mi Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11 Apr 2024, at 19:05, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> @@ -2440,7 +2479,24 @@ static int post_relocation(struct module *mod, =
const struct load_info *info)
> 	add_kallsyms(mod, info);
>=20
> 	/* Arch-specific module finalizing. */
> -	return module_finalize(info->hdr, info->sechdrs, mod);
> +	ret =3D module_finalize(info->hdr, info->sechdrs, mod);
> +	if (ret)
> +		return ret;
> +
> +	for_each_mod_mem_type(type) {
> +		struct module_memory *mem =3D &mod->mem[type];
> +
> +		if (mem->is_rox) {
> +			if (!execmem_update_copy(mem->base, =
mem->rw_copy,
> +						 mem->size))
> +				return -ENOMEM;
> +
> +			vfree(mem->rw_copy);
> +			mem->rw_copy =3D NULL;
> +		}
> +	}
> +
> +	return 0;
> }

I might be missing something, but it seems a bit racy.

IIUC, module_finalize() calls alternatives_smp_module_add(). At this
point, since you don=E2=80=99t hold the text_mutex, some might do =
text_poke(),
e.g., by enabling/disabling static-key, and the update would be
overwritten. No?=
