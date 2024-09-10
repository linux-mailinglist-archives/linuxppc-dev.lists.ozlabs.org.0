Return-Path: <linuxppc-dev+bounces-1222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD7697465F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 01:29:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3KfW602lz2y71;
	Wed, 11 Sep 2024 09:29:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726010963;
	cv=none; b=oMDw/vrCYwPTfellVmBTUI1F3TtI9GQSz7O8c0QWW1V1e1lfhCArTRKgrnFLtQyygFu6zGc7RumSA64vYm1F76Voj2VNEwH8OA6AQ8r1UBmfGqKLVbhWixgvltqPY2Zay+mzZLvDKSGiBvB+Q5bB3sbOeGcm2IpRPsN43Nu3rax8EQ/FQucfN1/dRfADT4Evi7V0m3Pn5Tf9Bobzs8IWIuBxuCf+nCokk0K1NtnjWB43Gc/ygTQlLVtt5J525S3EQ/loZrHLd6Hga/xKkjGD6fO2JIVa3wadg1psdtAC1onJLe9zIwk+eqynC56CIIHKV8wh9FFKc3QKIAXZ2145Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726010963; c=relaxed/relaxed;
	bh=CYrCbXlvqV0+h/8xybyAavYRRnIQ4hnNCNmZGJwr9QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9u3ePSNpKHMfhkh+9lV0uo6EYtmEUn0cTFOM1xidaY0yQp/BbVUdDJ4jc6xNC0esAfGUzkRnLYEUnbCGQKHb6im/9DtUk8aBoTnWqfNzzehWLYiX01HDAA8eKfrBYw+0mSkwcOHeFdZ6o0IEGw8hpmrjfWw1NRpCAkd/A8Chtu2ALXO6XSzgTT0C8g4OjmKcMAHYN7KoPPO+X7xLAouikjZqpoMd6KXL17dwIGXqfVk06uy8L7NU176T13b/mBRr73taEiwyJOf9F0MPeWZlrsEBxx93eml2owokHUSg+3v+yiJHqM5OyJpiNVtG6P9Ea6ZSQTABYntnbbONJ4XKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sF5Xoz/v; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sF5Xoz/v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3KfW1Lwpz2xq0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 09:29:21 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7179069d029so4347684b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 16:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726010957; x=1726615757; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYrCbXlvqV0+h/8xybyAavYRRnIQ4hnNCNmZGJwr9QU=;
        b=sF5Xoz/v50uf1n4g//nkaFXOfS+3StHEQAZn6go39buhZWIg5eHqI/se/qLGUO3vd8
         MUNHSsR9BYQJWhwVXrULpdYFzBsevpVv8zjiWGZ9xzvl4vEgPtGjvdr36MKGxPd+pvF8
         GVoMPvydnopF1lUxGUsOLKMN9A8K9GMaaHw4oXNi3XvKC/xVOsifAlbMDJBmq5pYKzur
         BmzCuXTedjiSSGfT25r49Qb62oDrRfDAawuDmxHRjLMuYYwQUYHtxvSA/s6xPzKvdPlG
         Y7feKRKK7BSrU59WGP8+PGkQvUy3OEgR59BOP2noqjUl0Nt8KmWf4CLIbgm3TmlYy98v
         yc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726010957; x=1726615757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYrCbXlvqV0+h/8xybyAavYRRnIQ4hnNCNmZGJwr9QU=;
        b=WblZ6R8NBppyDdQqdGD6E2Yohi3zKQpiBQraq+vWRhZ9CZc/A2oOqf6v105f+VojmW
         blpAm/Qbv0xQHA1ra/zdwxRl4sjbDmzw3shgR8qri7T6NaPR4nxAz8igaKp0nAMWzHfP
         8cbBVk5hBPEqjhHaT8/8kv+7Tk24M5QsWlkJ13+lqOE3N7xDK8x1LFJtUlkBxzX/LBFr
         Rv830ba5wKqCKNpCZ6fM6dZK0xEAYf9gUWS2YQvEdPA/kylk72r9j7xPkPkK5SCRtpBe
         EIUrNkLBTrVkv5kN4I/M49zbSgNqKB9T7HnIWgWqomwKK15Xw6dtvgalmmIauRF2T/WE
         ikuA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVVS458YWmdWrTCABOSkqE8P8tc3DdpeWsl4q7k3Iy5XSEc/Xrb5MlsFriMeG8oIM4ON97rb36mkfehU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyS+vF09m1hEj963CEypfkH/OiK9lqwswgyPvxJ0e6n7Ft6BlC
	0pQjB+ah/29niFEdnWrCc7TNWznQN4aWI9AkXc8cQ41RETMuYa6+6M3gaWWn2qg=
