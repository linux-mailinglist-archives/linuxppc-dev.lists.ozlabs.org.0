Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7B4EAE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 16:43:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VhJb2QJTzDq6J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 00:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="JBhYcKNb"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VhG738ldzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 00:41:34 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id d17so7089092qtj.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iAefoNx0q/97YiPDebPSTk9gILnOd0FXIWcUIRJLLtA=;
 b=JBhYcKNbnw5KS/Bw3jUGnXGizAYOGrGCynlCyAlg63WK1n8IqOySZ1+bye3/YiT63n
 v8/sbGh4AD1MHRynheN2Dlq8lFKIq7z1NImXxzvLdoGCc7lemxe5AEO2L8rqLF3E00oD
 oaCz+g/xDkcmsm0KQgBXxPRK1i/pBAcltUXftd0yNlKSLRQGkTTISqj5EmoKiqW1z/7C
 xGMPI7hpBo4aEfjJYbvL1QdYdl0bqL8gAEgqgeQ8mr+Rnu3ZBMhGaV4qz/zk8iv9SFhb
 jZCzIqRVkaT3gufXwch0VFa0geY+UKfMoNAoGmczoezyVySF3//gJOB7bFyrvTarIu6t
 jP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iAefoNx0q/97YiPDebPSTk9gILnOd0FXIWcUIRJLLtA=;
 b=jfPh5K+mMOGh6TCosx1bIfJ1Hp6mYR/raq6HICw1MFcafLFzrgSE1+5dCtnWG6y9QI
 yy3h39EeXsWF+2bV7Ps1HxbmDUHz3y1uPqEOvjZo+//Sr5sg5UHK3MsQ1ntVpn5CL9x8
 TwAlqrupzkBUhoS2YenO3glF1omcbZYc2en+e6Zk/UDEGbbxfrgjVD+UrctqdmpyfhgE
 Vlr7OXfaTL3YJOZVlBx49glXBzBYm9hAew3WxogcKoDFKmra34jsztNIkjb+ee2tAD5U
 ed2/4tGcFPspVYPsTrPjNIbKN0zE+3OWe48iR7WhhhMQHBrkt29WP2x6BhtH0lfOOLJA
 BL0w==
X-Gm-Message-State: APjAAAXb3pX4HbWZ54GEYxAIt8dNxXV//GUTp/B+5ekbBwtgRZ2Txpl2
 eUphb1be5fBU3PEIEdBQI0LdPg==
X-Google-Smtp-Source: APXvYqwAiNjv+b7qPtfzYMe/a9zWSjQhOq9v3skvi7StNK2ILH/OsN4mGdlL0jsjEcF4n4D7/7paYA==
X-Received: by 2002:a0c:b12b:: with SMTP id q40mr15375817qvc.0.1561128092068; 
 Fri, 21 Jun 2019 07:41:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id c55sm1767604qtk.53.2019.06.21.07.41.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Jun 2019 07:41:31 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1heKjL-0000un-67; Fri, 21 Jun 2019 11:41:31 -0300
Date: Fri, 21 Jun 2019 11:41:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/16] mm: consolidate the get_user_pages* implementations
Message-ID: <20190621144131.GQ19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-12-hch@lst.de>
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

On Tue, Jun 11, 2019 at 04:40:57PM +0200, Christoph Hellwig wrote:
> @@ -2168,7 +2221,7 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
>   */
>  static bool gup_fast_permitted(unsigned long start, unsigned long end)
>  {
> -	return true;
> +	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;

The ?: is needed with IS_ENABLED?

>  }
>  #endif

Oh, you fixed the util.c this way instead of the headerfile
#ifdef..

I'd suggest to revise this block a tiny bit:

-#ifndef gup_fast_permitted
+#if !IS_ENABLED(CONFIG_HAVE_FAST_GUP) || !defined(gup_fast_permitted)
 /*
  * Check if it's allowed to use __get_user_pages_fast() for the range, or
  * we need to fall back to the slow version:
  */
-bool gup_fast_permitted(unsigned long start, int nr_pages)
+static bool gup_fast_permitted(unsigned long start, int nr_pages)
 {

Just in case some future arch code mismatches the header and kconfig..

Regards,
Jason
