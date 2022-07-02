Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B00563F7C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 12:31:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZpJ31Qz3z3by0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 20:30:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDEbvNZe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RDEbvNZe;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZpHK4LjXz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 20:30:20 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 262AGE83035395;
	Sat, 2 Jul 2022 10:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dnEvjX0KQuqOLbGfA8yQPZbkSiYGyhbteB3kV0I4+mQ=;
 b=RDEbvNZeQao6+vqahdlzRhsWbwjrrDHXsLjwlu9C4eHHqZnDRjAhBrirBB/igsFQbcOO
 qqhH/HK6GmEUkyqs3Raz+t6ONI/rbmyIh4u3IFlmDe2+6gG4yAI+PUOU501/68G9l/hI
 AySudk/Bv6sW7svFkHN3iIfkqab5T/mTNh7wkqcG65B1c8S5nTtxhKM+IXozmThPE5x3
 XaVD/VDFldpPEbSYTMmtWr8UM0KflDgN1qoZi00TQaXB6p2N0g99djNKmJmmaT6e3dRV
 FwWqbiFAv2P0ksIB1GhCjtFnBHvmHOvGNu8j826B8cMS6NyQBBJLdgml5YXLhOprQ56n mw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h2m48r75u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Jul 2022 10:30:10 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 262ANHT2026288;
	Sat, 2 Jul 2022 10:30:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3h2dn90cq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Jul 2022 10:30:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 262AU65L15139088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Jul 2022 10:30:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EA4C11C050;
	Sat,  2 Jul 2022 10:30:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19FCF11C052;
	Sat,  2 Jul 2022 10:30:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.72.209])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat,  2 Jul 2022 10:30:04 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v4 0/2] powerpc rng cleanups
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220701084946.225357-1-Jason@zx2c4.com>
Date: Sat, 2 Jul 2022 16:00:03 +0530
Message-Id: <50CA4404-F30D-4503-918E-30464DC9DCF1@linux.ibm.com>
References: <20220701084946.225357-1-Jason@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9kd8tqms1kX-_7nchhV8SqB-i-PB2nxT
X-Proofpoint-GUID: 9kd8tqms1kX-_7nchhV8SqB-i-PB2nxT
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-02_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=781
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207020045
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 01-Jul-2022, at 2:19 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> These are two small cleanups for -next.
> 
> This is meant to be atop
> https://lore.kernel.org/all/20220630121654.1939181-1-Jason@zx2c4.com/
> which is expected to land first.
> 
> v4 fixes up an inversion of thr DR flag.
> 
> Jason A. Donenfeld (2):
>  powerpc/powernv: rename remaining rng powernv_ functions to pnv_
>  powerpc/kvm: don't crash on missing rng, and use darn
> 

Boot tested this series and can successfully boot a Power8 server.

fwiw Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
