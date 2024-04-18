Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B95508AA2D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 21:32:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IKNkTres;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL7Fz3yZVz3dRD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 05:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IKNkTres;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=nadav.amit@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL7FB3mnFz3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 05:31:40 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34a32ba1962so500862f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 12:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713468691; x=1714073491; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps3ERSaJ3Nubf413Mgm5+5UAMdezoWO525AtmvS7hLg=;
        b=IKNkTresXnM2w6Y1WaiytcNz3et6NrHrdcVfOUOsqbq1DuaaogWikp6FCO0ksPw3xr
         qkR2QHBLpGPD+vdhRQIx+ySsxSfMiPWdkjkBoInExsRGHo21aAMBhL1/4E+ZoBZYOHrV
         j/qwcEhOt98wCDiy5ZqGoIvP7hRq0AzYjuIV/Nol5IAAunWahPVzf/KBJHAaUrkcpyy2
         b070/tYhKuj7hdN+3leZiCoiDjRzIF0Vo0Gt82Yc+4ZH2B8DKFtRGcfH3BBgG7vqQ/kL
         Sq207dKM6E5cNucIaMnx3y2Q4zBZ5m2f9U7/89Wv8M6QAO24IH4PkgK75VUrszJprRg1
         HcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468691; x=1714073491;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ps3ERSaJ3Nubf413Mgm5+5UAMdezoWO525AtmvS7hLg=;
        b=NJ3twazbQz5jJoPUov6Y6E8kiIfIBZ8lWHCm5Ehb24DdsWleMgjo6IqoOIFgkwARpm
         HjiRVtRo9OchaPOahdO0UdspiQzBEzzqQ+nv43jL/woca2bd9+uloqEIZ0QHC/pzPTQR
         lNRLMreQ1nlE4VIEWAuL79eUoqokipShVrRbURCWJuX/xkHpjZycjqLU8Jghc4U6+k0a
         wQ9x/nrnCB7m9iOm08AJc119egdCVUH5PlOkAudXX0w8pG1buEreK5gYNo2fJEivOX5y
         ASPbBUId98OWtUAzuw0wzKwuQFlenKRjKSaajGfUR/gJDkcvw3JKtJEXY70FIOLJZEpv
         GQKA==
X-Forwarded-Encrypted: i=1; AJvYcCXxpr1O/ZxhLtzlKjEsM3j+kXXJ7ixNyFRFXVcBOpRNWHA8v0IYiu53I7Q/SFWutTUGaiAaEE4h3pXk7XUMz3pcHal/nqjImcflVqUmQQ==
X-Gm-Message-State: AOJu0YxMtLJrd0ny+FrWiDh3RYngyjwEKcL/9Vh47bSnwyhv0dL+lZSF
	QFiiIg/Y+v7gG6igeY+At4Hfn94bzpNqi2vXNvbaHWQpJ9a/e72D
X-Google-Smtp-Source: AGHT+IH0u8bsjFHZqemZxrgoGwtoIHFPdCVNpm0ysNZP2RZZazFU1pUbMRvZ+DfZhHxeIo/1VeVn9Q==
X-Received: by 2002:adf:e58f:0:b0:349:eb59:c188 with SMTP id l15-20020adfe58f000000b00349eb59c188mr2213684wrm.5.1713468690932;
        Thu, 18 Apr 2024 12:31:30 -0700 (PDT)
Received: from smtpclient.apple ([132.69.239.36])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906d19a00b00a55662919c1sm1277105ejz.172.2024.04.18.12.31.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2024 12:31:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [RFC PATCH 3/7] module: [
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <ZiDz4YbIHEOAnpwF@kernel.org>
Date: Thu, 18 Apr 2024 22:31:16 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <A714B340-9EFB-4F27-9CD6-CFBC1BC9139F@gmail.com>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
 <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
 <ZiDz4YbIHEOAnpwF@kernel.org>
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
 mi Hiramatsu <mhiramat@kernel.org>, bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18 Apr 2024, at 13:20, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> On Tue, Apr 16, 2024 at 12:36:08PM +0300, Nadav Amit wrote:
>>=20
>>=20
>>=20
>> I might be missing something, but it seems a bit racy.
>>=20
>> IIUC, module_finalize() calls alternatives_smp_module_add(). At this
>> point, since you don=E2=80=99t hold the text_mutex, some might do =
text_poke(),
>> e.g., by enabling/disabling static-key, and the update would be
>> overwritten. No?
>=20
> Right :(
> Even worse, for UP case alternatives_smp_unlock() will "patch" still =
empty
> area.
>=20
> So I'm thinking about calling alternatives_smp_module_add() from an
> additional callback after the execmem_update_copy().
>=20
> Does it make sense to you?

Going over the code again - I might have just been wrong: I confused the
alternatives and the jump-label mechanisms (as they do share a lot of
code and characteristics).

The jump-labels are updated when prepare_coming_module() is called, =
which
happens after post_relocation() [which means they would be updated using
text_poke() =E2=80=9Cinefficiently=E2=80=9D but should be safe].

The =E2=80=9Calternatives=E2=80=9D appear only to use text_poke() (in =
contrast for
text_poke_early()) from very specific few flows, e.g.,=20
common_cpu_up() -> alternatives_enable_smp().

Are those flows pose a problem after boot?

Anyhow, sorry for the noise.=
