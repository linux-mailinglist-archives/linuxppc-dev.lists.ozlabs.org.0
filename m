Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14032E090
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 05:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsDzG42fDz3d8V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 15:19:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9bM/RSQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U9bM/RSQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsDyq21zWz3bN7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 15:19:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12544YQY070061; Thu, 4 Mar 2021 23:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=LqR2TXEh97yGVBBSx0eCKJKZMDI0vptlzlcbTFPS2Ok=;
 b=U9bM/RSQOuR/W3wSSpRL2RUsq+KJZUFai882hWbPHFFogkKRfBaJ5ca4P+8EWDIDbDIw
 RPTR9JbFTkv3LlJTLIc4rj7Xekhx+iBkgwCUoU+h5Qe2cy7RftrUQS8qdAaxiGaQPTv3
 G5D0/U5rZKC7vABDOTxYpXsnDqGTOWcCBNKN+6YTuFRnbvl2LXMU3JmoQB0WEM312q/m
 WsJ+RtBmbUFSG/ojmKVSFxh36No2DdpouUVIvgcf3pgo82TfSBTRjVINYkexsmcE0Hbj
 s7F+rYcKw4VR+LFqRuthz42K451HbRJsfMjBZluCR/f29vlU8pPJCcr8yxpM2ijmzyUL OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373cth1c3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 23:19:16 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12544UYW069777;
 Thu, 4 Mar 2021 23:19:16 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373cth1c3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 23:19:16 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1254IJNf002810;
 Fri, 5 Mar 2021 04:19:15 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3720r0wquf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 04:19:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1254JE8i30343676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 04:19:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F573C6057;
 Fri,  5 Mar 2021 04:19:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20B18C605A;
 Fri,  5 Mar 2021 04:19:14 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.85.205.202])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 04:19:13 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id E820B2E282E; Thu,  4 Mar 2021 20:19:10 -0800 (PST)
Date: Thu, 4 Mar 2021 20:19:10 -0800
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: angkery <angkery@163.com>
Subject: Re: [PATCH] ibmvnic: remove excessive irqsave
Message-ID: <20210305041910.GA1396452@us.ibm.com>
References: <20210305014350.1460-1-angkery@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305014350.1460-1-angkery@163.com>
X-Operating-System: Linux 2.0.32 on an i486
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_03:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1011 mlxlogscore=860
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050018
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
Cc: Junlin Yang <yangjunlin@yulong.com>, linux-kernel@vger.kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, ljp@linux.ibm.com, drt@linux.ibm.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

angkery [angkery@163.com] wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> ibmvnic_remove locks multiple spinlocks while disabling interrupts:
> spin_lock_irqsave(&adapter->state_lock, flags);
> spin_lock_irqsave(&adapter->rwi_lock, flags);
> 
> there is no need for the second irqsave,since interrupts are disabled
> at that point, so remove the second irqsave:
> spin_lock_irqsave(&adapter->state_lock, flags);
> spin_lock(&adapter->rwi_lock);
> 
> Generated by: ./scripts/coccinelle/locks/flags.cocci
> ./drivers/net/ethernet/ibm/ibmvnic.c:5413:1-18:
> ERROR: nested lock+irqsave that reuses flags from line 5404.
> 

Thanks. Please add

Fixes: 4a41c421f367 ("ibmvnic: serialize access to work queue on remove")

> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
