Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D738972EC77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 22:07:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Os4Z2X20;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgfj15R3sz30h8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 06:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Os4Z2X20;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgfh46F5wz301c
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 06:06:12 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DJophu007306;
	Tue, 13 Jun 2023 20:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=BmCdPUNf1oVBdHJxoNPJRQVD1t0iuHrVrJ6HLh+JLXM=;
 b=Os4Z2X2004pZhSo4oNbf39qptGDVlzGq4zmpU87xa5MviBxyQ6nDW/+zoKZkhHRu0xR/
 VKdUfHA/A1Qle1qfC83G1aPCCKggMO5Hx8o/i/VuQOOcBvmHpgxA+ij9P5XgvFB48CIG
 PPtULuavEYS9Hd7t0a6+Uv3MMumiaHkOEXW9NlF5a/vX4Otnw4q7rsuZOy7JUp93Kqso
 PqXn1nZzuzXNtz/siasqsOb97RMPQU/qfEYrJ7QMaqQ7kHv/9u7E7p8n7iC5rRAOmZpq
 69vFqXm5/krvaRpyYstvuemk8Gl5xTp/mVijSYJcA7cgmetxk0H/8/8kuuhhT0CHNV7Q Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6xyj8au7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 20:06:04 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DJpEOT008312;
	Tue, 13 Jun 2023 20:06:04 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6xyj8ath-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 20:06:04 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35DHg119027245;
	Tue, 13 Jun 2023 20:06:03 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r4gt5v743-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 20:06:03 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DK62Vu65274294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 20:06:02 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC94A5806C;
	Tue, 13 Jun 2023 20:06:01 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8DC158063;
	Tue, 13 Jun 2023 20:06:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 13 Jun 2023 20:06:01 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 6466A1756C9;
	Tue, 13 Jun 2023 15:06:01 -0500 (CDT)
Date: Tue, 13 Jun 2023 15:06:00 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel
 parameter
Message-ID: <e0325643-6636-45b7-b826-b08f789f3c5b@arbab-laptop>
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
 <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1c7-xr2xZcp6M3duuGbGs-5pWa7fx5x7
X-Proofpoint-ORIG-GUID: GBMLgmet0muzyKCXjt1Amq0wt0mEoLTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_22,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=990 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306130175
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
Cc: foraker1@llnl.gov, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 09, 2023 at 11:38:51AM +0530, Aneesh Kumar K.V wrote:
>Certain devices can possess non-standard memory capacities, not constrained
>to multiples of 1GB. Provide a kernel parameter so that we can map the
>device memory completely on memory hotplug.

Case in point; the memory block size determined at boot is 1GB, but we 
know that 15.75GB of device memory will be hotplugged during runtime.

Reviewed-by: Reza Arbab <arbab@linux.ibm.com>

-- 
Reza Arbab
