Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A841AC35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 11:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJZQz4qRCz2ysq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BZ4JNvn9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BZ4JNvn9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJZQ55wB9z2xWf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 19:46:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S92L9H031199; 
 Tue, 28 Sep 2021 05:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=3DsR5c/GhBC+HPUC8iMMbpqFD4ZdEbdKblwLfMGSR4Y=;
 b=BZ4JNvn9PeFiqqocrpfyECcEDZZf2yQiK39l+nDgheSRTk6BsH0UQ6Jecis+0usqjOBU
 /TjhzdnIW4wlSO9uh/T7QVKxz9ggvfhBwUICAmzXTUBc+7NjKPL1oq9EK2CAKHBQvnuJ
 hVh1fvUZudeMdNEnc8JpfXtS9lKqgF3WkwkIq7cHqfq3R4KhUCXGzCd/DDHXogsdTgjK
 ZdO4c/219NPdqeCOKsO+WRKuciFWA5VHw1cM1J0umb3hk0x/vVQtfLUAjDNCYnQGxNnc
 /yAOL1UHY6KQHVkQKftFJdSRzIeB8BNMOMuztel8Ux2CmAPcC669pMw5qGdgM6lt6+5z Lw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bbwqsc3kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 05:45:56 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18S9XKQ4001601;
 Tue, 28 Sep 2021 09:45:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3b9ud9m8xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 09:45:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18S9jqjA41222432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 09:45:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EC4A11C050;
 Tue, 28 Sep 2021 09:45:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9DA111C069;
 Tue, 28 Sep 2021 09:45:51 +0000 (GMT)
Received: from osiris (unknown [9.145.163.77])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 28 Sep 2021 09:45:51 +0000 (GMT)
Date: Tue, 28 Sep 2021 11:45:50 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 4/4] s390: Use generic version of
 arch_is_kernel_initmem_freed()
Message-ID: <YVLkTjJGuYUVCGcH@osiris>
References: <ffa99e8e91e756b081427b27e408f275b7d43df7.1632813331.git.christophe.leroy@csgroup.eu>
 <d4a15dc0e699e6a60858bff4d183a9b1aea90433.1632813331.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4a15dc0e699e6a60858bff4d183a9b1aea90433.1632813331.git.christophe.leroy@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PEs0TgwxAhp9H1XCjrnPlWAkKJhdamFa
X-Proofpoint-GUID: PEs0TgwxAhp9H1XCjrnPlWAkKJhdamFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280056
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 28, 2021 at 09:15:37AM +0200, Christophe Leroy wrote:
> Generic version of arch_is_kernel_initmem_freed() now does the same
> as s390 version.
> 
> Remove the s390 version.
> 
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: No change
> ---
>  arch/s390/include/asm/sections.h | 12 ------------
>  arch/s390/mm/init.c              |  3 ---
>  2 files changed, 15 deletions(-)

Looks good. Thanks for cleaning this up!

Acked-by: Heiko Carstens <hca@linux.ibm.com>
