Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C217F27FB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 16:30:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458sNd60C7zDqkj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 00:30:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="eH5v3tpg"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458sLd1YtdzDqjZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 00:28:41 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id e19so5016255iob.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RpoaZHiLYMmGlhX0k0xc+98b7kVM8O0Nb+ulnrgtNJY=;
 b=eH5v3tpg2jWcAPb1BtxrbVrTwVUfKiSWlvBDKjPnMCLKVULShlUKgTwitBPVj8R67S
 bl1SbiSsoHmzObZJaBxdW4O3YF9bi/hDQVh4LM4xPKTAcWNU8KdkloCUphchsoElrid6
 6AE/lgpbQOcODzePbiuHNI5h5RQVYZ3DdiPNZ1P21NCTx0RWpesYRMzTQk9Tx9wVH82F
 3QjTfmq966opB3u1fxAMKVkxd+GjbHM+SN0LX9x6Dx0Gop9JfYNLNSq6TGOipNEymeNB
 dRNv03qtNpwfVHrkY4WBtB5KiozY7XbCo0INoRR2QE2B56FK+0X4wpaY3eTtXiJMWQV6
 F5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RpoaZHiLYMmGlhX0k0xc+98b7kVM8O0Nb+ulnrgtNJY=;
 b=R4ibcHQHGsMs9hugTy5KsyV2Tj1FRqf6k0Yd8LET7n29htYQ12MIqglchBwZzpvbDu
 CFJjlN1E2g5FYDSmfzvRWRDA9NeyEimAeQnldgmjOvYidbW179TGUL3H711LDy0uUYo5
 bh2sv3Xa2wH4+XVicZvcJf8AEkM4S/3JmrDhFNTemtVm0TNuRSbOy5JiXj/NsFV3ar91
 DW1dUAlFxsw2nixWQIghT7nvh1BXCb1DElOARZwHKqdedsWDNzPfcFrrf/N6PSmxAjQo
 RF8qftBmECAueED+5o16rS1/y4AkiAcjO/VfA8NRGV9iewvSIbGJ285VrT0DNcS4ZRAv
 u81Q==
X-Gm-Message-State: APjAAAXV/ReKfXJGH0jsamdbwHxxbdtfnxYoYgpeTEqiwHHIf6fK7rb6
 iCUGRVEhDeVoJFWONp2XYg0/GA==
X-Google-Smtp-Source: APXvYqx8LKzOGpiWsL6dTrqW1tpjf/a6M4DwvCuMOWOiEPh8pOdaLx/XEPvYVwOl6hL0YBJIUNsKYw==
X-Received: by 2002:a6b:ca47:: with SMTP id a68mr20174292iog.227.1558621717396; 
 Thu, 23 May 2019 07:28:37 -0700 (PDT)
Received: from brauner.io ([172.56.12.187])
 by smtp.gmail.com with ESMTPSA id w186sm4196873ita.3.2019.05.23.07.28.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 23 May 2019 07:28:36 -0700 (PDT)
Date: Thu, 23 May 2019 16:28:28 +0200
From: Christian Brauner <christian@brauner.io>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH v1 1/2] open: add close_range()
Message-ID: <20190523142826.omb7vgygudifmveq@brauner.io>
References: <20190522155259.11174-1-christian@brauner.io>
 <20190522165737.GC4915@redhat.com>
 <20190523115118.pmscbd6kaqy37dym@brauner.io>
 <20190523141447.34s3kc3fuwmoeq7n@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190523141447.34s3kc3fuwmoeq7n@brauner.io>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, ldv@altlinux.org,
 dhowells@redhat.com, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org,
 torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, fweimer@redhat.com,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 04:14:47PM +0200, Christian Brauner wrote:
