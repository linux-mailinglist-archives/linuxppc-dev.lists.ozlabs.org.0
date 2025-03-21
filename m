Return-Path: <linuxppc-dev+bounces-7268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A47A6BEFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 17:03:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK6gw1zCKz30QJ;
	Sat, 22 Mar 2025 03:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742573036;
	cv=none; b=iirzFgxok8kDFMjn3+zoOeEMzkQ8bzwLWlgKgU95gToCxIUjjQHBxzBGiuHM/I2Y4F2wCoDDTWC0JbWAmcIpON8H5F85Ao3Py3mqtfd23cXanylS0mRoY1o7aWrl5RLZCLo/5FhNBhiZiheoq5hOOP/drL3d5MZ5njAWQAVwGum3NoF4hpwolMB791H8crG+WWT4SV03JfAxDvJ89A39/CheW9/QGIoUTfbdPFdDL3Mcl0Hm93/wcAARrIt91v8GW2q40ZUirr6xh7/flkFc+Bkx3sU8SAiYVtAKx6vkeEx61+ZnAnxyKocSkqHYES3JZMyCnA5KHSzOocdgC8fhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742573036; c=relaxed/relaxed;
	bh=YeJPwSaX6HIdUR8KTOVsZ8Feg++HqdiUbFfhCHyoTMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBNUR/rNYJr0oRWkfljEkR8LuTH+RObiv8SPeXn6KtWr2Iwg/1W6GtcVeZiOEIBr8/9speOd0ZzfWHmhQVxYjjp4yCAvzYp68WhtE8Yo1yn4jwguix9UCv2WTl/4zs3IjntEPgdwFUrmzUX/5FPFBqW7tmvTnw7d52R4n2A63SR/6HWPPjSacpXycaT4UTi73jhQSRS5EsW7d48kszFv/C0aLmplu2R+iTtT0A4RQtpn6Ji06MN/Lit2cyLBD287irs1v984j/L8Cm2ncP8QzktpIWatp8HS5BsXUp1r5HszcR6An/49X/40N+VshNsbUtStKpsKN/5RnYvMfuqZ6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UOcAqwOW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UOcAqwOW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK6gt6Vdrz301v
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 03:03:54 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-47681dba807so240841cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742573031; x=1743177831; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeJPwSaX6HIdUR8KTOVsZ8Feg++HqdiUbFfhCHyoTMI=;
        b=UOcAqwOWwcOUGk4nMUMKrVP2OP+zJwmtDQso4Q3p0u6dOQb+WEZj7ViPz59v1rLMLX
         Fr8mVMkGtGRzqHEHvn68gJHh6k1P7bkTtmWmDyOyZMWH3MCDzRxzyUEm6VnmHp1e3UJ6
         eEl+ssUNknuJpSxtBUfWMi9EmGMVFfktno0A8EcQ01aU49cCqxdfXERgDtDh4YCVDiiV
         30bHdyF4vEZHpq1cssvOWv6eJsgor0eVgRgKrXkcgIZGFuPyJJ5SDjirzxJNf1yPXg4O
         LH+ThwHqMXQlKIxQA/9F99HsjytR0kTdg3ObKG61i7ltYnHtd4Ll4dwC3mWEqD2MmJLy
         4e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573031; x=1743177831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeJPwSaX6HIdUR8KTOVsZ8Feg++HqdiUbFfhCHyoTMI=;
        b=E0tN0+36ZztZl0AgBZ81jo8Sk4vhIsz/6p/pWZqKdv/FjK6DSXQpweViepfsoadUlX
         Lb4gLgWw1WjY+SbiSF8iT0RF1wX6NO9KZ8Nxgvc3URqAlkeuibDeOojAoXnpcMJsfuw0
         PvP5ZrXmjz95LtW6Y9tjhdcVfy6T2dwrnkiCCTggJiWAcAlMcqX4+8oIWmBUnZ2K4tZW
         EXvdMiIWoTt+rEydS0Xnc03xm2y0BCo1v8/0e3P/wzrQ8zPmiPSOFS10nb5IL0SO9VFK
         TspvFIa1gJUq8KSYK9SE4kxeX582sl2oKyQSPCoN4iewPehm6Hx0yXL74NE7TpWGeYFg
         pRgw==
X-Forwarded-Encrypted: i=1; AJvYcCX16+VtKOuPrgtT0SzdABoKnnFOh6y5yLUBdQUcr9qtO0JugRID4gdHhkZBT6BSzRMGibi98yjDpX1CYr8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz11BJ/tf4BEbJLc0To2shj5gfewx7pZmOZ3obfTzZ5/7pr+zjb
	VahgAmHeDarFctf49a65I+zBaxX0/RwdR8D2cAi+zXr8BHVn2tuiUZJE+IS4G4JmPh27TnVbakL
	Yz0abf3KSje8r3I048za3lDT+t8wl8Dj+41rK
X-Gm-Gg: ASbGncsY3qcIyBeYEyios0MXTeNaxX+8+FS0OWCNjIsz+4yyRjufRSeFKpx25bWndzw
	T47bHz+CQkfplzTi6Kn7y3r3ro2Msv53X1Wgu0zw3MYhogXzdtCtE6yYB4pSowz0BF9clUoikN1
	1zjwJUybWeNPT+FZBld3nXVDOQxA==
X-Google-Smtp-Source: AGHT+IFkXczES/4I5kcNrRXzjxrEN1n1yI01ly+4cs5jHTsrsjRGc5j6UaG3BY/6xhutMfdEGFSNPo3rGZczVOmOkmw=
X-Received: by 2002:a05:622a:1f17:b0:466:8887:6751 with SMTP id
 d75a77b69052e-4771f55786emr3998701cf.23.1742573030713; Fri, 21 Mar 2025
 09:03:50 -0700 (PDT)
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
References: <20250320173931.1583800-1-surenb@google.com> <20250320173931.1583800-2-surenb@google.com>
 <Z9z1lC9ppphUhDjk@infradead.org>
In-Reply-To: <Z9z1lC9ppphUhDjk@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 21 Mar 2025 09:03:37 -0700
X-Gm-Features: AQ5f1JrBg768vc8VQCwRG29x43voyrYWFfgAzMuHmylUPx3zi7H160snG2PZn8A
Message-ID: <CAJuCfpG9apLCrF0DXjzVtCJoPAa=5BLxArHC6SCKkfPNdpZ1wg@mail.gmail.com>
Subject: Re: [RFC 1/3] mm: implement cleancache
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com, 
	vbabka@suse.cz, lorenzo.stoakes@oracle.com, liam.howlett@oracle.com, 
	alexandru.elisei@arm.com, peterx@redhat.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com, 
	mina86@mina86.com, axboe@kernel.dk, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz, hbathini@linux.ibm.com, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, aneesh.kumar@kernel.org, 
	bhelgaas@google.com, sj@kernel.org, fvdl@google.com, ziy@nvidia.com, 
	yuzhao@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 20, 2025 at 10:14=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Thu, Mar 20, 2025 at 10:39:29AM -0700, Suren Baghdasaryan wrote:
> > Cleancache can be thought of as a page-granularity victim cache for cle=
an
>
> Please implement your semantics directly instea of with a single user
> abstraction.  If we ever need an abstraction we can add it once we have
> multiple consumers and know what they need.

If after the conference no other users emerge I will fold it into
GCMA. That's quite easy to do.
Thanks,
Suren.

>

