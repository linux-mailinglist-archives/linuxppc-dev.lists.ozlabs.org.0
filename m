Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6C157EF39
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 15:34:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LqnNR58G4z3bpZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 23:34:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FrYYdPx9;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4F72rQCz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FrYYdPx9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4F72rQCz;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqnMn0TDKz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 23:34:12 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id C86B538BEC;
	Sat, 23 Jul 2022 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658583247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEI33x8YY3TztEtZ2KmUdMfEFtQTA+u7UV3PRyCqwv4=;
	b=FrYYdPx94t0tIRiUJ4NCYmey0bUT5iqORrJUmjUcka/P+avPXo8XtMznm+Yzu1KPoQzIhQ
	B8L79iEEk5FWxq1MPTIQN3iHT/nTdZG7nHhwEt31L+/6o2EZMwzGSbyF2QQhWH8xPKc4Id
	3LSjOtvunV4Wc01Dn1nZK2wxJIqpqqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658583247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OEI33x8YY3TztEtZ2KmUdMfEFtQTA+u7UV3PRyCqwv4=;
	b=4F72rQCzxjLkt8+OFlOXJF+MjJ6UuhwtNPX7CqCFc+VK2+yKZwBUU5pdw2Atg2s6x8l5MF
	O/asPpvdoa4UlRAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id D70502C165;
	Sat, 23 Jul 2022 13:34:06 +0000 (UTC)
Date: Sat, 23 Jul 2022 15:34:05 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Jason Wang <wangborong@cdjrlc.com>
Subject: Re: [PATCH] powerpc: Remove the static variable initialisations to 0
Message-ID: <20220723133405.GF17705@kitsune.suse.cz>
References: <20220723092436.7149-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723092436.7149-1-wangborong@cdjrlc.com>
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, paulus@samba.org, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Sat, Jul 23, 2022 at 05:24:36PM +0800, Jason Wang wrote:
> Initialise global and static variable to 0 is always unnecessary.
> Remove the unnecessary initialisations.

Isn't this change also unnecessary?

Initializing to 0 does not affect correctness, or even any kind of
semantics in any way.

The current code is slightly easier to understand.

And changing the code introduces history noise for na gain.

Thanks

Michal

> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  arch/powerpc/kexec/core_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index c2bea9db1c1e..2407214e3f41 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -135,7 +135,7 @@ notrace void kexec_copy_flush(struct kimage *image)
>  
>  #ifdef CONFIG_SMP
>  
> -static int kexec_all_irq_disabled = 0;
> +static int kexec_all_irq_disabled;
>  
>  static void kexec_smp_down(void *arg)
>  {
> -- 
> 2.35.1
> 
