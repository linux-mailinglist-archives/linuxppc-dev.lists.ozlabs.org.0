Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBC3926DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 07:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrGWr1rzvz308c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 15:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=zmzZ/I2N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=zmzZ/I2N; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrGWJ2BRgz2xgL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 15:26:01 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id g24so2076225pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=h1bnschrsOMczPEZLNoLiji8A8+gJ/BheAClc6Aa/2E=;
 b=zmzZ/I2NzsAhjQKQsBa9IaJGNOZRIyK9mJNJvWZuqC7YX7woyjaYm69xDyAV9bQ88t
 CB7mS2jcQ1kY8i8AIDQwsMjldlJolJY5bhsdWXDREYmAkJ0HWTbKsajJN+vHlS4TUe1R
 yew0sVs8VAhJ/XrJzZh6QxxUa7YT3PPbK+VqM5YLmHXxrAIAcz0Znwv3rMn9c/mSVkfx
 mO0WiYtCeFWxYkUKsix6h+AWOFAvX7HR2cswcXhZ9hYs0hrxxZXVUloPbsAMCN25pqFl
 pK1qGvAcXW5+uJEhFiYs5xDPk6yFVEAH8pYcV4VrTlSzfXXdRHj9Sf1NXO/zPf8PgwXn
 XGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=h1bnschrsOMczPEZLNoLiji8A8+gJ/BheAClc6Aa/2E=;
 b=mXy/huGZmR41EvyT7BWTokewMP1k4n+6X2A0/gP/dylGdIMb1AQdPU2I7Iip69E5MC
 CSAWEJQ7M2+OBtaZaFxIYg7Uq3Jw9F1ArcmVupKwCh+O63vpdRnUrVIbG6WsFXNYECoo
 ZP40spsZvivpwTyxYvoFqcs6yn3Xxg97np4vLapyMoqLp4771j5Tea0odpGdd9P2ktW9
 vPW5oRSh5uaOpPO8XpZy8ElusovC9g+nVJu1Xt83Ww8DJqPzeHNfwZaGhOJ7WFsIgGKT
 8hOPiiXek069ce4TrTgmm0860GIXmaxQSUOF09SWQbTXYFbxeVBiJSmDEU3e2DPYpM4+
 yokw==
X-Gm-Message-State: AOAM530cEcKQcwuboyLNdhVHU9NYMx+vpEBGmJSoyv9c9hDkbCeipDN0
 /xYudlCSWDhI3fthaX2tzDtkaw==
X-Google-Smtp-Source: ABdhPJyypRKzSzRDtGSJP25gItufSU6hNc20UmMMxRApHmdn7kT8DY8/vyYWbjsbrqdNmzGWEIFWeA==
X-Received: by 2002:a17:902:b412:b029:ef:1737:ed with SMTP id
 x18-20020a170902b412b02900ef173700edmr1804911plr.43.1622093159885; 
 Wed, 26 May 2021 22:25:59 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id v9sm787947pfn.22.2021.05.26.22.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 22:25:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/papr_scm: Add support for reporting
 dirty-shutdown-count
