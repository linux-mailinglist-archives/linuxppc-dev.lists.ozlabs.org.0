Return-Path: <linuxppc-dev+bounces-12738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE07BC815A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 10:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj3Lj2DXdz3cDN;
	Thu,  9 Oct 2025 19:43:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759999421;
	cv=none; b=YJcRu0xKCzJA5+mk5t6RYYUFx3UUiifRb/HYMZUe/fwOVSX1d3x99XfmtsIA8eXgStkB/foGKdVGyhSs7i+tPJEF4t/X1RO/iFiv0zW33wZ4IJ8xyDP9WDSqQl7M1w2GUl6k541oLk8WS+OvjjUm514WSrBWVRbepnpqbqRfjljZmimIidsYF9mRrK6d/scN8dW+6kako71QuYlb6yCbDPhP9J9ZYUtslH1sS3r5voNEROlmb8/3XAxVMX0MDna6FsxGyTg4VPCbWqrm9ur1W6Jldxy26OIfj8gXb8zdFY7OCe7mv53KJ1lQvuRJRZGI2E4EqtVo4HOFiDLDwiSrag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759999421; c=relaxed/relaxed;
	bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKRWpsi02y1hIwRW1MUjZKiyQ8FhFwX+8AoO4ElozxZ/3Qt93Es0/Gar9DgBfcdZhEGY3krvAHImZ23cl/s+lCX2r+czWwB1DTgy5qzixfoXkKfzZc8A3ORc2s6o8n/9akVj2WbYfXLd+kwfFki3MNFxaryPTWT6gjpajbIvGoqWyi2Pkh3AeXdoYkBw2iDTE2obQj5syIwAAAS7fWBNeQiD0aQH9wZnxks9kBwIPPXjnwL05E3gOeek4Pjy2VR5PbAYwMRZkAsSuyN1ECjWlQ7A8Xbu5NI4UxkTw6gUnw25w2GX43jby2hmYx7T6VGk6EWPCtVCImgpMWqo8MheYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H1OjVXVw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H1OjVXVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj3Lg33ygz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 19:43:38 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71d71bcac45so7656087b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 01:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999416; x=1760604216; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=H1OjVXVwlhEe9phrOhqvIjGkmaPggTXFwC1D72ssHXZnRW9khDC56FgfFPft+ccDnn
         S6IKd0M1SuEDgcE81ffq1HxVmYgMwSIBZpnd3z4mw6kDMdad0OsgoK6BTmGdU00+kDd2
         CYJP03ee7ezAnZhy+8RBibwDcRjNvRc57pcq6D8aCEMTlCFQBKDi2CcC0CAan+TkXHFd
         HFPJkvb3WXPNZ/AdlQc+Aig9wXOCvgIbn4hCe2GsvmQyLLR+StMJb/4CMUZ0omxIM6Hu
         QN0ieuFKdPPfACh2/6+x/u7m61ErNd+pNzBO+li48Kzftm3OfqP7hLLqhZu62XZf2yvO
         SWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999416; x=1760604216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=ej21dQ6nStY3ayJ4MbGy5Qinqgo5PIfdV1WArjkccyY/J/aTTcTeA8jiwajOlVHVoo
         pr3YzcS3Bo7sK8Aj/NEHMFhZz2pKMcpNQAYfDLa6lMHM5u6u17d8FRdn5ssGkS0buffW
         1dO5W/WTeUYE6T4D6UrZ1fdGXOU6sPv4k5imSNbfX12+pcv48c98m5ZwxqGpvUgsqEkq
         lRnKN7zgDrBzQYHoFVIuoeb5CfiLP38pBqRc+mi1tJ9NZiXpQv84xx3uzqXP+Abc8SHm
         FpGp9vpnYwzU+K7/JhLkYcsqeZmR4Bexp80U6S7vnYOCi7c/XKdreA+50FGqwts1p0jH
         KCtg==
X-Forwarded-Encrypted: i=1; AJvYcCUZHsXpP7aG3j3oL8VpTsbZAIXkMgdlp2AQUQTRbjgNzGmmC9aCVxIsQg95nswZmjLUwss/EO56DbqqhC4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YweB1AzSsoY9pifmWzBDtQSDclDQhBjOFPKPUbMUFPnmrUw9fvo
	LItWVBRfmYFQwfqHSxgjOR7big9a24M2bryR8npenzPIuOrSacoP5/zLOn3+oCdkZ8ortd/P10Y
	FamuOqg7nJWmQS7qNRq2Ps4MAz0rEpD8=
X-Gm-Gg: ASbGnct9LX58Db8VQouN2L7VR62zf88dOOC0lmMBRUbkkiktQA2D0dMJsE/8ON5QpTe
	yor0ZkNlI03OzGEeMWknEnO2Uzvqi7a7KjEckFfkVw64T/PyxnPQ/ICxyc6j4fgnPx2MnAYXpBX
	PUvXqUBMONsmSoZnct3IGnpULE47jPeKvC62E4QTOCTM9JdZ+XNKEFnZ2dboJQt6qOAD3v/1KH5
	L/git1jcKPZ4baLlrZ7CUrns+WyvRmIyXZUnt5MGw==
X-Google-Smtp-Source: AGHT+IHqqt7JHMFlL5DEMxX8/4fuWke6o7x715NV65SuEycRYAp5q8y3uA9SPr+Cccah/gPAgRpT2LfWBS7AmxUm0/4=
X-Received: by 2002:a05:690e:146:b0:635:4ece:20a9 with SMTP id
 956f58d0204a3-63ccb91d5e0mr4410660d50.46.1759999415603; Thu, 09 Oct 2025
 01:43:35 -0700 (PDT)
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
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
 <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com> <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
In-Reply-To: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 11:42:59 +0300
X-Gm-Features: AS18NWA7xuLtf9pobQHoPGHI9uL9SjsnEaZg-EuuD52zBO81KbUszIYBPPZ5wRY
Message-ID: <CAPnZJGAp-wG+9wDmmisfpxvFbRtXkG-RipAuZe=fi1BWy-3G-Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 22, 2025 at 5:29=E2=80=AFPM Nicolas Schichan <nschichan@freebox=
.fr> wrote:
> > Then in September 2026 I will fully remove initrd.
>
> Is there a way to find some kind of middle ground here ?

I still plan to fully remove initrd in September 2026.
Maintainers will decide whether they will merge my patchset.
You may try to convince them.

> I can send a patch for that but first I need to sort out my SMTP
> issues from the other day.

If you still have mail issues, consider applying for @linux.dev email,
they are free for Linux devs ( https://linux.dev/ ).

Also, I just tried to test whether your use case is still supported in
mainline (i. e. uncompressed initrd with root=3D/dev/ram0).
It turned out that on modern kernels you need to enable
recently introduced CONFIG_BLK_DEV_WRITE_MOUNTED to
make this work.
So, make sure to enable this when upgrading kernel.

--=20
Askar Safin

