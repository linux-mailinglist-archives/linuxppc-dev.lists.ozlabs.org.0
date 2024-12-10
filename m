Return-Path: <linuxppc-dev+bounces-3906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD59EABC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 10:18:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6tT403ffz2yD8;
	Tue, 10 Dec 2024 20:18:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733822327;
	cv=none; b=MePZK5u3mUWc/Gmg8gvlMw6WsnAh1CusI2LL5Y2vuFYsnL61EJMATb7qDS+1QZhlfBftCy1rud529ubROdQ9xEZrYz7zB2vK/6mIe4g48AzXE+ZGvYHvJyy8Wyjr7kVGzvrbFH5bcAQaVFa0nY2BNmVozFrn9k6dYc5CWt93+0HURnXmThnI5uPr5Ngl+U8uIiOg8rIwCzkNmVMCxkNX/pTwvT8l4wAuNDsR62UPik7J7Gzl5pyQipfVRdtT54xgFxqEc3fdVbacn2v30ueCSvuu0I6f14YyDeY0SjNmu9V20EW0pNaUxzsbdStK5JP/d7i4h6YSbHGQTqa/pPSHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733822327; c=relaxed/relaxed;
	bh=sWEUz31F+d6vCA053kKbiXRN8DceyyMTxzP7yvYbH6E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=gHwNk+PHExus+QpU97gMv9LfIiIWf/LxNZ/+JbnvYl9ZHVxQnak0bGNHZ2W0+0ayUKaqySNfQAhOHZArhB39PbbQM8Cf5Q9GJbuuTMsuRcRbyImQqKLBtC/DiwzQ1mb7pyKYRJu/G2CjJi25OU+B1GeyTz8KIMNI3eHQXbqADM8yLIbpoVY6Qv433UCzYPx8bRZ+fMV+C/FD8y700URbLIEPeQrLwLQnCoCm6sGmCXUaKTzru+b9RV8dsp5i7hDHvASTqpCLcVcdHj8sEbDbZOcmktiCh+5CPZlO5DlfRYlfJYrHCE0x9pBUOSE16If8xcBkSDdpe2VJS7xEugTOVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PllBf/F5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PllBf/F5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6tT26VmDz2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 20:18:46 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA8k2iv009922;
	Tue, 10 Dec 2024 09:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sWEUz3
	1F+d6vCA053kKbiXRN8DceyyMTxzP7yvYbH6E=; b=PllBf/F5RHQ1xLcJOD+XBA
	JoeXnoVyDL/p2WdfOBLgC1JMLuf4U4VEt8XHhYXyFOOZV+sf6mtXg8kgBKhDzcBY
	Z0NO4rGtx7CQNF7/ZIfwAvYTOAHDqJB0CsEbd5v6nm5TjRUN+O+2xm4rQU6vqMS2
	tInA0x89jHY/fDxbtYsO5jNmfDMIo9SEHgNKPQ7VD9EOjww395S8S/S7dg3Gb1RX
	TvML9Od5M5P/VMiKL7/hiI9F+bSSRsvSO6+uUGITDkmQx9eqQQkwYBNvBd9gC+1K
	1YodkhbWWwk5mwd9sGuQT4Dl9OfA4q3AycHCpzJjkC8QEtVbxYR5m1pvlBWJqM3g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xd2kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:18:36 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BA9AWGe025607;
	Tue, 10 Dec 2024 09:18:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ce0xd2kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:18:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6N7Qq032754;
	Tue, 10 Dec 2024 09:18:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0psb4ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:18:35 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BA9IVXP59638180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 09:18:31 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F00158058;
	Tue, 10 Dec 2024 09:18:31 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA6858057;
	Tue, 10 Dec 2024 09:18:30 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.105.17])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Dec 2024 09:18:30 +0000 (GMT)
Message-ID: <381c2f7b53488eebb680b61816bf56460faf8049.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character
 driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: mahesh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        npiggin@gmail.com, maddy@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Tue, 10 Dec 2024 01:18:29 -0800
