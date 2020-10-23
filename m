Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14781296870
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 04:09:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHSMv09wxzDr32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 13:09:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHSL966QgzDqxh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 13:07:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XN4TWA2G; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CHSL7224qz9sSW;
 Fri, 23 Oct 2020 13:07:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603418865;
 bh=2wOOWjsThqrRIuYHegSLgBdfvQnpIlCV69Pl6Zthnic=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XN4TWA2G0k9IpwryRhNwOYSkcZT99cdaPf9vQLHGnu84J2SYuZZbJKi/9GX4NN114
 cjOzFGd72FvW8dnJNcn0qtIEzzSAokNE7I6dnJleHlDYbS7HujM4kYBhERaVELCEO2
 vdCfi6MlZ3FpzvFyrj9IkWy+MX19D3HCD9+qyXwSGr0y/e1rhufU0k5kr3qs3eVGri
 FeDFEiw7Y0lg4B9I/fKsb1LnMObLY3LG4GXKsuGBDL7aPCkUiSAX7c4KyZrresWMyl
 /xJPmLePNX+PWyDAXi3fygPrMaNwqo7c6YK6z7OeDeJWr5aCjc+znpaj0ZlXBvDoma
 4g1pGrl04pYuA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/powerpc/eeh: disable kselftest timeout setting
 for eeh-basic
In-Reply-To: <20201022083616.41666-1-po-hsu.lin@canonical.com>
References: <20201022083616.41666-1-po-hsu.lin@canonical.com>
Date: Fri, 23 Oct 2020 13:07:41 +1100
Message-ID: <87a6wdy9si.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: joe.lawrence@redhat.com, mathieu.desnoyers@efficios.com,
 po-hsu.lin@canonical.com, mbenes@suse.cz, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Po-Hsu Lin <po-hsu.lin@canonical.com> writes:
> The eeh-basic test got its own 60 seconds timeout (defined in commit
> 414f50434aa2 "selftests/eeh: Bump EEH wait time to 60s") per breakable
> device.
>
> And we have discovered that the number of breakable devices varies
> on different hardware. The device recovery time ranges from 0 to 35
> seconds. In our test pool it will take about 30 seconds to run on a
> Power8 system that with 5 breakable devices, 60 seconds to run on a
> Power9 system that with 4 breakable devices.
>
> Thus it's better to disable the default 45 seconds timeout setting in
> the kselftest framework to give it a chance to finish. And let the
> test to take care of the timeout control.

I'd prefer if we still had some timeout, maybe 5 or 10 minutes? Just in
case the test goes completely bonkers.

cheers

> diff --git a/tools/testing/selftests/powerpc/eeh/Makefile b/tools/testing/selftests/powerpc/eeh/Makefile
> index b397bab..ae963eb 100644
> --- a/tools/testing/selftests/powerpc/eeh/Makefile
> +++ b/tools/testing/selftests/powerpc/eeh/Makefile
> @@ -3,7 +3,7 @@ noarg:
>  	$(MAKE) -C ../
>  
>  TEST_PROGS := eeh-basic.sh
> -TEST_FILES := eeh-functions.sh
> +TEST_FILES := eeh-functions.sh settings
>  
>  top_srcdir = ../../../../..
>  include ../../lib.mk
> diff --git a/tools/testing/selftests/powerpc/eeh/settings b/tools/testing/selftests/powerpc/eeh/settings
> new file mode 100644
> index 0000000..e7b9417
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/eeh/settings
> @@ -0,0 +1 @@
> +timeout=0
> -- 
> 2.7.4
