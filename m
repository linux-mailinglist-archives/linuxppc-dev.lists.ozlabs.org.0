Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B51DD17B4FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 04:36:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YYFX2MMdzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 14:36:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YYCL09dvzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 14:34:53 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0263Yn2D031198
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Mar 2020 22:34:51 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhr4m0s4q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 22:34:50 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 6 Mar 2020 03:34:33 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Mar 2020 03:34:26 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0263YPWr47906834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 03:34:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6904BA4053;
 Fri,  6 Mar 2020 03:34:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0707A4051;
 Fri,  6 Mar 2020 03:34:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 03:34:24 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C3638A011F;
 Fri,  6 Mar 2020 14:34:19 +1100 (AEDT)
Subject: Re: [PATCH v3 18/27] powerpc/powernv/pmem: Add controller dump IOCTLs
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 06 Mar 2020 14:34:23 +1100
In-Reply-To: <7fc5ee46-d849-11f1-d0ad-429a8c87d7eb@linux.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-19-alastair@au1.ibm.com>
 <7fc5ee46-d849-11f1-d0ad-429a8c87d7eb@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030603-4275-0000-0000-000003A8D469
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030603-4276-0000-0000-000038BDE5E2
Message-Id: <c27d416fa11435e8ae6ede081278368506b3b9fc.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_08:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 mlxlogscore=985 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003060021
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

On Wed, 2020-03-04 at 17:53 +1100, Andrew Donnellan wrote:
> On 21/2/20 2:27 pm, Alastair D'Silva wrote:
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
> 
> Controller dump
> 

Ok

> > +			    rc);
> > +		goto out;
> > +	}
> > +
> > +	for (i = 0; i < args.buf_size; i += 8) {
> > +		u64 val;
> > +
> > +		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> > +					     ocxlpmem-
> > >admin_command.data_offset + i,
> > +					     OCXL_HOST_ENDIAN, &val);
> 
> Is a controller dump something where we want to do endian swapping?
> 

No, we just have raw binary data that we want to pass through.
OCXL_HOST_ENDIAN does no swapping.

> Any reason we're not doing the usual check of the data identifier, 
> additional data length etc?
> 

I'll add that

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
> 
> This return code is ignored
> 
> > +
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
> > +		cond_resched();
> > +	}
> > +
> > +	return 0;
> > +}
> 
> 
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

