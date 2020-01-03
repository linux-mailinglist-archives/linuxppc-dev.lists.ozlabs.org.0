Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E872F12FF03
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2020 00:07:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47qLCs0XG6zDqD9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2020 10:07:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47qL9q6LC8zDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2020 10:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47qL9q3gKzz8tD8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2020 10:06:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47qL9q3S50z9sR8; Sat,  4 Jan 2020 10:06:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47qL9p4vv0z9sR1
 for <linuxppc-dev@ozlabs.org>; Sat,  4 Jan 2020 10:06:06 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 003N2Q9d117207
 for <linuxppc-dev@ozlabs.org>; Fri, 3 Jan 2020 18:06:04 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x88jgc0q5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 03 Jan 2020 18:06:04 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 3 Jan 2020 23:06:02 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Jan 2020 23:05:59 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 003N5uIO60162276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Jan 2020 23:05:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CCE84C04A;
 Fri,  3 Jan 2020 23:05:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59E974C044;
 Fri,  3 Jan 2020 23:05:54 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.213.131])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Jan 2020 23:05:54 +0000 (GMT)
Date: Fri, 3 Jan 2020 15:05:51 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [RFC 0/3] Integrate Support for self-save and determine
References: <20191204093255.11849-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204093255.11849-1-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20010323-0012-0000-0000-0000037A4FC4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010323-0013-0000-0000-000021B66463
Message-Id: <20200103230551.GB5562@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-03_06:2020-01-02,2020-01-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=777
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001030208
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: ego@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, pratik.sampat@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 04, 2019 at 03:02:52PM +0530, Pratik Rajesh Sampat wrote:
> Currently the stop-api supports a mechanism called as self-restore
> which allows us to restore the values of certain SPRs on wakeup from a
> deep-stop state to a desired value. To use this, the Kernel makes an
> OPAL call passing the PIR of the CPU, the SPR number and the value to
> which the SPR should be restored when that CPU wakes up from a deep
> stop state.
> 
> Recently, a new feature, named self-save has been enabled in the
> stop-api, which is an alternative mechanism to do the same, except
> that self-save will save the current content of the SPR before
> entering a deep stop state and also restore the content back on
> waking up from a deep stop state.
> 
> This patch series aims at introducing and leveraging the self-save feature in
> the kernel.
> 
> Now, as the kernel has a choice to prefer one mode over the other and
> there can be registers in both the save/restore SPR list which are sent
> from the device tree, a new interface has been defined for the seamless
> handing of the modes for each SPR.
> 
> A list of preferred SPRs are maintained in the kernel which contains two
> properties:
> 1. supported_mode: Helps in identifying if it strictly supports self
>                    save or restore or both.

Will be good to capture the information that, 'supported_mode' gets 
initialized using the information from the device tree.

> 2. preferred_mode: Calls out what mode is preferred for each SPR. It
>                    could be strictly self save or restore, or it can also
>                    determine the preference of  mode over the other if both
>                    are present by encapsulating the other in bitmask from
>                    LSB to MSB.

and 'preferred_mode'  is statically initialized.

> Below is a table to show the Scenario::Consequence when the self save and
> self restore modes are available or disabled in different combinations as
> perceived from the device tree thus giving complete backwards compatibly
> regardless of an older firmware running a newer kernel or vise-versa.
> 
> SR = Self restore; SS = Self save
> 
> .-----------------------------------.----------------------------------------.
> |             Scenario              |                Consequence             |
> :-----------------------------------+----------------------------------------:
> | Legacy Firmware. No SS or SR node | Self restore is called for all         |
> |                                   | supported SPRs                         |
> :-----------------------------------+----------------------------------------:
> | SR: !active SS: !active           | Deep stop states disabled              |
> :-----------------------------------+----------------------------------------:
> | SR: active SS: !active            | Self restore is called for all         |
> |                                   | supported SPRs                         |
> :-----------------------------------+----------------------------------------:
> | SR: active SS: active             | Goes through the preferences for each  |
> |                                   | SPR and executes of the modes          |
> |                                   | accordingly. Currently, Self restore is|
> |                                   | called for all the SPRs except PSSCR   |
> |                                   | which is self saved                    |
> :-----------------------------------+----------------------------------------:
> | SR: active(only HID0) SS: active  | Self save called for all supported     |
> |                                   | registers expect HID0 (as HID0 cannot  |
> |                                   | be self saved currently)               |

Not clear, how this will be conveyed to the hypervisor? Through the
device tree or through some other means?


> :-----------------------------------+----------------------------------------:
> | SR: !active SS: active            | currently will disable deep states as  |
> |                                   | HID0 is needed to be self restored and |
> |                                   | cannot be self saved                   |
> '-----------------------------------'----------------------------------------'
> 
> Pratik Rajesh Sampat (3):
>   powerpc/powernv: Interface to define support and preference for a SPR
>   powerpc/powernv: Introduce Self save support
>   powerpc/powernv: Parse device tree, population of SPR support
> 
>  arch/powerpc/include/asm/opal-api.h        |   3 +-
>  arch/powerpc/include/asm/opal.h            |   1 +
>  arch/powerpc/platforms/powernv/idle.c      | 431 ++++++++++++++++++---
>  arch/powerpc/platforms/powernv/opal-call.c |   1 +
>  4 files changed, 379 insertions(+), 57 deletions(-)
> 
> -- 
> 2.21.0

-- 
Ram Pai

