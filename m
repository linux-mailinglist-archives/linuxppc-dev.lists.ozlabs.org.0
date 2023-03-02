Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D89086A79FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 04:20:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRxFf5TYTz3cXf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 14:20:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y0xGAuBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y0xGAuBo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRxDj0jC7z3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 14:20:04 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3223FxkG031521;
	Thu, 2 Mar 2023 03:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MXVL1r/HFmmcDZAfZ5gzZs4Gk1cusmaGXKpuluNnsXo=;
 b=Y0xGAuBoeX5KyRki212MEE9apOsk4qYN+LeqtBEMGvVuhx2O+YNNuv9sCKkUr7LweEa1
 QnSIrA6YzNRFP1XyFnvBoQEWoVgW99UYqhiSjr0kkX0VsK/n/lZ/DYb4sdI2j+qtfx3s
 nmpVPE8UJ05l0ibl/D+BagOjQdigmuQrK/DBN+hfmdiQRL4krMxVly+Vw+F+Ocxysjy7
 LqFI0XBa7kEoAz5bvmYCoxZeo2le9D5Q13WbB2V2tapQB6CyD1fGMFvng87sBOOfGv+a
 v5Dbh345Ir5DBfyHXgXFvptNXzbQmgH6xV2B0l2AsQ1yMQs4fqNrvP8+iKmu/6Hsbmr2 5w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2kr9028n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 03:19:59 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 321JQvUw024684;
	Thu, 2 Mar 2023 03:19:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nybdfut4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 03:19:57 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3223JrpB36700538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Mar 2023 03:19:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D6D42004B;
	Thu,  2 Mar 2023 03:19:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26FC720043;
	Thu,  2 Mar 2023 03:19:52 +0000 (GMT)
Received: from [9.204.207.212] (unknown [9.204.207.212])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Mar 2023 03:19:51 +0000 (GMT)
Message-ID: <5dc76d52-6b22-9108-9107-281b1cd386e4@linux.ibm.com>
Date: Thu, 2 Mar 2023 08:49:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] selftests/powerpc/pmu: fix including of utils.h when
 event.h is included
To: Benjamin Gray <bgray@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
        mpe@ellerman.id.au
References: <20230301170918.69176-1-kjain@linux.ibm.com>
 <20230301170918.69176-2-kjain@linux.ibm.com>
 <5a796d43f45c86d770ee88cffaae78f4ca305103.camel@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <5a796d43f45c86d770ee88cffaae78f4ca305103.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gRcAG_j54GZJWW9yMNvywpGq4mBehXPI
X-Proofpoint-GUID: gRcAG_j54GZJWW9yMNvywpGq4mBehXPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_17,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020023
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/2/23 3:35 AM, Benjamin Gray wrote:
> On Wed, 2023-03-01 at 22:39 +0530, Kajol Jain wrote:
>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>
>> event.h header already includes utlis.h. Avoid including
>> the same explicitly in the code when event.h included.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> As I understand, transitive includes should not be depended upon. If
> you use a thing, and the thing is declared in a header, you should
> include _that_ header. Anything else is a recipe for weird include
> dependencies, ordering of the includes, etc.
>
> These files all use FAIL_IF, etc., which are declared in utils.h. So
> utils.h is a legitimate include. The fact that events.h also includes
> it (for u64) is a coincidence. If the u64 type def gets moved to, e.g.,
> types.h, and utils.h is removed from events.h, suddenly all these files
> stop compiling.

thanks for the review. IIUC utils.h also carries the some test harness 
func declarations, also some of these tests does not use type defs 
anyway. I should have had a better commit message, my bad. But i will 
try out the suggested case.

Maddy
