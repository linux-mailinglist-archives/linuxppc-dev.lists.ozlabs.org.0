Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585B51C607
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 19:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvLF46H6rz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 03:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DwKoLPWZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DwKoLPWZ; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvLDT6Jzmz3bft
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 03:24:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAD1EB82E0A;
 Thu,  5 May 2022 17:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F12C385A8;
 Thu,  5 May 2022 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651771492;
 bh=mFEUWOwLtGnOm4pwIqwkuwW71lSfejm2wbiyVvKcn9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwKoLPWZ1m0AxkP45qvqOO29+GMA+D0A3VriWiFBJIObENFZWAqpLn2uwbKo/qlz4
 6Yt9Npc995FsT5cM8i9/wKq7FJjYpvrfvOPDvR/sIjWZxUzW+A2GMbwP+O10avukHT
 CaW0vmq6zkFUyobp29Drgws9QqlVu4G0Nxo1B482JHBO+kwQeF4AD/oXgbbxF/rF5c
 mEqkvp9GY9TRkLMJFytJWQVhwGC04xfF/of9sxK2l22cmVxhsYVGliJJto1dC1YdQK
 VB58Q4Wum9ROX9gur0a5VOoeF/228C6fToukBaeJ5CDnOudJ3DDe0oeR2jGGgBWFJW
 uqmZhJADealJQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 49DE6400B1; Thu,  5 May 2022 14:24:49 -0300 (-03)
Date: Thu, 5 May 2022 14:24:49 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/2] tools/perf: Add utility function to read
 /proc/cpuinfo for any field
Message-ID: <YnQIYdqh9VsKm2aX@kernel.org>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
 <20220505094000.58220-2-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505094000.58220-2-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, May 05, 2022 at 03:09:59PM +0530, Athira Rajeev escreveu:
> /proc/cpuinfo provides information about type of processor, number
> of CPU's etc. Reading /proc/cpuinfo file outputs useful information
> by field name like cpu, platform, model (depending on architecture)
> and its value separated by colon.
> 
> Add new utility function "cpuinfo_field" in "util/header.c" which
> accepts field name as input string to search in /proc/cpuinfo content.
> This returns the first matching value as resulting string. Example,
> calling the function "cpuinfo_field(platform)" in powerpc returns
> the platform value. This can be used to fetch processor information
> from "cpuinfo" by other utilities/testcases.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/header.c | 53 ++++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/header.h |  1 +
>  2 files changed, 54 insertions(+)
> 
> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> index a27132e5a5ef..f08857f96606 100644
> --- a/tools/perf/util/header.c
> +++ b/tools/perf/util/header.c
> @@ -983,6 +983,59 @@ static int write_dir_format(struct feat_fd *ff,
>  	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
>  }
>  
> +/*
> + * Return entry from /proc/cpuinfo
> + * indicated by "search" parameter.
> + */
> +char *cpuinfo_field(const char *search)
> +{
> +	FILE *file;
> +	char *buf = NULL;
> +	char *copy_buf = NULL, *p;
> +	size_t len = 0;
> +
> +	if (!search)
> +		return NULL;
> +
> +	file = fopen("/proc/cpuinfo", "r");
> +	if (!file)
> +		return NULL;
> +
> +	while (getline(&buf, &len, file) > 0) {
> +		if (!strncmp(buf, search, strlen(search)))

Can you save the search string lenght in a variable and use it instead
of calling strlen() for the same buffer for each line in /proc/cpuinfo?

> +			break;
> +	}
> +
> +	if (feof(file))
> +		goto done;
> +
> +	/*
> +	 * Trim the new line and separate
> +	 * value for search field from ":"
> +	 * in cpuinfo line output.
> +	 * Example output line:
> +	 * platform : <value>
> +	 */
> +	copy_buf = buf;
> +	p = strchr(copy_buf, ':');

So you assume that this will always be there, right? Shouldn't we not
assume that and check if p is NULL and bail out instead?

> +
> +	/* Go to string after ":" */
> +	copy_buf = p + 1;
> +	p = strchr(copy_buf, '\n');

Ditto.

> +	if (p)
> +		*p = '\0';
> +
> +	/* Copy the filtered string after removing space to buf */
> +	strcpy(buf, strim(copy_buf));
> +
> +	fclose(file);
> +	return buf;
> +
> +done:

Please rename this goto label to "not_found", "done" isn't intention
revealing.

> +	free(buf);
> +	fclose(file);
> +	return NULL;
> +}
>  /*
>   * Check whether a CPU is online
>   *
> diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
> index 0eb4bc29a5a4..b0f754364bd4 100644
> --- a/tools/perf/util/header.h
> +++ b/tools/perf/util/header.h
> @@ -166,4 +166,5 @@ int get_cpuid(char *buffer, size_t sz);
>  
>  char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
>  int strcmp_cpuid_str(const char *s1, const char *s2);
> +char *cpuinfo_field(const char *search);
>  #endif /* __PERF_HEADER_H */
> -- 
> 2.35.1

-- 

- Arnaldo
