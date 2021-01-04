Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4F2E9FEB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 23:22:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8qqm1cpFzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 09:22:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DGOZNvc+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8qmv0221zDqRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 09:19:42 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104M1hkZ090494; Mon, 4 Jan 2021 17:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YLZTq6zQr85wZXbJGTTCuDTBM//57T3a89Mn2kdJpXY=;
 b=DGOZNvc+9WF+nykk27UT9adptFlfO/2E/cOaLp3BTQla2FNso7BEk4G6x3CDoYVxtkJ0
 YrX+ZTHOdnVmgcnUcejTVFvudGfzX3RrDPxgCbzaQG6gTLSLO4nhfZPBJUiXCtgF2lc6
 apgBUw15+nTQOJCZa+KWNMsrbL8A+5aorMg2vFNRsLV5VRUC8XXgECbcT3BiM0BBeyuK
 FYLmdeao8aHkU5A/CX0eRyuJxJD0AAt0pwo+Za5XW4BG/n4M8jT78dE6CMMKGV4qfl9T
 mqnx8m81X++iKCtwRpilAwYibtNwQ0Ii4yGkyGO3YIvSphYISAUhuLB+QYV55bZuDm1+ Zg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35vb5s0r5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 17:19:39 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104MHgx4002800;
 Mon, 4 Jan 2021 22:19:38 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 35tgf95nnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 22:19:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104MJb6f22937978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 22:19:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 413BC6A047;
 Mon,  4 Jan 2021 22:19:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4EA16A04F;
 Mon,  4 Jan 2021 22:19:35 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.78.58])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jan 2021 22:19:35 +0000 (GMT)
Subject: Re: [PATCH 4/5 v2] ibmvfc: relax locking around ibmvfc_queuecommand
To: james.bottomley@hansenpartnership.com
References: <20201218231916.279833-5-tyreld@linux.ibm.com>
 <20210104221758.981302-1-tyreld@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <bdcabd9f-ba27-18bf-eaa4-8570841f8e86@linux.ibm.com>
Date: Mon, 4 Jan 2021 14:19:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210104221758.981302-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_14:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=858
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101040130
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/4/21 2:17 PM, Tyrel Datwyler wrote:
> The drivers queuecommand routine is still wrapped to hold the host lock
> for the duration of the call. This will become problematic when moving
> to multiple queues due to the lock contention preventing asynchronous
> submissions to mulitple queues. There is no real legatimate reason to
> hold the host lock, and previous patches have insured proper protection
> of moving ibmvfc_event objects between free and sent lists.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
> ---

Ignore. This is the wrong updated patch.

-Tyrel