X-Google-Smtp-Source: AGHT+IFu2ts9QR3o7HId+sTbARvp/Mp4cS7y9d4XxkhhKVfZnTlnktrEfIJSlLrlAVGi3hD8KRDoUg==
X-Received: by 2002:a05:6a21:3318:b0:1cc:e4a9:9138 with SMTP id adf61e73a8af0-1cf5e10ea44mr2924283637.29.1726010956374;
        Tue, 10 Sep 2024 16:29:16 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe2641sm1873651b3a.59.2024.09.10.16.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 16:29:15 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:29:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, guoren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, shuah <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuDWRq+9b1o864vY@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
 <7be08ea9-f343-42da-805f-e5f0d61bde26@app.fastmail.com>
 <016c7857-9ea8-4333-96e6-3ae3870f375f@lucifer.local>
 <Zt+DGHZrHFxfq7xo@ghost>
 <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>

On Tue, Sep 10, 2024 at 09:13:33AM +0000, Arnd Bergmann wrote:
> On Mon, Sep 9, 2024, at 23:22, Charlie Jenkins wrote:
> > On Fri, Sep 06, 2024 at 10:52:34AM +0100, Lorenzo Stoakes wrote:
> >> On Fri, Sep 06, 2024 at 09:14:08AM GMT, Arnd Bergmann wrote:
> >> The intent is to optionally be able to run a process that keeps higher bits
> >> free for tagging and to be sure no memory mapping in the process will
> >> clobber these (correct me if I'm wrong Charlie! :)
> >> 
> >> So you really wouldn't want this if you are using tagged pointers, you'd
> >> want to be sure literally nothing touches the higher bits.
> 
> My understanding was that the purpose of the existing design
> is to allow applications to ask for a high address without having
> to resort to the complexity of MAP_FIXED.
> 
> In particular, I'm sure there is precedent for applications that
> want both tagged pointers (for most mappings) and untagged pointers
> (for large mappings). With a per-mm_struct or per-task_struct
> setting you can't do that.
> 
> > Various architectures handle the hint address differently, but it
> > appears that the only case across any architecture where an address
> > above 47 bits will be returned is if the application had a hint address
> > with a value greater than 47 bits and was using the MAP_FIXED flag.
> > MAP_FIXED bypasses all other checks so I was assuming that it would be
> > logical for MAP_FIXED to bypass this as well. If MAP_FIXED is not set,
> > then the intent is for no hint address to cause a value greater than 47
> > bits to be returned.
> 
> I don't think the MAP_FIXED case is that interesting here because
> it has to work in both fixed and non-fixed mappings.
> 
> >> This would be more consistent vs. other arches.
> >
> > Yes riscv is an outlier here. The reason I am pushing for something like
> > a flag to restrict the address space rather than setting it to be the
> > default is it seems like if applications are relying on upper bits to be
> > free, then they should be explicitly asking the kernel to keep them free
> > rather than assuming them to be free.
> 
> Let's see what the other architectures do and then come up with
> a way that fixes the pointer tagging case first on those that are
> broken. We can see if there needs to be an extra flag after that.
> Here is what I found:
> 
> - x86_64 uses DEFAULT_MAP_WINDOW of BIT(47), uses a 57 bit
>   address space when an addr hint is passed.
> - arm64 uses DEFAULT_MAP_WINDOW of BIT(47) or BIT(48), returns
>   higher 52-bit addresses when either a hint is passed or
>   CONFIG_EXPERT and CONFIG_ARM64_FORCE_52BIT is set (this
>   is a debugging option)
> - ppc64 uses a DEFAULT_MAP_WINDOW of BIT(47) or BIT(48),
>   returns 52 bit address when an addr hint is passed
> - riscv uses a DEFAULT_MAP_WINDOW of BIT(47) but only uses
>   it for allocating the stack below, ignoring it for normal
>   mappings
> - s390 has no DEFAULT_MAP_WINDOW but tried to allocate in
>   the current number of pgtable levels and only upgrades to
>   the next level (31, 42, 53, 64 bits) if a hint is passed or
>   the current level is exhausted.
> - loongarch64 has no DEFAULT_MAP_WINDOW, and a default VA
>   space of 47 bits (16K pages, 3 levels), but can support
>   a 55 bit space (64K pages, 3 levels).
> - sparc has no DEFAULT_MAP_WINDOW and up to 52 bit VA space.
>   It may allocate both positive and negative addresses in
>   there. (?)
> - mips64, parisc64 and alpha have no DEFAULT_MAP_WINDOW and
>   at most 48, 41 or 39 address bits, respectively.
> 
> I would suggest these changes:
> 
> - make riscv enforce DEFAULT_MAP_WINDOW like x86_64, arm64
>    and ppc64, leave it at 47
> 
> - add DEFAULT_MAP_WINDOW on loongarch64 (47/48 bits
>   based on page size), sparc (48 bits) and s390 (unsure if
>   42, 53, 47 or 48 bits)
> 
> - leave the rest unchanged.
> 
>        Arnd

Changing all architectures to have a standardized DEFAULT_MAP_WINDOW
mostly solves the problem. However, I am concerned that it is fragile
for applications to rely on a default like this. Having the personality
bit flag is supposed to provide an intuitive ABI for users that
guarantees that they will not accidentally request for memory outside of
the boundary that they specified.

Also you bring up that the DEFAULT_MAP_WINDOW would not be able to be
standardized across architectures, so we still have the problem that
this default behavior will be different across architectures which I am
trying to solve.

- Charlie


