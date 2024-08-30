Return-Path: <linuxppc-dev+bounces-778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A9965491
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 03:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww0c50Nr2z301v;
	Fri, 30 Aug 2024 11:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724980613;
	cv=none; b=eZYXWgBPOwN3AJmBtinJCYyd7lifjlu5t/lBT0jP+Y6qdiHZS8hK7MRThoLkxvs8JHGxqjS1mlhy607qGOiZP/eE1iemOPOUJfvgC9W+qLtHpQ0f7yEYdnd6qkO8QKCDlZTvoRYcBekXIQsPxdXQs5/qp4Yhqg0usQ1DgvjS6//IY3x8lJNMPrt/gEw2rr7dwt8YPmydRh0TkJSsLOM6ZY0+tIxaQughzDGT2d9LK0OIdDxIcAtxJG14ZDJj60Na1vRGYJVcz5qXgXue1sHLL49H5b4YNxg/8p93czAIPi/pTof7HyOmskKccNpl2HK1U0qJ6Lo/WY4zYrGYS2AVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724980613; c=relaxed/relaxed;
	bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=I7e7d6/nZbBbR0Ibjh0UhvrrITaZNf7s/iJmEVKHCCuPBrs60EqC3k0B0GwEls0XYq8pMxYUKDYccNv5WxOodP3VkeZ/OslDS+K28XKN6vhW2MNcNWWDzgjmAvTT5zXEdUbLX25nxmqblPurpuvdBYeWc36tMzR5SUHXU5cgOLgMW2+OfsDd0CVreroEbohSAh7Mk2P8CSkE6Wg1weB/VsGYAZyoYymTL0cemCe3RoavUdYoOMCJRx/Mlr9dQME1S4jkDD6I7rM5BltAly5S8Ne+twwNB+wWK49CQ4w8arJf9k+xRoAWQR0NsAFAwhbtji1c+NHcugI+dB43S7TKwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VSXx9BRp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VSXx9BRp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww0c43tD1z301n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 11:16:50 +1000 (AEST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5dc93fa5639so783353eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980608; x=1725585408; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
        b=VSXx9BRpARKZC+QVXjhsWULRLWeC+G43vvnYyojN93/3DaJess09+6q0lpz1AgLQHy
         LHm5gaaiFfJpaHdPlMjng1/7Fi1GD37OksT2FQ2MTSViBuyiq+gOwnhnWkkRp76O0jIr
         I2y5E6vc1C4iTP7CIgXdfnKxP0QWcm1lw5EhhxcJSjunOheikSdXY5R02annNpvmY185
         nmfdgf7PXWK555lKoQL377UElfvoUbinZX1MKluI75xI8+ME8Es+JQbyl0DAIjnMAbL9
         jnjb8itmdNDrvrXIHORwyi+q2aNAEFUbRxo9UYfMDWld4iZi7o0qQ45+fU9EQMlJ/zOz
         NMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980608; x=1725585408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7xDP+Z9ioGU1Ej/VigLqskETGN0WUiHvrKI/4LF5a8=;
        b=hJQpNrMHCAsX0zQxYCK3ndh7J0hJh3ST3yv7Y5230irrlCTJZgJLka6Dazf2syjO0u
         9wwTQ609fFWco8iM2PHAZF5ec8n28C3oTKy9qrrPdIcZqpDznvZJZrljkwwtQD9F97af
         S7eTyDz5+umUiHr991+SOt+deLx4FJFEdgUZGW6roAS4ufpbLWQij9QyFuqRlxrDU/AI
         HQNrr4YgTIsciJAa1WQCTus6vkLmWXmWBWGf+bC+Zpq833kSYWBzGVF6umL4z6UeIFdl
         ZJ+w70rqw3k0uaa4S7ZdC3AZuzATu0RiYLEtSH0jcjO9NmoEKaGnldz9bflEY2sUTWo1
         3PIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdfSKoMG1nuAV5aXX8Cmw0GjDY7d1eXEJN+j8jRs7fw8zuixQtLCHRQ1spIi0Lq7XFB0LXmy9zb8lbWNc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyljTCQw7ak4u3aNVacUY2MjfCJ5nHb8nDnMncCcjCOYTPqWAe
	3PvO5iH1yNo2oEjYohMS9ekBAFucPF82YpQZ4iJByTzDil4Cfny3Cdffl+FXK8o=
X-Google-Smtp-Source: AGHT+IH958S4ePdwDnUiHubyspadJoOLZkUZCeioopGjkAA0KkZUXlfkSz3mG+kkmopghBfnyH6A6g==
X-Received: by 2002:a05:6358:2803:b0:1ac:f109:e248 with SMTP id e5c5f4694b2df-1b603c00435mr551866655d.2.1724980607523;
        Thu, 29 Aug 2024 18:16:47 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a5961sm1734132b3a.63.2024.08.29.18.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:16:46 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:16:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
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
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/4] mm: Add MAP_BELOW_HINT
Message-ID: <ZtEdevUWzplteQWv@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-1-638a28d9eae0@rivosinc.com>
 <87mskvenum.fsf@mail.lhotse>
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
In-Reply-To: <87mskvenum.fsf@mail.lhotse>

On Thu, Aug 29, 2024 at 06:26:41PM +1000, Michael Ellerman wrote:
> Charlie Jenkins <charlie@rivosinc.com> writes:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the 48-bit address space,
> > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > for the kernel address space).
> >
> > To make this behavior explicit and more versatile across all
> > architectures, define a mmap flag that allows users to define an
> > arbitrary upper limit on addresses returned by mmap.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  include/uapi/asm-generic/mman-common.h       | 1 +
> >  tools/include/uapi/asm-generic/mman-common.h | 1 +
>   
> You're not meant to update the headers in tools/ directly. There's a
> mail somewhere from acme somewhere describing the proper process, but
> the tldr is leave it up to him.

Oh okay, thank you.

> 
> > diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
> > index 6ce1f1ceb432..03ac13d9aa37 100644
> > --- a/include/uapi/asm-generic/mman-common.h
> > +++ b/include/uapi/asm-generic/mman-common.h
> > @@ -32,6 +32,7 @@
> >  
> >  #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
> >  					 * uninitialized */
> > +#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */
> 
> IMHO the API would be clearer if this actually forced the address to be
> below the hint. That's what the flag name implies after all.
> 
> It would also mean the application doesn't need to take into account the
> length of the mapping when passing the hint.
> 
> cheers

That's a good point. The reason I did it this way was to allow mmap the
possibility of returning the same address as the hint. If it must be
strictly less than the hint then the hint address can never be returned.
Maybe that doesn't matter though.

- Charlie


