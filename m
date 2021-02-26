Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1293261C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 12:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn6QN0nJbz3clF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 22:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TL+I5Ykk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TL+I5Ykk; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn6Px0WDzz3cYD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 22:10:11 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QB57fo034145
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 06:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fpmjNqhPGNLKnBQWcqmz6kVQORYpp4kfgrHypwVNCQc=;
 b=TL+I5YkkkLf2cX5qLnS7D7q/kdGI+Sdnch6T5+rq7MX4Pp+8XRODZfm8TO0WCwDCAKnS
 Uk6Cn/rqlDE9hth1fQzkEgUQrjI2aPAnogc8OeC3TfZpewRnZ7k5d1DtRx4B/wFjWQPo
 GFdXSoEJuQBlHRLp0bzMp8ADZHChGG+kzj/mQu7FCQxzSrESgParrcjujY0gAo4M+ntp
 4TE89kxQ2eBPT/QSI6FYNboeJUz+j5UkBr8gOjDXroVJVh1Z1zyaTCs4e7OF7r2+yQ7h
 D87ABBdlcrbsklmRMMDHHf2OdgjAhxAtxR/RlFuRPdL7E/MZRnbTCpxSZVhttFuNs4qx cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xseq34b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 06:10:07 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11QB5JRv035613
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 06:10:07 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xseq3485-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 06:10:07 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QB8Ndo011719;
 Fri, 26 Feb 2021 11:10:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 36tt28ar70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 11:10:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 11QB9m0a27984378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 11:09:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36E675204F;
 Fri, 26 Feb 2021 11:10:01 +0000 (GMT)
Received: from [9.199.47.21] (unknown [9.199.47.21])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2D4F352059;
 Fri, 26 Feb 2021 11:09:59 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] powerpc/sstep: Fix VSX instruction emulation
To: Jordan Niethe <jniethe5@gmail.com>
References: <20210225031946.1458206-1-jniethe5@gmail.com>
Message-ID: <ea767ee2-5712-ed34-3987-c284908f0a43@linux.ibm.com>
Date: Fri, 26 Feb 2021 16:39:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225031946.1458206-1-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_02:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260085
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/25/21 8:49 AM, Jordan Niethe wrote:
> Commit af99da74333b ("powerpc/sstep: Support VSX vector paired storage
> access instructions") added loading and storing 32 word long data into
> adjacent VSRs. However the calculation used to determine if two VSRs
> needed to be loaded/stored inadvertently prevented the load/storing
> taking place for instructions with a data length less than 16 words.
> 
> This causes the emulation to not function correctly, which can be seen
> by the alignment_handler selftest:
> 
> $ ./alignment_handler
> [snip]
> test: test_alignment_handler_vsx_207
> tags: git_version:powerpc-5.12-1-0-g82d2c16b350f
> VSX: 2.07B
>          Doing lxsspx:   PASSED
>          Doing lxsiwax:  FAILED: Wrong Data
>          Doing lxsiwzx:  PASSED
>          Doing stxsspx:  PASSED
>          Doing stxsiwx:  PASSED
> failure: test_alignment_handler_vsx_207
> test: test_alignment_handler_vsx_300
> tags: git_version:powerpc-5.12-1-0-g82d2c16b350f
> VSX: 3.00B
>          Doing lxsd:     PASSED
>          Doing lxsibzx:  PASSED
>          Doing lxsihzx:  PASSED
>          Doing lxssp:    FAILED: Wrong Data
>          Doing lxv:      PASSED
>          Doing lxvb16x:  PASSED
>          Doing lxvh8x:   PASSED
>          Doing lxvx:     PASSED
>          Doing lxvwsx:   FAILED: Wrong Data
>          Doing lxvl:     PASSED
>          Doing lxvll:    PASSED
>          Doing stxsd:    PASSED
>          Doing stxsibx:  PASSED
>          Doing stxsihx:  PASSED
>          Doing stxssp:   PASSED
>          Doing stxv:     PASSED
>          Doing stxvb16x: PASSED
>          Doing stxvh8x:  PASSED
>          Doing stxvx:    PASSED
>          Doing stxvl:    PASSED
>          Doing stxvll:   PASSED
> failure: test_alignment_handler_vsx_300
> [snip]
> 
> Fix this by making sure all VSX instruction emulation correctly
> load/store from the VSRs.
> 
> Fixes: af99da74333b ("powerpc/sstep: Support VSX vector paired storage access instructions")
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Yikes!

Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
