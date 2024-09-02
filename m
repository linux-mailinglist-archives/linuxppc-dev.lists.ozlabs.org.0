Return-Path: <linuxppc-dev+bounces-881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198C968AE0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 17:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyCJr2QBqz2yDH;
	Tue,  3 Sep 2024 01:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725290780;
	cv=none; b=fjuiLLT4P09GqISaMCp72D0RRw4X3oj5m2hedLtR6VHf7B7UrnXQe1nZszj9pkEgSsThaVRDn6Ind8gKiopnEKtkGcd66en+xDs2VNKzOWVJdgre4qUaOgCJP4/yr2Oc5DXcHjmrWnm6Hhl5RGRj/pOGG9Py8uMjCNoM9n/XRVQuZzneAc8//aWfH+TefmozA3IfZ8shoocWIHEK1p8jMja20g/gwip4AmUqWsR0uoUpjPJgFNi0Oh6IkSGdV1Wq2jSOippJJWwrIjSyL7E2Ucfenk7/dQQfV+XuS0FP24EyoaRKcel25cfZEAyERhxwHZecLvfiCtxmx/9pQhbzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725290780; c=relaxed/relaxed;
	bh=mQrdUk9Qs95YbYxvkhvXPIF077+rLJVqqSG6sH4DY10=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=acSczppV2SbLLpVXs9Iy6fvf196BrD/NHDWj8rDwpI7HzsXi0NnfKflIw7g0cpCt0mlAFSFPh+1npmB+s3slhzXyI59aTV8Q8Z98/OI7izenmvYDAxyMMUhvIBlRAaPiERZfwv5GkLF/pb71RSrocoPPj1VhUzky3IMfx+MlG8v7YkKBs+zENYG5R27SNcV9H7890LLI4w23PqZt8GQM5x9ACxRVUnI2JCm6Aue/6co7LGwY5Xefy1GMAEEHwV3GWAWgMJ+XgCbLY28Nk8mmgX5FF8AagBQwZ+MOffpasVOGAOPiXeAvGBpSSLkZi69Jl6VLNOO9s9Y56Zu9udSvtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=0cga6L+r; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=0cga6L+r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyCJq4gvfz2y69
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 01:26:18 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2022fea51fdso6078985ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2024 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725290776; x=1725895576; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQrdUk9Qs95YbYxvkhvXPIF077+rLJVqqSG6sH4DY10=;
        b=0cga6L+r83zwIKz1RkD+cGMNSLPp1jFuASgMXq0EhkHOeFZPf76EWBesEO5RuXASW8
         G8j2X2axkOJn3P/eIviGKacGjWPD1VNMyP+XowWtj6m2v8M+YbOn1lrj0xqeHOVlSikO
         +GeENJ3QXYuUd1PUTyQOs+VwHswJMjXZiOY4JaJR3UAR9RZxJ9/PukjQd8f9LRACe/OI
         KwHwF5g5+xYb9wPEhnZk4iJ51prpNOURMbUjGy5eEx1nruihHN+x5mVbh9Ys+KL35Hck
         I5Qg5gJeu/Gz6a9ir9AbRtk/P9EhLfZzix1xsDjI6XqDP0xyJxdfePcDGDIEHODZzpzs
         q+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290776; x=1725895576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQrdUk9Qs95YbYxvkhvXPIF077+rLJVqqSG6sH4DY10=;
        b=gU5dMDFoOhPKwcqPVU4Sdp5IgyQWVyIDnmvFWbdu7K1f+G2gm9jV8ZWUFBQPT2XhCy
         6MGcgwq9KPvS4MCHvaDwdQx7MYXw6KMdYizZxjOtF9uIkSTpZ8ekrFDyvwFmRTWxU89x
         BvFquKR415PELnWGd6J2Ecs6Mu2k9ltUd4Bjr0HpdpMlMN0jYNpn6qUqMgwS3R4bULmW
         67NfDBqUi8p8Fg1uqPKsLcGYxbLFDd4m2pmRgR2Ja9AmHzllOXWiSMTWm7RNsODOphny
         z2F+3fzPjThXp+lBQ8NlI+U0s30bs7mG8Rvd4xne3WmawSGigZd2xxVliTDWaxaSeZuu
         ShPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiLIrrhnyUyu8v+Pkv9/E1SSJJj77uQbp87kp/cIk7OfOk7QocaPCZP/fTBgTdTBFlVSqhwOEnKirgJpw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUZgObnnQcWxd0WabmSV1+m9bRqp1JM122auWwKDr2UHGOnRYs
	+7mVroGdHp9NIOAM7ZYR/M/oxgjVcr2AEEfPqKyhlir8Hpht9CR08rHZBv0orOw=
