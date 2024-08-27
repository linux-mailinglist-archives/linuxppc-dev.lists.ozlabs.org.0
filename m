Return-Path: <linuxppc-dev+bounces-565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F264B96011D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 07:36:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtGW56dt9z2yPD;
	Tue, 27 Aug 2024 15:36:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724736449;
	cv=none; b=W+lCo+FuOUJ6IDWOupo7alZXKmpEwTv9e6UOJ+1j5Zd56GqaI+nmr/JL/JOEDTkSdA5VXqdnPcFP/L63oWO4nDcZNLAtjnzvM//ZtDu14Godwo/S6aKdwxMKH+LK3Ts/uvrV96shzNB7zf24B3FRAcjw5SonXRYKrCR1GLxWxy//M5rw2hFxc2/m6559jolOTHxYGO12okwjoYGwvRtONP/gJcx9E0rqs+DEmuHZ03L1YAc6WUsi6/x9VOBG8KZxh7krP5YDBD/EWK09B3pKBlSeSHq9sPfWsAFASHoLe+J+6aT5ptMMNP2y8EwUms7SuY+FdLmpfMROgNhSxA0ZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724736449; c=relaxed/relaxed;
	bh=8TM272CqmQHBAPuQBx3v3EUsJXwKFvKHbfQWNUBbbHk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:Date:Message-ID:
	 References:MIME-version:Content-type:Content-Transfer-Encoding; b=N/pP7vFO9dUMqKub8zDfw+iBwdW3q0fAreVlIjysxPR9MbpsqhiCuXeYkEp+jjr4yelaps8msJ1cvEJ1uh1lS3vKA2fT5v935KiqWD0pt0ONZHP0ljPc1VMDMjY232o64aV42FPlvkt0AcetKlI6Xvfn/OjHrba7hTW7bWzc2Xv50iKuaclVUIGDtUAi2ObXTHyun3qcP65nq2oCtVsaYnVRhBJX63qAnyK9YbmuWhnjkPOZol8L9fTlR2GFMjVR2A6KGR0S1Tkums6KA213CDBDLAXZE3fmkjC834pQKXhLBbjuEsdQtBBJKI27Kd1J4hhAJbXKtSiIYxitgvuOYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l3wmVj45; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l3wmVj45;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtGJd1wLKz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 15:27:28 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e116a5c3922so4886441276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 22:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736445; x=1725341245; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TM272CqmQHBAPuQBx3v3EUsJXwKFvKHbfQWNUBbbHk=;
        b=l3wmVj45+etALYJU5R3IubvInAXynEhCULeuyB5psMvrMiqWhh4iuqvwXbqN++Ujjl
         rM1SZ7JhRZuW6D2xxlklo8Ud/+TYiy3Vvv1WcJ8FpNolRK5S6hDAcewYG2dwCoN1X0zs
         vWpFNXvG12x+nFhyhEgmFFzOFC0TfDlh6pYAarx/kwH/dSvEAGDN4sMN74TmYnnqGQ6b
         MtqG2HvPTkALQXW3cwyPlPlW+pUXBnRiasT+g4/jZIZ2l/+Cx1xBKQ6WVN88HN0WEif6
         5FbfLnI399jGRQBwp5h5jd5WeWvoLwN/flaH8Vl6Z8wG5OXi6N9JeDUdkmeD3yDTp+Pd
         B6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736445; x=1725341245;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TM272CqmQHBAPuQBx3v3EUsJXwKFvKHbfQWNUBbbHk=;
        b=ARHLAPs/ARRg1J5649v8JkLygve9ivNbR6wvHv6xBDNR/R/iVH1nZD2a2AbjYCIeZj
         Lv0SWefGsqi20aiFh5GD+i9orNI8QzzF7f9W/zKWVZ03ctsQX26xdapT9e/wrr6IQhzi
         HAnAq9brmHlO9HQZ0TNgpL6Qe1WqIl/hf8ZUSeqxAHuWAeG2xLGwNVwYerECBAXXaWAo
         cAkcC+4gGM5HJpwdJkcvUHbzgAXY0jP8zMVPHIOPeuyjKpXnxqqZhcTR2F2s928y4evD
         vqVmKmflxNfZkJXoagyzSlS5VkH0SbtgZRYHJ+Ltyh5lVA/6akdUryFZR/mCglw+JHJH
         T9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU2sIxDRdaDedZT0JvLmNrYRIOUasOUAewwu9LuBcG7XNhzdvhqAZkV5+w5HXXTtiSrqHFuuAnTG0c7Ljc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtwBPjlDdLL4G9THgiTNvhnH813GMjyn8CSIkRmfMzNZWAnRLw
	Hb1uj0vzs80mcXzGRh4XQSSSgck4/Cgiq/R/ajWWWpA+JFz4fGzZZYzPkg==
