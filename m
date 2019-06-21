Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62D4E8C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:19:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VfRr0psLzDqc2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 23:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="dAlun1Hg"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VfMn0Sf6zDqZy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 23:16:15 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id c11so4344867qkk.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IQElyJy7GWkNBjpDGeWXQk4uiZdHF4DIvT5Nq6LmxE8=;
 b=dAlun1HgnUe7022YkQS6GWMYxR1o5c8vpg7JqEcJa5EPCdLDLVoVyNKQvqmZhtNBLF
 WpB9JM8/T8dBcxbgb0A781lKzoM1O/pMV5gbPgxu5rSpwSDOdrQZP84Rnb3SOamIN0Wr
 zqwvpJy81nkQ5T+CDcckayqmm3eCo60vgpfs1x9K8ufP7D9ZXElAHaqtpaYy7p5iJE/y
 l4SUnUVsNsnn39sHqAifpgiGxKut8u7nW0gFTVC/+FCOE5qrTg5md8qyqRNjEUqfK8fM
 2IShZOwM3jYukwEVdkuYU+31+Rw+P2EKrT1nUVgmbwp7XxSFSraMeiH+ei/K/LHG/DXJ
 LUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IQElyJy7GWkNBjpDGeWXQk4uiZdHF4DIvT5Nq6LmxE8=;
 b=p5tWMGFd3SaFDyqzCVpvoJ/dnd/ae0Evqw3HkzbLTiVIIKOpP5gnwIvapiiAcCTobC
 PDuNidlMuSAAMCvp1KPaHx79szEPhhUZgl36F+NzLQ/e1Bd13uyY1a7SqxXmZgwcH+Sn
 GXmm3oyKq8Bj6jJOn/+OD4sEVlOGCpQs7yI5o83S87uX9OsVr+nTkhsseaJVphJQdqbZ
 agT4g0sdoN/P9hAKSPM9nrNoIN3NBb4r3zaWQ9tXwyaTk3LE7u/w+HMUgY2fzHgFFNys
 JFoIlko6fwQ987dtM7MumZ+SaYr/gaXCrhM8FIQwl+YBFWtjy75mHRxY6gKlzebqzNGv
 5QXw==
X-Gm-Message-State: APjAAAUKdDWD7pp94wFDwtmR5Cxz0d/2I53oGOZaDnl+dq9XedAULY45
 b8r1Hi4j2vjpkO7uTGJA6WhEOA==
X-Google-Smtp-Source: APXvYqzJ0dyt2+hyzdXxi/NcBy96mwSHUO+pPyyWhj5oMJpKDFijtNxh/f3duoRgranP7T7lVqZ1hA==
X-Received: by 2002:a37:a093:: with SMTP id
 j141mr90247251qke.244.1561122971647; 
 Fri, 21 Jun 2019 06:16:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id s23sm1691094qtk.31.2019.06.21.06.16.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Jun 2019 06:16:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1heJOk-0008Dq-Dw; Fri, 21 Jun 2019 10:16:10 -0300
Date: Fri, 21 Jun 2019 10:16:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Message-ID: <20190621131610.GK19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-2-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: x86@kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 04:40:47PM +0200, Christoph Hellwig wrote:
> This will allow sparc64 to override its ADI tags for
> get_user_pages and get_user_pages_fast.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
