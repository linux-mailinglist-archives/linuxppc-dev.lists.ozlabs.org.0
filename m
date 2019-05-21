Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE76255E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 18:43:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457hQh1nq5zDqNs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 02:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="DrUfMEDj"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457hP91rRszDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 02:41:48 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id n25so1746483wmk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QRw4dWFrlFKNeC2Hv6jFCNR7pmJ9ZVloUzzaJsWHe3k=;
 b=DrUfMEDjMCX/F/kpAns9Xje6tAglSh3UhG5Ut0HpXQH/i/WF067F5FUZoHtyFcz92J
 B9zO7Q3xmWBLCoBBlKTKoCtUiQsaTMx3Npeppmj4pHHAb15DBLIi9tECGzeTa0qz68HY
 5SJCekbjPP909njq82OecOWv07W5VLYr5VkHE6sbSe+2o5Mw73nXEvvOijdE8vUJH9BM
 uSenbJ2wN1Uv1xiE6qAy9CpI8LAAlCfwF/dLDfgYTm5Xge0CjqlWt1lxcYk7Ou9/XL7L
 lIMEXS/i0lcGD5hbzAqtPxjiA1/NY2p62maSbnW0JtvlH3GgYQ9nmlSCeM60N0klvzp1
 geRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QRw4dWFrlFKNeC2Hv6jFCNR7pmJ9ZVloUzzaJsWHe3k=;
 b=ulMavORsOZPRjYxv3QrhncfqUfkNoyDIc9Ve2o7PGIbg30SZ3V2HInV2psjM7vVSHH
 SQI9SzciWK14V0rudWPs3PV8j/KnbyzualQ1JbO1CZipI5zKjEP98717ldorCp/bl3TI
 OSMMCzYKguJY8KE1RrTsDKvPZr7GTN5dlzYamZFLrFv0Nff+Pdoc+Xymz/gpQS6Hf6o8
 oCzdf4XmW/p5w6fWwiiMWpThvUMtZwO8XvrfC1wTGUO8NCCh44ngDo+3fzVawXAr53KP
 SHgNv3646OHm3l+dfdpQqn4AO5uzTjca5H0z/ZUr4s2Pvv4Lnv9Mq9hEIsppuCRA5CE9
 YBRw==
X-Gm-Message-State: APjAAAUABPG0Uu6OSifeC+ggJjsES4i1025lKsSSg6gjcWegnIzZhusZ
 Od2KTWkfEQnc0N44/KduJHJOPw==
X-Google-Smtp-Source: APXvYqy9lGE6AuIM688BrnvZ7pn7z99PmptY1DxlEejau1I+HdIPSmSJeaZzuDaCQae7Ot/VplE6/A==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr3957899wmi.114.1558456904711; 
 Tue, 21 May 2019 09:41:44 -0700 (PDT)
Received: from brauner.io ([212.91.227.56])
 by smtp.gmail.com with ESMTPSA id q14sm7089531wrx.86.2019.05.21.09.41.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 21 May 2019 09:41:44 -0700 (PDT)
Date: Tue, 21 May 2019 18:41:42 +0200
From: Christian Brauner <christian@brauner.io>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521164141.rbehqnghiej3gfua@brauner.io>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <28114.1558456227@warthog.procyon.org.uk>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, oleg@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, shuah@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, miklos@szeredi.hu,
 x86@kernel.org, torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, tglx@linutronix.de, ldv@altlinux.org,
 linux-arm-kernel@lists.infradead.org, fweimer@redhat.com,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 05:30:27PM +0100, David Howells wrote:
> Al Viro <viro@zeniv.linux.org.uk> wrote:
> 
> > Umm...  That's going to be very painful if you dup2() something to MAX_INT and
> > then run that; roughly 2G iterations of bouncing ->file_lock up and down,
> > without anything that would yield CPU in process.
> > 
> > If anything, I would suggest something like
> > 
> > 	fd = *start_fd;
> > 	grab the lock
> >         fdt = files_fdtable(files);
> > more:
> > 	look for the next eviction candidate in ->open_fds, starting at fd
> > 	if there's none up to max_fd
> > 		drop the lock
> > 		return NULL
> > 	*start_fd = fd + 1;
> > 	if the fscker is really opened and not just reserved
> > 		rcu_assign_pointer(fdt->fd[fd], NULL);
> > 		__put_unused_fd(files, fd);
> > 		drop the lock
> > 		return the file we'd got
> > 	if (unlikely(need_resched()))
> > 		drop lock
> > 		cond_resched();
> > 		grab lock
> > 		fdt = files_fdtable(files);
> > 	goto more;
> > 
> > with the main loop being basically
> > 	while ((file = pick_next(files, &start_fd, max_fd)) != NULL)
> > 		filp_close(file, files);
> 
> If we can live with close_from(int first) rather than close_range(), then this
> can perhaps be done a lot more efficiently by:

Yeah, you mentioned this before. I do like being able to specify an
upper bound to have the ability to place fds strategically after said
upper bound.
I have used this quite a few times where I know that given task may have
inherited up to m fds and I want to inherit a specific pipe who's fd I
know. Then I'd dup2(pipe_fd, <upper_bound + 1>) and then close all
other fds. Is that too much of a corner case?

Christian
