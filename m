Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF924FBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:06:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457bcl3RwHzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:06:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="XJSG1EyP"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457bZp2lQpzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:04:47 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id w8so18545546wrl.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=UoeHu3yoNUcPPl9PKQVlxSlKB7SL3/RQXELHWxMzhXU=;
 b=XJSG1EyPYqVFv06qjxl82rQK6DnXz+zzZ5SuDKstpUJiXRNS8tQ5JU13/0R23pzYo8
 CBflOikG7l96+4gPyOlywhufFiPRmoYNDl41896XQ/0MJatuwnRejMHB6TDC98rsUSsk
 2AmSYFgAwYwyiIa3Uw0OG4PN7UgonE+wdbkLG/dhBH8kdQoOGpBbAw+wyKcjrVvNwBmM
 VMKMZI30ibz9pqFsG/Cn36t1s2Pm2QH0dtNNkeKYHL7aO5r+71RV9j9Ohu/+y3mncQUm
 NMgjzNYEt1ik5sf8wphXNVOj5VnbG86Jclu6wpcMm3hVcqUXQ13o2yCTql/kibMeVk3R
 6GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UoeHu3yoNUcPPl9PKQVlxSlKB7SL3/RQXELHWxMzhXU=;
 b=IX+GuUlcBGyQ0kKFu8/mAB4zzfADpigAfrMb8Cs+EBmCEVpRx+zVdjXtvZY5CUTE1E
 7wo+YYDlDRWbmwuNMh2QdRAhvIpFsBUEqeIGsvfMxM/1BcEoQz09ucN4thWwkjzhuAtF
 8eTeE0/XI4XsqK+CT0YtoRfqI6yRGF/Sh7ViPjWYf5yTfMDNJMS4YgvsY7R+i8kjl772
 m+go6pkQEOIWSkXdR41Yt8X+bXsfBkEjpv4AxBSLu5psINV50s2l9H4rw9jM6b4bhiJE
 SBwwXagCvbJIWCFSBI+Hh4ZtZB0n+k3s8DdSttuD1GwyJa4SdgosXpZxatElyCD8i/RN
 iooQ==
X-Gm-Message-State: APjAAAVH54A8pv9pdDpFhnL8XItzZv2q7e30K+HOs36B5pX5E2PC23ia
 b/dNy16IYJV6c2UhiMoyaLMtAQ==
X-Google-Smtp-Source: APXvYqxG2D4TpRJtgA1by9C5SwilBq6kPP4Jw28l+Fw52p05f/l2TsKOiCci80kJtWr6XsY8G818bQ==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr34420146wrw.306.1558443882738; 
 Tue, 21 May 2019 06:04:42 -0700 (PDT)
Received: from brauner.io (p548C9938.dip0.t-ipconnect.de. [84.140.153.56])
 by smtp.gmail.com with ESMTPSA id x64sm5789182wmg.17.2019.05.21.06.04.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 21 May 2019 06:04:42 -0700 (PDT)
Date: Tue, 21 May 2019 15:04:39 +0200
From: Christian Brauner <christian@brauner.io>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521130438.q3u4wvve7p6md6cm@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tvdoau12.fsf@oldenburg2.str.redhat.com>
User-Agent: NeoMutt/20180716
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, shuah@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, miklos@szeredi.hu,
 x86@kernel.org, torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, oleg@redhat.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 02:09:29PM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> > +/**
> > + * __close_range() - Close all file descriptors in a given range.
> > + *
> > + * @fd:     starting file descriptor to close
> > + * @max_fd: last file descriptor to close
> > + *
> > + * This closes a range of file descriptors. All file descriptors
> > + * from @fd up to and including @max_fd are closed.
> > + */
> > +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> > +{
> > +	unsigned int cur_max;
> > +
> > +	if (fd > max_fd)
> > +		return -EINVAL;
> > +
> > +	rcu_read_lock();
> > +	cur_max = files_fdtable(files)->max_fds;
> > +	rcu_read_unlock();
> > +
> > +	/* cap to last valid index into fdtable */
> > +	if (max_fd >= cur_max)
> > +		max_fd = cur_max - 1;
> > +
> > +	while (fd <= max_fd)
> > +		__close_fd(files, fd++);
> > +
> > +	return 0;
> > +}
> 
> This seems rather drastic.  How long does this block in kernel mode?
> Maybe it's okay as long as the maximum possible value for cur_max stays
> around 4 million or so.

That's probably valid concern when you reach very high numbers though I
wonder how relevant this is in practice.
Also, you would only be blocking yourself I imagine, i.e. you can't DOS
another task with this unless your multi-threaded.

> 
> Solaris has an fdwalk function:
> 
>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
> 
> So a different way to implement this would expose a nextfd system call

Meh. If nextfd() then I would like it to be able to:
- get the nextfd(fd) >= fd
- get highest open fd e.g. nextfd(-1)

But then I wonder if nextfd() needs to be a syscall and isn't just
either:
fcntl(fd, F_GET_NEXT)?
or
prctl(PR_GET_NEXT)?

Technically, one could also do:

fd_range(unsigned fd, unsigend end_fd, unsigned flags);

fd_range(3, 50, FD_RANGE_CLOSE);

/* return highest fd within the range [3, 50] */
fd_range(3, 50, FD_RANGE_NEXT);

/* return highest fd */
fd_range(3, UINT_MAX, FD_RANGE_NEXT);

This syscall could also reasonably be extended.

> to userspace, so that we can use that to implement both fdwalk and
> closefrom.  But maybe fdwalk is just too obscure, given the existence of
> /proc.

Yeah we probably don't need fdwalk.

> 
> I'll happily implement closefrom on top of close_range in glibc (plus
> fallback for older kernels based on /proc—with an abort in case that
> doesn't work because the RLIMIT_NOFILE hack is unreliable
> unfortunately).
> 
> Thanks,
> Florian
