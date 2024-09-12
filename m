Return-Path: <linuxppc-dev+bounces-1303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D98E977372
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 23:16:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Vbs6dfsz2yHs;
	Fri, 13 Sep 2024 07:16:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726175769;
	cv=none; b=MQvz2m6J4G6jBE/sB99RnvheH62UTxB/nu5ogY8ZIEH+vGtZkKbPff5CTfYErKbUH0xXPu0sNYgTswNptrl70y1kH6t8RjbLGFQpFbObrEaiG455EBFCIDZrhtoJ15BkxABZ6EPKuf/v5rqg8ha+JooJ+lZXw2lmoUH4mYCP/3oPYz7dSb7cuzyi6yc2g987EEcIhp8bMu6ltczKfLP/cZrUzmpR0C2qeFs71NNM+gAvpoJeBqSWz69M7UrrPRCxWPAwB27SPoq+lvJgfDKCqnr7XBruaeoZxTWH92onZE2SGOAux5ttbqUL6gFS2Ilk4CyS+iIfuPFFxnlfoCYWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726175769; c=relaxed/relaxed;
	bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow+1zBTwgM1h6h6nZV7JZfGnFJfXaA7tUZa7K4cp/1FTc7PCvz2MmK9XBnXIakXjud0Qf8IPxsz+67bsEBT+dRgyeSA6cMXWbSle41X6P41+ICV/M/m48YZni+/SrCxX+Z9JrcXS2K1hivOpLjp9w92wB0kR6Z0KYxESneURgKLKhBk1iVe3A0QEySX3XQGe6xrNJ/dx/pbKoi0aYiW4NlJzxqBnmwhcbcxx8n0qAcZZpeOg5t3J5KNV8+osO1ADGUIB+xOnzxdhoZqmJRWYE3TCwt/ao90oNH0iGhwZBZMTPatG7tnhrUXo7ad3YHUwy5bgAn+OsFd1pMRJp8cl/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cpHwR+zB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=cpHwR+zB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Vbs0Ygkz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 07:16:07 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2057c6c57b5so8546165ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726175765; x=1726780565; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
        b=cpHwR+zB29RBAtdn1GCjhMLRuu6vEJH/lWUrA4RpLGibCSoYx985ZBJVXuHinJvBqt
         oPW3WHoxfsoMQLstvc7kKjXzEB4kl9FNHre569svhy1ht81oJK7KYj78g1HqFhY0ZARl
         qNVNk06V/kjPV5f+EUBXODYi8OQxvZ9mtXLIxN/1VbXL4y49u9BRIXWAOvjwSdHxVjl4
         m7nfdoXzmRIojcE57W57fxZlcaAuRf6Ge6JPjjrjSUf6pD99dUSH5xZMBKJjJ4T1pZ9j
         w70/ATgmswAY/w5jwBhmCQWMRUYZQeDSwxAS3kN9dQeK/LcfEOVHaS5zBfqmzYgd+/kG
         gTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726175765; x=1726780565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAySjmj1C8RnCc99v/BjFAJ8TYbwKWl+6IomlsR+BoI=;
        b=LjEErAxrNK/zYgXP1Leht/DCbcgB/uHXqV8vEvYWWWwTQsIcqoxvtztV0WlX5m/+x5
         PtX6LHAJh1RAkKJfl0/YIJu1Q78HRQqdZEjzjD443Xgbwza+EBIkins6sBvIi3eHh7TW
         WNId3l2cKpxxZeaBVTBlbtjuI6TIz+FK2pYvKz494oYLwFTgEdpCmOvdYKOXRDzIiOL4
         SDyZlM44Uf3uZ1OWEJOksrevBnmBZCUqvsLN8uyCH3KC3+8Hgew+ZRecIhyJDbz7nYMZ
         mc0zJTs+7AOohwoiVHDfZKxS7NvDgtDRzG6F3VgwPnK1Z1p4LUIFZ2YTFmBl4rt6Jlzv
         ecXg==
X-Forwarded-Encrypted: i=1; AJvYcCUPqXyYHl3zj84m7elxZqRSaptxOCunsJ0v9ufLswnfHqOXIm6fKfEJiw4mDvTZzh2UXEL4sP0tVcFGp94=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlAW8xECCYBGq7y4a3miTRteOYDL3YcpBYNpL8LJ5dEvEYpdIa
	WB6qPBz3Ivv48wxPmi9T5VafJGY9VHgntFGpmgM1T5cITQ68jocqq2H3W6O1azw=
X-Google-Smtp-Source: AGHT+IHUzjdPrj87uHlM3yWrW/J5uo4qx0FxZorL/y/ZhI47SL1dDJtb3OuvF/ucYmZPS3S517PhSQ==
X-Received: by 2002:a17:903:41c9:b0:1fd:6033:f94e with SMTP id d9443c01a7336-2076e61ddabmr75358475ad.27.1726175764569;
        Thu, 12 Sep 2024 14:16:04 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af47662sm18233275ad.93.2024.09.12.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:16:03 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:15:59 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
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
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
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
Message-ID: <ZuNaD+zAXiAulc0n@ghost>
References: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
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
In-Reply-To: <ZuLIPZId9aHcAY2j@arm.com>

On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > Opting-in to the higher address space is reasonable. However, it is not
> > my preference, because the purpose of this flag is to ensure that
> > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > applications that want this guarantee to be the ones setting the flag,
> > rather than the applications that want the higher bits setting the flag.
> 
> Yes, this would be ideal. Unfortunately those applications don't know
> they need to set a flag in order to work.

It's not a regression, the applications never worked (on platforms that
do not have this default). The 47-bit default would allow applications
that didn't work to start working at the cost of a non-ideal ABI. That
doesn't seem like a reasonable tradeoff to me.  If applications want to
run on new hardware that has different requirements, shouldn't they be
required to update rather than expect the kernel will solve their
problems for them?

> 
> A slightly better option is to leave the default 47-bit at the kernel
> ABI level and have the libc/dynamic loader issue the prctl(). You can
> control the default with environment variables if needed.

Having glibc set the 47-bit requirement could make it slightly easier
for applications since they would only have to set the environment
variable. After the kernel interface is approved I can look into
supporting that.

- Charlie

> 
> We do something similar in glibc for arm64 MTE. When MTE is enabled, the
> top byte of an allocated pointer contains the tag that must not be
> corrupted. We left the decision to the C library via the
> glibc.mem.tagging tunable (Android has something similar via the app
> manifest). An app can change the default if it wants but if you run with
> old glibc or no environment variable to say otherwise, the default would
> be safe. Distros can set the environment to be the maximum range by
> default if they know the apps included have been upgraded and tested.
> 
> -- 
> Catalin

