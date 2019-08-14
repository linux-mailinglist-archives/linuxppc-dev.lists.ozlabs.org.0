Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 886938CC55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 09:13:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467gmJ3qpHzDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 17:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467gkZ2bCtzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:12:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467gkZ1fJ9z8tTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:12:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467gkZ0wksz9sML; Wed, 14 Aug 2019 17:12:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 467gkY4Shgz9sNC
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 17:12:05 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E7AtEd023910
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 03:12:01 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uccyc9pvq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 03:12:01 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 14 Aug 2019 08:11:58 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 08:11:56 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7E7BskJ51445916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 07:11:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24E2511C05B;
 Wed, 14 Aug 2019 07:11:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB18811C05E;
 Wed, 14 Aug 2019 07:11:51 +0000 (GMT)
Received: from [9.199.56.240] (unknown [9.199.56.240])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 07:11:51 +0000 (GMT)
Subject: Re: [PATCH v4 12/25] powernv/fadump: define register/un-register
 callback functions
To: mahesh@linux.vnet.ibm.com
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327680307.27462.16414477591782848444.stgit@hbathini.in.ibm.com>
 <20190813143413.lzhpqbx43d4nefpa@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 14 Aug 2019 12:41:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813143413.lzhpqbx43d4nefpa@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081407-0012-0000-0000-0000033EA1AB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081407-0013-0000-0000-00002178B3C5
Message-Id: <bf71b0c6-ebee-d167-3814-17b1b3acc54e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140068
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/08/19 8:04 PM, Mahesh J Salgaonkar wrote:
> On 2019-07-16 17:03:23 Tue, Hari Bathini wrote:
>> Make OPAL calls to register and un-register with firmware for MPIPL.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/powernv/opal-fadump.c |   71 +++++++++++++++++++++++++-
>>  1 file changed, 69 insertions(+), 2 deletions(-)
>>
> [...]
>> @@ -88,12 +104,63 @@ static int opal_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
>>  
>>  static int opal_fadump_register_fadump(struct fw_dump *fadump_conf)
>>  {
>> -	return -EIO;
>> +	int i, err = -EIO;
>> +	s64 rc;
>> +
>> +	for (i = 0; i < opal_fdm->region_cnt; i++) {
>> +		rc = opal_mpipl_update(OPAL_MPIPL_ADD_RANGE,
>> +				       opal_fdm->rgn[i].src,
>> +				       opal_fdm->rgn[i].dest,
>> +				       opal_fdm->rgn[i].size);
>> +		if (rc != OPAL_SUCCESS)
> 
> You may want to remove ranges which has been added so far on error and reset
> opal_fdm->registered_regions.

Thanks for catching this, Mahesh.
Will update..

> 
>> +			break;
>> +
>> +		opal_fdm->registered_regions++;
>> +	}
>> +
>> +	switch (rc) {
>> +	case OPAL_SUCCESS:
>> +		pr_info("Registration is successful!\n");
>> +		fadump_conf->dump_registered = 1;
>> +		err = 0;
>> +		break;
>> +	case OPAL_UNSUPPORTED:
>> +		pr_err("Support not available.\n");
>> +		fadump_conf->fadump_supported = 0;
>> +		fadump_conf->fadump_enabled = 0;
>> +		break;
>> +	case OPAL_INTERNAL_ERROR:
>> +		pr_err("Failed to register. Hardware Error(%lld).\n", rc);
>> +		break;
>> +	case OPAL_PARAMETER:
>> +		pr_err("Failed to register. Parameter Error(%lld).\n", rc);
>> +		break;
>> +	case OPAL_PERMISSION:
> 
> You may want to remove this check. With latest opal mpipl patches
> opal_mpipl_update() no more returns OPAL_PERMISSION.
> 
> Even if opal does, we can not say fadump already registered just by
> looking at return status of single entry addition.

Sure.

Thanks
Hari

