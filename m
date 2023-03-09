Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32166B24D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 14:01:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXTpR4gGvz3chZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 00:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rldJseDD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXTnT3Slmz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 00:00:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rldJseDD;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PXTnP6FM3z4xDn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 00:00:41 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PXTnP5pyTz4xDl; Fri, 10 Mar 2023 00:00:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rldJseDD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PXTnP2fK5z4x1R;
	Fri, 10 Mar 2023 00:00:40 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329BDbhp029568;
	Thu, 9 Mar 2023 13:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=tcBF+ubx6LbtoSD2mJ9Jbkybje1ACfzyNnGR1+3VCmw=;
 b=rldJseDDprnumrd9WVaEIL1BwxvouvxK/caxKc8BJ8Ej0ohtaLgm9u9EKTtowPdNs9QG
 RHBJgUZbkgI/B0rv5WkMhlTdSkdLm8cu3VekLIrLR71UTuFeVYw7oLHl/jizo432An3I
 YtL8Euz8zqlEwCM0Kb3cyRqLAIUs20wFqYDZRBrV6LXAJ+/lSMFSbz+J4ipwOehz7rP1
 EXteoir14JPa3lUdR4wAj3UEVO7nfhbMfTVbp6Nri26dImzSepscPv6eMzGGUYWonzgy
 OVbEDrjU0rDQskHQcY6wOaDhXibrNfswNfGInL1G7wxBIBiHZg+/pQL1yPJbAwdJS/zE 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6t3bsdau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 13:00:36 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 329Cs8Qd030902;
	Thu, 9 Mar 2023 13:00:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6t3bsd8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 13:00:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3294POj1030381;
	Thu, 9 Mar 2023 13:00:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3p6g862b73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 13:00:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329D0TSY60817736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 13:00:29 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58BFB2004E;
	Thu,  9 Mar 2023 13:00:29 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 422852004F;
	Thu,  9 Mar 2023 13:00:28 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.57.181])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 13:00:27 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH 3/3] powerpc/kvm: Enable prefixed instructions for HV KVM
 and disable for PR KVM
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <ZAgs25dCmLrVkBdU@cleo>
Date: Thu, 9 Mar 2023 18:30:17 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <A5C10FAF-12FC-4D46-A773-AB95DD2D0FD4@linux.ibm.com>
References: <ZAgsR04beDcARCiw@cleo> <ZAgs25dCmLrVkBdU@cleo>
To: Paul Mackerras <paulus@ozlabs.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WayEQi5nM9uFQmmpPnEv8Fs7ZgnTAZvu
X-Proofpoint-ORIG-GUID: 5I--WkOycbgz6AnroLHms3kUPxLxOu_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=753 spamscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 impostorscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090101
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
Cc: kvm-ppc@vger.kernel.org, linuxppc-dev@ozlabs.org, Michael Neuling <mikey@neuling.org>, Nick Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Mar-2023, at 12:06 PM, Paul Mackerras <paulus@ozlabs.org> wrote:
> 
> Now that we can read prefixed instructions from a HV KVM guest and
> emulate prefixed load/store instructions to emulated MMIO locations,
> we can add HFSCR_PREFIXED into the set of bits that are set in the
> HFSCR for a HV KVM guest on POWER10, allowing the guest to use
> prefixed instructions.
> 
> PR KVM has not yet been extended to handle prefixed instructions in
> all situations where we might need to emulate them, so prevent the
> guest from enabling prefixed instructions in the FSCR for now.
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Tested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---

Tested on a Power10 system. Prefixed instructions work correctly.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> arch/powerpc/include/asm/reg.h       | 1 +
> arch/powerpc/kvm/book3s_hv.c         | 9 +++++++--
> arch/powerpc/kvm/book3s_pr.c         | 2 ++
> arch/powerpc/kvm/book3s_rmhandlers.S | 1 +
> 4 files changed, 11 insertions(+), 2 deletions(-)
> 

