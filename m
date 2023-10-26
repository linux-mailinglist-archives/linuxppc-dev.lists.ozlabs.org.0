Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E87D8C66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 01:57:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RP+ZKokw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGjQp1dc2z3cV6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 10:57:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RP+ZKokw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGjPt0F0Fz300v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 10:56:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39QNqClS030143;
	Thu, 26 Oct 2023 23:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/eowwm7sGR1Su2c3+NJUCdr3wdyhLL5LnrXlO1eywNw=;
 b=RP+ZKokwDw1pRGhZYp416dcedV2ogMihMq0rwDgWt4/hvJo+PP5jO30rlWZxy9b/KccO
 NjYbGL8cAPMIOkPa6+aDjXFVBs5Iy02F3PC6iTi8yaZrkFT6Ox3wdwnLCq48lGuXLZYG
 t9xDzg/DXGvWV2eniEWfsQo9icfz3yrDBSWoo/swe8h7xtkWrnBzn8N7OV3N8nxFiFWL
 LGoeX2sNlq8om5nrT/ro+IYILeISMMk03Ax6gl/En9yZKvHcPpRoz5o2K2D1MsWvryM1
 1MH39LvUGrPcaECVvsK3SyQFE6p8TQppZ8xAUoHRdHyrYbNjVpX9vLJT3SE1gToAGtFN PA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u01yp09bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 23:56:39 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39QNswRS006218;
	Thu, 26 Oct 2023 23:56:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u01yp09ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 23:56:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39QLqpiP025414;
	Thu, 26 Oct 2023 23:56:38 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tywqrse2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 23:56:38 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39QNubQ76161084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Oct 2023 23:56:37 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51D8D5805B;
	Thu, 26 Oct 2023 23:56:37 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E47858058;
	Thu, 26 Oct 2023 23:56:37 +0000 (GMT)
Received: from localhost (unknown [9.61.173.119])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Oct 2023 23:56:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 00/10] powerpc/pseries: New character devices for
 system parameters and VPD
In-Reply-To: <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
References: <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
Date: Thu, 26 Oct 2023 18:56:36 -0500
Message-ID: <87v8at2b0r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z7csX9L19YTYZ-ZLoF7ZgCZivNHPLJjC
X-Proofpoint-ORIG-GUID: 1RAy1f1T60QMU5XzI7HNDR6m_9Yta6if
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_22,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=467
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310260209
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
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> I have made changes to librtas to prefer the new interfaces and
> verified that existing clients work correctly with the new code.

Unfortunately I made a mistake in testing this time and introduced a
boot-time oops:

BUG: Kernel NULL pointer dereference on read at 0x00000018
Faulting instruction address: 0xc00000000004223c
Oops: Kernel access of bad area, sig: 7 [#1]
LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.6.0-rc2+ #129
NIP:  c00000000004223c LR: c000000000042238 CTR: 0000000000000000
REGS: c000000002c579d0 TRAP: 0300   Tainted: G        W           (6.6.0-rc2+)
MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 28000284  XER: 00000000
CFAR: c000000000042008 DAR: 0000000000000018 DSISR: 00080000 IRQMASK: 3 
GPR00: c000000000042238 c000000002c57c70 c000000001f5eb00 0000000000000000 
GPR04: c00000000294cd08 0000000000000002 c000000002c579b4 0000000000000000 
GPR08: 0000000000000000 0000000000000002 c000000002c0da80 0000000000000000 
GPR12: 0000000000000000 c000000005e40000 0000000000000000 0000000002097728 
GPR16: 0000000000001111 0000000000000001 0000000002097b80 00000000020975b8 
GPR20: 00000000020976f0 00000000020974e8 00000000030feb00 00000000030feb00 
GPR24: 0000000000002008 0000000000000000 0000000000000001 c0000000028f3d70 
GPR28: 0000000002d31020 c000000002cac268 c000000002d31020 0000000000000000 
NIP [c00000000004223c] do_enter_rtas+0xcc/0x460
LR [c000000000042238] do_enter_rtas+0xc8/0x460
Call Trace:
[c000000002c57c70] [c000000000042238] do_enter_rtas+0xc8/0x460 (unreliable)
[c000000002c57cc0] [c000000000042e34] rtas_call+0x434/0x490
[c000000002c57d20] [c0000000000fd584] papr_sysparm_get+0xe4/0x230
[c000000002c57db0] [c0000000020267d0] pSeries_probe+0x2f0/0x5fc
[c000000002c57e80] [c00000000200a318] setup_arch+0x11c/0x524
[c000000002c57f10] [c00000000200418c] start_kernel+0xcc/0xc1c
[c000000002c57fe0] [c00000000000e788] start_here_common+0x1c/0x20

This was introduced by patch #4 "powerpc/rtas: Warn if per-function lock
isn't held": __do_enter_rtas() is now attempting token -> descriptor
lookups unconditionally, before the xarray for that has been initialized.

With that change reverted, the series tests OK.
