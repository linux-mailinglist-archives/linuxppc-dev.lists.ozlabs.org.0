Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391BA20AEC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 11:11:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tWN336PvzDr2P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 19:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tWL331sTzDqys
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 19:09:47 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05Q93DSg167408; Fri, 26 Jun 2020 05:09:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vbmuwxmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 05:09:41 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05Q93JXY168176;
 Fri, 26 Jun 2020 05:09:40 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vbmuwxk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 05:09:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05Q90qEH025164;
 Fri, 26 Jun 2020 09:09:38 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 31uus72uuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 09:09:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05Q99ZX352822080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 09:09:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE885A405D;
 Fri, 26 Jun 2020 09:09:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1499FA4051;
 Fri, 26 Jun 2020 09:09:34 +0000 (GMT)
Received: from [9.199.51.116] (unknown [9.199.51.116])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 09:09:33 +0000 (GMT)
Subject: Re: [bug] LTP mmap03 stuck in page fault loop after c46241a370a6
 ("powerpc/pkeys: Check vma before returning key fault error to the user")
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Jan Stancek <jstancek@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 sandipan@linux.ibm.com
References: <2065283975.18780128.1593154755849.JavaMail.zimbra@redhat.com>
 <ac99e243-0945-8be0-6ae4-73af29b7a199@linux.ibm.com>
Message-ID: <a55e7ccd-09e8-726a-21d2-02b00b48d857@linux.ibm.com>
Date: Fri, 26 Jun 2020 14:39:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ac99e243-0945-8be0-6ae4-73af29b7a199@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_05:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 cotscore=-2147483648 mlxlogscore=767
 lowpriorityscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260066
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
Cc: Rachel Sibley <rasibley@redhat.com>, linuxram@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/26/20 1:17 PM, Aneesh Kumar K.V wrote:
> Hi Jan,
> 
> On 6/26/20 12:29 PM, Jan Stancek wrote:
>> Hi,
>>
>> LTP mmap03 is getting stuck in page fault loop after commit
>>    c46241a370a6 ("powerpc/pkeys: Check vma before returning key fault 
>> error to the user")
>>
>> System is ppc64le P9 lpar [1] running v5.8-rc2-34-g3e08a95294a4.
>>
>> Here's a minimized reproducer:
>> ------------------------- 8< -----------------------------
>> #include <fcntl.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <sys/mman.h>
>>
>> int main(int ac, char **av)
>> {
>>          int page_sz = getpagesize();
>>          int fildes;
>>          char *addr;
>>
>>          fildes = open("tempfile", O_WRONLY | O_CREAT, 0666);
>>          write(fildes, &fildes, sizeof(fildes));
>>          close(fildes);
>>
>>          fildes = open("tempfile", O_RDONLY);
>>          unlink("tempfile");
>>
>>          addr = mmap(0, page_sz, PROT_EXEC, MAP_FILE | MAP_PRIVATE, 
>> fildes, 0);
>>
>>          printf("%d\n", *addr);
>>          return 0;
>> }
>> ------------------------- >8 -----------------------------
> 
> Thanks for the report. This is execute only key where vma has the 
> implied read permission. So The patch do break this case. I will see how 
> best we can handle  PROT_EXEC and the multi threaded test that required 
> the change in the patch.
> 

Can you check with this change? While checking for access permission we 
are checking against UAMOR value which i think is wrong. We just need to 
look at the AMR and IAMR values to check whether access is permitted or 
not. Even if UAMOR deny the userspace management of the key, we should
do the correct access check.

modified   arch/powerpc/mm/book3s64/pkeys.c
@@ -353,9 +353,6 @@ static bool pkey_access_permitted(int pkey, bool 
write, bool execute)
  	int pkey_shift;
  	u64 amr;

-	if (!is_pkey_enabled(pkey))
-		return true;
-
  	pkey_shift = pkeyshift(pkey);
  	if (execute && !(read_iamr() & (IAMR_EX_BIT << pkey_shift)))
  		return true;



