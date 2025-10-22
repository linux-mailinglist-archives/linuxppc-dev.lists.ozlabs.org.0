Return-Path: <linuxppc-dev+bounces-13164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35386BFC04A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 15:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs8ZJ1Vcpz2yhX;
	Thu, 23 Oct 2025 00:06:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761138408;
	cv=none; b=R1IZgWfttL5E5accu0q1YFh/aTaU7fnf1DhyWeO0DJya4CUb/c3bKA0x8o+n23/M/yw2TvzB9VaTuu6cuPvJrmYwzMJuPVMWYB5a/1Wx7TlMN44dsXOJ3Mvu+pjnLXFtxT5zDJZafzLu31MLcW6VbrRIpQGsMdeL5wFu8Dm/gKEPVPWmepbTh7Ph+6uK8tzPuRiYwIugGMy4jBCSMs2Hf4IBoPeEflaYJaMEBRID5Tcxek6y1XnSertZVBynZ8SXuMpjcXkgH2vd2/Ep1TJm19pFUitucJUVsXjn3BXQcTgM8KJuuNddKRxDLqu+znsZNKycNV0ftxd1WGOZ+dR7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761138408; c=relaxed/relaxed;
	bh=/A8ZPFmWvxEQpR9qb9R3Mc0l75eRlQJgZk9qTn2p9t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpCQbnuwHjt1nd5Vx1XLw850XStxPTMCWrZC6kg2uRRhHk/tYWQev5Yt0Eb1edVDeRaISltRnDhx/JC6Bj3X/SusK5aIT9Exs9n3DPU/SiqzdWpZu6yMIpHOQgrZ7GKKi9CA/hFit3ZnTaDes1tb0KjFRlhMKFi13OoK4ZT9ZAAXF4c2ZWkr0dqa1MLMn9w73qUvcOOrkimMJLcWbRayH8S3xVqpkjJf1i5zJ8QL1HAu3jPXP7B2My/aTx4kn2Gv4pakSsvVYD+jTxL15wMHxiQsmylQf77tLYXIJnhHxjBy2NJurZdNNnJ3kv342+fH8nnrVGdegnGSpVDNF0hyZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TczHmxA8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TczHmxA8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs8ZF5dPTz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 00:06:44 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso35769345e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 06:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761138400; x=1761743200; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/A8ZPFmWvxEQpR9qb9R3Mc0l75eRlQJgZk9qTn2p9t0=;
        b=TczHmxA8lJlg00MMAzZjroqyoRR5KTdf38+oVzNmW/MybQJ/qKZKfgND4dS/eCDNnB
         CMk/hZv7MN0QuiURC4YNXOmXJ/FjXjYqQOU9fUO7pHgBIYmGhXaw36W8eSy2gmwLdGyG
         EglDzv7lIRYCh1V04e18Wpyq6OyfrZq8hJJm6EY5lYEFfhHD0/sBqJh+uQEoygFVIMuD
         5NKtX9Pv9NG4Wm2l6gy1BWGlMZSHhvA6wpjtq1vZwIPLcQcMDc3hqcAHuztJ6dkRviLr
         t0cKfhsHRGuloPBCwjVcd/FwCjdbamqV3WSgYAkZetZtOPtzMgkBAQEjantajLniU+a/
         di2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138400; x=1761743200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A8ZPFmWvxEQpR9qb9R3Mc0l75eRlQJgZk9qTn2p9t0=;
        b=QgS2u1aHvcBGKPz99Yu70e0QS8Wcg3PoJ17TEeZINmXxcoenDeJwyGETwxrfFyPw+u
         4txPz4pgIR9PooY058yeKIBs4Qg3tDwLOZGtGqDl48YI3hq9TNIIIAKTk+MZ3fzolmAI
         DJ2IBXIZ4RNZofRnxSL7HouDd5/4FzKJ1bODEWm3Txo+ChFwMZQpDn7coX7GVOBxhHNq
         1eMyMahPw90pft0cgc0iN1SGWEukKM0r3ZZpjbUq0WSAMQ8fmOpoKxUfWpUGfukSspeG
         3ozz7qp5paCw7xykVbdtZkCKOu/R02XWwTB1gr20DVEjtl4hLWnidV9676LAiCZkDcpf
         06TA==
X-Forwarded-Encrypted: i=1; AJvYcCXBUxysa5kkZfTqbIs122BhbxJo3xSkKOLn//cWsfHjX7wglKElYtzDMnUXjYgBJ2DqaPjvE9Ds10+52QM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGm8WeiZTy0bk2nqndLxHauMoEg2FgVJ2xNHRNk8bajqCOt4QI
	FqMaRSG3hV+LX4usGcZbO1tCw2EyQ5psXd8rDeIoTLn/QYIHD6EJPFVpLtDD244uayY=
X-Gm-Gg: ASbGncutSMkvZtJ8YseAWBaCmbfghVDb4FbEzD0AyT2ZF3f+E8dQsWjdCl0bDt4Rmf5
	zC+/Gubnf34u03uz86bhKsgn3iEKCjXlPCvLOXaDpAOkyvVJ7DUBWf2ntofVbwBVz44U2Y8tegl
	EQr3ImE4rpgth9sSmji7cOIUdgS5fUtvucglPmFwFeQT3yia8eqVTmNXXMIzBbTdUNCxR/tFc3B
	mCX8crC7FNxMKy2hIBFYKVM4K47qBNAawO5DMXZNaUUkHSvDQXZt6X3xhEQQwqYzWCKh546vUtu
	HJ4xtGR07YvmkIaVbQ5uSgOh0jAeV/EESQc9rZ5rSqkE48TxSKCdn2zP/JX/q9Sy9Ep9VeAhaaV
	mczBXH/MlZItzfVKJIFKqLiVjCoE5wNxuQwGJQQ8snQVf1fNqwnJAYbDrdaRBfExZ7wlehUR4Ct
	SgfXA=
X-Google-Smtp-Source: AGHT+IEIuWodjd6E5M+XsTe/qj5t8SOFXrOcY96wnD76MT7O2+fL+fCFN6cbmJY/HzEaJJ52K3c82Q==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr172995245e9.30.1761138399653;
        Wed, 22 Oct 2025 06:06:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f685sm44820495e9.2.2025.10.22.06.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:06:38 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:06:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>, joe.lawrence@redhat.com,
	Naveen N Rao <naveen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, jpoimboe@kernel.org
Subject: Re: [next-20251022] Kernel Boot Warnings at
 arch/powerpc/kernel/trace/ftrace.c:234
Message-ID: <aPjW3P2AU7L71S-s@pathway.suse.cz>
References: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
 <cdf7c458-b28f-4657-8708-1f820369baa6@linux.ibm.com>
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
In-Reply-To: <cdf7c458-b28f-4657-8708-1f820369baa6@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed 2025-10-22 17:36:18, Venkat Rao Bagalkote wrote:
> 
> On 22/10/25 1:52 pm, Venkat Rao Bagalkote wrote:
> > Greetings!!!
> > 
> > 
> > IBM CI has reported kernel boot warnings with next-20251022 kernel. I
> > see there are couple of warnings hit and eventually system boots to
> > emergency mode.
> > 
> > 
> With the identified first bad commit, is casuing the kernel to boot to
> emergency mode. I reverted the bad commit and built the kernel, then kernel
> is booting fine, but with boot warnings.

I guess that it is the same problem which should get fixed by the patch
https://lore.kernel.org/r/e52ee3edf32874da645a9e037a7d77c69893a22a.1760982784.git.jpoimboe@kernel.org

Best Regards,
Petr

