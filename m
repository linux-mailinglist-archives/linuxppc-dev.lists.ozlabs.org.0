Return-Path: <linuxppc-dev+bounces-7965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87705A9B59E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 19:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk3KC0jrhz3byF;
	Fri, 25 Apr 2025 03:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745516719;
	cv=none; b=W9zfSYwJ5W4GC+6YCwFUo+bRy8oudNUUfxrR1F9rjDcun66cceJNoRVWAE+NB7TdhjPlED5KAaVOQRzjMJM6pDTT6bgaeQLh7K0Fbx68hWaoMARx5h7C2tnrz44ENfpWDzRcetQD69voVogrsSyDkK2Jerug2av9Q22H+uaN6cTv6kd3nwUMtCwIYNSjvFd6zzkHxJql0z+OMuaDopC6Or+F7ODswicMhKubMN8up0Gdhdkp34hgmQv54PFVffs/Pz3vYrSKYeIiwHIWw+B3fQ5T3tffhDLYAUESHROwYqY3FoMRnYCSGMvHBpBMF92JXjcvBNc6AwVckfbWfZW+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745516719; c=relaxed/relaxed;
	bh=JSMzO6fx79vdlfqdO8dlMyzHm6+/LG9Oml+3X61fg04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OrF0pXjTGhzhcnYGH7LxAd6oqgM1sUidn02H70nm5wnfyGMpyuu7HuAPUSKGY199ceDqrn7+BKSJ2wSXKhoZ+sSFNPLLq+bhh1Qqgkpo0yuhtV9OS8G9cL/Be1QUpjyftk4+LzRGJU2aDU+ldmkEO8JmWZtVdlR+SZGFali6CmI9EyR20XRYUSPC7nuKsdZlUAIWwvQZQFYaH504SbNfXCM3R6q/tblpES0qAadZYjK41n6tyQc1sgC7lhNdU0aF1RHSrDsYkXtiaNoItOzoLXByNDWba9KN0j1WzldtPRyZ3NaE2WhOqYDjBvgnEC28b+Sp3clehPTtZvNVTVrtzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hU9nxKga; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hU9nxKga; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hU9nxKga;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hU9nxKga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk3KB029tz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 03:45:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745516712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSMzO6fx79vdlfqdO8dlMyzHm6+/LG9Oml+3X61fg04=;
	b=hU9nxKgaBy+fSgFnWplR8Y48QuKT2qJnUMSFUgoVKAu0ffjqK5PTC6RwpBkKSDqWr54v71
	WlmlGhaELs0ZwyC7nDS07VqnIW27N+tDWmKqcG4t0SuzlYJDimOWVDnA82j/vE7ff3JpMi
	JZ6bzkGRTKVeth8MvZkoSZST2JDMD1g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745516712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSMzO6fx79vdlfqdO8dlMyzHm6+/LG9Oml+3X61fg04=;
	b=hU9nxKgaBy+fSgFnWplR8Y48QuKT2qJnUMSFUgoVKAu0ffjqK5PTC6RwpBkKSDqWr54v71
	WlmlGhaELs0ZwyC7nDS07VqnIW27N+tDWmKqcG4t0SuzlYJDimOWVDnA82j/vE7ff3JpMi
	JZ6bzkGRTKVeth8MvZkoSZST2JDMD1g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-k67Hi0pJOESoXB0WIZpxgw-1; Thu, 24 Apr 2025 13:45:10 -0400
X-MC-Unique: k67Hi0pJOESoXB0WIZpxgw-1
X-Mimecast-MFC-AGG-ID: k67Hi0pJOESoXB0WIZpxgw_1745516709
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb5a03afdcso104572566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516709; x=1746121509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSMzO6fx79vdlfqdO8dlMyzHm6+/LG9Oml+3X61fg04=;
        b=BARzom0P8HpdMGfagY8u2qAAqeQgbHeW6VyqGZOPw5p3SbCK1sAhRogDVrQFr3IhY2
         A1ZErIfINgC/G+w0eVSABU0M6FLNKsE4YthjTOzaWXqkGLX21eR21J5xb/aP4hUvkLy7
         YmSwbwWHBkHdIdAObqZPkWuvTiCWwlr56Klo2cM8u50ZWE5x/ILjqm0skxiJ5BYuR6sZ
         U9vFryz6SE3ccJ04u6TId7ENpYU3JPz0I0xhGkAD/FyP/LTmoH9Pq5E95nW3N/fUOxox
         ar1pUkueTmnipNXzChg6pYazMjz666Z9QLtvhXQs/XXFvqdhPFg8UnmhYMZBGrvc0O4+
         FZBw==
X-Forwarded-Encrypted: i=1; AJvYcCVWxH/h0F+yiIgV2uc3aLDIv+jl24a+QsCRtPcFl1SRTVy8BRCVsVTPl+FYjzI38gO3Q/GGmCIonsQ5CPc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeRNbtEY7FIAWpvwDEObcCNaQR0mO0aa4tqKm/VbkpNQHyF/63
	BrcPHHU2+ZNKLyiJOAeuzG8zlxme0TPVJv+ikHlHXpmxSljXnSe94ONH3C58OvQ7AIyPhFuDCVc
	phjwM7GHUul/fzDG6TAyzlRW/jPB73HeOsT25CyP1Ioc6S4mWuoj44UG7nsb3ig==
