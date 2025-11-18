Return-Path: <linuxppc-dev+bounces-14288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C50C68155
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 08:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9cNq363Lz2xqr;
	Tue, 18 Nov 2025 18:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763452539;
	cv=none; b=evBdpfxu7k3SaqwPlVb6fFCT9bpVSPYpqtNf5sk/D38FwORZiAcBKHAZPQ0WFI+/uZ9upIGlLOl7HSCvtBlkA0VWzMGFa8oYUdry3x78yAGiNRN68utsVoutHYM8r9Z9uwBY8paFlJ1HSf43pNi/ho2rDE2llCnzsgsZUQ8kfN81gR7UQw0XW6BTb+W34PafUfvgbrzxo1ziWwfZo+KKuYrmLznonoxNUYVJxARbEZVj5gjKZfUdm+P2DqtA9EbW6SgCWjufsyrD+KeHd5j6CBeFfk6Ltn3u/kf5+6uE+8uQaTy6oFt8rAaUyQMVffDAWDRfvAuVMr57Y80C14UTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763452539; c=relaxed/relaxed;
	bh=o7/syqaVN3OFRUvQzya5/mq097BnRjYmCSiy+yZAENc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=fw4+m5FvUllxmCUtJUnNfaTIMj8Q+uJK1UX+VAMsXlFpsSdcNrPfpgAXpXLisXc5o98p2DkfZ21I3YvtD7V3KJD3MS6bugFSgRs1DbdLPRVcgh6qHz/CwkuUWzLZ6/Ad5HUOYPxS6BoAyrRca/PcxSYqvIyxDgPNp+xrPdrnnpYuV9B4SBKksMz1uC0Ng+FlezRfosBUApgCg7PqzJjECPL331pd0iJgBpCyP16qQzV2/Dk+b51A1B7V0WjJfpDmaPqceyI/L6IoBpdBCokW2VPURsk0SPlvarDp7q7hml6Edw2grkprNIZWSVljpdn3So0E0gFpN6stbC3wkPMDZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jvyayrEJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jvyayrEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9cNp3p5dz2xQr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 18:55:37 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-298456bb53aso58431195ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 23:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763452535; x=1764057335; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7/syqaVN3OFRUvQzya5/mq097BnRjYmCSiy+yZAENc=;
        b=jvyayrEJa4Fpp1+g/tdXinjQECLI/Qanwc2FoudRHOGPTC5+8rd/d6I4PCSW0kgf/9
         v1sW2RKa5jpHnF6ravD0mc0eXb4iIcIvXViArvelRFLIwPG/kEMf2n20teihZ0eAxzAy
         i32SJCMiKqhDzaUHaAKniDgvxm+Er/AKSzqmHfAVyr5mqqxmtc4/qEUSwlNWqp7Xj5yI
         1/+QOVpwjuPqTFNn4fi3YF/ZJc96BcxMx+SBRNx1XkxShVB2ZVX4LCDvokbvNvuco5po
         /TBkb+oEHhrLdTsQOrXVFP7GO2UBEZirVffci07taQMbh9YScfBRGQpQsYJVF4hgO04X
         lYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452535; x=1764057335;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7/syqaVN3OFRUvQzya5/mq097BnRjYmCSiy+yZAENc=;
        b=RljRdB3lGt0CkJS0VqDu5uFDamvICdKlVPcL3l6F5KoZme40LDXGLy6l1Hwp3fhxn6
         dspKZ7vu2DyH+vmP8c9F05dezJ38LjACrfhoP0J5HgZ8uik1DBQ9j3wRfzCEUSbrjTKA
         uwdA4MwmXYZ4m/x9ETSwtLElrS834c8xBSsZ1nINbjCEdrsPaA7TiqsTAjDroBseyJDt
         ELeG4l+kRCdSvFw2y9N6NLQASD2daxDviRBIbq0rL2TjQA4ttXKpLtWAMJzX1jO+g/Mx
         atiQf/36IaIJou5hIeg6+FOhl3RmSNCg1tbRPKVmZzw/AFwljYCRSb3z5xv09aUbPCrv
         18pw==
