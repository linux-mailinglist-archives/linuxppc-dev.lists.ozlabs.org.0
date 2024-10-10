Return-Path: <linuxppc-dev+bounces-1984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B1998E41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 19:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPc0t6qskz3bjq;
	Fri, 11 Oct 2024 04:18:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728580718;
	cv=none; b=QnBQ2EQEss6kLfFZG4MAE01CbLAkmEFhViIJK+B1qkAtbbaE2s/v3XzXyHDoTWmNdt0D6TyrJweSEyANsCo8hUliWzl57kTbCCDHmSWQXLJd+bkldgywPL1DHkS7E1MqNpE9bSVEkqDTw8lnnlpCATSYVh4bGGKLbSZQd5dhgV5ZU6uTRJv9BVDffdY/WD2BGHkrOFHcw75FgPLnzLi72R0UngbzxMKUJuit6VAPRAEEZ5UUZll9xMx+u1LYivOg+dF7C+hasqzfHPHgM0/NEXheYk+6U9LrpL2u6jobqT1litLXXUbaBiI9dsDUfyQzr223oWlW65dgUNMNvW30AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728580718; c=relaxed/relaxed;
	bh=YWTfDGJOVIcVIWG5RKfiNKmMCfgGLl0hOHgzmSzW7HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kl0l4sMHhivgsetnPIEYA4urZKBQ3nH5IgCV68aUaXBYue+wlOP6CJti/rLZFZFDOqtGnS0F9E4u9iu1aRPffjGsVqZflwIeGj9IhaSmslQDxgSKrOLOHuPMtWT5VdDlM25Wsx9fP1MQTcra/2qRQfF4x+ix4MYiivT69jzhIcnm07a3eqPIhP2Ytt+wbqEf6ryAm2pRYEvIXt646EGAvI/cE3V8tZZECIdQA9tB25KwWQmSu3XwJG5sfszFw4dLoHC9iC0rhalyOSSOw3V9Tn9ydYgaogFgIU84HsZAFbiZtX+JHDCByTClRjnI7Zg5QVJ0uO2+vvcgoqV+zgCtuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YGQC3YGT; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YGQC3YGT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPc0r6GNYz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 04:18:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7F56A44C1E
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 17:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E588CC4CEDC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728580711;
	bh=vaucBuX2fMrEpT3kygwI4CcFnWG5blOdj+4yYIH1/lc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YGQC3YGTpIM/Tv02Vn7usGJD/6tt+x+KTKu3UxnMO5NCC8+C7ZPh5ezrehFriglwe
	 0kHT558np8Wr8rw+tHrk6iFdI6TYZzj/XuDQyl1ohCHGBlLvqRKvMY9o2gFo+NuycW
	 y20uvBOD9Gdu+xnvXvzrx2PBIPwMfqD7Kk74Y5ZM4wURiZxI3kabAPnyXgltKV5Te8
	 nLgYuMl0XB6UP3CI6ocVV8lyp79EB210TDlqZm0fWRLk96yJAx28fczirFRv8Ok4xn
	 g28YaYfndtMh2lJkpow1r3uH0m1V9UcGEfvj2KBq6mV0UhVTJerIhIuFum/RTZvtMI
	 Z12HDd0NC/l1Q==
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a377534e00so5177055ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 10:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8VJHTnp1Km8jjx7ame8jLakG8ladqxxEqR3NBpeTWwLmQnvjiflbpES96dJyEd8puNG2737ceRkAqAZY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygpaGF0amDNR7tUOTaZKE84O9xnFRQkqDeTd1AoOwHBlh7n4qx
	A77xmIrXa9Yy62HcqlLJI76B+DkoFpv7QpS0HOm9uHY8gIH5EehtHq6WK29st+xvzNIh0EXQ3MU
	kbwGjPEK0O65G5+HHmAes1cD7qN8=
X-Google-Smtp-Source: AGHT+IGszKBBrf1gYsUhslMqcPNpC/f6sAFFbsmL+u+zGmeEd2sYZs3+7Tvb9T+CKCsx/nhk3yidKvoEgysxI18Lmn4=
X-Received: by 2002:a05:6e02:144d:b0:3a0:92e5:af68 with SMTP id
 e9e14a558f8ab-3a3b51daa94mr2839515ab.15.1728580710921; Thu, 10 Oct 2024
 10:18:30 -0700 (PDT)
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
 <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com> <ZwdpnPKKQGF5DtSv@kernel.org>
In-Reply-To: <ZwdpnPKKQGF5DtSv@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 10 Oct 2024 10:18:19 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6gb76T_75TPzb-AvfyAcYE83iYhDpjJNHJQWDd3Fki_Q@mail.gmail.com>
Message-ID: <CAPhsuW6gb76T_75TPzb-AvfyAcYE83iYhDpjJNHJQWDd3Fki_Q@mail.gmail.com>
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 9, 2024 at 10:47=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Wed, Oct 09, 2024 at 03:23:40PM -0700, Song Liu wrote:
> > On Wed, Oct 9, 2024 at 11:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > [...]
> > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > index 88ecc5e9f523..7039f609c6ef 100644
> > > --- a/include/linux/module.h
> > > +++ b/include/linux/module.h
> > > @@ -367,6 +367,8 @@ enum mod_mem_type {
> > >
> > >  struct module_memory {
> > >         void *base;
> > > +       void *rw_copy;
> > > +       bool is_rox;
> > >         unsigned int size;
> >
> > Do we really need to hold the rw_copy all the time?
>
> We hold it only during module initialization, it's freed in
> post_relocation.

Ah, I missed this part. Sorry for the noise.

Song

