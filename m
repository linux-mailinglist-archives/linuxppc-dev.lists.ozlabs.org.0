Return-Path: <linuxppc-dev+bounces-7310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF2A6D9F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 13:17:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLsW75kV2z2yRd;
	Mon, 24 Mar 2025 23:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742818643;
	cv=none; b=LB/dcXkgKeJPaCp7fcBi8Wf1P9k/6ttRBKUmnxRoMfLvO4LpTFRxNSWTfnITh2NsWQ75X/kWxAlDI8nrEKTTBWh3I9YG6h1jobtzynvio2ndZ8Lfy1THG1/rn66RMdNor9OqmKn4wPh31VEuMVyY6BQ4rmPh0x1smZTqmSHUMSyc37y8ZsQRYnfAijjx/uKnmqLvlYFe2OGnXrY+1GLuuM146C1Pj+u6BO2BLn3GLNRvSVHjSIE7W9OoGHsUNAN2cQr5uXoR7R2oLzHowqi/hJxfckXnUgv4ddErrQxkyP6q3pJ1Wla9rOScB1wJlUgB0+v+Ql/Gk/RuxgvAbt4bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742818643; c=relaxed/relaxed;
	bh=ntVLPB558jkDqC6dAc3SwXIASugn2A1XtzkJc5zU8MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eH3cNj8hOMb1FsOjxzlMP9MEOTJHpVSABgdlb40/SRIl8LGUzGO0HzKViJTi1oJImdbiD/YYIeREz/av91+2KfNZ9wueMQtDfu4yzKNRw/ToildSq9AMxQF5z+dwZgOmTPrx0Ml/ZPdXLKq4xfwankg0SO0orKR+xEBv4r15dzEhP0sPexHC6iCHJtkftIbB6NzCR+OGJLIDbjk/ES8Yg3/Kl0pSZZowGVFB8EU6wegC+PfBlz8OMHRES9Q//CU/GYvsLdKJ8z0pG2qDBSIo0XhmhfRMX0iUDAVIC0Ner/mxmuw+9fitf5U3DJ3FnP77PgDKkblhMZogSWiJFCSnMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=emVMVq6Z; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=emVMVq6Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLsW62Hl9z2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 23:17:21 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9uEVw010776;
	Mon, 24 Mar 2025 12:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ntVLPB558jkDqC6dAc3SwXIASugn2A
	1XtzkJc5zU8MQ=; b=emVMVq6ZKJVFE11W3h3r6kl+aArjRUzrVMKgYre5SlYZbD
	gesBBqKbCECszumzqzLz8+nQbYbLWKyju/JdwcD5Pwcth9BVrZ44kSM5oyEwJuRK
	i5UlocRBijSfAJkmcwXLjsEsT4h7+z0NmIPKiOex71jTciZG7x+vCCj+V5HtVhGw
	IPsoBQ1QaPqrDWfbiuci5OuDPW3nPO3PVrn8wOAJ5qFcrWcNKdK4K7u0mGghef+d
	xqNyV3q3UnHBAMviEo6SbA1cvJbR+KBkLpFNan520GJ8u7f00QzGKHdEy7shsdhL
	NPXU12r2gXlbwD7VcBYWy+c+Im0Ug6XTfzj5U6Bw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jsfpbc7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 12:17:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52OCHBcq021741;
	Mon, 24 Mar 2025 12:17:12 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45jsfpbc78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 12:17:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52O89tSE020639;
	Mon, 24 Mar 2025 12:17:11 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j8hnp4hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 12:17:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52OCH7Sc20250938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Mar 2025 12:17:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5178920043;
	Mon, 24 Mar 2025 12:17:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3966A20040;
	Mon, 24 Mar 2025 12:17:05 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 24 Mar 2025 12:17:05 +0000 (GMT)
Date: Mon, 24 Mar 2025 17:47:01 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com,
        Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 0/6] kvm powerpc/book3s-hv: Expose Hostwide counters
 as perf-events
Message-ID: <hap6g4knk2uery5axusfrqi5pbe6nlpohs6tvbdkcyegvov47y@x5eaysm2er4f>
References: <20250317100834.451452-1-vaibhav@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317100834.451452-1-vaibhav@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PCxRnUfJxcDLFEHzcqIICkyFCwuHQ83Q
X-Proofpoint-GUID: Kn_dDUiodvBLm1dE6Rq2GnogDazR4uYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=502 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503240087
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Tested on both KVM on LPAR and KVM for bare metal.

For the series:
Tested-by: Gautam Menghani <gautam@linux.ibm.com>

