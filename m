Return-Path: <linuxppc-dev+bounces-11808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97394B461A1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 20:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJPMR3qzsz3dRr;
	Sat,  6 Sep 2025 04:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757095363;
	cv=none; b=VWmGCrcaawULANsGZObfmgrr2a3hJUpeq12NWWkU4Gyjx2Fs3/nAhmDm+OI0vzT9nyITCK4ugHI8Dz2b11ivW3z3ONClb336oqgAcentLNGMcmqwc6J9n4wqV6ExFjeK9gaGZ/4cjd6BAz1DTcoCAB5CmHivsH0wYl/eFL0XZftkvprhksSdvXYSYdkkO3k5IrSyi2QhoUY32izOMRFrestzSV0++OXCsFl0dMOyXR4jB+LMs0d6OChdSIAfoOh7AHptWTclR5W6N3V2afVnOSAMPtt8kSifdTC35pVazJj1aq/wlyeaUGow/cnmowh6euogbCcbcCH5FtSbI3xWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757095363; c=relaxed/relaxed;
	bh=vyvqbUDXebspKl35FIPJk0lFngkuMldmVpFc1O8R/zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6VgPsdhLdXSfjISbevm/olXXw6Z7QvSaxljEprQEcnkS/f/QgCNti+hEPK+WBkXD3bHIJGjlgPLFRIy3W6d96e50u2+FpYV7bxVAu2dRliwal3nuD/1L3KhV6h42XmVg6jDPnHtkFy2WPp1U7NGiswpHYa+m/XzidvlzPFID+wcZaS+utRXVwhJgn/yMl2bpgh4SAjFnIf2Acc+vzRVEJ4597x2sZnXrCbDiyk06oqpc/JXhbujThhBiQDIkm1j0jL9jr8D7raAFGDqkhIYAMPwWWy+2MI623iC6wzAHmANEXLotEz6UDJ8RBlUsrwkAujF4cSGEXTKhubAfgSNIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OTxcH0dy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OTxcH0dy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJPMQ1J98z3dLG
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 04:02:41 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32d3e17d927so131225a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Sep 2025 11:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757095360; x=1757700160; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyvqbUDXebspKl35FIPJk0lFngkuMldmVpFc1O8R/zI=;
        b=OTxcH0dyMWaTsgP9A8JInNIrvbYcN16irpR/yWyt2OyzPJdLwPD+/ffPUu2pygXNen
         s80L8ywNnygLalkK+BtTt7XWGEc1QXHaUJtFuvi1UbDtIIBx5r6+zdWavvN8zBUHDoad
         SgYCpE1s5q+DuSBI4k58HEJt6OEnI6rvhPXKwyfYUpg14zk60dAcVndcnFf5uJRaBzMo
         9WJfG7TafrDyyHpUwZYSPV/2KtOkJZQZfek4/9YXRvxfy0rdkkg4o6Bq3+c2MqfYDgw6
         2pLuNw2UgTK8xa1vKmixHWufXDOxJkcQpnTvVRAPRogCmkPFUDTGXNX91QRQr3ZuBtDr
         QD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757095360; x=1757700160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyvqbUDXebspKl35FIPJk0lFngkuMldmVpFc1O8R/zI=;
        b=t4b+VHRvBCf5ECA57qsPnpraesAA7XAeBQu1t2Re83a+jqDFbVVSQSM0IccfUlllJz
         AqsteItHs5/GkFtighrxc30C8qCnCTEkgYK+mvTQTg48HIaF4Tc6vEcP7k99XwNVc1OR
         MjEz3xH1COfNYO/sAN2eK2ZurYLArEu4vP/EUyfo/Yca+Osr8MUfg0ylPMVSKK2QOigH
         oWbeBIMGP5++k8pbT3BlwOXbC3UqQKwFBnbYsAIQR1Hj/crqC/iqFC/h4Dyh79+bk/nU
         xWMMXYNKPpkYkdtLZAQ7ag0IkBJYeFRQMA/c2tU60fbr64xPsmm9tIqW6Po2BVPVs2/9
         2NLg==