X-Google-Smtp-Source: AGHT+IEIj7UpxJT8a0mIACuZXNoTi9evmUotnGeb8wHYPTVQQPCrd38PWufROqKQIhaL5lvUsVlKgg==
X-Received: by 2002:a17:902:e549:b0:205:8948:3578 with SMTP id d9443c01a7336-20589483694mr10763885ad.2.1725290776144;
        Mon, 02 Sep 2024 08:26:16 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d04a3sm67470855ad.110.2024.09.02.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:26:14 -0700 (PDT)
Date: Mon, 2 Sep 2024 08:26:13 -0700
From: Omar Sandoval <osandov@osandov.com>
To: David Hildenbrand <david@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtXZFc9kZAUMD4e0@telecaster>
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
 <ZtVbrM4rQsGFJo_t@telecaster>
 <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <861d448c-ce1d-4b74-87eb-9b211dfebbb1@redhat.com>

On Mon, Sep 02, 2024 at 10:56:27AM +0200, David Hildenbrand wrote:
> On 02.09.24 08:31, Omar Sandoval wrote:
> > On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > > > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > > 
> > > > From: Omar Sandoval <osandov@fb.com>
> > > > 
> > > > Hi,
> > > > 
> > > > I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> > > > destination address is in userspace and x86 Supervisor Mode Access
> > > > Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> > > > renames a helper function so that its use in patch 2 makes more sense.
> > > > If the rename is too intrusive, I can drop it.
> > > 
> > > The name of the function is "copy_to_kernel". If the destination is a user
> > > address, it is not a copy to kernel but a copy to user and you already have
> > > the function copy_to_user() for that. copy_to_user() properly handles SMAP.
> > 
> > I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
> > arbitrary address, and I want it to return an error instead of crashing
> > if the address is not a valid kernel address. As far as I can tell, that
> > is the whole point of copy_to_kernel_nofault().
> 
> The thing is that you (well, KDB) triggers something that would be
> considered a real BUG when triggered from "ordinary" (non-debugging) code.

If that's the case, then it's a really weird inconsistency that it's OK
to call copy_from_kernel_nofault() with an invalid address but a bug to
call copy_to_kernel_nofault() on the same address. Again, isn't the
whole point of these functions to fail gracefully instead of crashing on
invalid addresses? (Modulo the offline and hwpoison cases you mention
for /proc/kcore.)

> But now I am confused: "if the destination address is in userspace" does not
> really make sense in the context of KDB, no?
> 
>   [15]kdb> mm 0 1234
>   [   94.652476] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> 
> Why is address 0 in "user space"? "Which" user space?

Sure, it's not really user space, but it's below TASK_SIZE_MAX, so
things like handle_page_fault() and fault_in_kernel_space() treat it as
if it were a user address. I could
s/userspace address/address that is less than TASK_SIZE_MAX or is_vsyscall_vaddr(address)/.

> Isn't the problem here that KDB lets you blindly write to any non-existing
> memory address?
> 
> 
> Likely it should do some proper filtering like we do in fs/proc/kcore.c:
> 
> Take a look at the KCORE_RAM case where we make sure the page exists, is
> online and may be accessed. Only then, we trigger a
> copy_from_kernel_nofault(). Note that the KCORE_USER is a corner case only
> for some special thingies on x86 (vsyscall), and can be ignored for our case
> here.

Sure, it would be better to harden KDB against all of these special
cases. But you can break things in all sorts of fun ways with a
debugger, anyways. The point of this patch is that it's nonsense that a
function named copy_to_kernel_nofault() does indeed fault in a trivial
case like address < TASK_SIZE_MAX.

Thanks,
Omar

