Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA00179E58
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 04:40:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XxNk6Gj5zDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 14:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XxHf5gtgzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 14:36:30 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0253W4YW026851
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2020 22:36:28 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhw6ps71u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 22:36:27 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 5 Mar 2020 03:36:24 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 03:36:16 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0253aF4b44433444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 03:36:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9883E5204E;
 Thu,  5 Mar 2020 03:36:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EF6FE5204F;
 Thu,  5 Mar 2020 03:36:14 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AB3D3A0264;
 Thu,  5 Mar 2020 14:36:09 +1100 (AEDT)
Subject: Re: [PATCH v3 24/27] powerpc/powernv/pmem: Expose SMART data via ndctl
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-25-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 5 Mar 2020 14:36:13 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-25-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030503-4275-0000-0000-000003A87B69
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030503-4276-0000-0000-000038BD89E6
Message-Id: <e68c9064-cb7f-2b5e-9a7b-70fd5367270a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050016
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> +static int ndctl_smart(struct ocxlpmem *ocxlpmem, struct nd_cmd_pkg *pkg)
> +{
> +	u32 length, i;
> +	struct nd_ocxl_smart *out;
> +	int rc;
> +
> +	mutex_lock(&ocxlpmem->admin_command.lock);
> +
> +	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_SMART);
> +	if (rc)
> +		goto out;
> +
> +	rc = admin_command_execute(ocxlpmem);
> +	if (rc)
> +		goto out;
> +
> +	rc = admin_command_complete_timeout(ocxlpmem, ADMIN_COMMAND_SMART);
> +	if (rc < 0) {
> +		dev_err(&ocxlpmem->dev, "SMART timeout\n");
> +		goto out;
> +	}
> +
> +	rc = admin_response(ocxlpmem);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		warn_status(ocxlpmem, "Unexpected status from SMART", rc);
> +		goto out;
> +	}
> +
> +	rc = smart_header_parse(ocxlpmem, &length);
> +	if (rc)
> +		goto out;
> +
> +	pkg->nd_fw_size = length;
> +
> +	length = min(length, pkg->nd_size_out); // bytes
> +	out = (struct nd_ocxl_smart *)pkg->nd_payload;
> +	// Each SMART attribute is 2 * 64 bits
> +	out->count = length / (2 * sizeof(u64)); // attributes

 From what I can tell - 8 bytes of nd_ocxl_smart are taken up for the 
count + reserved bytes, so this is going to potentially overrun the user 
buffer.

> +
> +	for (i = 0; i < length; i += sizeof(u64)) {

It might be neater to make i count up by 1 and then multiply by 
sizeof(u64) later.

> +		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +					     ocxlpmem->admin_command.data_offset + sizeof(u64) + i,

+ 0x08 rather than + sizeof(u64) for consistency.

> +					     OCXL_LITTLE_ENDIAN,
> +					     &out->attribs[i/sizeof(u64)]);
> +		if (rc)
> +			goto out;
> +	}
> +
> +	rc = admin_response_handled(ocxlpmem);
> +	if (rc)
> +		goto out;
> +
> +	rc = 0;
> +	goto out;
> +
> +out:
> +	mutex_unlock(&ocxlpmem->admin_command.lock);
> +	return rc;
> +}
> +
> +static int ndctl_call(struct ocxlpmem *ocxlpmem, void *buf, unsigned int buf_len)
> +{
> +	struct nd_cmd_pkg *pkg = buf;
> +
> +	if (buf_len < sizeof(struct nd_cmd_pkg)) {
> +		dev_err(&ocxlpmem->dev, "Invalid ND_CALL size=%u\n", buf_len);
> +		return -EINVAL;
> +	}
> +
> +	if (pkg->nd_family != NVDIMM_FAMILY_OCXL) {
> +		dev_err(&ocxlpmem->dev, "Invalid ND_CALL family=0x%llx\n", pkg->nd_family);
> +		return -EINVAL;
> +	}
> +
> +	switch (pkg->nd_command) {
> +	case ND_CMD_OCXL_SMART:
> +		ndctl_smart(ocxlpmem, pkg);

Did you intend to dispose of the return code here?

> +		break;
> +
> +	default:
> +		dev_err(&ocxlpmem->dev, "Invalid ND_CALL command=0x%llx\n", pkg->nd_command);
> +		return -EINVAL;
> +	}
> +
> +
> +	return 0;
> +}
> +
>   static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
>   		 struct nvdimm *nvdimm,
>   		 unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
> @@ -88,6 +211,10 @@ static int ndctl(struct nvdimm_bus_descriptor *nd_desc,
>   	struct ocxlpmem *ocxlpmem = container_of(nd_desc, struct ocxlpmem, bus_desc);
>   
>   	switch (cmd) {
> +	case ND_CMD_CALL:
> +		*cmd_rc = ndctl_call(ocxlpmem, buf, buf_len);
> +		return 0;
> +
>   	case ND_CMD_GET_CONFIG_SIZE:
>   		*cmd_rc = ndctl_config_size(buf);
>   		return 0;
> @@ -171,6 +298,7 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
>   	set_bit(ND_CMD_GET_CONFIG_SIZE, &nvdimm_cmd_mask);
>   	set_bit(ND_CMD_GET_CONFIG_DATA, &nvdimm_cmd_mask);
>   	set_bit(ND_CMD_SET_CONFIG_DATA, &nvdimm_cmd_mask);
> +	set_bit(ND_CMD_CALL, &nvdimm_cmd_mask);
>   
>   	set_bit(NDD_ALIASING, &nvdimm_flags);
>   
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> index 927690f4888f..0eb7a35d24ae 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> @@ -7,6 +7,7 @@
>   #include <linux/libnvdimm.h>
>   #include <uapi/nvdimm/ocxl-pmem.h>
>   #include <linux/mm.h>
> +#include <linux/ndctl.h>
>   
>   #define LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
>   #define DEFAULT_TIMEOUT 100
> @@ -98,6 +99,23 @@ struct ocxlpmem_function0 {
>   	struct ocxl_fn *ocxl_fn;
>   };
>   
> +struct nd_ocxl_smart {
> +	__u8 count;
> +	__u8 reserved[7];
> +	__u64 attribs[0];
> +} __packed;
> +
> +struct nd_pkg_ocxl {
> +	struct nd_cmd_pkg gen;
> +	union {
> +		struct nd_ocxl_smart smart;
> +	};
> +};
> +
> +enum nd_cmd_ocxl {
> +	ND_CMD_OCXL_SMART = 1,
> +};
> +
>   struct ocxlpmem {
>   	struct device dev;
>   	struct pci_dev *pdev;
> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
> index de5d90212409..2885052e7f40 100644
> --- a/include/uapi/linux/ndctl.h
> +++ b/include/uapi/linux/ndctl.h
> @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
>   #define NVDIMM_FAMILY_HPE2 2
>   #define NVDIMM_FAMILY_MSFT 3
>   #define NVDIMM_FAMILY_HYPERV 4
> +#define NVDIMM_FAMILY_OCXL 6
>   
>   #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
>   					struct nd_cmd_pkg)
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

