Return-Path: <linuxppc-dev+bounces-3692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 189159E1279
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 05:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Sd43jXQz2yb9;
	Tue,  3 Dec 2024 15:40:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733200824;
	cv=none; b=dk+6o9iyBwxAjPOBCiuBGuJD66s4bId4EEAEQGk+QEiSqEvOm//YU8Eoy8fkpeIUJRhgI7+GD0FK6lpXjlI8t5TREh5n9akE6O6Qm6Ys6S2ECy6jH/Q7TzHSo9TV80D63gdun5+JVjRzcpVdtZRYVoaaohfwG2pQkD7/OVFGmaxaMzJ7k9eEwLLhYT8aVY0OC/69gnkG8RWmKzBppBB7G03iQPG5oZzq5q+lx5019mzAOA4xj4IsGMltZq9eNHk35czx0fJVDXD/SLKqGT8xTFlhko33Jmv6eF2pyerpKQC8QQMTGrqyEtw/zaofRBGnyvvwvZFohU6cuAQTke+Ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733200824; c=relaxed/relaxed;
	bh=2l3ooX07ch+E8GdMnS6+X+NrpeLh/8QlFHRG29oKS+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=oIQr2fV86F6fIPp9ADJKMqXoougDY/3h7/4PdSv7DxyybJ5gC1IHa2K9O4oZ8EQHWK43+CP+m0jbBRqtJ48JcCJqXu4rGbzXHK1id2QiE5fMIwzlRrUcSZ2GA45CltRvr47HPVgrXp/Y4xgVNBLkifN8PUj27MJOv5LPI/Ab+MWUlLVJbUawhnzirP2LYPbdVzW5FHGLkBSMhhqyD4ubpNZ74Ve+funyhZm7GJ04rhfBbA3mA5rHNm38/8Fbie6pqipLZmLw+3JRpnlFxTbfEinOUCQUEHPLThEVN1cfvN/iQyvuOGp3nK2ldpwZ0VWVPOZVeuesty3BF1kHDvWEmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+xUbPi0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E+xUbPi0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Sd230bCz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 15:40:21 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B32ETKN008143;
	Tue, 3 Dec 2024 04:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2l3ooX
	07ch+E8GdMnS6+X+NrpeLh/8QlFHRG29oKS+4=; b=E+xUbPi0K/BeHQioAsDVWs
	bn2bvkm9jeZ7+plREMCf6ZzVBXNcF9tZIMOxUExHxWTL95YdCj+/eknK1emk6q+M
	CGGWX/dUe8BbEn88PjiNbDan7cq05ULxRHnYxGwS5qYBvc01ALqOwmIjEbwu2ZBT
	67YPTBhh40FJwHUErVAkSRBPboItsox/msn/QOdqUsKnXiOf50INKaQ8F7MDUgON
	8XiwjtFVDi1Of3Y0Jz8CDqSfEzf58m2hyAwC9GUhoevDBi06H8khBGfoDy4TPy2G
	oyEE+9L4wpaOa2v3LyDZwzqaupwZAAkpGN+YSezCpuDgH6eIV/I24dPENYfzHagw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfggt0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:40:12 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B34eB1M004186;
	Tue, 3 Dec 2024 04:40:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfggt0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:40:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2GpLSx020500;
	Tue, 3 Dec 2024 04:40:10 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 438d1s3gw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:40:10 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B34e7Y246596452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 04:40:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A5758052;
	Tue,  3 Dec 2024 04:40:07 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 797CD58050;
	Tue,  3 Dec 2024 04:40:06 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.117.147])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Dec 2024 04:40:06 +0000 (GMT)
Message-ID: <dc4e922325c2000cc90555d4fe936e57b779c935.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character
 driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: mahesh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        npiggin@gmail.com, maddy@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Mon, 02 Dec 2024 20:40:05 -0800
