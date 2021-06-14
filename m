Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8363A6B4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 18:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3bxk56vjz306b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 02:09:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FZEUNK1a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FZEUNK1a; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3bxF65mSz2yX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 02:09:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EG4EK8066722; Mon, 14 Jun 2021 12:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=n+QxpEM014TwshG0VtGzpDI2olXnbUGiWUlsi9JoC4I=;
 b=FZEUNK1ayw1l8bSUXqVkIW8BAaNgaJ/wBCvJuLb4bNVjlIx32PZHs9CneqxBZnyHJC4r
 ulQhDWGNKGLSuwu9QNJE1LRLQZ1fdwn4ZXA0r7e2XBhM6V1Nzvlfa0HsByOxqwVS+Ex5
 1jzeTcz0XWskpq2zUJYKUpyyvdI0EBbeys1WBb0KZgzVEu7Qj11LbcPWaCm9XZq5w9aY
 /abhvkksEr+xmgE8mCWjArAXqpLslGoR0Fkj+leLiusuu6R3IEyxD3gZDRch2b9w7rX2
 bCQawGBOst51944vpKZirv8sYrCLLsGYvLTyk2zDsiOKg2mxmIS7La8l0VT+a9fQKXF7 TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3968p8kuvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 12:09:01 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EG4LZf067467;
 Mon, 14 Jun 2021 12:09:00 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3968p8kuub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 12:09:00 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EG8w1B019507;
 Mon, 14 Jun 2021 16:08:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6hs1wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 16:08:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EG8tFs33554930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 16:08:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCCCB4C052;
 Mon, 14 Jun 2021 16:08:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CE074C044;
 Mon, 14 Jun 2021 16:08:46 +0000 (GMT)
Received: from [9.199.37.120] (unknown [9.199.37.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 16:08:45 +0000 (GMT)
Subject: Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.4%
 regression
To: kernel test robot <oliver.sang@intel.com>
References: <20210614145536.GB28801@xsang-OptiPlex-9020>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <a815a022-cf3e-fe4b-ee23-191523ed1980@linux.ibm.com>
Date: Mon, 14 Jun 2021 21:38:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614145536.GB28801@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JldCXgJL5a2CFqaV3FoVchIir4sdoWR-
X-Proofpoint-ORIG-GUID: U9h-5n8hiO_SNRGUwRzYFXGPSCzYZYqM
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_10:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 spamscore=0 mlxlogscore=942
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140102
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
Cc: feng.tang@intel.com, 0day robot <lkp@intel.com>, linux-mm@kvack.org,
 kaleshsingh@google.com, LKML <linux-kernel@vger.kernel.org>, npiggin@gmail.com,
 lkp@lists.01.org, Linus Torvalds <torvalds@linux-foundation.org>,
 zhengjun.xing@linux.intel.com, ying.huang@intel.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/14/21 8:25 PM, kernel test robot wrote:
> 
> 
> Greeting,
> 
> FYI, we noticed a -29.4% regression of vm-scalability.throughput due to commit:
> 
> 
> commit: ecf8443e51a862b261313c2319ab4e4aed9e6b7e ("[PATCH v7 02/11] mm/mremap: Fix race between MOVE_PUD mremap and pageout")
> url: https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/Speedup-mremap-on-ppc64/20210607-135424
> base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git next
> 
>

We dropped that approach and is now using 
https://lore.kernel.org/linux-mm/20210610083549.386085-1-aneesh.kumar@linux.ibm.com 


Instead of pud lock we are now using rmap lock with mremap.

Can you check with that series?

-aneesh
