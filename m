Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B24EBA8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 08:02:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSwnS04wzz3c2N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 17:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSwmz5Dvqz2xWm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 17:01:52 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KSwmq5FHGz9sS8;
 Wed, 30 Mar 2022 08:01:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WiQPGVHHbfD; Wed, 30 Mar 2022 08:01:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KSwmq4LQfz9sRp;
 Wed, 30 Mar 2022 08:01:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80D408B77A;
 Wed, 30 Mar 2022 08:01:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nDMx8rJUsfAH; Wed, 30 Mar 2022 08:01:47 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49FDC8B765;
 Wed, 30 Mar 2022 08:01:47 +0200 (CEST)
Message-ID: <61a1f568-67da-ce5e-1334-91b5611f9ccb@csgroup.eu>
Date: Wed, 30 Mar 2022 08:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH 2/2] powerpc/papr_scm: Implement support for
 reporting generic nvdimm stats
Content-Language: fr-FR
To: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>
References: <20201108211549.122018-1-vaibhav@linux.ibm.com>
 <20201108211549.122018-2-vaibhav@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20201108211549.122018-2-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, linuxppc-dev@lists.ozlabs.org,
 Ira Weiny <ira.weiny@intel.com>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 08/11/2020 à 22:15, Vaibhav Jain a écrit :
> Add support for reporting papr-scm supported generic nvdimm stats by
> implementing support for handling ND_CMD_GET_STAT in
> 'papr_scm_ndctl().
> 
> The mapping between libnvdimm generic nvdimm-stats and papr-scm
> specific performance-stats is embedded inside 'dimm_stats_map[]'. This
> array is queried by newly introduced 'papr_scm_get_stat()' that
> verifies if the requested nvdimm-stat is supported and if yes does an
> hcall via 'drc_pmem_query_stat()' to request the performance-stat and
> return it back to libnvdimm.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

I see this series is still flagged as 'new' in patchwork.

I saw some patches providing stats to nvdimm are in a pull request for 5.18.

I imagine this is the same subject, so I'm going to change the status of 
this series. Let me know if I'm wrong.

Thanks
Christophe

> ---
>   arch/powerpc/platforms/pseries/papr_scm.c | 66 ++++++++++++++++++++++-
>   1 file changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 835163f54244..51eeab3376fd 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -25,7 +25,8 @@
>   	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>   	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
>   	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
> -	 (1ul << ND_CMD_CALL))
> +	 (1ul << ND_CMD_CALL) |		   \
> +	 (1ul << ND_CMD_GET_STAT))
>   
>   /* DIMM health bitmap bitmap indicators */
>   /* SCM device is unable to persist memory contents */
> @@ -120,6 +121,16 @@ struct papr_scm_priv {
>   static LIST_HEAD(papr_nd_regions);
>   static DEFINE_MUTEX(papr_ndr_lock);
>   
> +/* Map generic nvdimm stats to papr-scm stats */
> +static const char * const dimm_stat_map[] = {
> +	[ND_DIMM_STAT_INVALID] = NULL,
> +	[ND_DIMM_STAT_MEDIA_READS] = "MedRCnt ",
> +	[ND_DIMM_STAT_MEDIA_WRITES] = "MedWCnt ",
> +	[ND_DIMM_STAT_READ_REQUESTS] = "HostLCnt",
> +	[ND_DIMM_STAT_WRITE_REQUESTS] = "HostSCnt",
> +	[ND_DIMM_STAT_MAX] = NULL,
> +};
> +
>   static int drc_pmem_bind(struct papr_scm_priv *p)
>   {
>   	unsigned long ret[PLPAR_HCALL_BUFSIZE];
> @@ -728,6 +739,54 @@ static int papr_scm_service_pdsm(struct papr_scm_priv *p,
>   	return pdsm_pkg->cmd_status;
>   }
>   
> +/*
> + * For a given pdsm request call an appropriate service function.
> + * Returns errors if any while handling the pdsm command package.
> + */
> +static int papr_scm_get_stat(struct papr_scm_priv *p,
> +			     struct nd_cmd_get_dimm_stat *dimm_stat)
> +
> +{
> +	int rc;
> +	ssize_t size;
> +	struct papr_scm_perf_stat *stat;
> +	struct papr_scm_perf_stats *stats;
> +
> +	/* Check if the requested stat-id is supported */
> +	if (dimm_stat->stat_id >= ARRAY_SIZE(dimm_stat_map) ||
> +	    !dimm_stat_map[dimm_stat->stat_id]) {
> +		dev_dbg(&p->pdev->dev, "Invalid stat-id %lld\n", dimm_stat->stat_id);
> +		return -ENOSPC;
> +	}
> +
> +	/* Allocate request buffer enough to hold single performance stat */
> +	size = sizeof(struct papr_scm_perf_stats) +
> +		sizeof(struct papr_scm_perf_stat);
> +
> +	stats = kzalloc(size, GFP_KERNEL);
> +	if (!stats)
> +		return -ENOMEM;
> +
> +	stat = &stats->scm_statistic[0];
> +	memcpy(&stat->stat_id, dimm_stat_map[dimm_stat->stat_id],
> +	       sizeof(stat->stat_id));
> +	stat->stat_val = 0;
> +
> +	/* Fetch the statistic from PHYP and copy it to provided payload */
> +	rc = drc_pmem_query_stats(p, stats, 1);
> +	if (rc < 0) {
> +		dev_dbg(&p->pdev->dev, "Err(%d) fetching stat '%.8s'\n",
> +			rc, stat->stat_id);
> +		kfree(stats);
> +		return rc;
> +	}
> +
> +	dimm_stat->int_val = be64_to_cpu(stat->stat_val);
> +
> +	kfree(stats);
> +	return 0;
> +}
> +
>   static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>   			  struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>   			  unsigned int buf_len, int *cmd_rc)
> @@ -772,6 +831,11 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>   		*cmd_rc = papr_scm_service_pdsm(p, call_pkg);
>   		break;
>   
> +	case ND_CMD_GET_STAT:
> +		*cmd_rc = papr_scm_get_stat(p,
> +					    (struct nd_cmd_get_dimm_stat *)buf);
> +		break;
> +
>   	default:
>   		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
>   		return -EINVAL;
