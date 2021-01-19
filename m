Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC02FAE66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 02:48:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKWl45TNRzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 12:48:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iKN8q6SU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKWjN4WfLzDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 12:46:47 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J1WoFp013781; Mon, 18 Jan 2021 20:46:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=VkwXbtiycoBLpXv+lHsNDBbKhMWzZCm66uRFB9QdKbw=;
 b=iKN8q6SU/Bnv6jYZj+R86xc2iTFCE4cQYV4hY5RJ1suAC02QQXKTBYdB3ewVcdq+rE+W
 FqYWKQ6OGlj66Mf71p0kkOHWdsf+ugnDUhZ5aWq9UvBRQXMOQdHhXfDELn/c+TETZmSf
 Du+8xSzMPeL8rymV3WuQCgwubwwCTZqQm4xYLcG2z0D8Ggz9EPinYYaiUQI9vIaxV0B6
 g/yUVChOb4JMfW7bnTVOAaxJH66+a/wO0jD4atjYzvOdZGdFR5sM5zal7PTQy2M4F8ln
 lP4z7CqJVIIglD4x0h3JQZGrS68VLg0FX2Cmhsd0iULnFkNO9k8yBwCKsKm6qStHUAwM ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365n4ks0nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 20:46:45 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10J1XNkm017143;
 Mon, 18 Jan 2021 20:46:44 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365n4ks0ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 20:46:44 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J1fXVe030200;
 Tue, 19 Jan 2021 01:46:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 363qs8ty6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 01:46:44 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J1khgV20840940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 01:46:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E80FC6055;
 Tue, 19 Jan 2021 01:46:43 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8493C6057;
 Tue, 19 Jan 2021 01:46:42 +0000 (GMT)
Received: from localhost (unknown [9.211.51.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 19 Jan 2021 01:46:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 1/4] KVM: PPC: Book3S HV: Remove support for running HPT
 guest on RPT host without mixed mode support
In-Reply-To: <20210118062809.1430920-2-npiggin@gmail.com>
References: <20210118062809.1430920-1-npiggin@gmail.com>
 <20210118062809.1430920-2-npiggin@gmail.com>
Date: Mon, 18 Jan 2021 22:46:40 -0300
Message-ID: <87czy1bsvz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_15:2021-01-18,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190007
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Resending because the previous got spam-filtered:

Nicholas Piggin <npiggin@gmail.com> writes:

> This reverts much of commit c01015091a770 ("KVM: PPC: Book3S HV: Run HPT
> guests on POWER9 radix hosts"), which was required to run HPT guests on
> RPT hosts on early POWER9 CPUs without support for "mixed mode", which
> meant the host could not run with MMU on while guests were running.
>
> This code has some corner case bugs, e.g., when the guest hits a machine
> check or HMI the primary locks up waiting for secondaries to switch LPCR
> to host, which they never do. This could all be fixed in software, but
> most CPUs in production have mixed mode support, and those that don't
> are believed to be all in installations that don't use this capability.
> So simplify things and remove support.

With this patch in a DD2.1 machine + indep_threads_mode=N +
disable_radix, QEMU aborts and dumps registers, is that intended?

Could we use the 'no_mixing_hpt_and_radix' logic in check_extension to
advertise only KVM_CAP_PPC_MMU_RADIX to the guest via OV5 so it doesn't
try to run hash?

For instance, if I hack QEMU's 'spapr_dt_ov5_platform_support' from
OV5_MMU_BOTH to OV5_MMU_RADIX_300 then it boots succesfuly, but the
guest turns into radix, due to this code in prom_init:

prom_parse_mmu_model:

case OV5_FEAT(OV5_MMU_RADIX): /* Only Radix */
	prom_debug("MMU - radix only\n");
	if (prom_radix_disable) {
		/*
		 * If we __have__ to do radix, we're better off ignoring
		 * the command line rather than not booting.
		 */
		prom_printf("WARNING: Ignoring cmdline option disable_radix\n");
	}
	support->radix_mmu = true;
	break;

It seems we could explicitly say that the host does not support hash and
that would align with the above code.

>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