In-Reply-To: <Z1GDf7yrwoP4Pq0l@kitsune.suse.cz>
References: <20241124052040.239813-1-haren@linux.ibm.com>
	 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
	 <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
	 <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
	 <dc4e922325c2000cc90555d4fe936e57b779c935.camel@linux.ibm.com>
	 <Z1CJ4NuO3gUdqUY4@kitsune.suse.cz>
	 <cb309fcf4cf5f6ced1cb00b9af42efe7412a5f4f.camel@linux.ibm.com>
	 <Z1GDf7yrwoP4Pq0l@kitsune.suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-26.el8_10) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hgL-QimBy4OXqdC12qPyY1RYW_Y94EkV
X-Proofpoint-ORIG-GUID: Is3qNQaxo8AeqMnjCs4kwFBiTABTAN-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100068
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 2024-12-05 at 11:42 +0100, Michal Suchánek wrote:
> On Wed, Dec 04, 2024 at 06:14:06PM -0800, Haren Myneni wrote:
> > On Wed, 2024-12-04 at 17:57 +0100, Michal Suchánek wrote:
> > > On Mon, Dec 02, 2024 at 08:40:05PM -0800, Haren Myneni wrote:
> > > > On Wed, 2024-11-27 at 10:11 +0100, Michal Suchánek wrote:
> > > > > On Tue, Nov 26, 2024 at 12:40:20PM -0800, Haren Myneni wrote:
> > > > > > On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar
> > > > > > wrote:
> > > > > > > On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> > > > > > > [...]
> > > > > > > > +static ssize_t papr_platform_dump_handle_read(struct
> > > > > > > > file
> > > > > > > > *file,
> > > > > > > > +		char __user *buf, size_t size, loff_t
> > > > > > > > *off)
> > > > > > > > +{
> > > > > > > > +	struct ibm_platform_dump_params *params = file-
> > > > > > > > > private_data;
> > > > > > > > +	u64 total_bytes;
> > > > > > > > +	s32 fwrc;
> > > > > > > > +
> > > > > > > > +	/*
> > > > > > > > +	 * Dump already completed with the previous
> > > > > > > > read calls.
> > > > > > > > +	 * In case if the user space issues further
> > > > > > > > reads,
> > > > > > > > returns
> > > > > > > > +	 * -EINVAL.
> > > > > > > > +	 */
> > > > > > > > +	if (!params->buf_length) {
> > > > > > > > +		pr_warn_once("Platform dump completed
> > > > > > > > for dump
> > > > > > > > ID
> > > > > > > > %llu\n",
> > > > > > > > +			(u64) (((u64)params-
> > > > > > > > >dump_tag_hi << 32)
> > > > > > > > +				params->dump_tag_lo));
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	if (size < SZ_1K) {
> > > > > > > > +		pr_err_once("Buffer length should be
> > > > > > > > minimum
> > > > > > > > 1024
> > > > > > > > bytes\n");
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	/*
> > > > > > > > +	 * The hypervisor returns status 0 if no more
> > > > > > > > data
> > > > > > > > available to
> > > > > > > > +	 * download. Then expects the last RTAS call
> > > > > > > > with NULL
> > > > > > > > buffer
> > > > > > > > +	 * to invalidate the dump which means dump will
> > > > > > > > be
> > > > > > > > freed in the
> > > > > > > > +	 * hypervisor.
> > > > > > > > +	 */
> > > > > > > > +	if (params->status ==
> > > > > > > > RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > > > {
> > > > > > > > +		params->buf_length = 0;
> > > > > > > > +		fwrc = rtas_ibm_platform_dump(params,
> > > > > > > > 0, 0);
> > > > > > > > +		/*
> > > > > > > > +		 * Returns 0 (success) to the user
> > > > > > > > space so
> > > > > > > > that user
> > > > > > > > +		 * space read stops.
> > > > > > > 
> > > > > > > Does this implicitly invalidates the dump irrespective of
> > > > > > > whether
> > > > > > > userspace has requested or not ?
> > > > > > 
> > > > > > No, the RTAS call from the last read() will invalidate the
> > > > > > dump.
> > > > > > Expect
> > > > > > the user space make the read() until returns 0 which means
> > > > > > the
> > > > > > last
> > > > > > read() will return 0 after invalidate the dump. 
> > > > > > 
> > > > > > size_t read() 
> > > > > > {
> > > > > >    if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > > > > >            RTAS call to invalidate dump
> > > > > >            return 0;
> > > > > >    }
> > > > > >    get the data from RTAS call
> > > > > >    If the RTAS call return status is DUMP_COMPLETE
> > > > > >              params->status =
> > > > > > RTAS_IBM_PLATFORM_DUMP_COMPLETE
> > > > > >    return bytes_written
> > > > > > }
> > > > > > 
> > > > > > If the RTAS call returns DUMP_COMPLETE, the hypervisor
> > > > > > expects
> > > > > > one
> > > > > > more
> > > > > > RTAS call to invalidate the dump which is done as part of
> > > > > > the
> > > > > > last
> > > > > > read()
> > > > Yes, providing support for FD from ioctl for the following
> > > > reasons:
> > > > 
> > > > - get-vpd char driver is providing only for FD from ioctl. So
> > > > thought
> > > > of using same interface for platform-dump so that having
> > > > consitent
> > > > interface for all RTAS function char drivers. 
> > > > 
> > > > - file->private_data is assigned to miscdevice in misc_register
> > > > and
> > > > also assigned to some other miscdevice struct in driver
> > > > specific
> > > > code.
> > > > So was thinking of not following semantics in the existing code
> > > > if
> > > > I
> > > > private_data to save internal param struct.
> > > > 
> > > > Please let me know if you prefer to use FD from open() for
> > > > platform-
> > > > dump read().
> > > 
> > > There is no way to specify the dump id with open() of the
> > > character
> > > device. So for open() other mechanism would have to be used, such
> > > as
> > > sysfs/debugfs which can list the IDs as filenames, or something
> > > similar.
> > 
> > you mentioned about standard file handling code using FD from open.
> > So
> > I was referring to passing dump ID with ioctl as in the current
> > patch,
> > but using FD returned from open() for read() calls like:
> > fd = open()
> > ret =  ioctl(fd,.. dumpid)
> > read(fd, buf, size)
> > 
> > As in get-vpd, we will have one other RTAS stream function get-
> > indices. 
> 
> It would be much clearer if these two related functions were
> implemented together.

I need more time to implement ibm,get-indices support. Do you prefer to
wait platform-dump RTAS call support along with ibm,get-indices?

> 
> > I will add this support later. So I am proposing same interfaces
> > for
> > RTAS functions as provided by papr-vpd so that same type of
> > interfaces
> > will be used across all RTAS functions
> 
> The proposed interface is similar but subtly different. While
> papr_vpd accumulates the data in kernel and returns them in single
> call, this API requires the user to call read() repeatedly to obtain
> the data, unlike papr_vpd.
> 
> With the requirement to introduce a new API it can as well be
> designed
> to fit the call in question.

For papr-vpd, the user space can issue read call to get all data. But 
can also use multiple read calls until EOF. See rtas_get_vpd()
implementation in librtas sources
 
 get_vpd_chardev() - 
https://github.com/ibm-power-utilities/librtas/blob/next/librtas_src/vpd.c

Adding the following stream RTAS calls support in the kernel for
lockdown:

ibm,get-vpd: included in papr-vpd.c, Address of location code as input
and starts with sequence 0. Interleaved RTAS calls are not supported.
So get the complete buffer within ioctl and the buffer is available to
the user space with read() calls. 

current kernel implementation:
ioctl:
- first RTAS call with sequence 0 and continue for the complete buffer
- If need to start, start with sequence 0 again;

Interface usage in the user space: see librtas code.
fd = open()
devfd = ioctl(fd ..)
while (read());

ibm,platform-dump: The user space passes dumpID as input with ioctl().
Interleaved RTAS calls are supported - with multiple dump IDs. Also the
dump may need large buffer  (noticed 3G dump in my testing) if get the
complete dump within ioctl. So proposing RTAS call for each read. Then
dump has to be invalidated at the end of dump to remove the dump from
the hypervisor.

fd= open()
devfd = ioctl(fd, ) - sets sequence =1;

read(devfd, )
{
  RTAS call with sequence and dump ID which returns next sequence#

  until end of dump
}
ioctl(devfd, ..) -  invalidate dump
   -- If this ioctl is not called by the user space, the dump is still
valid and the user space can restart the sequence with the original
ioctl(fd, ..) which sets the sequence = 1;

The current platform-dump implementation:
ppc64-diag/rtas_errd/extract_platdump.c
{
status = First RTAS call with sequence = 1
while (status == dump_complete)
  status = RTAS call with next sequence

status = RTAS call to invalidate dump
}

get-indices RTAS call: Takes indicator or sensor and type as inputs
from the user space with ioctl(). Multiple interleave calls are not
supported with different indices. So will be proposing similar
interface as in get-vpd - Read complete buffer in ioctl() and the
buffer will be available with read(). In the case of get-vpd, each RTAS
call returns #bytes written and the user space can read continuous
buffer. Where as get-indices, RTAS call does not tell number of bytes
written and the output has to be certain format for each RTAS call
given below:

- Number Returned: 32-bit integer representing the number of indicator
indices returned on this call
- Sets of (32-bit integer index, 32-bit integer length of location code
including NULLs, location code string (NULL terminated and padded to
nearest 4 byte boundary)), one set per indicator or sensor, with the
number of sets indicated by the first integer in this work buffer

The hypervisor determine how many indices can fit in to the requested
buffer and fills the buffer. For example if 1K buffer is requested, we
may not get the data in all 1K buffer. So will be gettng 1K buffer
(fixed) for each RTAS call and appends to the one buffer as in get-vpd
during ioctl. Each read returns 1K to the user space (as in the current
implementation in librtas)

ioctl()
{ start sequence 1, 
  get 1K buffer from RTAS call for each sequence
  copy 1K to large buffer
  if need to start sequence again, start with sequence 1.
}

read()
{ return 1K buffer until EOF
}

The current implementaion in the user space:
https://github.com/ibm-power-utilities/librtas/tree/next/librtas_src   
> 
> > fd = open()
> > devfd = ioctl(fd,.. dumpid)
> > read(devfd, buf, size)    --> will just returns 0 if the previous
> > RTAS
> > call returns dump complete status. But will not invalidate the
> > dump.
> > ret = ioctl(devfd, .. dumpid) - can be used to invalidate dump as
> > you
> > suggested.  
> > 
> > > > > But also the size 0 read both indicates the EOF and
> > > > > invalidates
> > > > > the
> > > > > dump, these should be separate.
> > > > > 
> > > > > Which differs from the hypervisor API that makes it
> > > > > impossible to
> > > > > save
> > > > > the dump without deleting it, and introduces a regression.
> > > > 
> > > > The hypervisor API says to invalidate the dump after saving it.
> > > > In
> > > > the
> > > > current interface it does - The user space makes the last
> > > > read()
> > > > (for
> > > > return 0) after saving the complete dump. 
> > > > 
> > > > All read() calls return size (> 0) == RTAS calls for dump
> > > > read() expects return 0 == same RTAS invalidate dump
> > > > 
> > > > So the only difference is if the user does not call to
> > > > invalidate
> > > > dump
> > > > explicitly even though saved the dump, but we do not have the
> > > > current
> > > > usage, Only the extract-dump command is the only usage now and
> > > > please
> > > > note that this command is used for non-HMC manages system. It
> > > > is
> > > > not
> > > > used on HMC managed system which has its own command gets the
> > > > dump
> > > > directly from the hypervisor.    
> > > 
> > > However, the hypervisor does provide the option to read the dump
> > > without
> > > invalidating it.
> > > 
> > > At the very least this option is useful for testing. Not making
> > > it a
> > > separate call makes it needlessly difficult for people testing
> > > the
> > > feature.
> > > 
> > > If as you say this is used exclusively by extract-dump, and it
> > > already
> > > calls an IOCTL to obtain a FD it can call another IOCTL on it to
> > > do
> > > the
> > > invalidation. There is hte corner case that the kernel might need
> > > to
> > > finish the reading of the dump on its own if the userspace did
> > > not to
> > > perform the IOCTL, or return an error if the dump is not fully
> > > read
> > > yet.
> > 
> > kernel should not read the remaining dump if the user space did not
> > issue or returns an error if the complete dump is not read. should
> > leave it to the user space as it is doing now. As Mahesh pointed
> > before, what if the user space gets exited for some reason in the
> > middle of dump collection. 
> > 
> > should be same before but one more ioctl to invaldate the dump
> > 
> > read()
> > {
> >    if the status is 'dump complete' 
> >          return 0;
> > 
> >    if the status is 'dump invalidated'
> >          return -EINVAL  -- means user space issued ioctl to
> > invalidate
> > before. should not expect this but in case
> > 
> >    RTAS call to get the dump
> >    return size;
> > }
> > 
> > ioctl(devfd, ...) 
> > {
> >   if the status is 'dump complete'
> >       RTAS call to invalidate dump
> >       return 0;
> > 
> >   return -EINVAL --- expects the user space to issue this ioctl
> > after
> > read() returns 0
> > }
> 
> That makes not a very nice API, though.
> 
> Also EINVAL is not exactly helpful: the call arguments are valid, the
> kernel merely refused to do the remaining reads until it can perform
> the
> invalidation according to the hypervisor API.

We can change to some other errno ex: -EPERM - not allowed since the
dump is not completed. 

"dump-complete' status is returned from RTAS call only after all data
is retrieved. So you mean the user space will be reading again starting
from sequence 1. Not sure about this special case. But even if the tool
starts again. it can restart the dump sequence with new ioctl(fd,..)
before dump invalidate.
ex: 
close(devfd)
devfd = ioctl(fd, ..)  - sets sequence 0 and next read() calls will get
the complete dump 
 
> 
> > > > > If you are doing IOCTLs anyway the invalidation could be an
> > > > > IOCTL. Or
> > > > > you could really follow the RTAS ABI and only incalidate if
> > > > > the
> > > > > user
> > > > > passes NULL and 0.
> > > > 
> > > > I could use this ioctl interface to invalidate the dump.
> > > > 
> > > > devfd = ioctl(fd ..) for dump ID
> > > > read(devfd)
> > > > ret = ioctl(devfd ...) to invalidate dump 
> > > > 
> > > > I will make changes if you are OK with this interface
> > > 
> > > Yes, for the ioctl interface this looks like a better option.
> > 
> > Thanks for your suggestion. As I mentioned above, will add this
> > change.
> > > > > But more generally the previously added RTAS wrappers do not
> > > > > closely
> > > > > follow the RTAS ABI, and do accumulation of read data in the
> > > > > kernel,
> > > > > passing the whole buffer to userspace afterwards.
> > > > > 
> > > > > Why cannot it be done in this case?
> > > > 
> > > > platform-dump RTAS returns more data unlike in get-vpd. In one
> > > > case
> > > > noticed 3G data which is not the ideal case to save in the
> > > > kernel
> > > > buffer within ioctl. 
> > > > 
> > > > Also platform-dump RTAS function supports interleave calls for
> > > > multiple
> > > > dump IDs at the same time unlike in get-vpd case.
> > > 
> > > It would be nice to document why this call is incompatible with
> > > the
> > > existing implementations somewhere in the commit message or a
> > > comment.
> > 
> > I think mentioned about interleave calls. Sure will update in
> > comments.
> > 
> > > > > Even more generally if the dump IDs are stable these could be
> > > > > listed
> > > > > in
> > > > > some sysfs or debugfs directory, and provide standard file
> > > > > operations,
> > > > > including unlink() to remove the dump.
> > > > 
> > > > dump IDs are not stable. The hypervisor can have several dumps
> > > > with
> > > > different IDs at the same time. so unlink() can not be used.
> > > 
> > > I mean stable in the sense that same dump corresponds always to
> > > the
> > > same
> > > ID. Not in the sense that new dumps cannot be addded, and old
> > > removed.
> > > 
> > > It is indeed unclear what is the lifecycle of these dump IDs, and
> > > how
> > > they are created, and how the userspace is obtaining them.
> > 
> > Dump IDs can be 64bit value and so I think they may not be reused.
> > Whenever the hypervisor has the dump ot if the user initiates the
> > dump
> > with BMC interface, notifies to the partition with the dump ID and
> > automatically executes extract_platdump command.  
> 
> So the reason you can get away with not implementing get-indices is
> that
> the dump ID is passed in an event that invokes saving the dump.

Sorry if I created confusion. platform-dump and get-indices are
separate RTAS calls for different usage. 

> 
> That should perhaps be documented as well.
> 
> Also it does sound like get-indices together with these dump reading
> functions would work with a filesystem API with readdir returning the
> get-indices, and then the filename in open() or unlink() giving the
> dump
> ID.
> 
> It's not really a problem if dump IDs are reused over time, it's also
> possible to delete a file, and create one with the same name later.
> What
> would be a problem for this is if get-indices gave different results
> each time even without the available dumps changing.
> 
> However, it would make unlink() quite inefficient requiring to read
> the
> dump a second time.

Are you proposing the following interfaces with unlink() usage:
fd= open()
ret = ioctl(dumpid) - which should create <dumpID> file name under some
sysfs interface
devfd = open(sysfs-dumpid-file)
read(devfd,..) -- Note: First read should pass sequence=1 to RTAS call
unlink(sysfs-dumpid-file)
close(devfd)

Suppose if the tool likes to read the dump again, read() call has to be
with sequence 1. I am not sure how do we tell read to start the dump. I
think it becomes more complex interface. So thinking of having similar
interface for all RTAS stream calls to make it simple.

> 
> Also if the only known tool used for reading dumps always reads the
> dump
> once and then invalidates it repeated dump reading may trigger not
> yet
> encountered hyperviisor bugs.

Not sure what kind of bugs are exposed here. Expects the tool follow
same semantics as in the current usage.

As I mentioned about the behavior of 3 different RTAS calls, please let
me know if you have any comments.

Thanks
Haren

> 
> Thanks
> 
> Michal
> 
> > We should be OK Since using ioctl to invalidate
> > 
> > fd = open()
> > devfd = ioctl(fd,.. dumpid)
> > read(devfd, buf, size)
> > ret = ioctl(devfd, .. dumpid)
> > 
> > Will implement the above change. Please let me know if you have any
> > concerns. 
> > 
> > Thanks
> > Haren
> > 
> > > Thanks
> > > 
> > > Michal
> > > 
> > > > > With the bonus that at least one of these filesystems has
> > > > > some
> > > > > provisions for confidentiality lockdown. The implementation
> > > > > could
> > > > > use
> > > > > that to make the dumps unavailable in confidentiality
> > > > > lockdown
> > > > > level
> > > > > if
> > > > > the dumps are considered confidential without reimplementing
> > > > > the
> > > > > check.
> > > > 
> > > > We are adding new driver (interfaces) to support lockdown.
> > > > Otherwise
> > > > the current usage is sufficient. But we could modify to
> > > > restrict
> > > > the
> > > > interface for confidentiality lockdown in future if we have
> > > > that
> > > > restriction.
> > > > 
> > > > Thanks
> > > > Haren
> > > > 
> > > > > Thanks
> > > > > 
> > > > > Michal


