Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD4163F6F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:56:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNzd1gjtz3fXY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:56:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K5rtHY3z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rohan123@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K5rtHY3z;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNJH508sPz3bVD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 01:24:16 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1EJCxt001403;
	Thu, 1 Dec 2022 14:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Syk+92dz5HWngSIR1fbs57iI1UPMmzjsyGdgDb+HR0Q=;
 b=K5rtHY3zyone3yXNcNXcGyYY8Pr7077NrnY0s+I4LXW9T+pikXW2zwXV+mU3xXZSeHnf
 GN9J0m8oK67xqaBI+D534TDGzpTTVcZ8vyFH+Gvc3kjGtsi/wKaofgl/AJ3Innfnsle0
 flr0QF+IF0upZyzq5iulhXewwLZpt8RwuLBQ5XqIMyrPLn8UlIerijS+Ss8fHGZ6OK5E
 q+54SzU1Jm2ds9WC22qmxQh+TKplMH8QF1tDi3QwsYYN20w7d3FiiwIdEXpRTk1uu6ED
 GvPN1qvD4jku9jUwrMDaZh4j5EK8KrKGsVFUrxXj41efArK9zNOp4aVR2nCuWy1b8/0x 4g== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6wwwr38w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 14:24:09 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1ELYoC024883;
	Thu, 1 Dec 2022 14:24:09 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01dal.us.ibm.com with ESMTP id 3m3aeana7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 14:24:09 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B1EO76g37224868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 14:24:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C847E58058;
	Thu,  1 Dec 2022 14:24:07 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB9AD58045;
	Thu,  1 Dec 2022 14:24:05 +0000 (GMT)
Received: from [9.43.113.3] (unknown [9.43.113.3])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Dec 2022 14:24:05 +0000 (GMT)
Message-ID: <fc65e759-6432-f05e-e0ea-b131833b2d41@linux.ibm.com>
Date: Thu, 1 Dec 2022 19:54:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] selftests/powerpc: Bump up rlimit for perf-hwbreak
 test
Content-Language: en-US
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
 <187fed5843cecc1e5066677b6296ee88337d7bef.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
From: Rohan Deshpande <rohan123@linux.ibm.com>
In-Reply-To: <187fed5843cecc1e5066677b6296ee88337d7bef.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pQRopZAcIik7nxv2X21ULubfvQmAaukq
X-Proofpoint-ORIG-GUID: pQRopZAcIik7nxv2X21ULubfvQmAaukq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=637 clxscore=1011 malwarescore=0
 suspectscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010102
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: Rohan Deshpande <rohan_d@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I have verified and tested this patch. No issues found. Changes look good.

Tested-by: Rohan Deshpande <rohan_d@linux.vnet.ibm.com>

