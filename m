Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 015242C95F5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 04:43:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClScn1w2BzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 14:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F0uEOI9N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClSb170bkzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 14:42:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B13Wvrx054002; Mon, 30 Nov 2020 22:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=rDL6Q+ZWgVEVbB1cLt7qNO7Fvg9CQeTcerjjefISyUY=;
 b=F0uEOI9N6AmgsOtCaIRwmsy9AtvZJt4s1ZwWOT7HYUjWNHWO6Y2oWNkaxwrDzQneSqEI
 bFlVju6f0e2Y1EZwZoK7I4niNoJhEWgStKeZ1Rah+67EUd8+pYFImhul5yvSyvlLBx6X
 ijLtvSAMZNp+d/qNBML2aNDE2JBzhKCZazJ6WDoE7XAJ0gjLuMhkkFtueUmufIksemeu
 i9Nmqp0dwafbXkfuS0kKxJaWZMPSlsCtlfA88R33jmUv7HxM1MFwpvYn6IHeeHAP6Ubw
 hVfthEphTNxNRiytj4rSTppl+bb48w0KC4XippRonK4Hz6lZhSfNZhKy7EUW/DyiEQJW bw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355dr3gjdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 22:42:00 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B13bKYL015032;
 Tue, 1 Dec 2020 03:41:59 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 353e68vxr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 03:41:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B13fwTl12124854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Dec 2020 03:41:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B6B77805E;
 Tue,  1 Dec 2020 03:41:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D617D7805C;
 Tue,  1 Dec 2020 03:41:56 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.210.210])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Dec 2020 03:41:56 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v7 00/22] Kernel userspace access/execution prevention
 with hash translation
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
Date: Tue, 01 Dec 2020 09:11:53 +0530
Message-ID: <87lfeip4zi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_12:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010023
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> This patch series implements KUAP and KUEP with hash translation mode using
> memory keys. The kernel now uses memory protection key 3 to control access
> to the kernel. Kernel page table entries are now configured with key 3.
> Access to locations configured with any other key value is denied when in
> kernel mode (MSR_PR=0). This includes userspace which is by default configured
> with key 0.
>
> null-syscall benchmark results:
>
> With smap/smep disabled:
> Without patch:
> 	845.29 ns    2451.44 cycles
> With patch series:
> 	858.38 ns    2489.30 cycles
>
> With smap/smep enabled:
> Without patch:
> 	NA
> With patch series:
> 	1021.51 ns    2962.44 cycles
>
> Changes from v6:
> * Address review comments
> * Rename MMU FTR defines
>
> Changes from v5:
> * Rework the patch based on suggestion from Michael to avoid the
>   usage of CONFIG_PPC_PKEY on BOOKE platforms. 
>
> Changes from v4:
> * Repost with other pkey related changes split out as a separate series.
> * Improve null-syscall benchmark by optimizing SPRN save and restore.
>
> Changes from v3:
> * Fix build error reported by kernel test robot <lkp@intel.com>
>
> Changes from v2:
> * Rebase to the latest kernel.
> * Fixed a bug with disabling KUEP/KUAP on kernel command line
> * Added a patch to make kup key dynamic.
>
> Changes from V1:
> * Rebased on latest kernel

I disabled kernel debug config options based on request from Nick
Piggin. null_syscall benchmark numbers after that.

Full series/all patches applied
radix: 
    277.51 ns    1054.59 cycles
hash 
    348.24 ns    1323.32 cycles
hash nosmap nosmep
    280.39 ns    1065.47 cycles

Patch 22 dropped (no optimization)
hash
    341.87 ns    1326.64 cycles
hash nosmap nosmep
    312.74 ns    1188.42 cycles

Without patches:
radix:
    281.31 ns    1068.98 cycles
hash (same as below)
    286.37 ns    1088.21 cycles
hash nosmap nosmep
    286.44 ns    1088.46 cycles
