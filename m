Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E7867A017
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 18:24:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Yjy0XDcz3cDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 04:24:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+b2NRi0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+b2NRi0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Yj10dDtz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 04:23:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OFsCQZ027246;
	Tue, 24 Jan 2023 17:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=W5bIGzAak+pz1pXbgis9UD6iA18394lIzr2MPYJoHJY=;
 b=P+b2NRi0kSLP5Xyv3bwvBiU82AeD3sw4BTnO8G5ZEIJD2N8fKIIyR1QUngjgp8SxplIx
 mO8p+lM3RH8zWxs/kS656dkQQnb4D8FTnO1juPWp1MGCBZSPfj9OSSenPb2io5DdlYXt
 2iPxEX2QGMIVdqZLHNHh4zh5VTnyjqP1AXa2KN71LUrRAu4awf6VRmXn7KzbbWheTo54
 pXic2O0tj23coUk3w43XZNjbC4zjJEOVn//ik4klJ/rXilanMQVgSMx1inBbgetcqDjM
 x64nuKlSgc68/FgSu6X1Cm8q+5rfYHmRxEa7Ic6ItPRJcyQ3BVIGL7CDx6ZRoqllrDke 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nabuf4ph5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 17:23:25 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30OHGgre030590;
	Tue, 24 Jan 2023 17:23:25 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nabuf4pgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 17:23:25 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OH9RjW025656;
	Tue, 24 Jan 2023 17:23:24 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3n87p7g5t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 17:23:24 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OHNMT18716864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 17:23:22 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 711CF58062;
	Tue, 24 Jan 2023 17:23:22 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5378A5805A;
	Tue, 24 Jan 2023 17:23:22 +0000 (GMT)
Received: from localhost (unknown [9.163.30.189])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 17:23:22 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 0/4] powerpc/rtas: exports and locking
In-Reply-To: <20230124140448.45938-1-nathanl@linux.ibm.com>
References: <20230124140448.45938-1-nathanl@linux.ibm.com>
Date: Tue, 24 Jan 2023 11:23:22 -0600
Message-ID: <878rhrq22d.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AkSV6OKyfZCPdTscBcmfcJAPOAV7v8F8
X-Proofpoint-ORIG-GUID: yR1sksmt3YGfNjyEDppuukR1bT4XN8rt
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_13,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=945 bulkscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240155
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
Cc: ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> This series began as a single patch[1] to convert the RTAS subsystem's
> internal locks to raw spinlocks. The discussion of that patch
> identified opportunities to update a few aspects of the RTAS API, so
> the series begins with those and ends with a rebased version of the
> original patch.
>
> Changes since v1:
> - Unexport the singleton 'rtas' struct.
> - Remove lock and args fields from 'struct rtas_t', making them
>   private to the RTAS subsystem.
> - Convert all symbol exports in rtas.c to EXPORT_SYMBOL_GPL.
>
> [1] https://lore.kernel.org/linuxppc-dev/20230110044255.122616-1-nathanl@linux.ibm.com/
>
> Nathan Lynch (4):
>   powerpc/rtas: unexport 'rtas' symbol
>   powerpc/rtas: make all exports GPL
>   powerpc/rtas: remove lock and args fields from global rtas struct
>   powerpc/rtas: upgrade internal arch spinlocks
>
>  arch/powerpc/include/asm/rtas-types.h |   2 -
>  arch/powerpc/kernel/rtas.c            | 127 +++++++++++---------------
>  2 files changed, 55 insertions(+), 74 deletions(-)

Note this series conflicts with my earlier series "[PATCH v2 0/4] RTAS
function table and tracepoints":

https://lore.kernel.org/linuxppc-dev/20221212230154.851325-1-nathanl@linux.ibm.com/

I'll plan on rebasing the tracepoint series, which is more
disruptive/ambitious, on this one. Let me know if I should do
otherwise.

To be transparent, I have a fair amount of RTAS-oriented but otherwise
loosely related work in progress and I'm struggling to keep it organized
and establish a submission/review cadence. Having conflicting series
pending probably is not great :-(

Should I maintain a single stack of patches over time to avoid conflicts
like this, even though there may not be a unifying theme beyond it all
being generally RTAS-related?
