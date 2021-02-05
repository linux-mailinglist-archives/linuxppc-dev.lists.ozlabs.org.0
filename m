Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69931117C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 20:48:50 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXQw00khyzDsXJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 06:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=efIhSjT6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXQt36gSLzDrCs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 06:47:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115JZH3g085671
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Feb 2021 14:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rFhR71Pdiuog2wRMCQTc0qq5W8IYr6TtZKqkMKEv6BU=;
 b=efIhSjT6IQMMj/ak2oOXcMW8dGPVTsw9v9pjTa4UIiRGX7YQgho10gTb47Yw+IGcNKkO
 5Ve2LyFzQ8b7wjSlDdCDZ0clFs1P1YiAWZzOnAWPfCUX7wYvCq9etpMI3qiHpghwFwfE
 UY4FtWMfUbD1lwJ0n48KI7T/7mVYHtauYsQTtK4FvDeZdJrlkgVDGexMvelNGOlZx8mQ
 VG6/X5F/Sox2+cpntrhfS2EkSQMRVv/N2GdHhtO8ZPMqoNoQKS1A90ZjLXmVrKx/TWlp
 EVfWdw9i9+3JzQDBVodSN0+70rtx7LCph/KZJXjpsSwP3lSnz2lQBCSAYxxs/oJZF31D QQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36hc4qrg96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 14:47:02 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115Jc5Y2007110
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Feb 2021 19:47:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 36f5t5t3wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 19:47:01 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115Jkxeu21889404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 19:46:59 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABF6F136059;
 Fri,  5 Feb 2021 19:46:59 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0767913604F;
 Fri,  5 Feb 2021 19:46:58 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.117.126])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 19:46:58 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/dlpar: handle ibm,configure-connector
 delay status
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210107025900.410369-1-nathanl@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <925c3f11-41e1-2f2a-3dd3-d6ce4907b4ef@linux.ibm.com>
Date: Fri, 5 Feb 2021 11:46:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107025900.410369-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_11:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102050120
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
Cc: brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/6/21 6:59 PM, Nathan Lynch wrote:
> dlpar_configure_connector() has two problems in its handling of
> ibm,configure-connector's return status:
> 
> 1. When the status is -2 (busy, call again), we call
>    ibm,configure-connector again immediately without checking whether
>    to schedule, which can result in monopolizing the CPU.
> 2. Extended delay status (9900..9905) goes completely unhandled,
>    causing the configuration to unnecessarily terminate.
> 
> Fix both of these issues by using rtas_busy_delay().
> 
> Fixes: ab519a011caa ("powerpc/pseries: Kernel DLPAR Infrastructure")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

