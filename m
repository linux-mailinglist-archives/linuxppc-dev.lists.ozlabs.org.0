Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DE179EA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 05:33:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XyYK0SxQzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 15:33:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XyWb0FJ5zDq5y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 15:31:54 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0254T1ab135211
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2020 23:31:53 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj8hcd78j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 23:31:52 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 5 Mar 2020 04:31:49 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 04:31:42 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0254VfAe55574684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 04:31:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C410A4040;
 Thu,  5 Mar 2020 04:31:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BD60A4051;
 Thu,  5 Mar 2020 04:31:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 04:31:40 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8AB7AA0264;
 Thu,  5 Mar 2020 15:31:35 +1100 (AEDT)
Subject: Re: [PATCH v3 17/27] powerpc/powernv/pmem: Implement the Read Error
 Log command
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 05 Mar 2020 15:31:39 +1100
In-Reply-To: <7767dec4-fb78-dd3e-3720-8d15f544639e@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-18-alastair@au1.ibm.com>
 <7767dec4-fb78-dd3e-3720-8d15f544639e@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030504-0028-0000-0000-000003E10282
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030504-0029-0000-0000-000024A635EA
Message-Id: <739066a997f83e7aa27dc364071223936fa753ef.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=2 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050024
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

On Tue, 2020-03-03 at 11:36 +0100, Frederic Barrat wrote:
> 
> Le 21/02/2020 à 04:27, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > The read error log command extracts information from the
> > controller's
> > internal error log.
> > 
> > This patch exposes this information in 2 ways:
> > - During probe, if an error occurs & a log is available, print it
> > to the
> >    console
> > - After probe, make the error log available to userspace via an
> > IOCTL.
> >    Userspace is notified of pending error logs in a later patch
> >    ("powerpc/powernv/pmem: Forward events to userspace")
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   arch/powerpc/platforms/powernv/pmem/ocxl.c    | 269
> > ++++++++++++++++++
> >   .../platforms/powernv/pmem/ocxl_internal.h    |   1 +
> >   include/uapi/nvdimm/ocxl-pmem.h               |  46 +++
> >   3 files changed, 316 insertions(+)
> >   create mode 100644 include/uapi/nvdimm/ocxl-pmem.h
> > 
> > diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > index 63109a870d2c..2b64504f9129 100644
> > --- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > +++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
> > @@ -447,10 +447,219 @@ static int file_release(struct inode *inode,
> > struct file *file)
> >   	return 0;
> >   }
> >   
> > +/**
> > + * error_log_header_parse() - Parse the first 64 bits of the error
> > log command response
> > + * @ocxlpmem: the device metadata
> > + * @length: out, returns the number of bytes in the response
> > (excluding the 64 bit header)
> > + */
> > +static int error_log_header_parse(struct ocxlpmem *ocxlpmem, u16
> > *length)
> > +{
> > +	int rc;
> > +	u64 val;
> > +
> 
> Empty line in the middle of declarations
> 

Ok

> 
> > +	u16 data_identifier;
> > +	u32 data_length;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset,
> > +				     OCXL_LITTLE_ENDIAN, &val);
> > +	if (rc)
> > +		return rc;
> > +
> > +	data_identifier = val >> 48;
> > +	data_length = val & 0xFFFF;
> > +
> > +	if (data_identifier != 0x454C) { // 'EL'
> > +		dev_err(&ocxlpmem->dev,
> > +			"Bad data identifier for error log data,
> > expected 'EL', got '%2s' (%#x), data_length=%u\n",
> > +			(char *)&data_identifier,
> > +			(unsigned int)data_identifier, data_length);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*length = data_length;
> > +	return 0;
> > +}
> > +
> > +static int error_log_offset_0x08(struct ocxlpmem *ocxlpmem,
> > +				 u32 *log_identifier, u32
> > *program_ref_code)
> > +{
> > +	int rc;
> > +	u64 val;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset + 0x08,
> > +				     OCXL_LITTLE_ENDIAN, &val);
> > +	if (rc)
> > +		return rc;
> > +
> > +	*log_identifier = val >> 32;
> > +	*program_ref_code = val & 0xFFFFFFFF;
> > +
> > +	return 0;
> > +}
> > +
> > +static int read_error_log(struct ocxlpmem *ocxlpmem,
> > +			  struct ioctl_ocxl_pmem_error_log *log, bool
> > buf_is_user)
> > +{
> > +	u64 val;
> > +	u16 user_buf_length;
> > +	u16 buf_length;
> > +	u16 i;
> > +	int rc;
> > +
> > +	if (log->buf_size % 8)
> > +		return -EINVAL;
> > +
> > +	rc = ocxlpmem_chi(ocxlpmem, &val);
> > +	if (rc)
> > +		goto out;
> 
> 
> "out" will unlock a mutex not yet taken.
> 

Thanks, that should have been a return.

> 
> 
> > +
> > +	if (!(val & GLOBAL_MMIO_CHI_ELA))
> > +		return -EAGAIN;
> > +
> > +	user_buf_length = log->buf_size;
> > +
> > +	mutex_lock(&ocxlpmem->admin_command.lock);
> > +
> > +	rc = admin_command_request(ocxlpmem, ADMIN_COMMAND_ERRLOG);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_execute(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = admin_command_complete_timeout(ocxlpmem,
> > ADMIN_COMMAND_ERRLOG);
> > +	if (rc < 0) {
> > +		dev_warn(&ocxlpmem->dev, "Read error log timed out\n");
> > +		goto out;
> > +	}
> > +
> > +	rc = admin_response(ocxlpmem);
> > +	if (rc < 0)
> > +		goto out;
> > +	if (rc != STATUS_SUCCESS) {
> > +		warn_status(ocxlpmem, "Unexpected status from retrieve
> > error log", rc);
> > +		goto out;
> > +	}
> > +
> > +
> > +	rc = error_log_header_parse(ocxlpmem, &log->buf_size);
> > +	if (rc)
> > +		goto out;
> > +	// log->buf_size now contains the returned buffer size, not the
> > user size
> > +
> > +	rc = error_log_offset_0x08(ocxlpmem, &log->log_identifier,
> > +				       &log->program_reference_code);
> > +	if (rc)
> > +		goto out;
> 
> 
> Offset 0x08 gets a preferential treatment compared to 0x10 below and 
> it's not clear why.
> I would create a subfonction which parses all the fields linearly.
> 

I'll inline the contents of error_log_offset_0x08() - I can't see a big
benefit to factoring out the guts of that function.

> 
> 
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset + 0x10,
> > +				     OCXL_LITTLE_ENDIAN, &val);
> > +	if (rc)
> > +		goto out;
> > +
> > +	log->error_log_type = val >> 56;
> > +	log->action_flags = (log->error_log_type ==
> > OCXL_PMEM_ERROR_LOG_TYPE_GENERAL) ?
> > +			    (val >> 32) & 0xFFFFFF : 0;
> > +	log->power_on_seconds = val & 0xFFFFFFFF;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset + 0x18,
> > +				     OCXL_LITTLE_ENDIAN, &log-
> > >timestamp);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset + 0x20,
> > +				     OCXL_HOST_ENDIAN, &log->wwid[0]);
> 
> 
> A bit of a moot point, but is there a reason why some of those MMIO
> ops 
> use OCXL_LITTLE_ENDIAN and the others OCXL_HOST_ENDIAN?
> 

