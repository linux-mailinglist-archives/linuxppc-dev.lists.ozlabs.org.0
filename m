Return-Path: <linuxppc-dev+bounces-3809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D209E4C29
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 03:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3dHh02bmz2xsW;
	Thu,  5 Dec 2024 13:14:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733364863;
	cv=none; b=S9lQdrVxqvVNiR+97ftMPMXEvYb0haYaCEkR4Qk26FzpCZLieDkD4zAvidWwfwOzTtrmtNx/IZBZyyMMg+kRUuhUH8P0jLrb+y18IA+auc9idttsreZMEv0Tk7jqgs8MuFJ33qq8CLq4OY0KiXe7vi0jsjFtbb3d5yOF5z8NgCqU5YOaYf3ABY7D0ZgCf4ZADlKIt9yrVPrs929x1ozSA4fEojeLfPxr0S3yQ6qH0cg83ap87UTsiLP0kAjWUKqJY1eOIFym6qkozRqmHvmA+DqwWN41tHfb4Nry5i1sVv43URW6aJE2A0kxXR2b7eWDdh3kTYg7WISpo1OQTUWxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733364863; c=relaxed/relaxed;
	bh=LuaG2d2swCuwN7oYP5AP6an7dfrCkEfjDAkF3+Q6MDA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=J3XygF6ehCfC4q/A3oIGwjcknEvEdz6V5i9GKS3Uh+wsYhrFCnLz4jbxLA8PjjQiXTl8ExSTsQXoDTiNAopBct2OkiCizQOCTP05OxZfgO8aOnDw1orYdhX2XEAWUlbbjg37S1hUNMljkDIio5ECrsukmMTARPDpVmlFmjEPvfwQVx9siVyCPgwRU9WYj9ofBePOEa3XORoXW/bXrmRicGSAabhctmPtwavjIjVLPtHi/8syWTipwIsTt/5nF6A4m/KlFHMyPKIKuBYjHXDFTux2obX9UQq5GyW2k3kkhh0tZG28Ph9NC2Rb6M4wXEuTyYHl6V1JsUPILqNSlU2UGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SGn3iqpD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SGn3iqpD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3dHf5K32z2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 13:14:21 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B510NeZ010706;
	Thu, 5 Dec 2024 02:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LuaG2d
	2swCuwN7oYP5AP6an7dfrCkEfjDAkF3+Q6MDA=; b=SGn3iqpDqcQgdooLcXu66p
	G4x/asmG6v6RRRplVTOymWHiSOva++iay0l9DPF4hFlHv50o5QqC8IB+3xstHwCW
	x2fd6wZPogq/M0Iy2j+E5riHvTpjeNoOUpxEH+iMsBZs39pjULkJ36xna5yHm7Rx
	SrnyErBh1hfDaebs+CpJ1qmxA0WP2PN2/JDfDsECr/zP1fiaaY6aIynb5/ETa1pY
	qXkSYkEDRsh1W8Txu+TwtW4QQQz1UuanY2dAY4fUM4y2NyQTpln8ZWyWZhhBCNO/
	mPycTbGfs0ZmEvTNN/0XDiayDStMgd02jRMUOeLj6l3EAXtBn+bhoONhtCyDgbQw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b24r87e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 02:14:12 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B52Di0n019238;
	Thu, 5 Dec 2024 02:14:11 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b24r87e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 02:14:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4NDTpA023542;
	Thu, 5 Dec 2024 02:14:10 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438e1n6rw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 02:14:10 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B52E7kH41681170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 02:14:07 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95A515805C;
	Thu,  5 Dec 2024 02:14:07 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EED175805A;
	Thu,  5 Dec 2024 02:14:06 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.117.147])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Dec 2024 02:14:06 +0000 (GMT)
Message-ID: <cb309fcf4cf5f6ced1cb00b9af42efe7412a5f4f.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character
 driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: mahesh@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        npiggin@gmail.com, maddy@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Wed, 04 Dec 2024 18:14:06 -0800
