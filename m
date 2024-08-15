Return-Path: <linuxppc-dev+bounces-107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC5953B24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 21:54:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FE7PfLE4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1xqjyJVM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FE7PfLE4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1xqjyJVM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlG625BDSz2ydN;
	Fri, 16 Aug 2024 05:54:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FE7PfLE4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1xqjyJVM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FE7PfLE4;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1xqjyJVM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlG6168w9z2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 05:54:01 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4925D22199;
	Thu, 15 Aug 2024 19:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723751636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PxwNmMEOSEsnioIwJBJ2y0G3Z0BZ6eaHeE9Djk/oC8E=;
	b=FE7PfLE4z7fNCOprrbNK2ONqVUHeE618mN/SAfbbEs3CKg2WJUa+Ne/JGYAh179jEDDMVL
	OPemXXCKtlMjV/bmVoL+0LMg/FyZiQ6GCLhdyOBl3qsRFF0R3gUF9x+Jp96X3+qDFi8Adr
	Uc7/f5XvA9K/7wWOjyIDwwdg/d9bT1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723751636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PxwNmMEOSEsnioIwJBJ2y0G3Z0BZ6eaHeE9Djk/oC8E=;
	b=1xqjyJVMowtQzwHbj2DMTLDFI/g1Rgd7Z39ELJug9ohJLrRVxQjUNiN1dsRRZHrDCHdf/S
	Zjn/kHrKyb+2QnCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723751636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PxwNmMEOSEsnioIwJBJ2y0G3Z0BZ6eaHeE9Djk/oC8E=;
	b=FE7PfLE4z7fNCOprrbNK2ONqVUHeE618mN/SAfbbEs3CKg2WJUa+Ne/JGYAh179jEDDMVL
	OPemXXCKtlMjV/bmVoL+0LMg/FyZiQ6GCLhdyOBl3qsRFF0R3gUF9x+Jp96X3+qDFi8Adr
	Uc7/f5XvA9K/7wWOjyIDwwdg/d9bT1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723751636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PxwNmMEOSEsnioIwJBJ2y0G3Z0BZ6eaHeE9Djk/oC8E=;
	b=1xqjyJVMowtQzwHbj2DMTLDFI/g1Rgd7Z39ELJug9ohJLrRVxQjUNiN1dsRRZHrDCHdf/S
	Zjn/kHrKyb+2QnCg==
Date: Thu, 15 Aug 2024 21:53:55 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, nathanl@linux.ibm.com, tyreld@linux.ibm.com,
	npiggin@gmail.com, mahesh@linux.ibm.com, naveen.n.rao@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/pseries: Add failure related checks for
 h_get_mpp and h_get_ppp
Message-ID: <20240815195355.GW26466@kitsune.suse.cz>
References: <20240412092047.455483-1-sshegde@linux.ibm.com>
 <20240412092047.455483-3-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412092047.455483-3-sshegde@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[ellerman.id.au,linux.ibm.com,gmail.com,lists.ozlabs.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 

On Fri, Apr 12, 2024 at 02:50:47PM +0530, Shrikanth Hegde wrote:
> Couple of Minor fixes:
> 
> - hcall return values are long. Fix that for h_get_mpp, h_get_ppp and
> parse_ppp_data
> 
> - If hcall fails, values set should be at-least zero. It shouldn't be
> uninitialized values. Fix that for h_get_mpp and h_get_ppp
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h        | 2 +-
>  arch/powerpc/platforms/pseries/lpar.c    | 6 +++---
>  arch/powerpc/platforms/pseries/lparcfg.c | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index a41e542ba94d..3d642139b900 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -570,7 +570,7 @@ struct hvcall_mpp_data {
>  	unsigned long backing_mem;
>  };
> 
> -int h_get_mpp(struct hvcall_mpp_data *);
> +long h_get_mpp(struct hvcall_mpp_data *mpp_data);
> 
>  struct hvcall_mpp_x_data {
>  	unsigned long coalesced_bytes;
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index 4e9916bb03d7..c1d8bee8f701 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -1886,10 +1886,10 @@ notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
>   * h_get_mpp
>   * H_GET_MPP hcall returns info in 7 parms
>   */
> -int h_get_mpp(struct hvcall_mpp_data *mpp_data)
> +long h_get_mpp(struct hvcall_mpp_data *mpp_data)
>  {
> -	int rc;
> -	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
> +	long rc;
> 
>  	rc = plpar_hcall9(H_GET_MPP, retbuf);
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index 5c2a3e802a02..ed2176d8a866 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -113,8 +113,8 @@ struct hvcall_ppp_data {
>   */
>  static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
Hello,

Shouldn't the      ^^^ return value also be long?

Thanks

Michal
>  {
> -	unsigned long rc;
> -	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
> +	long rc;
> 
>  	rc = plpar_hcall9(H_GET_PPP, retbuf);
> 
> @@ -197,7 +197,7 @@ static void parse_ppp_data(struct seq_file *m)
>  	struct hvcall_ppp_data ppp_data;
>  	struct device_node *root;
>  	const __be32 *perf_level;
> -	int rc;
> +	long rc;
> 
>  	rc = h_get_ppp(&ppp_data);
>  	if (rc)
> --
> 2.39.3
> 

