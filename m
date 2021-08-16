Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C13ED20E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 12:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp9XS1JgJz3cV2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 20:35:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XSiURWvh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XSiURWvh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp9Wj1HxRz30K7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 20:34:24 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GAWqTO088486; Mon, 16 Aug 2021 06:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=5av6NHoF+9D8KsZzLIfgybg2fcuVJ3/w9uvWlIZ0S8E=;
 b=XSiURWvhMUM8bUl7ohQj/FuEneCHvAhrCp1nzc2YA9I+Y4Evl5eiOlifEEGAGtgIJ/Nk
 D/3yFRlyNIkfcXbWnV24eofq/qJH7O8c/uHruBOX7BeHGvgL3AQC6q9NGQJR2hGLGuau
 ad0cGLYu+Hg1xmf6wxwYGxtEdp+3oMUTHd4+GpUwIeDwDPQFTzVSniQgvL6A5pTFlfu+
 2+4HdYXbH6j9KBHnckVlARx1SdJ+q+qdmVJw6SBoJa7NN4XAZY7fPJYfPZ1dR0XMlvqt
 bRR+A9D7oNutrrcsGVauWndn2vM0kQXTxz9ap7anskp6JHD6ol7ph1ZHGbk95QXNUsUm Pw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aetwauads-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 06:33:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17GABxX5025816;
 Mon, 16 Aug 2021 10:33:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ae5f8b1v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 10:33:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17GAXpDG56820028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 10:33:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73CC4A407B;
 Mon, 16 Aug 2021 10:33:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE56EA4065;
 Mon, 16 Aug 2021 10:33:47 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 16 Aug 2021 10:33:47 +0000 (GMT)
Date: Mon, 16 Aug 2021 16:03:47 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 1/2] sched/topology: Skip updating masks for
 non-online nodes
Message-ID: <20210816103347.GC21942@linux.vnet.ibm.com>
References: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
 <20210701041552.112072-2-srikar@linux.vnet.ibm.com>
 <875yxu85wi.mognet@arm.com>
 <20210712124856.GA3836887@linux.vnet.ibm.com>
 <87zguqmay9.mognet@arm.com>
 <20210723143914.GI3836887@linux.vnet.ibm.com>
 <87h7g09bgg.mognet@arm.com>
 <20210809065235.GH4072958@linux.vnet.ibm.com>
 <875yweaig9.mognet@arm.com>
 <20210810114727.GB21942@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210810114727.GB21942@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lc-xZ-bSsq-whyxuvFTxQWN5R-J4ehy4
X-Proofpoint-ORIG-GUID: lc-xZ-bSsq-whyxuvFTxQWN5R-J4ehy4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_03:2021-08-16,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160065
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> 
> Your version is much much better than mine.
> And I have verified that it works as expected.
> 
> 

Hey Peter/Valentin

Are we waiting for any more feedback/testing for this?


-- 
Thanks and Regards
Srikar Dronamraju
