Return-Path: <linuxppc-dev+bounces-11498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF8CB3C342
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD7xM2LPtz2yx8;
	Sat, 30 Aug 2025 05:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756496631;
	cv=none; b=dhFax0Wzh+LaIYestDA7G4wO/htxbgA4Du5p4Ly1xbsa67Vl7ljICYCIxc67jDyXxPqPtTZfVWa0Pp1eVXBoACCdto8arWwaoSdIr4COJXnQ1zPmCr8cAlTcfwHTQxTDMUz8s8itwv0GhVgQZDdivCW6CwYjXLslZvO1QDdm2jOZuPCA+SL5k4nQYJjhrcp9kbmUDzaxRDEP4KX2r92WWKEzBvjiDB5KNe49PRQraB7oB6nx59HFCowEg1Pq54oi/XKLOCUzbQWyMy+b5E9wb8W9rS7SQoBS7NljGkUhYqTwoLxlkcLfJHlJ+coT1ZW8oWXXYv+7pRu81ToU6C7l9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756496631; c=relaxed/relaxed;
	bh=8wMy7c8XFLsQO25qt7MjRe2BU8kSRhCs7nJDMV8dQQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2I/Au/PNmtv3d/51HKDWKaFBblpQ3NdjLVLoJUrJhXdW96qkSN9pHq+3mM21KdAnZPMd2AwHXpA2VuAaBkNsfSe8bpFqaZUEK+Fxx7xofZeeTlT4TnUAKUEFVg9awSknaU4hxVKAu0DIj7+43TtSAb/ojHZY2uCiVDAd+a+dn7qXfuLvfhyj3WJYXl3IV6BuuvTtgzKLZTEn3W6g3ePb4/Wn8FOZav8D0cmHdIThX23A3khYdZMDdNu49nOeV8x1ITDvum+rNGjSUo5Z5EEUaVv2cF250FAVr4Npsl3Nq+Ip21B5YUQgWldJcSdOcs5IzOkwakrUvLyiaY19idxrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=irDD9VHL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=irDD9VHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD7xL3mDfz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:43:50 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJHIdi021112;
	Fri, 29 Aug 2025 19:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8wMy7c
	8XFLsQO25qt7MjRe2BU8kSRhCs7nJDMV8dQQY=; b=irDD9VHLTQ6pANoTwAwZyN
	lIzcyAIOz/0TwdysHlVxKeJk4lmaEOpYFw/oaNHv/+uT/FOoUSKmO8pWvkEUqzfE
	ifvU0WfDvVDlPTJkbtJEJ0zVlPkUq4K5T0aLzAElFH2J5daGMfKrk31W7jwrIgEi
	7jUNxThlIz7gLtP94ymUqEKasRi80Bs8O7I4qAxYEpwziusvzt996OuF5iEqxTx5
	dqayf4d0QSY2/A0/wWmR8tlryUTniNQlkR4EOYn3cuUDzrzCRoZibwDNq3m8jGRs
	VuuFbAykVrhVPzB56J9BHuNw8Q3XuF1BB2pxJeaj9pvzz5tHGSCMH/spAWv1ytrg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rwcg83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:43:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJgYfR003061;
	Fri, 29 Aug 2025 19:43:41 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rwcg7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:43:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGXPIC002571;
	Fri, 29 Aug 2025 19:43:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mu6p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:43:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJhb4P9766022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:43:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E982E58059;
	Fri, 29 Aug 2025 19:43:36 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45C7858055;
	Fri, 29 Aug 2025 19:43:36 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:43:36 +0000 (GMT)
Message-ID: <e0988cca-a3f8-4175-8b05-2a90a1be7c83@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:43:35 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] powerpc/pseries: Define HVPIPE specific macros
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-3-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-3-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Rv7J1qw2WeB95soUcuu_uIwnbLozZfWa
X-Authority-Analysis: v=2.4 cv=fbCty1QF c=1 sm=1 tr=0 ts=68b202ed cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=4LDfavS-C2xW_u8FiZcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lfRpbh6oZXR_85dFYYZgRJ8K9xOOcUgl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA1NSBTYWx0ZWRfX5Y0fgJlTrTqQ
 x89j7Q/cx2BOxsh5fMzeNlDCin6wPFsrcPxIJTgZovLNEIfrKWp0y+lIOP0nN+Xq3O7lFf7aQAI
 LsfcMDyiZig4Yaaj8s1ClSt2HfzqB8bgNPDuPndTwkRsTjv9KF2fHCNNhn5yT/qJPDCENsvMxs2
 4Vkh1+TR0J9Dxh9Pf/pzhfpNS+KaoOmWB+Cbgz4qEJ+dduf/JQzkPar6QfDMtz+z3Bjtoa7dOyx
 kTfO69FVsQN0mXmhnYuL7JKlCCEgdVk0bBGlD5NJoK3dQMsVDPaee9dVvo5AVqA8h+7cZr9smq+
 EKSEmi5yA/i7BGJxa1pPoQ/d7MdrFqquNoX5BA+/RY/6gCKqIZdyiTaBogOg0OTIbYZ365SDJDg
 9GuscpAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
> Define HVPIPE specific macros which are needed to support
> ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg RTAS calls
> and used to handle HVPIPE message events.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

