Return-Path: <linuxppc-dev+bounces-8911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DDFAC1CDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 08:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3Zkf2n54z2yrm;
	Fri, 23 May 2025 16:19:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747981178;
	cv=none; b=H1zS1/6qXRx261eKx1TWg5pIM4ZgOwWcmugOEwM5+ukLjRDz+O7zzMf4k6s8rwwVirw68rx0mguWCYfx+csgItlmIVu05PL7B8L9oq9VZfWIwZLIUFPYEvRu96DxTmNL9EW0z7VhvQz8CAvyt8BUSj1sGdmbFpZeleXZdTomK3RBovg8+9z+U0NeDqKESRfKmdutKGwTuLG0be4AKWioXeETLcsrv2X790erSY9gvI811gm8bvjqlZOxcod5jtpnR4+LcD0aF0LCD9P7W09Hq96MMi5dwbBRdaG71J8khrO2NqWtkxKnqSj176OIjW4woJmdopvJD/G3Tmy3COnpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747981178; c=relaxed/relaxed;
	bh=oLNt3RtdnKwFBR5q5jDcZxmQHHAKPZSgXtIxyhohpeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSBIs0AhRPvt2SLbReSLNqWwPlJ9VDGN91ttQ5YzeHenZsw68eeBYNTp6uLbjkGsPQcTdc8YRY6Q1a4Yase3V+jiPM6THwvsBDtQmnkhkakm5CKxZdwU727whDlcGbL6w9zmA8KOZqu9pKsc9GiYbBTABYbN4adKZTlX7ArPGttykGZKeITGRGIk9JBtE3gfm0A4kLOJY2qlsqVyPXPTxaoQDlzbR2Fhg8L35MjInYqFxW0E9Qy8DoXqWGd+J1sWuLNu5kgTWxoYIYWhOA4HHo73XgFPIrABEBNZAKPxP2J4lhvpIXrDjkJysHj2LNmqGp9Q6QiwnTsQ3NSvmu6VnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IRZQV8+9; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hdGwkoX2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IRZQV8+9; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hdGwkoX2; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IRZQV8+9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hdGwkoX2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IRZQV8+9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hdGwkoX2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3Zkd1YT1z2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 16:19:37 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29E431F7A8;
	Fri, 23 May 2025 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747981169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLNt3RtdnKwFBR5q5jDcZxmQHHAKPZSgXtIxyhohpeU=;
	b=IRZQV8+9L8Ns96iocdMPl3/WA43ZPmuDxsuN46noj7OtBcuG4YwCgkesfLAhr3gIaQ0gXw
	UkJqMG888Uo7HczVfd38sRJpWiGuX9gffeiT+/GyEXH0r9E4R1RyJeCRIDQSgqmhEF7hvR
	dzF9A9w/Gwr6gSfwBkVS/aeNL+QaYpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747981169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLNt3RtdnKwFBR5q5jDcZxmQHHAKPZSgXtIxyhohpeU=;
	b=hdGwkoX2cFA7F2N97OZ+m6VAA65nInrPD3JlD5KaDrDNIAo5qE8Fm0J3JRs42J7uWQ9lS3
	rWPq03TPzya3pGAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747981169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLNt3RtdnKwFBR5q5jDcZxmQHHAKPZSgXtIxyhohpeU=;
	b=IRZQV8+9L8Ns96iocdMPl3/WA43ZPmuDxsuN46noj7OtBcuG4YwCgkesfLAhr3gIaQ0gXw
	UkJqMG888Uo7HczVfd38sRJpWiGuX9gffeiT+/GyEXH0r9E4R1RyJeCRIDQSgqmhEF7hvR
	dzF9A9w/Gwr6gSfwBkVS/aeNL+QaYpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747981169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLNt3RtdnKwFBR5q5jDcZxmQHHAKPZSgXtIxyhohpeU=;
	b=hdGwkoX2cFA7F2N97OZ+m6VAA65nInrPD3JlD5KaDrDNIAo5qE8Fm0J3JRs42J7uWQ9lS3
	rWPq03TPzya3pGAw==
