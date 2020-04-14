Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D34411A7856
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 12:22:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491hPV561PzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 20:22:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491hML3m03zDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 20:20:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 491hML0LPNz9B3v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 20:20:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 491hMK6sDHz9sSG; Tue, 14 Apr 2020 20:20:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 491hMK3Vzbz9sQx
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Apr 2020 20:20:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EA35YJ060749; Tue, 14 Apr 2020 06:20:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cwm05pdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 06:20:22 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03EA3etk063999;
 Tue, 14 Apr 2020 06:20:21 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cwm05pcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 06:20:21 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EAFWfA003461;
 Tue, 14 Apr 2020 10:20:20 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 30b5h67qs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 10:20:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EAKJ8n52101384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 10:20:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AFAAC6059;
 Tue, 14 Apr 2020 10:20:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0C80C6055;
 Tue, 14 Apr 2020 10:20:18 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.109.81])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Apr 2020 10:20:18 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id F27BF2E301A; Tue, 14 Apr 2020 12:41:49 +0530 (IST)
Date: Tue, 14 Apr 2020 12:41:49 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v6 0/3] powerpc/powernv: Introduce interface for
 self-restore support
Message-ID: <20200414071149.GD24277@in.ibm.com>
References: <20200326071034.12838-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326071034.12838-1-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004140083
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Pratik,

On Thu, Mar 26, 2020 at 12:40:31PM +0530, Pratik Rajesh Sampat wrote:
> v5: https://lkml.org/lkml/2020/3/17/944
> Changelog
> v5-->v6
> 1. Updated background, motivation and illuminated potential design
> choices
> 2. Re-organization of patch-set
>   a. Split introducing preference for optimization from 1/1 to patch 3/3
>   b. Merge introducing self-save API and parsing the device-tree
>   c. Introduce a supported mode called KERNEL_SAVE_RESTORE which
>      outlines and makes kernel supported SPRs for save-restore more
>      explicit
> 
[..snip..]

> Presenting the design choices in front of us:
> 
> Design-Choice 1:
> ----------------
> A simple implementation is to just replace self-restore calls with
> self-save as it is direct super-set.
> 
> Pros:
> A simple design, quick to implement
> 
> 
> Cons:
> * Breaks backward compatibility. Self-restore has historically been
>   supported in the firmware and an old firmware running on an new
>   kernel will be incompatible and deep stop states will be cut.
> * Furthermore, critical SPRs which need to be restored
>   before 0x100 vector like HID0 are not supported by self-save.
> 
> Design-Choice 2:
> ----------------
> Advertise both self-restore and self-save from OPAL including the set
> of registers that each support. The kernel can then choose which API
> to go with.
> For the sake of simplicity, in case both modes are supported for an
> SPR by default self-save would be called for it.
> 
> Pros:
> * Backwards compatible
> 
> Cons:
> Overhead in parsing device tree with the SPR list
> 
> Possible optimization with Approach2:
> -------------------------------------
> There are SPRs whose values don't tend to change over time and invoking
> self-save on them, where the values are gotten each time may turn out to
> be inefficient. In that case calling a self-restore where passing the
> value makes more sense as, if the value is same, the memory location
> is not updated.
> SPRs that dont change are as follows:
> SPRN_HSPRG0,
> SPRN_LPCR,
> SPRN_PTCR,
> SPRN_HMEER,
> SPRN_HID0,

We can just pick self-save wherever available and fallback to
self-restore when self-save support is not avaiable for any SPR.
The optimization that you mention here can be revisited if the
additional latency due to self-save becomes observable (Note that both
stop4 and stop5 have wakeup latency between 200-500us).

> 
> The values of PSSCR and MSR change at runtime and hence, the kernel
> cannot determine during boot time what their values will be before
> entering a particular deep-stop state.
> 
> Therefore, a preference based interface is introduced for choosing
> between self-save or self-restore between for each SPR.
> The per-SPR preference is only a refinement of
> approach 2 purely for performance reasons. It can be dropped if the
> complexity is not deemed worth the returns.
> 
> Patches Organization
> ====================
> Design Choice 2 has been chosen as an implementation to demonstrate in
> the patch series.
> 
> Patch1:
> Devises an interface which lists all the interested SPRs, along with
> highlighting the support of mode.
> It is an isomorphic patch to replicate the functionality of the older
> self-restore firmware for the new interface
> 
> Patch2:
> Introduces the self-save API and leverages upon the struct interface to
> add another supported mode in the mix of saving and restoring. It also
> enforces that in case both modes are supported self-save is chosen over
> self-restore
> 
> The commit also parses the device-tree and populate support for
> self-save and self-restore in the supported mask
> 
> Patch3:
> Introduce an optimization to allow preference to choose between one more
> over the one when both both modes are supported. This optimization can
> allow for better performance for the SPRs that don't change in value and
> hence self-restore is a better alternative, and in cases when it is
> known for values to change self-save is more convenient.
> 
> Pratik Rajesh Sampat (3):
>   powerpc/powernv: Introduce interface for self-restore support
>   powerpc/powernv: Introduce support and parsing for self-save API
>   powerpc/powernv: Preference optimization for SPRs with constant values
> 
>  .../bindings/powerpc/opal/power-mgt.txt       |  18 +
>  arch/powerpc/include/asm/opal-api.h           |   3 +-
>  arch/powerpc/include/asm/opal.h               |   1 +
>  arch/powerpc/platforms/powernv/idle.c         | 385 +++++++++++++++---
>  arch/powerpc/platforms/powernv/opal-call.c    |   1 +
>  5 files changed, 351 insertions(+), 57 deletions(-)
> 
> -- 
> 2.17.1
> 
