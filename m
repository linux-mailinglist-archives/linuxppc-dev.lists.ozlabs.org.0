Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 275614DC49B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 12:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK4MX0knWz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 22:16:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XaMChvtz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XaMChvtz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK4Ln4tVtz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 22:15:28 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H9sTYl021523
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 11:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0xrnKlmIPFUnapxOFVtNHG7u9yanMWoBYgVciFVO+y8=;
 b=XaMChvtzNSC3Y7V+20V5Ae8ir6/ivqGoy2vEG88XrkmXv+tVOl6HCrB3TAW/E6VfvZDo
 cvXhfXRQ22uFH27A6/Qclf5mjl22zi5eubEkaoS1u8No4Fk7uJ2NWE58LkgVC3kiwMfe
 BmnzqYC8KlhqmRWRQ5Ipbk4s7RSq71ivCZbJP3fHXc+aZEwwF71wvayXbuHrOpl3ibI+
 2X7R+Ye9NB+i6tW+OI8pL9h3ltVFZa7RqQbyeDEpDjeQ6uJ+daeu8wC/Bl5ovLGpTmKX
 8Ch9peqaLuFkKW0zySqRUk1lLzPfMPNIIro6YsIapmHbukyswiiC/Qi8la3PFD1hLNSa 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s49epm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 11:15:26 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22HBDriM003976
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 11:15:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev2s49ep1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 11:15:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22HBDHr7007527;
 Thu, 17 Mar 2022 11:15:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3et95wxfg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 11:15:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22HBFLLX51184002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 11:15:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88C995204E;
 Thu, 17 Mar 2022 11:15:21 +0000 (GMT)
Received: from [9.145.66.50] (unknown [9.145.66.50])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6770A52052;
 Thu, 17 Mar 2022 11:15:21 +0000 (GMT)
Message-ID: <757760f9-7208-46d5-df55-b7ae8c2c5ecd@linux.ibm.com>
Date: Thu, 17 Mar 2022 12:15:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 00/14] powerpc/rtas: various cleanups and improvements
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uVTgxR_U0JFO-7BL9JWmmpsTyMc0A7F2
X-Proofpoint-GUID: JcgmfHSbPCxr89-RKQkeIgdMRi35k01L
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_04,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170066
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

As this series needs additional work, I just sent a single patch [1] fixing
the MSR[RI] issue addressed in the patch 9/14 of this series.

I did that because that fix is fixing a panic currently seen and this will
ease backport to stable and distro kernel.

I suggest rebasing this series on top of this new patch.

Cheers,
Laurent.

1:
https://lore.kernel.org/linuxppc-dev/20220317110601.86917-1-ldufour@linux.ibm.com/

On 08/03/2022, 14:50:33, Nicholas Piggin wrote:
> I had a bunch of random little fixes and cleanups around and
> was prompted to put them together and make a change to call
> RTAS with MSR[RI] enabled because of a report of the hard
> lockup watchdog NMI IPI hitting in an rtas call which then
> crashed because it's unrecoverable.
> 
> Could possibly move patch 9 earlier if it would help with
> backporting.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (14):
>   powerpc/rtas: Move rtas entry assembly into its own file
>   powerpc/rtas: Make enter_rtas a nokprobe symbol on 64-bit
>   powerpc/rtas: Fix whitespace in rtas_entry.S
>   powerpc/rtas: Call enter_rtas with MSR[EE] disabled
>   powerpc/rtas: Modernise RI clearing on 64-bit
>   powerpc/rtas: Load rtas entry MSR explicitly
>   powerpc/rtas: PACA can be restored directly from SPRG
>   powerpc/rtas: call enter_rtas in real-mode on 64-bit
>   powerpc/rtas: Leave MSR[RI] enabled over RTAS call
>   powerpc/rtas: replace rtas_call_unlocked with raw_rtas_call
>   powerpc/rtas: tidy __fetch_rtas_last_error
>   powerpc/rtas: Close theoretical memory leak
>   powerpc/rtas: enture rtas_call is called with MMU enabled
>   powerpc/rtas: Consolidate and improve checking for rtas callers
> 
>  arch/powerpc/include/asm/rtas.h              |   4 +-
>  arch/powerpc/kernel/Makefile                 |   2 +-
>  arch/powerpc/kernel/entry_32.S               |  49 ------
>  arch/powerpc/kernel/entry_64.S               | 150 -------------------
>  arch/powerpc/kernel/rtas.c                   | 132 +++++++++-------
>  arch/powerpc/kernel/rtas_entry.S             | 144 ++++++++++++++++++
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |   2 +-
>  arch/powerpc/platforms/pseries/ras.c         |   7 +-
>  arch/powerpc/xmon/xmon.c                     |   2 +-
>  9 files changed, 227 insertions(+), 265 deletions(-)
>  create mode 100644 arch/powerpc/kernel/rtas_entry.S
> 

