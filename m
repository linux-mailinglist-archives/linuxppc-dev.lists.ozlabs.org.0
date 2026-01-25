Return-Path: <linuxppc-dev+bounces-16287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALwnFzhMdmmNPAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jan 2026 18:00:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93281856
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jan 2026 18:00:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dzdGD4h8kz2yGM;
	Mon, 26 Jan 2026 04:00:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769360436;
	cv=none; b=VF2tpZSzuIbtOTCcgoYjXsBy+DyZ/NrEt+lJzkmFjbyQv5EI/FV514vxez5yedWtZsEuCGHXlEQkOYehecSooyISoO4SS0AX2SwMwD15yk1rJ6JC6toLFHD22YW+aLxlT6jzxEVe6/wcqBwok68/Mzj54q9IpZ6x2WcKJ4DYqtwx6NKXXyjr6boZa204Njj5hXtRfeZymvEfzVC2olS3r4DIBaSno0ZArmgbn2nidKDp3tY5n+n9lO6Vrefhg/xrdYgaROZrfi0xuMe+XFV3baYiXmHMPYZz3qC1EJjPFka9Af4HoAfeskxozigSDPOAyGE1fw4wNNpjOIz49VlXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769360436; c=relaxed/relaxed;
	bh=Ks348N4WvwlpN7Uq8uJzgabh1O7od4LQYskkDO3kj7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeN0xdOP0FLiej8dmT+eismOsALE7Qo5Xt9ikQ+SmEHZfVamPauStxkXRd8ydPMyOyjxI41f1jjjchqlUUQxJmcqE+vieDMXvNOzNiu2AHalauOBaouBxG3iCPFknwAFb0LBeSuRQo2EZEEWDKM7IrCpiuiUucULS8UFncTXlXWENUunOywVUUJ3P3uuCssmOs3/Q+lML8ER5AH3uf68v1pahYcWoV+pmt+yLJlDIQSuWdtekYimhUYkxxJSmaS9YyUHUc7OZ3yEWrdbMZWQ2DM/6uCDDJef+fUqjjXdHJmbCfc2wFNMEZRpfhAvZHOBtLtcRSi/scRQBYYGdpJm8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q7lDyOqS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q7lDyOqS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dzdGC5qpqz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jan 2026 04:00:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B36340960;
	Sun, 25 Jan 2026 17:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3ABC4CEF1;
	Sun, 25 Jan 2026 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769360433;
	bh=HNaH/YLTfsSk+bB4xuFuu795ZNZqlYMV3XQe25nIlLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7lDyOqSlcb1RUrMQa1YnIlq6Ad5e1/ZAi3yqIvS3pa/ozEdawUTw+DmfhVpJoG5J
	 SdfCj6ruISFjFhOZLmFHc/5xp9wWBL43li563CVLYsimFyOaU+Ntg8FvEGr88btjEn
	 bNFfvBQCLZkf6g+JnpjUXJXUkDU1tl2Htj9PcXmPyFqD6aWkfmR92ZaEGIU0/2jLm7
	 EG5MWWecpkaOrE1YmBhTi4ovH9kxu3tYDF+UnZPVtt+4ou1Ph7VofXQ2wWuRZXvBXC
	 31YTmLhkjCeWrfvIEYhCI5ffMXR0/uVbAC9jOWgIY4RXRmpUo2gyKHp40sxDXZlcCz
	 7qCdDhhYqhkoQ==
Date: Sun, 25 Jan 2026 19:00:29 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	James.Bottomley@hansenpartnership.com, zohar@linux.ibm.com,
	nayna@linux.ibm.com, stefanb@linux.ibm.com, rnsastry@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 2/2] keys/trusted_keys: move TPM-specific fields into
 trusted_tpm_options
