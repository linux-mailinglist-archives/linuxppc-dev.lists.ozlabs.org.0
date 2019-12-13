Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26311DD70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 06:10:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YzHm20BxzDrDl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 16:09:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YzFl1FB2zDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 16:08:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47YzFk0BRLz8tSg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 16:08:10 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47YzFj6k0Sz9sPL; Fri, 13 Dec 2019 16:08:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47YzFj0Xnhz9sNH
 for <linuxppc-dev@ozlabs.org>; Fri, 13 Dec 2019 16:08:08 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBD5833I126465
 for <linuxppc-dev@ozlabs.org>; Fri, 13 Dec 2019 00:08:04 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wusv0gakg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 13 Dec 2019 00:08:04 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 13 Dec 2019 05:08:01 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Dec 2019 05:07:58 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xBD57vMT34275596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Dec 2019 05:07:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD2DFAE055;
 Fri, 13 Dec 2019 05:07:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AE59AE045;
 Fri, 13 Dec 2019 05:07:56 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 13 Dec 2019 05:07:55 +0000 (GMT)
Date: Fri, 13 Dec 2019 10:37:55 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
References: <20191213035036.6913-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20191213035036.6913-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19121305-0012-0000-0000-000003745420
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121305-0013-0000-0000-000021B03268
Message-Id: <20191213050755.GA23839@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_08:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=942 bulkscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912130042
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
Cc: juri.lelli@redhat.com, ego@linux.vnet.ibm.com, pauld@redhat.com,
 parth@linux.ibm.com, Ihor.Pasichnyk@ibm.com, linuxppc-dev@ozlabs.org,
 longman@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2019-12-13 14:50:35]:

> Waiman Long suggested using static_keys.
> 
> Fixes: 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted vCPUs")
> Cc: stable@vger.kernel.org # v4.18+
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Tested-by: Juri Lelli <juri.lelli@redhat.com>
> Acked-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Acked-by: Phil Auld <pauld@redhat.com>
> Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Tested-by: Parth Shah <parth@linux.ibm.com>
> [mpe: Move the key and setting of the key to pseries/setup.c]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/spinlock.h    | 4 +++-
>  arch/powerpc/platforms/pseries/setup.c | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 

Tested with your version of the patch and its working as expected

Latency percentiles (usec)
        50.0th: 45
        75.0th: 63
        90.0th: 74
        95.0th: 78
        *99.0th: 82
        99.5th: 83
        99.9th: 86
        min=0, max=96
Latency percentiles (usec)
        50.0th: 46
        75.0th: 64
        90.0th: 75
        95.0th: 79
        *99.0th: 83
        99.5th: 85
        99.9th: 91
        min=0, max=117
Latency percentiles (usec)
        50.0th: 46
        75.0th: 64
        90.0th: 75
        95.0th: 79
        *99.0th: 83
        99.5th: 84
        99.9th: 90
        min=0, max=95
Latency percentiles (usec)
        50.0th: 47
        75.0th: 65
        90.0th: 75
        95.0th: 79
        *99.0th: 84
        99.5th: 85
        99.9th: 90
        min=0, max=117
Latency percentiles (usec)
        50.0th: 45
        75.0th: 64
        90.0th: 75
        95.0th: 79
        *99.0th: 82
        99.5th: 83
        99.9th: 93
        min=0, max=111


-- 
Thanks and Regards
Srikar Dronamraju

