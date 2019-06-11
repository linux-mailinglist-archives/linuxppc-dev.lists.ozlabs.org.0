Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A813C73E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 11:32:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NPsw2YTCzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 19:32:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NPqp39GlzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 19:30:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5B9Mdj8084896
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 05:30:25 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t27ewee5f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 05:29:59 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 11 Jun 2019 10:29:09 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 10:29:07 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5B9T6FD47317246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 09:29:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37FE211C050;
 Tue, 11 Jun 2019 09:29:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA52F11C058;
 Tue, 11 Jun 2019 09:29:04 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.93.18])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 11 Jun 2019 09:29:04 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: dan.j.williams@intel.com
Subject: Re: [PATCH v3 1/6] nvdimm: Consider probe return -EOPNOTSUPP as
 success
In-Reply-To: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
References: <20190604091357.32213-1-aneesh.kumar@linux.ibm.com>
Date: Tue, 11 Jun 2019 14:59:03 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19061109-0008-0000-0000-000002F235AC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061109-0009-0000-0000-0000225F2F8C
Message-Id: <87pnnkcvxc.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906110064
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Dan,

Any feedback on this?

A change I would like to get done on top of this series is

+	if (__le16_to_cpu(pfn_sb->version_minor) < 3) {
+		/*
+		 * For a large part we use PAGE_SIZE. But we
+		 * do have some accounting code using SZ_4K.
+		 */
+		pfn_sb->page_struct_size = cpu_to_le16(64);
+		pfn_sb->page_size = cpu_to_le32(SZ_4K);
+	}
+

to

+	if (__le16_to_cpu(pfn_sb->version_minor) < 3) {
+		/*
+		 * For a large part we use PAGE_SIZE. But we
+		 * do have some accounting code using SZ_4K.
+		 */
+		pfn_sb->page_struct_size = cpu_to_le16(64);
+		pfn_sb->page_size = cpu_to_le32(PAGE_SIZE);
+	}
+


That would make sure we will able to access the namespace created on
powerpc with newer kernel.

Kindly let me know if you want to see further changes to this series. Do
you think this is ready for next merge window?

-aneesh

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> With following patches we add EOPNOTSUPP as return from probe callback to
> indicate we were not able to initialize a namespace due to pfn superblock
> feature/version mismatch. We want to consider this a probe success so that
> we can create new namesapce seed and there by avoid marking the failed
> namespace as the seed namespace.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/nvdimm/bus.c         |  4 ++--
>  drivers/nvdimm/nd-core.h     |  3 ++-
>  drivers/nvdimm/region_devs.c | 19 +++++++++++++++----
>  3 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> index 2eb6a6cfe9e4..792b3e90453b 100644
> --- a/drivers/nvdimm/bus.c
> +++ b/drivers/nvdimm/bus.c
> @@ -100,8 +100,8 @@ static int nvdimm_bus_probe(struct device *dev)
>  
>  	nvdimm_bus_probe_start(nvdimm_bus);
>  	rc = nd_drv->probe(dev);
> -	if (rc == 0)
> -		nd_region_probe_success(nvdimm_bus, dev);
> +	if (rc == 0 || rc == -EOPNOTSUPP)
> +		nd_region_probe_success(nvdimm_bus, dev, rc);
>  	else
>  		nd_region_disable(nvdimm_bus, dev);
>  	nvdimm_bus_probe_end(nvdimm_bus);
> diff --git a/drivers/nvdimm/nd-core.h b/drivers/nvdimm/nd-core.h
> index e5ffd5733540..9e67a79fb6d5 100644
> --- a/drivers/nvdimm/nd-core.h
> +++ b/drivers/nvdimm/nd-core.h
> @@ -134,7 +134,8 @@ int __init nvdimm_bus_init(void);
>  void nvdimm_bus_exit(void);
>  void nvdimm_devs_exit(void);
>  void nd_region_devs_exit(void);
> -void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus, struct device *dev);
> +void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus,
> +			     struct device *dev, int ret);
>  struct nd_region;
>  void nd_region_create_ns_seed(struct nd_region *nd_region);
>  void nd_region_create_btt_seed(struct nd_region *nd_region);
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index b4ef7d9ff22e..fcf3d8828540 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -723,7 +723,7 @@ void nd_mapping_free_labels(struct nd_mapping *nd_mapping)
>   * disable the region.
>   */
>  static void nd_region_notify_driver_action(struct nvdimm_bus *nvdimm_bus,
> -		struct device *dev, bool probe)
> +					   struct device *dev, bool probe, int ret)
>  {
>  	struct nd_region *nd_region;
>  
> @@ -753,6 +753,16 @@ static void nd_region_notify_driver_action(struct nvdimm_bus *nvdimm_bus,
>  			nd_region_create_ns_seed(nd_region);
>  		nvdimm_bus_unlock(dev);
>  	}
> +
> +	if (dev->parent && is_nd_region(dev->parent) &&
> +	    !probe && (ret == -EOPNOTSUPP)) {
> +		nd_region = to_nd_region(dev->parent);
> +		nvdimm_bus_lock(dev);
> +		if (nd_region->ns_seed == dev)
> +			nd_region_create_ns_seed(nd_region);
> +		nvdimm_bus_unlock(dev);
> +	}
> +
>  	if (is_nd_btt(dev) && probe) {
>  		struct nd_btt *nd_btt = to_nd_btt(dev);
>  
> @@ -788,14 +798,15 @@ static void nd_region_notify_driver_action(struct nvdimm_bus *nvdimm_bus,
>  	}
>  }
>  
> -void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus, struct device *dev)
> +void nd_region_probe_success(struct nvdimm_bus *nvdimm_bus,
> +			     struct device *dev, int ret)
>  {
> -	nd_region_notify_driver_action(nvdimm_bus, dev, true);
> +	nd_region_notify_driver_action(nvdimm_bus, dev, true, ret);
>  }
>  
>  void nd_region_disable(struct nvdimm_bus *nvdimm_bus, struct device *dev)
>  {
> -	nd_region_notify_driver_action(nvdimm_bus, dev, false);
> +	nd_region_notify_driver_action(nvdimm_bus, dev, false, 0);
>  }
>  
>  static ssize_t mappingN(struct device *dev, char *buf, int n)
> -- 
> 2.21.0