Message-ID: <aXZMLbQ2ykqPQp48@kernel.org>
References: <20260123165504.461607-1-ssrish@linux.ibm.com>
 <20260123165504.461607-3-ssrish@linux.ibm.com>
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
In-Reply-To: <20260123165504.461607-3-ssrish@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16287-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jarkko@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,hansenpartnership.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:ssrish@linux.ibm.com,m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@hansenpartnership.com,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:stefanb@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4F93281856
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:25:04PM +0530, Srish Srinivasan wrote:
> The trusted_key_options struct contains TPM-specific fields (keyhandle,
> keyauth, blobauth_len, blobauth, pcrinfo_len, pcrinfo, pcrlock, hash,
> policydigest_len, policydigest, and policyhandle). This leads to the
> accumulation of backend-specific fields in the generic options structure.
> 
> Define trusted_tpm_options structure and move the TPM-specific fields
> there. Store a pointer to trusted_tpm_options in trusted_key_options's
> private.
> 
> No functional change intended.
> 
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  include/keys/trusted-type.h               |  11 ---
>  include/keys/trusted_tpm.h                |  14 +++
>  security/keys/trusted-keys/trusted_tpm1.c | 103 ++++++++++++++--------
>  security/keys/trusted-keys/trusted_tpm2.c |  62 ++++++++-----
>  4 files changed, 121 insertions(+), 69 deletions(-)
> 
> diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type.h
> index 03527162613f..b80f250305b8 100644
> --- a/include/keys/trusted-type.h
> +++ b/include/keys/trusted-type.h
> @@ -39,17 +39,6 @@ struct trusted_key_payload {
>  
>  struct trusted_key_options {
>  	uint16_t keytype;
> -	uint32_t keyhandle;
> -	unsigned char keyauth[TPM_DIGEST_SIZE];
> -	uint32_t blobauth_len;
> -	unsigned char blobauth[TPM_DIGEST_SIZE];
> -	uint32_t pcrinfo_len;
> -	unsigned char pcrinfo[MAX_PCRINFO_SIZE];
> -	int pcrlock;
> -	uint32_t hash;
> -	uint32_t policydigest_len;
> -	unsigned char policydigest[MAX_DIGEST_SIZE];
> -	uint32_t policyhandle;
>  	void *private;
>  };
>  
> diff --git a/include/keys/trusted_tpm.h b/include/keys/trusted_tpm.h
> index 0fadc6a4f166..355ebd36cbfd 100644
> --- a/include/keys/trusted_tpm.h
> +++ b/include/keys/trusted_tpm.h
> @@ -7,6 +7,20 @@
>  
>  extern struct trusted_key_ops trusted_key_tpm_ops;
>  
> +struct trusted_tpm_options {
> +	uint32_t keyhandle;
> +	unsigned char keyauth[TPM_DIGEST_SIZE];
> +	uint32_t blobauth_len;
> +	unsigned char blobauth[TPM_DIGEST_SIZE];
> +	uint32_t pcrinfo_len;
> +	unsigned char pcrinfo[MAX_PCRINFO_SIZE];
> +	int pcrlock;
> +	uint32_t hash;
> +	uint32_t policydigest_len;
> +	unsigned char policydigest[MAX_DIGEST_SIZE];
> +	uint32_t policyhandle;
> +};
> +
>  int tpm2_seal_trusted(struct tpm_chip *chip,
>  		      struct trusted_key_payload *payload,
>  		      struct trusted_key_options *options);
> diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
> index 636acb66a4f6..0ab0234ebe37 100644
> --- a/security/keys/trusted-keys/trusted_tpm1.c
> +++ b/security/keys/trusted-keys/trusted_tpm1.c
> @@ -50,12 +50,14 @@ enum {
>  #if TPM_DEBUG
>  static inline void dump_options(struct trusted_key_options *o)
>  {
> +	struct trusted_tpm_options *tpm_opts = o->private;


TPM context is obvious i.e., actually private would be a better name.

> +
>  	pr_info("sealing key type %d\n", o->keytype);
> -	pr_info("sealing key handle %0X\n", o->keyhandle);
> -	pr_info("pcrlock %d\n", o->pcrlock);
> -	pr_info("pcrinfo %d\n", o->pcrinfo_len);
> +	pr_info("sealing key handle %0X\n", tpm_opts->keyhandle);
> +	pr_info("pcrlock %d\n", tpm_opts->pcrlock);
> +	pr_info("pcrinfo %d\n", tpm_opts->pcrinfo_len);
>  	print_hex_dump(KERN_INFO, "pcrinfo ", DUMP_PREFIX_NONE,
> -		       16, 1, o->pcrinfo, o->pcrinfo_len, 0);
> +		       16, 1, tpm_opts->pcrinfo, tpm_opts->pcrinfo_len, 0);
>  }

Should be replaced with pr_debug() and KERN_DEBUG as precursory patch
(and remove TPM_DEBUG).

>  
>  static inline void dump_sess(struct osapsess *s)
> @@ -624,6 +626,7 @@ static int tpm_unseal(struct tpm_buf *tb,
>  static int key_seal(struct trusted_key_payload *p,
>  		    struct trusted_key_options *o)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	struct tpm_buf tb;
>  	int ret;
>  
> @@ -634,9 +637,12 @@ static int key_seal(struct trusted_key_payload *p,
>  	/* include migratable flag at end of sealed key */
>  	p->key[p->key_len] = p->migratable;
>  
> -	ret = tpm_seal(&tb, o->keytype, o->keyhandle, o->keyauth,
> +	tpm_opts = o->private;

Not sure why this is not done in the declaration.

> +
> +	ret = tpm_seal(&tb, o->keytype, tpm_opts->keyhandle, tpm_opts->keyauth,
>  		       p->key, p->key_len + 1, p->blob, &p->blob_len,
> -		       o->blobauth, o->pcrinfo, o->pcrinfo_len);
> +		       tpm_opts->blobauth, tpm_opts->pcrinfo,
> +		       tpm_opts->pcrinfo_len);
>  	if (ret < 0)
>  		pr_info("srkseal failed (%d)\n", ret);
>  
> @@ -650,6 +656,7 @@ static int key_seal(struct trusted_key_payload *p,
>  static int key_unseal(struct trusted_key_payload *p,
>  		      struct trusted_key_options *o)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	struct tpm_buf tb;
>  	int ret;
>  
> @@ -657,8 +664,10 @@ static int key_unseal(struct trusted_key_payload *p,
>  	if (ret)
>  		return ret;
>  
> -	ret = tpm_unseal(&tb, o->keyhandle, o->keyauth, p->blob, p->blob_len,
> -			 o->blobauth, p->key, &p->key_len);
> +	tpm_opts = o->private;
> +
> +	ret = tpm_unseal(&tb, tpm_opts->keyhandle, tpm_opts->keyauth, p->blob,
> +			 p->blob_len, tpm_opts->blobauth, p->key, &p->key_len);
>  	if (ret < 0)
>  		pr_info("srkunseal failed (%d)\n", ret);
>  	else
> @@ -695,6 +704,7 @@ static const match_table_t key_tokens = {
>  static int getoptions(char *c, struct trusted_key_payload *pay,
>  		      struct trusted_key_options *opt)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	substring_t args[MAX_OPT_ARGS];
>  	char *p = c;
>  	int token;
> @@ -710,7 +720,9 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  	if (tpm2 < 0)
>  		return tpm2;
>  
> -	opt->hash = tpm2 ? HASH_ALGO_SHA256 : HASH_ALGO_SHA1;
> +	tpm_opts = opt->private;
> +

I'd remove this empty line.

> +	tpm_opts->hash = tpm2 ? HASH_ALGO_SHA256 : HASH_ALGO_SHA1;
>  
>  	if (!c)
>  		return 0;
> @@ -724,11 +736,11 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  
>  		switch (token) {
>  		case Opt_pcrinfo:
> -			opt->pcrinfo_len = strlen(args[0].from) / 2;
> -			if (opt->pcrinfo_len > MAX_PCRINFO_SIZE)
> +			tpm_opts->pcrinfo_len = strlen(args[0].from) / 2;
> +			if (tpm_opts->pcrinfo_len > MAX_PCRINFO_SIZE)
>  				return -EINVAL;
> -			res = hex2bin(opt->pcrinfo, args[0].from,
> -				      opt->pcrinfo_len);
> +			res = hex2bin(tpm_opts->pcrinfo, args[0].from,
> +				      tpm_opts->pcrinfo_len);
>  			if (res < 0)
>  				return -EINVAL;
>  			break;
> @@ -737,12 +749,12 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  			if (res < 0)
>  				return -EINVAL;
>  			opt->keytype = SEAL_keytype;
> -			opt->keyhandle = handle;
> +			tpm_opts->keyhandle = handle;
>  			break;
>  		case Opt_keyauth:
>  			if (strlen(args[0].from) != 2 * SHA1_DIGEST_SIZE)
>  				return -EINVAL;
> -			res = hex2bin(opt->keyauth, args[0].from,
> +			res = hex2bin(tpm_opts->keyauth, args[0].from,
>  				      SHA1_DIGEST_SIZE);
>  			if (res < 0)
>  				return -EINVAL;
> @@ -753,21 +765,23 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  			 * hex strings.  TPM 2.0 authorizations are simple
>  			 * passwords (although it can take a hash as well)
>  			 */
> -			opt->blobauth_len = strlen(args[0].from);
> +			tpm_opts->blobauth_len = strlen(args[0].from);
>  
> -			if (opt->blobauth_len == 2 * TPM_DIGEST_SIZE) {
> -				res = hex2bin(opt->blobauth, args[0].from,
> +			if (tpm_opts->blobauth_len == 2 * TPM_DIGEST_SIZE) {
> +				res = hex2bin(tpm_opts->blobauth, args[0].from,
>  					      TPM_DIGEST_SIZE);
>  				if (res < 0)
>  					return -EINVAL;
>  
> -				opt->blobauth_len = TPM_DIGEST_SIZE;
> +				tpm_opts->blobauth_len = TPM_DIGEST_SIZE;
>  				break;
>  			}
>  
> -			if (tpm2 && opt->blobauth_len <= sizeof(opt->blobauth)) {
> -				memcpy(opt->blobauth, args[0].from,
> -				       opt->blobauth_len);
> +			if (tpm2 &&
> +			    tpm_opts->blobauth_len <=
> +				sizeof(tpm_opts->blobauth)) {
> +				memcpy(tpm_opts->blobauth, args[0].from,
> +				       tpm_opts->blobauth_len);
>  				break;
>  			}
>  
> @@ -785,14 +799,14 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  			res = kstrtoul(args[0].from, 10, &lock);
>  			if (res < 0)
>  				return -EINVAL;
> -			opt->pcrlock = lock;
> +			tpm_opts->pcrlock = lock;
>  			break;
>  		case Opt_hash:
>  			if (test_bit(Opt_policydigest, &token_mask))
>  				return -EINVAL;
>  			for (i = 0; i < HASH_ALGO__LAST; i++) {
>  				if (!strcmp(args[0].from, hash_algo_name[i])) {
> -					opt->hash = i;
> +					tpm_opts->hash = i;
>  					break;
>  				}
>  			}
> @@ -804,14 +818,14 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  			}
>  			break;
>  		case Opt_policydigest:
> -			digest_len = hash_digest_size[opt->hash];
> +			digest_len = hash_digest_size[tpm_opts->hash];
>  			if (!tpm2 || strlen(args[0].from) != (2 * digest_len))
>  				return -EINVAL;
> -			res = hex2bin(opt->policydigest, args[0].from,
> +			res = hex2bin(tpm_opts->policydigest, args[0].from,
>  				      digest_len);
>  			if (res < 0)
>  				return -EINVAL;
> -			opt->policydigest_len = digest_len;
> +			tpm_opts->policydigest_len = digest_len;
>  			break;
>  		case Opt_policyhandle:
>  			if (!tpm2)
> @@ -819,7 +833,7 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  			res = kstrtoul(args[0].from, 16, &handle);
>  			if (res < 0)
>  				return -EINVAL;
> -			opt->policyhandle = handle;
> +			tpm_opts->policyhandle = handle;
>  			break;
>  		default:
>  			return -EINVAL;
> @@ -830,6 +844,7 @@ static int getoptions(char *c, struct trusted_key_payload *pay,
>  
>  static struct trusted_key_options *trusted_options_alloc(void)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	struct trusted_key_options *options;
>  	int tpm2;
>  
> @@ -842,14 +857,23 @@ static struct trusted_key_options *trusted_options_alloc(void)
>  		/* set any non-zero defaults */
>  		options->keytype = SRK_keytype;
>  
> -		if (!tpm2)
> -			options->keyhandle = SRKHANDLE;
> +		tpm_opts = kzalloc(sizeof(*tpm_opts), GFP_KERNEL);
> +		if (!tpm_opts) {
> +			kfree_sensitive(options);
> +			options = NULL;
> +		} else {
> +			if (!tpm2)
> +				tpm_opts->keyhandle = SRKHANDLE;
> +
> +			options->private = tpm_opts;
> +		}
>  	}
>  	return options;
>  }
>  
>  static int trusted_tpm_seal(struct trusted_key_payload *p, char *datablob)
>  {
> +	struct trusted_tpm_options *tpm_opts = NULL;
>  	struct trusted_key_options *options = NULL;
>  	int ret = 0;
>  	int tpm2;
> @@ -867,7 +891,9 @@ static int trusted_tpm_seal(struct trusted_key_payload *p, char *datablob)
>  		goto out;
>  	dump_options(options);
>  
> -	if (!options->keyhandle && !tpm2) {
> +	tpm_opts = options->private;
> +
> +	if (!tpm_opts->keyhandle && !tpm2) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> @@ -881,20 +907,22 @@ static int trusted_tpm_seal(struct trusted_key_payload *p, char *datablob)
>  		goto out;
>  	}
>  
> -	if (options->pcrlock) {
> -		ret = pcrlock(options->pcrlock);
> +	if (tpm_opts->pcrlock) {
> +		ret = pcrlock(tpm_opts->pcrlock);
>  		if (ret < 0) {
>  			pr_info("pcrlock failed (%d)\n", ret);
>  			goto out;
>  		}
>  	}
>  out:
> +	kfree_sensitive(options->private);
>  	kfree_sensitive(options);
>  	return ret;
>  }
>  
>  static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
>  {
> +	struct trusted_tpm_options *tpm_opts = NULL;
>  	struct trusted_key_options *options = NULL;
>  	int ret = 0;
>  	int tpm2;
> @@ -912,7 +940,9 @@ static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
>  		goto out;
>  	dump_options(options);
>  
> -	if (!options->keyhandle && !tpm2) {
> +	tpm_opts = options->private;
> +
> +	if (!tpm_opts->keyhandle && !tpm2) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> @@ -924,14 +954,15 @@ static int trusted_tpm_unseal(struct trusted_key_payload *p, char *datablob)
>  	if (ret < 0)
>  		pr_info("key_unseal failed (%d)\n", ret);
>  
> -	if (options->pcrlock) {
> -		ret = pcrlock(options->pcrlock);
> +	if (tpm_opts->pcrlock) {
> +		ret = pcrlock(tpm_opts->pcrlock);
>  		if (ret < 0) {
>  			pr_info("pcrlock failed (%d)\n", ret);
>  			goto out;
>  		}
>  	}
>  out:
> +	kfree_sensitive(options->private);
>  	kfree_sensitive(options);
>  	return ret;
>  }
> diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> index 6340823f8b53..568c4af9010c 100644
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -24,6 +24,7 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
>  			   struct trusted_key_options *options,
>  			   u8 *src, u32 len)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	const int SCRATCH_SIZE = PAGE_SIZE;
>  	u8 *scratch = kmalloc(SCRATCH_SIZE, GFP_KERNEL);
>  	u8 *work = scratch, *work1;
> @@ -46,7 +47,9 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
>  	work = asn1_encode_oid(work, end_work, tpm2key_oid,
>  			       asn1_oid_len(tpm2key_oid));
>  
> -	if (options->blobauth_len == 0) {
> +	tpm_opts = options->private;
> +
> +	if (tpm_opts->blobauth_len == 0) {
>  		unsigned char bool[3], *w = bool;
>  		/* tag 0 is emptyAuth */
>  		w = asn1_encode_boolean(w, w + sizeof(bool), true);
> @@ -69,7 +72,7 @@ static int tpm2_key_encode(struct trusted_key_payload *payload,
>  		goto err;
>  	}
>  
> -	work = asn1_encode_integer(work, end_work, options->keyhandle);
> +	work = asn1_encode_integer(work, end_work, tpm_opts->keyhandle);
>  	work = asn1_encode_octet_string(work, end_work, pub, pub_len);
>  	work = asn1_encode_octet_string(work, end_work, priv, priv_len);
>  
> @@ -102,6 +105,7 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
>  			   struct trusted_key_options *options,
>  			   u8 **buf)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	int ret;
>  	struct tpm2_key_context ctx;
>  	u8 *blob;
> @@ -120,8 +124,10 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
>  	if (!blob)
>  		return -ENOMEM;
>  
> +	tpm_opts = options->private;
> +
>  	*buf = blob;
> -	options->keyhandle = ctx.parent;
> +	tpm_opts->keyhandle = ctx.parent;
>  
>  	memcpy(blob, ctx.priv, ctx.priv_len);
>  	blob += ctx.priv_len;
> @@ -233,6 +239,7 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
>  		      struct trusted_key_payload *payload,
>  		      struct trusted_key_options *options)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	off_t offset = TPM_HEADER_SIZE;
>  	struct tpm_buf buf, sized;
>  	int blob_len = 0;
> @@ -240,11 +247,13 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
>  	u32 flags;
>  	int rc;
>  
> -	hash = tpm2_find_hash_alg(options->hash);
> +	tpm_opts = options->private;
> +
> +	hash = tpm2_find_hash_alg(tpm_opts->hash);
>  	if (hash < 0)
>  		return hash;
>  
> -	if (!options->keyhandle)
> +	if (!tpm_opts->keyhandle)
>  		return -EINVAL;
>  
>  	rc = tpm_try_get_ops(chip);
> @@ -268,18 +277,19 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
>  		goto out_put;
>  	}
>  
> -	rc = tpm_buf_append_name(chip, &buf, options->keyhandle, NULL);
> +	rc = tpm_buf_append_name(chip, &buf, tpm_opts->keyhandle, NULL);
>  	if (rc)
>  		goto out;
>  
>  	tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT,
> -				    options->keyauth, TPM_DIGEST_SIZE);
> +				    tpm_opts->keyauth, TPM_DIGEST_SIZE);
>  
>  	/* sensitive */
> -	tpm_buf_append_u16(&sized, options->blobauth_len);
> +	tpm_buf_append_u16(&sized, tpm_opts->blobauth_len);
>  
> -	if (options->blobauth_len)
> -		tpm_buf_append(&sized, options->blobauth, options->blobauth_len);
> +	if (tpm_opts->blobauth_len)
> +		tpm_buf_append(&sized, tpm_opts->blobauth,
> +			       tpm_opts->blobauth_len);
>  
>  	tpm_buf_append_u16(&sized, payload->key_len);
>  	tpm_buf_append(&sized, payload->key, payload->key_len);
> @@ -292,14 +302,15 @@ int tpm2_seal_trusted(struct tpm_chip *chip,
>  
>  	/* key properties */
>  	flags = 0;
> -	flags |= options->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
> +	flags |= tpm_opts->policydigest_len ? 0 : TPM2_OA_USER_WITH_AUTH;
>  	flags |= payload->migratable ? 0 : (TPM2_OA_FIXED_TPM | TPM2_OA_FIXED_PARENT);
>  	tpm_buf_append_u32(&sized, flags);
>  
>  	/* policy */
> -	tpm_buf_append_u16(&sized, options->policydigest_len);
> -	if (options->policydigest_len)
> -		tpm_buf_append(&sized, options->policydigest, options->policydigest_len);
> +	tpm_buf_append_u16(&sized, tpm_opts->policydigest_len);
> +	if (tpm_opts->policydigest_len)
> +		tpm_buf_append(&sized, tpm_opts->policydigest,
> +			       tpm_opts->policydigest_len);
>  
>  	/* public parameters */
>  	tpm_buf_append_u16(&sized, TPM_ALG_NULL);
> @@ -373,6 +384,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>  			 u32 *blob_handle)
>  {
>  	u8 *blob_ref __free(kfree) = NULL;
> +	struct trusted_tpm_options *tpm_opts;
>  	struct tpm_buf buf;
>  	unsigned int private_len;
>  	unsigned int public_len;
> @@ -391,8 +403,10 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>  		blob_ref = blob;
>  	}
>  
> +	tpm_opts = options->private;
> +
>  	/* new format carries keyhandle but old format doesn't */
> -	if (!options->keyhandle)
> +	if (!tpm_opts->keyhandle)
>  		return -EINVAL;
>  
>  	/* must be big enough for at least the two be16 size counts */
> @@ -433,11 +447,11 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
>  		return rc;
>  	}
>  
> -	rc = tpm_buf_append_name(chip, &buf, options->keyhandle, NULL);
> +	rc = tpm_buf_append_name(chip, &buf, tpm_opts->keyhandle, NULL);
>  	if (rc)
>  		goto out;
>  
> -	tpm_buf_append_hmac_session(chip, &buf, 0, options->keyauth,
> +	tpm_buf_append_hmac_session(chip, &buf, 0, tpm_opts->keyauth,
>  				    TPM_DIGEST_SIZE);
>  
>  	tpm_buf_append(&buf, blob, blob_len);
> @@ -481,6 +495,7 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>  			   struct trusted_key_options *options,
>  			   u32 blob_handle)
>  {
> +	struct trusted_tpm_options *tpm_opts;
>  	struct tpm_header *head;
>  	struct tpm_buf buf;
>  	u16 data_len;
> @@ -502,10 +517,12 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>  	if (rc)
>  		goto out;
>  
> -	if (!options->policyhandle) {
> +	tpm_opts = options->private;
> +
> +	if (!tpm_opts->policyhandle) {
>  		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT,
> -					    options->blobauth,
> -					    options->blobauth_len);
> +					    tpm_opts->blobauth,
> +					    tpm_opts->blobauth_len);
>  	} else {
>  		/*
>  		 * FIXME: The policy session was generated outside the
> @@ -518,9 +535,10 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
>  		 * could repeat our actions with the exfiltrated
>  		 * password.
>  		 */
> -		tpm2_buf_append_auth(&buf, options->policyhandle,
> +		tpm2_buf_append_auth(&buf, tpm_opts->policyhandle,
>  				     NULL /* nonce */, 0, 0,
> -				     options->blobauth, options->blobauth_len);
> +				     tpm_opts->blobauth,
> +				     tpm_opts->blobauth_len);
>  		if (tpm2_chip_auth(chip)) {
>  			tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_ENCRYPT, NULL, 0);
>  		} else  {
> -- 
> 2.43.0
> 

BR, Jarkko

