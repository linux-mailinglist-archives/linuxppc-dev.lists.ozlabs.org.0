Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF73D6D0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 03:58:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sdql2tYhzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 12:58:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=kernelfans@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TIHUzyDc"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sdnv4y9jzDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 12:56:33 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d22so8807227pls.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Kwwu5kbmkBQ1HH+8pWXVXW0xmQfdqCxeByRCN8KSXEY=;
 b=TIHUzyDc6SGbORZPiz2reZIw7vN60Ixo8blMx0SNx6RBtQI/zstwu3hsCiWqL9JZQ6
 IPThY2YzkQg8LrKB3cqxmkqsAs5VVvubIY28QgI45g0H0yaF5IzjbklpNV2+uzg7ULhD
 41VHOncIQSJhMRT2o32TECBBQ+NfE0tIi1QkvfROvb7aKd+NouZWdTt5bs63H5tk7Ji2
 lgJqac9vy5pPNqpqTuv8j8JQxXSpPEXx8cXPgJNtDNi+Fb3nWytmId8qoUaiqQJznwsD
 RzvUXAbBZYq4mAHTGUiGi8GCDb+XMcbtyT4TfXEdMoBGZjYFytyAH9oMmYLxg4F/HIz4
 PdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Kwwu5kbmkBQ1HH+8pWXVXW0xmQfdqCxeByRCN8KSXEY=;
 b=dBTMg+2XRCaLYW+SoeKbH6y9b1YzD2PYO6Qt0H5GrfYVdfdgpv4OuWeMKqj8PaMZl+
 UEb+ltOwOnscGYsNj1QJPRG7H5NObRtXAOsU6erY41jggJdvVCxy5cP3vbaIfSNFO1xm
 YS6suAo4D4Vay3Q/Hh0VW94e4194UM2VS4ZPeZE8bMHKB9Jah7FxghC7L7wbDUZ3oUb0
 07jiOIZYluYhDlq1r4TiOixk1MLAhE9w57xaHdP3sCVdjycLm9mUpZ8TgXyDIR7Yhoel
 2Mqtj6KNeY55BKV506glzOuF1kU2ESdSs9xP4pf4bJ+fyWFDUHnYNbHmwfIUx/TqM8/3
 ZFTA==
X-Gm-Message-State: APjAAAXu2jpsFqATMOikIKDiBfzC+/tvT77LTgfVIC06YG0hqAKrjmGP
 Zs95OuJF1gkDNkt3rfhzmw==
X-Google-Smtp-Source: APXvYqw8OLndhpbDZgTRsz4NpKzRxTwytzyi9coZcCx6lgDY9wvvn1k4hzSKoy8pOwXWtzGMS7S1MA==
X-Received: by 2002:a17:902:2e:: with SMTP id
 43mr32776368pla.270.1571104590386; 
 Mon, 14 Oct 2019 18:56:30 -0700 (PDT)
Received: from mypc ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b16sm24060901pfb.54.2019.10.14.18.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 18:56:29 -0700 (PDT)
Date: Tue, 15 Oct 2019 09:56:20 +0800
From: Pingfan Liu <kernelfans@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191015015620.GA14327@mypc>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
 <20191014084027.GA3593@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014084027.GA3593@infradead.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Eric Sandeen <esandeen@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org,
 Dave Chinner <dchinner@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 01:40:27AM -0700, Christoph Hellwig wrote:
> On Sun, Oct 13, 2019 at 10:37:00PM +0800, Pingfan Liu wrote:
> > When using fadump (fireware assist dump) mode on powerpc, a mismatch
> > between grub xfs driver and kernel xfs driver has been obsevered.  Note:
> > fadump boots up in the following sequence: fireware -> grub reads kernel
> > and initramfs -> kernel boots.
> 
> This isn't something new.  To fundamentally fix this you need to
> implement (in-memory) log recovery in grub.  That is the only really safe
> long-term solutioin.  But the equivalent of your patch you can already
Agree. For the consistency of the whole fs, we need grub to be aware of
log. While this patch just assumes that files accessed by grub are
known, and the consistency is forced only on these files.
> get by freezing and unfreezing the file system using the FIFREEZE and
> FITHAW ioctls.  And if my memory is serving me correctly Dave has been
freeze will block any further modification to the fs. That is different
from my patch, which does not have such limitation.
> preaching that to the bootloader folks for a long time, but apparently
> without visible results.
Yes, it is a pity. And maybe it is uneasy to do.

Thanks and regards,
	Pingfan
