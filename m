Return-Path: <linuxppc-dev+bounces-15627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CFD18BFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:34:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr7wl5KHgz2xjK;
	Tue, 13 Jan 2026 23:34:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768307671;
	cv=none; b=jEuJoPRygeeoqjWXM6bRYz5A6GPtOSEfOk7aT/f+RXGDAL+bCJZGeraj+ma1nwgVu3v7Niv4UjXrVLPwOaPF/tWDQKe8VHBRqxfi3Da6p8rgyQJWkSh7QB+eJb4AqxKAp+QudjtxwUpSmDJn8i8A6BsRaYpGrORfRMaL8pmTxZvTQAUsU77BW9dtCTSzZXAURNuMnTARxM4wZJngnoVT0hfK90pO7D6A3MkwY365GOh10AbCExVDS+SbubRK/OdU30gwhrivFJV060EnGel7eKdzB2JdcXEWa0GYKzJKMu3+IJsjcPX+qkPQ12VmWrQ/jHbyv+pQwMBNFFGgatZUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768307671; c=relaxed/relaxed;
	bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=iwXPn7o6gDc8vGHCk8zw17QY0UQmJHLqTqqzzaz7CQpOJc6Sh/o6iQqekl0MicvWuY5SIEDRL0cuo62SQAGWAVpiQomvV3naVzd1BVbZQVFht6mrvngdvzMNwAs8tEddVcIqwLNvx4q2//sDdSD4agBr0kXPlmjw2aAQYl4DhbYABnJQQrZmApZEghdOqu2YlI1VQ1JbmDGfQSgO0AqGze672YcxSQ+hgv1xNpAozJEzLXh5XOyzVeNAS6fvLdGtU9NpIpHwPbfTbGBRTWW3mslJrrahHB5K1mrX6FKFNdwPHSFFgQFld7I23b6ChaUr5cGkagZFFM77gUAk8Rd37w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jE9GNsyS; dkim-atps=neutral; spf=pass (client-ip=209.85.216.53; helo=mail-pj1-f53.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jE9GNsyS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.53; helo=mail-pj1-f53.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr7wk3p5wz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:34:29 +1100 (AEDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso4361773a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 04:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307607; x=1768912407; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=jE9GNsySPX5eQrPi6BmmjPl7MNwrCbV1lcA7jdTJhD+AL60j12mWjVOhtv1pd8xVsI
         iiCd6hBuKQkjzPPiO7ha+BKqxXXgZsq7KqzkXoe9WAj743HWdUzdGucNwpd8VVfgeXE8
         1rNaemOXooHhzUYP9Ojx7hQfLdEyg9NwLWymrcrWop1lyW54uJ40bgMTgpe0aigfrQN/
         V20xe7WYgmvsLFZS3eI+41sY58X4LJO3B+awmtnH1PBjt/o74SQDIYbmabPIUyhZGezM
         H8mFjoV5zCLMQigEn12LBPsP+QdWjkIdCGfrhh9198MVsfz/jUvnFw+U8lcXcg7pjCuW
         N0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=VRii+AgPFTw8XalHyY3cmfjQGdt/csqgoLiklbEpvyXMwwi2+jmMvhOq0C2TTLwYU/
         NjIn+SHVQqcnBZCYhXc/9fmlOPZ2zP6GaAeXd2gpfBEYwiP9aeEvbDvKJSX0uRPnT9LJ
         zFdDt3k5nG+jmsSyb3r+HhuJGoAE6qMwplH3JjoSgzxHFn7kssZ24BTkAdsmPzHf+faj
         p3hvCWE3HuN1YYWIoNGXTfAw7roGyoSTD5F2hWmUPZbtKZuPR4hAWUKDYt0oYZjpQKcB
         FzkQ7aKhp09tD8AfyNnCuDYJki75M9b47cGV/4IqX46XFhFWQbQ+kx2OI3a46WQ9HR37
         qT+w==
X-Forwarded-Encrypted: i=1; AJvYcCUy0k6JM8/+2dWU2fGwz4MuWv7u/NbfCD7Yovyyb2TNaeoU8j+RsRr13BtHz4/jxfPZU5lPzhJa4+m2AfQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlIYg8Z/HIw6MCgAvf0YEOOJ4+a87n3OkGSRyaMfqM5wXBAuhU
	uXzCiZl1B3+kP29B8JbnvhpTJukMliPuSVcFJZHCqVRechqdEskstxcd
X-Gm-Gg: AY/fxX4OWx4+WN/nYX8OElq2vEwCCTCBzMpr6tNa8q3z4kFbwCKV+fXrVZXF5pKxgw4
	i4xJEhIOCOnkWdSUdWA2sSG9yY77ms9TlF493zfxfcr9n7vibNy+tdSjBABOrmgRso9XWHgxrtU
	kxnHCKdIeSzLscAfzTYUFj3a8zu69c7afw4i0hxEfZAdazBucBGW3TnypUlEwOat3o9a6qZ87Ew
	dNU/TUBzEHQ8iMuH9oQGT1+WNVbtxHAKkmyZfl0tfZUdjqv/yitN7CCZW2ygM1zrQsLG7y9/yHL
	zz06Ea9kIkV2IJxKyFSx4dTFhEN9EDooUsalDsPpF2/JHq1QK8di4HwxSVVhQ+mFa5AUb+n9W6D
	1g6IciY+SsRomZo5D4WmVWU9ns+dwxOl1Gb+8oweiSvT+7d3omxvgw62XKwzwxXp4EA2IGTF+f1
	sc4n5+
X-Google-Smtp-Source: AGHT+IFw8NQUhXWsNFLNcy9VnhtaeqSccMp4bageDierszWlx1Kxyih6osyfD1+uAcqTN4o2oK4SYQ==
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr18570023a91.35.1768307607428;
        Tue, 13 Jan 2026 04:33:27 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fd6e343bsm1428958a91.1.2026.01.13.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 15/29] powerpc: introduce arch_zone_limits_init()
In-Reply-To: <20260111082105.290734-16-rppt@kernel.org>
Date: Tue, 13 Jan 2026 17:59:49 +0530
Message-ID: <87zf6hu24i.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-16-rppt@kernel.org>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

This v2 looks good to me. 
I have also done a basic bootup testing using Linux PPC CI.

Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

