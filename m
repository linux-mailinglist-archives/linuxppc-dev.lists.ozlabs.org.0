Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4B017125B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 09:24:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sm172HrLzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 19:24:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SlzB19n5zDqng
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 19:22:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R8Jli0113692
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 03:22:43 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydqf8cb16-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 03:22:43 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 27 Feb 2020 08:22:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 08:22:33 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R8MW6059244768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 08:22:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C1EF4C052;
 Thu, 27 Feb 2020 08:22:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EB914C044;
 Thu, 27 Feb 2020 08:22:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 08:22:31 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 86F63A01C0;
 Thu, 27 Feb 2020 19:22:26 +1100 (AEDT)
Subject: Re: [PATCH v3 14/27] powerpc/powernv/pmem: Add support for Admin
 commands
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-15-alastair@au1.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 27 Feb 2020 19:22:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221032720.33893-15-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022708-4275-0000-0000-000003A5E75C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022708-4276-0000-0000-000038BA2265
Message-Id: <c88a3808-3ce9-ff6c-b963-ca9317092145@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_02:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270067
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
> This patch requests the metadata required to issue admin commands, as well
> as some helper functions to construct and check the completion of the
> commands.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>   arch/powerpc/platforms/powernv/pmem/ocxl.c    |  65 ++++++++
>   .../platforms/powernv/pmem/ocxl_internal.c    | 153 ++++++++++++++++++
>   .../platforms/powernv/pmem/ocxl_internal.h    |  61 +++++++
>   3 files changed, 279 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> index 431212c9f0cc..4e782d22605b 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> @@ -216,6 +216,58 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
>   	return 0;
>   }
>   
> +/**
> + * extract_command_metadata() - Extract command data from MMIO & save it for further use
> + * @ocxlpmem: the device metadata
> + * @offset: The base address of the command data structures (address of CREQO)
> + * @command_metadata: A pointer to the command metadata to populate
> + * Return: 0 on success, negative on failure
> + */
> +static int extract_command_metadata(struct ocxlpmem *ocxlpmem, u32 offset,
> +					struct command_metadata *command_metadata)
> +{
> +	int rc;
> +	u64 tmp;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, offset, OCXL_LITTLE_ENDIAN,
> +				     &tmp);
> +	if (rc)
> +		return rc;
> +
> +	command_metadata->request_offset = tmp >> 32;
> +	command_metadata->response_offset = tmp & 0xFFFFFFFF;
> +
> +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, offset + 8, OCXL_LITTLE_ENDIAN,
> +				     &tmp);
> +	if (rc)
> +		return rc;
> +
> +	command_metadata->data_offset = tmp >> 32;
> +	command_metadata->data_size = tmp & 0xFFFFFFFF;
> +
> +	command_metadata->id = 0;
> +
> +	return 0;
> +}
> +
> +/**
> + * setup_command_metadata() - Set up the command metadata
> + * @ocxlpmem: the device metadata
> + */
> +static int setup_command_metadata(struct ocxlpmem *ocxlpmem)
> +{
> +	int rc;
> +
> +	mutex_init(&ocxlpmem->admin_command.lock);
> +
> +	rc = extract_command_metadata(ocxlpmem, GLOBAL_MMIO_ACMA_CREQO,
> +				      &ocxlpmem->admin_command);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
>   /**
>    * is_usable() - Is a controller usable?
>    * @ocxlpmem: the device metadata
> @@ -456,6 +508,14 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	}
>   	ocxlpmem->pdev = pdev;
>   
> +	ocxlpmem->timeouts[ADMIN_COMMAND_ERRLOG] = 2000; // ms
> +	ocxlpmem->timeouts[ADMIN_COMMAND_HEARTBEAT] = 100; // ms
> +	ocxlpmem->timeouts[ADMIN_COMMAND_SMART] = 100; // ms
> +	ocxlpmem->timeouts[ADMIN_COMMAND_CONTROLLER_DUMP] = 1000; // ms
> +	ocxlpmem->timeouts[ADMIN_COMMAND_CONTROLLER_STATS] = 100; // ms
> +	ocxlpmem->timeouts[ADMIN_COMMAND_SHUTDOWN] = 1000; // ms
> +	ocxlpmem->timeouts[ADMIN_COMMAND_FW_UPDATE] = 16000; // ms

Why are we keeping these timeouts in a per device struct? I can't see 
anywhere where we change these values.

> +
>   	pci_set_drvdata(pdev, ocxlpmem);
>   
>   	ocxlpmem->ocxl_fn = ocxl_function_open(pdev);
> @@ -501,6 +561,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   		goto err;
>   	}
>   
> +	if (setup_command_metadata(ocxlpmem)) {
> +		dev_err(&pdev->dev, "Could not read OCXL command matada\n");

metadata

Also, "OCXL command metadata" is misleading, this is a pmem specific 
thing, not an OpenCAPI thing, I would prefer just "command metadata".

> +		goto err;
> +	}
> +
>   	elapsed = 0;
>   	timeout = ocxlpmem->readiness_timeout + ocxlpmem->memory_available_timeout;
>   	while (!is_usable(ocxlpmem, false)) {
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c
> index 617ca943b1b8..583f48023025 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.c
> @@ -17,3 +17,156 @@ int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi)
>   
>   	return 0;
>   }
> +
> +#define COMMAND_REQUEST_SIZE (8 * sizeof(u64))
> +static int scm_command_request(const struct ocxlpmem *ocxlpmem,
> +			       struct command_metadata *cmd, u8 op_code)
> +{
> +	u64 val = op_code;
> +	int rc;
> +	u8 i;
> +
> +	cmd->op_code = op_code;
> +	cmd->id++;
> +
> +	val |= ((u64)cmd->id) << 16;
> +
> +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, cmd->request_offset,
> +				      OCXL_LITTLE_ENDIAN, val);
> +	if (rc)
> +		return rc;
> +
> +	for (i = sizeof(u64); i < COMMAND_REQUEST_SIZE; i += sizeof(u64)) {
> +		rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> +					      cmd->request_offset + i,
> +					      OCXL_LITTLE_ENDIAN, 0);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +int admin_command_request(struct ocxlpmem *ocxlpmem, u8 op_code)
> +{
> +	u64 val;
> +	int rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHI,
> +					 OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;

Ignoring the value here expected, you're just trying to verify that you 
don't see an error on the read?

> +
> +	return scm_command_request(ocxlpmem, &ocxlpmem->admin_command, op_code);
> +}
> +
> +static int command_response(const struct ocxlpmem *ocxlpmem,
> +			    const struct command_metadata *cmd)
> +{
> +	u64 val;
> +	u16 id;
> +	u8 status;
> +	int rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +					 cmd->response_offset,
> +					 OCXL_LITTLE_ENDIAN, &val);
> +	if (rc)
> +		return rc;
> +
> +	status = val & 0xff;
> +	id = (val >> 16) & 0xffff;
> +
> +	if (id != cmd->id) {
> +		dev_warn(&ocxlpmem->dev,
> +			 "Expected response for command %d, but received response for command %d instead.\n",
> +			 cmd->id, id);

If this happens I imagine something's gone pretty wrong - this should 
probably be a dev_err()? And perhaps we want to make sure we return an 
error code rather than whatever status code we get from the MMIO?

> +	}
> +
> +	return status;
> +}
> +
> +int admin_response(const struct ocxlpmem *ocxlpmem)
> +{
> +	return command_response(ocxlpmem, &ocxlpmem->admin_command);
> +}
> +
> +
> +int admin_command_execute(const struct ocxlpmem *ocxlpmem)
> +{
> +	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_HCI_ACRW);
> +}
> +
> +static bool admin_command_complete(const struct ocxlpmem *ocxlpmem)
> +{
> +	u64 val = 0;
> +
> +	int rc = ocxlpmem_chi(ocxlpmem, &val);
> +
> +	WARN_ON(rc);
> +
> +	return (val & GLOBAL_MMIO_CHI_ACRA) != 0;
> +}
> +
> +int admin_command_complete_timeout(const struct ocxlpmem *ocxlpmem,
> +				   int command)
> +{
> +	u32 timeout = ocxlpmem->timeouts[command];
> +	// 32 is the next power of 2 greater than the 20ms minimum for msleep
> +#define TIMEOUT_SLEEP_MILLIS 32
> +	timeout /= TIMEOUT_SLEEP_MILLIS;
> +	if (!timeout)
> +		timeout = DEFAULT_TIMEOUT / TIMEOUT_SLEEP_MILLIS;
> +
> +	while (timeout-- > 0) {
> +		if (admin_command_complete(ocxlpmem))
> +			return 0;
> +		msleep(TIMEOUT_SLEEP_MILLIS);
> +	}

I think the more traditional way to implement timeouts is something more 
like:

   unsigned long timeout = jiffies + msecs_to_jiffies(<timeout period>);
   do {
     <check>
     <sleep>
   } while (time_before(jiffies, timeout));

> +
> +	if (admin_command_complete(ocxlpmem))
> +		return 0;
> +
> +	return -EBUSY;
> +}
> +
> +int admin_response_handled(const struct ocxlpmem *ocxlpmem)
> +{
> +	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIC,
> +				      OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_ACRA);
> +}

This looks wrong? My reading of the spec is that you're meant to *clear* 
ACRA upon completion of handing, this looks like it's setting ACRA to 1.

> +
> +void warn_status(const struct ocxlpmem *ocxlpmem, const char *message,
> +		     u8 status)
> +{
> +	const char *text = "Unknown";
> +
> +	switch (status) {
> +	case STATUS_SUCCESS:
> +		text = "Success";
> +		break;
> +
> +	case STATUS_MEM_UNAVAILABLE:
> +		text = "Persistent memory unavailable";
> +		break;
> +
> +	case STATUS_BAD_OPCODE:
> +		text = "Bad opcode";
> +		break;
> +
> +	case STATUS_BAD_REQUEST_PARM:
> +		text = "Bad request parameter";
> +		break;
> +
> +	case STATUS_BAD_DATA_PARM:
> +		text = "Bad data parameter";
> +		break;
> +
> +	case STATUS_DEBUG_BLOCKED:
> +		text = "Debug action blocked";
> +		break;
> +
> +	case STATUS_FAIL:
> +		text = "Failed";
> +		break;
> +	}
> +
> +	dev_warn(&ocxlpmem->dev, "%s: %s (%x)\n", message, text, status);
> +}
> diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> index ba0301533d00..2fef68c71271 100644
> --- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> @@ -7,6 +7,7 @@
>   #include <linux/mm.h>
>   
>   #define LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
> +#define DEFAULT_TIMEOUT 100
>   
>   #define GLOBAL_MMIO_CHI		0x000
>   #define GLOBAL_MMIO_CHIC	0x008
> @@ -80,6 +81,16 @@
>   #define STATUS_FW_ARG_INVALID	0x51
>   #define STATUS_FW_INVALID	0x52
>   
> +struct command_metadata {
> +	u32 request_offset;
> +	u32 response_offset;
> +	u32 data_offset;
> +	u32 data_size;
> +	struct mutex lock;
> +	u16 id;
> +	u8 op_code;
> +};
> +
>   struct ocxlpmem_function0 {
>   	struct pci_dev *pdev;
>   	struct ocxl_fn *ocxl_fn;
> @@ -95,9 +106,11 @@ struct ocxlpmem {
>   	struct ocxl_afu *ocxl_afu;
>   	struct ocxl_context *ocxl_context;
>   	void *metadata_addr;
> +	struct command_metadata admin_command;
>   	struct resource pmem_res;
>   	struct nd_region *nd_region;
>   	char fw_version[8+1];
> +	u32 timeouts[ADMIN_COMMAND_MAX+1];
>   
>   	u32 max_controller_dump_size;
>   	u16 scm_revision; // major/minor
> @@ -122,3 +135,51 @@ struct ocxlpmem {
>    * Returns 0 on success, negative on error
>    */
>   int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi);
> +
> +/**
> + * admin_command_request() - Issue an admin command request
> + * @ocxlpmem: the device metadata
> + * @op_code: The op-code for the command
> + *
> + * Returns an identifier for the command, or negative on error
> + */
> +int admin_command_request(struct ocxlpmem *ocxlpmem, u8 op_code);
> +
> +/**
> + * admin_response() - Validate an admin response
> + * @ocxlpmem: the device metadata
> + * Returns the status code of the command, or negative on error
> + */
> +int admin_response(const struct ocxlpmem *ocxlpmem);
> +
> +/**
> + * admin_command_execute() - Notify the controller to start processing a pending admin command
> + * @ocxlpmem: the device metadata
> + * Returns 0 on success, negative on error
> + */
> +int admin_command_execute(const struct ocxlpmem *ocxlpmem);
> +
> +/**
> + * admin_command_complete_timeout() - Wait for an admin command to finish executing
> + * @ocxlpmem: the device metadata
> + * @command: the admin command to wait for completion (determines the timeout)
> + * Returns 0 on success, -EBUSY on timeout
> + */
> +int admin_command_complete_timeout(const struct ocxlpmem *ocxlpmem,
> +				   int command);
> +
> +/**
> + * admin_response_handled() - Notify the controller that the admin response has been handled
> + * @ocxlpmem: the device metadata
> + * Returns 0 on success, negative on failure
> + */
> +int admin_response_handled(const struct ocxlpmem *ocxlpmem);
> +
> +/**
> + * warn_status() - Emit a kernel warning showing a command status.
> + * @ocxlpmem: the device metadata
> + * @message: A message to accompany the warning
> + * @status: The command status
> + */
> +void warn_status(const struct ocxlpmem *ocxlpmem, const char *message,
> +		 u8 status);
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

