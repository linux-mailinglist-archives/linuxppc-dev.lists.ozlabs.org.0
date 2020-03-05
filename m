Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84813179CF2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 01:48:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XsYG2bmhzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 11:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XsWl6WzJzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 11:46:43 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0250ihNR022125
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2020 19:46:41 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhr4jman5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 19:46:41 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 5 Mar 2020 00:46:38 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 00:46:30 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0250jVxY44957954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 00:45:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90524A404D;
 Thu,  5 Mar 2020 00:46:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFE3CA4040;
 Thu,  5 Mar 2020 00:46:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 00:46:28 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D831CA0264;
 Thu,  5 Mar 2020 11:46:23 +1100 (AEDT)
Subject: Re: [PATCH v3 19/27] powerpc/powernv/pmem: Add an IOCTL to report
 controller statistics
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-20-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 5 Mar 2020 11:46:27 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-20-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030500-0020-0000-0000-000003B09316
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030500-0021-0000-0000-00002208CBFC
Message-Id: <c0002b11-7f54-38d3-4ae2-9008a5cc0b61@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003050001
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
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The controller can report a number of statistics that are useful
> in evaluating the performance and reliability of the card.
> 
> This patch exposes this information via an IOCTL.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/platforms/powernv/pmem/ocxl.c | 185 +++++++++++++++++++++
>   include/uapi/nvdimm/ocxl-pmem.h            |  17 ++
>   2 files changed, 202 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> index 2cabafe1fc58..009d4fd29e7d 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> @@ -758,6 +758,186 @@ static int ioctl_controller_dump_complete(struct ocxlpmem *ocxlpmem)
>   				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED);
>   }
>   
> +/**
> + * controller_stats_header_parse() - Parse the first 64 bits of the controller stats admin command response
> + * @ocxlpmem: the device metadata
> + * @length: out, returns the number of bytes in the response (excluding the 64 bit header)
> + */
> +static int controller_stats_header_parse(struct ocxlpmem *ocxlpmem,
> +	u32 *length)
> +{
> +	int rc;
> +	u64 val;
> +
> +	u16 data_identifier;
> +	u32 data_length;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	data_identifier = val >> 48;
> +	data_length = val & 0xFFFFFFFF;
> +
> +	if (data_identifier != 0x4353) { // 'CS'
> +		dev_err(&ocxlpmem->dev,
> +			"Bad data identifier for controller stats, expected 'CS', got '%-.*s'\n",
> +			2, (char *)&data_identifier);
> +		return -EINVAL;

Same comment as earlier patches re EINVAL

> +	}
> +
> +	*length = data_length;
> +	return 0;
> +}
> +
> +static int ioctl_controller_stats(struct ocxlpmem *ocxlpmem,
> +				  struct ioctl_ocxl_pmem_controller_stats __user *uarg)
> +{
> +	struct ioctl_ocxl_pmem_controller_stats args;
> +	u32 length;
> +	int rc;
> +	u64 val;
> +
> +	memset(&args, '\0', sizeof(args));
> +
> +	mutex_lock(&ocxlpmem->admin_command.lock);
> +
> +	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_CONTROLLER_STATS);
> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> +				      ocxlpmem->admin_command.request_offset + 0x08,
> +				      OCXL_LITTLE_ENDIAN, 0);
> +	if (rc)
> +		goto out;
> +
> +	rc = admin_command_execute(ocxlpmem);
> +	if (rc)
> +		goto out;
> +
> +
> +	rc = admin_command_complete_timeout(ocxlpmem,
> +					    ADMIN_COMMAND_CONTROLLER_STATS);
> +	if (rc < 0) {
> +		dev_warn(&ocxlpmem->dev, "Controller stats timed out\n");
> +		goto out;
> +	}
> +
> +	rc = admin_response(ocxlpmem);
> +	if (rc < 0)
> +		goto out;
> +	if (rc != STATUS_SUCCESS) {
> +		warn_status(ocxlpmem,
> +			    "Unexpected status from controller stats", rc);
> +		goto out;
> +	}
> +
> +	rc = controller_stats_header_parse(ocxlpmem, &length);
> +	if (rc)
> +		goto out;
> +
> +	if (length != 0x140)
> +		warn_status(ocxlpmem,
> +			    "Unexpected length for controller stats data, expected 0x140, got 0x%x",
> +			    length);

Might be worth a comment to explain where 0x140 comes from (it looks 
correct from my reading of the spec)

> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x08,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		goto out;
> +
> +	args.reset_count = val >> 32;
> +	args.reset_uptime = val & 0xFFFFFFFF;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x10,
> +				     OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		goto out;
> +
> +	args.power_on_uptime = val >> 32;