X-Forwarded-Encrypted: i=1; AJvYcCU0m1S9igk8WXPMucF+0nOOhjB5bDtxGBKoRRiV11K/TYE4AMIY5YPKmQLRundsJDx94tn6iNJxhH9TTGc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzU9i7o74M9/65zdBKeaCj2E7kGSW87V5fkNdLYDAs+YqdGF63w
	VCjHYCOQETPDBSJoXfyVfTgYVQDDF4m+lZkaE2mrsMd2pstApuGVltGx3VYdng==
X-Gm-Gg: ASbGncsChzyiwlaSSytKy31QhhfocZP4I+ChunqW576r7AXuBPV2WxZxE2szUBBCvki
	jRYqXnce7OBCw38XkVT3Ex7ZazEdduAZXftxzJgfN8eDkw2FofncY9ILuqdAMwR+XHfIytgATr9
	/eGesbbk95NvKrZgtMudbaOjwinZWjMaJPL5MK9kCUIvfPISzWCMpczBqp09bS0ErQyTBhfIYqF
	EKrAkitxcsu6tCHzmQJCakUPEO0mUIKmXxlNDE0eQCW4OLsDheFQoB4yuw1ZZtMFx7GlJfDPv30
	kRHqpDJC70AkVcF0tc5eQgK+SIIN6xykI5PdHKeDrw2A7SdTlQLv1PsqzGF+xEcGH6HpN4lNnIg
	/hZOkszA0PFFJJ5iIrSjxyO6Oau1OJKK6zhboTwv9jlMwvFQFSGFMfFOdFNy9yRkm1S+jHsl/7R
	Q=
X-Google-Smtp-Source: AGHT+IH4BIuCOkufR5zpdXWK9alIlYMnPti5eXH+01WmcFERf5EmF47R3LvTkLS7gssMCY0/Uh9xug==
X-Received: by 2002:a17:90a:d64e:b0:32b:5c13:868d with SMTP id 98e67ed59e1d1-32b5c138af9mr13139268a91.1.1757095358574;
        Fri, 05 Sep 2025 11:02:38 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b95d31976sm5409595a91.22.2025.09.05.11.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 11:02:37 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:02:35 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Message-ID: <aLslu1yKPNgoz1OU@fedora>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-4-vishal.moola@gmail.com>
 <aLl9KneqOYTujcCh@kernel.org>
 <aLl98MQs-FlHo6bW@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLl98MQs-FlHo6bW@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 02:54:24PM +0300, Mike Rapoport wrote:
> On Thu, Sep 04, 2025 at 02:51:14PM +0300, Mike Rapoport wrote:
> > On Wed, Sep 03, 2025 at 11:59:17AM -0700, Vishal Moola (Oracle) wrote:
> > > free_pages() should be used when we only have a virtual address. We
> > > should call __free_pages() directly on our page instead.
> > > 
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > > Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> > > ---
> > >  arch/x86/mm/init_64.c          | 2 +-
> > >  arch/x86/platform/efi/memmap.c | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > > index b9426fce5f3e..0e4270e20fad 100644
> > > --- a/arch/x86/mm/init_64.c
> > > +++ b/arch/x86/mm/init_64.c
> > > @@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
> > >  		free_reserved_pages(page, nr_pages);
> > >  #endif
> > >  	} else {
> > > -		free_pages((unsigned long)page_address(page), order);
> > > +		__free_pages(page, order);
> > >  	}
> > >  }
> > >  
> > > diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
> > > index 061b8ecc71a1..023697c88910 100644
> > > --- a/arch/x86/platform/efi/memmap.c
> > > +++ b/arch/x86/platform/efi/memmap.c
> > > @@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
> > >  		struct page *p = pfn_to_page(PHYS_PFN(phys));
> > >  		unsigned int order = get_order(size);
> > >  
> > > -		free_pages((unsigned long) page_address(p), order);
> > 
> > Could be just free_pages((unsigned long)phys_to_virt(phys), order), then
> > the page is not needed at all.
> 
> Or even __free_pages(phys_to_page(phys), order);

Right. It actually looks like we could inline this whole block if we
really wanted to...

__free_pages(phys_to_page(phys), get_order(size));

Should I send a fixup (or v4) with this change?

