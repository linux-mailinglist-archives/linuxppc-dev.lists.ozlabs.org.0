Return-Path: <linuxppc-dev+bounces-3808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ECD9E4B28
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 01:30:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3b022FzLz30TG;
	Thu,  5 Dec 2024 11:30:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733358642;
	cv=none; b=ArF5IAZAtwlIz8ATv0TJi7z9X5Hp8+L+YZm/RuVZNT6hdPfxyeNfLohfdqxxbTvjFqgz4QzttThGOF3ELFIYOLFOTj+HJnkGBplkByqxKpPOxDZI8Jyl3G3ryXeb3T/fGBlrnF3xX1XSM880bgTmLwRsPhVLvF1C7V+eUfusfcFHr1HrA9+g1JruHmlIkFZsXtSF90cZox4XsIG53CEP4zWHWOgUurhav29cZMCBGe/UDzNkVBWBRZ5j3LkjM7fXC0Y0kjOSL8KMWQ/tDj/ERVdH9gdIynrbkKc9KjBhmuF/zE3Lj6uoE71Z+CT0R3dKgNbm23XpRCpx2REo/y5thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733358642; c=relaxed/relaxed;
	bh=cx8AjVOF2supC5V2SOlqTps9GdiZUBi3ZTNgltdJ0dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KICB8MBpZbxWH6qwwF/Zc8tcWtuXcETXV8C0P5L3EbpPv2gsNCV7ke5TSPli1cufRfeXU69hxgKY9nPgQnOidzYBuSuKw3evDw3WZdL3TDu7AePA0w7xVQrMFfGLgcbObjQlunfM3wzmDsyDFkWuNdRNevKPkli8i30C+uyHs7ny/cSovlVoUMVWRzKdm5GQI4hTnUi80Pyn49lpWVN9Xi6804Sw0Ty03uBe2+/khNuE55cSv6+8uRNQ5+6s3/MTiYzXvCokgCyrYiFcNQON1StPnjZpF9KvID2BMqLa64WwG2qgcjWlKlRl0WVLfTa3Pna4JlKohgX5z8rMvaKzrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U0b+XS6w; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U0b+XS6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3b0111SGz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 11:30:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E725A41BEF;
	Thu,  5 Dec 2024 00:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8FFC4CECD;
	Thu,  5 Dec 2024 00:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733358638;
	bh=/2sfueJmjtuNFdSJDAv70/lV2GSeIQBqxjwAlB5dnHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U0b+XS6wBGTJTdoUB+zX5yCYC80xQg8mG1JECA6jtd/ZXQyr+wkFKnJpWr4Exsl3q
	 PKUXHtJajUBEY4qoOn2lhqNOARzwLDGjRy42ZnHfelm66fsXvnBWhMn7kn7XHhCR9u
	 zis+5iQfSgyOY+qra3sg65bwGSzqxyPKuTkP/ABRbdkStCVZeRpNSyYSgAsc2094iQ
	 0Dojw17kSxZ02gPDQGiuLSkb/0s1hhbmFmrLSoW/9qiE3SckHm30ckc58xbfU202eY
	 PHb3cNAnXcUsNvTparem6jFHAsV+hk5RMSyvv4yYodMVAFENmD0zSeGU+TnTv/pMsY
	 tO4BV4HgQsr8Q==
Date: Wed, 4 Dec 2024 16:30:36 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: atharvatiwari1101@outlook.in, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Aditya Gupta <adityag@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
	Eder Zulian <ezulian@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fix: add safety check for OPTION_END and refactor code
 for consistency
Message-ID: <Z1D0LNfWcnPkWC3_@google.com>
References: <20241129104401.5997-1-atharvatiwari1101@outlook.in>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129104401.5997-1-atharvatiwari1101@outlook.in>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

On Fri, Nov 29, 2024 at 04:13:53PM +0530, Atharva Tiwari wrote:
> - Added a null check for 'o' before copying the last OPTION_END in options__order function to prevent potential uninitialized usage.
> - Refactored the parse_long_opt function for improved readability by aligning function signature.
> - Minor formatting fix to ensure consistency in the codebase.
> - Updated the wrapper script for pseries architecture to handle 'notext' option in a more reliable way.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwari1101@outlook.in>
> ---
>  arch/powerpc/boot/wrapper        |  1 +
>  tools/lib/subcmd/parse-options.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 1db60fe13802..d25ad8c622f4 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -267,6 +267,7 @@ pseries)
>      link_address='0x4000000'
>      if [ "$format" != "elf32ppc" ]; then
>  	link_address=
> +	notext='-z notext'

This is a completely differnt change and should be sent to powerpc devs
separately.


>  	pie=-pie
>      fi
>      make_space=n
> diff --git a/tools/lib/subcmd/parse-options.c b/tools/lib/subcmd/parse-options.c
> index 555d617c1f50..f85b642bc9aa 100644
> --- a/tools/lib/subcmd/parse-options.c
> +++ b/tools/lib/subcmd/parse-options.c
> @@ -360,8 +360,7 @@ static int parse_short_opt(struct parse_opt_ctx_t *p, const struct option *optio
>  	return -2;
>  }
>  
> -static int parse_long_opt(struct parse_opt_ctx_t *p, const char *arg,
> -                          const struct option *options)
> +static int parse_long_opt(struct parse_opt_ctx_t *p, const char *arg, const struct option *options)

Please don't change this unnecessarily.


>  {
>  	const char *arg_end = strchr(arg, '=');
>  	const struct option *abbrev_option = NULL, *ambiguous_option = NULL;
> @@ -828,9 +827,10 @@ static struct option *options__order(const struct option *opts)
>  
>  		nr_parent = nr_opts;
>  	}
> -	/* copy the last OPTION_END */
> -	memcpy(&ordered[nr_opts], o, sizeof(*o));
> -
> +	/* Check whether o is  valid before using it to copy the last OPTION_END. */
> +	if (o && o->type == OPTION_END) {
> +		memcpy(&ordered[nr_opts], o, sizeof(*o));
> +	}

Do you any real problems with this?  I think the existing code assumes
the last entry should be OPTION_END.  Otherwise it won't work well.

Thanks,
Namhyung


>  	/* sort each option group individually */
>  	for (opt = group = ordered; opt->type != OPTION_END; opt++) {
>  		if (opt->type == OPTION_GROUP) {
> -- 
> 2.43.-1
> 

