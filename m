Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC85559C32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV0K86Fl8z3c8h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:45:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thakw+/g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thakw+/g;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV0J30KzZz3c87
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:44:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ODhpVb031953;
	Fri, 24 Jun 2022 14:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2pXMCIgHJV6KAGdqoqXTrc497x6cWYzX2MTlOhCHfl4=;
 b=thakw+/g02odGKiUDC6CL+Mg9JrkCnvzKayejAB6vNlXr0aJHBHlHgaCS9UdPfVWa1O5
 pX3eG5XU7hxDB/Gx2yy1LATUvIVqXioy9y8dsDGok8Dkq1rGi6P5j2w2/Nmi8I2heIso
 2++bH/7ski2J5YBNeIlX13RFZqIZFYAMaUsGSXI3GMfHXVM9rP6e/7gve50YhsjwZH9A
 mR/OSiPEeS8faHWWXpfb3M8CGzibS+5q+fOoDe9HDnXBidSh9RUcniwxp8GJjOAAP9BF
 6FgGXn5cxdCnwShIX4nfXv19NN5F9Md/WCvufz+T31fSPYB40ynZIQ9cWWYixGd7RqVe fA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwedesm7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 14:44:13 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OELiCV009114;
	Fri, 24 Jun 2022 14:44:12 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma03dal.us.ibm.com with ESMTP id 3gs6bajnun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 14:44:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25OEiBP731719754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 14:44:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C7C678063;
	Fri, 24 Jun 2022 14:44:11 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7870E7805E;
	Fri, 24 Jun 2022 14:44:10 +0000 (GMT)
Received: from localhost (unknown [9.65.252.72])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Fri, 24 Jun 2022 14:44:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] powerpc/kvm: don't crash on missing rng, and use
 darn
In-Reply-To: <20220624142322.2049826-3-Jason@zx2c4.com>
References: <20220624142322.2049826-1-Jason@zx2c4.com>
 <20220624142322.2049826-3-Jason@zx2c4.com>
Date: Fri, 24 Jun 2022 11:44:08 -0300
Message-ID: <874k0aqfyf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WGq4-4M6-bGPoD6pQDgTmrzJ_4o1fsug
X-Proofpoint-GUID: WGq4-4M6-bGPoD6pQDgTmrzJ_4o1fsug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=604 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On POWER8 systems that don't have ibm,power-rng available, a guest that
> ignores the KVM_CAP_PPC_HWRNG flag and calls H_RANDOM anyway will
> dereference a NULL pointer. And on machines with darn instead of
> ibm,power-rng, H_RANDOM won't work at all.
>
> This patch kills two birds with one stone, by routing H_RANDOM calls to
> ppc_md.get_random_seed, and doing the real mode check inside of it.
>
> Cc: stable@vger.kernel.org # v4.1+
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Fixes: e928e9cb3601 ("KVM: PPC: Book3S HV: Add fast real-mode H_RANDOM implementation.")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

