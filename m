Return-Path: <linuxppc-dev+bounces-909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA43969788
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 10:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyfLy2PYHz2yK9;
	Tue,  3 Sep 2024 18:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725353082;
	cv=none; b=X2d/d5LqINkKg1bYu/MRVYM0CU4zN7zp3ziNJ+3zzNGZpvjsQPBu/amsd4T0p+0El/KpnGgker4JFy3jpuY7nFjXZSEfO//fpqoVpBis+fknG1UcxyXvC0O55PoDQGCucXfnb7focRjcu17pnu+BsHvBORKCeMBqNEnTUCDaVvMWvjboCzxG1ZyzOvoe/3k9jWQEnRI3tPKYTbn70iccz6OMH6IN/Yx4HhHHGmExb7BI/9M5qJHQizR8uePiqJ6lM1IsBo5aRSxhebpM4t3bu86R8aNFEbL8uTk3izSlYkMVDWEaYsD4YBhSnFeFsPPjlTp0ZBYIJ9rphMVvivLzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725353082; c=relaxed/relaxed;
	bh=DZlZAQzsLSUE2kbM2Ozq+ZCTE7DVngzemuZ7Ob/TXXo=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=L9lLuro0kfF9rCtCAmyi2Fu1L2i2+SdkavUqvqyrw4uO9NaEuqleqtoz6l0YCbLLs5REQYV4jeqQrJ0+SHXZGgNtD+pX3FqUyDG5o7QKAtGxpUFGw3oVFoST8Ki1iNHTCpyoIYPQN2P+zMmgFL8BtjW6HrYWcOJ3jqZ82UoDpW59IcJwspEZx+J1mU+ypRD5XsKfAVaNp8vDA+PYiCRM1Txy7DIkHgwVlQe4LrAKwZej0Qtnyo7zSCMrVi9EZMCW/Izik4MxuCSmeKdPpHCee+uHQdGFFCRzZKyY/cVfemPIO/rXMJc2lBpfmI6a7nG20EeTjEGF1TycQvtfMxLToA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WIfFLGkr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WIfFLGkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyfLx33Dnz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 18:44:40 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a868831216cso577885966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725353074; x=1725957874; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZlZAQzsLSUE2kbM2Ozq+ZCTE7DVngzemuZ7Ob/TXXo=;
        b=WIfFLGkrIRK9FVm+DspQT/d7/8pRhq0HZBFVlsCXrKIyxvkXCSPeCg9fm+0ioQ4b9c
         PczRNdcju+06cbmDWnkkCTVy+XoCjfRNb+F8exA0Lb6caBS5MBz2LWEvdO8/0sd+tZEp
         avW35a/MCL6l/jfjEoZhVp92a1+GmGUwgTAkU8Hd13sDoAGvHxU8QtQQOqPQxTCJMUmB
         vphV+E7/R6+97ill4GrCshvz5w4yDSGQ5358I8xH9PMZ6OHvyr0X9Cflj3B8xvnEIfdt
         zdG46Y2Jbw1SYAC3agscrArJ9ELylrpjPPNdcHTR5akJLb9THghjFMwM0lMm/sVnhs9I
         H/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725353074; x=1725957874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZlZAQzsLSUE2kbM2Ozq+ZCTE7DVngzemuZ7Ob/TXXo=;
        b=fWZ3bgrWXNbiYdvv5vjHTvgGsHeSfMzqBLh7k3a+2G2geE0g5mSmK2sVDDbrVwXTvv
         IzGv1bYKBcK9/i2HmhMv48xNRnAtR3HARUaCDag+0QeXqO4ocbu6Nal574a1vjiosB8B
         lFCQMi9iiBFyuP/b9XbQSAiWnp7HZ+LxKzHOFYE9Fb4g4sUXPWV4rUJnzRFfMXUL98cD
         9t3kVBG1/8KAMVOSbppe/lmX/zZ3K/vQgNyibGl59daQmSR6/wDzkPNW+KLf5Osg/wpV
         E23BPjklyI798Nh4ETJiqmgevXI+FptqZP+yDInffDmQh7apEw94oHaTCj10kIaTaI5z
         kkOg==