> On Thu, May 23, 2019 at 01:51:18PM +0200, Christian Brauner wrote:
> > On Wed, May 22, 2019 at 06:57:37PM +0200, Oleg Nesterov wrote:
> > > On 05/22, Christian Brauner wrote:
> > > >
> > > > +static struct file *pick_file(struct files_struct *files, unsigned fd)
> > > >  {
> > > > -	struct file *file;
> > > > +	struct file *file = NULL;
> > > >  	struct fdtable *fdt;
> > > >  
> > > >  	spin_lock(&files->file_lock);
> > > > @@ -632,15 +629,65 @@ int __close_fd(struct files_struct *files, unsigned fd)
> > > >  		goto out_unlock;
> > > >  	rcu_assign_pointer(fdt->fd[fd], NULL);
> > > >  	__put_unused_fd(files, fd);
> > > > -	spin_unlock(&files->file_lock);
> > > > -	return filp_close(file, files);
> > > >  
> > > >  out_unlock:
> > > >  	spin_unlock(&files->file_lock);
> > > > -	return -EBADF;
> > > > +	return file;
> > > 
> > > ...
> > > 
> > > > +int __close_range(struct files_struct *files, unsigned fd, unsigned max_fd)
> > > > +{
> > > > +	unsigned int cur_max;
> > > > +
> > > > +	if (fd > max_fd)
> > > > +		return -EINVAL;
> > > > +
> > > > +	rcu_read_lock();
> > > > +	cur_max = files_fdtable(files)->max_fds;
> > > > +	rcu_read_unlock();
> > > > +
> > > > +	/* cap to last valid index into fdtable */
> > > > +	if (max_fd >= cur_max)
> > > > +		max_fd = cur_max - 1;
> > > > +
> > > > +	while (fd <= max_fd) {
> > > > +		struct file *file;
> > > > +
> > > > +		file = pick_file(files, fd++);
> > > 
> > > Well, how about something like
> > > 
> > > 	static unsigned int find_next_opened_fd(struct fdtable *fdt, unsigned start)
> > > 	{
> > > 		unsigned int maxfd = fdt->max_fds;
> > > 		unsigned int maxbit = maxfd / BITS_PER_LONG;
> > > 		unsigned int bitbit = start / BITS_PER_LONG;
> > > 
> > > 		bitbit = find_next_bit(fdt->full_fds_bits, maxbit, bitbit) * BITS_PER_LONG;
> > > 		if (bitbit > maxfd)
> > > 			return maxfd;
> > > 		if (bitbit > start)
> > > 			start = bitbit;
> > > 		return find_next_bit(fdt->open_fds, maxfd, start);
> > > 	}
> > 
> > > 
> > > 	unsigned close_next_fd(struct files_struct *files, unsigned start, unsigned maxfd)
> > > 	{
> > > 		unsigned fd;
> > > 		struct file *file;
> > > 		struct fdtable *fdt;
> > > 	
> > > 		spin_lock(&files->file_lock);
> > > 		fdt = files_fdtable(files);
> > > 		fd = find_next_opened_fd(fdt, start);
> > > 		if (fd >= fdt->max_fds || fd > maxfd) {
> > > 			fd = -1;
> > > 			goto out;
> > > 		}
> > > 
> > > 		file = fdt->fd[fd];
> > > 		rcu_assign_pointer(fdt->fd[fd], NULL);
> > > 		__put_unused_fd(files, fd);
> > > 	out:
> > > 		spin_unlock(&files->file_lock);
> > > 
> > > 		if (fd == -1u)
> > > 			return fd;
> > > 
> > > 		filp_close(file, files);
> > > 		return fd + 1;
> > > 	}
> > 
> > Thanks, Oleg!
> > 
> > I kept it dumb and was about to reply that your solution introduces more
> > code when it seemed we wanted to keep this very simple for now.
> > But then I saw that find_next_opened_fd() already exists as
> > find_next_fd(). So it's actually not bad compared to what I sent in v1.
> > So - with some small tweaks (need to test it and all now) - how do we
> > feel about?:
> 
> That's obviously not correct atm but I'll send out a tweaked version in
> a bit.

So given that we would really need another find_next_open_fd() I think
sticking to the simple cond_resched() version I sent before is better
for now until we see real-world performance issues.
I was however missing a test for close_range(fd, fd, 0) anyway so I'll
need to send a v2 with this test added.

Christian
