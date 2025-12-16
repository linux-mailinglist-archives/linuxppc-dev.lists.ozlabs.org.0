Return-Path: <linuxppc-dev+bounces-14818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4DCC3D60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0jc0KBjz2yF1;
	Wed, 17 Dec 2025 02:10:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765897827;
	cv=none; b=IqYXQtKwlyETeICf6pNaAKikKnq3hCmyP6wiWZHWqycPnk2tcYB0TY4cfapkGxKBRZtK2P2QGuO5eiBLtIIU3u/FLb241zBlyCHiLAjeJNMoqxWOcJVxe4IRPWkXIjxCqsJ4HqfJrN2r/anX0zutxBpLhsRmWWII5X1LQNN9laeuy1DbNQ/5CWMuKMaohp2OUz1VNAe3cyCKRZu1ztIk0XwDUTMbzX5VBpdzhvixZxrQn9xGXcCzGB0edX2SlkEIOmqO7JWeaYR801n63CzzDuLzYLaZN7fLpe3j+RCKG6zD5+gWiY7JWHCinVHHD8HCEoMVCn1grD8UqgTB9V24uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765897827; c=relaxed/relaxed;
	bh=/XxH44KJPgJiyrOFdcSENFqCga6Ai7i4xYbrPJzgoRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgjChxoDBF6aZIGMGYJq1aNmaLLq2FxL4poLfrdWHV5CWhLCgOLDUG3IPsi4uj8pAwTD8dTazDgccmkIN/IDZb5fBLuNiO/2Og51TrghihrTBawPx+p1jQCskq/OtclOZyGNVsaDq3aFed/7nIgCnySlqp2MoY9pCAgt+RldhC0OiX7+xJy8ut9zLndlWifTkNcffeC1/Rsq3fRjLUQTzARaxDNG75fLSrLr09xNPwD3OtpRgo0JBGaREuCzKbBemCAWXsbwrfiW3tFqW47k3120f5kK7eAEoe7w6E9chuSN/JBtnqgHEp+32W7vN1/N/3p1M1MX8aoUoHlqxcv2ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BR7O2USy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BR7O2USy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0jb2J7pz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:10:27 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGD16nG027280;
	Tue, 16 Dec 2025 15:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/XxH44
	KJPgJiyrOFdcSENFqCga6Ai7i4xYbrPJzgoRo=; b=BR7O2USy/L4wxzraO7KHBM
	5gBa+2hNCMe+8DxYmOr6z0qLu6B7c24ThWW3Gwcm1DheG7XhTKlqt5GP3m341b2K
	MNMibiH8T1CXvOgIF+2cP5xMKxh7AbIjXzZmUwGRdYsD47TnxBSxv6Ls0pmGWGjx
	7HFLQa7nDRYWcfqtJnCK9AbpMUbFA7q8enQ9Kx5TfM9hOqd9VY1t0ZK3+w8Bfoxu
	KlMgOqZlbFFWcN7aohtBk5rsORjeP8NtgPH1pEHGm2p6adJWtkhvZ0MkPNcwfc/z
	bjx4gLMNvdGwnwLmVDj9okLpt6C17+8rxWkWLkcKevdBamGqyP3JrvYf8gn9lIyw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8fv65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:10:06 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGE0ikj026912;
	Tue, 16 Dec 2025 15:10:05 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8fv61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:10:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCgMEm026803;
	Tue, 16 Dec 2025 15:10:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfsd1a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:10:04 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGFA0IC50659824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:10:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59B282004B;
	Tue, 16 Dec 2025 15:10:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 422BC20040;
	Tue, 16 Dec 2025 15:09:54 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 15:09:54 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:39:50 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <e6xsjevzubhemxrajz7kz4t2w3fwtkmybr6zd2a4v3qgf6y7kl@xqf4tddmu7cs>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-9-mkchauras@linux.ibm.com>
 <065e3421-0ae1-4e1b-8384-2157d2c1daf9@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <065e3421-0ae1-4e1b-8384-2157d2c1daf9@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfX/jvk/0y6Euc9
 P5S6YwTXFSXixChQ0KZuKcgUKU8/u0kJRxX0aj65MrGo2XnJcbwft8eLtF12lQZIHD754LVmC2E
 ycNAUgPutof1tjoBhV3UaKi3U9DJCqT9buy/YeUlU0XS3npupCd8aEPSir/dNtQr11Z6SAOunxY
 H0L8MOgZG8TRVaxCwqX1haJO/xmkuJ77/knHtL5lOiatUY8w0MCwdHKBXNO7TcI24gcIGxI3DtS
 gAsB+7djBZgza+apY/ORg9cELqSJesNuJxui+cp6cMqGXmdPuzyxYId2aK6EVbyRzmV4yMrxbON
 GX7f74a0+b54EZEKm7m26L513eIGEmX3Ix3ABBnvWF24HeMiDP15EI0MlibKXuM8x5TIZYR9J2D
 Y6Ahj6o2kml7Em/sr+lQ0I7XKtmUhw==
