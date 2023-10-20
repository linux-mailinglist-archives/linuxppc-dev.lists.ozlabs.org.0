Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD867D07C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 07:46:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gCulxrZE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBYV00yNYz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 16:46:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gCulxrZE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBYT70gnhz3c4r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 16:45:14 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K5gQ3N008048;
	Fri, 20 Oct 2023 05:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=nqrnMCe98ci6txoaU8IrERG77izBRJ91QlE6fdoyJJo=;
 b=gCulxrZEN8WbmydSY1btCVRTI4wA8LQ9XbIh2mdbG6otH8hScolJCWcgxb7yLZ1A8I+S
 JWFK6p3BEVlMUaj3pEEtAi3d+MxTY+B9+91tdqJyUbzquoBOfZGuKWOFfCCJ13nIgADb
 sLQwn0XHEOGJadP55Ylkj2eo0O/vWrP+lCBp2HWY6sNzVIIy4yOIjOIVV/tfAiyOLs7g
 MsvH44fKXwzsLbUJdxYK/A25Kga/X77tXj+/xP9mhxGV6O+2DWeSBEkQOK0Dq738dAXv
 4cG3J2K/FULJFs7k5hYOk/mGHsGtNmHYHCklUw8WZnndRXaPkR+Gcntip+OvvM0Jl37c bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tukmq03mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 05:44:52 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39K5hEuV011798;
	Fri, 20 Oct 2023 05:44:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tukmq03kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 05:44:51 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39K2oC9d002683;
	Fri, 20 Oct 2023 05:44:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc44ahx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 05:44:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39K5imUY56295772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 05:44:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 588E920043;
	Fri, 20 Oct 2023 05:44:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37F4920040;
	Fri, 20 Oct 2023 05:44:46 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 20 Oct 2023 05:44:46 +0000 (GMT)
Date: Fri, 20 Oct 2023 11:14:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/6] powerpc/smp: Enable Asym packing for cores on
 shared processor
Message-ID: <20231020054445.GL2194132@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
 <20231018163751.2423181-3-srikar@linux.vnet.ibm.com>
 <45a14ebb-91e7-489d-ad5d-6d39a48bc1f5@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <45a14ebb-91e7-489d-ad5d-6d39a48bc1f5@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: va9b7wCKRExEmjcCpA5TKGv1kXoUMz0J
X-Proofpoint-GUID: K7lH2W5Asytm59uDHQ4YNKDr4Vn7yyok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_04,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxlogscore=914 bulkscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310200049
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Shrikanth Hegde <sshegde@linux.vnet.ibm.com> [2023-10-19 21:26:56]:

> 
> 
> On 10/18/23 10:07 PM, Srikar Dronamraju wrote:
> > If there are shared processor LPARs, underlying Hypervisor can have more
> > virtual cores to handle than actual physical cores.
> > 
> > Starting with Power 9, a core has 2 nearly independent thread groups.
> > On a shared processors LPARs, it helps to pack threads to lesser number
> > of cores so that the overall system performance and utilization
> > improves. PowerVM schedules at a core level. Hence packing to fewer
> > cores helps.
> > 
> > For example: Lets says there are two 8-core Shared LPARs that are
> > actually sharing a 8 Core shared physical pool, each running 8 threads
> > each. Then Consolidating 8 threads to 4 cores on each LPAR would help
> > them to perform better. This is because each of the LPAR will get
> > 100% time to run applications and there will no switching required by
> > the Hypervisor.
> > 
> > To achieve this, enable SD_ASYM_PACKING flag at CACHE, MC and DIE level.
> 
> This would have a conflict with tip/master. 
> DIE has been renamed to PKG and Both changelog and code below should 
> change DIE to PKG. 

Once the changes are part of powerpc/merge, will rebase and accomodate the
changes from DIE to PKG.


-- 
Thanks and Regards
Srikar Dronamraju
