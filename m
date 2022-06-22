Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC155544B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 10:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LScM54qZVz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 18:42:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R/MyRn6Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LScKj03xJz3blF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 18:40:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R/MyRn6Q;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LScKd19Ltz4xZb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 18:40:53 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LScKd15ybz4xZj; Wed, 22 Jun 2022 18:40:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R/MyRn6Q;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LScKc61H9z4xZb
	for <linuxppc-dev@ozlabs.org>; Wed, 22 Jun 2022 18:40:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M8NmcQ011003;
	Wed, 22 Jun 2022 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZQ+dEbpWJFMETnununWmQP43T3T8Azzd7hTNqrMT9JU=;
 b=R/MyRn6Q1dW4BCS2tj4NMXx6dRPSAQC/gRO3DToF0k0pG7ndz8K3CPbAXOXoBtXt2Q/U
 EtVz8Csw+LikPVXcBYSAkYuElrt84gV4vPLWln5za2UPrsneKX71e+aVFX6nxV43VCW2
 6QUzeN8KXpS/W2Vx5bYQViF/sxfMmAyUAitPEk2L87fizt/xKC4x3Nu4vRx8QOHbxcy4
 l3/yWnmoIBkVeSp7aL/yxaau/Iznix/Kn/GC1v+6AVoE+dEHxJRXsAIaQZPG6JxSho3j
 304BUsmvoa8kUCbd5CshOVCIxWc1Gh0U0wa9bsjbYh7LL2B6s9ybpnnz8Pp5GAFVrMQz JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3guyhm0fru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 08:40:41 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25M8RNSB028228;
	Wed, 22 Jun 2022 08:40:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3guyhm0fq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 08:40:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25M8avtA016975;
	Wed, 22 Jun 2022 08:40:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3gs5yhnax7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 08:40:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25M8eZAK21233962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 08:40:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADC3B11C050;
	Wed, 22 Jun 2022 08:40:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E4B311C04A;
	Wed, 22 Jun 2022 08:40:33 +0000 (GMT)
Received: from [9.43.27.116] (unknown [9.43.27.116])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 22 Jun 2022 08:40:33 +0000 (GMT)
Message-ID: <bc8f37cb-006a-0c33-2de8-1481b4201be1@linux.ibm.com>
Date: Wed, 22 Jun 2022 14:10:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/5] powerpc/kexec: make update_cpus_node non-static
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
 <20220620070106.93141-2-sourabhjain@linux.ibm.com>
 <2df3da07-9384-d8b2-15f5-b124538b93c2@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <2df3da07-9384-d8b2-15f5-b124538b93c2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rq3qBF01Xbcu7F1WoKukn5-Yxxb0rMFT
X-Proofpoint-ORIG-GUID: CNYtTFeCdoWLtxJtMB1lF2Lntx1H000b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_11,2022-06-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220041
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 21/06/22 14:29, Laurent Dufour wrote:
> On 20/06/2022, 09:01:02, Sourabh Jain wrote:
>> Make the update_cpus_node function non-static and export it for
>> usage in other kexec components.
>>
>> The update_cpus_node definition is moved to core_64.c so that it
>> can be used with both kexec_load and kexec_file_load system calls.
>>
>> No functional change intended.
> And FWIW
> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
Thank you!

- Sourabh Jain
