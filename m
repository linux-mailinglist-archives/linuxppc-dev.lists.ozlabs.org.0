Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDF797A30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:33:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o6uJrfKH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DDIaMkob;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhRD4471lz3cF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:33:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=o6uJrfKH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DDIaMkob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhRC95nzMz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 03:32:37 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id DCD5421863;
	Thu,  7 Sep 2023 17:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694107953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGYwNz03YulIsCZJihrmGVpNxcONlEpOhJ+MXjB3s8s=;
	b=o6uJrfKHoe+ZkVeE08Z1gTMkBmZRxXI2whJMFzZkaEeFwVzuKzFMAVvHaqTXlK6/4R5MQC
	zJUbGx1QCTskck5km0fo4IuLs1xamWY1RKF8XSRPXJYEghVyyO4Oqljiy6MAHf9X/xYU2a
	2zPepL4+pyQTUiLnlNr4wvNgWDSYVJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694107953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGYwNz03YulIsCZJihrmGVpNxcONlEpOhJ+MXjB3s8s=;
	b=DDIaMkobFd5PRkWIdSVin4Dk8AwHbj04k3n4tXkUXxWLz354QyfXO+eICI/+qZfUcriRpg
	/UBmV/H1vLfp7SBA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 6B70A2C143;
	Thu,  7 Sep 2023 17:32:33 +0000 (UTC)
Date: Thu, 7 Sep 2023 19:32:32 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linux-integrity@vger.kernel.org
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
Message-ID: <20230907173232.GD8826@kitsune.suse.cz>
References: <20230907165224.32256-1-msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907165224.32256-1-msuchanek@suse.de>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding more CC's from the original patch, looks like get_maintainers is
not that great for this file.

On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> No other platform needs CA_MACHINE_KEYRING, either.
> 
> This is policy that should be decided by the administrator, not Kconfig
> dependencies.
> 
> cc: joeyli <jlee@suse.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  security/integrity/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
> index 232191ee09e3..b6e074ac0227 100644
> --- a/security/integrity/Kconfig
> +++ b/security/integrity/Kconfig
> @@ -68,8 +68,6 @@ config INTEGRITY_MACHINE_KEYRING
>  	depends on INTEGRITY_ASYMMETRIC_KEYS
>  	depends on SYSTEM_BLACKLIST_KEYRING
>  	depends on LOAD_UEFI_KEYS || LOAD_PPC_KEYS
> -	select INTEGRITY_CA_MACHINE_KEYRING if LOAD_PPC_KEYS
> -	select INTEGRITY_CA_MACHINE_KEYRING_MAX if LOAD_PPC_KEYS
>  	help
>  	 If set, provide a keyring to which Machine Owner Keys (MOK) may
>  	 be added. This keyring shall contain just MOK keys.  Unlike keys
> -- 
> 2.41.0
> 