X-Forwarded-Encrypted: i=1; AJvYcCWVebp0RE9swVzyIG/w7539xLcBuyMNxj1fm0FG/ON7s8j3oNnu92PHmItncbjl0HZmdEy2tOBGWzwca/4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysYVQKqYNBIMEBag0/gbgqDjWFm8R86NQ9yl3IqoBR3z5Ljt2L
	KM7Hwz35hqrDmIIhg9uNXSZEhnVyJn7e1UOKCsU8EwjgS1WvR1uOs8A/zZpdOeo=
X-Google-Smtp-Source: AGHT+IHxwo9IPQ3UzoYFwfDhkPsGqhCSjCzcHlJOoBuRWzF1gLxd2R9P128YTojI0aYfG8i4cNsStA==
X-Received: by 2002:a17:907:2cc3:b0:a86:9058:c01b with SMTP id a640c23a62f3a-a89b9729542mr798530966b.65.1725353073684;
        Tue, 03 Sep 2024 01:44:33 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989221e15sm653868266b.193.2024.09.03.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 01:44:33 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:44:32 +0200
From: Michal Hocko <mhocko@suse.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <ZtbMcN3vK-Ih1gpN@tiehlicka>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <ZtAxwJFH_hAh1BPG@tiehlicka>
 <ZtCw4vgonbJzV1xs@ghost>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtCw4vgonbJzV1xs@ghost>

On Thu 29-08-24 10:33:22, Charlie Jenkins wrote:
> On Thu, Aug 29, 2024 at 10:30:56AM +0200, Michal Hocko wrote:
> > On Thu 29-08-24 00:15:57, Charlie Jenkins wrote:
> > > Some applications rely on placing data in free bits addresses allocated
> > > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > > address returned by mmap to be less than the 48-bit address space,
> > > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > > for the kernel address space).
> > > 
> > > The riscv architecture needs a way to similarly restrict the virtual
> > > address space. On the riscv port of OpenJDK an error is thrown if
> > > attempted to run on the 57-bit address space, called sv57 [1].  golang
> > > has a comment that sv57 support is not complete, but there are some
> > > workarounds to get it to mostly work [2].
> > > 
> > > These applications work on x86 because x86 does an implicit 47-bit
> > > restriction of mmap() address that contain a hint address that is less
> > > than 48 bits.
> > > 
> > > Instead of implicitly restricting the address space on riscv (or any
> > > current/future architecture), a flag would allow users to opt-in to this
> > > behavior rather than opt-out as is done on other architectures. This is
> > > desirable because it is a small class of applications that do pointer
> > > masking.
> > 
> > IIRC this has been discussed at length when 5-level page tables support
> > has been proposed for x86. Sorry I do not have a link handy but lore
> > should help you. Linus was not really convinced and in the end vetoed it
> > and prefer that those few applications that benefit from greater address
> > space would do that explicitly than other way around.
> 
> I believe I found the conversation you were referring to. Ingo Molnar
> recommended a flag similar to what I have proposed [1]. Catalin
> recommended to make 52-bit opt-in on arm64 [2]. Dave Hansen brought up
> MPX [3].
> 
> However these conversations are tangential to what I am proposing. arm64
> and x86 decided to have the default address space be 48 bits. However
> this was done on a per-architecture basis with no way for applications
> to have guarantees between architectures. Even this behavior to restrict
> to 48 bits does not even appear in the man pages, so would require
> reading the kernel source code to understand that this feature is
> available. Then to opt-in to larger address spaces, applications have to
> know to provide a hint address that is greater than 47 bits, mmap() will
> then return an address that contains up to 56 bits on x86 and 52 bits on
> arm64. This difference of 4 bits causes inconsistency and is part of the
> problem I am trying to solve with this flag.

Yes, I guess I do understand where you are heading. Our existing model
assumes that anybody requiring more address space know what they are
doing and deal with the reality. This is the way Linus has pushed this
and I am not really convinced it is the right way TBH. On the other hand
it is true that this allows a safe(r) transition to larger address
spaces.

> I am not proposing to change x86 and arm64 away from using their opt-out
> feature, I am instead proposing a standard ABI for applications that
> need some guarantees of the bits used in pointers.

Right, but this is not really different from earlier attempts to achieve
this IIRC. Extentind mmap for that purpose seems quite tricky as already
pointed out in other sub-threads. Quite honestly I am not really sure
what is the right and backwards compatible way. I just wanted to make
you aware this has been discussed at lenght in the past.
-- 
Michal Hocko
SUSE Labs

