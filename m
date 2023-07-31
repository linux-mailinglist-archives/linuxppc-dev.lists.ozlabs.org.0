Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C776974F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 15:16:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RzBUVYCh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDzKZ02w7z3bNn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 23:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RzBUVYCh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDzJc3BSDz2yVW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 23:16:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VDEJQg008557;
	Mon, 31 Jul 2023 13:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=cgz4lER01s4CqhxBwJ+2k0lBscj966ziYDeiWCZ3mYE=;
 b=RzBUVYChQLQA1dzqedluLcV4Csy4Sj/9xfgAKPkWFLrhzkSe4zmu/9hJ63f+W1PUmqI6
 rCkwue8k3rXW/hOaxbg+Q03lev0RNEd5NvWAWNOmfJLVB0lqnV6GO2t3TvAvckDG7ttm
 647y41x2edB58dsSaRy4MBKpBZJUxnJO/2PskirMpRQZwRgKtc+iwkoRf00osQK3pGJr
 I7tuSpkNHnEKz5KONZ4/Qz6lObPHlXhi5trYP+8sfHTCl74lxCq3eyhUmTtmCOEKiGEF
 R0lYM7VPJA29aE4d/BcfdB7RAE1UD/iJGECz00oDnG6jxQL88ClpjfokgYWGzKERSi+i 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6dnmr2mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 13:15:50 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36VDErKQ010847;
	Mon, 31 Jul 2023 13:15:49 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6dnmr2h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 13:15:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VD3OAa017005;
	Mon, 31 Jul 2023 13:15:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5dfxugy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 13:15:45 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36VDFiQg24838758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Jul 2023 13:15:45 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF3BD58061;
	Mon, 31 Jul 2023 13:15:44 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96D005805A;
	Mon, 31 Jul 2023 13:15:44 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.53.90])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with SMTP;
	Mon, 31 Jul 2023 13:15:44 +0000 (GMT)
Received: from arbab-laptop.ghola.net (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 90E6C175CCE;
	Mon, 31 Jul 2023 08:15:43 -0500 (CDT)
Date: Mon, 31 Jul 2023 08:15:32 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc/mm: Cleanup memory block size probing
Message-ID: <1929ee9a-f038-44e0-8a32-c77e9125f59b@arbab-laptop>
References: <20230728103556.745681-1-aneesh.kumar@linux.ibm.com>
 <f38660ab-89ed-44f5-ac7e-34c89a3e66d1@arbab-laptop>
 <e8eb6d6b-fffb-2f8c-b236-ae9578837084@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e8eb6d6b-fffb-2f8c-b236-ae9578837084@linux.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G8k4d8OQ_OwBT8g-LR1wX3cLmyQU9Weq
X-Proofpoint-GUID: oETb98cJVrww81SmspaRnbuhNpYuvrSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_06,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=879 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310117
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

On Sat, Jul 29, 2023 at 08:58:57PM +0530, Aneesh Kumar K V wrote:
>Thanks for correcting the right device tree node and testing the 
>changes. Can I add
>
>Co-authored-by: Reza Arbab <arbab@linux.ibm.com>

Sure, that's fine.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

-- 
Reza Arbab
