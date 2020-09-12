Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AC2678D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 10:29:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpQlQ0j6gzDqtV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 18:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mvvC68gm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpQjr5sNHzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 18:28:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08C7W8gQ104015; Sat, 12 Sep 2020 04:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=rHAdj97dwH5Dx+HeSJmtfoG3uiPirI4PiMlPASpUpAw=;
 b=mvvC68gmMk84dkCjihwpQqgOrHpDoB5oka2sFkoMrDZjY/ImPbKIegKn31MhzCfcxEYs
 10o6kJwlLQYOEybiUUksY4txLYKBFeDNZ4HOy3R2/FOBB1UdEmqMCHOwkN7McHdQQ7KT
 Vrqr45W01v0kYBPcanj9VIsggs+bM8sxUOZAf/CxdakZnUpZSjqhRdLoIiWUNpwSIjp0
 CH2vAINg0zOC/xiQ4aKHq8jVk948jnsIEHbemc9ili3j1edJnK3vQR4naBKvjC416nYu
 wZrSL4N5oDsGGFBHa6U39UQhgbmP6mHuypKUDQEV30XaM97bJcDLN1vbUqiGzjV1bCDY 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33gsa1hks6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 04:27:49 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08C8Rn6k022866;
 Sat, 12 Sep 2020 04:27:49 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33gsa1hkrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 04:27:48 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08C8MX0i029330;
 Sat, 12 Sep 2020 08:27:47 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 33gny803j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 08:27:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08C8Rib265274298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Sep 2020 08:27:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D290C11C0DB;
 Sat, 12 Sep 2020 08:27:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1853D11C0D3;
 Sat, 12 Sep 2020 08:27:42 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.79.218.102])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat, 12 Sep 2020 08:27:41 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Sat, 12 Sep 2020 13:57:41 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] powerpc/papr_scm: Fix warning triggered by
 perf_stats_show()
In-Reply-To: <20200911221308.GP1930795@iweiny-DESK2.sc.intel.com>
References: <20200910092212.107674-1-vaibhav@linux.ibm.com>
 <20200910155552.GN1930795@iweiny-DESK2.sc.intel.com>
 <878sdgqdrd.fsf@vajain21.in.ibm.com>
 <20200911221308.GP1930795@iweiny-DESK2.sc.intel.com>
Date: Sat, 12 Sep 2020 13:57:41 +0530
Message-ID: <875z8jqu0y.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-12_02:2020-09-10,
 2020-09-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=1 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009120067
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ira Weiny <ira.weiny@intel.com> writes:

