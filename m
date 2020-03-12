Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8141827FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 06:00:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dGq731s7zDqQd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 16:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dGnZ72vbzDqFw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 15:58:58 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02C4vlTa078950
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 00:58:56 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqe5u8fpw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 00:58:55 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 12 Mar 2020 04:58:53 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Mar 2020 04:58:46 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02C4wjwT37158996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 04:58:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C5F8AE051;
 Thu, 12 Mar 2020 04:58:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3532AE045;
 Thu, 12 Mar 2020 04:58:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Mar 2020 04:58:44 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C732FA021A;
 Thu, 12 Mar 2020 15:58:39 +1100 (AEDT)
Subject: Re: [PATCH v3 23/27] powerpc/powernv/pmem: Add debug IOCTLs
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 12 Mar 2020 15:58:43 +1100
In-Reply-To: <5e2be4dd-bc8b-ff2c-d057-acd5f3728f4a@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-24-alastair@au1.ibm.com>
 <5e2be4dd-bc8b-ff2c-d057-acd5f3728f4a@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031204-0016-0000-0000-000002EFB475
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031204-0017-0000-0000-00003353209E
Message-Id: <f01b36f79f2054e127e5272bb54bc670f0992018.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_15:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120024
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
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-03-05 at 14:11 +1100, Andrew Donnellan wrote:
> On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > These IOCTLs provide low level access to the card to aid in
> > debugging
> > controller/FPGA firmware.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   arch/powerpc/platforms/powernv/pmem/Kconfig |   6 +
> >   arch/powerpc/platforms/powernv/pmem/ocxl.c  | 249
> > ++++++++++++++++++++
> >   include/uapi/nvdimm/ocxl-pmem.h             |  32 +++
> >   3 files changed, 287 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/pmem/Kconfig
> > b/arch/powerpc/platforms/powernv/pmem/Kconfig
> > index c5d927520920..3f44429d70c9 100644
> > --- a/arch/powerpc/platforms/powernv/pmem/Kconfig
> > +++ b/arch/powerpc/platforms/powernv/pmem/Kconfig
> > @@ -12,4 +12,10 @@ config OCXL_PMEM
> >   
> >   	  Select N if unsure.
> >   
> > +config OCXL_PMEM_DEBUG
> > +	bool "OpenCAPI Persistent Memory debugging"
> > +	depends on OCXL_PMEM
> > +	help
> > +	  Enables low level IOCTLs for OpenCAPI Persistent Memory
> > firmware development
> > +
> 
> How dangerous are these ioctls and does that need to be pointed out
> in 
> this description?

Good point, I'll elaborate.

