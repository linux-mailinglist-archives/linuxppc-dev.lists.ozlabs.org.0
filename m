Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3815FC189
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 09:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnQ3V3Cdkz3c9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:57:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=svT92MxQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=svT92MxQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnQ2V3vjNz2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 18:56:17 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C74Ep6008052;
	Wed, 12 Oct 2022 07:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7j7+0PVY+duwXs3lxtMNjp6/arWjKC5qVDq+nydL+n0=;
 b=svT92MxQRuoDWmW+hVWV0NS9iW68DXxuX4fUnPT3HqvWHckpzfWWeiiA+8izscxeulKJ
 4awQXALsHheedLMZQJmQczAtbOCult68nRA35YnNCRGexpLRcJJwbROt4TJ1JI265mkZ
 L4RrSPPskCYNJvBEDch6/W3gD/MXVSXOAyIO+NSczuhJRtAmA6wKFNcKgdxQDvJKiWdU
 uqpGUFQtjjBBd72CyCy/RFqEiCgUuKn0IxNqPN2E/UFOAfQNn1igPGkrwY4YBBV7z4+C
 1tb95kufVeKVmhP9QAjMJyajtfmseX+IgrukJzAI0neUBbhCfJDfiXiH+NgghCkCmJoj HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5nnhe6qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 07:56:14 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29C6WDO2006225;
	Wed, 12 Oct 2022 07:56:14 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5nnhe6qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 07:56:14 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29C7okBZ031620;
	Wed, 12 Oct 2022 07:56:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3k30u95kjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 07:56:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29C7u94p3736196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Oct 2022 07:56:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEAB2A404D;
	Wed, 12 Oct 2022 07:56:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58F0BA4040;
	Wed, 12 Oct 2022 07:56:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 12 Oct 2022 07:56:09 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2DC74602EA;
	Wed, 12 Oct 2022 18:56:08 +1100 (AEDT)
Message-ID: <567aa00bf6f5d97ca5b5d818e841b01061e1d217.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/32: fix syscall wrappers with 64-bit
 arguments of unaligned register-pairs
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 12 Oct 2022 18:56:07 +1100
In-Reply-To: <20221012035335.866440-1-npiggin@gmail.com>
References: <20221012035335.866440-1-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Uwukk_ZWnqBdga11_iR2M-xvtDi123Fu
X-Proofpoint-ORIG-GUID: qQdKZDLtgHhUcxqrcBUy4lWgKoWD7lKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_03,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=822 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210120049
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-10-12 at 13:53 +1000, Nicholas Piggin wrote:
> powerpc 32-bit system call (and function) calling convention for 64-
> bit
> arguments requires the next available odd-pair (two sequential
> registers
> with the first being odd-numbered) from the standard register
> argument
> allocation.
> 
> The first argument register is r3, so a 64-bit argument that appears
> at
> an even position in the argument list must skip a register (unless
> there
> were preceeding 64-bit arguments, which might throw things off). This
> requires non-standard compat definitions to deal with the holes in
> the
> argument register allocation.
> 
> With pt_regs syscall wrappers which use a standard mapper to map
> pt_regs
> GPRs to function arguments, 32-bit kernels hit the same basic
> problem,
> the standard definitions don't cope with the unused argument
> registers.
> 
> Fix this by having 32-bit kernels share those syscall definitions
> with
> compat.
> 
> Thanks to Jason for spending a lot of time finding and bisecting this
> and
> developing a trivial reproducer. The perfect bug report.
> 
> Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Fixes: 7e92e01b72452 ("powerpc: Provide syscall wrapper")

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

