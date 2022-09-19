Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B05BC28D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 07:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWD2c5jK8z3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 15:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LbjFxupu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LbjFxupu;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWD1x05SBz2xrr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 15:36:36 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J59sOT002124;
	Mon, 19 Sep 2022 05:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mKxT6NQMjBPhIjekbRgH2sGkZAridUzVv1cg+cZ6J1Y=;
 b=LbjFxupu11+4bHfd4DMJLxKKSdBJwtwv8Bp2VpribmZS2+w0G0OIpnRSLksw6Ukms8S9
 JRN5zXuZpBcJdLB8mljikC7HZTh9opm3xz35rORlQRHeS45ZEVpaTzWSZmqioKac77h4
 RdqdgNrq1jMNxR6yisTC/UPwoYG8ZhMRdm2M7cFtR7MZFAq+wRMdT2WG1sI1VkfOWm1I
 yi4yjW6c0gcRZJ3eQKyBb51r4tw+Q3oWtrpPAh8hon/albBAKpXmFjJ4yyKNYHBMi3W4
 QVjFbEadFaaU4HKruhqn/ey0grqWwzs+X0n8I1MzcwbM1YVOxN7iQy2pZQAJwh2a4lMR UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpfyxtr04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 05:36:27 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28J5PU6S000382;
	Mon, 19 Sep 2022 05:36:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpfyxtqyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 05:36:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28J5Kx8q006510;
	Mon, 19 Sep 2022 05:36:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jn5v8hwts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 05:36:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28J5aN3O44106044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 05:36:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EFC142041;
	Mon, 19 Sep 2022 05:36:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDC464203F;
	Mon, 19 Sep 2022 05:36:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 19 Sep 2022 05:36:22 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5EB54602EA;
	Mon, 19 Sep 2022 15:36:15 +1000 (AEST)
Message-ID: <488132961de5fa7fe6119ff78cdbb84ab796f01d.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/microwatt: Remove unused early debug code
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 19 Sep 2022 15:36:14 +1000
In-Reply-To: <20220919052755.800907-1-mpe@ellerman.id.au>
References: <20220919052755.800907-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mVmvG65TOnvEcgZ23yREb7a9lxxlZk8H
X-Proofpoint-ORIG-GUID: V4HWI1MR8XOwqqd-UVdyYCLvsPit_DCG
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190036
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
Cc: lukas.bulwahn@gmail.com, andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-09-19 at 15:27 +1000, Michael Ellerman wrote:
> The original microwatt submission[1] included some early debug code
> for
> using the Microwatt "potato" UART.
> 
> The series that was eventually merged switched to using a standard
> UART,
> and so doesn't need any special early debug handling. But some of the
> original code was merged accidentally under the non-existent
> CONFIG_PPC_EARLY_DEBUG_MICROWATT.
> 
> Drop the unused code.
> 
> 1: 
> https://lore.kernel.org/linuxppc-dev/20200509050340.GD1464954@thinks.paulus.ozlabs.org/
> 
> Fixes: 48b545b8018d ("powerpc/microwatt: Use standard 16550 UART for
> console")
> Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

grep confirms this is indeed dead code.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>


-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

