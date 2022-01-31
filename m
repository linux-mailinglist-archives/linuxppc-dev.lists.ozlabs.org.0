Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF544A4D57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 18:35:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnZwJ0mY2z3cB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 04:35:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=czGqztZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=czGqztZb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnZvb0DMxz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 04:35:06 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VGcWkY010516
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=qJ7vUMRZwXLhIDtvWywpJ5nSnkRVsNR2r7cw/i5oryM=;
 b=czGqztZbqhGQoM/xqzTvBzxnBlH6vX9lAhHCBH20rPaaKl0vlMb+fsudHEmcP+ZtOxLu
 6at4/u9DygXMwMdl/1HWMNLIsyIipfzvnzBotHeq9cJxA5u3RJ594kPmPFErPWAnf9g/
 2smyI3o1hbAakStJYBc5EdYcj2/xrDciUoTmzSaxWRIChQfCbw0Qsmb45offXE8exlRm
 N6K7Fs/N723N+9BXHU+NMuuDHxZZDQ2F99f7Y/OKFOE+Z/rYYaYqLlV76RGwnu+gEKc/
 ZhhhyM/nJLav+CCoPLsREmCzNrsxDp9FyAiT010jYPuG2MArcB2ZHiPwEDZxiMuLQAn/ gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxe3q0ujp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:35:04 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VH48L7020033
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 17:35:04 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxe3q0ujc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:35:04 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VHHegJ003341;
 Mon, 31 Jan 2022 17:35:03 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3dvw7703te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:35:03 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VHZ1m129229406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 17:35:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D836B112067;
 Mon, 31 Jan 2022 17:35:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D000B11206B;
 Mon, 31 Jan 2022 17:35:00 +0000 (GMT)
Received: from localhost (unknown [9.211.96.126])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 31 Jan 2022 17:35:00 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] KVM: PPC: Book3S PR: Disable SCV when AIL could
 be disabled
In-Reply-To: <20220129072511.105523-2-npiggin@gmail.com>
References: <20220129072511.105523-1-npiggin@gmail.com>
 <20220129072511.105523-2-npiggin@gmail.com>
Date: Mon, 31 Jan 2022 14:34:57 -0300
Message-ID: <87zgnbdd1a.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9msQuUwFkNrruEJO3PBpJbvOmBG7HQj4
X-Proofpoint-ORIG-GUID: Agdwfg1S-EdGD1wt5seucfLkYij9aKUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310114
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> PR KVM does not support running with AIL enabled, and SCV does is not
> supported with AIL disabled. Fix this by ensuring the SCV facility is
> disabled with FSCR while a CPU could be running with AIL=0.
>
> The PowerNV host supports disabling AIL on a per-CPU basis, so SCV just
> needs to be disabled when a vCPU is being run.
>
> The pSeries machine can only switch AIL on a system-wide basis, so it
> must disable SCV support at boot if the configuration can potentially
> run a PR KVM guest.
>
> Also ensure a the FSCR[SCV] bit can not be enabled when emulating
> mtFSCR for the guest.
>
> SCV is not emulated for the PR guest at the moment, this just fixes the
> host crashes.
>
> Alternatives considered and rejected:
> - SCV support can not be disabled by PR KVM after boot, because it is
>   advertised to userspace with HWCAP.
> - AIL can not be disabled on a per-CPU basis. At least when running on
>   pseries it is a per-LPAR setting.
> - Support for real-mode SCV vectors will not be added because they are
>   at 0x17000 so making such a large fixed head space causes immediate
>   value limits to be exceeded, requiring a lot rework and more code.
> - Disabling SCV for any PR KVM possible kernel will cause a slowdown
>   when not using PR KVM.
> - A boot time option to disable SCV to use PR KVM is user-hostile.
> - System call instruction emulation for SCV facility unavailable
>   instructions is too complex and old emulation code was subtly broken
>   and removed.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S |  4 ++++
>  arch/powerpc/kernel/setup_64.c       | 28 ++++++++++++++++++++++++++++
>  arch/powerpc/kvm/Kconfig             |  9 +++++++++
>  arch/powerpc/kvm/book3s_pr.c         | 20 ++++++++++++++------
>  4 files changed, 55 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 55caeee37c08..b66dd6f775a4 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -809,6 +809,10 @@ __start_interrupts:
>   * - MSR_EE|MSR_RI is clear (no reentrant exceptions)
>   * - Standard kernel environment is set up (stack, paca, etc)
>   *
> + * KVM:
> + * These interrupts do not elevate HV 0->1, so HV is not involved. PR KVM
> + * ensures that FSCR[SCV] is disabled whenever it has to force AIL off.
> + *
>   * Call convention:
>   *
>   * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index be8577ac9397..7f7da641e551 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -197,6 +197,34 @@ static void __init configure_exceptions(void)
>
>  	/* Under a PAPR hypervisor, we need hypercalls */
>  	if (firmware_has_feature(FW_FEATURE_SET_MODE)) {
> +		/*
> +		 * - PR KVM does not support AIL mode interrupts in the host
> +		 *   while a PR guest is running.
> +		 *
> +		 * - SCV system call interrupt vectors are only implemented for
> +		 *   AIL mode interrupts.
> +		 *
> +		 * - On pseries, AIL mode can only be enabled and disabled
> +		 *   system-wide so when a PR VM is created on a pseries host,
> +		 *   all CPUs of the host are set to AIL=0 mode.
> +		 *
> +		 * - Therefore host CPUs must not execute scv while a PR VM
> +		 *   exists.
> +		 *
> +		 * - SCV support can not be disabled dynamically because the
> +		 *   feature is advertised to host userspace. Disabling the
> +		 *   facility and emulating it would be possible but is not
> +		 *   implemented.
> +		 *
> +		 * - So SCV support is blanket diabled if PR KVM could possibly

disabled

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

