Return-Path: <linuxppc-dev+bounces-16286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJpxNxRLdmk6PAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jan 2026 17:55:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CAF8182C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jan 2026 17:55:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dzd8W1wD3z2yGM;
	Mon, 26 Jan 2026 03:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769360139;
	cv=none; b=aG2GA87e0w0xH58FwjQ11j+pOBAEN35fvxKV/XeKqvyS5wK8rJnhbMGUElDVDwG8SwjFa22ZtYcOjBLUznlqgCNeGcoR5RGrxO7qHDN5C0i1BWe4XGjVjZz4aqqLMk5n97P7b887Ef2dem/7g2E6Rxb/8gZ8jbmEpAyjcNZ3lu86x5EFc3bjrckzNqaNO6WSvMc8gkrFjOr/5PdoVN41VlzIWDLmh7gXSLLhZ1hNph0wJUAJ879+Kk3vwuLAXJ/SMYwAmY4jGTz0arKLDsWKekkGRG0a0T8CGxzE/6+ge66bRG498tbLJm2THVTJJwpWRpJaHeJuL61E54Plhqg8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769360139; c=relaxed/relaxed;
	bh=U21Fd29dqbokW+KS70MIPRJzDnRnrmC2syVx+T80PJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYB0Xb84SM2ZcyIIYyUvBE9K0D/8KB+m8LffFZJ3PXeYNdeba69NKJKXrP72mf+fliDaPfvz8cacU8QclsOQBR+mSatEMoSiQQIHPff14/TRrnH99GHROGcOeELw0jwx9XF3AecxF9fNcBsSw43QpNW+L7BKQwND+bWY7IARVy2uVgUWK8kerwAHQ9KXv5YdHi1VX9TVpprdpK4ek0LBRYKDW16A+w94D374gnYPUZ58uYM/HOGBUTMS7a2YTPmpfdjdY7jXqq6oLIiVka5jBr82Hi3m/DezQDrObEeIR9PlzI0kmbgMxtSI4HzBLNJyjRkknwxIsnjyS5AmYg9E2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eEZOa2Vs; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eEZOa2Vs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dzd8V2t4Yz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jan 2026 03:55:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B740600C3;
	Sun, 25 Jan 2026 16:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494EAC4CEF1;
	Sun, 25 Jan 2026 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769360129;
	bh=e601XR9Ll0fGNQhfmDvffrnFWUouTHvrVak62rZBKlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEZOa2Vs4uilLdPA6iMJI6//97wEsCTcLBqoH0VwIzyH0OTUwt7pHxO35O2Mm9fGJ
	 u55F1AFt6NWDHM74bZUHkinvFdCWZDHdQz3fIQGSw/ppp40qvHE+YJtK6glzlKn8NK
	 Ue0fp8CbEHnOmN6+wEGSgvfTrEvPvlkwejHPVsWIW457nFF3X6hcl4PmJsnvpvE0Pd
	 RVrFc1qteJrfP5hjRkwhOORnB/bdgVtPvsRfGtk/hvz6ROatMwMj2kwU2keRZeAgNs
	 NmvE2uwPb7WgE6lhi4CJBxKcBWhTZCkw7zwSDUtnfilwBDiI3LgOHfZxCbaxq3vKkG
	 5ydaUTXb1j1PQ==
Date: Sun, 25 Jan 2026 18:55:25 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	James.Bottomley@hansenpartnership.com, zohar@linux.ibm.com,
	nayna@linux.ibm.com, stefanb@linux.ibm.com, rnsastry@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/2] keys/trusted_keys: fix handle passed to
 tpm_buf_append_name during unseal
Message-ID: <aXZK_aamKlxqNJ3H@kernel.org>
References: <20260123165504.461607-1-ssrish@linux.ibm.com>
 <20260123165504.461607-2-ssrish@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123165504.461607-2-ssrish@linux.ibm.com>
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URI_WP_DIRINDEX autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16286-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jarkko@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,hansenpartnership.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:ssrish@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@hansenpartnership.com,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:stefanb@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E1CAF8182C
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:25:03PM +0530, Srish Srinivasan wrote:
> TPM2_Unseal[1] expects the handle of a loaded data object, and not the
> handle of the parent key. But the tpm2_unseal_cmd provides the parent
> keyhandle instead of blob_handle for the session HMAC calculation. This
> causes unseal to fail.
> 
> Fix this by passing blob_handle to tpm_buf_append_name().
> 
> Fixes: 6e9722e9a7bf ("tpm2-sessions: Fix out of range indexing in name_size")
> 
> References:
> [1] trustedcomputinggroup.org/wp-content/uploads/
>     Trusted-Platform-Module-2.0-Library-Part-3-Version-184_pub.pdf
> 
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index a7ea4a1c3bed..6340823f8b53 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -465,7 +465,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>  }
>  
>  /**
> - * tpm2_unseal_cmd() - execute a TPM2_Unload command
> + * tpm2_unseal_cmd() - execute a TPM2_Unseal command
>   *
>   * @chip: TPM chip to use
>   * @payload: the key data in clear and encrypted form
> @@ -498,7 +498,7 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>  		return rc;
>  	}
>  
> -	rc = tpm_buf_append_name(chip, &buf, options->keyhandle, NULL);
> +	rc = tpm_buf_append_name(chip, &buf, blob_handle, NULL);
>  	if (rc)
>  		goto out;
>  
> -- 
> 2.43.0
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

And applied. I also need to check what is wrong with my QA because
it should have catched this.

BR, Jarkko