X-Gm-Gg: ASbGncsXdPeJXzuOyOp9HUJk8RMnDJ6zvnqyjm9NF61amTv2c4kVeOwaD80bR54ytp/
	LOdBI/zh396a9ML+N/dJimUCVM8rVc8gpOOfIBeGgmQ2DjjcNclpPlkbh13c39b8OJA8Y46FRrP
	rajf0tVOOC1HiD2h/AbqYu4/r812z3JRDSvChMbhJYHnMTJ/V/cZ7kNM9PpQh1tmvRH8O7zbrOf
	jFFaUUq9AAhvxGzXLnskgx465doz2rZ9nRPffllQ7CnEtwTrSxzeLNs2x8gXw4/nq05nLhzGTF0
	qViLuHQyek0p/8tx80CC80Je2vJh7/s=
X-Received: by 2002:a17:907:9412:b0:acb:3a0d:8a82 with SMTP id a640c23a62f3a-ace6b450a49mr51589466b.32.1745516708654;
        Thu, 24 Apr 2025 10:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTh+3uHoEBQ4GmOFk2Iro9cQNDST88N03Da5siOmOBhQ6S/NryZGUQ9nV3zdizG2WhZyWkCg==
X-Received: by 2002:a17:907:9412:b0:acb:3a0d:8a82 with SMTP id a640c23a62f3a-ace6b450a49mr51586866b.32.1745516708167;
        Thu, 24 Apr 2025 10:45:08 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace5989b173sm140418466b.59.2025.04.24.10.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:45:07 -0700 (PDT)
Date: Thu, 24 Apr 2025 19:45:06 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <oprhbm2vcqpveaf6smetfl2zacntntzqlakysys73zx3gnougi@zy7bo43bh5ef>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
 <20250422-abbekommen-begierde-bcf48dd74a2e@brauner>
 <rbzlwvecvrp4xawwp5nywdq6wp5hgjhrtrabpszv74xmfqbj4f@x7v6eqfc5gcd>
 <20250424-zuspielen-luxus-3d49b600c3bf@brauner>
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
In-Reply-To: <20250424-zuspielen-luxus-3d49b600c3bf@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4YdBGQUH86kjZH_PEKYkcZYRRJojSJgli9DrLikMtoM_1745516709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-24 11:06:07, Christian Brauner wrote:
> On Wed, Apr 23, 2025 at 11:53:25AM +0200, Jan Kara wrote:
> > On Tue 22-04-25 16:59:02, Christian Brauner wrote:
> > > On Fri, Mar 21, 2025 at 08:48:42PM +0100, Andrey Albershteyn wrote:
> > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > > 
> > > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > > extended attributes/flags. The syscalls take parent directory fd and
> > > > path to the child together with struct fsxattr.
> > > > 
> > > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > > that file don't need to be open as we can reference it with a path
> > > > instead of fd. By having this we can manipulated inode extended
> > > > attributes not only on regular files but also on special ones. This
> > > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > > we can not call ioctl() directly on the filesystem inode using fd.
> > > > 
> > > > This patch adds two new syscalls which allows userspace to get/set
> > > > extended inode attributes on special files by using parent directory
> > > > and a path - *at() like syscall.
> > > > 
> > > > CC: linux-api@vger.kernel.org
> > > > CC: linux-fsdevel@vger.kernel.org
> > > > CC: linux-xfs@vger.kernel.org
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > ...
> > > > +		struct fsxattr __user *, ufsx, size_t, usize,
> > > > +		unsigned int, at_flags)
> > > > +{
> > > > +	struct fileattr fa = {};
> > > > +	struct path filepath;
> > > > +	int error;
> > > > +	unsigned int lookup_flags = 0;
> > > > +	struct filename *name;
> > > > +	struct fsxattr fsx = {};
> > > > +
> > > > +	BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > > > +	BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> > > > +
> > > > +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > > > +		lookup_flags |= LOOKUP_FOLLOW;
> > > > +
> > > > +	if (at_flags & AT_EMPTY_PATH)
> > > > +		lookup_flags |= LOOKUP_EMPTY;
> > > > +
> > > > +	if (usize > PAGE_SIZE)
> > > > +		return -E2BIG;
> > > > +
> > > > +	if (usize < FSXATTR_SIZE_VER0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	name = getname_maybe_null(filename, at_flags);
> > > > +	if (!name) {
> > > 
> > > This is broken as it doesn't handle AT_FDCWD correctly. You need:
> > > 
> > >         name = getname_maybe_null(filename, at_flags);
> > >         if (IS_ERR(name))
> > >                 return PTR_ERR(name);
> > > 
> > >         if (!name && dfd >= 0) {
> > > 		CLASS(fd, f)(dfd);
> > 
> > Ah, you're indeed right that if dfd == AT_FDCWD and filename == NULL, the
> > we should operate on cwd but we'd bail with error here. I've missed that
> > during my review. But as far as I've checked the same bug is there in
> > path_setxattrat() and path_getxattrat() so we should fix this there as
> > well?
> 
> Yes, please!
> 

Thanks for the review, Christian. I will fix issues you noticed as
suggested. I see that Jan already sent fix for path_[s|g]etxattrat()
so won't do anything here.

-- 
- Andrey


