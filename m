Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1F76956B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 14:01:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAbPbDQU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDxf51GCwz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 22:01:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAbPbDQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam.menghani@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDxdF2JLRz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 22:00:17 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VBkA0W009861;
	Mon, 31 Jul 2023 12:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=eqXpFbGQ/Joi6voFK4zcbUx1LHY2Eg7vku6+eTKOgGg=;
 b=YAbPbDQUW62bs9tbjNSf7uetkWGvpLPh6rgpN028QuNcwPCmJ/mcG+CchzFpSwCTFsef
 tKv+c3udWNyS9/NqzfYHIX/+DFOdSAnO5jKolMI6B8t2a/+7C9iOmtJ8ip8TMGR6oWFX
 81X/0J2pIMGLw0GKBvApkkW9y0JXJckG3rNC3z3jcyvGhpZRTbF8On2CTi1iMCqnfHvY
 6ZaMN0jtPbiW0/1cew+Yy3cZp9egvBGrDU1Pbxbk08qWWpmNZUvjEWrpY4ySPsj1pIcf
 96h5wDm7T6GpyTeQwlnb4IyVMddxNUNGM76qF5b/CzycNc2YxpWwPU3ZururkOhRodVk Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6ccf8deq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 12:00:10 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36VBlium014662;
	Mon, 31 Jul 2023 12:00:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6ccf8dc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 12:00:07 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VAINSe017033;
	Mon, 31 Jul 2023 12:00:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5dfxu245-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 12:00:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36VC034g24838886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Jul 2023 12:00:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE0CA2004E;
	Mon, 31 Jul 2023 12:00:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9002320043;
	Mon, 31 Jul 2023 12:00:02 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 31 Jul 2023 12:00:02 +0000 (GMT)
Date: Mon, 31 Jul 2023 17:30:00 +0530
From: Gautam Menghani <Gautam.Menghani@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] arch/powerpc: Remove unnecessary endian conversion code
 in XICS
Message-ID: <2w3cvyef33vgcg3aurb4n6q7go2p63cofz3a4pbdat53fqldee@jwzcj5dssgvh>
References: <20230630055628.17790-1-gautam@linux.ibm.com>
 <39920b0f-f261-8417-af7a-eef791ad5726@gmail.com>
 <jcxd7uvooawd3vadvvzmegv27owaqvrxsi66c2ds6hwraqs3zy@3ymyrpyp3q55>
 <873517dm3h.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873517dm3h.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PlXwlIdsx7aA4SKHvKd1VPJDWb8A0bnz
X-Proofpoint-ORIG-GUID: EQTwy_zE-0A_2BtBPuhQIVqFNfoVHfvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_05,2023-07-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310104
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 29, 2023 at 08:54:26PM +1000, Michael Ellerman wrote:
> Gautam Menghani <Gautam.Menghani@linux.ibm.com> writes:
> > On Thu, Jul 06, 2023 at 05:50:57PM +1000, Jordan Niethe wrote:
> >> On 30/6/23 3:56 pm, Gautam Menghani wrote:
> >> > Remove an unnecessary piece of code that does an endianness conversion but
> >> > does not use the result. The following warning was reported by Clang's
> >> > static analyzer:
> >> > 
> >> > arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
> >> > 'server' is never read [deadcode.DeadStores]
> >> >          server = be16_to_cpu(oserver);
> >> > 
> >> > As the result of endianness conversion is never used, delete the line
> >> > and fix the warning.
> >> > 
> >> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> >> 
> >> 'server' was used as a parameter to opal_get_xive() in commit 5c7c1e9444d8
> >> ("powerpc/powernv: Add OPAL ICS backend") when it was introduced. 'server'
> >> was also used in an error message for the call to opal_get_xive().
> >> 
> >> 'server' was always later set by a call to ics_opal_mangle_server() before
> >> being used.
> >> 
> >> Commit bf8e0f891a32 ("powerpc/powernv: Fix endian issues in OPAL ICS
> >> backend") used a new variable 'oserver' as the parameter to opal_get_xive()
> >> instead of 'server' for endian correctness. It also removed 'server' from
> >> the error message for the call to opal_get_xive().
> >> 
> >> It was commit bf8e0f891a32 that added the unnecessary conversion and never
> >> used the result.
> >> 
> >> Reviewed-by: Jordan Niethe <jniethe5@gmail.com>
> >> 
> >
> > Hello Michael, 
> >
> > Do you have any more questions on this patch or is it good to go?
> 
> I was expecting you'd send a v2 with the changelog updated to include
> all the extra detail Jordan added. I think it should also be tagged as
> Fixes: bf8e0f891a32.
> 
> cheers

Thanks for the response. I've sent a v2 here - 
lore.kernel.org/linuxppc-dev/20230731115543.36991-1-gautam@linux.ibm.com/T/#u

Thanks,
Gautam
