Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00180A9EFD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 11:57:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PGMH5kgYzDr4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 19:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PGJc2klWzDr3N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 19:55:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46PGJZ4KR0z8xCt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 19:55:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46PGJZ3Y7hz9sP3; Thu,  5 Sep 2019 19:55:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46PGJY5mHMz9sN1
 for <linuxppc-dev@ozlabs.org>; Thu,  5 Sep 2019 19:55:09 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x859bZGa136891
 for <linuxppc-dev@ozlabs.org>; Thu, 5 Sep 2019 05:55:06 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2utwe27h2m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 05 Sep 2019 05:55:06 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Thu, 5 Sep 2019 10:55:04 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Sep 2019 10:55:01 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x859sZsR36176218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 09:54:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C0294C040;
 Thu,  5 Sep 2019 09:54:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C86A54C044;
 Thu,  5 Sep 2019 09:54:57 +0000 (GMT)
Received: from [9.184.183.129] (unknown [9.184.183.129])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 09:54:57 +0000 (GMT)
Subject: Re: [PATCH v5 14/31] powernv/fadump: define register/un-register
 callback functions
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630275043.8896.8993437371524687114.stgit@hbathini.in.ibm.com>
 <87zhjjnr3q.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Thu, 5 Sep 2019 15:24:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhjjnr3q.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090509-4275-0000-0000-00000361741F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090509-4276-0000-0000-00003873BBE8
Message-Id: <c7f27ab5-9737-75aa-d0f8-b7f21cd69c8e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050097
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
 Nicholas Piggin <npiggin@gmail.com>, Oliver <oohall@gmail.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/09/19 12:53 PM, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
>> index e466f7e..91fb909 100644
>> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
>> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
>> @@ -52,6 +68,8 @@ static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
>>  	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
>>  				    fadump_conf->boot_memory_size);
>>  
>> +	opal_fadump_update_config(fadump_conf, opal_fdm);
>> +
>>  	return addr;
>>  }
>>  
>> @@ -97,12 +115,69 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
>>  
>>  static int opal_fadump_register(struct fw_dump *fadump_conf)
>>  {
>> -	return -EIO;
>> +	int i, err = -EIO;
>> +	s64 rc;
> 
> Some compiler versions are warning about this being used uninitialised:
> 
> arch/powerpc/platforms/powernv/opal-fadump.c:316:3: error: 'rc' may be used uninitialized in this function [-Werror=uninitialized]
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/13943984/
> 
> Which does seem like a legitimate warning.

fixed...