In-Reply-To: <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
References: <20241124052040.239813-1-haren@linux.ibm.com>
	 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
	 <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
	 <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
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
X-Proofpoint-ORIG-GUID: _KLL9HaahmR2qNNx8sPWx0-7LipeIYO9
X-Proofpoint-GUID: jQxCdUXlePpnwvEyxNkiWNiUlUIqIo4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030036
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2024-11-27 at 10:11 +0100, Michal Suchánek wrote:
> On Tue, Nov 26, 2024 at 12:40:20PM -0800, Haren Myneni wrote:
> > On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar wrote:
> > > On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> > > [...]
> > > > +static ssize_t papr_platform_dump_handle_read(struct file
> > > > *file,
> > > > +		char __user *buf, size_t size, loff_t *off)
> > > > +{
> > > > +	struct ibm_platform_dump_params *params = file-
> > > > >private_data;
> > > > +	u64 total_bytes;
> > > > +	s32 fwrc;
> > > > +
> > > > +	/*
> > > > +	 * Dump already completed with the previous read calls.
> > > > +	 * In case if the user space issues further reads,
> > > > returns
> > > > +	 * -EINVAL.
> > > > +	 */
> > > > +	if (!params->buf_length) {
> > > > +		pr_warn_once("Platform dump completed for dump
> > > > ID
> > > > %llu\n",
> > > > +			(u64) (((u64)params->dump_tag_hi << 32)
> > > > |
> > > > +				params->dump_tag_lo));
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	if (size < SZ_1K) {
> > > > +		pr_err_once("Buffer length should be minimum
> > > > 1024
> > > > bytes\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * The hypervisor returns status 0 if no more data
> > > > available to
> > > > +	 * download. Then expects the last RTAS call with NULL
> > > > buffer
> > > > +	 * to invalidate the dump which means dump will be
> > > > freed in the
> > > > +	 * hypervisor.
> > > > +	 */
> > > > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > {
> > > > +		params->buf_length = 0;
> > > > +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> > > > +		/*
> > > > +		 * Returns 0 (success) to the user space so
> > > > that user
> > > > +		 * space read stops.
> > > 
> > > Does this implicitly invalidates the dump irrespective of whether
> > > userspace has requested or not ?
> > 
> > No, the RTAS call from the last read() will invalidate the dump.
> > Expect
> > the user space make the read() until returns 0 which means the last
> > read() will return 0 after invalidate the dump. 
> > 
> > size_t read() 
> > {
> >    if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> >            RTAS call to invalidate dump
> >            return 0;
> >    }
> >    get the data from RTAS call
> >    If the RTAS call return status is DUMP_COMPLETE
> >              params->status = RTAS_IBM_PLATFORM_DUMP_COMPLETE
> >    return bytes_written
> > }
> > 
> > If the RTAS call returns DUMP_COMPLETE, the hypervisor expects one
> > more
> > RTAS call to invalidate the dump which is done as part of the last
> > read()
> > 
> > > Copy-pasting bellow code snippet from librtas side patch posted
> > > by
> > > you to
> > > librtas-devel mailing list:
> > > + /*
> > > + * rtas_platform_dump() is called with buf = NULL and length = 0
> > > + * for "dump complete" RTAS call to invalidate dump.
> > > + * For kernel interface, read() will be continued until the
> > > + * return value = 0. Means kernel API will return this value
> > > only
> > > + * after issued "dump complete" call. So nothing to do further
> > > + * for the last RTAS call.
> > > + */
> > > + if (buffer == NULL)
> > > + return 0;
> > > 
> > > If I understand this correctly, it looks like calling
> > > rtas_platform_dump() with buf = NULL and length = 0, now does
> > > nothing.
> > Following the same read() ABI - expects to make calls until returns
> > size 0.
> > 
> > The current usage of rtas_platform_dump() in ppc64-
> > diag/rtas_errd/extract_platdump.c
> > 
> > dump_complete = rtas_platform_dump(dump_tag, 0, dump_buf,
> > DUMP_BUF_SZ,
> >                                         &seq_next, &bytes);
> > 
> > while (dump_complete) {
> > 
> >    dump_complete = rtas_platform_dump(dump_tag, seq, dump_buf,
> >  				DUMP_BUF_SZ, &seq_next, &bytes);
> >                                 
> > }
> > 
> > ret = rtas_platform_dump(dump_tag, seq, NULL, 0, 
> >                                 &seq_next, &bytes);
> > 
> > we need to support both new and old interfaces and not changing the
> > above code which uses librtas API.
> > 
> > So the new rtas_platform_dump() interface
> > {
> >  if the buffer == NULL 
> >      return - nothing to do here. Dump is invalidated with the
> > previous
> > rtas_platform_dump()   
> >  
> >  size = read()
> >  if size == 0 
> >       dump complete and invalidate the dump
> >       return 0
> > 
> >   return 1;
> > }
> 
> No EOF?

read() returns size, 0 or < 0. Returns 0 is like EOF. 

> 
> So no standard file handling code can use this FD?

Yes, providing support for FD from ioctl for the following reasons:

- get-vpd char driver is providing only for FD from ioctl. So thought
of using same interface for platform-dump so that having consitent
interface for all RTAS function char drivers. 

- file->private_data is assigned to miscdevice in misc_register and
also assigned to some other miscdevice struct in driver specific code.
So was thinking of not following semantics in the existing code if I
private_data to save internal param struct.

Please let me know if you prefer to use FD from open() for platform-
dump read().

> 
> But also the size 0 read both indicates the EOF and invalidates the
> dump, these should be separate.
> 
> Which differs from the hypervisor API that makes it impossible to
> save
> the dump without deleting it, and introduces a regression.

The hypervisor API says to invalidate the dump after saving it. In the
current interface it does - The user space makes the last read() (for
return 0) after saving the complete dump. 

All read() calls return size (> 0) == RTAS calls for dump
read() expects return 0 == same RTAS invalidate dump

So the only difference is if the user does not call to invalidate dump
explicitly even though saved the dump, but we do not have the current
usage, Only the extract-dump command is the only usage now and please
note that this command is used for non-HMC manages system. It is not
used on HMC managed system which has its own command gets the dump
directly from the hypervisor.    

> 
> If you are doing IOCTLs anyway the invalidation could be an IOCTL. Or
> you could really follow the RTAS ABI and only incalidate if the user
> passes NULL and 0.

I could use this ioctl interface to invalidate the dump.

devfd = ioctl(fd ..) for dump ID
read(devfd)
ret = ioctl(devfd ...) to invalidate dump 

I will make changes if you are OK with this interface

> 
> But more generally the previously added RTAS wrappers do not closely
> follow the RTAS ABI, and do accumulation of read data in the kernel,
> passing the whole buffer to userspace afterwards.
> 
> Why cannot it be done in this case?

platform-dump RTAS returns more data unlike in get-vpd. In one case
noticed 3G data which is not the ideal case to save in the kernel
buffer within ioctl. 

Also platform-dump RTAS function supports interleave calls for multiple
dump IDs at the same time unlike in get-vpd case.

> 
> Even more generally if the dump IDs are stable these could be listed
> in
> some sysfs or debugfs directory, and provide standard file
> operations,
> including unlink() to remove the dump.

dump IDs are not stable. The hypervisor can have several dumps with
different IDs at the same time. so unlink() can not be used.

> 
> With the bonus that at least one of these filesystems has some
> provisions for confidentiality lockdown. The implementation could use
> that to make the dumps unavailable in confidentiality lockdown level
> if
> the dumps are considered confidential without reimplementing the
> check.

We are adding new driver (interfaces) to support lockdown. Otherwise
the current usage is sufficient. But we could modify to restrict the
interface for confidentiality lockdown in future if we have that
restriction.

Thanks
Haren

> 
> Thanks
> 
> Michal