X-Forwarded-Encrypted: i=1; AJvYcCXeDyQ4s759Vk54cXVZIUYpK9hlCXbTw9LPIRJc/FAn6QUDd5MOgHUs+XFPtAWzlHHOi5xFTzNW92u4ceA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/SgwVKIEuL+pA4YrW4oWeCcS7cJ2z30ZWaw6OjjBzOEGd/1jt
	7EP4W5UJ4E0a+yghoZ8tmQgsv5qgQncPOEsiQj6YzJmZNQPzkEINlcbsDaqtmw==
X-Gm-Gg: ASbGnctLO5eYqpP86ga5L3B46VOTdUuBFWGr8fjpGOU9HXjuxCxKCVlwuIjZUPaMH33
	GMxM1fLxU7YBs/iCzArf4wX4CgfU05QhUgrOvpDsWNSpIZ70qA4ZTkUMbnitBubf1tZYFz7uyJO
	EvjN9bEzgGBVGFKLoCe6POs9Dry7YWUyGa/Z3hgA8NLmSoGQ5B8+6Te8GnRhB4JAPvS3ERx7uVN
	F+G2XNyCy7Kc4aBoFegqkPHoZfERvO86JCFR2BcgF4cMSa+KBvCzlVmvQUFabHYpp8tCyLc2ilg
	LP9eJIrWdGqihOHAOOM9J6aH2cTkXG0gFPA+WQki1GDhnDDFLcgAtAGvHpYTrqG0KQaDamB0tHe
	jQB8vb1hw5KqxhIgzdWHcWuugo7L2JLScZ/uzdndUG6b4dzylQQ1+y3c7oWjSOGhUAToDiF4j2W
	NLkg==
X-Google-Smtp-Source: AGHT+IGIAchNoEHFNNrUZtM+TDOe+4ACVDLvPqJloOk/sC0eRCbgmSifY6wNhf27PIzrHEaASBfebw==
X-Received: by 2002:a17:903:904:b0:295:2276:6704 with SMTP id d9443c01a7336-2986a76821bmr154935035ad.51.1763452535158;
        Mon, 17 Nov 2025 23:55:35 -0800 (PST)
Received: from dw-tp ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm764612a91.3.2025.11.17.23.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:55:34 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Misbah Anjum N <misanjum@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Subject: Re: [REGRESSION] [next-20251117] ppc64le: WARNING in vmalloc_fix_flags with __GFP_ACCOUNT in BPF/seccomp path
In-Reply-To: <dbe42ce9543dbc3af95f95d6a6d9540b@linux.ibm.com>
Date: Tue, 18 Nov 2025 13:21:24 +0530
Message-ID: <87bjkz3hj7.ritesh.list@gmail.com>
References: <dbe42ce9543dbc3af95f95d6a6d9540b@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Misbah Anjum N <misanjum@linux.ibm.com> writes:

> Hi,
>
> I'm reporting a regression in linux-next that was introduced between 
> 20251114 and 20251117.
>
> Regression Info:
> - Working: 6.18.0-rc5-next-20251114
> - Broken: 6.18.0-rc6-next-20251117
>
> Environment:
> - IBM Power11 pSeries (ppc64le)
> - Fedora43 Distro
>
> Issue:
> WARNING: mm/vmalloc.c:3937 at vmalloc_fix_flags+0x6c/0xa0
> "Unexpected gfp: 0x400000 (__GFP_ACCOUNT). Fixing up to gfp: 0xdc0 
> (GFP_KERNEL|__GFP_ZERO). Fix your code!"
>
> Call Trace:
> [  523.921345] Unexpected gfp: 0x400000 (__GFP_ACCOUNT). Fixing up to 
> gfp: 0xdc0 (GFP_KERNEL|__GFP_ZERO). Fix your code!
> [  523.921356] WARNING: mm/vmalloc.c:3937 at 
> vmalloc_fix_flags+0x6c/0xa0, CPU#69: (ostnamed)/6500

This was reported here too - 
https://lore.kernel.org/all/69158bb1.a70a0220.3124cb.001e.GAE@google.com/


Looks like it should be fixed with v3, which was posted just
yesterday... 
https://lore.kernel.org/all/20251117173530.43293-2-vishal.moola@gmail.com/

So, I guess, latest linux-next should not show this warning on ppc64le either.

-ritesh