> On Sat, Sep 12, 2020 at 01:36:46AM +0530, Vaibhav Jain wrote:
>> Thanks for reviewing this patch Ira,
>> 
>> 
>> Ira Weiny <ira.weiny@intel.com> writes:
>> 
>> > On Thu, Sep 10, 2020 at 02:52:12PM +0530, Vaibhav Jain wrote:
>> >> A warning is reported by the kernel in case perf_stats_show() returns
>> >> an error code. The warning is of the form below:
>> >> 
>> >>  papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
>> >>  	  Failed to query performance stats, Err:-10
>> >>  dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
>> >>  fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count
>> >> 
>> >> On investigation it looks like that the compiler is silently truncating the
>> >> return value of drc_pmem_query_stats() from 'long' to 'int', since the
>> >> variable used to store the return code 'rc' is an 'int'. This
>> >> truncated value is then returned back as a 'ssize_t' back from
>> >> perf_stats_show() to 'dev_attr_show()' which thinks of it as a large
>> >> unsigned number and triggers this warning..
>> >> 
>> >> To fix this we update the type of variable 'rc' from 'int' to
>> >> 'ssize_t' that prevents the compiler from truncating the return value
>> >> of drc_pmem_query_stats() and returning correct signed value back from
>> >> perf_stats_show().
>> >> 
>> >> Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance
>> >>        stats from PHYP')
>> >> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> >> ---
>> >>  arch/powerpc/platforms/pseries/papr_scm.c | 3 ++-
>> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >> 
>> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> >> index a88a707a608aa..9f00b61676ab9 100644
>> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> >> @@ -785,7 +785,8 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>> >>  static ssize_t perf_stats_show(struct device *dev,
>> >>  			       struct device_attribute *attr, char *buf)
>> >>  {
>> >> -	int index, rc;
>> >> +	int index;
>> >> +	ssize_t rc;
>> >
>> > I'm not sure this is really fixing everything here.
>> 
>> The issue is with the statement in perf_stats_show():
>> 
>> 'return rc ? rc : seq_buf_used(&s);'
>> 
>> The function seq_buf_used() returns an 'unsigned int' and with 'rc'
>> typed as 'int', forces a promotion of the expression to 'unsigned int'
>> which causes a loss of signedness of 'rc' and compiler silently
>> assigns this unsigned value to the function return typed as 'signed
>> long'.
>> 
>> Making 'rc', a 'signed long' forces a promotion of the expresion to
>> 'signed long' which preserves the signedness of 'rc' and will also be
>> compatible with the function return type.
>
> Ok, ok, I read this all wrong.
>
> FWIW I would also cast seq_buf_used() to ssize_t to show you know what you are
> doing there.
>
>> 
>> >
>> > drc_pmem_query_stats() can return negative errno's.  Why are those not checked
>> > somewhere in perf_stats_show()?
>> >
>> For the specific invocation 'drc_pmem_query_stats(p, stats, 0)' we only
>> expect return value 'rc <=0' with '0' indicating a successful fetch of
>> nvdimm performance stats from hypervisor. Hence there are no explicit
>> checks for negative error codes in the functions as all return values
>> !=0 indicate an error.
>> 
>> 
>> > It seems like all this fix is handling is a > 0 return value: 'ret[0]' from
>> > line 289 in papr_scm.c...  Or something?
>> No, in case the arg 'num_stats' is '0' and 'buff_stats != NULL' the
>> variable 'size' is assigned a non-zero value hence that specific branch
>> you mentioned  is never taken. Instead in case of success
>> drc_pmem_query_stats() return '0' and in case of an error a negative
>> error code is returned.
>> 
>> >
>> > Worse yet drc_pmem_query_stats() is returning ssize_t which is a signed value.
>> > Therefore, it should not be returning -errno.  I'm surprised the static
>> > checkers did not catch that.
>> Didnt quite get the assertion here. The function is marked to return
>> 'ssize_t' because we can return both +ve for success and -ve values to
>> indicate errors.
>
> Sorry I was reading this as size_t and meant to say unsigned...  I was looking
> at this too quickly.
>
>> 
>> >
>> > I believe I caught similar errors with a patch series before which did not pay
>> > attention to variable types.
>> >
>> > Please audit this code for these types of errors and ensure you are really
>> > doing the correct thing when using the sysfs interface.  I'm pretty sure bad
>> > things will eventually happen (if they are not already) if you return some
>> > really big number to the sysfs core from *_show().
>> I think this problem is different compared to what you had previously pointed
>> to. The values returned from drc_pmem_query_stats() can be stored in an
>> 'int' variable too, however it was the silent promotion of a signed type
>> to unsigned type was what caused this specific issue.
>
> Ok this makes more sense now.  Sorry about not looking more carefully.
>
> But I still think matching up the return of seq_buf_used() is worth it.  I
> don't particularly like depending on 'automatic' promotions which make
> reviewing code harder like this.
Agree, I have sent out a v2 addressing this.

>
> And sorry if my email seemed harsh I did not mean it to be.  I just like when
> types are more explicit because I feel like it can avoid issues like this.
> (Specifically my confusion over the types...)
>
> :-D
No worries :-)


Thanks,
-- 
Cheers
~ Vaibhav
