Return-Path: <linuxppc-dev+bounces-1216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 925899737E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 14:50:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X33T25CwTz2xxp;
	Tue, 10 Sep 2024 22:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.166.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725972614;
	cv=none; b=CNdmqCpDj/BXUUsEgXOwuoRB+00vQR7e7HaGnDGgjcXKeWU+2QCe6eWlhgCg3rY91uZ11/9G+UxaEP/7KkEGNdOKN6aG8Zpv2cMAYsQmWTIsiF1fqqcuHm6ZBJb27A0fWttPsLqcaezOQCBgXHYoWOJvdMzz8qzMEIZTkxsDfxbPeknfQy3G7wbAPgkbsFOi3W3BqkweGdJL9+HPW3knNGV89o17Iy8ebtO8taMP2A65XJUP7WVNCxVeyAQzutSQOd0MlCRgpo97Auz+arVcIFjBIlhUTny1aI/JjZ8WCSsvnXxmT7CocRlm0hnrWzpC/NfXUnAeNfgLl9vIw9QFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725972614; c=relaxed/relaxed;
	bh=FY/G3MXaavbXgZQIcVqEM6/ihxl9V6XepDsCDLrUSCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U98wi/eNHdsvLcihp9Upy/CxXq9l8TaWd7NdOSGQUuURw0sklARhFRMyFoWb4MfjFRdzyjNpeWLVcMTCYNUtG8H0jhRezfiFMgZycGCy+vto19CW44QbblugZLGZwuz28+Tu9aMTbRhtExwVcWRo9ErQOf5TxV9wfT7s/A2MSMjL4rkx/grzgzHAFD/0eHzI8V2sHrt+vVUbQSlTmx+78HWZ6wNqxctWtJijd4xwxy0/cb+ltMsIoN0Vny3uqRWecjcfaJNq0KZH3BoPmpC9m0kxTZlrGh9GbKz7s18IgfinF+ECoxJK7OXc0sXAMGUL8jd6BhIRCRc6LI/czeNEPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.166.48; helo=mail-io1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.48; helo=mail-io1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X33T13kQrz2xXW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 22:50:13 +1000 (AEST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-82a238e0a9cso256318239f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 05:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972609; x=1726577409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY/G3MXaavbXgZQIcVqEM6/ihxl9V6XepDsCDLrUSCE=;
        b=rzRovQDJ4jVBseU6lZyb7qNFibhvCv4mtYGnHwV6IhecoqCeQfuRXynoGWlc5W1naQ
         /pRS8KioDIKKViEt8keex0VgxavDc0ts8LAnGtY013jg+lyN3PNpSBNbVPnry4/ZSBhl
         pnZI3jZgPfESYa1bIYQ+rW7KJ18tgJ2H7GVXrw9AcuvMQwaYCIvmbIv2sk6RaQHYBXLW
         GwaoYt7cvXupWnEtIVYy4ZYsMAGvvOI6n/s3zWoxa1kKLw1ez4+Xg2cW9qNcq+OgopAR
         kBZsWLtphas1ivJhkV7z5hi0vJUNfKSc2VHv9M1vtxqZHNdrLe/BLH4teOWyfd9R7+6H
         VlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE2vZC9CYYQmqjt5rsz4cfowX9oKq3UXUDgbcJ/gOS+FLSPf8R4GLM5JRvMxyA7T6Hy4NQs/diVdKGqIk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8fGfBRKC6c2vQE5Wifv8Fzhx2tnKbw+l2PnXngqUdXN3t98L/
	E38sLHujWFI+hZpINtJSuqcFxYQQ7w5bblFuV38xnoWMlR1CQ72Bb4YenQln
X-Google-Smtp-Source: AGHT+IFxVAqJunghHsdi38abAOTTzva4mxrLH0kPuMO+pDQ9zQyRQj1FS4hFckb1VcSWRO39ki0mIw==
X-Received: by 2002:a05:6602:27c2:b0:82a:4490:692a with SMTP id ca18e2360f4ac-82a961a8fe9mr2007443339f.7.1725972609079;
        Tue, 10 Sep 2024 05:50:09 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d20b64732asm110029173.8.2024.09.10.05.50.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 05:50:08 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-39f526fd19bso21824975ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 05:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXksHQDQF66Pgj8PEPpQHortitb+vmy0kHLpW78KDVrVBEjY2hZ8Jfpz3z5Lwynm8N4Ss2NetfFpQDAs/I=@lists.ozlabs.org
X-Received: by 2002:a05:690c:39d:b0:6c8:1e30:513f with SMTP id
 00721157ae682-6db44f37140mr169442817b3.23.1725972199364; Tue, 10 Sep 2024
 05:43:19 -0700 (PDT)
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
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse> <Zt9HboH/PmPlRPmH@ghost> <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
In-Reply-To: <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2024 14:43:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Message-ID: <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Tue, Sep 10, 2024 at 11:21=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> >>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/pe=
rsonality.h
> >>> index 49796b7756af..cd3b8c154d9b 100644
> >>> --- a/include/uapi/linux/personality.h
> >>> +++ b/include/uapi/linux/personality.h
> >>> @@ -22,6 +22,7 @@ enum {
> >>>     WHOLE_SECONDS =3D         0x2000000,
> >>>     STICKY_TIMEOUTS =3D       0x4000000,
> >>>     ADDR_LIMIT_3GB =3D        0x8000000,
> >>> +   ADDR_LIMIT_47BIT =3D      0x10000000,
> >>>   };
> >>
> >> I wonder if ADDR_LIMIT_128T would be clearer?
> >>
> >
> > I don't follow, what does 128T represent?
>
> 128T is 128 Terabytes, that's the maximum size achievable with a 47BIT
> address, that naming would be more consistant with the ADDR_LIMIT_3GB
> just above that means a 3 Gigabytes limit.

Hence ADDR_LIMIT_128TB?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

