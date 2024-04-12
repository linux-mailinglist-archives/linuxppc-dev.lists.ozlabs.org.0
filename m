Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C248A2ABA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 11:16:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bU9e2NWI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9tc0MRmz3vcr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 19:16:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bU9e2NWI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9sv2n7Dz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 19:16:18 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56fe7dc7f58so511752a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913374; x=1713518174; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P5rS5dDZ6bz9RnNGWXjXGeZ5LSFZB2izV8TdsSyfhY=;
        b=bU9e2NWI9nrWX1CVI1Jr2JbtJPu2RXdcIApEsenwYqYCyhcu5aBuY1PRTcUFIGYJeO
         pqkwXo7M7gUom4AAyLgODsABCHHnYJOcpg45UTgTdmqV5PF1t9gvV4kAz1gIw5wcmQ0B
         vAwZDQsbnbwXauiWfy/qtc4MnKsGU+Xkqeq+QfA4EoHDmZr3Q9tuDfS20kCrnzZayjEf
         vaxjtXbGs1SqHCEHowr5E+1+PQg1x0sGxJFCCJnU4GIXQQVYLeyzZ1WXQWvs9ApZwb58
         C1FrdjY3WNLlXUtbgvmlOeTJJ35Bd4CWuWItoFfA7PjNcSftQc/mFX2nV9tevvdc4ldH
         QXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913374; x=1713518174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P5rS5dDZ6bz9RnNGWXjXGeZ5LSFZB2izV8TdsSyfhY=;
        b=JTk8Fdxu9VxYd4MQQjtTF6PCJ6bqDLQkffhXIC/a33Qpr00St7uVSQggshkEnVKUL9
         p0VjiCBFzpqRpY3RQO6tBXgvirXpUt4psIwSEZchOKSJyDYLPlBewr1i1O6R0AL5xL1B
         2BOmwpG3RbD0ouALEme0ldIHRqmKsISvBOK5m/XQoT8aoPrlPpagEJigL+0c5b6pJ6WF
         wz4vjYWL0GZXwsJuIlNTkehN65RdaaIMltLShyT8n+Nj+lK6PcNXU8SzEC6BqGmwFkvQ
         t/ZNcRa37xdT7Ye8DhZSEAOg2q3FL5p/WL2z1V2PftMo1NXzal3d7Uv++y//WU+o38f0
         V0/w==
X-Forwarded-Encrypted: i=1; AJvYcCUMdcIdnnw/p0lXqTakTBbtQfDl1VriQCoqMzQet94jSiNvO3E2z9u5FLlqVfRXAUCHdMKkytRjYB5MSF4KdIHgNsl5plqCXbZQm0QcZA==
X-Gm-Message-State: AOJu0YwCh0rsuuo5OodD7wWxyvm1r/X8XEEpLeAi4DzxYEojoRrU33JS
	FRnrl7hyqiFbQ3UTcOkiko8HgbtFyW0O5N5VZPxwpUX2+5u5Sbgp
X-Google-Smtp-Source: AGHT+IF2JLt070H6U+NVwXUCGShMgUTVG3TFLf6L4pd2nPVSBBMwXn0qR7EXkAPf+SwG43RHlRZl8g==
X-Received: by 2002:a50:f68d:0:b0:56e:4039:add5 with SMTP id d13-20020a50f68d000000b0056e4039add5mr1892328edn.22.1712913374186;
        Fri, 12 Apr 2024 02:16:14 -0700 (PDT)
Received: from gmail.com (1F2EF1A5.nat.pool.telekom.hu. [31.46.241.165])
        by smtp.gmail.com with ESMTPSA id el9-20020a056402360900b0056fe755f1e6sm1454709edb.91.2024.04.12.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:16:13 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:16:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zhj72l6uN9OFilxA@gmail.com>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-6-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev
 >, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Mike Rapoport <rppt@kernel.org> wrote:

> +/**
> + * enum execmem_type - types of executable memory ranges
> + *
> + * There are several subsystems that allocate executable memory.
> + * Architectures define different restrictions on placement,
> + * permissions, alignment and other parameters for memory that can be used
> + * by these subsystems.
> + * Types in this enum identify subsystems that allocate executable memory
> + * and let architectures define parameters for ranges suitable for
> + * allocations by each subsystem.
> + *
> + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> + * are not explcitly defined.
> + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> + * @EXECMEM_KPROBES: parameters for kprobes
> + * @EXECMEM_FTRACE: parameters for ftrace
> + * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_TYPE_MAX:
> + */
> +enum execmem_type {
> +	EXECMEM_DEFAULT,
> +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> +	EXECMEM_KPROBES,
> +	EXECMEM_FTRACE,
> +	EXECMEM_BPF,
> +	EXECMEM_TYPE_MAX,
> +};

s/explcitly
 /explicitly

Thanks,

	Ingo
