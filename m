Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A97AA35F928
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 18:47:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL7fy4Rtzz30FX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 02:47:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qEUb/FTx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qEUb/FTx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL7fW5gh2z2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 02:46:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EGZFKv048968; Wed, 14 Apr 2021 12:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=hcRtu2hVZ9Tgc8MPJOkfWeVL3suyMdreVgEwXwE4Bh8=;
 b=qEUb/FTxQNli3D3XdIXHQSln6qsXfybT/4oAo/ju9fyVo5jyBKJVOIah57LioXgU0f39
 2KSMH7QvJwSL5GcRHFXOz/TRyv6qgnp3v1wj6EMSmG5RT5Skdv7fNGl+ixnbPEAKXj/2
 JpianPNyiq7Cf17nAOnPEGS1HzjU/CS19Zmi7gFEitX2yd5xIYmGOcUP+rCSIka+na6T
 FvTatnlFg/AcfQ3uCb9ONYyRJbNpf3q03M6MG+CLfLbJYOILDiiV3sT8L2ZliF4TZnn2
 Y4SnN+ZUA7/lTSx/BaUCqAPirRbORKZKGNpC0RcLy9GrMG4xln8M1EZTAeTzs7NtXBCn 7g== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wxjwav7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 12:46:30 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EGhQXC020811;
 Wed, 14 Apr 2021 16:46:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 37u39h9u2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:46:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13EGk3YL19136782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 16:46:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9776A4285A;
 Wed, 14 Apr 2021 16:21:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 023A242854;
 Wed, 14 Apr 2021 16:21:42 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.72.167])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 14 Apr 2021 16:21:41 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 14 Apr 2021 21:51:41 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] powerpc/papr_scm: Reduce error severity if nvdimm stats
 inaccessible
In-Reply-To: <20210414153625.GB1904484@iweiny-DESK2.sc.intel.com>
References: <20210414124026.332472-1-vaibhav@linux.ibm.com>
 <20210414153625.GB1904484@iweiny-DESK2.sc.intel.com>
Date: Wed, 14 Apr 2021 21:51:40 +0530
Message-ID: <87lf9kkfaj.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WmB2GR3nSPblUZCacqQ7Wf-gvQRT5y-P
X-Proofpoint-GUID: WmB2GR3nSPblUZCacqQ7Wf-gvQRT5y-P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_10:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104140107
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
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for looking into this patch Ira,

Ira Weiny <ira.weiny@intel.com> writes:

> On Wed, Apr 14, 2021 at 06:10:26PM +0530, Vaibhav Jain wrote:
>> Currently drc_pmem_qeury_stats() generates a dev_err in case
>> "Enable Performance Information Collection" feature is disabled from
>> HMC. The error is of the form below:
>> 
>> papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Failed to query
>> 	 performance stats, Err:-10
>> 
>> This error message confuses users as it implies a possible problem
>> with the nvdimm even though its due to a disabled feature.
>> 
>> So we fix this by explicitly handling the H_AUTHORITY error from the
>> H_SCM_PERFORMANCE_STATS hcall and generating a warning instead of an
>> error, saying that "Performance stats in-accessible".
>> 
>> Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 835163f54244..9216424f8be3 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -277,6 +277,9 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>>  		dev_err(&p->pdev->dev,
>>  			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
>>  		return -ENOENT;
>> +	} else if (rc == H_AUTHORITY) {
>> +		dev_warn(&p->pdev->dev, "Performance stats in-accessible");
>> +		return -EPERM;
>
> Is this because of a disabled feature or because of permissions?

Its because of a disabled feature that revokes permission for a guest to
retrieve performance statistics.

The feature is called "Enable Performance Information Collection" and
once disabled the hcall H_SCM_PERFORMANCE_STATS returns an error
H_AUTHORITY indicating that the guest doesn't have permission to retrieve
performance statistics.

>
> Ira
>
>>  	} else if (rc != H_SUCCESS) {
>>  		dev_err(&p->pdev->dev,
>>  			"Failed to query performance stats, Err:%lld\n", rc);
>> -- 
>> 2.30.2
>> 

-- 
Cheers
~ Vaibhav
