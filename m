Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC277BF25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 19:39:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DYPXQrxy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPhTm6ggMz3cRH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 03:39:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DYPXQrxy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPhSd3rjRz3cNH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 03:38:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37BA864224;
	Mon, 14 Aug 2023 17:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D275C433C8;
	Mon, 14 Aug 2023 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692034685;
	bh=NFNbSyjv17b+lF//gANxT8L/sCCriZnvzsLC3xBq94A=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=DYPXQrxyP8fJPDfqFP5/jHAr326fZC5KdUS2IrCNuO+bmPmeS2l+E6V5oXBOUIcyw
	 Q6opF8jgnu9V9HrIUrGAFRSYIajgM47cWAyIBehCYM291TO4st4Gh9OYldqZ3eidou
	 97Fk1+djLpyzm9ix6uj94ScvDyIfdRm5dzODkHmKQhKydV7iTbFRHHdSex6vwXOPrD
	 r7X2E8GbE9IGlrjjdupLeRCVKEluDHd0UyptM0A0o9HTyV8SjbWYrw8Ru3frHdWr6C
	 Sq9qB4Mf6XFbmZDBY1XOlaWawxfKlw1fkoJYpHeGewidkdRYIrpBdIQhIzTmU2Z+x5
	 t+emshCqr9l9w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Aug 2023 20:38:01 +0300
Message-Id: <CUSG8HX9J4L0.37OHE7QHLL9N7@suppilovahvero>
Subject: Re: [PATCH v3 2/6] integrity: ignore keys failing CA restrictions
 on non-UEFI platform
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nayna Jain" <nayna@linux.ibm.com>, <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230813021531.1382815-1-nayna@linux.ibm.com>
 <20230813021531.1382815-3-nayna@linux.ibm.com>
In-Reply-To: <20230813021531.1382815-3-nayna@linux.ibm.com>
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

On Sun Aug 13, 2023 at 5:15 AM EEST, Nayna Jain wrote:
> On non-UEFI platforms, handle restrict_link_by_ca failures differently.
>
> Certificates which do not satisfy CA restrictions on non-UEFI platforms
> are ignored.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  security/integrity/platform_certs/machine_keyring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/integrity/platform_certs/machine_keyring.c b/securi=
ty/integrity/platform_certs/machine_keyring.c
> index 7aaed7950b6e..389a6e7c9245 100644
> --- a/security/integrity/platform_certs/machine_keyring.c
> +++ b/security/integrity/platform_certs/machine_keyring.c
> @@ -36,7 +36,7 @@ void __init add_to_machine_keyring(const char *source, =
const void *data, size_t
>  	 * If the restriction check does not pass and the platform keyring
>  	 * is configured, try to add it into that keyring instead.
>  	 */
> -	if (rc && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING))
> +	if (rc && efi_enabled(EFI_BOOT) && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM=
_KEYRING))
>  		rc =3D integrity_load_cert(INTEGRITY_KEYRING_PLATFORM, source,
>  					 data, len, perm);
> =20
> --=20
> 2.31.1

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
