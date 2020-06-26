Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD220AD8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 09:49:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tTYd11YRzDr2h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 17:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tTWj5bdZzDqx9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 17:48:01 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05Q7WwvQ124694; Fri, 26 Jun 2020 03:47:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ux014y33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 03:47:55 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05Q7XYj5127886;
 Fri, 26 Jun 2020 03:47:55 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ux014y2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 03:47:55 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05Q7jXO0022312;
 Fri, 26 Jun 2020 07:47:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 31uus52rn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 07:47:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05Q7lp9k61735002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 07:47:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F76942047;
 Fri, 26 Jun 2020 07:47:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B693D4204C;
 Fri, 26 Jun 2020 07:47:49 +0000 (GMT)
Received: from [9.199.51.116] (unknown [9.199.51.116])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 07:47:49 +0000 (GMT)
Subject: Re: [bug] LTP mmap03 stuck in page fault loop after c46241a370a6
 ("powerpc/pkeys: Check vma before returning key fault error to the user")
To: Jan Stancek <jstancek@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 sandipan@linux.ibm.com
References: <2065283975.18780128.1593154755849.JavaMail.zimbra@redhat.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ac99e243-0945-8be0-6ae4-73af29b7a199@linux.ibm.com>
Date: Fri, 26 Jun 2020 13:17:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2065283975.18780128.1593154755849.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_04:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 mlxlogscore=833
 phishscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260050
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
Cc: Rachel Sibley <rasibley@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jan,

On 6/26/20 12:29 PM, Jan Stancek wrote:
> Hi,
> 
> LTP mmap03 is getting stuck in page fault loop after commit
>    c46241a370a6 ("powerpc/pkeys: Check vma before returning key fault error to the user")
> 
> System is ppc64le P9 lpar [1] running v5.8-rc2-34-g3e08a95294a4.
> 
> Here's a minimized reproducer:
> ------------------------- 8< -----------------------------
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <sys/mman.h>
> 
> int main(int ac, char **av)
> {
>          int page_sz = getpagesize();
>          int fildes;
>          char *addr;
> 
>          fildes = open("tempfile", O_WRONLY | O_CREAT, 0666);
>          write(fildes, &fildes, sizeof(fildes));
>          close(fildes);
> 
>          fildes = open("tempfile", O_RDONLY);
>          unlink("tempfile");
> 
>          addr = mmap(0, page_sz, PROT_EXEC, MAP_FILE | MAP_PRIVATE, fildes, 0);
> 
>          printf("%d\n", *addr);
>          return 0;
> }
> ------------------------- >8 -----------------------------

Thanks for the report. This is execute only key where vma has the 
implied read permission. So The patch do break this case. I will see how 
best we can handle  PROT_EXEC and the multi threaded test that required 
the change in the patch.


-aneesh
