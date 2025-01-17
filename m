Return-Path: <linuxppc-dev+bounces-5371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D8A15AED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 02:51:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZfj75BKqz306S;
	Sat, 18 Jan 2025 12:51:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737128687;
	cv=none; b=ZohL76tATtKt3pwgRnTfd2lwlEecb22FgSlqpDkpFPBcf6b7/4G0Aq5r5AMMrT3iNK8EHgE8M6NNf1hHSFBbgp9wWeP31WfgtIgwuHeIvOfsbc/Rg/UfycUH6NlLd4rKG/IcOrMbNj8V2EFBxQdwLAqj3dCo9kLkfB/zQ9VqK7FZlbHvoDvejSI3foF5KQ79/GUYOdvhFFDL8y7Wz3Tk8VV4QzfaAkyzAgENCuRgjLIqYIK9SSxdKyaEGh8zPwYD2RY0PnEAy1ZuRk9iyWi6+AFJhqnKWpoDZdFbkwdVSSba0iT9ZlaLPc7XW2pcvynS+NQVDd3ifUW9cS0KI3bruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737128687; c=relaxed/relaxed;
	bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bD5jcsaV2TCkjNTBQUmmj1J367orHy5o2Y6UIIUxI9Ekd37DbGNyKzLH7EgFtX55pewWZRJD+sEUfOJ/N+0u2GmdJShzPyNThdlHItcPUYI1EbB4n6SCxH0CVynOdSHYMkqUb4naFXfPYxq9MFEkPqGXBjn4I/yGxr+5G60BFW7hhj0MzjCXyMV+dYuf1JZcxyFj5+P9Uh3gS07z9V2/Z21SYWjeZbKzK53aia86ZTkwAORhYc+TinC+bBZM1AUrFwdkaPvG29yRo2S+g5XKapEp9Pf+03KQVnpxlYPasLOAN1B2mjeRj/rqxxcZldVZeqoun1nL0J0+KxlVniyKhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OR+1foBU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=evgsyr@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OR+1foBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=evgsyr@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZPDt5Jshz30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 02:44:45 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso3232359a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737128683; x=1737733483; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
        b=OR+1foBUL9esWiWVZ34a0lJSfdlxFo7yRkLZvABfXroE7CKvJGTjmduEb8nlAt/5gG
         47uY/7kT4T5Sgc/SXqtdU0/LgoCa/Ubm1nijtZyRUvCIh/dIXXwWoNWtpGFnKDjm6VZf
         NYBl63S0K5AXLvV4515KnaVNLoFfamXQfwXmDXWiXxzWs3x5ClBL3gEPSTOARjI2OS5C
         iWzkGsOmeTbQSErj051cosdlw2fzHNUGwIru3rpBr96DUuyuAT9ay+OJn9YozZJZcGfz
         VfWyBEIqEiiaCN9i9mFQ4WXC3yPqedPdmDlXBgnNiZCZ4RZNOKWTHJHtNKrjJvaETsgV
         7Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737128683; x=1737733483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whHgpC9NdP83/YfvPy6m/Zm1/eSoIWGpN2YA1mG9PX0=;
        b=qJP1Iff2F+aOieQSWRJNHKZX9NLHLs/z4FV+UR8XjWFmcDIi77WGrNG9bqGSgvEmet
         86M6CugAxyA7amGHJMY5JrBtQQYx2MDrK7Cr6Qe/ZifkvcWPH3xrKiL6KlSML+SGYwNU
         8yswkIbZXPHIv367Pcc9n3Wj6/VGVY/04pg5KM70Swi30SSPftQ7Kft/SGrghlUq2sS7
         Q8y2DMLWBY573YKsy031+AQxCPuOEzXw9qP3NGP8ibHuu24ZsCGkTLsn0mxwbnwHDC5E
         X6Q/TMy5HEoaIEB5S8uLvYnn/s/gZFIAAdMMwLpXJyhqQC0R3mul5MH1a8g3FHt0+FQ8
         RI+w==
X-Forwarded-Encrypted: i=1; AJvYcCVIeugMgzjUIPTIehRMCt5if74X4pxfRE6fXU3LnFJBkShIh93ASkMhdae8rMsF3f8UujfM/HZYX0pvdUU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyz9j5xrSAzKVpUTq6ykW7R70UVfxh5AEeFCQiDqDb5uoDgPmvV
	u+QvD6ny9yCfFuPCSmK1Cr4hEp+7HoLjxrzfTX8xm5+cwJ2Pa21zwqhDn5yam2Xa4bY/RDTUY37
	mmEYACXSv6n2/ewNqk29bfBtbaLU=
X-Gm-Gg: ASbGncu4odNwflCb+CcCUyXBF0PdOqkqm6Hn9qHlWMlee8/PUM+WyLZUA2UE7po3gMz
	LWW8ogn6xUSe5OgJQHEtComSw/QPwPVITF9Fikw==
X-Google-Smtp-Source: AGHT+IE6c+RDPkVhdYpGhwJjY3swM/Kqbs9TiZQ1EhehCnKjqU+fLUq40RYGPSLu28v4p+m1VfknK3ci2deVkxFc/zo=
X-Received: by 2002:a17:90b:54cb:b0:2ee:df57:b194 with SMTP id
 98e67ed59e1d1-2f782cc011fmr4009658a91.21.1737128683175; Fri, 17 Jan 2025
 07:44:43 -0800 (PST)
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
References: <20250113170925.GA392@strace.io> <20250113171140.GC589@strace.io>
 <Z4hs0X8RhGTuevnn@ghost> <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com>
In-Reply-To: <eecada37-9d0e-4e3c-9b70-fefb990835b2@zytor.com>
From: Eugene Syromyatnikov <evgsyr@gmail.com>
Date: Fri, 17 Jan 2025 16:45:02 +0100
X-Gm-Features: AbW1kvb78AU_0HrrHV0OtjwO2uAvukZ8DnSGASVo_9Ya8_h5NunDjjnSIP4voz8
Message-ID: <CACGkJdtAmtxsPiKYUzLLmfNGf6oJ9YS-25ZY9VvEEWhz37Qx6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] syscall.h: add syscall_set_arguments() and syscall_set_return_value()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>, 
	Mike Frysinger <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, 
	Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 17, 2025 at 2:03=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> I link the concept of this patchset, but *please* make it clear in the
> comments that this does not solve the issue of 64-bit kernel arguments
> on 32-bit systems being ABI specific.

Sorry, but I don't see how this is relevant; each architecture has its
own ABI with its own set of peculiarities, and there's a lot of
(completely unrelated) work needed in order to make an ABI that is
architecture-agnostic.  All this patch set does is provides a
consistent way to manipulate scno and args across architectures;  it
doesn't address the fact that some architectures have mmap2/mmap_pgoff
syscall, or that some have fadvise64_64 in addition to fadvise64, or
the existence of clone2, or socketcall, or ipc; or that some
architectures don't have open or stat;  or that scnos on different
architectures or even different bit-widths within the "same"
architecture are different.

> This isn't unique to this patch in any way; the only way to handle it is
> by keeping track of each ABI.

That's true, but this patch doesn't even try to address that.

--=20
Eugene Syromyatnikov
mailto:evgsyr@gmail.com
xmpp:esyr@jabber.{ru|org}

