Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E36B03FBB37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 19:49:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyyWP55Jrz2yfb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 03:49:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6ZSTmQY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drc@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h6ZSTmQY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyyVc3F3kz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 03:48:56 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17UHiaxV149432
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 13:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Jiqr1ABepFlp4sZSXyl9sCisA0q2/dGfA2xrF4Iccsk=;
 b=h6ZSTmQYqBs83p5PQeOi3Nw6EsWSWcIeR3FqIf32bvOVvmLQPqp/yZC8ZKIR19CyU89Y
 58IzW01mw7xPuAJ6i3AeMoawL3osbIKZNr6TtuDEushUOkBua3j69ICj9eS0jGXD4tqq
 4Dh61rnfGTUyIKrsAjdwPPIU92V/mHwfzBLgdA56sZ/hrcqrpYauMeS+1af8i7x6otXE
 iroSz/SBklETakNNBtdceuYE1C89g4UC9qyAkIJhmK5k4v84EAv+ttWuguxPS8teHw1i
 0m6TfSMVOQ5NV+VNmfCBygkVnF8jFrWzpWSi9FDK0/I8z+NtkORDlL9WyL7nxLV3RcIu MA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3as408030p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 13:48:52 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17UHlSMv007110
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:48:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3aqcsb7h2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:48:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17UHmoK339649788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:48:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 490157806B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:48:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CC0578060
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:48:50 +0000 (GMT)
Received: from Davids-MBP.randomparity.org (unknown [9.211.151.69])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:48:49 +0000 (GMT)
Subject: Re: [PATCH v6 00/11] DDW + Indirect Mapping
To: linuxppc-dev@lists.ozlabs.org
References: <20210817063929.38701-1-leobras.c@gmail.com>
From: David Christensen <drc@linux.vnet.ibm.com>
Message-ID: <82ca56ab-6a0a-7cbb-a5e7-facc40f35c3c@linux.vnet.ibm.com>
Date: Mon, 30 Aug 2021 10:48:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817063929.38701-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KpGbHsmxrsmxxEJeo3t6ZvtFvOaXhhu2
X-Proofpoint-ORIG-GUID: KpGbHsmxrsmxxEJeo3t6ZvtFvOaXhhu2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-30_06:2021-08-30,
 2021-08-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108300118
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/16/21 11:39 PM, Leonardo Bras wrote:
> So far it's assumed possible to map the guest RAM 1:1 to the bus, which
> works with a small number of devices. SRIOV changes it as the user can
> configure hundreds VFs and since phyp preallocates TCEs and does not
> allow IOMMU pages bigger than 64K, it has to limit the number of TCEs
> per a PE to limit waste of physical pages.
> 
> As of today, if the assumed direct mapping is not possible, DDW creation
> is skipped and the default DMA window "ibm,dma-window" is used instead.
> 
> Using the DDW instead of the default DMA window may allow to expand the
> amount of memory that can be DMA-mapped, given the number of pages (TCEs)
> may stay the same (or increase) and the default DMA window offers only
> 4k-pages while DDW may offer larger pages (4k, 64k, 16M ...).

So if I'm reading this correctly, VFIO applications requiring hugepage 
DMA mappings (e.g. 16M or 2GB) can be supported on an LPAR or DLPAR 
after this change, is that correct?  Any limitations based on processor 
or pHyp revision levels?

Dave
