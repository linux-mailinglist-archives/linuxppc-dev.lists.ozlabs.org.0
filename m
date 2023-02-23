Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF396A0C75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 16:03:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMx9w5mKGz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 02:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEkJlWEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEkJlWEY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMx8y4MjZz3bY1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 02:02:58 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NDg9Ys015886;
	Thu, 23 Feb 2023 15:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DskhPYzP4KCP365XoSp8mQTWayAEtypEja6b+A2KPyk=;
 b=KEkJlWEYIFd1FgcSVKvFwrCyQr21Uml40QfxttjY8QeXG9FRl4P6e6FpFFYQua1NWNRc
 OXG0/j8iTDHCZSHy+GHNbqQCsXadZ9/gy0le/Tyuox2G37hag/+cuimGkofjpYtzmU2p
 fFr0Ot9MbncXDf9VS7JwZdg8hYPrfwecpO9YRYPZ5bkCtQt1WeMcsyXzvmXr9Ate7Tq5
 S+vgwTmHiY93nj1YE3LI+BkG3ib44zISJCyLm+I/2Q/DHJS8QAXnlv3i3XmgyP2twRVN
 nmS1rU+Rp0aTjKfZiHdK9afti68bqjisNlNs0n7ddtwfc3JZ4H9+CBycqmCtTYkFmmOo UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx2pyn713-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 15:02:27 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31NETuAf028046;
	Thu, 23 Feb 2023 15:02:27 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx2pyn705-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 15:02:26 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31NDUGIM015814;
	Thu, 23 Feb 2023 15:02:25 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3ntpa76qnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 15:02:25 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31NF2O8565864036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 15:02:24 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51C5A58057;
	Thu, 23 Feb 2023 15:02:24 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19B8C58063;
	Thu, 23 Feb 2023 15:02:24 +0000 (GMT)
Received: from localhost (unknown [9.211.113.64])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Feb 2023 15:02:23 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 3/4] powerpc/pseries: RTAS work area requires
 GENERIC_ALLOCATOR
In-Reply-To: <20230223070116.660-4-rdunlap@infradead.org>
References: <20230223070116.660-1-rdunlap@infradead.org>
 <20230223070116.660-4-rdunlap@infradead.org>
Date: Thu, 23 Feb 2023 09:02:23 -0600
Message-ID: <871qmga0hs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FJQvzrWQfun7DY_va5BNDnrSnw9Ypwi_
X-Proofpoint-GUID: UyEQwhyAVhj9AvEG0l3Esu1FsIrLjFP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230118
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> The RTAS work area allocator uses code that is built by
> GENERIC_ALLOCATOR, so the PSERIES Kconfig should select the
> required Kconfig symbol to fix multiple build errors.
>
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o: in function `.rtas_work_area_allocator_init':
> rtas-work-area.c:(.init.text+0x288): undefined reference to `.gen_pool_create'
> powerpc64-linux-ld: rtas-work-area.c:(.init.text+0x2dc): undefined reference to `.gen_pool_set_algo'
> powerpc64-linux-ld: rtas-work-area.c:(.init.text+0x310): undefined reference to `.gen_pool_add_owner'
> powerpc64-linux-ld: rtas-work-area.c:(.init.text+0x43c): undefined reference to `.gen_pool_destroy'
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o:(.toc+0x0): undefined reference to `gen_pool_first_fit_order_align'
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o: in function `.__rtas_work_area_alloc':
> rtas-work-area.c:(.ref.text+0x14c): undefined reference to `.gen_pool_alloc_algo_owner'
> powerpc64-linux-ld: rtas-work-area.c:(.ref.text+0x238): undefined reference to `.gen_pool_alloc_algo_owner'
> powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o: in function `.rtas_work_area_free':
> rtas-work-area.c:(.ref.text+0x44c): undefined reference to `.gen_pool_free_owner'
>
> Fixes: 43033bc62d34 ("powerpc/pseries: add RTAS work area allocator")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

oops. Thanks for fixing this.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
