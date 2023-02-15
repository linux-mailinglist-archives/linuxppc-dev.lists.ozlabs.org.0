Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547D6983BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 19:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH6Ty2b59z3fTm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 05:45:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MW1pyN6s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MW1pyN6s;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH6Sf3PCMz3fJd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 05:44:50 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FIZl9O003844;
	Wed, 15 Feb 2023 18:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tWAJ0djBBRmJ+2qctagcKFZKqKdOj3NuXjt0yoiDyGI=;
 b=MW1pyN6sPcRvsNiTk5RF2qwLVDNmeieXn4fyKF/uDS/2/BEFYIoHywjBxjzsnICLJheC
 M4RcaIw5kPmQcw5pFL5qxCko4tGl8MllWCZL9aafDTMIY9S0L1R56jFKSGc4DDyuXgxm
 LpHtfeuQxYuVIq213uzEi5T7H/gS/1pASZqtpmVYxZVDrcHA0x3Acq14fIkoODF5QePW
 B0BdewSMEmUksmHcEaCb6/QM5r4k03fLJS0TsDsxorrXXVskxHDY/3m4SnVO6tk/3K25
 yIAYoJHQT2VBxWIOomCjMLjFO2JyS9FJz07R999UTzFSX/ERICE59f5klcnfae0+kQyN Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns462spey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 18:44:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31FIaiH2016444;
	Wed, 15 Feb 2023 18:44:40 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns462spen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 18:44:40 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31FI9OKI001021;
	Wed, 15 Feb 2023 18:44:39 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3np2n7m5hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 18:44:39 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31FIicQ51180296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 18:44:38 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E41D458053;
	Wed, 15 Feb 2023 18:44:37 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD2FD5805D;
	Wed, 15 Feb 2023 18:44:37 +0000 (GMT)
Received: from localhost (unknown [9.163.66.216])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 18:44:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/9] powerpc/machdep: Define 'compatible' property in
 ppc_md and use it
In-Reply-To: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
References: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
Date: Wed, 15 Feb 2023 12:44:37 -0600
Message-ID: <874jrmahuy.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2KoSZSgCyvUbn6l4BOymzvLsZF61rnI-
X-Proofpoint-GUID: iBzKRmEq8YnIgT_TK-Pij4sYl0v7jQcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_09,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302150165
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Most probe functions do nothing else than checking whether
> the machine is compatible to a given string.
>
> Define that string in ppc_md structure and check it directly from
> probe_machine() instead of using ppc_md.probe() for that.
>
> Keep checking in ppc_md.probe() only for more complex probing.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3: New
> ---
>  arch/powerpc/include/asm/machdep.h |  1 +
>  arch/powerpc/kernel/setup-common.c | 13 +++++++------
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
> index 378b8d5836a7..c5dfe5ff923c 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -20,6 +20,7 @@ struct pci_host_bridge;
>  
>  struct machdep_calls {
>  	char		*name;
> +	char		*compatible;

Seems like 'compatible' ought to be const char *? Possibly 'name' also.
I'm able to build ppc64le with those changes, at least.