We're not collecting life remaining?

> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x08,
> +				     OCXL_LITTLE_ENDIAN, &args.host_load_count);

My reading of the spec says HLC is at +0x10

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x10,
> +				     OCXL_LITTLE_ENDIAN, &args.host_store_count);

HSC at +0x18

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x18,
> +				     OCXL_LITTLE_ENDIAN, &args.media_read_count);

MRC is at +0x50

And you're missing CRU, HLD, HSD

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x20,
> +				     OCXL_LITTLE_ENDIAN, &args.media_write_count);

MWC at +0x58

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x28,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_hit_count);

CRHC at +0x90

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x30,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_miss_count);

This field doesn't seem to exist at all in my copy of the spec

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x38,
> +				     OCXL_LITTLE_ENDIAN, &args.media_read_latency);

Nor this one

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x40,
> +				     OCXL_LITTLE_ENDIAN, &args.media_write_latency);

Nor this one

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x48,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_read_latency);

Nor this one

> +	if (rc)
> +		goto out;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +				     ocxlpmem->admin_command.data_offset + 0x08 + 0x40 + 0x50,
> +				     OCXL_LITTLE_ENDIAN, &args.cache_write_latency);

Nor this one

> +	if (rc)
> +		goto out;
> +
> +	if (copy_to_user(uarg, &args, sizeof(args))) {
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	rc = admin_response_handled(ocxlpmem);
> +	if (rc)
> +		goto out;
> +
> +	rc = 0;
> +	goto out;

Per Fred this pattern isn't common in the kernel, but perhaps this is 
just personal taste

> +
> +out:
> +	mutex_unlock(&ocxlpmem->admin_command.lock);
> +	return rc;
> +}
> +
>   static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
>   {
>   	struct ocxlpmem *ocxlpmem = file->private_data;
> @@ -781,6 +961,11 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
>   	case IOCTL_OCXL_PMEM_CONTROLLER_DUMP_COMPLETE:
>   		rc = ioctl_controller_dump_complete(ocxlpmem);
>   		break;
> +
> +	case IOCTL_OCXL_PMEM_CONTROLLER_STATS:
> +		rc = ioctl_controller_stats(ocxlpmem,
> +					    (struct ioctl_ocxl_pmem_controller_stats __user *)args);
> +		break;
>   	}
>   
>   	return rc;
> diff --git a/include/uapi/nvdimm/ocxl-pmem.h b/include/uapi/nvdimm/ocxl-pmem.h
> index d4d8512d03f7..add223aa2fdb 100644
> --- a/include/uapi/nvdimm/ocxl-pmem.h
> +++ b/include/uapi/nvdimm/ocxl-pmem.h
> @@ -50,6 +50,22 @@ struct ioctl_ocxl_pmem_controller_dump_data {
>   	__u64 reserved[8];
>   };
>   
> +struct ioctl_ocxl_pmem_controller_stats {
> +	__u32 reset_count;
> +	__u32 reset_uptime; /* seconds */
> +	__u32 power_on_uptime; /* seconds */
> +	__u64 host_load_count;
> +	__u64 host_store_count;
> +	__u64 media_read_count;
> +	__u64 media_write_count;
> +	__u64 cache_hit_count;
> +	__u64 cache_miss_count;
> +	__u64 media_read_latency; /* nanoseconds */
> +	__u64 media_write_latency; /* nanoseconds */
> +	__u64 cache_read_latency; /* nanoseconds */
> +	__u64 cache_write_latency; /* nanoseconds */
> +};
> +
>   /* ioctl numbers */
>   #define OCXL_PMEM_MAGIC 0x5C
>   /* SCM devices */
> @@ -57,5 +73,6 @@ struct ioctl_ocxl_pmem_controller_dump_data {
>   #define IOCTL_OCXL_PMEM_CONTROLLER_DUMP			_IO(OCXL_PMEM_MAGIC, 0x02)
>   #define IOCTL_OCXL_PMEM_CONTROLLER_DUMP_DATA		_IOWR(OCXL_PMEM_MAGIC, 0x03, struct ioctl_ocxl_pmem_controller_dump_data)
>   #define IOCTL_OCXL_PMEM_CONTROLLER_DUMP_COMPLETE	_IO(OCXL_PMEM_MAGIC, 0x04)
> +#define IOCTL_OCXL_PMEM_CONTROLLER_STATS		_IO(OCXL_PMEM_MAGIC, 0x05)
>   
>   #endif /* _UAPI_OCXL_SCM_H */
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

