Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABF1129E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:28:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wQJN4bMwzDqND
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wQH62GJxzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 18:27:29 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x438Hhtt106494
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 May 2019 04:27:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s8ganc1m8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2019 04:27:27 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Fri, 3 May 2019 09:27:25 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 May 2019 09:27:22 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x438RLkj30081238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 May 2019 08:27:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 246E811C050;
 Fri,  3 May 2019 08:27:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C857B11C052;
 Fri,  3 May 2019 08:27:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 May 2019 08:27:20 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3848BA01D4;
 Fri,  3 May 2019 18:27:19 +1000 (AEST)
Subject: Re: [PATCH v2] powerpc/powernv: Restrict OPAL symbol map to only be
 readable by root
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190503075253.22798-1-ajd@linux.ibm.com>
 <20190503075916.GA14960@kroah.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 3 May 2019 18:27:18 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503075916.GA14960@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050308-0020-0000-0000-00000338D3B3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050308-0021-0000-0000-0000218B5F11
Message-Id: <f584ce91-a49b-ef33-7090-cb0a91b87e82@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905030054
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 Stewart Smith <stewart@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/5/19 5:59 pm, Greg KH wrote:>> -static BIN_ATTR_RO(symbol_map, 0);
>> +static struct bin_attribute symbol_map_attr = {
>> +	.attr = {.name = "symbol_map", .mode = 0400},
>> +	.read = symbol_map_read
>> +};
> 
> There's no real need to rename the structure, right?  Why not just keep
> the bin_attr_symbol_map name?  That would make this patch even smaller.

No real need but it's locally more consistent with the rest of the PPC 
code. (Though perhaps the other cases should use the BIN_ATTR macro...)

Given this is for stable I'm happy to change that if the smaller patch 
is more acceptable.

> 
>>   static void opal_export_symmap(void)
>>   {
>> @@ -698,10 +701,10 @@ static void opal_export_symmap(void)
>>   		return;
>>   
>>   	/* Setup attributes */
>> -	bin_attr_symbol_map.private = __va(be64_to_cpu(syms[0]));
>> -	bin_attr_symbol_map.size = be64_to_cpu(syms[1]);
>> +	symbol_map_attr.private = __va(be64_to_cpu(syms[0]));
>> +	symbol_map_attr.size = be64_to_cpu(syms[1]);
>>   
>> -	rc = sysfs_create_bin_file(opal_kobj, &bin_attr_symbol_map);
>> +	rc = sysfs_create_bin_file(opal_kobj, &symbol_map_attr);
> 
> Meta-comment, odds are you are racing userspace when you create this
> sysfs file, why not add it to the device's default attributes so the
> driver core creates it for you at the correct time?

I was not previously aware of default attributes...

Are we actually racing against userspace in a subsys initcall?

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