Some are little endian values, and some are binary data. WWIDs should
be LE though.

> 
> 
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset + 0x28,
> > +				     OCXL_HOST_ENDIAN, &log->wwid[1]);
> > +	if (rc)
> > +		goto out;
> > +
> > +	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +				     ocxlpmem-
> > >admin_command.data_offset + 0x30,
> > +				     OCXL_HOST_ENDIAN, (u64 *)log-
> > >fw_revision);
> > +	if (rc)
> > +		goto out;
> > +	log->fw_revision[8] = '\0';
> > +
> > +	buf_length = (user_buf_length < log->buf_size) ?
> > +		     user_buf_length : log->buf_size;
> > +	for (i = 0; i < buf_length + 0x48; i += 8) {
> > +		u64 val;
> > +
> > +		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +					     ocxlpmem-
> > >admin_command.data_offset + i,
> > +					     OCXL_HOST_ENDIAN, &val);
> > +		if (rc)
> > +			goto out;
> > +
> > +		if (buf_is_user) {
> > +			if (copy_to_user(&log->buf[i], &val,
> > sizeof(u64))) {
> > +				rc = -EFAULT;
> > +				goto out;
> > +			}
> > +		} else
> > +			log->buf[i] = val;
> > +	}
> 
> 
> I think it could be a bit simplified by keeping the handling of the
> user 
> buffer out of this function. Always call it with a kernel buffer.
> And 
> have only one copy_to_user() call on the ioctl() path. You'd need to 
> allocate a kernel buf on the ioctl path, but you're already doing it
> on 
> the probe() path, so it should be doable to share code.

