Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AC76B6F30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 06:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZlrD3wSyz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 16:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pdrPPCIJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pdrPPCIJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZlqG0gjCz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 16:40:09 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32D41USO028145;
	Mon, 13 Mar 2023 05:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=CEMEn5xU/hcip4qcQk+HObQQfXCrf8JlegGfm/tEbjU=;
 b=pdrPPCIJPjWbzKLb3W2d5LlnAtFdTB3Y9z71JYBB4C+SsgzAv3PlW6+F4kpMFTNuiZqW
 4+7FQLdAuMByMSM2dr0yTkJXZfBHGeIWL6qOB403thT1GxnPwlLnRLd09MIx6F88bJBm
 Vukn3iY1e6yUcBqTdebzWEIbmINiu1PqU5+3nkmOnMmkps3SlCuyymvMrAVV2UhZNQ9V
 ep/jDJbtIhXm72rA+WEwfmcfXTCSvtJo9WHFHbogm3P9BdxA7Qf2U50pyD5eP5MR5lTO
 jmdzC6A2vyPCSfrU5h3AV4Hoi4eG0hO2Zg/MAIyiTUX3L0ue1wNTQHoyiYfdIUw3T8+k Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p933kbqsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 05:39:58 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32D5BlJR006720;
	Mon, 13 Mar 2023 05:39:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p933kbqs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 05:39:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32D28A5e001023;
	Mon, 13 Mar 2023 05:39:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96ju1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 05:39:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32D5dpsg2556634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 05:39:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA20420049;
	Mon, 13 Mar 2023 05:39:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D13F20043;
	Mon, 13 Mar 2023 05:39:49 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.10.87])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 13 Mar 2023 05:39:48 +0000 (GMT)
Date: Mon, 13 Mar 2023 11:09:46 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 0/2] Improving calls to kvmppc_hv_entry
Message-ID: <ZA63IhDoObdIKwTj@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7EBhg-JkqRb8WKmJMI97J5hvoBu0oI1J
X-Proofpoint-ORIG-GUID: xL5rn295wxARhyAEdxquoS8bQg_tuk1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=772 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130044
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi everyone,

Anyone interested in reviewing this small patch-set ?
I tested it on P8 and it works fine.

Thanks.

On 2023-03-06 07:37:38, Kautuk Consul wrote:
> - remove .global scope of kvmppc_hv_entry
> - remove r4 argument to kvmppc_hv_entry as it is not required
> 
> Changes since v1:
> - replaced .global by SYM_INNER_LABEL for kvmpcc_hv_entry
> 
> Kautuk Consul (2):
>   arch/powerpc/kvm: kvmppc_hv_entry: remove .global scope
>   arch/powerpc/kvm: kvmppc_hv_entry: remove r4 argument
> 
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> -- 
> 2.36.1
> 
