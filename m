Return-Path: <linuxppc-dev+bounces-1913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBA3997870
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 00:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XP6qf196Zz2yxN;
	Thu, 10 Oct 2024 09:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728512638;
	cv=none; b=Hb/jdBdWc1cVbYMwngsK1S4K4jV28NJElkSKgxlEDSobI7uO+t2e/iO6Elxo5agKhKPJ934ajkxCMKjecSk7CVPzjvRebBymMcwtl1D9wiq6KA6y8cnhO7lbiT7KJMT3s9YDBWY2TFQ2sMiB0ZQca7/WolsV4/77R/j1pVDJprXVzK7mqjWt7PiZL+D0oEeRTUCIAqR7xQJiJmg9CMes8KcG1wOeSZdn5H4bXPijzTur4wr4WVjF+awuO4YfAxTa/wdylL1qkJwHBUucGlY6N2RILauBA7IYarvToTQUr2/FO5go1z0mxHicDDE8G4LkOYdqGeicAFcZkK9OIlBSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728512638; c=relaxed/relaxed;
	bh=qr2NiDkTzchL8uGJCnEfJucVtKgbESvAiwuQEhcXyhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPwoK4cjVuIVUscXWA2aSHsAiYm8WEJ3uJ5+A+7jJLL1PXhZDA4DNzGppRy6TOjBHd+LxsQHWLo7N2DbtO3DGNpK0tCxVENTD2iXGwUPZfWqbuXJzVMMS0t3TAhvIjyGA8MchqflnnVH5dMY0GmgFKpKeGr97XVUPa3yJitdyD0ZWEo5DWWbb6Hvx7JCrO4f/1suVY92Nv3La13E4dmvGaJQ7g7Y+d9xBtEIfdKY+feQ24td9FZw/ZTHybYarsC3X87WGp9sEIwe4labujugYuI8X7sjLeThyvULK/Bs680GwhhhOZ4vZUZAmiyO0wTUlsWI5XstlSSXNzvSyvVZxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wiwa3rlr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wiwa3rlr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XP6qd0PcCz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 09:23:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 836DC5C5E95
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 22:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AE8C4CEE1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728512632;
	bh=w4l9dzDzlilO4E+6HL//zAT4zhaj8ld4amfc5zECEfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wiwa3rlrYH9BC46EoCHkt+QLbJoTT1X2QA01HAqIYKjAte3oUq44GaeL+zZ4AkJ2c
	 2fmhTarWCgJZzvugjgiXFaapdrUxRw+aMHjQkxk7R7tMQ4X8TAISQfJF8mwZjkVS1k
	 P8ckfmO9JeSeyS8x4lu0kJaTjkOtHpLIIPYKJmo4HQ1/9VWZa6uO3ff20ntiwcvv+8
	 WNsOi1fvz3WyQp8/mTsIKp1bTZX1Q46ddgghD/obeQF4nyOrExSGPC7njchLh/Wo1L
	 w8uAfe7NKlqBlMlX1oAMsBsi5zUdQStu0GaxZpBZ0z6hB0R3qZA3l0SEImsa2B3CEC
	 jNcMMmsZn1/Ag==
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-82cdada0f21so11030939f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Oct 2024 15:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2y/AUSuQXbtqTjBBaCMneQtZHxfdaDwx0IBLq7PJDkwm9/4obwa6Z9x1uQfAZoIW1/S2UOgDGWUtAPks=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPdA+nOyUbK3c0e0vwbINPt8g616JdwaBOIf/8UMzcmqVCDlix
	/comz4iqaimmQcE1liEbttqWq/K07s5KqkNo18731p768NT/AUPVz4O6wr5SWdvAMlk/JFwiONl
	3lH3Jmw2smevX89pvQ8mrscobeUI=
X-Google-Smtp-Source: AGHT+IE+0c/kMVosLTSGHy+n6QvIYJcOAn6W5BXDQkMmjF/nhxZwOJHSZ6SOjh26Vu9mUcUiW0DFRwoy/+Y0vdg6KQk=
X-Received: by 2002:a05:6e02:1fe6:b0:3a0:aac2:a0a4 with SMTP id
 e9e14a558f8ab-3a397cffa21mr40549325ab.9.1728512631542; Wed, 09 Oct 2024
 15:23:51 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-5-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 9 Oct 2024 15:23:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
Message-ID: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 9, 2024 at 11:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
[...]
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 88ecc5e9f523..7039f609c6ef 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -367,6 +367,8 @@ enum mod_mem_type {
>
>  struct module_memory {
>         void *base;
> +       void *rw_copy;
> +       bool is_rox;
>         unsigned int size;

Do we really need to hold the rw_copy all the time? I was
thinking we only need a temporary buffer when we want to
update anything. The buffer might be much smaller than "size".

Thanks,
Song

[...]

