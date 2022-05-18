Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2E252B9C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 14:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3ByH68rFz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 22:24:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=es5ptC8z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tuliom@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=es5ptC8z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3BxX6xMXz2ypZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 22:24:16 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IBJEcb005946
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 12:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=G/odLJ23hD3/8IVq0idttXfrcuu0RszR+ilhjTBwjek=;
 b=es5ptC8z4AuhqQbI0cadCKU6yVNdSBBXdThA0dHyY7dfO7p9/QhWF3bRmj7HDZ3NU+Cy
 TL9W+DhmbRR4BWRKgiW1Ca2HCxiCfWSdjwl702FbeGZQbKGoEz/a5RTijl7hldGJ7UBk
 xB7BT572aL4u7GM6EvTDe83EgNOZeMwtP81Ymwb9rCC8Bu2rvPuEN801Zi1AQ7kLRVzB
 xXj0K0dV2uZxELpE++lIozRcOZt18ZYObD3j2whbkq+WQPaDRxqGocBjp1M2SYuQiLrX
 Bacf0Qhh7SBiG63oqQf/lFV/P4IMbFI0Oxw6gJkzOvIWZfUTWuexGx5RGCOfylQNE5Ni gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4ytuhmwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 12:24:13 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24IBdknO019171
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 12:24:12 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4ytuhmw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 12:24:12 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24ICMdFQ007177;
 Wed, 18 May 2022 12:24:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3g4wp590vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 12:24:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24ICOAa625035162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 12:24:10 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D29A1AE068;
 Wed, 18 May 2022 12:24:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83623AE05C;
 Wed, 18 May 2022 12:24:10 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.160.104.70])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 12:24:10 +0000 (GMT)
From: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/signal: Report minimum signal frame size to
 userspace via AT_MINSIGSTKSZ
In-Reply-To: <20220307182734.289289-2-npiggin@gmail.com>
References: <20220307182734.289289-1-npiggin@gmail.com>
 <20220307182734.289289-2-npiggin@gmail.com>
User-Agent: Notmuch/0.35 (http://notmuchmail.org) Emacs/27.2
 (x86_64-redhat-linux-gnu)
Date: Wed, 18 May 2022 09:24:09 -0300
Message-ID: <87k0ajav12.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jX-zmZTbuUcnLnx09oqsJ-gHaO8bxQ-e
X-Proofpoint-GUID: DcPzm5IOmjSqPNsM0Pk8GcRtzxc6S49V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_04,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180069
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Implement the AT_MINSIGSTKSZ AUXV entry, allowing userspace to
> dynamically size stack allocations in a manner forward-compatible with
> new processor state saved in the signal frame
>
> For now these statically find the maximum signal frame size rather than
> doing any runtime testing of features to minimise the size.
>
> glibc 2.34 will take advantage of this, as will applications that use
> use _SC_MINSIGSTKSZ and _SC_SIGSTKSZ.
>
> Cc: Alan Modra <amodra@gmail.com>
> Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
> References: 94b07c1f8c39 ("arm64: signal: Report signal frame size to userspace via auxv")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Both patches LGTM from a glibc point of view.

Reviewed-by: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>

Thanks!

-- 
Tulio Magno
