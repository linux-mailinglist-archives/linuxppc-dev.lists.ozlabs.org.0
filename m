Return-Path: <linuxppc-dev+bounces-3578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2419D9E76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 21:40:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyZGH00Bfz2yjV;
	Wed, 27 Nov 2024 07:40:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732653638;
	cv=none; b=VnWf7yUx1PWtPrTy4/HHrtrXTPYWylGlr5UNff+tZec0HNbUa89hHNA4g55KvfP2hP6PDKaFyk7Ljnf3EJsfgXARPmWqX+l6XM4tsmpgLyufCuTFcgAkE3pp/u5lu8totRcBFwQ1XajdaaNu+uZOqCLU9+WdWBbRUimBVTIGdzBFxJ8CEP53s4023YjXX5TYT/3u2Fu9bZTsxk1ySVpNwprh0Pc9lggvzOEIRXYMPM8hESOPk/LLp55wh26HqqTcdacpJAFB9ukxInumkjFPvyle8Xy/O3BVscnu2lOADMVsCvEDljXfRLKYk0ll9IuShXttXx/fCdTgu7Z7I9MfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732653638; c=relaxed/relaxed;
	bh=nTvnVx4I2cScrR2/2IVRlnhoOyEvD7ldCEZWTTnybN4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=U8X7C/aKlw3VRVNHvcJViLSOSxyXouxfyZTLvBDsosY6rTdFHeuDCgKOcjgLCtA7TDtZWg/cd3sjwVW32/2wE2MZxD1eNZQHMN8EfDLsyQBv3SoH+c7yBi31aVO4PXFzuZoXBGiiUAnjb2J+lbKejhWyLImoKqQjqmPqh9Lh8M30kJoGrTuOsrnqO/5veYwt519l9Lgja3YqV4YGEoSiY27sttSawPuFeyrk3m8H5rHshcOjJnw2bldG2RmSgo6dHrl4BuzmoFlgqWiV8IlNYOP2XOXkW7gwk55MSPLExAL6FRGArS8yJ99Ung4gHScgvigqxYClZumLDjo8fC+9tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MsIRI/BW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MsIRI/BW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyZGD6dtxz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 07:40:36 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQESZSX028678;
	Tue, 26 Nov 2024 20:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nTvnVx
	4I2cScrR2/2IVRlnhoOyEvD7ldCEZWTTnybN4=; b=MsIRI/BWgMTu+S3DnZrANc
	9ImkFmILfGgx1ZXohXohmFxdGXNgoRbmMpbDKBqI5qJOArpDuc2FDP0RCBHifpPv
	5GYbewLuT0v5K4Xf1pBQpqkaWCiy7LihrGHpuO4aBCt77xYzv9zt2mokmWuv6URN
	yFs932koECK16/QJZYTU0m/YVcYJQ+74X/IFrK6IreSeel2kkkEBAc2OTKThUee9
	4P/OUk70JUtxdbDCfIvS68/mMNlhERs4nhgMvKEahu7v/lEXKBD45xm5Fn0oOLnH
	o2julJXCFAlwxryKrrGg3ppBjiJKdEKmMUUYCMt15KoSJi9d3yP82qC7CCVFcfZQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43387c06hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 20:40:26 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AQKUgE7019714;
	Tue, 26 Nov 2024 20:40:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43387c06hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 20:40:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQEBo80002648;
	Tue, 26 Nov 2024 20:40:24 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 433tcmd5h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 20:40:24 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AQKeLQB4326048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 20:40:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 488BB58065;
	Tue, 26 Nov 2024 20:40:21 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 981FB58067;
	Tue, 26 Nov 2024 20:40:20 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.189.138])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Nov 2024 20:40:20 +0000 (GMT)
Message-ID: <8360c1d3c3d2ecd4bfaba6bf92b6b920672332eb.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character
 driver for dump retrieval