In-Reply-To: <Z1CJ4NuO3gUdqUY4@kitsune.suse.cz>
References: <20241124052040.239813-1-haren@linux.ibm.com>
	 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
	 <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
	 <Z0biWRHqzcXvG7vm@kitsune.suse.cz>
	 <dc4e922325c2000cc90555d4fe936e57b779c935.camel@linux.ibm.com>
	 <Z1CJ4NuO3gUdqUY4@kitsune.suse.cz>
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
X-Proofpoint-GUID: aFaQkMyZ_vHQduAsvAkztVbs-oLVEiM3
X-Proofpoint-ORIG-GUID: PaYRvTnAYbA2GSl9a0xLg8iZDZ42IFek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050011
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2024-12-04 at 17:57 +0100, Michal Suchánek wrote:
> On Mon, Dec 02, 2024 at 08:40:05PM -0800, Haren Myneni wrote:
> > On Wed, 2024-11-27 at 10:11 +0100, Michal Suchánek wrote:
> > > On Tue, Nov 26, 2024 at 12:40:20PM -0800, Haren Myneni wrote:
> > > > On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar wrote:
> > > > > On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> > > > > [...]
> > > > > > +static ssize_t papr_platform_dump_handle_read(struct file
> > > > > > *file,
> > > > > > +		char __user *buf, size_t size, loff_t *off)
> > > > > > +{
> > > > > > +	struct ibm_platform_dump_params *params = file-
> > > > > > > private_data;
> > > > > > +	u64 total_bytes;
> > > > > > +	s32 fwrc;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * Dump already completed with the previous read calls.
> > > > > > +	 * In case if the user space issues further reads,
> > > > > > returns
> > > > > > +	 * -EINVAL.
> > > > > > +	 */
> > > > > > +	if (!params->buf_length) {
> > > > > > +		pr_warn_once("Platform dump completed for dump
> > > > > > ID
> > > > > > %llu\n",
> > > > > > +			(u64) (((u64)params->dump_tag_hi << 32)
> > > > > > +				params->dump_tag_lo));
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (size < SZ_1K) {
> > > > > > +		pr_err_once("Buffer length should be minimum
> > > > > > 1024
> > > > > > bytes\n");
> > > > > > +		return -EINVAL;
> > > > > > +	}
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The hypervisor returns status 0 if no more data
> > > > > > available to
> > > > > > +	 * download. Then expects the last RTAS call with NULL
> > > > > > buffer
> > > > > > +	 * to invalidate the dump which means dump will be
> > > > > > freed in the
> > > > > > +	 * hypervisor.
> > > > > > +	 */
> > > > > > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE)
> > > > > > {
> > > > > > +		params->buf_length = 0;
> > > > > > +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> > > > > > +		/*
> > > > > > +		 * Returns 0 (success) to the user space so
> > > > > > that user
> > > > > > +		 * space read stops.
> > > > > 
> > > > > Does this implicitly invalidates the dump irrespective of
> > > > > whether
> > > > > userspace has requested or not ?
> > > > 
> > > > No, the RTAS call from the last read() will invalidate the
> > > > dump.
> > > > Expect
> > > > the user space make the read() until returns 0 which means the
> > > > last
> > > > read() will return 0 after invalidate the dump. 
> > > > 
> > > > size_t read() 
> > > > {
> > > >    if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > > >            RTAS call to invalidate dump
> > > >            return 0;
> > > >    }
> > > >    get the data from RTAS call
> > > >    If the RTAS call return status is DUMP_COMPLETE
> > > >              params->status = RTAS_IBM_PLATFORM_DUMP_COMPLETE
> > > >    return bytes_written
> > > > }
> > > > 
> > > > If the RTAS call returns DUMP_COMPLETE, the hypervisor expects
> > > > one
> > > > more
> > > > RTAS call to invalidate the dump which is done as part of the
> > > > last
> > > > read()
> > > > 
> > > > > Copy-pasting bellow code snippet from librtas side patch
> > > > > posted
> > > > > by
> > > > > you to
> > > > > librtas-devel mailing list:
> > > > > + /*
> > > > > + * rtas_platform_dump() is called with buf = NULL and length
> > > > > = 0
> > > > > + * for "dump complete" RTAS call to invalidate dump.
> > > > > + * For kernel interface, read() will be continued until the
> > > > > + * return value = 0. Means kernel API will return this value
> > > > > only
> > > > > + * after issued "dump complete" call. So nothing to do
> > > > > further
> > > > > + * for the last RTAS call.
> > > > > + */
> > > > > + if (buffer == NULL)
> > > > > + return 0;
> > > > > 
> > > > > If I understand this correctly, it looks like calling
> > > > > rtas_platform_dump() with buf = NULL and length = 0, now does
> > > > > nothing.
> > > > Following the same read() ABI - expects to make calls until
> > > > returns
> > > > size 0.
> > > > 
> > > > The current usage of rtas_platform_dump() in ppc64-
> > > > diag/rtas_errd/extract_platdump.c
> > > > 
> > > > dump_complete = rtas_platform_dump(dump_tag, 0, dump_buf,
> > > > DUMP_BUF_SZ,
> > > >                                         &seq_next, &bytes);
> > > > 
> > > > while (dump_complete) {
> > > > 
> > > >    dump_complete = rtas_platform_dump(dump_tag, seq, dump_buf,
> > > >  				DUMP_BUF_SZ, &seq_next,
> > > > &bytes);
> > > >                                 
> > > > }
> > > > 
> > > > ret = rtas_platform_dump(dump_tag, seq, NULL, 0, 
> > > >                                 &seq_next, &bytes);
> > > > 
> > > > we need to support both new and old interfaces and not changing
> > > > the
> > > > above code which uses librtas API.
> > > > 
> > > > So the new rtas_platform_dump() interface
> > > > {
> > > >  if the buffer == NULL 
> > > >      return - nothing to do here. Dump is invalidated with the
> > > > previous
> > > > rtas_platform_dump()   
> > > >  
> > > >  size = read()
> > > >  if size == 0 
> > > >       dump complete and invalidate the dump
> > > >       return 0
> > > > 
> > > >   return 1;
> > > > }
> > > 
> > > No EOF?
> > 
> > read() returns size, 0 or < 0. Returns 0 is like EOF. 
> 
> Indeed, looks like the special EOF value is only added by libc, sorry
> about the noise.
> 
> > > So no standard file handling code can use this FD?
> > 
> > Yes, providing support for FD from ioctl for the following reasons:
> > 
> > - get-vpd char driver is providing only for FD from ioctl. So
> > thought
> > of using same interface for platform-dump so that having consitent
> > interface for all RTAS function char drivers. 
> > 
> > - file->private_data is assigned to miscdevice in misc_register and
> > also assigned to some other miscdevice struct in driver specific
> > code.
> > So was thinking of not following semantics in the existing code if
> > I
> > private_data to save internal param struct.
> > 
> > Please let me know if you prefer to use FD from open() for
> > platform-
> > dump read().
> 
> There is no way to specify the dump id with open() of the character
> device. So for open() other mechanism would have to be used, such as
> sysfs/debugfs which can list the IDs as filenames, or something
> similar.

you mentioned about standard file handling code using FD from open. So
I was referring to passing dump ID with ioctl as in the current patch,
but using FD returned from open() for read() calls like:
fd = open()
ret =  ioctl(fd,.. dumpid)
read(fd, buf, size)

As in get-vpd, we will have one other RTAS stream function get-indices. 
I will add this support later. So I am proposing same interfaces for
RTAS functions as provided by papr-vpd so that same type of interfaces
will be used across all RTAS functions

fd = open()
devfd = ioctl(fd,.. dumpid)
read(devfd, buf, size)    --> will just returns 0 if the previous RTAS
call returns dump complete status. But will not invalidate the dump.
ret = ioctl(devfd, .. dumpid) - can be used to invalidate dump as you
suggested.  

> 
> > > But also the size 0 read both indicates the EOF and invalidates
> > > the
> > > dump, these should be separate.
> > > 
> > > Which differs from the hypervisor API that makes it impossible to
> > > save
> > > the dump without deleting it, and introduces a regression.
> > 
> > The hypervisor API says to invalidate the dump after saving it. In
> > the
> > current interface it does - The user space makes the last read()
> > (for
> > return 0) after saving the complete dump. 
> > 
> > All read() calls return size (> 0) == RTAS calls for dump
> > read() expects return 0 == same RTAS invalidate dump
> > 
> > So the only difference is if the user does not call to invalidate
> > dump
> > explicitly even though saved the dump, but we do not have the
> > current
> > usage, Only the extract-dump command is the only usage now and
> > please
> > note that this command is used for non-HMC manages system. It is
> > not
> > used on HMC managed system which has its own command gets the dump
> > directly from the hypervisor.    
> 
> However, the hypervisor does provide the option to read the dump
> without
> invalidating it.
> 
> At the very least this option is useful for testing. Not making it a
> separate call makes it needlessly difficult for people testing the
> feature.
> 
> If as you say this is used exclusively by extract-dump, and it
> already
> calls an IOCTL to obtain a FD it can call another IOCTL on it to do
> the
> invalidation. There is hte corner case that the kernel might need to
> finish the reading of the dump on its own if the userspace did not to
> perform the IOCTL, or return an error if the dump is not fully read
> yet.

kernel should not read the remaining dump if the user space did not
issue or returns an error if the complete dump is not read. should
leave it to the user space as it is doing now. As Mahesh pointed
before, what if the user space gets exited for some reason in the
middle of dump collection. 

should be same before but one more ioctl to invaldate the dump

read()
{
   if the status is 'dump complete' 
         return 0;

   if the status is 'dump invalidated'
         return -EINVAL  -- means user space issued ioctl to invalidate
before. should not expect this but in case

   RTAS call to get the dump
   return size;
}

ioctl(devfd, ...) 
{
  if the status is 'dump complete'
      RTAS call to invalidate dump
      return 0;

  return -EINVAL --- expects the user space to issue this ioctl after
read() returns 0
}
      
> 
> > > If you are doing IOCTLs anyway the invalidation could be an
> > > IOCTL. Or
> > > you could really follow the RTAS ABI and only incalidate if the
> > > user
> > > passes NULL and 0.
> > 
> > I could use this ioctl interface to invalidate the dump.
> > 
> > devfd = ioctl(fd ..) for dump ID
> > read(devfd)
> > ret = ioctl(devfd ...) to invalidate dump 
> > 
> > I will make changes if you are OK with this interface
> 
> Yes, for the ioctl interface this looks like a better option.

Thanks for your suggestion. As I mentioned above, will add this change.
> 
> > > But more generally the previously added RTAS wrappers do not
> > > closely
> > > follow the RTAS ABI, and do accumulation of read data in the
> > > kernel,
> > > passing the whole buffer to userspace afterwards.
> > > 
> > > Why cannot it be done in this case?
> > 
> > platform-dump RTAS returns more data unlike in get-vpd. In one case
> > noticed 3G data which is not the ideal case to save in the kernel
> > buffer within ioctl. 
> > 
> > Also platform-dump RTAS function supports interleave calls for
> > multiple
> > dump IDs at the same time unlike in get-vpd case.
> 
> It would be nice to document why this call is incompatible with the
> existing implementations somewhere in the commit message or a
> comment.

I think mentioned about interleave calls. Sure will update in comments.

> 
> > > Even more generally if the dump IDs are stable these could be
> > > listed
> > > in
> > > some sysfs or debugfs directory, and provide standard file
> > > operations,
> > > including unlink() to remove the dump.
> > 
> > dump IDs are not stable. The hypervisor can have several dumps with
> > different IDs at the same time. so unlink() can not be used.
> 
> I mean stable in the sense that same dump corresponds always to the
> same
> ID. Not in the sense that new dumps cannot be addded, and old
> removed.
> 
> It is indeed unclear what is the lifecycle of these dump IDs, and how
> they are created, and how the userspace is obtaining them.

Dump IDs can be 64bit value and so I think they may not be reused.
Whenever the hypervisor has the dump ot if the user initiates the dump
with BMC interface, notifies to the partition with the dump ID and
automatically executes extract_platdump command.  

We should be OK Since using ioctl to invalidate

fd = open()
devfd = ioctl(fd,.. dumpid)
read(devfd, buf, size)
ret = ioctl(devfd, .. dumpid)

Will implement the above change. Please let me know if you have any
concerns. 

Thanks
Haren

> 
> Thanks
> 
> Michal
> 
> > > With the bonus that at least one of these filesystems has some
> > > provisions for confidentiality lockdown. The implementation could
> > > use
> > > that to make the dumps unavailable in confidentiality lockdown
> > > level
> > > if
> > > the dumps are considered confidential without reimplementing the
> > > check.
> > 
> > We are adding new driver (interfaces) to support lockdown.
> > Otherwise
> > the current usage is sufficient. But we could modify to restrict
> > the
> > interface for confidentiality lockdown in future if we have that
> > restriction.
> > 
> > Thanks
> > Haren
> > 
> > > Thanks
> > > 
> > > Michal