> 
> >   endif
> > diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > index e01f6f9fc180..d4ce5e9e0521 100644
> > --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > @@ -1050,6 +1050,235 @@ int req_controller_health_perf(struct
> > ocxlpmem *ocxlpmem)
> >   				      GLOBAL_MMIO_HCI_REQ_HEALTH_PERF);
> >   }
> >   
> > +#ifdef CONFIG_OCXL_PMEM_DEBUG
> > +/**
> > + * enable_fwdebug() - Enable FW debug on the controller
> > + * @ocxlpmem: the device metadata
> > + * Return: 0 on success, negative on failure
> > + */
> > +static int enable_fwdebug(const struct ocxlpmem *ocxlpmem)
> > +{
> > +	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu,
> > GLOBAL_MMIO_HCI,
> > +				      OCXL_LITTLE_ENDIAN,
> > +				      GLOBAL_MMIO_HCI_FW_DEBUG);
> > +}
> > +
> > +/**
> > + * disable_fwdebug() - Disable FW debug on the controller
> > + * @ocxlpmem: the device metadata
> > + * Return: 0 on success, negative on failure
> > + */
> > +static int disable_fwdebug(const struct ocxlpmem *ocxlpmem)
> > +{
> > +	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu,
> > GLOBAL_MMIO_HCIC,
> > +				      OCXL_LITTLE_ENDIAN,
> > +				      GLOBAL_MMIO_HCI_FW_DEBUG);
> > +}
> > +
> > +static int ioctl_fwdebug(struct ocxlpmem *ocxlpmem,
> > +			     struct ioctl_ocxl_pmem_fwdebug __user
> > *uarg)
> > +{
> > +	struct ioctl_ocxl_pmem_fwdebug args;
> > +	u64 val;
> > +	int i;
> > +	int rc;
> > +
> > +	if (copy_from_user(&args, uarg, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	// Buffer size must be a multiple of 8
> > +	if ((args.buf_size & 0x07))
> > +		return -EINVAL;
> > +
> > +	if (args.buf_size > ocxlpmem->admin_command.data_size)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&ocxlpmem->admin_command.lock);
> > +
> > +	rc = enable_fwdebug(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_FW_DEBUG);
> > +	if (rc)
> > +		goto out;
> > +
> > +	// Write DebugAction & FunctionCode
> > +	val = ((u64)args.debug_action << 56) | ((u64)args.function_code
> > << 40);
> > +
> > +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> > +				      ocxlpmem-
> > >admin_command.request_offset + 0x08,
> > +				      OCXL_LITTLE_ENDIAN, val);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> > +				      ocxlpmem-
> > >admin_command.request_offset + 0x10,
> > +				      OCXL_LITTLE_ENDIAN,
> > args.debug_parameter_1);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> > +				      ocxlpmem-
> > >admin_command.request_offset + 0x18,
> > +				      OCXL_LITTLE_ENDIAN,
> > args.debug_parameter_2);
> > +	if (rc)
> > +		goto out;
> > +
> > +	for (i = 0x20; i < 0x38; i += 0x08)
> 
> Comparison should be <=, the request block ends at 0x40.
> 
> But in any case, scm_command_request() should I think already handle
> the 
> clearing of the request block?
> 
Correct.