In-Reply-To: <20210521111023.413732-1-vaibhav@linux.ibm.com>
References: <20210521111023.413732-1-vaibhav@linux.ibm.com>
Date: Thu, 27 May 2021 10:55:54 +0530
Message-ID: <87im34hhnh.fsf@fossix.org>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Vaibhav,

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Persistent memory devices like NVDIMMs can loose cached writes in case
> something prevents flush on power-fail. Such situations are termed as
> dirty shutdown and are exposed to applications as
> last-shutdown-state (LSS) flag and a dirty-shutdown-counter(DSC) as
> described at [1]. The latter being useful in conditions where multiple
> applications want to detect a dirty shutdown event without racing with
> one another.
>
> PAPR-NVDIMMs have so far only exposed LSS style flags to indicate a
> dirty-shutdown-state. This patch further adds support for DSC via the
> "ibm,persistence-failed-count" device tree property of an NVDIMM. This
> property is a monotonic increasing 64-bit counter thats an indication
> of number of times an NVDIMM has encountered a dirty-shutdown event
> causing persistence loss.
>
> Since this value is not expected to change after system-boot hence
> papr_scm reads & caches its value during NVDIMM probe and exposes it
> as a PAPR sysfs attributed named 'dirty_shutdown' to match the name of
> similarly named NFIT sysfs attribute. Also this value is available to
> libnvdimm via PAPR_PDSM_HEALTH payload. 'struct nd_papr_pdsm_health'
> has been extended to add a new member called 'dimm_dsc' presence of
> which is indicated by the newly introduced PDSM_DIMM_DSC_VALID flag.
>
> References:
> [1] https://pmem.io/documents/Dirty_Shutdown_Handling-V1.0.pdf
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/include/uapi/asm/papr_pdsm.h |  6 +++++
>  arch/powerpc/platforms/pseries/papr_scm.c | 30 +++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> index 50ef95e2f5b1..82488b1e7276 100644
> --- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> @@ -77,6 +77,9 @@
>  /* Indicate that the 'dimm_fuel_gauge' field is valid */
>  #define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
>  
> +/* Indicate that the 'dimm_dsc' field is valid */
> +#define PDSM_DIMM_DSC_VALID 2
> +
>  /*
>   * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
>   * Various flags indicate the health status of the dimm.
> @@ -105,6 +108,9 @@ struct nd_papr_pdsm_health {
>  
>  			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
>  			__u16 dimm_fuel_gauge;
> +
> +			/* Extension flag PDSM_DIMM_DSC_VALID */
> +			__u64 dimm_dsc;
>  		};
>  		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
>  	};
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 11e7b90a3360..68f0d3d5e899 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -114,6 +114,9 @@ struct papr_scm_priv {
>  	/* Health information for the dimm */
>  	u64 health_bitmap;
>  
> +	/* Holds the last known dirty shutdown counter value */
> +	u64 dirty_shutdown_counter;
> +
>  	/* length of the stat buffer as expected by phyp */
>  	size_t stat_buffer_len;
>  };
> @@ -603,6 +606,16 @@ static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
>  	return rc;
>  }
>  
> +/* Add the dirty-shutdown-counter value to the pdsm */
> +static int papr_psdm_dsc(struct papr_scm_priv *p,
                   ^^^^ should be pdsm
> +			 union nd_pdsm_payload *payload)
> +{
> +	payload->health.extension_flags |= PDSM_DIMM_DSC_VALID;
> +	payload->health.dimm_dsc = p->dirty_shutdown_counter;
> +
> +	return sizeof(struct nd_papr_pdsm_health);
> +}
> +
>  /* Fetch the DIMM health info and populate it in provided package. */
>  static int papr_pdsm_health(struct papr_scm_priv *p,
>  			    union nd_pdsm_payload *payload)
> @@ -646,6 +659,8 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
>  
>  	/* Populate the fuel gauge meter in the payload */
>  	papr_pdsm_fuel_gauge(p, payload);
> +	/* Populate the dirty-shutdown-counter field */
> +	papr_psdm_dsc(p, payload);
             ^^^^ same typo

Thanks,
Santosh

>  
>  	rc = sizeof(struct nd_papr_pdsm_health);
>  
> @@ -907,6 +922,16 @@ static ssize_t flags_show(struct device *dev,
>  }
>  DEVICE_ATTR_RO(flags);
>  
> +static ssize_t dirty_shutdown_show(struct device *dev,
> +			  struct device_attribute *attr, char *buf)
> +{
> +	struct nvdimm *dimm = to_nvdimm(dev);
> +	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
> +
> +	return sysfs_emit(buf, "%llu\n", p->dirty_shutdown_counter);
> +}
> +DEVICE_ATTR_RO(dirty_shutdown);
> +
>  static umode_t papr_nd_attribute_visible(struct kobject *kobj,
>  					 struct attribute *attr, int n)
>  {
> @@ -925,6 +950,7 @@ static umode_t papr_nd_attribute_visible(struct kobject *kobj,
>  static struct attribute *papr_nd_attributes[] = {
>  	&dev_attr_flags.attr,
>  	&dev_attr_perf_stats.attr,
> +	&dev_attr_dirty_shutdown.attr,
>  	NULL,
>  };
>  
> @@ -1149,6 +1175,10 @@ static int papr_scm_probe(struct platform_device *pdev)
>  	p->is_volatile = !of_property_read_bool(dn, "ibm,cache-flush-required");
>  	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
>  
> +	if (of_property_read_u64(dn, "ibm,persistence-failed-count",
> +				 &p->dirty_shutdown_counter))
> +		p->dirty_shutdown_counter = 0;
> +
>  	/* We just need to ensure that set cookies are unique across */
>  	uuid_parse(uuid_str, (uuid_t *) uuid);
>  	/*
> -- 
> 2.31.1
