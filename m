Return-Path: <linuxppc-dev+bounces-14558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E461C99818
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 00:03:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKzw65LlXz30VL;
	Tue, 02 Dec 2025 10:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764630117;
	cv=none; b=RuAIK799GBHYj8ST++HUTKrFqX8AcAR8XQFwdB7iRIg4BflXm9szUmpAteklBrMuygiXB0t5lcymFxcmjI8MCqeJmworLpqYAKnAN+T4v+kbCmhauy/aGG3YWryUDFiVqCcUXiffSCzm0XGoqaagM8PZnCToeweFeLgYf8UVb/sGdhtFUM5SPQCXhAsDcRSWgkTqIwy+ZB4kOQVilAFaPS3zdDVA+TNCLxx7iCJsrONMSoB6lNY9E1fOVm8E7ABAwn/LeuitRImTSAKQ1tyUS1bjMfk+0RLIIY8AB2WNALDQfBZ1lL6sc3yEAw3MCEJHsFhSAR7FggzKr+mZjSBEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764630117; c=relaxed/relaxed;
	bh=0FM9m6+shkrVZWHZFI/zkz3EgwkEbfSOBAx27RgqiH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llVvp/ZA7+K7wyME5vE/AsOFblUZKD1sCr52cBlx89W949lOC8RbysBdVwdhQEVlgRmBw/oEVF2T/Rj28oxY0ZkP0lrqypmtU2PqLxeoPWz6r71+ILtQ81+T1O9TTHvvbE0CkYrm01hCNXU5Z2ITSp540rqLnrVhemrPLvLHwDkkF+HjcZP/wUOQLmIyhF+wYpLc+vLTdToDrceSVW1CBOA7rcOA9GZ8hVWKN5xvJrgXmMSpy2ntNqf/A3cvoGSOjc3IkJ4uU+27gbaCxBvw9NZFrptfv3yKv/tGrxvArdmAqNNmxoCc+F/6AJnlBq3KM/rq4Yo+hocxSHniy8tYeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gourry.net; dkim=pass (2048-bit key; unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZGkFi414; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=gourry@gourry.net; receiver=lists.ozlabs.org) smtp.mailfrom=gourry.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ZGkFi414;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gourry.net (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=gourry@gourry.net; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKztW4h4cz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Dec 2025 10:01:54 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so1982098137.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Dec 2025 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764630112; x=1765234912; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FM9m6+shkrVZWHZFI/zkz3EgwkEbfSOBAx27RgqiH4=;
        b=ZGkFi414XdTJc01ICxGavdc940+HllkL1z0qGKICp+T2tApueQ0+6BQNbVyYiyMPUh
         ykmwsGBx/Tpgg4l/kRaaVTYjZyab8ncvyoVPakxdqg3N0wM3Iuf5yGsFk+AO/ui0KUgP
         6tTM8sbNdyTsPTKOradw2skmSUzoeELkv/XQRDxFnhElj7to1Adi8/jOICG9ik/tXe9O
         yMzzyPywS/7Q/zfWs6tKMcgjYHTlcqMPoN3w3jKXqaZjfPERk09TjzhJcG6eIaSuFqup
         0DCPJxN/UIJWEXT0IA+A++N68+1QlERuUJi6UknOtiX2SF0hlKKGi838PSZVQYHB9tiY
         qGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764630112; x=1765234912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FM9m6+shkrVZWHZFI/zkz3EgwkEbfSOBAx27RgqiH4=;
        b=M5230xgFPmqx8cWoc5cYWCGu509+Ra/pdnkdjCiUlf/GdcAJKWCmklQnh9GcPKvfc9
         8vCKbm3vZB+rHiQMZiMY7BBLmg2TPZUARlYWT1vvA33B0vxotuIv47vbC6pEKyQoLWjy
         9OVjol4Kh71GV27NDCrETT+I/KNtBF1VgOY3tsnLajaze6/Sl3wMe+eKZQ5rUkqJSxLB
         r95gqj0+ReQVvXFdCjmUIsluBzE/Wpja2kQPJiekjn3lvsBVe0NpvrWoYLo0zSG0JlgD
         LFYz5b033+GDhZ0Pb0dKCgkD25aTn0GhokX2m532IN+c5Dg7p0u4RwI/vKooCuzYhGKf
         iUcg==
X-Forwarded-Encrypted: i=1; AJvYcCUPGQGvj6+Bz8WPGcQNyDK3gTXW78Hn9O0Xp2AxqIcV4nZQ4Tph0knbqtv9+DZdYUyLTHCVYQiY4ydm98Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyhbeo2K/jvbtrIsS9bMX0ShO3+C0YKdUHft/7zcv8/qsnq+2FK
	rSFsL+hUqVKM8c9i34sGtFIxTnEUTp6sJCe5AwAfit94KYM1I99sFYgqRFZEOFk0xDc=
X-Gm-Gg: ASbGncvgqrV5PG0NhleFl09rnDK0J80mP8bf8kDovHIH8YU2t/x2v2boSlBXaIjiebE
	4k1j2bXJQfmj4N0Xrw+3BCDij/QIR9gAp1zII4VH3ugR2XKrxC8XIsCqE1vxwJZMTAS4yEbG6tQ
	kw8+JOKQuIt9/6A7oiml84qfcrTldL4+gV7cBVnTegDBiD22mlhpLtxU3blKEf8iZRONQ9dihIL
	a6Z7u3nfFudNiMufBESu0aKRw85opwEmNBeyt1cf+jRJQt4FRweZdAc+art7cDyvw9t32e9QRux
	Oz5bwnB7+sX4RGXoWM+x19U/nneqAgvpcDDnA5xsGjz2vj8iu30X6mMepDTcFFetFVVlA7XpzW4
	VlCj7fSV22gEvhat8dzFrvdJ7mguUOiyxyu8OA5EpA15MxYUsCqot1dDqE619/XXQ3vOfm+nLAQ
	HPPq4bLop9QXVD1owexPF3lpU1kXffw1huHxtJC6g95ns/j5Wvs7fq5AzxBwxMGKrE9NqQzQ==
X-Google-Smtp-Source: AGHT+IEX0yBdvL/OGp8i/pkCfIknydHVdNWVez8S7zvu1JZCPMc53SdulfUUjHQjqfE/lSQ1WK7jBw==
X-Received: by 2002:a05:6102:918:b0:5dd:b317:b433 with SMTP id ada2fe7eead31-5e1de0ed47bmr14385931137.9.1764630107354;
        Mon, 01 Dec 2025 15:01:47 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b90ebasm91346316d6.55.2025.12.01.15.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 15:01:46 -0800 (PST)
Date: Mon, 1 Dec 2025 18:01:45 -0500
From: Gregory Price <gourry@gourry.net>
To: balbirs@nvidia.com
Cc: linux-kernel@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Bert Karwatzki <spasswolf@web.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] arch/x86: memory_hotplug, do not bump up max_pfn for
 device private pages
