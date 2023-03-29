Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF316CEF45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 18:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmsMd0830z3fRZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 03:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VvJI2jz8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VvJI2jz8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmsLg3k4Vz3fWT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 03:23:55 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TFImKf031559;
	Wed, 29 Mar 2023 16:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=OPIFeVKZdTJBxwWmqPxhofDp/dXisMXEBrxSrCW8PiA=;
 b=VvJI2jz8km+H+280g6WSssASV/HsqZtPvSQD5G86dhn/LdYOMyFMcOn5t9B+K2krWkCl
 5R2IEIomWb2lhDbivLHiHYQS1Lar6515GFZvZ22cs46dDbky3cmj/tLIlUAvW+5o6bsz
 yrSf06J4c9EZ0DTXoQGt9jXiMLMRxhCBq2yuCRJ7SP1JNQg2ynnEg/ha4GRSDI0HPRae
 gxOUEYZmEhAEnfeVABJTxFhexvYAr4gTPqbNtxSubyGqyaPmTih78bemr2W+73FI5iM8
 Ng832nzKDQivqSYK8Yn3IHmdJ8JIjhYix0IWQkWc1wVzxOpZ+voafNfYAmuMAXt3upaY Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmp7j4x9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 16:23:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32TEgZ8D012696;
	Wed, 29 Mar 2023 16:23:45 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmp7j4x91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 16:23:45 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TGMaQZ024768;
	Wed, 29 Mar 2023 16:23:44 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3phrk7n251-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 16:23:44 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32TGNgT25046874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Mar 2023 16:23:42 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DCF15805E;
	Wed, 29 Mar 2023 16:23:42 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C21758052;
	Wed, 29 Mar 2023 16:23:42 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Mar 2023 16:23:42 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 7/8] powerpc/rtas: warn on unsafe argument to
 rtas_call_unlocked()
In-Reply-To: <87zg7vbvfi.fsf@mpe.ellerman.id.au>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-7-010e4416f13f@linux.ibm.com>
 <e0f8c82707dce0300fc5a2bc5f0a3ab90a83cee0.camel@linux.ibm.com>
 <87mt437jcu.fsf@linux.ibm.com> <871qlf6k7m.fsf@linux.ibm.com>
 <87zg7vbvfi.fsf@mpe.ellerman.id.au>
Date: Wed, 29 Mar 2023 11:23:42 -0500
Message-ID: <87y1nf5xwx.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w3y424zCHPm_-jUgwdDMROtVL6aHptWQ
X-Proofpoint-GUID: 1Lz2i92E_z34-KeDUVAGIDvm9dPoK5iD
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_09,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290123
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>
>>> aside: does anyone know if the display_status() code is worth keeping?
>>> It looks like it is used to drive the 16-character wide physical LCD I
>>> remember seeing on P4-era and older machines. Is it a vestige of
>>> non-LPAR pseries that should be dropped, or is it perhaps useful for
>>> chrp or cell?
>>
>> Never mind, I see the display-character token and associated properties
>> on a P8 LPAR and in a current PAPR.
>
> Or a P10 LPAR even.
>
> The characters written using it are shown on the HMC, somewhere on the
> partition info page.

Yes, in the "Reference code" field. On the command line, you can see the
history, too:

hscroot@ltchmcv3:~> lsrefcode -r lpar -m ltczep4 --filter lpar_names=ltczep4-lp3 -n 10 -F 'time_stamp refcode'
"03/28/2023 18:38:20" "Linux ppc64le"
"03/28/2023 18:38:19" CA000093
"03/28/2023 18:38:19" CA00E891
"03/28/2023 18:38:19" CA260208
"03/28/2023 18:38:19" CA260208
"03/28/2023 18:38:19" CA00E890
"03/28/2023 18:38:19" CA000050
"03/28/2023 18:38:19" CA000040
"03/28/2023 18:38:19" CA00E880
"03/28/2023 18:38:19" CA00E879

https://www.ibm.com/docs/en/power10/000V-HMC?topic=commands-lsrefcode
