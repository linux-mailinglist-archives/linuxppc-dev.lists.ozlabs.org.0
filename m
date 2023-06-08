Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEA7280FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 15:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcPrX0y10z3f14
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 23:17:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O32Exwy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O32Exwy5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcPqb1xCCz3cds
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 23:16:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 938B264D66;
	Thu,  8 Jun 2023 13:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7D8C433EF;
	Thu,  8 Jun 2023 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686230183;
	bh=FvlFmDL5KCFEx9RvnVpnGFUOv20bbkmDzfuLyHmyB74=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=O32Exwy5L6D1wCaregDWkVfkcIieWz/F539ZmalzqXD2OlkpaOHkKLhbUs/uu1ntM
	 4UMzjKV+ChnS/yGysMukc7xH/wxjVkeRjjgLHS2UHPm85UJFKJxoNVaTOVn8ibHr+5
	 S0APT8iSF+LXtnrZMjqGxCqECpwHR/6Jccnwbko54Cn2euX5NraD3fz/FTGZAdartT
	 kFNLKQGs3MWp2+SOjiSw51SdAbG3waqkhx6W4gACUeGDpb5noEmuzDUmBr/jxI4QKj
	 Nv9oZi61lx7fNdRq4HUiGPsGyp9PQ3eQGHlu3OFLJZSvZYNpnnEZnCnIVqmhA3i0S2
	 K06GRvzSXB0NQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jun 2023 16:16:18 +0300
Message-Id: <CT7APLUB2CWF.1ZGTUWOTPQGQH@suppilovahvero>
Subject: Re: [PATCH v2] security/integrity: fix pointer to ESL data and its
 size on pseries
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nayna Jain" <nayna@linux.ibm.com>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>, "linux-integrity"
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230608120444.382527-1-nayna@linux.ibm.com>
In-Reply-To: <20230608120444.382527-1-nayna@linux.ibm.com>
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
Cc: stable@vger.kenrnel.org, Andrew Donnellan <ajd@linux.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Russell Currey <ruscur@russell.cc>, George
 Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jun 8, 2023 at 3:04 PM EEST, Nayna Jain wrote:
> On PowerVM guest, variable data is prefixed with 8 bytes of timestamp.
> Extract ESL by stripping off the timestamp before passing to ESL parser.
>
> Fixes: 4b3e71e9a34c ("integrity/powerpc: Support loading keys from PLPKS"=
)
> Cc: stable@vger.kenrnel.org # v6.3
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
> Changelog:
> v2: Fixed feedback from Jarkko
>       * added CC to stable
>       * moved *data declaration to same line as *db,*dbx
>     Renamed extract_data() macro to extract_esl() for clarity
>  .../integrity/platform_certs/load_powerpc.c   | 40 ++++++++++++-------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/=
integrity/platform_certs/load_powerpc.c
> index b9de70b90826..170789dc63d2 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -15,6 +15,9 @@
>  #include "keyring_handler.h"
>  #include "../integrity.h"
> =20
> +#define extract_esl(db, data, size, offset)	\
> +	do { db =3D data + offset; size =3D size - offset; } while (0)
> +
>  /*
>   * Get a certificate list blob from the named secure variable.
>   *
> @@ -55,8 +58,9 @@ static __init void *get_cert_list(u8 *key, unsigned lon=
g keylen, u64 *size)
>   */
>  static int __init load_powerpc_certs(void)
>  {
> -	void *db =3D NULL, *dbx =3D NULL;
> -	u64 dbsize =3D 0, dbxsize =3D 0;
> +	void *db =3D NULL, *dbx =3D NULL, *data =3D NULL;
> +	u64 dsize =3D 0;
> +	u64 offset =3D 0;
>  	int rc =3D 0;
>  	ssize_t len;
>  	char buf[32];
> @@ -74,38 +78,46 @@ static int __init load_powerpc_certs(void)
>  		return -ENODEV;
>  	}
> =20
> +	if (strcmp("ibm,plpks-sb-v1", buf) =3D=3D 0)
> +		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of =
timestamp */
> +		offset =3D 8;
> +
>  	/*
>  	 * Get db, and dbx. They might not exist, so it isn't an error if we
>  	 * can't get them.
>  	 */
> -	db =3D get_cert_list("db", 3, &dbsize);
> -	if (!db) {
> +	data =3D get_cert_list("db", 3, &dsize);
> +	if (!data) {
>  		pr_info("Couldn't get db list from firmware\n");
> -	} else if (IS_ERR(db)) {
> -		rc =3D PTR_ERR(db);
> +	} else if (IS_ERR(data)) {
> +		rc =3D PTR_ERR(data);
>  		pr_err("Error reading db from firmware: %d\n", rc);
>  		return rc;
>  	} else {
> -		rc =3D parse_efi_signature_list("powerpc:db", db, dbsize,
> +		extract_esl(db, data, dsize, offset);
> +
> +		rc =3D parse_efi_signature_list("powerpc:db", db, dsize,
>  					      get_handler_for_db);
>  		if (rc)
>  			pr_err("Couldn't parse db signatures: %d\n", rc);
> -		kfree(db);
> +		kfree(data);
>  	}
> =20
> -	dbx =3D get_cert_list("dbx", 4,  &dbxsize);
> -	if (!dbx) {
> +	data =3D get_cert_list("dbx", 4,  &dsize);
> +	if (!data) {
>  		pr_info("Couldn't get dbx list from firmware\n");
> -	} else if (IS_ERR(dbx)) {
> -		rc =3D PTR_ERR(dbx);
> +	} else if (IS_ERR(data)) {
> +		rc =3D PTR_ERR(data);
>  		pr_err("Error reading dbx from firmware: %d\n", rc);
>  		return rc;
>  	} else {
> -		rc =3D parse_efi_signature_list("powerpc:dbx", dbx, dbxsize,
> +		extract_esl(dbx, data, dsize, offset);
> +
> +		rc =3D parse_efi_signature_list("powerpc:dbx", dbx, dsize,
>  					      get_handler_for_dbx);
>  		if (rc)
>  			pr_err("Couldn't parse dbx signatures: %d\n", rc);
> -		kfree(dbx);
> +		kfree(data);
>  	}
> =20
>  	return rc;
> --=20
> 2.31.1

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
