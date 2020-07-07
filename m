Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C3F217829
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:44:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1XvM4CKyzDr3R
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 05:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=IujifQ0e; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1XsV0Jk6zDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 05:42:53 +1000 (AEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A4B4206BE;
 Tue,  7 Jul 2020 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594150971;
 bh=WRRYLCgZnd2780qdBRvybDvPfbNLjAwXVVAukZ8p9u8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IujifQ0eNnJgt/NFDognNxZrmL7sVVro1UrnqBQ7Loix4T9tXb7873VFsUoxhcErN
 ULoVewuWhpw0vppskiw/m40H6FAbxUjRFR5zMFQSufX3+lAg8FV84zXYaPZjfJ427k
 ITSWxIjEpVsqcu5ebcLqR7kEix3K6Nf4+Gwoa6L8=
Date: Tue, 7 Jul 2020 22:42:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 20/20] Documentation: vm/memory-model: eliminate
 duplicated word
Message-ID: <20200707194228.GB128651@kernel.org>
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-20-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707180414.10467-20-rdunlap@infradead.org>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Dan Murphy <dmurphy@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 07, 2020 at 11:04:13AM -0700, Randy Dunlap wrote:
> Drop the doubled word "the".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org

Reviewed-by: Mike Rapoport <rppt@kernel.org>

> ---
>  Documentation/vm/memory-model.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/vm/memory-model.rst
> +++ linux-next-20200701/Documentation/vm/memory-model.rst
> @@ -159,7 +159,7 @@ frame. Inside a section, the PFN is the
>  The sparse vmemmap uses a virtually mapped memory map to optimize
>  pfn_to_page and page_to_pfn operations. There is a global `struct
>  page *vmemmap` pointer that points to a virtually contiguous array of
> -`struct page` objects. A PFN is an index to that array and the the
> +`struct page` objects. A PFN is an index to that array and the
>  offset of the `struct page` from `vmemmap` is the PFN of that
>  page.
>  

-- 
Sincerely yours,
Mike.
