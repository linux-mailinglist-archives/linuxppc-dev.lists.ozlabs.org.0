Return-Path: <linuxppc-dev+bounces-1089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD8596EEEA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 11:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0VtL4xxPz305P;
	Fri,  6 Sep 2024 19:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725614090;
	cv=none; b=QKgfj2ToglskXqg1UTEsr8tzjafTEhUSFE9//57BuNOKPVw6PjBnzUYvTG7u5EMH4tNokb5y8xV62bD24Uu/nDmViGgpEDlHXBW4uM3T9uB0OW/2/RvkunDeKwQh1yp5wRCk7+3oRtpZGuBfeRvNKLWi3/I3X6iA6SDXEzuTXtgP1PTiR3ox0EkQmLp2F3qXRdv7beyG612ZXrio4hGxs3TPj21XGwyKOw8pjytNbLF4XRHymcCp6fX4Yru59Q4iE2jBm6nQV5v+mHivqJ4hj5+3lnFcqfFsX1YxRmUAitI1t1Cc1TImsEfE1ENzE/QVe+mg/TLLujtOnWE2vlKj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725614090; c=relaxed/relaxed;
	bh=13Vu2Svh897BcYIxkfKsu+/lxNt9bBj5ZU6AM3AdS4A=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=WmNySXKzJQ/eBbyff9lJmjpqTdcF6SB1LmNEAH7rsVqrQuqZVjlfivZeLqNKNSotp3g6eGl2aZFpDTXS7CbAhFjhBOz23gUe977n2gU/aKi9t1OrweWwW5ILGdFl1HAM9zsdTFvtJQsF7fJxjjveIj92N4pVrxbnYHzt5/6xRjTgsZ58H9tWXFCtTZBPao0ega0GQj2BVsEdd6AeGPzGloKIbqKHLU4zLyL6cPrKRk7j3IKU3hs4Z6Lz+RJkdwXJVfJPcDJfWk/VmHpStNMcs8BYjKjzWyg/Xxcj9TKxF42gL3KmrJgUl2cexwl4nqi5ZtHbtJG9qYwJoX0F0eJB5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U0IYQIoe; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U0IYQIoe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0VtL1S6rz304l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 19:14:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 827B45C5B6B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 09:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B8EC4CED3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725614085;
	bh=CMKQqQlBAwt7nyxZopr8LzhXpjpqLG+zrRS2vHgL2CU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U0IYQIoeba7I86BlQCZUgY7cG6HJp2P8pN16E+8wtS4NA3f0A+QxJeNxfzeNHFQRM
	 37U8ndFZhrAIL5QhPbz7SVsS5n/Cob/pfNWiElVqKitYODD+w8EZ9qN2D3O1hXN4gK
	 BReAbislBv+hctHTQsXiB52hgiPOhjk+c8Z3eHPaI4iP3mEoJ+fd7rjqCshX2nqnqK
	 L3bRBzqKdvUGneVtGV0fYDl9qZOknFbiib428EGpUegM6MEAyR35NfQSVEh07hLw4W
	 YBmV84Au2oR3CGbwDaNWeyykhwf5vXAVAASu7T19lQ5frIbc7Bw1YDbAv76E/JfKLw
	 3czemgjWisuDQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5356bb5522bso2271778e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2024 02:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW67eIKEg3V478CB2obpeswwRwWFTByXBBYkBpQk5YLDN88ZyYrDi6huugcCypHS+VhJMvYzpgPf/yzelU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbTm3K3Nl6XNHpJZyli/zDuBMRLwJe/qpw+Iv8BWfP0Nm6wTVb
	jBtmt0e/xkRBdt4crqy/9gnbLGVJqk+M7ilo84FiKuIswCvnqQ7ezB9DEFEBfRMY4amTLRia4iT
	JmLcXoVgK6V/QnbI4j+0Lr8w+NwM=
X-Google-Smtp-Source: AGHT+IG36wbIRnT1Ou+S3dPUzuz2yggKLEtxdYmatoEi0v4jKJk+IlFZ4GYCNU3aoE7cv9QcH4wQMa5emUdk1dRhZxo=
X-Received: by 2002:a05:6512:33cf:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-53658815a6cmr1065929e87.58.1725614083466; Fri, 06 Sep 2024
 02:14:43 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com> <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
In-Reply-To: <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Sep 2024 17:14:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
Message-ID: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
To: Arnd Bergmann <arnd@arndb.de>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 3:18=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Sep 5, 2024, at 21:15, Charlie Jenkins wrote:
> > Create a personality flag ADDR_LIMIT_47BIT to support applications
> > that wish to transition from running in environments that support at
> > most 47-bit VAs to environments that support larger VAs. This
> > personality can be set to cause all allocations to be below the 47-bit
> > boundary. Using MAP_FIXED with mmap() will bypass this restriction.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>
> I think having an architecture-independent mechanism to limit the size
> of the 64-bit address space is useful in general, and we've discussed
> the same thing for arm64 in the past, though we have not actually
> reached an agreement on the ABI previously.
>
> > @@ -22,6 +22,7 @@ enum {
> >       WHOLE_SECONDS =3D         0x2000000,
> >       STICKY_TIMEOUTS =3D       0x4000000,
> >       ADDR_LIMIT_3GB =3D        0x8000000,
> > +     ADDR_LIMIT_47BIT =3D      0x10000000,
> > };
>
> I'm a bit worried about having this done specifically in the
> personality flag bits, as they are rather limited. We obviously
> don't want to add many more such flags when there could be
> a way to just set the default limit.
>
> It's also unclear to me how we want this flag to interact with
> the existing logic in arch_get_mmap_end(), which attempts to
> limit the default mapping to a 47-bit address space already.

To optimize RISC-V progress, I recommend:

Step 1: Approve the patch.
Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
Step 3: Wait approximately several iterations for Go & OpenJDK
Step 4: Remove the 47-bit constraint in arch_get_mmap_end()


>
> For some reason, it appears that the arch_get_mmap_end()
> logic on RISC-V defaults to the maximum address
> space for the 'addr=3D=3D0' case which is inconsistentn with
> the other architectures, so we should probably fix that
> part first, possibly moving more of that logic into a
> shared implementation.
>
>       Arnd
>


--=20
Best Regards
 Guo Ren