> > +		rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> > +					      ocxlpmem-
> > >admin_command.request_offset + i,
> > +					      OCXL_LITTLE_ENDIAN, 0);
> > +	if (rc)
> > +		goto out;
> > +
> > +
> > +	// Populate admin command buffer
> > +	if (args.buf_size) {
> > +		for (i = 0; i < args.buf_size; i += sizeof(u64)) {
> > +			u64 val;
> > +
> > +			if (copy_from_user(&val, &args.buf[i],
> > sizeof(u64)))
> > +				return -EFAULT;
> > +
> > +			rc = ocxl_global_mmio_write64(ocxlpmem-
> > >ocxl_afu,
> > +						      ocxlpmem-
> > >admin_command.data_offset + i,
> > +						      OCXL_HOST_ENDIAN,
> > val);
> > +			if (rc)
> > +				goto out;
> > +		}
> > +	}
> > +
> > +	rc = admin_command_execute(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_complete_timeout(ocxlpmem,
> > +					    ocxlpmem-
> > >timeouts[ADMIN_COMMAND_FW_DEBUG]);
> > +	if (rc < 0)
> > +		goto out;
> > +
> > +	rc = admin_response(ocxlpmem);
> > +	if (rc < 0)
> > +		goto out;
> > +	if (rc != STATUS_SUCCESS) {
> > +		warn_status(ocxlpmem, "Unexpected status from FW
> > Debug", rc);
> > +		goto out;
> > +	}
> > +
> > +	if (args.buf_size) {
> > +		for (i = 0; i < args.buf_size; i += sizeof(u64)) {
> > +			u64 val;
> > +
> > +			rc = ocxl_global_mmio_read64(ocxlpmem-
> > >ocxl_afu,
> > +						     ocxlpmem-
> > >admin_command.data_offset + i,
> > +						     OCXL_HOST_ENDIAN,
> > &val);
> 
> No check of the data identifier?
> 
There isn't one documented.

> It seems to me that there's no definition in the spec whatsoever for
> the 
> format of the data, so just copying as much as fits in the buffer
> seems 
> correct.
> 

That's right, decisions about this data will be left to userspace.

> > +			if (rc)
> > +				goto out;
> > +
> > +			if (copy_to_user(&args.buf[i], &val,
> > sizeof(u64))) {
> > +				rc = -EFAULT;
> > +				goto out;
> > +			}
> > +		}
> > +	}
> > +
> > +	rc = admin_response_handled(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = disable_fwdebug(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +out:
> > +	mutex_unlock(&ocxlpmem->admin_command.lock);
> > +	return rc;
> > +}
> > +
> > +static int ioctl_shutdown(struct ocxlpmem *ocxlpmem)
> > +{
> > +	int rc;
> > +
> > +	mutex_lock(&ocxlpmem->admin_command.lock);
> > +
> > +	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_SHUTDOWN);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_execute(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_complete_timeout(ocxlpmem,
> > ADMIN_COMMAND_SHUTDOWN);
> > +	if (rc < 0) {
> > +		dev_warn(&ocxlpmem->dev, "Shutdown timed out\n");
> > +		goto out;
> > +	}
> > +
> > +	rc = 0;
> > +	goto out;
> > +
> > +out:
> > +	mutex_unlock(&ocxlpmem->admin_command.lock);
> > +	return rc;
> > +}
> > +
> > +static int ioctl_mmio_write(struct ocxlpmem *ocxlpmem,
> > +				struct ioctl_ocxl_pmem_mmio __user
> > *uarg)
> > +{
> > +	struct scm_ioctl_mmio args;
> > +
> > +	if (copy_from_user(&args, uarg, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	return ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> > args.address,
> > +					OCXL_LITTLE_ENDIAN, args.val);
> > +}
> > +
> > +static int ioctl_mmio_read(struct ocxlpmem *ocxlpmem,
> > +				     struct ioctl_ocxl_pmem_mmio __user
> > *uarg)
> > +{
> > +	struct ioctl_ocxl_pmem_mmio args;
> > +	int rc;
> > +
> > +	if (copy_from_user(&args, uarg, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, args.address,
> > +				     OCXL_LITTLE_ENDIAN, &args.val);
> > +	if (rc)
> > +		return rc;
> > +
> > +	if (copy_to_user(uarg, &args, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	return 0;
> > +}
> > +#else /* CONFIG_OCXL_PMEM_DEBUG */
> > +static int ioctl_fwdebug(struct ocxlpmem *ocxlpmem,
> > +			     struct ioctl_ocxl_pmem_fwdebug __user
> > *uarg)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int ioctl_shutdown(struct ocxlpmem *ocxlpmem)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int ioctl_mmio_write(struct ocxlpmem *ocxlpmem,
> > +				struct ioctl_ocxl_pmem_mmio __user
> > *uarg)
> > +{
> > +	return -EPERM;
> > +}
> > +
> > +static int ioctl_mmio_read(struct ocxlpmem *ocxlpmem,
> > +			       struct ioctl_ocxl_pmem_mmio __user
> > *uarg)
> > +{
> > +	return -EPERM;
> > +}
> > +#endif /* CONFIG_OCXL_PMEM_DEBUG */
> > +
> >   static long file_ioctl(struct file *file, unsigned int cmd,
> > unsigned long args)
> >   {
> >   	struct ocxlpmem *ocxlpmem = file->private_data;
> > @@ -1091,6 +1320,26 @@ static long file_ioctl(struct file *file,
> > unsigned int cmd, unsigned long args)
> >   	case IOCTL_OCXL_PMEM_REQUEST_HEALTH:
> >   		rc = req_controller_health_perf(ocxlpmem);
> >   		break;
> > +
> > +	case IOCTL_OCXL_PMEM_FWDEBUG:
> > +		rc = ioctl_fwdebug(ocxlpmem,
> > +				   (struct ioctl_ocxl_pmem_fwdebug
> > __user *)args);
> > +		break;
> > +
> > +	case IOCTL_OCXL_PMEM_SHUTDOWN:
> > +		rc = ioctl_shutdown(ocxlpmem);
> > +		break;
> > +
> > +	case IOCTL_OCXL_PMEM_MMIO_WRITE:
> > +		rc = ioctl_mmio_write(ocxlpmem,
> > +				      (struct ioctl_ocxl_pmem_mmio
> > __user *)args);
> > +		break;
> > +
> > +	case IOCTL_OCXL_PMEM_MMIO_READ:
> > +		rc = ioctl_mmio_read(ocxlpmem,
> > +				     (struct ioctl_ocxl_pmem_mmio
> > __user *)args);
> > +		break;
> > +
> >   	}
> >   
> >   	return rc;
> > diff --git a/include/uapi/nvdimm/ocxl-pmem.h
> > b/include/uapi/nvdimm/ocxl-pmem.h
> > index 0d03abb44001..e20a4f8be82a 100644
> > --- a/include/uapi/nvdimm/ocxl-pmem.h
> > +++ b/include/uapi/nvdimm/ocxl-pmem.h
> > @@ -6,6 +6,28 @@
> >   #include <linux/types.h>
> >   #include <linux/ioctl.h>
> >   
> > +enum ocxlpmem_fwdebug_action {
> > +	OCXL_PMEM_FWDEBUG_READ_CONTROLLER_MEMORY = 0x01,
> > +	OCXL_PMEM_FWDEBUG_WRITE_CONTROLLER_MEMORY = 0x02,
> > +	OCXL_PMEM_FWDEBUG_ENABLE_FUNCTION = 0x03,
> > +	OCXL_PMEM_FWDEBUG_DISABLE_FUNCTION = 0x04,
> > +	OCXL_PMEM_FWDEBUG_GET_PEL = 0x05, // Retrieve Persistent Error
> > Log
> > +};
> > +
> > +struct ioctl_ocxl_pmem_buffer_info {
> > +	__u32	admin_command_buffer_size; // out
> > +	__u32	near_storage_buffer_size; // out
> > +};
> 
> This struct seems unused.
> 
Whoops

> > +
> > +struct ioctl_ocxl_pmem_fwdebug { // All args are inputs
> > +	enum ocxlpmem_fwdebug_action debug_action;
> > +	__u16 function_code;
> > +	__u16 buf_size; // Size of optional data buffer
> > +	__u64 debug_parameter_1;
> > +	__u64 debug_parameter_2;
> > +	__u8 *buf; // Pointer to optional in/out data buffer
> > +};
> > +
> >   #define OCXL_PMEM_ERROR_LOG_ACTION_RESET	(1 << (32-32))
> >   #define OCXL_PMEM_ERROR_LOG_ACTION_CHKFW	(1 << (53-32))
> >   #define OCXL_PMEM_ERROR_LOG_ACTION_REPLACE	(1 << (54-32))
> > @@ -66,6 +88,11 @@ struct ioctl_ocxl_pmem_controller_stats {
> >   	__u64 cache_write_latency; /* nanoseconds */
> >   };
> >   
> > +struct ioctl_ocxl_pmem_mmio {
> > +	__u64 address; /* Offset in global MMIO space */
> > +	__u64 val; /* value to write/was read */
> > +};
> > +
> >   struct ioctl_ocxl_pmem_eventfd {
> >   	__s32 eventfd;
> >   	__u32 reserved;
> > @@ -92,4 +119,9 @@ struct ioctl_ocxl_pmem_eventfd {
> >   #define IOCTL_OCXL_PMEM_EVENT_CHECK			_IOR(OC
> > XL_PMEM_MAGIC, 0x07, __u64)
> >   #define IOCTL_OCXL_PMEM_REQUEST_HEALTH			_IO(OCX
> > L_PMEM_MAGIC, 0x08)
> >   
> > +#define IOCTL_OCXL_PMEM_FWDEBUG		_IOWR(OCXL_PMEM_MAGIC,
> > 0xf0, struct ioctl_ocxl_pmem_fwdebug)
> > +#define IOCTL_OCXL_PMEM_MMIO_WRITE	_IOW(OCXL_PMEM_MAGIC, 0xf1,
> > struct ioctl_ocxl_pmem_mmio)
> > +#define IOCTL_OCXL_PMEM_MMIO_READ	_IOWR(OCXL_PMEM_MAGIC, 0xf2,
> > struct ioctl_ocxl_pmem_mmio)
> > +#define IOCTL_OCXL_PMEM_SHUTDOWN	_IO(OCXL_PMEM_MAGIC, 0xf3)
> > +
> >   #endif /* _UAPI_OCXL_SCM_H */
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