Hmm, the problem then is that on the IOCTL side, I'll have to save,
modify, then restore the buf member of struct
ioctl_ocxl_pmem_error_log, which would be uglier.

> 
> 
> > +
> > +	rc = admin_response_handled(ocxlpmem);
> > +	if (rc)
> > +		goto out;
> > +
> > +out:
> > +	mutex_unlock(&ocxlpmem->admin_command.lock);
> > +	return rc;
> > +
> > +}
> > +
> > +static int ioctl_error_log(struct ocxlpmem *ocxlpmem,
> > +		struct ioctl_ocxl_pmem_error_log __user *uarg)
> > +{
> > +	struct ioctl_ocxl_pmem_error_log args;
> > +	int rc;
> > +
> > +	if (copy_from_user(&args, uarg, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	rc = read_error_log(ocxlpmem, &args, true);
> > +	if (rc)
> > +		return rc;
> > +
> > +	if (copy_to_user(uarg, &args, sizeof(args)))
> > +		return -EFAULT;
> > +
> > +	return 0;
> > +}
> > +
> > +static long file_ioctl(struct file *file, unsigned int cmd,
> > unsigned long args)
> > +{
> > +	struct ocxlpmem *ocxlpmem = file->private_data;
> > +	int rc = -EINVAL;
> > +
> > +	switch (cmd) {
> > +	case IOCTL_OCXL_PMEM_ERROR_LOG:
> > +		rc = ioctl_error_log(ocxlpmem,
> > +				     (struct ioctl_ocxl_pmem_error_log
> > __user *)args);
> > +		break;
> > +	}
> > +	return rc;
> > +}
> > +
> >   static const struct file_operations fops = {
> >   	.owner		= THIS_MODULE,
> >   	.open		= file_open,
> >   	.release	= file_release,
> > +	.unlocked_ioctl = file_ioctl,
> > +	.compat_ioctl   = file_ioctl,
> >   };
> >   
> >   /**
> > @@ -527,6 +736,60 @@ static int read_device_metadata(struct
> > ocxlpmem *ocxlpmem)
> >   	return 0;
> >   }
> >   
> > +static const char *decode_error_log_type(u8 error_log_type)
> > +{
> > +	switch (error_log_type) {
> > +	case 0x00:
> > +		return "general";
> > +	case 0x01:
> > +		return "predictive failure";
> > +	case 0x02:
> > +		return "thermal warning";
> > +	case 0x03:
> > +		return "data loss";
> > +	case 0x04:
> > +		return "health & performance";
> > +	default:
> > +		return "unknown";
> > +	}
> > +}
> > +
> > +static void dump_error_log(struct ocxlpmem *ocxlpmem)
> > +{
> > +	struct ioctl_ocxl_pmem_error_log log;
> > +	u32 buf_size;
> > +	u8 *buf;
> > +	int rc;
> > +
> > +	if (ocxlpmem->admin_command.data_size == 0)
> > +		return;
> > +
> > +	buf_size = ocxlpmem->admin_command.data_size - 0x48;
> > +	buf = kzalloc(buf_size, GFP_KERNEL);
> > +	if (!buf)
> > +		return;
> > +
> > +	log.buf = buf;
> > +	log.buf_size = buf_size;
> > +
> > +	rc = read_error_log(ocxlpmem, &log, false);
> > +	if (rc < 0)
> > +		goto out;
> > +
> > +	dev_warn(&ocxlpmem->dev,
> > +		 "OCXL PMEM Error log: WWID=0x%016llx%016llx LID=0x%x
> > PRC=%x type=0x%x %s, Uptime=%u seconds timestamp=0x%llx\n",
> > +		 log.wwid[0], log.wwid[1],
> > +		 log.log_identifier, log.program_reference_code,
> > +		 log.error_log_type,
> > +		 decode_error_log_type(log.error_log_type),
> > +		 log.power_on_seconds, log.timestamp);
> > +	print_hex_dump(KERN_WARNING, "buf", DUMP_PREFIX_OFFSET, 16, 1,
> > buf,
> > +		       log.buf_size, false);
> 
> dev_warn already logs a warning. Isn't KERN_DEBUG more appropriate
> for 
> the hex dump?
> 
> 

The hex dump is associated binary data for the warning, it doesn't
replicate the contents of the message.

> 
> > +
> > +out:
> > +	kfree(buf);
> > +}
> > +
> >   /**
> >    * probe_function0() - Set up function 0 for an OpenCAPI
> > persistent memory device
> >    * This is important as it enables templates higher than 0 across
> > all other functions,
> > @@ -568,6 +831,7 @@ static int probe(struct pci_dev *pdev, const
> > struct pci_device_id *ent)
> >   	struct ocxlpmem *ocxlpmem;
> >   	int rc;
> >   	u16 elapsed, timeout;
> > +	u64 chi;
> >   
> >   	if (PCI_FUNC(pdev->devfn) == 0)
> >   		return probe_function0(pdev);
> > @@ -667,6 +931,11 @@ static int probe(struct pci_dev *pdev, const
> > struct pci_device_id *ent)
> >   	return 0;
> >   
> >   err:
> > +	if (ocxlpmem &&
> > +		    (ocxlpmem_chi(ocxlpmem, &chi) == 0) &&
> > +		    (chi & GLOBAL_MMIO_CHI_ELA))
> > +		dump_error_log(ocxlpmem);
> > +
> >   	/*
> >   	 * Further cleanup is done in the release handler via
> > free_ocxlpmem()
> >   	 * This allows us to keep the character device live to handle
> > IOCTLs to
> > diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> > b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> > index d2d81fec7bb1..b953ee522ed4 100644
> > --- a/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> > +++ b/arch/powerpc/platforms/powernv/pmem/ocxl_internal.h
> > @@ -5,6 +5,7 @@
> >   #include <linux/cdev.h>
> >   #include <misc/ocxl.h>
> >   #include <linux/libnvdimm.h>
> > +#include <uapi/nvdimm/ocxl-pmem.h>
> 
> Can't we limit the extra include to ocxl.c?
> 

Yes, there are no consumers referred to in ocxl_interal.[hc]

> Completely unrelated, but ocxl.c contains most of the code for this 
> driver. We should consider renaming it to ocxlpmem.c or something
> along 
> those lines, since it does a lot more than just interfacing with the 
> opencapi interface. And would avoid confusion with an other already 
> existing ocxl.c file.
> 

Ok, my thinking was that it's already in a pmem directory, but I can
see arguments both ways.

> 
> >   #include <linux/mm.h>
> >   
> >   #define LABEL_AREA_SIZE	(1UL << PA_SECTION_SHIFT)
> > diff --git a/include/uapi/nvdimm/ocxl-pmem.h
> > b/include/uapi/nvdimm/ocxl-pmem.h
> > new file mode 100644
> > index 000000000000..b10f8ac0c20f
> > --- /dev/null
> > +++ b/include/uapi/nvdimm/ocxl-pmem.h
> > @@ -0,0 +1,46 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> > +/* Copyright 2017 IBM Corp. */
> > +#ifndef _UAPI_OCXL_SCM_H
> > +#define _UAPI_OCXL_SCM_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/ioctl.h>
> > +
> > +#define OCXL_PMEM_ERROR_LOG_ACTION_RESET	(1 << (32-32))
> > +#define OCXL_PMEM_ERROR_LOG_ACTION_CHKFW	(1 << (53-32))
> > +#define OCXL_PMEM_ERROR_LOG_ACTION_REPLACE	(1 << (54-32))
> > +#define OCXL_PMEM_ERROR_LOG_ACTION_DUMP		(1 << (55-32))
> > +
> > +#define OCXL_PMEM_ERROR_LOG_TYPE_GENERAL		(0x00)
> > +#define OCXL_PMEM_ERROR_LOG_TYPE_PREDICTIVE_FAILURE	(0x01)
> > +#define OCXL_PMEM_ERROR_LOG_TYPE_THERMAL_WARNING	(0x02)
> > +#define OCXL_PMEM_ERROR_LOG_TYPE_DATA_LOSS		(0x03)
> > +#define OCXL_PMEM_ERROR_LOG_TYPE_HEALTH_PERFORMANCE	(0x04)
> > +
> > +struct ioctl_ocxl_pmem_error_log {
> > +	__u32 log_identifier; /* out */
> > +	__u32 program_reference_code; /* out */
> > +	__u32 action_flags; /* out, recommended course of action */
> > +	__u32 power_on_seconds; /* out, Number of seconds the
> > controller has been on when the error occurred */
> > +	__u64 timestamp; /* out, relative time since the current IPL */
> > +	__u64 wwid[2]; /* out, the NAA formatted WWID associated with
> > the controller */
> > +	char  fw_revision[8+1]; /* out, firmware revision as null
> > terminated text */
> 
> The 8+1 size will make the compiler add some padding here. Are we 
> confident that all the compilers, at least on powerpc, will do the
> same 
> thing and we can guarantee a kernel ABI? I would play it safe and
> have a 
> discussion with folks who understand compilers better.
> 

I'll add some explicit padding.

> 
> 
> > +	__u16 buf_size; /* in/out, buffer size provided/required.
> > +			 * If required is greater than provided, the
> > buffer
> > +			 * will be truncated to the amount provided. If
> > its
> > +			 * less, then only the required bytes will be
> > populated.
> > +			 * If it is 0, then there are no more error log
> > entries.
> > +			 */
> > +	__u8  error_log_type;
> > +	__u8  reserved1;
> > +	__u32 reserved2;
> > +	__u64 reserved3[2];
> > +	__u8 *buf; /* pointer to output buffer */
> > +};
> > +
> > +/* ioctl numbers */
> > +#define OCXL_PMEM_MAGIC 0x5C
> 
> Randomly picked?
> See (and add entry in) Documentation/userspace-api/ioctl/ioctl-
> number.rst
> 
Ok

> 
>    Fred
> 
> 
> 
> > +/* SCM devices */
> > +#define IOCTL_OCXL_PMEM_ERROR_LOG			_IOWR(OCXL_PMEM
> > _MAGIC, 0x01, struct ioctl_ocxl_pmem_error_log)
> > +
> > +#endif /* _UAPI_OCXL_SCM_H */
> > 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

