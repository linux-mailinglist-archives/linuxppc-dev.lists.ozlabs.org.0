Return-Path: <linuxppc-dev+bounces-2618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E79B1C73
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2024 09:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xbq7m4pfNz2xnS;
	Sun, 27 Oct 2024 19:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730016900;
	cv=none; b=Od5ToassU67VHvaRwk0JE5zzx7rbUY/2ODWjkmkT9aDsJAwnuiz6iAvvT4IM607xa3NygGKcgrEs0xUOEhEdWiRoFZUdYQfWcooj+qwj8XqTzd4vzYV2IrRsFeVq5Kv0YjJlqbTcCsNaxY0NJsrPKZaWUjpR94f7YYUiGeDVE/KE9VDNEU97mp4S7Ntv7ag1WA+s0PbfOo7UiTI0T77ugZ2cOyU6gi8dFXYwAKjq/bAvtNZo3wYqk7kO6PzU2p2SO1MY9K4Hfkkj0F++iwoLLdXVfHfz8GFwdiXL4WyKJb2KTUZLuZvS56Dyg3+TypawP1+jTBm3rbq0CNRVbt2HNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730016900; c=relaxed/relaxed;
	bh=LMk7TYTfiOGw1ZUTKaXXGsrR341gp20XheXlgdbWBCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwpdH5nm4hJUCY7CN6mbMTyuPs1iSXPRWtPcyCgCcbVRf035zuM/0u7iCuRLjIW6NpVJPUn+QEWH+ZuPLzXjuoNgBfv/VzasbkcRkojM0iFrNHcxq6jiI6fXaYtDUOTUaXhwXGwLKEFR9ismsOnXLkGGH1C67KbPQEb2Pat7KRzs9Lx7obEgfuMUjbLH29xv9ORO6bhVsUdCQvb8FFE9dUEGdoCilTr++Eqy1LENduLceuvlqLSo1Umcidif87rzOMbQsfGErhB+Kd6J5CS3Q/mg8YIllwvX8UuRSOjtKf7OiSrVJ0/xaADmMHqqncrvEZH+6x1ITlbLePPmH2f/Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MZrpP4MR; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MZrpP4MR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xbq7l2wVpz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 19:14:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3BB1A40CBF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 08:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2AEC4CEE9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 08:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730016895;
	bh=qSAev/CmbF0LEyj0tVSWN8qmCbJsiIZdku/WjaNmB8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MZrpP4MR25ZJQaUjkXbWvdc5yqspOvJPpoP1laWGfu5qW0Bo5w7+sOKkNN0wFTFc6
	 PKiAnBHnQLbmymCc6Ix2g32z3lrMLVbYBDbKHRK7wTcnhc0s7TmExnWPBavGFZA2CU
	 ZxRZ2yQKLbZi954nmodxa3gz2r2765XCY13DTcc/5moZEI1Y5VMl2qOE1/CaCzYfBZ
	 d0xolS/t0CNAWzjdhJc8/vC18yj/tzng9oiNhW1i1/DM5wimZSMibZgTJJr4RQf+Mz
	 txNna8i6XM73z7TsjE2DyvvJtyQZu6VY2mWd8g1ZuHlsQxirw+6OUnQuLNMsd9yjTi
	 Vo6meRtf3emmg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb443746b8so31468191fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 01:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6hhJdd1RArUzZ79ZC/KkufzhbdToIfjNhuE+IrWTMs/2e2Mh+AnVwyJ5WnuPvwYOwEvE2DysV5whnUYo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5bq+nKzzEbPObRFPDpgLlKrAtZGqOORYj9mID+P1xMNxxeQQZ
	TBtKlOIEejI81Em24M7BTsZNeFTucp5Ii44L1h580LWsf0ij9VGPhpvimZrpJOGp7VB2kC/AhpF
	xHIbghfT5NM4jJB1gYoOy5vxdRUE=