X-Proofpoint-GUID: nfekFfDWuOXCm8C5btsPh7yqbx5ilzNV
X-Proofpoint-ORIG-GUID: XB6u41WJt3xaD5PWqJE-mu0msJQoxLjE
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=6941764e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Y2G6T3UIsoidgfetnFMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 07:41:11AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Convert the PowerPC syscall entry and exit paths to use the generic
> > entry/exit framework by selecting GENERIC_ENTRY and integrating with
> > the common syscall handling routines.
> > 
> > This change transitions PowerPC away from its custom syscall entry and
> > exit code to use the generic helpers such as:
> >   - syscall_enter_from_user_mode()
> >   - syscall_exit_to_user_mode()
> > 
> > As part of this migration:
> >   - The architecture now selects GENERIC_ENTRY in Kconfig.
> >   - Old tracing, seccomp, and audit handling in ptrace.c is removed in
> >     favor of generic entry infrastructure.
> >   - interrupt.c and syscall.c are simplified to delegate context
> >     management and user exit handling to the generic entry path.
> >   - The new pt_regs field `exit_flags` introduced earlier is now used
> >     to carry per-syscall exit state flags (e.g. _TIF_RESTOREALL).
> > 
> > This aligns PowerPC with the common entry code used by other
> > architectures and reduces duplicated logic around syscall tracing,
> > context tracking, and signal handling.
> > 
> > The performance benchmarks from perf bench basic syscall are below:
> > 
> > perf bench syscall usec/op
> > 
> > | Test            | With Patch | Without Patch | % Change |
> > | --------------- | ---------- | ------------- | -------- |
> > | getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
> > | getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
> > | fork usec/op    | 833.986    | 814.809       | +2.35%   |
> > | execve usec/op  | 360.939    | 365.168       | -1.16%   |
> > 
> > perf bench syscall ops/sec
> > 
> > | Test            | With Patch | Without Patch | % Change |
> > | --------------- | ---------- | ------------- | -------- |
> > | getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
> > | getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
> > | fork ops/sec    | 1,199      | 1,227         | -2.28%   |
> > | execve ops/sec  | 2,770      | 2,738         | +1.16%   |
> 
> I get about 2% degradation on powerpc 8xx, and it is quite stable over time
> when repeating the test.
> 
> 'perf bench syscall all' on powerpc 8xx (usec per op):
> 
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid usec/op | 2.63       | 2.63          | ~ 0%     |
> | getpgid usec/op | 2.26       | 2.22          | +2,80%   |
> | fork usec/op    | 15300      | 15000         | +2,00%   |
> | execve usec/op  | 45700      | 45200         | +1.10%   |
> 
Ohk,
Do you have any idea where we might be loosing performance? I don't have
an 8xx chip so i am not sure where to look.

Thanks for testing it out.

Regards,
Mukesh
> Christophe

