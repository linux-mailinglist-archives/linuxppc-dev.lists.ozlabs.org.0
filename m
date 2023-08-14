Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 545DE77B715
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 12:52:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Netz9UNE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPWSS1lRfz3cG3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 20:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Netz9UNE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPWRW4NjFz308K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 20:51:34 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EAf4mP009955;
	Mon, 14 Aug 2023 10:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=vftLtr5LAHFI92xpUg8GFSsv9vuwW80kYCw601HD+C0=;
 b=Netz9UNEphUGgh0YmaBsorl1cmo+11hE7B6LRR0Zu84cuNC/cpnsNJ6j5rjMsKC6HLsD
 3RfI5eQgYAjVO2fYnn2L0DhZOOrdsWJx8oCoqyexTErc4JwWwwAs13OUdohpYTlEy/jn
 HprQbfw8lJ8pDvCp5RaMQK7lsZnTRNhu0At0ys/BYSXjBCnLKMftLBWGNZw8tCUbjBVj
 eeToYu3jzCClOdsyu8vUYNUtrkyC4kO0mr9HCNMo+iro2AV+EV9awfZuOsdZWAC9ZONu
 oK/xsobLVjfo6qQW0Ucix3SIVOBSFSA/sKvjHA4NQgoC3HuFgng9VxsxCXIpsLma+16p nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfje88fnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 10:51:13 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EAg6Jg012495;
	Mon, 14 Aug 2023 10:51:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfje88fn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 10:51:13 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37E99u7W013425;
	Mon, 14 Aug 2023 10:51:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sepmjb2pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 10:51:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EApAQm44761678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 10:51:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 581C820040;
	Mon, 14 Aug 2023 10:51:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EEC32004B;
	Mon, 14 Aug 2023 10:51:08 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 14 Aug 2023 10:51:08 +0000 (GMT)
Date: Mon, 14 Aug 2023 16:21:07 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v4 08/10] powerpc/pseries: Initialise CPU hotplug
 callbacks earlier
Message-ID: <20230814105107.kvsqhlzvlggjddnw@linux.vnet.ibm.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
 <20230705145143.40545-9-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20230705145143.40545-9-ldufour@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qgIoR12dooW_zWRqm39eVx2MCCUgizQk
X-Proofpoint-ORIG-GUID: -6onJ4Wk6UnD-kghK4HPpfqVg8QWwTYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140098
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, rui.zhang@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Laurent Dufour <ldufour@linux.ibm.com> [2023-07-05 16:51:41]:

> From: Michael Ellerman <mpe@ellerman.id.au>
> 
> As part of the generic HOTPLUG_SMT code, there is support for disabling
> secondary SMT threads at boot time, by passing "nosmt" on the kernel
> command line.
> 
> The way that is implemented is the secondary threads are brought partly
> online, and then taken back offline again. That is done to support x86
> CPUs needing certain initialisation done on all threads. However powerpc
> has similar needs, see commit d70a54e2d085 ("powerpc/powernv: Ignore
> smt-enabled on Power8 and later").
> 
> For that to work the powerpc CPU hotplug callbacks need to be registered
> before secondary CPUs are brought online, otherwise __cpu_disable()
> fails due to smp_ops->cpu_disable being NULL.
> 
> So split the basic initialisation into pseries_cpu_hotplug_init() which
> can be called early from setup_arch(). The DLPAR related initialisation
> can still be done later, because it needs to do allocations.
> 

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

-- 
Thanks and Regards
Srikar Dronamraju