From: Haren Myneni <haren@linux.ibm.com>
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        maddy@linux.ibm.com, msuchanek@suse.de, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Tue, 26 Nov 2024 12:40:20 -0800
In-Reply-To: <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
References: <20241124052040.239813-1-haren@linux.ibm.com>
	 <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
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
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OyXeTSpQEnBspvFDXXZZTKP8Fnd8QKyx
X-Proofpoint-ORIG-GUID: 7-EsZ7CZRB-H_z4Yu1wFhX5EuHAcLkdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=915 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260163
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2024-11-27 at 00:42 +0530, Mahesh J Salgaonkar wrote:
> On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
> [...]
> > +static ssize_t papr_platform_dump_handle_read(struct file *file,
> > +		char __user *buf, size_t size, loff_t *off)
> > +{
> > +	struct ibm_platform_dump_params *params = file->private_data;
> > +	u64 total_bytes;
> > +	s32 fwrc;
> > +
> > +	/*
> > +	 * Dump already completed with the previous read calls.
> > +	 * In case if the user space issues further reads, returns
> > +	 * -EINVAL.
> > +	 */
> > +	if (!params->buf_length) {
> > +		pr_warn_once("Platform dump completed for dump ID
> > %llu\n",
> > +			(u64) (((u64)params->dump_tag_hi << 32) |
> > +				params->dump_tag_lo));
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (size < SZ_1K) {
> > +		pr_err_once("Buffer length should be minimum 1024
> > bytes\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The hypervisor returns status 0 if no more data available to
> > +	 * download. Then expects the last RTAS call with NULL buffer
> > +	 * to invalidate the dump which means dump will be freed in the
> > +	 * hypervisor.
> > +	 */
> > +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> > +		params->buf_length = 0;
> > +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> > +		/*
> > +		 * Returns 0 (success) to the user space so that user
> > +		 * space read stops.
> 
> Does this implicitly invalidates the dump irrespective of whether
> userspace has requested or not ?

No, the RTAS call from the last read() will invalidate the dump. Expect
the user space make the read() until returns 0 which means the last
read() will return 0 after invalidate the dump. 

size_t read() 
{
   if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
           RTAS call to invalidate dump
           return 0;
   }
   get the data from RTAS call
   If the RTAS call return status is DUMP_COMPLETE
             params->status = RTAS_IBM_PLATFORM_DUMP_COMPLETE
   return bytes_written
}

If the RTAS call returns DUMP_COMPLETE, the hypervisor expects one more
RTAS call to invalidate the dump which is done as part of the last
read()

> 
> Copy-pasting bellow code snippet from librtas side patch posted by
> you to
> librtas-devel mailing list:
> + /*
> + * rtas_platform_dump() is called with buf = NULL and length = 0
> + * for "dump complete" RTAS call to invalidate dump.
> + * For kernel interface, read() will be continued until the
> + * return value = 0. Means kernel API will return this value only
> + * after issued "dump complete" call. So nothing to do further
> + * for the last RTAS call.
> + */
> + if (buffer == NULL)
> + return 0;
> 
> If I understand this correctly, it looks like calling
> rtas_platform_dump() with buf = NULL and length = 0, now does
> nothing.
Following the same read() ABI - expects to make calls until returns
size 0.

The current usage of rtas_platform_dump() in ppc64-
diag/rtas_errd/extract_platdump.c

dump_complete = rtas_platform_dump(dump_tag, 0, dump_buf, DUMP_BUF_SZ,
                                        &seq_next, &bytes);

while (dump_complete) {

   dump_complete = rtas_platform_dump(dump_tag, seq, dump_buf,
 				DUMP_BUF_SZ, &seq_next, &bytes);
                                
}

ret = rtas_platform_dump(dump_tag, seq, NULL, 0, 
                                &seq_next, &bytes);

we need to support both new and old interfaces and not changing the
above code which uses librtas API.

So the new rtas_platform_dump() interface
{
 if the buffer == NULL 
     return - nothing to do here. Dump is invalidated with the previous
rtas_platform_dump()   
 
 size = read()
 if size == 0 
      dump complete and invalidate the dump
      return 0

  return 1;
}


> Dump is already invalidated even before userspace makes this call.
> Wouldn't this break ABI ? Correct me if I am wrong.
> 
> Consider a scenario where userspace tool using librtas interface
> rtas_platform_dump() reads the last set of data but unable to write
> it
> to the disk due to insufficient disk space. In that case, tool may
> error
> out without invalidating the dump and expect user to cleanup the disk
> space, re-run the tool to save platform dump to disk. If last read
> implicitly invalidates the dump, then in this scenario user will
> loose
> the platform dump. Shouldn't we wait for explicit request from user
> to
> invalidate the dump to avoid this ?

In case if the user space could not proceed with more read() calls due
to disk space issue or etc, the dump is still valid and the user space
can restart with sequenece 0.

it means the dump has to be written completly to the disk before
issuing the last read() call which returns size = 0 after invalidating
the dump.

Thanks
Haren

> 
> Thanks,
> -Mahesh.


