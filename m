Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC05A6EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 00:35:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bBRP29WkzDr0R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 08:35:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bBPk1xZtzDqw2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 08:33:46 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SMVtVc097104; Fri, 28 Jun 2019 18:33:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdtv11n5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 18:33:37 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5SMWAlp097783;
 Fri, 28 Jun 2019 18:33:37 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdtv11n5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 18:33:37 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5SMTYEn010551;
 Fri, 28 Jun 2019 22:33:36 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2t9by7r9vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 22:33:36 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5SMXX1G64618938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 22:33:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5303BE04F;
 Fri, 28 Jun 2019 22:33:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64C9DBE051;
 Fri, 28 Jun 2019 22:33:30 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.221.58])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 28 Jun 2019 22:33:30 +0000 (GMT)
References: <20190521044912.1375-1-bauerman@linux.ibm.com>
 <20190521044912.1375-4-bauerman@linux.ibm.com>
 <3b45cc84-273b-b333-831c-85c501b7e78e@ozlabs.ru>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [RFC PATCH 03/12] powerpc/prom_init: Add the ESM call to prom_init
In-reply-to: <3b45cc84-273b-b333-831c-85c501b7e78e@ozlabs.ru>
Date: Fri, 28 Jun 2019 19:33:24 -0300
Message-ID: <87mui1732j.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=8 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280258
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Mike Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Alexey,

Thanks for reviewing this patch!

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 21/05/2019 14:49, Thiago Jung Bauermann wrote:
>> @@ -1707,6 +1723,43 @@ static void __init prom_close_stdin(void)
>>  	}
>>  }
>>  
>> +#ifdef CONFIG_PPC_SVM
>> +static int prom_rtas_os_term_hcall(uint64_t args)
>
>
> This is just an rtas hcall, nothing special about "os-term".

Sorry, unfortunately I don't understand how we're treating os-term
especially. Do you mean that we should inline this function directly
into prom_rtas_os_term()?

>> +{
>> +	register uint64_t arg1 asm("r3") = 0xf000;
>> +	register uint64_t arg2 asm("r4") = args;
>> +
>> +	asm volatile("sc 1\n" : "=r" (arg1) :
>> +			"r" (arg1),
>> +			"r" (arg2) :);
>> +	return arg1;
>> +}
>> +
>> +static struct rtas_args __prombss os_term_args;
>> +
>> +static void __init prom_rtas_os_term(char *str)
>> +{
>> +	phandle rtas_node;
>> +	__be32 val;
>> +	u32 token;
>> +
>> +	prom_printf("%s: start...\n", __func__);
>> +	rtas_node = call_prom("finddevice", 1, 1, ADDR("/rtas"));
>> +	prom_printf("rtas_node: %x\n", rtas_node);
>> +	if (!PHANDLE_VALID(rtas_node))
>> +		return;
>> +
>> +	val = 0;
>> +	prom_getprop(rtas_node, "ibm,os-term", &val, sizeof(val));
>> +	token = be32_to_cpu(val);
>> +	prom_printf("ibm,os-term: %x\n", token);
>> +	if (token == 0)
>> +		prom_panic("Could not get token for ibm,os-term\n");
>> +	os_term_args.token = cpu_to_be32(token);
>> +	prom_rtas_os_term_hcall((uint64_t)&os_term_args);
>> +}
>> +#endif /* CONFIG_PPC_SVM */
>> +
>>  /*
>>   * Allocate room for and instantiate RTAS
>>   */

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
