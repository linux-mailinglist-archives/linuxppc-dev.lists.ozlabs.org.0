Return-Path: <linuxppc-dev+bounces-8879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB4AC16AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 00:26:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3NDQ5fngz2yNG;
	Fri, 23 May 2025 08:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::731"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747952774;
	cv=none; b=IwtoJ4ngEn6JD8cOdnItAd7VEiPOIUUqU84PSvJ2i1hXCKwNOSEH0goi7b5uLL8zgP7IKal+bET/M9gX8w0o9qczyrBmoN7BAiIskCoTetRhm8A13y8VE0Byezam1ivPOjroKznZStQeAadYRa046PpkrKP2gofyuzIICd2sh/K9O3cKh02kbFnARIJye06QAXRlgqCOb+22zdxL9t2lfBq3VWnNKXe54SgVjr0eIDE7QHQu5WWYEFqAc3TeigPtd+3CdqrMtoKjQI+GDGamwhH0d6wODYmlksHOdNI5qjulKmmpmz9R58TLHC/cVHwzyiwXqJdDsIQtx7ra6vlZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747952774; c=relaxed/relaxed;
	bh=yW4BwrWRPMGZw+m/ri6EFRKCjP4k+SeXSk6ZWrWvJiA=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=cZh+ccYoQCCbO9T43Qe6nCXcNkbQ6d8E9vDdIezBbFcP6z3IeiOvaZ/SCLE6EHzOvUrmaWKESjs2vNOzSY8qkeiILPkxrw4+PlBvOIZX7SgA4wu1SmFA+x40+ryXg2JmBKT5cySyRZ+4zx5YM3tv6JeK7Rh7hjfBaL2MK7ysgPP+i0RWkbTSsrIFua0NVjsetkYsglKpFH4L6cUyYG5NckANwlEybF4B2Aeylap6ZkDRotEJIccLu0VVJJEfvoSgkliQVuo6iVt1ZvyspoR5dM7MuuTZfPIs2HK++2VTPPaQtP5lq76g7gF4B42pUHYIzbP+KDQ6/OfqWm29yusv3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=J7MyR4MS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=J7MyR4MS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3NDM1lSFz2yTQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 08:26:10 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c542ffec37so948106585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 15:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747952768; x=1748557568; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yW4BwrWRPMGZw+m/ri6EFRKCjP4k+SeXSk6ZWrWvJiA=;
        b=J7MyR4MSYf6ETspy3gQFWrEthIjZ++teDiPc70VJx0Iw1zSnBpRNxPXWE2urI3jZUJ
         xT8XMcGZgOq/Xio7sI5X6Lz694B8//Givqzs23zwRXqifTifqjpyTnVJKsA7hHhWf0Rj
         iwVxTk97OtJ98Vwd9ghMpESPxBQlM9tX6DAJ+cTApjVKOz1xlvFtjUaHEEiiTdyY8uWK
         xSWE9CAX2Q5J11wsycUt/hq240dy/jxReFumT0pfdPSL16hjMQVgXmuaA9k+RYj1mijx
         02L2X45FyJrfzxLSu4abndlwJNdt+iOYpNr+hf9uJ8oo+irxFxIrFU8Pw9DiFk7Kp5l3
         NI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952768; x=1748557568;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yW4BwrWRPMGZw+m/ri6EFRKCjP4k+SeXSk6ZWrWvJiA=;
        b=Cj6Lk/vGv3O/3w+AuqL0i4OIWgjJKZWtgvMOlcpRs8hZ/jTnnar8b9WId8IIgXgFpf
         MV9haE4UF6JVPv17iYMjf7BNk2ggtIK/gaqW7WCO4mEU1/GVeDA2vbUfw9W9+w9H68fy
         kQ0Gfbl2EnPMBUBqkpx1Y/xjWPg2IyK1f3DqHP217qZdkawzOvkFLsKcrzqWaFBPcFal
         CtXze5AgoROB6V/Aqn4jOVNtfBSPf0j9TSJvUE0ivh49nzxpsPxeQeqgp7RUNQOB/Kzr
         PfA06Fp3ay7cIqKBscekUhnuzWoVHULL63KPx46zZj/ZZ2B0TVylWRKJ5eM+HSNPMOZC
         QKEg==
X-Forwarded-Encrypted: i=1; AJvYcCWuGEmeofU3GbhJ2NUGAJEyjoz/L4CgB5G4fGNEmoP/oE4AQg0GT9kjQpDpvh9cD7TI9XttPmzUqrf2Dgk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7saJ94xNqMlD/qxYHhaW2hrzss4xtvZR8r0qZCuTNTzKsX6aT
	mGfJa5zZgWAs0ZU3u4Z6EdWn+wIi+LWoxXt+iXkZWSpVwwXbGQ4of7WVTt19YVllyg==
X-Gm-Gg: ASbGncs5yd2gwn9mhDMDAST0S86GqsBJtA2gxksXUpMYNX9A9oo1El+/xgyQ33nPuTF
	T2FRqWpP7D7PT6R09U9yDrXqxDDvczRf0zKeC9rtiS11tVrIWOPxDF6hm20uPUmS6CV+4LYIuQ/
	srqbiDyBSGD8LkJEozxZ77FiCVCZ5Jeyd+KlQtQ1ylmvoKGdG/Bf/1wgukorLZaKmL1O5yVyJ7c
	5qQ5s8p+AbDpUGg1Inyr+YWQ1e2u/GQPe2UnEfnC3VzUSosAmUjrIFh+BUA/CJhtY23VPlkrD4P
	i3PHYh0MQzd6tjWGaFiVKuMbxhGCr4vcoD8WFJrLS0dM/izLcvjTLFMhAwprTX5TYvHMGON4q5M
	sHOQy8C2RcsruAkh8EPJg
X-Google-Smtp-Source: AGHT+IHmIlyqjG6e3vdHM+wi0UqPbDaDdVTY/IdBlClNAbyXhci/B2Ul0PB2ozu0sL7+1EWeTaPM2w==
X-Received: by 2002:a05:620a:408e:b0:7ce:d352:668f with SMTP id af79cd13be357-7ced352670emr1334278485a.47.1747952768087;
        Thu, 22 May 2025 15:26:08 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468b69dfsm1089029585a.79.2025.05.22.15.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:26:07 -0700 (PDT)
Date: Thu, 22 May 2025 18:26:07 -0400
Message-ID: <8bf36078ef8f3e884a1d3d8415834680@paul-moore.com>
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
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250522_1740/pstg-lib:20250522_1730/pstg-pwork:20250522_1740
From: Paul Moore <paul@paul-moore.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 3/7] selinux: implement inode_file_[g|s]etattr hooks
References: <20250513-xattrat-syscall-v5-3-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-3-22bb9c6c767f@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On May 13, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
> These hooks are called on inode extended attribute retrieval/change.
> 
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  security/selinux/hooks.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

