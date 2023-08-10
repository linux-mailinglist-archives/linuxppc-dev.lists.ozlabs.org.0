Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E47782B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 23:31:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IMqNoFk7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMKqt75GGz3c3h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 07:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IMqNoFk7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMKq02nTdz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 07:30:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B33F64FA2;
	Thu, 10 Aug 2023 21:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAF1C433C7;
	Thu, 10 Aug 2023 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691703049;
	bh=HwppCFPvwSwZx+wlLwGlbLVfLPSGego30HtZ0L4HvQM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IMqNoFk7JXYVGd6jH3jDBTjTxiqE9IECKfWOkS6Qgk+rlo/KlU+QnlNlYqbvL7xU7
	 QjYJ+UJ3yRGp2MKUCD8dfs52rRrJs3Flo1O+HmgKWdFqFtn+kHB4nTgIGJf1h4BriQ
	 WAHbapPKuNOmohS74HIji0NgKai1JhjArjU+8f3EQ/Osq1g35mmmjSjFwQ/8YojfMm
	 IQEiax56RX6H+YMhT1eF5XXn7VDf4WbH/nAbvp4lwBFE15V4DBiwVX85u8f2Sj0YOU
	 tLVw7srzl7npvlNs0TTZcQaMccVhem8KpHfKUkeyOsej/E98BQ37fpaogkc5Ut/RM6
	 cXqAbdqCs6jQw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Aug 2023 00:30:45 +0300
Message-Id: <CUP6OI811G6B.1TN6YQTBRA81A@suppilovahvero>
Subject: Re: [PATCH v2 5/6] integrity: PowerVM machine keyring enablement
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nayna Jain" <nayna@linux.ibm.com>, <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230809195315.1085656-1-nayna@linux.ibm.com>
 <20230809195315.1085656-6-nayna@linux.ibm.com>
In-Reply-To: <20230809195315.1085656-6-nayna@linux.ibm.com>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-security-module@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 9, 2023 at 10:53 PM EEST, Nayna Jain wrote:
> Update Kconfig to enable machine keyring and limit to CA certificates
> on PowerVM. Only key signing CA keys are allowed.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
>
> ---
>  security/integrity/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
> index ec6e0d789da1..232191ee09e3 100644
> --- a/security/integrity/Kconfig
> +++ b/security/integrity/Kconfig
> @@ -67,7 +67,9 @@ config INTEGRITY_MACHINE_KEYRING
>  	depends on SECONDARY_TRUSTED_KEYRING
>  	depends on INTEGRITY_ASYMMETRIC_KEYS
>  	depends on SYSTEM_BLACKLIST_KEYRING
> -	depends on LOAD_UEFI_KEYS
> +	depends on LOAD_UEFI_KEYS || LOAD_PPC_KEYS
> +	select INTEGRITY_CA_MACHINE_KEYRING if LOAD_PPC_KEYS
> +	select INTEGRITY_CA_MACHINE_KEYRING_MAX if LOAD_PPC_KEYS
>  	help
>  	 If set, provide a keyring to which Machine Owner Keys (MOK) may
>  	 be added. This keyring shall contain just MOK keys.  Unlike keys
> --=20
> 2.31.1

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
