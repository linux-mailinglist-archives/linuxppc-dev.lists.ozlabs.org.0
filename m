Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F052570B686
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 09:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPpwQ5fN4z3f6T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 17:28:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPeseFRf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DPeseFRf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPpvY0czTz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 17:28:08 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34M7MeZB009414;
	Mon, 22 May 2023 07:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=AnqxjNrLS0dAvtQKq0+VbLFXh7qayS/jEJTCPB5vCps=;
 b=DPeseFRfTRT+4GuPQY525fqQET+mKjjIWk7EnXXvad9Q0Pch8rU8pONxi4dfmlpr3RZ+
 C+uYvMmf8a+adUVautFoMKYoMLv7TGSQJNXnS/chhI+TkP5lIgUoYLC8ZxolRYxFDTtn
 kVsaZT7kHLTzp6p525uJP4YRz4uF7QFwCUqmRXQIvUm4fsZ4T4aiQuRfQO1vtMxWGQXM
 lurEwbXIeD5CcJaDDe5w6pTmjSaKlnquxm8uHDdhjJ3AEMZ7EPLQ1p72Q2I+73c49SPb
 au7lpbKJBDxSjfCmVDrDlDBPW/yEgtrzaUTidUrFObJuJM1cGYv1kxbce+gJoAmk2Ueb +A== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qq7qjbdpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 07:28:03 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34M3tMT1008210;
	Mon, 22 May 2023 07:28:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qppcs8puj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 May 2023 07:28:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34M7Rwt140894986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 May 2023 07:27:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88F3F20043;
	Mon, 22 May 2023 07:27:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 568B720040;
	Mon, 22 May 2023 07:27:57 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 22 May 2023 07:27:57 +0000 (GMT)
Date: Mon, 22 May 2023 12:57:56 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
Message-ID: <20230522072756.GA416000@linux.vnet.ibm.com>
References: <20230504175913.83844-1-gbatra@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230504175913.83844-1-gbatra@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: atQdoVV6zCz23afYXyrm_uXcWLuhy_uC
X-Proofpoint-GUID: atQdoVV6zCz23afYXyrm_uXcWLuhy_uC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=842 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220059
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gaurav Batra <gbatra@linux.vnet.ibm.com> [2023-05-04 12:59:13]:

> When DMA window is backed by 2MB TCEs, the DMA address for the mapped
> page should be the offset of the page relative to the 2MB TCE. The code
> was incorrectly setting the DMA address to the beginning of the TCE
> range.
> 
> Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
> ethernet port, when DMA window is backed by 2MB TCEs.
> 
> Fixes: 387273118714 ("powerps/pseries/dma: Add support for 2M IOMMU page size")
> 
> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
> 

Works with this patch.
Tested-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> Reviewed-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
> ---

-- 
Thanks and Regards
Srikar Dronamraju
