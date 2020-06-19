Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC9201D05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 23:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pWr74hkXzDqbq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 07:18:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.68; helo=mail-pj1-f68.google.com;
 envelope-from=mcgrof@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pWpW1J6KzDrS9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 07:17:06 +1000 (AEST)
Received: by mail-pj1-f68.google.com with SMTP id s88so4813046pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 14:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7hNihcV3mvm2VbgzMCb3VuZiHFSALZHgtjxranVJTmE=;
 b=K0ar/COUldqnDYclHoXON9MIgT8jJfoJ/CvRQ+VA/F2pgcPnQOa0cNOSix+/D4Tzr4
 i3krMqMZCRm0L5I7diVRIJbD9MoH8zYyzPFzgCZ1CRaV7AxMHMo0t6vaMCbArwlxy0BW
 YzEvWrCB0KwzDtFxFfbYmRwerkvhmQdldVRoUfhH6UN/U+tOk9T0X/GDvAZKdESkgmYf
 MGjI8A2neG7iOjutTF+wbprtdcM7Xn355UNWfF2eQufR05FArYRlQbJyX1xZZYAxrPGO
 +mZs4eulRCGgT7aihEhv5B9f9LdSdh84tUcjx6XkpYsaBZU8mPz0WlPL74ZSlNFiwKrz
 MISg==
X-Gm-Message-State: AOAM530HU0LqgPxtvmnCnmZg2i2QvAPImakp+hk6W86CMjbwOUacrb0s
 CxqAsiQzkjwQ987q4dj8gpc=
X-Google-Smtp-Source: ABdhPJzVFn2+ANNt35xVqck48K2jzOLKssbmFAqliq16/KCjcWBHQm/+K7WAIhdQVl6WxrZdgzhwhg==
X-Received: by 2002:a17:90a:7a8f:: with SMTP id
 q15mr4751132pjf.116.1592601423167; 
 Fri, 19 Jun 2020 14:17:03 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id s188sm6551320pfb.118.2020.06.19.14.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 14:17:01 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 0E5884063E; Fri, 19 Jun 2020 21:17:00 +0000 (UTC)
Date: Fri, 19 Jun 2020 21:17:00 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 6/6] kernel: add a kernel_wait helper
Message-ID: <20200619211700.GS11244@42.do-not-panic.com>
References: <20200618144627.114057-1-hch@lst.de>
 <20200618144627.114057-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618144627.114057-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Brian Gerst <brgerst@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 04:46:27PM +0200, Christoph Hellwig wrote:
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -1626,6 +1626,22 @@ long kernel_wait4(pid_t upid, int __user *stat_addr, int options,
>  	return ret;
>  }
>  
> +int kernel_wait(pid_t pid, int *stat)
> +{
> +	struct wait_opts wo = {
> +		.wo_type	= PIDTYPE_PID,
> +		.wo_pid		= find_get_pid(pid),
> +		.wo_flags	= WEXITED,
> +	};
> +	int ret;
> +
> +	ret = do_wait(&wo);
> +	if (ret > 0 && wo.wo_stat)
> +		*stat = wo.wo_stat;

Since all we care about is WEXITED, that could be simplified
to something like this:

if (ret > 0 && KWIFEXITED(wo.wo_stat)
 	*stat = KWEXITSTATUS(wo.wo_stat)

Otherwise callers have to use W*() wrappers.

> +	put_pid(wo.wo_pid);
> +	return ret;
> +}

Then we don't get *any* in-kernel code dealing with the W*() crap.
I just unwrapped this for the umh [0], given that otherwise we'd
have to use KW*() callers elsewhere. Doing it upshot one level
further would be even better.

[0] https://lkml.kernel.org/r/20200610154923.27510-1-mcgrof@kernel.org              

  Luis