Message-ID: <aS4eWZ-d4tyjVzul@gourry-fedora-PF4VCD3F>
References: <20250401000752.249348-1-balbirs@nvidia.com>
 <692e1297e3b6_261c110064@dwillia2-mobl4.notmuch>
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
In-Reply-To: <692e1297e3b6_261c110064@dwillia2-mobl4.notmuch>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 01, 2025 at 02:11:35PM -0800, dan.j.williams@intel.com wrote:
> [ add Gregory and linux-mm ]
> 
> [ full context for new Cc: ]
> Balbir Singh wrote:
> > Commit 7ffb791423c7 ("x86/kaslr: Reduce KASLR entropy on most x86 systems")
> > exposed a bug with nokaslr and zone device
> > interaction, as seen on a system with an AMD iGPU and dGPU (see [1]).
> > The root cause of the issue is that, the gpu driver registers a zone
                                         ^^^^^^^^^^^^^^ which one, iGPU
					 or dGPU? or they managed by the
					 same driver?

					 (sorry, stickler for vagueness)

> > Fix this by not bumping up max_pfn on x86 systems, when pgmap is passed
> > into add_pages(). The presence of pgmap is used to determine if device
> > private memory is being added via add_pages().
> >

Concur with Dan's take below here, please check for DEVICE_PRIVATE so as
not to affect DEVICE_COHERENT.  Or if there's a reason to affect
DEVICE_COHERENT, please explain here.

> > arch/powerpc is also impacted by this bug, this patch does not fix
> > the issue for powerpc.
> > 
> > I've left powerpc out of this regression change due to the time required
> > to setup and test via qemu. I wanted to address the regression quickly
> >

At least +Cc ppc folks to take a look?
+Cc: linux-ppc-dev

> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 0e4270e20fad..4cc8175f9ffd 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -989,7 +989,7 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>  	 * addressable memory can force device drivers to use bounce buffers
>  	 * and impact their performance negatively:
>  	 */
> -	if (!params->pgmap)
> +	if (!params->pgmap || params->pgmap->type != MEMORY_DEVICE_PRIVATE)
>  		/* update max_pfn, max_low_pfn and high_memory */
>  		update_end_of_memory_vars(start_pfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
>  

This looks better to me.

~Gregory

