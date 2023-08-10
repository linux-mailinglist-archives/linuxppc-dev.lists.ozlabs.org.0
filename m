Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A73777C67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 17:39:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bqQ66ydZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMB1g6kQmz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 01:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bqQ66ydZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMB0r0qKQz30JF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 01:38:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3D8366060;
	Thu, 10 Aug 2023 15:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DB7C433C8;
	Thu, 10 Aug 2023 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691681929;
	bh=xnhTYpWPIFOHSG3sk7givZEYBgSpBgHnBgsNcE+4edw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=bqQ66ydZ97kMwJSbyiqdJXhdFJImIqG1tDWd2g0EI+CMMAa6fEZba1i0OVQbv/h2S
	 jXwC+xUG6l7x3FPFotosyygXgry40zyrgpKF8CxO9XxDKhm+1wC1MRmJ9IPkwiHxPT
	 tbKLI991PilX3gXXVPNurkACT6n3xSkD6g5WqfLv8EmYERYfkUNqr15XxgyiGd8KIu
	 wj0HXAmoYdwqN5fTeoinZlT9oZY5TXxbAhyFLSSe11vhcC13uMoN2cPKiOu7iR7Fnf
	 LFEJzjSy1uq++EY9nul1ZmFZ+7cGFQZxgRbQnD6QyM2UxgxmP8Gi6hvGelObSjK17e
	 3m+X18AH1x19A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Aug 2023 18:38:39 +0300
Message-Id: <CUOZ6XAVQ7DS.2UB3SEOKGXOBX@wks-101042-mac.ad.tuni.fi>
Subject: Re: [PATCH v2 3/6] integrity: remove global variable from
 machine_keyring.c
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nayna Jain" <nayna@linux.ibm.com>, <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20230809195315.1085656-1-nayna@linux.ibm.com>
 <20230809195315.1085656-4-nayna@linux.ibm.com>
In-Reply-To: <20230809195315.1085656-4-nayna@linux.ibm.com>
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
> trust_mok variable is accessed within a single function locally.
>
> Change trust_mok from global to local static variable.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-and-tested-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  security/integrity/platform_certs/machine_keyring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/security/integrity/platform_certs/machine_keyring.c b/securi=
ty/integrity/platform_certs/machine_keyring.c
> index 389a6e7c9245..9482e16cb2ca 100644
> --- a/security/integrity/platform_certs/machine_keyring.c
> +++ b/security/integrity/platform_certs/machine_keyring.c
> @@ -8,8 +8,6 @@
>  #include <linux/efi.h>
>  #include "../integrity.h"
> =20
> -static bool trust_mok;
> -
>  static __init int machine_keyring_init(void)
>  {
>  	int rc;
> @@ -65,9 +63,11 @@ static __init bool uefi_check_trust_mok_keys(void)
>  bool __init trust_moklist(void)
>  {
>  	static bool initialized;
> +	static bool trust_mok;
> =20
>  	if (!initialized) {
>  		initialized =3D true;
> +		trust_mok =3D false;
> =20
>  		if (uefi_check_trust_mok_keys())
>  			trust_mok =3D true;

Nice catch.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