X-Google-Smtp-Source: AGHT+IE/x+eNQiL+f3L5I5I1E4tl4eROm28xpp8EC3DBQBTRt4QoRF4Tk78dVd65ZwKwWwpCjGy/pw==
X-Received: by 2002:a05:6902:a86:b0:e16:5177:758e with SMTP id 3f1490d57ef6-e17a83d4bafmr12881575276.7.1724736445148;
        Mon, 26 Aug 2024 22:27:25 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e77sm7788442b3a.202.2024.08.26.22.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:27:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner <brauner@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
In-Reply-To: <Zsz2gGgORfeVkVfG@bombadil.infradead.org>
Date: Tue, 27 Aug 2024 10:56:12 +0530
Message-ID: <878qwisfij.fsf@gmail.com>
References: <20240826175931.1989f99e@canb.auug.org.au> <20240826154818.hzqnvofdmaxvuwrh@quentin> <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu> <ZszrJkFOpiy5rCma@bombadil.infradead.org> <20240826211049.GC6082@frogsfrogsfrogs> <Zsz2gGgORfeVkVfG@bombadil.infradead.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Luis Chamberlain <mcgrof@kernel.org> writes:

> On Mon, Aug 26, 2024 at 02:10:49PM -0700, Darrick J. Wong wrote:
>> On Mon, Aug 26, 2024 at 01:52:54PM -0700, Luis Chamberlain wrote:
>> > On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
>> > > 
>> > > 
>> > > Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
>> > > > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
>> > > > > Hi all,
>> > > > > 
>> > > > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
>> > > > > pseries_le_defconfig) produced this warning:
>> > > > 
>> > > > iomap dio calls set_memory_ro() on the page that is used for sub block
>> > > > zeroing.
>> > > > 
>> > > > But looking at powerpc code, they don't support set_memory_ro() for
>> > > > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
>> > > > 
>> > > > /*
>> > > >   * On hash, the linear mapping is not in the Linux page table so
>> > > >   * apply_to_existing_page_range() will have no effect. If in the future
>> > > >   * the set_memory_* functions are used on the linear map this will need
>> > > >   * to be updated.
>> > > >   */
>> > > > if (!radix_enabled()) {
>> > > >          int region = get_region_id(addr);
>> > > > 
>> > > >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>> > > >                  return -EINVAL;
>> > > > }
>> > > > 
>> > > > We call set_memory_ro() on the zero page as a extra security measure.
>> > > > I don't know much about powerpc, but looking at the comment, is it just
>> > > > adding the following to support it in powerpc:
>> > > > 
>> > > > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
>> > > > index ac22bf28086fa..e6e0b40ba6db4 100644
>> > > > --- a/arch/powerpc/mm/pageattr.c
>> > > > +++ b/arch/powerpc/mm/pageattr.c
>> > > > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>> > > >          if (!radix_enabled()) {
>> > > >                  int region = get_region_id(addr);
>> > > > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>> > > > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
>> > > > +                                region != IO_REGION_ID &&
>> > > > +                                region != LINEAR_MAP_REGION_ID))
>> > > >                          return -EINVAL;
>> > > >          }
>> > > >   #endif
>> > > 
>> > > By doing this you will just hide the fact that it didn't work.
>> > > 
>> > > See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
>> > > details. The linear memory region is not mapped using page tables so
>> > > set_memory_ro() will have no effect on it.
>> > > 
>> > > You can either use vmalloc'ed pages, or do a const static allocation at
>> > > buildtime so that it will be allocated in the kernel static rodata area.
>> > > 
>> > > By the way, your code should check the value returned by set_memory_ro(),
>> > > there is some work in progress to make it mandatory, see
>> > > https://github.com/KSPP/linux/issues/7
>> > 
>> > Our users expect contiguous memory [0] and so we use alloc_pages() here,
>> > so if we're architecture limitted by this I'd rather we just remove the
>> > set_memory_ro() only for PPC, I don't see why other have to skip this.

Looks like not a standard thing to do for kernel linear memory map
region then and maybe few other archs could be ignoring too?

>> 
>> Just drop it, then.
>
> OK sent a patch for that.
>

Thanks for fixing it!

-ritesh