X-Google-Smtp-Source: AGHT+IG7GbUAQTdcFb1Y8OjbqKjN3ralEO/b0dHGyoLDxr37yV7KwVs1ozIjCmGYYGFlqbwOihVt3NM/p1aqclI347g=
X-Received: by 2002:a2e:be9a:0:b0:2fb:58c0:de5b with SMTP id
 38308e7fff4ca-2fcbdfb098emr13787941fa.11.1730016893642; Sun, 27 Oct 2024
 01:14:53 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
 <20241025220239.GB2637569@google.com> <20241026040958.GA34351@sol.localdomain>
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 27 Oct 2024 09:14:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 26 Oct 2024 at 06:10, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
> > On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > > > the arch-specific code was built, only register them when that code was
> > > > built *and* is not falling back to the base implementation at runtime.
> > > >
> > > > This avoids confusing users like btrfs which checks the shash driver
> > > > name to determine whether it is crc32c-generic.
> > > >
> > >
> > > I think we agree that 'generic' specifically means a C implementation
> > > that is identical across all architectures, which is why I updated my
> > > patch to export -arch instead of wrapping the C code in yet another
> > > driver just for the fuzzing tests.
> > >
> > > So why is this a problem? If no optimizations are available at
> > > runtime, crc32-arch and crc32-generic are interchangeable, and so it
> > > shouldn't matter whether you use one or the other.
> > >
> > > You can infer from the driver name whether the C code is being used,
> > > not whether or not the implementation is 'fast', and the btrfs hack is
> > > already broken on arm64.
> > >
> > > > (It would also make sense to change btrfs to test the crc32_optimization
> > > > flags itself, so that it doesn't have to use the weird hack of parsing
> > > > the driver name.  This change still makes sense either way though.)
> > > >
> > >
> > > Indeed. That hack is very dubious and I'd be inclined just to ignore
> > > this. On x86 and arm64, it shouldn't make a difference, given that
> > > crc32-arch will be 'fast' in the vast majority of cases. On other
> > > architectures, btrfs may use the C implementation while assuming it is
> > > something faster, and if anyone actually notices the difference, we
> > > can work with the btrfs devs to do something more sensible here.
> >
> > Yes, we probably could get away without this.  It's never really been
> > appropriate to use the crypto driver names for anything important.  And btrfs
> > probably should just assume CRC32C == fast unconditionally, like what it does
> > with xxHash64, or even do a quick benchmark to measure the actual speed of its
> > hash algorithm (which can also be sha256 or blake2b which can be very fast too).
> >
> > Besides the btrfs case, my concern was there may be advice floating around about
> > checking /proc/crypto to check what optimized code is being used.  Having
> > crc32-$arch potentially be running the generic code would make that misleading.
> > It might make sense to keep it working similar to how it did before.
> >
> > But I do agree that we could probably get away without this.
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.
>
> I think you're right that we shouldn't bother with patches 3-4, and I'll plan to
> go back to leaving them out in the next version, unless someone yells.
>

Agreed.

If we need to make this distinction, it might be cleaner to use the
static_call API instead, e.g.,

+DECLARE_STATIC_CALL(crc32_le_arch, crc32_le_base);
+
 static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
 {
        if (IS_ENABLED(CONFIG_CRC32_ARCH))
-               return crc32_le_arch(crc, p, len);
+               return static_call(crc32_le_arch)(crc, p, len);
        return crc32_le_base(crc, p, len);
 }

and use static_call_update() to update the target if the feature is
supported. Then, we could check in the driver whether the static call
points to the default or not:

+static bool have_arch;
+
 static int __init crc32_mod_init(void)
 {
+       have_arch = IS_ENABLED(CONFIG_CRC32_ARCH) &&
+                   static_call_query(crc32_le_arch) != crc32_le_base;
+
        /* register the arch flavor only if it differs from the generic one */
-       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+       return crypto_register_shashes(algs, 1 + have_arch);
 }

