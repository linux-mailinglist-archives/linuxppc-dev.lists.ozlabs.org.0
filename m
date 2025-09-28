Return-Path: <linuxppc-dev+bounces-12596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD77BA6FD5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 13:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZMVr2yC4z3cZ1;
	Sun, 28 Sep 2025 21:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759058852;
	cv=none; b=CWQzvXy9lH7n1NzQrUNa/dUlespR+lIsr7ntkryKvOkvBbGv91+Jf0HC7FYo5QI8+iqbkcqCwUU7hkH1tXz8QtURa5dhxerrsBffYDpM2aUHaZgVjQ21zS5YOaQJvVOX5DCThfDiGAQDGTygO2gU1RQWIfw0MzPn37VKsfFKSSfn5zF4LDFsmd7sSdRFaNVx2u0LUrdNeC0GelQI5Apup9IEs6M4DcCHVTq/YJ9YgzjI1miOZmPCkrNKfefVcbSgB5bcx9X5VBk0boCa4zO+YCr49maOoI10HYH5ZPZyqKcWHUIu+We15De1u3kRSONlR3bfzONsRmAgwdSIgiw/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759058852; c=relaxed/relaxed;
	bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fO+mnYuscW6qltO4lRiWqLaGJMKatKQQk6gPtQDsC3b8FKvojVIqAHxJHy94jziWgF1DNvlc3e5PwQEo21GR7q/lz9TmDIp7Se4a8+QIpqUbYXPHzcHRB8zEONGBPS248bHziA20oYFL76Q18plDjqcS1gZqmN6VhSPhYWd+wyBE079vY9jjUEDeQRr+U9jVGGaFNtTNIv//5yyKGv9HyaoUhzrdgyaenUJWf4rMfjqaR9K6w/TLBPZC7hELfdJL7bs7VgXlTzKKmoN41x1PlGxeyxiOpa0xyPkun6vki1ar3YXZZDue6OUmOZS0Ew006S7C0rl7KsJzeC+Oh8hpNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PvGNX1fh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PvGNX1fh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=linmag7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZMVp51Hpz3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 21:27:29 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso8115846a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 04:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759058844; x=1759663644; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=PvGNX1fhBT/NO5TyPvLV/9ghYrMDE+iUqMIQcsyB1P45IfiRlNR2pnON89vvx4ICpI
         7fXJxo0ShgDV/HHGqkY5/e47/2jQu8GgNVZSGEmlFehhZ8/xULqQkj3pk5RJg0MNsOE/
         kye+YReraoJKPeqyjptCXLDIeYAg2OZ/DQF3fZH0Q14NFXJzPVsARUb796oPG/hTQgUw
         G4+2F7CeykjraQHGdQ7m6GIi9f4o5sbrKomaDytl2kjkuvT/uEU0bM49LxhIcayjZUP8
         gZgOnfmgypj+iUpoagYU1lhMXibIOnIjZqEcNxqgjtoeNUaNYg99hufWvHkmlnT/t0gW
         FODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759058844; x=1759663644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=uOsJ0Vr0EzT37ma+1lfYR52UPR72LPnBbA4aGfcJ5iWR16pyi7Bmr7o9CwGY6P6I7T
         vEFXkgRvhXFSfg5ivmt0ieu2L52yrdgI+8JYsTxr9ilCSalqtjxiGtARMnl+KUJDJdkk
         pqz///dbeot5RZzePedfd8oXtiDH7cQfbNiRXH58mx2xmyQERaXLHhQax+n7XYHLZl+y
         9QDV7jgoNR+N9CF/jxui2N5lwyO+b6ArSTxcZsQ2RKTDBVxpfbhukHM+49U8550LlIb1
         PhjSRK5UCQlt2s9C+1NSeUCmmQyzXAhvdxSvXimDlO+GwkOjZRfD/Z0Q7ndhpEg/oIh+
         touQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0f1Ksns841gJXLrZp6TEr2UBOLpCTEmxDn/Dz9f1D7kGB+lSnHN1phJzg4Vj5f+sn+XmoQ/81MQf0xkA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzgr7+Q5MF0pN91B+/XQYL9xq53gilQ6fWK4EwXNPjExZxAsyGZ
	UeRSM1R+pdgbA5GcEQSQl48S5tQcp8Ih/pOSYVVMgkw7az/kP1bxpR3vbneDl4sXjNxhP6z7HDC
	DfxZHM0hUsOhRlEnES0/WB5/Y/MO0YY4=
X-Gm-Gg: ASbGnctHaXjswftfTdOQ60pVoEsdtJ71YNLpoqxzCY1hco+vuo72aCI+Jcz+CQ3Fzp0
	R+I/z7f564PmGPk3LZ+JPxNnFlYP+q2ofwim/y8Cs2w2+ph3d7In5mHetD3OzfZMvzeZlbyar7p
	tF74qDAwYyDqf+lfOlHhRAhPs6U3ugIogORwUFVeFoScdn9iBFE0vcBoNd3oNx/zkcmtdxmjOgO
	qioAW0akJ5Pbjb/H8o=
X-Google-Smtp-Source: AGHT+IEbmR6jFZWeOZACTqVTuyroT1qollOj9im3bB2gCUN08/YU89k9vFmzDRRbDuqGeOLmGGtFiulh5CESx8Sm0EE=
X-Received: by 2002:a05:6402:44ce:b0:633:ddd4:4e37 with SMTP id
 4fb4d7f45d1cf-634a331587amr9387899a12.13.1759058843815; Sun, 28 Sep 2025
 04:27:23 -0700 (PDT)
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
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com> <20250928105413.GE12165@unreal>
In-Reply-To: <20250928105413.GE12165@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 13:27:12 +0200
X-Gm-Features: AS18NWDQy06zFzFA0Tb4sMvL6G-ftUfrOQ8ZIU-yy9wPAEd2O_xZFFnSMKmSHdI
Message-ID: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Thanks for the effort.
>
> Can you please check the following change instead of reverting the patches?
>

No problem, happy to assist. I think this did the trick! preliminary
testing shows
that this now works on alpha! I guess the offset information in paddr was lost
by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!

I'll keep running the system with some load to make sure there is nothing else
we haven't spotted yet, but so far so good. I'll keep you posted.

Will you be putting out a v2 of this patchset with these updates?

Regards

Magnus Lindholm

