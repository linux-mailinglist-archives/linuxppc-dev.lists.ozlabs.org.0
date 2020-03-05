Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A289717B24D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 00:39:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YRzP22fQzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 10:39:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YRxL46Y8zDq9W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 10:37:26 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025NYnLv085107
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Mar 2020 18:37:24 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhr4kud0n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 18:37:23 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 5 Mar 2020 23:37:21 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 23:37:15 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025NbEYx48496674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 23:37:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13CD2AE045;
 Thu,  5 Mar 2020 23:37:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 686D0AE053;
 Thu,  5 Mar 2020 23:37:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 23:37:13 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6B3EEA011F;
 Fri,  6 Mar 2020 10:37:08 +1100 (AEDT)
Subject: Re: [PATCH v3 18/27] powerpc/powernv/pmem: Add controller dump IOCTLs
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Fri, 06 Mar 2020 10:37:12 +1100
In-Reply-To: <6d1f28bc-334c-e85b-9974-71cf88a1ad20@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-19-alastair@au1.ibm.com>
 <6d1f28bc-334c-e85b-9974-71cf88a1ad20@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030523-4275-0000-0000-000003A8C9D6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030523-4276-0000-0000-000038BDDAFB
Message-Id: <6410f5f56e6d0c902026b7e323c352d5d1f7bb17.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_08:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=8
 malwarescore=0 clxscore=1015
 mlxscore=8 phishscore=0 mlxlogscore=106 suspectscore=2 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=8 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003050133
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
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-03 at 19:04 +0100, Frederic Barrat wrote:
> 
> Le 21/02/2020 à 04:27, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > This patch adds IOCTLs to allow userspace to request & fetch dumps
> > of the internal controller state.
> > 
> > This is useful during debugging or when a fatal error on the
> > controller
> > has occurred.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   arch/powerpc/platforms/powernv/pmem/ocxl.c | 132
> > +++++++++++++++++++++
> >   include/uapi/nvdimm/ocxl-pmem.h            |  15 +++
> >   2 files changed, 147 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > index 2b64504f9129..2cabafe1fc58 100644
> > --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > @@ -640,6 +640,124 @@ static int ioctl_error_log(struct ocxlpmem
> > *ocxlpmem,
> >   	return 0;
> >   }
> >   
> > +static int ioctl_controller_dump_data(struct ocxlpmem *ocxlpmem,
> > +		struct ioctl_ocxl_pmem_controller_dump_data __user
> > *uarg)
> > +{
> > +	struct ioctl_ocxl_pmem_controller_dump_data args;
> > +	u16 i;
> > +	u64 val;
> > +	int rc;
> > +
> > +	if (copy_from_user(&args, uarg, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	if (args.buf_size % 8)
> > +		return -EINVAL;
> > +
> > +	if (args.buf_size > ocxlpmem->admin_command.data_size)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&ocxlpmem->admin_command.lock);
> > +
> > +	rc = admin_command_request(ocxlpmem,
> > ADMIN_COMMAND_CONTROLLER_DUMP);
> > +	if (rc)
> > +		goto out;
> > +
> > +	val = ((u64)args.offset) << 32;
> > +	val |= args.buf_size;
> > +	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> > +				      ocxlpmem-
> > >admin_command.request_offset + 0x08,
> > +				      OCXL_LITTLE_ENDIAN, val);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_execute(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_complete_timeout(ocxlpmem,
> > +					    ADMIN_COMMAND_CONTROLLER_DU
> > MP);
> > +	if (rc < 0) {
> > +		dev_warn(&ocxlpmem->dev, "Controller dump timed
> > out\n");
> > +		goto out;
> > +	}
> > +
> > +	rc = admin_response(ocxlpmem);
> > +	if (rc < 0)
> > +		goto out;
> > +	if (rc != STATUS_SUCCESS) {
> > +		warn_status(ocxlpmem,
> > +			    "Unexpected status from retrieve error
> > log",
> > +			    rc);
> > +		goto out;
> > +	}
> 
> 
> It would help if there was a comment indicating how the 3 ioctls are 
> used. My understanding is that the userland is:
> - requesting the controller to prepare a state dump
> - then one or more ioctls to fetch the data. The number of calls 
> required to get the full state really depends on the size of the
> buffer 
> passed by user
> - a last ioctl to tell the controller that we're done, presumably to
> let 
> it free some resources.
> 

Ok, will add it to the blurb.
> 
> > +
> > +	for (i = 0; i < args.buf_size; i += 8) {
> > +		u64 val;
> > +
> > +		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +					     ocxlpmem-
> > >admin_command.data_offset + i,
> > +					     OCXL_HOST_ENDIAN, &val);
> > +		if (rc)
> > +			goto out;
> > +
> > +		if (copy_to_user(&args.buf[i], &val, sizeof(u64))) {
> > +			rc = -EFAULT;
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	if (copy_to_user(uarg, &args, sizeof(args))) {
> > +		rc = -EFAULT;
> > +		goto out;
> > +	}
> > +
> > +	rc = admin_response_handled(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +out:
> > +	mutex_unlock(&ocxlpmem->admin_command.lock);
> > +	return rc;
> > +}
> > +
> > +int request_controller_dump(struct ocxlpmem *ocxlpmem)
> > +{
> > +	int rc;
> > +	u64 busy = 1;
> > +
> > +	rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu,
> > GLOBAL_MMIO_CHIC,
> > +				    OCXL_LITTLE_ENDIAN,
> > +				    GLOBAL_MMIO_CHI_CDA);
> > +
> 
> rc is not checked here.

Whoops

> 
> 
> > +
> > +	rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu,
> > GLOBAL_MMIO_HCI,
> > +				    OCXL_LITTLE_ENDIAN,
> > +				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP);
> > +	if (rc)
> > +		return rc;
> > +
> > +	while (busy) {
> > +		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +					     GLOBAL_MMIO_HCI,
> > +					     OCXL_LITTLE_ENDIAN,
> > &busy);
> > +		if (rc)
> > +			return rc;
> > +
> > +		busy &= GLOBAL_MMIO_HCI_CONTROLLER_DUMP;
> 
> Setting 'busy' doesn't hurt, but it's not really useful, is it?
> 
> We should add some kind of timeout so that if the controller hits an 
> issue, we don't spin in kernel space endlessly.
> 
> 

Here we are polling the controller dump bit of the HCI register until
the controller clears it - that line is masking off the bits we don't
care about.

I'll talk to the firmware team about adding a timeout for that to the
spec so we know how long to wait for before giving up.

> 
> > +		cond_resched();
> > +	}
> > +
> > +	return 0;
> > +}

> > +
> > +static int ioctl_controller_dump_complete(struct ocxlpmem
> > *ocxlpmem)
> > +{
> > +	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu,
> > GLOBAL_MMIO_HCI,
> > +				    OCXL_LITTLE_ENDIAN,
> > +				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COL
> > LECTED);
> > +}
> > +
> >   static long file_ioctl(struct file *file, unsigned int cmd,
> > unsigned long args)
> >   {
> >   	struct ocxlpmem *ocxlpmem = file->private_data;
> > @@ -650,7 +768,21 @@ static long file_ioctl(struct file *file,
> > unsigned int cmd, unsigned long args)
> >   		rc = ioctl_error_log(ocxlpmem,
> >   				     (struct ioctl_ocxl_pmem_error_log
> > __user *)args);
> >   		break;
> > +
> > +	case IOCTL_OCXL_PMEM_CONTROLLER_DUMP:
> > +		rc = request_controller_dump(ocxlpmem);
> > +		break;
> > +
> > +	case IOCTL_OCXL_PMEM_CONTROLLER_DUMP_DATA:
> > +		rc = ioctl_controller_dump_data(ocxlpmem,
> > +						(struct
> > ioctl_ocxl_pmem_controller_dump_data __user *)args);
> > +		break;
> > +
> > +	case IOCTL_OCXL_PMEM_CONTROLLER_DUMP_COMPLETE:
> > +		rc = ioctl_controller_dump_complete(ocxlpmem);
> > +		break;
> >   	}
> > +
> >   	return rc;
> >   }
> >   
> > diff --git a/include/uapi/nvdimm/ocxl-pmem.h
> > b/include/uapi/nvdimm/ocxl-pmem.h
> > index b10f8ac0c20f..d4d8512d03f7 100644
> > --- a/include/uapi/nvdimm/ocxl-pmem.h
> > +++ b/include/uapi/nvdimm/ocxl-pmem.h
> > @@ -38,9 +38,24 @@ struct ioctl_ocxl_pmem_error_log {
> >   	__u8 *buf; /* pointer to output buffer */
> >   };
> >   
> > +struct ioctl_ocxl_pmem_controller_dump_data {
> > +	__u8 *buf; /* pointer to output buffer */
> 
> We only support 64-bit user app on powerpc, but using a pointer type
> in 
> a kernel ABI is unusual. We should use a know size like __u64.
> (also applies to buf pointer in struct ioctl_ocxl_pmem_error_log
> from 
> previous patch too)
> 
> The rest of the structure will also be padded by the compiler, which
> we 
> should avoid.
> 
>     Fred
> 

Ok, I'll co-erce the pointers into a __u64.

> 
> 
> > +	__u16 buf_size; /* in/out, buffer size provided/required.
> > +			 * If required is greater than provided, the
> > buffer
> > +			 * will be truncated to the amount provided. If
> > its
> > +			 * less, then only the required bytes will be
> > populated.
> > +			 * If it is 0, then there is no more dump data
> > available.
> > +			 */
> > +	__u32 offset; /* in, Offset within the dump */
> > +	__u64 reserved[8];
> > +};
> > +
> >   /* ioctl numbers */
> >   #define OCXL_PMEM_MAGIC 0x5C
> >   /* SCM devices */
> >   #define IOCTL_OCXL_PMEM_ERROR_LOG			_IOWR(OCXL_PMEM
> > _MAGIC, 0x01, struct ioctl_ocxl_pmem_error_log)
> > +#define IOCTL_OCXL_PMEM_CONTROLLER_DUMP			_IO(OCX
> > L_PMEM_MAGIC, 0x02)
> > +#define IOCTL_OCXL_PMEM_CONTROLLER_DUMP_DATA		_IOWR(O
> > CXL_PMEM_MAGIC, 0x03, struct ioctl_ocxl_pmem_controller_dump_data)
> > +#define IOCTL_OCXL_PMEM_CONTROLLER_DUMP_COMPLETE	_IO(OCXL_PMEM_M
> > AGIC, 0x04)
> >   
> >   #endif /* _UAPI_OCXL_SCM_H */
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

