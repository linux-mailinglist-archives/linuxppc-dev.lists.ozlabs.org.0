Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB58355B7F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 08:36:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWdKX1j1Fz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:36:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CBIxEXo2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWdJy3r1Kz3blh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 16:35:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CBIxEXo2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWdJx3V6Dz4xDB;
	Mon, 27 Jun 2022 16:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656311746;
	bh=Mycrn0ED4S5z/vlAaGNiH4smCjhD8oieIJDxYRO2Qh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CBIxEXo2j5XBPqVDnMFzYE7TtOeywjaHptg++1dSBgHDk9QeHgy2IGIsHO9R8tM9W
	 0caukN4UK58gg3uyvvrlGMt8vlnI3KY4xCVJhr1VF82Hm+gzsHIXOeJUmXaOvrugHc
	 1xJgqwMu32B8woBfcDb1K4uEDoWU2UMW6tolQ/NnuwWFPSI92Fs7Aiex5TLB9exkqs
	 nnYbiBwIvoTK4lat8pZTGH6jwZVizb7Ux/NBhOZzA9b2meqkMHvdsqmM51Yu4obBCA
	 GJbiFiAhCxJKrRQyDdYHZEt7Pp5BUZ8oz42sbB3KUxEOcNHjcmlvDfSXN12T8DT2oX
	 +t+9j/jogXXNA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 vaibhav@linux.ibm.com
Subject: Re: [PATCH] powerpc/papr_scm: Fix nvdimm event mappings
In-Reply-To: <20220610133431.410514-1-kjain@linux.ibm.com>
References: <20220610133431.410514-1-kjain@linux.ibm.com>
Date: Mon, 27 Jun 2022 16:35:41 +1000
Message-ID: <87ilom4nr6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kajol,

A few comments below ...

Kajol Jain <kjain@linux.ibm.com> writes:
> Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
> adds performance monitoring support for papr-scm nvdimm devices via
  ^ 
We're talking about a commit that's already happened so we should use
past tense, so "added".

> perf interface. It also adds one array in papr_scm_priv
                         "added" 
> structure called "nvdimm_events_map", to dynamically save the stat_id
> for events specified in nvdimm driver code "nd_perf.c".
>
> Right now the mapping is done based on the result of 
> H_SCM_PERFORMANCE_STATS hcall, when all the stats are
> requested. Currently there is an assumption, that a
> certain stat will always be found at a specific offset
> in the stat buffer.
                    ^
                    "returned by the hypervisor."

To make it clear where the stat buffer comes from, and that it's out of
our control.

> The assumption may not be true or documented as part of PAPR
> documentation.

That reads as the assumption "may not be documented as part of PAPR". I
think what you mean is the assumption *is not* documented by PAPR, and
although it happens to be true on current systems it may not be true in
future.

> Fixing it, by adding a static mapping for nvdimm events to
  Fix  it
> corresponding stat-id, and removing the map from
> papr_scm_priv structure.
>
> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 59 ++++++++++-------------
>  1 file changed, 25 insertions(+), 34 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 181b855b3050..5434c654a797 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -350,6 +347,26 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>  #ifdef CONFIG_PERF_EVENTS
>  #define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
> 
> +static const char * const nvdimm_events_map[] = {
> +	"N/A",
> +	"CtlResCt",
> +	"CtlResTm",
> +	"PonSecs ",
> +	"MemLife ",
> +	"CritRscU",
> +	"HostLCnt",
> +	"HostSCnt",
> +	"HostSDur",
> +	"HostLDur",
> +	"MedRCnt ",
> +	"MedWCnt ",
> +	"MedRDur ",
> +	"MedWDur ",
> +	"CchRHCnt",
> +	"CchWHCnt",
> +	"FastWCnt",
> +};
  
The order of the strings in that array becomes ABI. Because it defines
the mapping from perf_event.attr.config (perf user ABI) to the actual
event we request from the hypervisor.

So I'd like that made more explicit by using designated initialisers, eg:

static const char * const nvdimm_events_map[] = {
	[1] = "CtlResCt",
	[2] = "CtlResTm",
        ...

That way an accidental reordering of the array won't break anything.

You shouldn't need to specify 0 either as it's not used.

> @@ -370,7 +387,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
>  
>  	stat = &stats->scm_statistic[0];
>  	memcpy(&stat->stat_id,
> -	       &p->nvdimm_events_map[event->attr.config * sizeof(stat->stat_id)],
> +	       nvdimm_events_map[event->attr.config],
>  		sizeof(stat->stat_id));

It's not clear that this won't index off the end of the array.

There is a check in papr_scm_pmu_event_init(), but I'd probably be
happier if we did an explicit check in here as well, eg:

	if (event->attr.config >= ARRAY_SIZE(nvdimm_events_map))
		return -EINVAL;


>  	stat->stat_val = 0;
>  
> @@ -460,10 +477,9 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
>  
>  static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
>  {
> -	struct papr_scm_perf_stat *stat;
>  	struct papr_scm_perf_stats *stats;
>  	u32 available_events;
> -	int index, rc = 0;
> +	int rc = 0;

You shouldn't need to initialise rc here. It's not used until the call
to drc_pmem_query_stats() below.

>  	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
>  			/ sizeof(struct papr_scm_perf_stat);
> @@ -473,34 +489,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
>  	/* Allocate the buffer for phyp where stats are written */
>  	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
>  	if (!stats) {
> -		rc = -ENOMEM;
> -		return rc;
> +		return -ENOMEM;
>  	}
>  
>  	/* Called to get list of events supported */
>  	rc = drc_pmem_query_stats(p, stats, 0);
> -	if (rc)
> -		goto out;
>  
> -	/*
> -	 * Allocate memory and populate nvdimm_event_map.
> -	 * Allocate an extra element for NULL entry
> -	 */
> -	p->nvdimm_events_map = kcalloc(available_events + 1,
> -				       sizeof(stat->stat_id),
> -				       GFP_KERNEL);
> -	if (!p->nvdimm_events_map) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
> -
> -	/* Copy all stat_ids to event map */
> -	for (index = 0, stat = stats->scm_statistic;
> -	     index < available_events; index++, ++stat) {
> -		memcpy(&p->nvdimm_events_map[index * sizeof(stat->stat_id)],
> -		       &stat->stat_id, sizeof(stat->stat_id));
> -	}
> -out:
>  	kfree(stats);
>  	return rc;
>  }

cheers
