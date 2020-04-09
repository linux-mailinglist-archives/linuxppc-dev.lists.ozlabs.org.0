Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0F71A2CDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 02:29:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yMT72m4XzDqXs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 10:28:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yMRQ3ylJzDr6b
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 10:27:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=NjxzIf/o; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48yMRQ0WdXz9sSh; Thu,  9 Apr 2020 10:27:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1586392050; bh=PXWqFh1mTRtSfkLYqDCpfqsvhI4Y1xX85iXsAE9NlLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NjxzIf/odfgyCxNtI8je4VE2dZ2Bzcz122kihpbHoAw/Ae2WQw2wa9wk7O+aYFVNn
 A/pmbHDporQyrH6Z09iBDfRcOoF9gE2q5nD2qofTLQjENjXdWq8ACrFs5CEnSFaLgb
 eXFkDf+H5DGMv0LXbg9ekVJym/ZQVOPzinKMiOq8HXJ5WlzZuSazi9wIACyerwj8aw
 Bq52rAudxqAmK8wbDOYyZH2UvCq5P3jTkvbL9bJYY6D4MRRBldrPwLCr+/BED1SkxV
 husjklN76TLvgkgYZRL8N9TAnvsgH58JzZqqLkKvRYJcOT6w7ShNKBJ2rjlpctCAzr
 qr7IsAxhKmEgA==
Date: Thu, 9 Apr 2020 10:27:26 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
Message-ID: <20200409002726.GA5135@blackberry>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
 <87v9majhh2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9majhh2.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: peterz@infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leonardo Bras <leonardo@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 10:21:29PM +1000, Michael Ellerman wrote:
> 
> We should be able to just allocate the rtas_args on the stack, it's only
> ~80 odd bytes. And then we can use rtas_call_unlocked() which doesn't
> take the global lock.

Do we instantiate a 64-bit RTAS these days, or is it still 32-bit?
In the old days we had to make sure the RTAS argument buffer was
below the 4GB point.  If that's still necessary then perhaps putting
rtas_args inside the PACA would be the way to go.

Paul.
