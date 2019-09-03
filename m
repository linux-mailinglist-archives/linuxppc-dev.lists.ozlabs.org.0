Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F7A7114
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 18:54:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NCj74ZtDzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 02:54:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NCBs352XzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:31:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46NCBs1lXmz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:31:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46NCBs0rFYz9sRm; Wed,  4 Sep 2019 02:31:33 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46NCBq04SPz9sRp
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Sep 2019 02:31:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83GNSYf138163
 for <linuxppc-dev@ozlabs.org>; Tue, 3 Sep 2019 12:31:28 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ust37mh7p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 03 Sep 2019 12:31:28 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 3 Sep 2019 17:31:26 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 17:31:23 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x83GVL2134078860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 16:31:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6125CA4040;
 Tue,  3 Sep 2019 16:31:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 768D2A405B;
 Tue,  3 Sep 2019 16:31:19 +0000 (GMT)
Received: from [9.85.81.203] (unknown [9.85.81.203])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 16:31:19 +0000 (GMT)
Subject: Re: [PATCH v5 11/31] powernv/fadump: add fadump support on powernv
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630272823.8896.18439144196389587229.stgit@hbathini.in.ibm.com>
 <87sgpdr5y6.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Tue, 3 Sep 2019 22:01:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87sgpdr5y6.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090316-0028-0000-0000-000003972B58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090316-0029-0000-0000-0000245979D8
Message-Id: <69b1eba6-9ca6-864c-7148-4693e4578339@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030167
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



On 03/09/19 4:40 PM, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> Add basic callback functions for FADump on PowerNV platform.
> 
> I assume this doesn't actually work yet?
> 
> Does something block it from appearing to work at runtime?

With this patch, "fadump=on" would reserve memory for FADump as support is enabled
but registration with f/w is not yet added. So, it would fail to register...

> 
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index d8dcd88..fc4ecfe 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -566,7 +566,7 @@ config CRASH_DUMP
>>  
>>  config FA_DUMP
>>  	bool "Firmware-assisted dump"
>> -	depends on PPC64 && PPC_RTAS
>> +	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
>>  	select CRASH_CORE
>>  	select CRASH_DUMP
>>  	help
>> @@ -577,7 +577,8 @@ config FA_DUMP
>>  	  is meant to be a kdump replacement offering robustness and
>>  	  speed not possible without system firmware assistance.
>>  
>> -	  If unsure, say "N"
>> +	  If unsure, say "y". Only special kernels like petitboot may
>> +	  need to say "N" here.
>>  
>>  config IRQ_ALL_CPUS
>>  	bool "Distribute interrupts on all CPUs by default"
>> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
>> index d2c5b16..f6c52d3 100644
>> --- a/arch/powerpc/kernel/fadump-common.h
>> +++ b/arch/powerpc/kernel/fadump-common.h
>> @@ -140,4 +140,13 @@ static inline int rtas_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
>>  }
>>  #endif
>>  
>> +#ifdef CONFIG_PPC_POWERNV
>> +extern int opal_fadump_dt_scan(struct fw_dump *fadump_config, ulong node);
>> +#else
>> +static inline int opal_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
>> +{
>> +	return 1;
>> +}
> 
> Extending the strange flat device tree calling convention to these
> functions is not ideal.
> 
> It would be better I think if they just returned bool true/false for
> "found it" / "not found", and then early_init_dt_scan_fw_dump() can
> convert that into the appropriate return value.
> 
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index f7c8073..b8061fb9 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -114,6 +114,9 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
>>  	if (strcmp(uname, "rtas") == 0)
>>  		return rtas_fadump_dt_scan(&fw_dump, node);
>>  
>> +	if (strcmp(uname, "ibm,opal") == 0)
>> +		return opal_fadump_dt_scan(&fw_dump, node);
>> +
> 
> ie this would become:
> 
> 	if (strcmp(uname, "ibm,opal") == 0 && opal_fadump_dt_scan(&fw_dump, node))
>             return 1;
> 

Yeah. Will update accordingly...

Thanks
Hari

