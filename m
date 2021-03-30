Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE41334F1E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 21:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F90cT5DSjz3byv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:58:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oQeogxHY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oQeogxHY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F90bz4QZsz3bqB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 06:57:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12UJX5ek016290; Tue, 30 Mar 2021 15:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6IqT/F0FTJ2iGUyaClmPnMp75/kt7FoSv5T279WRprA=;
 b=oQeogxHYxGvVonbvERwtMpHaT+RxY94ViQFI2LmtcOo8lMA14X+Pj/N9HWlwerHtX0m5
 +gX8x7MnEya4DBI+U34QBWY633dP4jtNyw5oRq+mvyFSJkp3E290hH+L7RB7K/ZEbSUe
 lUa4T1xbQC7NvXkSiURL+DxxWEotoQivKjw7MK1IWDjuugMzL8yT1SlvJoK3BMPDx42v
 +Vl+uLzjcrSskAA49FiHtjGY4FrqE43ZGoBpq1+r3vedxWUTSHvkyo+LmsOqXbK13NJR
 j1qAldYxHyvgDVB2jslMEnrRihLtyNsxRyMyOrHebZ9NIJTLbocpgxiTHWtTYPQWkYxZ Fw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhsc4352-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 15:57:42 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12UJpswI030779;
 Tue, 30 Mar 2021 19:57:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 37maarr2n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 19:57:40 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12UJvdaE31261074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 19:57:40 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D83DB136055;
 Tue, 30 Mar 2021 19:57:39 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 239E313604F;
 Tue, 30 Mar 2021 19:57:39 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.18.249])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 19:57:38 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Only register vio drivers if vio bus
 exists
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210316010938.525657-1-mpe@ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <75f4c719-1fd2-15f7-7aeb-2f740df8ec46@linux.ibm.com>
Date: Tue, 30 Mar 2021 12:57:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316010938.525657-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9DLH6Y_EZVAafMvx5e--XGKcBLBoZfJ0
X-Proofpoint-GUID: 9DLH6Y_EZVAafMvx5e--XGKcBLBoZfJ0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_09:2021-03-30,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1011 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300141
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
Cc: pmenzel@molgen.mpg.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/15/21 6:09 PM, Michael Ellerman wrote:
> The vio bus is a fake bus, which we use on pseries LPARs (guests) to
> discover devices provided by the hypervisor. There's no need or sense
> in creating the vio bus on bare metal systems.
> 
> Which is why commit 4336b9337824 ("powerpc/pseries: Make vio and
> ibmebus initcalls pseries specific") made the initialisation of the
> vio bus only happen in LPARs.
> 
> However as a result of that commit we now see errors at boot on bare
> metal systems:
> 
>   Driver 'hvc_console' was unable to register with bus_type 'vio' because the bus was not initialized.
>   Driver 'tpm_ibmvtpm' was unable to register with bus_type 'vio' because the bus was not initialized.
> 
> This happens because those drivers are built-in, and are calling
> vio_register_driver(). It in turn calls driver_register() with a
> reference to vio_bus_type, but we haven't registered vio_bus_type with
> the driver core.
> 
> Fix it by also guarding vio_register_driver() with a check to see if
> we are on pseries.
> 
> Fixes: 4336b9337824 ("powerpc/pseries: Make vio and ibmebus initcalls pseries specific")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
