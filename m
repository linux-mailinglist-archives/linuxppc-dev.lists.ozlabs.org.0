Return-Path: <linuxppc-dev+bounces-1346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAE9788DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 21:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X542k2RnZz2xWZ;
	Sat, 14 Sep 2024 05:22:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726255374;
	cv=none; b=BpbuxNuDloh4ifEObwr1AKwAUgBLci/l3j6Lgb9MLsN2jmh02e7BqOD8+i5NUmr8ypZ1ruGaBza1w2J9ITmcs1z6QsI5u0g96jY8++4XupRvngrbYVPxKYktXutcj/v3h67r163epK0MPWvluOxNqvVpYhMbNMsbLho7WFAckA3Y66XENJN7KxH17BLuAhbSgJQBO6vLipuUrl9QDuCH46Y1PjiJX642ZnTr3S8zzKZCY+bjBcvCkWEQelNzbwva8mQwaZ9DC0up1VhLapQkx/8H8EWA88mgH5CAnbmWpxu3bthPkLRq4rqxIxOtVJJAgtigFj79zO7cETDCXgeO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726255374; c=relaxed/relaxed;
	bh=Lj/20hT1fbEbqfuXUYTZnnoIn58aQxQZGwFa+ktq7nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ht/tP8GVecC80QTUqwdGN0DIZcS55AoAeurzwFC4Kpv1xzCYnxzgbO1G1636LMonbx5QdLgLGP5xdNkad86wnwDdS25c168SNKVBiEIFT/BzCTXrNJXYGcdCEWqyxDWRCPCgjmw5sD0VmP1LXOd3hDsovtJ17MbEOAPZCl6+QE1sXEHK8EWpd0IIQx7SyRW+sQS5HI9n8+1TmjIb4yzr6mfDe18hHzxbG5Yyxm6lm6kV7vUDVzcH72mwwHossuHF1rTI67mV46V4+FFUuos/TJJ3kNH7FhArT+6rmV/zErqaOLdBWcb4pDmU42UGVd0FoLYePUPXeCcloB/qXvrb/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X542c59x6z2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 05:22:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Lj/20hT1fbEbqfuXUYTZnnoIn58aQxQZGwFa+ktq7nI=; b=USrHQTI1gAhLcewwZyHVEmvH+2
	TNfnavn0WmWrViQukWcWKUEDmPzjkL0xEn1n8BhzZwM9T+pwhTzsxu91hYIN57ewocp9cvGn/UA9h
	nDPIR2H17TcSfPO62NYQFrX+48iHo8fHvr6GrMEtD8iooOIvFUsMxuKi87bCzAB34fqozCVoNjSNC
	cpOr1cYF4oyo7BePpJi8MDiU+JbLFkyunDgG7G5HXPIm3h1euuqWGrhgPNe7+s9uz06ECd2yN2e2B
	aBqS8T/VdHWgpwDvegaDqeaa/dxE/40oEXpmQ0ir9IEHYYp5g05SJG4iHMwNc/A4JtR8h5YehcBCc
	O4d4pjaA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spBsC-0000000GuqH-2j63;
	Fri, 13 Sep 2024 19:22:28 +0000
Date: Fri, 13 Sep 2024 20:22:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
Message-ID: <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
References: <20240913192036.3289003-1-almasrymina@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913192036.3289003-1-almasrymina@google.com>

On Fri, Sep 13, 2024 at 07:20:36PM +0000, Mina Almasry wrote:
> +++ b/include/linux/page-flags.h
> @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
>  {
>  	unsigned long head = READ_ONCE(page->compound_head);
>  
> -	if (unlikely(head & 1))
> -		return head - 1;
> +	if (unlikely(head & 1UL))
> +		return head & ~1UL;
>  	return (unsigned long)page_fixed_fake_head(page);

NAK, that pessimises compound_head().

