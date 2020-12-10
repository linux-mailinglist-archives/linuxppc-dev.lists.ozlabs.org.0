Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDB2D5F93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:27:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsHpD2tkKzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:27:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gvJxYNX1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsDGf2y4wzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 23:47:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACXW5R110842; Thu, 10 Dec 2020 07:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9c3GstVSiG3XEVs1Qgi7LE/WNydxcE2o48IRtrMg0cs=;
 b=gvJxYNX1QTzo7Nd6Mb7J41Xb+K0/p65LW8pVyG4F5/iu6illLPrBsR9RZ1AxUF0cARpq
 CyckaZnqFcq8ExXCe51PZreEWw2CP3lUTTA8lwq6Xzy7IfJtoAy7kbQbvsinHMbX/5qa
 ujhq95BWe9w9DDCuD+8RlopLJq6Xik95+3+wH5+KcpnYefPRABnZlhaU01m/eWxQ+XYy
 Y2pMYTom3i5WRZk6BZmnl6utfH/gkK94SoDHGWW/5eknHSmF+tCxFQsF9z5aWaUpEn2+
 QRfy1A69wajqkPwMcipX5DSaybMWhsOmneuNxaL+pemlStt081CS2tuMA3/WLwL79NNM ag== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bkhq8sed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:47:36 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACXFra004290;
 Thu, 10 Dec 2020 12:47:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3581u85sv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:47:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BAClWlw58982902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:47:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78F6DAE04D;
 Thu, 10 Dec 2020 12:47:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27863AE051;
 Thu, 10 Dec 2020 12:47:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Dec 2020 12:47:32 +0000 (GMT)
Received: from [9.206.213.130] (unknown [9.206.213.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 013D6609A5;
 Thu, 10 Dec 2020 23:47:30 +1100 (AEDT)
Subject: Re: Linux kernel: powerpc: RTAS calls can be used to compromise
 kernel integrity
From: Andrew Donnellan <ajd@linux.ibm.com>
To: oss-security@lists.openwall.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <09cb1e1e-c71b-83a3-4c04-4e47e7c85342@linux.ibm.com>
 <a2fd9901-d8fc-3ba7-4422-2616bbf23220@linux.ibm.com>
Message-ID: <512b0d2f-1b50-743b-9cff-efc0cff4b9e9@linux.ibm.com>
Date: Thu, 10 Dec 2020 23:47:30 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a2fd9901-d8fc-3ba7-4422-2616bbf23220@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 clxscore=1034 malwarescore=0 bulkscore=0 mlxlogscore=979
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100082
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/11/20 1:41 am, Andrew Donnellan wrote:
> On 9/10/20 12:20 pm, Andrew Donnellan wrote:
>> The Linux kernel for powerpc has an issue with the Run-Time 
>> Abstraction Services (RTAS) interface, allowing root (or CAP_SYS_ADMIN 
>> users) in a VM to overwrite some parts of memory, including kernel 
>> memory.
>>
>> This issue impacts guests running on top of PowerVM or KVM hypervisors 
>> (pseries platform), and does *not* impact bare-metal machines (powernv 
>> platform).
> CVE-2020-27777 has been assigned.

A minor regression has been identified, affecting the ibm,open-errinjct 
RTAS call.

A patch is available at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20201208195434.8289-1-tyreld@linux.ibm.com/

Thanks to Tyrel Datwyler for identifying and fixing this issue.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
