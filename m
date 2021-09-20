Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDD411749
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 16:40:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCnKJ5Q5Rz2yV6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 00:40:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TSpLIBkV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TSpLIBkV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCnJd0lbbz2yKK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 00:39:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KDD4nX026111; 
 Mon, 20 Sep 2021 10:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=4Zl6w940/2jKvPnEIo1rBjnRF6pHkpOduXump2/nvfc=;
 b=TSpLIBkVlE/9WJXDDIKV4Y0DwhhQqV2MFsqRXK/cMHnXEQU0pADmzfDwLQGpxpMqbndQ
 Qz8WyY64cCgFLxsMq+Cjzo55hP4mlqNos5aWY8SRkzsq+CoaDHqHOPIYnrwg8w6ErpXu
 WHd3GU4QD+hfkNm7hQrgyX6Kk/q9xWYOskvKgwCbRGd5reIJbRx6a3DPa0OZW/zoEHuU
 nRk6qE1IuOaxk3mFg2Xwdo4KYGgty7s8JDyb7Yuh4tcHPlca0V4+OPtdVrnmzBtuPqG0
 WhzG3vM26qKqqfvaafPPtywAbgAVJTve0+pLYtF9JH3RhmchDunMbYephG02KxDvg7QP Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w94c29r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 10:39:39 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18KDxu3c014693;
 Mon, 20 Sep 2021 10:39:39 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w94c29f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 10:39:39 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KEX5PB013244;
 Mon, 20 Sep 2021 14:39:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3b57ra0w5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 14:39:38 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KEda3L50069806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 14:39:36 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1ADE6E065;
 Mon, 20 Sep 2021 14:39:36 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE8396E05D;
 Mon, 20 Sep 2021 14:39:36 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 14:39:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] powerpc/cpuhp: BUG -> WARN conversion in offline path
In-Reply-To: <47f36467-ae04-6472-741a-0851506a2d73@csgroup.eu>
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
 <20210920135504.1792219-3-nathanl@linux.ibm.com>
 <47f36467-ae04-6472-741a-0851506a2d73@csgroup.eu>
Date: Mon, 20 Sep 2021 09:39:36 -0500
Message-ID: <87mto7nwev.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YV2uI9GV9He-cSW5IJ5SYIYGf_sA6XGt
X-Proofpoint-ORIG-GUID: feZuGgIsImCadTYW8nYI4vHmLxPpEGJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200093
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
Cc: danielhb413@gmail.com, tyreld@linux.ibm.com, ldufour@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 20/09/2021 =C3=A0 15:55, Nathan Lynch a =C3=A9crit=C2=A0:
>> If, due to bugs elsewhere, we get into unregister_cpu_online() with a CPU
>> that isn't marked hotpluggable, we can emit a warning and return an
>> appropriate error instead of crashing.
>
> Is it only a bug situation, or is it something that can happen in real=20
> life ?
>
> If it can happen in real life, kernels with panic_on_warn will still be=20
> impacted.

I only found this by inspection, and it can happen only due to a bug in
CPU device registration at boot. The flag must not be set if the
platform or CPU can't support going offline.
