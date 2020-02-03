Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0950150E76
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 18:15:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BDwV0x5pzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 04:15:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDpP3hC0zDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 04:09:49 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013H7WQL186096; Mon, 3 Feb 2020 12:09:46 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xxm9cx4cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 12:09:45 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 013H8uA2010912;
 Mon, 3 Feb 2020 17:09:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2xw0y6q670-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 17:09:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 013H9fod43188636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 17:09:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98078C6055;
 Mon,  3 Feb 2020 17:09:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E78C6057;
 Mon,  3 Feb 2020 17:09:39 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.92.150])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 17:09:38 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Subject: Re: [PATCH 3/5] libnvdimm/namespace: Enforce memremap_compat_align()
In-Reply-To: <158041477336.3889308.4581652885008605170.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158041475480.3889308.655103391935006598.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158041477336.3889308.4581652885008605170.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Mon, 03 Feb 2020 22:39:37 +0530
Message-ID: <87sgjrfvhq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_06:2020-02-02,
 2020-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

> The pmem driver on PowerPC crashes with the following signature when
> instantiating misaligned namespaces that map their capacity via
> memremap_pages().
>
>     BUG: Unable to handle kernel data access at 0xc001000406000000
>     Faulting instruction address: 0xc000000000090790
>     NIP [c000000000090790] arch_add_memory+0xc0/0x130
>     LR [c000000000090744] arch_add_memory+0x74/0x130
>     Call Trace:
>      arch_add_memory+0x74/0x130 (unreliable)
>      memremap_pages+0x74c/0xa30
>      devm_memremap_pages+0x3c/0xa0
>      pmem_attach_disk+0x188/0x770
>      nvdimm_bus_probe+0xd8/0x470
>
> With the assumption that only memremap_pages() has alignment
> constraints, enforce memremap_compat_align() for
> pmem_should_map_pages(), nd_pfn, or nd_dax cases.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Jeff Moyer <jmoyer@redhat.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  drivers/nvdimm/namespace_devs.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> index 032dc61725ff..aff1f32fdb4f 100644
> --- a/drivers/nvdimm/namespace_devs.c
> +++ b/drivers/nvdimm/namespace_devs.c
> @@ -1739,6 +1739,16 @@ struct nd_namespace_common *nvdimm_namespace_common_probe(struct device *dev)
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> +	if (pmem_should_map_pages(dev) || nd_pfn || nd_dax) {
> +		struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
> +		resource_size_t start = nsio->res.start;
> +
> +		if (!IS_ALIGNED(start | size, memremap_compat_align())) {
> +			dev_dbg(&ndns->dev, "misaligned, unable to map\n");
> +			return ERR_PTR(-EOPNOTSUPP);
> +		}
> +	}
> +
>  	if (is_namespace_pmem(&ndns->dev)) {
>  		struct nd_namespace_pmem *nspm;
>  
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
