Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA87CC96E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 19:04:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lLNYqjkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S90hZ01mJz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 04:04:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lLNYqjkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S90gd56Htz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 04:03:57 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HH3fCI029546;
	Tue, 17 Oct 2023 17:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2k4pLkW8BNteMWHIaDgeVwrFtmc62ZMJQQWmLxN/sWo=;
 b=lLNYqjkvD4ZeXY8rRbS2UuU3+ezRXmzRO+ZJOe4Jm5DQfaE4iQj0YaxZRF4bSyM/9hv+
 nMkMeVdMIA0I9VrHcB8+RidShuPvckXJRMtUqFe01ADX5jkHRuiK6mag4mnRMAQTYk/X
 LAcjRg+U3y42zMNc2Mopv5Lkdvs3xoYvYosH5vZFsKSzzmAF65FLIesGUAWvd7c1Shs4
 VjaD2lDepoXaG3e/M3XosI+jqoHe52AzX3dVBEWCBmYqcrc4YwnFrLJtHOia9bSoqyRw
 HO/2vOnbLseAPaeD0AEQwGUDSsrUUe8uZr0ODLiK4FwQIdvCf8cv/+ACuRyZH8kzqbZj gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsx2aggen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 17:03:49 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39HH3m6Q030128;
	Tue, 17 Oct 2023 17:03:48 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsx2agg89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 17:03:48 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39HFq21X019881;
	Tue, 17 Oct 2023 17:00:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr811hvbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 17:00:06 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39HH04Se46793180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 17:00:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CFBD2004F;
	Tue, 17 Oct 2023 17:00:04 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FEF920040;
	Tue, 17 Oct 2023 17:00:03 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.78.224])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 17:00:03 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] powerpc/64s/radix: Don't warn on copros in
 radix__tlb_flush()
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20231017121527.1574104-1-mpe@ellerman.id.au>
Date: Tue, 17 Oct 2023 22:29:52 +0530
Message-Id: <EA1D2491-9113-4395-A849-EF1909CEE8C8@linux.ibm.com>
References: <20231017121527.1574104-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yBNk3Xn-nHSZyhXHD0-lB_bz9qd7aCkL
X-Proofpoint-GUID: uHUq-bDHyIzJh9Tj9tqC9QQ_0i9jDobu
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=462 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170144
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 17-Oct-2023, at 5:45=E2=80=AFPM, Michael Ellerman <mpe@ellerman.id.au>=
 wrote:
>=20
> Sachin reported a warning when running the inject-ra-err selftest:
>=20
>  # selftests: powerpc/mce: inject-ra-err
>  Disabling lock debugging due to kernel taint
>  MCE: CPU19: machine check (Severe)  Real address Load/Store (foreign/con=
trol memory) [Not recovered]
>  MCE: CPU19: PID: 5254 Comm: inject-ra-err NIP: [0000000010000e48]
>  MCE: CPU19: Initiator CPU
>  MCE: CPU19: Unknown
>  ------------[ cut here ]------------
>  WARNING: CPU: 19 PID: 5254 at arch/powerpc/mm/book3s64/radix_tlb.c:1221 =
radix__tlb_flush+0x160/0x180
>  CPU: 19 PID: 5254 Comm: inject-ra-err Kdump: loaded Tainted: G   M      =
  E      6.6.0-rc3-00055-g9ed22ae6be81 #4
>  Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW10=
30.20 (NH1030_058) hv:phyp pSeries
>  ...
>  NIP radix__tlb_flush+0x160/0x180
>  LR  radix__tlb_flush+0x104/0x180
>  Call Trace:
>    radix__tlb_flush+0xf4/0x180 (unreliable)
>    tlb_finish_mmu+0x15c/0x1e0
>    exit_mmap+0x1a0/0x510
>    __mmput+0x60/0x1e0
>    exit_mm+0xdc/0x170
>    do_exit+0x2bc/0x5a0
>    do_group_exit+0x4c/0xc0
>    sys_exit_group+0x28/0x30
>    system_call_exception+0x138/0x330
>    system_call_vectored_common+0x15c/0x2ec
>=20
> And bisected it to commit e43c0a0c3c28 ("powerpc/64s/radix: combine
> final TLB flush and lazy tlb mm shootdown IPIs"), which added a warning
> in radix__tlb_flush() if mm->context.copros is still elevated.
>=20
> However it's possible for the copros count to be elevated if a process
> exits without first closing file descriptors that are associated with a
> copro, eg. VAS.
>=20
> If the process exits with a VAS file still open, the release callback
> is queued up for exit_task_work() via:
>  exit_files()
>    put_files_struct()
>      close_files()
>        filp_close()
>          fput()
>=20
> And called via:
>  exit_task_work()
>    ____fput()
>      __fput()
>        file->f_op->release(inode, file)
>          coproc_release()
>            vas_user_win_ops->close_win()
>              vas_deallocate_window()
>                mm_context_remove_vas_window()
>                  mm_context_remove_copro()
>=20
> But that is after exit_mm() has been called from do_exit() and triggered
> the warning.
>=20
> Fix it by dropping the warning, and always calling __flush_all_mm().
>=20
> In the normal case of no copros, that will result in a call to
> _tlbiel_pid(mm->context.id, RIC_FLUSH_ALL) just as the current code
> does.
>=20
> If the copros count is elevated then it will cause a global flush, which
> should flush translations from any copros. Note that the process table
> entry was cleared in arch_exit_mmap(), so copros should not be able to
> fetch any new translations.
>=20
> Fixes: e43c0a0c3c28 ("powerpc/64s/radix: combine final TLB flush and lazy=
 tlb mm shootdown IPIs")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Closes: https://lore.kernel.org/all/A8E52547-4BF1-47CE-8AEA-BC5A9D7E3567@=
linux.ibm.com/
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Thanks for the fix. This fixes the reported problem.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
