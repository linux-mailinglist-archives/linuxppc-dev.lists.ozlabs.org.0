Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDBB41DB24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 15:34:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKvNH6qQVz3bnJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 23:34:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PYvbNVQh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PYvbNVQh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKvMV031Sz2ypC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 23:33:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UDUFkT024771; 
 Thu, 30 Sep 2021 09:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : content-transfer-encoding : mime-version; s=pp1;
 bh=Tu/modTFmFZ8Np2c9M/1+Y6iDjmd5UhBDpIKF73H74I=;
 b=PYvbNVQhrpOgQ8RxRxsnVrL0hauH6hqAmRHT77iEe7++V4TUnH1mLPaAWiipZApMD/eA
 qjG8x2yX8myn2M/HyoIFZf823XNzBogSrjOivfTSxcNS7qImI7FasrfbHPV/79YpJ2Ez
 9+weR56Yr/QWYYiZExLRv17bLzmShaf4UWA77FovyTNpfIAzwiQL1zxe/LwjskfPbBTX
 KI5nSm2AZk4UZdoyNxX/KteCV7Arw6ZgSTRPDPgYfv9xyXsT8bTQ+a43Gf2A1nX9Mv2o
 W2UAKLnhDXb/xM14fgSQADkVysMx2LqhzBk65bSUdS2q91TCPeeEvG6dNvrknIliEbtk 7Q== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bde6382e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 09:33:14 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18UDDQA4032276;
 Thu, 30 Sep 2021 13:33:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3b9uda19hn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 13:33:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18UDX9b87537222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 13:33:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F40DC4C050;
 Thu, 30 Sep 2021 13:33:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 285B84C044;
 Thu, 30 Sep 2021 13:33:07 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.39.107])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Sep 2021 13:33:06 +0000 (GMT)
Date: Thu, 30 Sep 2021 19:02:57 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/pseries/msi: Add an empty irq_write_msi_msg()
 handler
Message-ID: <20210930133257.iw7eu5wwyh2nv6h7@in.ibm.com>
References: <20210930102535.1047230-1-clg@kaod.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210930102535.1047230-1-clg@kaod.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H1hNZdJ3An31HiOhYvv975M13xaWgNeq
X-Proofpoint-GUID: H1hNZdJ3An31HiOhYvv975M13xaWgNeq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_04,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109300085
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
Reply-To: mahesh@linux.ibm.com
Cc: Brian King <brking@linux.vnet.ibm.com>,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Douglas Miller <dougmill@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-09-30 12:25:35 Thu, Cédric Le Goater wrote:
> The IPR drivers tests for MSI support at probe time with MSI vector 0
> and when done, frees the IRQ with free_irq(). This test was introduced
> by 95fecd90397e ("ipr: add test for MSI interrupt support") as an
> improvement of commit 5a9ef25b14d3 ("[SCSI] ipr: add MSI support")
> because a boot failure was reported on a Bimini PowerPC system :
> 
>   https://x-lore.kernel.org/all/1242926159.3007.5.camel@localhost.localdomain/
> 
> It was finally decided to remove MSI support on Bimini systems in
> 6eb0ac03899a ("powerpc/maple: Add a quirk to disable MSI for IPR on
> Bimini").
> 
> Linux 5.15-rc1 added MSI domain support to the pseries machine and
> when free_irq is called() in the driver, msi_domain_deactivate() also
> is. This resets the MSI table entry of the associate vector by calling
> __pci_write_msi_msg() with an empty message and breaks any further
> activation of the same vector. In the case of the IPR driver, it
> breaks the initialization sequence of the IOA.
> 
> Introduce an empty irq_write_msi_msg() handler in the MSI domain of
> the pseries machine to avoid clearing the MSI vector entry. Updating
> the entry is not strictly necessary since it is initialized by the
> underlying hypervisor, PowerVM or QEMU/KVM.
> 
> Cc: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> Cc: Douglas Miller <dougmill@linux.vnet.ibm.com>
> Cc: Brian King <brking@linux.vnet.ibm.com>
> Fixes: a5f3d2c17b07 ("powerpc/pseries/pci: Add MSI domains")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Tested-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

This fixes the issue reported at
https://lore.kernel.org/linuxppc-dev/65f0085f-c6a9-e3ea-4d60-fcf09b7c7360@linux.vnet.ibm.com/T/#u
by Abdul.

Thanks,
-- 
Mahesh J Salgaonkar
