Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B034AB8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Qsr5RM7z3byL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:30:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tK8Wpo12;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tK8Wpo12; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6QsN1Znyz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:30:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QF3uiA037068; Fri, 26 Mar 2021 11:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=a/tG8wdaMnr7aiTJ6Yzla8EbBFp9CM4ZfTgvFFYJzfY=;
 b=tK8Wpo12AC77ugzUG58ytal2wq6TmWaUMg5qP5zWZElsu/Ia9gcB5kqeu2xL9yEf+CKT
 UDofX6F2xDOWkNNaxZTyJJxOwOuo7Q5Xvmi4bmWfzXJHt/A2Z2peFSQOPBbfjaalprAL
 DRp+DExvOjCCJGBCoklUOtk2VreDfm97bKYDFkF0jS3D4zP9wk3K3cxJgfXRkb5+zCae
 W8llv8yD170toM3uYw+XO6ScGMZJ1LBOFuqcVqlPQTq8cndf2GEaZWX0zBVn8rQRW1ef
 QMilaT9PYTMtoCwtETQhrAbPEpGrU/duxTx7JTFBke/Abx26d//erTonNQQR793LRESj 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h74vt11g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 11:30:28 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QF402s037419;
 Fri, 26 Mar 2021 11:30:28 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h74vt10m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 11:30:28 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QF8GnH007020;
 Fri, 26 Mar 2021 15:30:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 37h1510s7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:30:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QFUO0j44630442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 15:30:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B55811C05C;
 Fri, 26 Mar 2021 15:30:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B773B11C069;
 Fri, 26 Mar 2021 15:30:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 15:30:23 +0000 (GMT)
Received: from [9.206.172.36] (unknown [9.206.172.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 603BB605FD;
 Sat, 27 Mar 2021 02:30:21 +1100 (AEDT)
Subject: Re: [PATCH v3 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_offline()
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210326141954.236323-1-danielhb413@gmail.com>
 <20210326141954.236323-2-danielhb413@gmail.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <3155bcf5-26a5-b036-590f-02052eaacbf4@linux.ibm.com>
Date: Sat, 27 Mar 2021 02:30:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210326141954.236323-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lSENSehXJnqEJ29MXQxHQ_tHyaH3XlYS
X-Proofpoint-ORIG-GUID: x5_Z7kONBe6T5wtKEIApMB73kZfyXR2p
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_06:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260115
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/3/21 1:19 am, Daniel Henrique Barboza wrote:
> One of the reasons that dlpar_cpu_offline can fail is when attempting to
> offline the last online CPU of the kernel. This can be observed in a
> pseries QEMU guest that has hotplugged CPUs. If the user offlines all
> other CPUs of the guest, and a hotplugged CPU is now the last online
> CPU, trying to reclaim it will fail. See [1] for an example.
> 
> The current error message in this situation returns rc with -EBUSY and a
> generic explanation, e.g.:
> 
> pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9, rc: -16
> 
> EBUSY can be caused by other conditions, such as cpu_hotplug_disable
> being true. Throwing a more specific error message for this case,
> instead of just "Failed to offline CPU", makes it clearer that the error
> is in fact a known error situation instead of other generic/unknown
> cause.
> 
> This patch adds a 'last online' check in dlpar_cpu_offline() to catch
> the 'last online CPU' offline error, returning a more informative error
> message:
> 
> pseries-hotplug-cpu: Unable to remove last online CPU PowerPC,POWER9
> 
> [1] https://bugzilla.redhat.com/1911414
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Thanks for addressing the issues in Daniel's review.

I haven't tested it, but this patch looks sensible enough to me.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
