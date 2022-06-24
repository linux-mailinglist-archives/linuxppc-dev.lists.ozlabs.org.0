Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFB559BF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV0JT4zpBz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:44:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ita8jtl/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ita8jtl/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV0Hn3cb6z3bqd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:44:04 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OEgKM6006584;
	Fri, 24 Jun 2022 14:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=d5HXA+asXWl90KVBp8xnvOgNuKWNysdDXiDLBjkUW0M=;
 b=Ita8jtl/gyRM3TqcMzsrk6HDB/ZPGvxjDRUBEGdH2QUuJIdGVgomyqBke3uyYLIukUd+
 +2Ma85mxKF94NnHIFzqdPA89mUXdqv8BgQxLc78pcvSjocAhMo68HIeywrnvbQQaRIiu
 1bC9iVGtVQQUTmL8jpEvcowC1Kq8654q+A5RWSac2mR3TyLXkRBNRTptVT/Ftbel+zZ2
 VIkKS4I9QBpDaB4lnw/pxtWjOWcsCwR+ufHtzuTjrloeq2ztidPqYWEu7f9D9CzGOSID
 TjLmwiepQEU6uzjWTzDU31Z3S/Kqxg/88pSXyYlbMI4/QbKEKQDO9sfBq+XAgBXjnCOe dQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwf8tr173-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 14:43:59 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OEKVD6014707;
	Fri, 24 Jun 2022 14:43:58 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01dal.us.ibm.com with ESMTP id 3guk92rs1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 14:43:58 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25OEhvfU27656488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 14:43:57 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45A9FC6059;
	Fri, 24 Jun 2022 14:43:57 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A39DC605A;
	Fri, 24 Jun 2022 14:43:56 +0000 (GMT)
Received: from localhost (unknown [9.65.252.72])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Fri, 24 Jun 2022 14:43:56 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: rename remaining rng powernv_
 functions to pnv_
In-Reply-To: <20220624142322.2049826-2-Jason@zx2c4.com>
References: <20220624142322.2049826-1-Jason@zx2c4.com>
 <20220624142322.2049826-2-Jason@zx2c4.com>
Date: Fri, 24 Jun 2022 11:43:54 -0300
Message-ID: <877d56qfyt.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XxTzzFsdG_p6zhiZmwQVy_aWCIslEPa1
X-Proofpoint-GUID: XxTzzFsdG_p6zhiZmwQVy_aWCIslEPa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=894
 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240056
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> The preferred nomenclature is pnv_, not powernv_, but rng.c used
> powernv_ for some reason, which isn't consistent with the rest. A recent
> commit added a few pnv_ functions to rng.c, making the file a bit of a
> mishmash. This commit just replaces the rest of them.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Fixes: f3eac426657 ("powerpc/powernv: wire up rng during setup_arch")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

