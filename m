Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC8150E81
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 18:17:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BDyw3hnvzDqBc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 04:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDpw75glzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 04:10:16 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013H98Pg082360; Mon, 3 Feb 2020 12:10:12 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xxhfan8b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 12:10:12 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 013H1lOK012287;
 Mon, 3 Feb 2020 17:10:11 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 2xw0y62h8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 17:10:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 013HABDU13304444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 17:10:11 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AB9EB2073;
 Mon,  3 Feb 2020 17:10:10 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7B60B2071;
 Mon,  3 Feb 2020 17:09:54 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.92.150])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 17:09:54 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Subject: Re: [PATCH 4/5] libnvdimm/region: Introduce NDD_LABELING
In-Reply-To: <158041477856.3889308.4212605617834097674.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158041475480.3889308.655103391935006598.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158041477856.3889308.4212605617834097674.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Mon, 03 Feb 2020 22:39:52 +0530
Message-ID: <87pnevfvhb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_06:2020-02-02,
 2020-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002030127
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
Cc: linuxppc-dev@lists.ozlabs.org, hch@lst.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> The NDD_ALIASING flag is used to indicate where pmem capacity might
> alias with blk capacity and require labeling. It is also used to
> indicate whether the DIMM supports labeling. Separate this latter
> capability into its own flag so that the NDD_ALIASING flag is scoped to
> true aliased configurations.
>
> To my knowledge aliased configurations only exist in the ACPI spec,
> there are no known platforms that ship this support in production.
>
> This clarity allows namespace-capacity alignment constraints around
> interleave-ways to be relaxed.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c |    2 +-
>  drivers/acpi/nfit/core.c                  |    4 +++-
>  drivers/nvdimm/dimm.c                     |    2 +-
>  drivers/nvdimm/dimm_devs.c                |    9 +++++----
>  drivers/nvdimm/namespace_devs.c           |    2 +-
>  drivers/nvdimm/nd.h                       |    2 +-
>  drivers/nvdimm/region_devs.c              |   10 +++++-----
>  include/linux/libnvdimm.h                 |    2 ++
>  8 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index c2ef320ba1bf..aae60cfd4e38 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -326,7 +326,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  	}
>  
>  	dimm_flags = 0;
> -	set_bit(NDD_ALIASING, &dimm_flags);
> +	set_bit(NDD_LABELING, &dimm_flags);
>  
>  	p->nvdimm = nvdimm_create(p->bus, p, NULL, dimm_flags,
>  				  PAPR_SCM_DIMM_CMD_MASK, 0, NULL);
> diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
> index a3320f93616d..71d7f2aa1b12 100644
> --- a/drivers/acpi/nfit/core.c
> +++ b/drivers/acpi/nfit/core.c
> @@ -2026,8 +2026,10 @@ static int acpi_nfit_register_dimms(struct acpi_nfit_desc *acpi_desc)
>  			continue;
>  		}
>  
> -		if (nfit_mem->bdw && nfit_mem->memdev_pmem)
> +		if (nfit_mem->bdw && nfit_mem->memdev_pmem) {
>  			set_bit(NDD_ALIASING, &flags);
> +			set_bit(NDD_LABELING, &flags);
> +		}
>  
>  		/* collate flags across all memdevs for this dimm */
>  		list_for_each_entry(nfit_memdev, &acpi_desc->memdevs, list) {
> diff --git a/drivers/nvdimm/dimm.c b/drivers/nvdimm/dimm.c
> index 64776ed15bb3..7d4ddc4d9322 100644
> --- a/drivers/nvdimm/dimm.c
> +++ b/drivers/nvdimm/dimm.c
> @@ -99,7 +99,7 @@ static int nvdimm_probe(struct device *dev)
>  	if (ndd->ns_current >= 0) {
>  		rc = nd_label_reserve_dpa(ndd);
>  		if (rc == 0)
> -			nvdimm_set_aliasing(dev);
> +			nvdimm_set_labeling(dev);
>  	}
>  	nvdimm_bus_unlock(dev);
>  
> diff --git a/drivers/nvdimm/dimm_devs.c b/drivers/nvdimm/dimm_devs.c
> index 94ea6dba6b4f..64159d4d4b8f 100644
> --- a/drivers/nvdimm/dimm_devs.c
> +++ b/drivers/nvdimm/dimm_devs.c
> @@ -32,7 +32,7 @@ int nvdimm_check_config_data(struct device *dev)
>  
>  	if (!nvdimm->cmd_mask ||
>  	    !test_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm->cmd_mask)) {
> -		if (test_bit(NDD_ALIASING, &nvdimm->flags))
> +		if (test_bit(NDD_LABELING, &nvdimm->flags))
>  			return -ENXIO;
>  		else
>  			return -ENOTTY;
> @@ -173,11 +173,11 @@ int nvdimm_set_config_data(struct nvdimm_drvdata *ndd, size_t offset,
>  	return rc;
>  }
>  
> -void nvdimm_set_aliasing(struct device *dev)
> +void nvdimm_set_labeling(struct device *dev)
>  {
>  	struct nvdimm *nvdimm = to_nvdimm(dev);
>  
> -	set_bit(NDD_ALIASING, &nvdimm->flags);
> +	set_bit(NDD_LABELING, &nvdimm->flags);
>  }
>  
>  void nvdimm_set_locked(struct device *dev)
> @@ -312,8 +312,9 @@ static ssize_t flags_show(struct device *dev,
>  {
>  	struct nvdimm *nvdimm = to_nvdimm(dev);
>  
> -	return sprintf(buf, "%s%s\n",
> +	return sprintf(buf, "%s%s%s\n",
>  			test_bit(NDD_ALIASING, &nvdimm->flags) ? "alias " : "",
> +			test_bit(NDD_LABELING, &nvdimm->flags) ? "label" : "",
>  			test_bit(NDD_LOCKED, &nvdimm->flags) ? "lock " : "");
>  }
>  static DEVICE_ATTR_RO(flags);
> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> index aff1f32fdb4f..30cda9f235de 100644
> --- a/drivers/nvdimm/namespace_devs.c
> +++ b/drivers/nvdimm/namespace_devs.c
> @@ -2531,7 +2531,7 @@ static int init_active_labels(struct nd_region *nd_region)
>  		if (!ndd) {
>  			if (test_bit(NDD_LOCKED, &nvdimm->flags))
>  				/* fail, label data may be unreadable */;
> -			else if (test_bit(NDD_ALIASING, &nvdimm->flags))
> +			else if (test_bit(NDD_LABELING, &nvdimm->flags))
>  				/* fail, labels needed to disambiguate dpa */;
>  			else
>  				return 0;
> diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
> index c9f6a5b5253a..ca39abe29c7c 100644
> --- a/drivers/nvdimm/nd.h
> +++ b/drivers/nvdimm/nd.h
> @@ -252,7 +252,7 @@ int nvdimm_set_config_data(struct nvdimm_drvdata *ndd, size_t offset,
>  		void *buf, size_t len);
>  long nvdimm_clear_poison(struct device *dev, phys_addr_t phys,
>  		unsigned int len);
> -void nvdimm_set_aliasing(struct device *dev);
> +void nvdimm_set_labeling(struct device *dev);
>  void nvdimm_set_locked(struct device *dev);
>  void nvdimm_clear_locked(struct device *dev);
>  int nvdimm_security_setup_events(struct device *dev);
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index a19e535830d9..a5fc6e4c56ff 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -195,16 +195,16 @@ EXPORT_SYMBOL_GPL(nd_blk_region_set_provider_data);
>  int nd_region_to_nstype(struct nd_region *nd_region)
>  {
>  	if (is_memory(&nd_region->dev)) {
> -		u16 i, alias;
> +		u16 i, label;
>  
> -		for (i = 0, alias = 0; i < nd_region->ndr_mappings; i++) {
> +		for (i = 0, label = 0; i < nd_region->ndr_mappings; i++) {
>  			struct nd_mapping *nd_mapping = &nd_region->mapping[i];
>  			struct nvdimm *nvdimm = nd_mapping->nvdimm;
>  
> -			if (test_bit(NDD_ALIASING, &nvdimm->flags))
> -				alias++;
> +			if (test_bit(NDD_LABELING, &nvdimm->flags))
> +				label++;
>  		}
> -		if (alias)
> +		if (label)
>  			return ND_DEVICE_NAMESPACE_PMEM;
>  		else
>  			return ND_DEVICE_NAMESPACE_IO;
> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
> index 9df091bd30ba..18da4059be09 100644
> --- a/include/linux/libnvdimm.h
> +++ b/include/linux/libnvdimm.h
> @@ -37,6 +37,8 @@ enum {
>  	NDD_WORK_PENDING = 4,
>  	/* ignore / filter NSLABEL_FLAG_LOCAL for this DIMM, i.e. no aliasing */
>  	NDD_NOBLK = 5,
> +	/* dimm supports namespace labels */
> +	NDD_LABELING = 6,
>  
>  	/* need to set a limit somewhere, but yes, this is likely overkill */
>  	ND_IOCTL_MAX_BUFLEN = SZ_4M,
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
