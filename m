Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F61E5221F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 19:09:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyPf62ZMsz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 03:09:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VRfrjksu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VRfrjksu; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyPdT6GQLz2xrs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 03:08:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA4EBB81D2E;
 Tue, 10 May 2022 17:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340E3C385A6;
 Tue, 10 May 2022 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652202519;
 bh=OGZczu6d5IJs645tGhia4PbZWhqVEjtZ7gypyXT4Y9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRfrjksu+qPbAt/IqAtadM8EyQcMwlxg+pXN8J8i/HbI9AKHDHAaN/FNgtQPY4tpC
 wJLkgzYGIfuWVRd+tvXDdcteAjIf0W4FPbCtF73GQ6w0VlHC6b9ojFXoIzpfqMKhXo
 BsEpTC6lecEZl2RXLu7Jg8lzp3JQitBmfNjq9IAcz/b4mICjH0uHVXbuELqHmk/Kci
 sFH9Xk7JLtZ0DUGRtO3lQbX0JVxmu3gORsqeFuXIZPUYOUdTOkmWD/UR6Te9KLPxme
 02HscDK/odE+wZhDTnsv67cMnQKxa/WhQj/JEbUT6bTBaSJQjLL1f41jyV8/4+7TLg
 zR0yV5mLoSgIg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 3E329400B1; Tue, 10 May 2022 14:08:37 -0300 (-03)
Date: Tue, 10 May 2022 14:08:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/2] tools/perf: Add utility function to read
 /proc/cpuinfo for any field
Message-ID: <YnqcFZwtay4180Yj@kernel.org>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
 <20220505094000.58220-2-atrajeev@linux.vnet.ibm.com>
 <YnQIYdqh9VsKm2aX@kernel.org>
 <460BE4F4-9748-40E4-94F3-B4263FD34D5F@linux.vnet.ibm.com>
 <BC9A38D1-E972-4F9B-8C76-8EBDC03FA6F1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BC9A38D1-E972-4F9B-8C76-8EBDC03FA6F1@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Nageswara Sastry <rnsastry@linux.ibm.com>, kajoljain <kjain@linux.ibm.com>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, May 10, 2022 at 07:08:47PM +0530, Athira Rajeev escreveu:
> 
> 
> > On 06-May-2022, at 3:03 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> > 
> > 
> > 
> >> On 05-May-2022, at 10:54 PM, Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >> 
> >> Em Thu, May 05, 2022 at 03:09:59PM +0530, Athira Rajeev escreveu:
> >>> /proc/cpuinfo provides information about type of processor, number
> >>> of CPU's etc. Reading /proc/cpuinfo file outputs useful information
> >>> by field name like cpu, platform, model (depending on architecture)
> >>> and its value separated by colon.
> >>> 
> >>> Add new utility function "cpuinfo_field" in "util/header.c" which
> >>> accepts field name as input string to search in /proc/cpuinfo content.
> >>> This returns the first matching value as resulting string. Example,
> >>> calling the function "cpuinfo_field(platform)" in powerpc returns
> >>> the platform value. This can be used to fetch processor information
> >>> from "cpuinfo" by other utilities/testcases.
> >>> 
> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>> ---
> >>> tools/perf/util/header.c | 53 ++++++++++++++++++++++++++++++++++++++++
> >>> tools/perf/util/header.h |  1 +
> >>> 2 files changed, 54 insertions(+)
> >>> 
> >>> diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
> >>> index a27132e5a5ef..f08857f96606 100644
> >>> --- a/tools/perf/util/header.c
> >>> +++ b/tools/perf/util/header.c
> >>> @@ -983,6 +983,59 @@ static int write_dir_format(struct feat_fd *ff,
> >>> 	return do_write(ff, &data->dir.version, sizeof(data->dir.version));
> >>> }
> >>> 
> >>> +/*
> >>> + * Return entry from /proc/cpuinfo
> >>> + * indicated by "search" parameter.
> >>> + */
> >>> +char *cpuinfo_field(const char *search)
> >>> +{
> >>> +	FILE *file;
> >>> +	char *buf = NULL;
> >>> +	char *copy_buf = NULL, *p;
> >>> +	size_t len = 0;
> >>> +
> >>> +	if (!search)
> >>> +		return NULL;
> >>> +
> >>> +	file = fopen("/proc/cpuinfo", "r");
> >>> +	if (!file)
> >>> +		return NULL;
> >>> +
> >>> +	while (getline(&buf, &len, file) > 0) {
> >>> +		if (!strncmp(buf, search, strlen(search)))
> >> 
> >> Can you save the search string lenght in a variable and use it instead
> >> of calling strlen() for the same buffer for each line in /proc/cpuinfo?
> > 
> > 
> > Hi Arnaldo, Michael
> > 
> > Thanks for review comments. Based on suggestion from Michael, I am reworking on patch 2 to SKIP the test
> > if physical_id is set to -1 irrespective of value from cpuinfo.
> > 
> > In this patch, I had written "cpuinfo_field " function as generic function for retrieving any entry from /proc/cpuinfo.
> > But it won't be used in patch 2 now. Do you think this function is useful to keep ? Otherwise, I will drop patch 1

Lets add it when the need arises.

- Arnaldo
 
> Hi,
> 
> Requesting for suggestions on this change
> 
> Thanks
> Athira
> > 
> > Thanks
> > Athira Rajeev
> > 
> >> 
> >>> +			break;
> >>> +	}
> >>> +
> >>> +	if (feof(file))
> >>> +		goto done;
> >>> +
> >>> +	/*
> >>> +	 * Trim the new line and separate
> >>> +	 * value for search field from ":"
> >>> +	 * in cpuinfo line output.
> >>> +	 * Example output line:
> >>> +	 * platform : <value>
> >>> +	 */
> >>> +	copy_buf = buf;
> >>> +	p = strchr(copy_buf, ':');
> >> 
> >> So you assume that this will always be there, right? Shouldn't we not
> >> assume that and check if p is NULL and bail out instead?
> >> 
> >>> +
> >>> +	/* Go to string after ":" */
> >>> +	copy_buf = p + 1;
> >>> +	p = strchr(copy_buf, '\n');
> >> 
> >> Ditto.
> >> 
> >>> +	if (p)
> >>> +		*p = '\0';
> >>> +
> >>> +	/* Copy the filtered string after removing space to buf */
> >>> +	strcpy(buf, strim(copy_buf));
> >>> +
> >>> +	fclose(file);
> >>> +	return buf;
> >>> +
> >>> +done:
> >> 
> >> Please rename this goto label to "not_found", "done" isn't intention
> >> revealing.
> >> 
> >>> +	free(buf);
> >>> +	fclose(file);
> >>> +	return NULL;
> >>> +}
> >>> /*
> >>> * Check whether a CPU is online
> >>> *
> >>> diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
> >>> index 0eb4bc29a5a4..b0f754364bd4 100644
> >>> --- a/tools/perf/util/header.h
> >>> +++ b/tools/perf/util/header.h
> >>> @@ -166,4 +166,5 @@ int get_cpuid(char *buffer, size_t sz);
> >>> 
> >>> char *get_cpuid_str(struct perf_pmu *pmu __maybe_unused);
> >>> int strcmp_cpuid_str(const char *s1, const char *s2);
> >>> +char *cpuinfo_field(const char *search);
> >>> #endif /* __PERF_HEADER_H */
> >>> -- 
> >>> 2.35.1
> >> 
> >> -- 
> >> 
> >> - Arnaldo

-- 

- Arnaldo