Date: Fri, 23 May 2025 08:19:22 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
	zohar@linux.ibm.com, nayna@linux.ibm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] powerpc/secvar: Expose secvars relevant to the
 key management mode
Message-ID: <aDATahmPIsOmiFAK@kitsune.suse.cz>
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
 <20250521105759.8408-3-ssrish@linux.ibm.com>
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
In-Reply-To: <20250521105759.8408-3-ssrish@linux.ibm.com>
X-Spam-Level: 
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_DN_SOME(0.00)[]
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

On Wed, May 21, 2025 at 04:27:58PM +0530, Srish Srinivasan wrote:
> The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
> secvars irrespective of the key management mode.
> 
> The PowerVM LPAR supports static and dynamic key management for secure
> boot. The key management option can be updated in the management
> console. Only in the dynamic key mode can the user modify the secure
> boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed via
> the sysfs interface. But the sysfs interface exposes these secvars even
> in the static key mode. This could lead to errors when reading them or
> writing to them in the static key mode.

would it cause an error when reading these variables or only when
writing them?

Thanks

Michal


> 
> Expose only PK, trustedcadb, and moduledb in the static key mode to
> enable loading of signed third-party kernel modules.
> 
> Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-secvar        |  6 ++++
>  arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++---
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> index 45281888e520..948df3446a03 100644
> --- a/Documentation/ABI/testing/sysfs-secvar
> +++ b/Documentation/ABI/testing/sysfs-secvar
> @@ -37,6 +37,12 @@ Description:	Each secure variable is represented as a directory named as
>  		representation. The data and size can be determined by reading
>  		their respective attribute files.
>  
> +		Only secvars relevant to the key management mode are exposed.
> +		Only in the dynamic key mode can the user modify the secure boot
> +		secvars db, dbx, grubdb, grubdbx, and sbat. PK, trustedcadb and
> +		moduledb are the secvars common to both static and dynamic key
> +		management modes.
> +
>  What:		/sys/firmware/secvar/vars/<variable_name>/size
>  Date:		August 2019
>  Contact:	Nayna Jain <nayna@linux.ibm.com>
> diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> index 767e5e8c6990..f9e9cc40c9d0 100644
> --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> @@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
>  		return PLPKS_SIGNEDUPDATE;
>  }
>  
> -static const char * const plpks_var_names[] = {
> +static const char * const plpks_var_names_static[] = {
> +	"PK",
> +	"moduledb",
> +	"trustedcadb",
> +	NULL,
> +};
> +
> +static const char * const plpks_var_names_dynamic[] = {
>  	"PK",
>  	"KEK",
>  	"db",
> @@ -213,21 +220,34 @@ static int plpks_max_size(u64 *max_size)
>  	return 0;
>  }
>  
> +static const struct secvar_operations plpks_secvar_ops_static = {
> +	.get = plpks_get_variable,
> +	.set = plpks_set_variable,
> +	.format = plpks_secvar_format,
> +	.max_size = plpks_max_size,
> +	.config_attrs = config_attrs,
> +	.var_names = plpks_var_names_static,
> +};
>  
> -static const struct secvar_operations plpks_secvar_ops = {
> +static const struct secvar_operations plpks_secvar_ops_dynamic = {
>  	.get = plpks_get_variable,
>  	.set = plpks_set_variable,
>  	.format = plpks_secvar_format,
>  	.max_size = plpks_max_size,
>  	.config_attrs = config_attrs,
> -	.var_names = plpks_var_names,
> +	.var_names = plpks_var_names_dynamic,
>  };
>  
>  static int plpks_secvar_init(void)
>  {
> +	u8 mode;
> +
>  	if (!plpks_is_available())
>  		return -ENODEV;
>  
> -	return set_secvar_ops(&plpks_secvar_ops);
> +	mode = plpks_get_sb_keymgmt_mode();
> +	if (mode)
> +		return set_secvar_ops(&plpks_secvar_ops_dynamic);
> +	return set_secvar_ops(&plpks_secvar_ops_static);
>  }
>  machine_device_initcall(pseries, plpks_secvar_init);
> -- 
> 2.47.1
> 
> 

