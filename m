Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A77D4689
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 05:56:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fi9DW5b/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tq0ACjKK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDysz5fpYz3cSt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 14:56:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fi9DW5b/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tq0ACjKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDys50xCBz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 14:55:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698119748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNDuXbYjtRLJzfaUrnn30bwHvtiVZ7rNQxf0BdBPcfY=;
	b=fi9DW5b/16qYTXyYR6M4Foh1E7ZidONMV/gyxc+MJGP/eEk+ZPCZVJ8XpxN/vlPodkZKwa
	tTTsuMz2WeEYA5rS5/ujKLzSPkcnpRtp5oWr+cInbLBhSLTxhxrUOF/Rdjr15UChC/JHYJ
	E1rgo9no9Wufh+kdL34K3bVOiU1Mzb0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698119749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNDuXbYjtRLJzfaUrnn30bwHvtiVZ7rNQxf0BdBPcfY=;
	b=Tq0ACjKKpK7vk3imIdEpjZxQhd7+50/aF6MlUXytv69qvIBNYcbyhi4PgfTCpOA3PkxMLk
	gknrBNvjynquGJ33KU8BIoVuWyQ7uW1FZiZBTaNzRPWRQxACUgzOAAHbhhHMjBq22g0R/M
	h1Q8pFYkeq+67e2E5TdDpqdKXI/rCqo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-nUyCnobAM5ix9yYjgAujlg-1; Mon, 23 Oct 2023 23:55:32 -0400
X-MC-Unique: nUyCnobAM5ix9yYjgAujlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8E0680F8F5;
	Tue, 24 Oct 2023 03:55:30 +0000 (UTC)
Received: from localhost (unknown [10.72.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F066D492BD9;
	Tue, 24 Oct 2023 03:55:28 +0000 (UTC)
Date: Tue, 24 Oct 2023 11:55:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/2] kexec: select CRYPTO from KEXEC_FILE instead of
 depending on it
Message-ID: <ZTdALtO2rN4FaneC@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023110308.1202042-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023110308.1202042-2-arnd@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Ard Biesheuvel <ardb@kernel.org>, Costa Shulyupin <costa.shul@redhat.com>, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org, Andrew Mort
 on <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All other users of crypto code use 'select' instead of 'depends on',
> so do the same thing with KEXEC_FILE for consistency.
> 
> In practice this makes very little difference as kernels with kexec
> support are very likely to also include some other feature that already
> selects both crypto and crypto_sha256, but being consistent here helps
> for usability as well as to avoid potential circular dependencies.
> 
> This reverts the dependency back to what it was originally before commit
> 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for
> new syscall"), which changed changed it with the comment "This should
                       ~~~~~~~~~~~~~~ typo
> be safer as "select" is not recursive", but that appears to have been
> done in error, as "select" is indeed recursive, and there are no other
> dependencies that prevent CRYPTO_SHA256 from being selected here.
> 
> Fixes: 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for new syscall")
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/Kconfig.kexec | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index bfc636d64ff2b..51f719af10e79 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -36,7 +36,8 @@ config KEXEC
>  config KEXEC_FILE
>  	bool "Enable kexec file based system call"
>  	depends on ARCH_SUPPORTS_KEXEC_FILE
> -	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
> +	select CRYPTO
> +	select CRYPTO_SHA256
>  	select KEXEC_CORE
>  	help
>  	  This is new version of kexec system call. This system call is
> -- 
> 2.39.2
> 

