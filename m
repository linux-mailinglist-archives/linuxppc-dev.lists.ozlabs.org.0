Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B8D47F3D3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 17:27:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLq8M2QS0z3cB0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 03:27:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bu6sJrVd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bu6sJrVd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLq7X2qlmz2yp5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 03:26:31 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BPFbYVI007744; 
 Sat, 25 Dec 2021 16:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=VMq+orNvVrYzmkq8guGGYpWmBSvGM4QTihzK/n+8Nws=;
 b=bu6sJrVd6ld2DWxDDjHBvx0dsuDz1uZdLP6LejUVknyiOidJHvtW2IlUTCiGAm239iBb
 bbPyIjvuyHoO5N7p0Y9vbm7pNX/CPZ50qo1BUhGJwnMfmCt0gkRxePcAv6wUpq1PLQYh
 6U5c2JNv+QOtJFwUhNE+3ee5Xt3jDP1SYsbnKNBjHZPPsOX84FsFTUlhlK1H/Cf1j6jj
 XqQI7ClUiwMObh3Cfchv0nguWTUT6E11d124eSOlJ6UviIRCLQdx5HrUW53U41n1OKRj
 WQQ5KeddfveRCRdrqs0dGaOF89dnVqgxAGEezFatPdg4alK15JvkANGyFQtEAcSAqJSz dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d64ugh4vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Dec 2021 16:25:54 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BPGPf7P008499;
 Sat, 25 Dec 2021 16:25:54 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d64ugh4va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Dec 2021 16:25:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BPGKU9m001117;
 Sat, 25 Dec 2021 16:25:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3d5tjj25jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Dec 2021 16:25:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BPGPniJ46924238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Dec 2021 16:25:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2C0B11C04A;
 Sat, 25 Dec 2021 16:25:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA26211C04C;
 Sat, 25 Dec 2021 16:25:48 +0000 (GMT)
Received: from osiris (unknown [9.145.52.227])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 25 Dec 2021 16:25:48 +0000 (GMT)
Date: Sat, 25 Dec 2021 17:25:47 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: guoren@kernel.org
Subject: Re: [PATCH V2 5/8] sched: s390: Remove unused TASK_SIZE_OF
Message-ID: <YcdGC4ZNejSgZgRG@osiris>
References: <20211225045430.2868608-1-guoren@kernel.org>
 <20211225045430.2868608-6-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211225045430.2868608-6-guoren@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -atRMtwxqSfN1mZI4uRDUeADm09Mlt3_
X-Proofpoint-ORIG-GUID: nmg8Ty_J-4NM8K4-4F2UN7I-J9MfO6Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-25_03,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112250080
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
Cc: juri.lelli@redhat.com, linux-s390@vger.kernel.org, x86@kernel.org,
 arnd@arndb.de, peterz@infradead.org, linuxppc-dev@lists.ozlabs.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 inux-parisc@vger.kernel.org, mingo@redhat.com, sparclinux@vger.kernel.or,
 tglx@linutronix.de, linux-mips@vger.kernel.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 25, 2021 at 12:54:27PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This macro isn't used in Linux sched, now. Delete in
> include/linux/sched.h and arch's include/asm.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/s390/include/asm/processor.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I could pick this up for s390, however sender (From: field) of this patch
series does not match From: and Signed-off-by: fields above.

In general I don't pick up such patches, since this doesn't match the
"Developer's Certificate of Origin" requirements.
-> Documentation/process/submitting-patches.rst
