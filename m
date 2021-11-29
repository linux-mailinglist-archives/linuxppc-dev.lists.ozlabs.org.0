Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590F460FE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 09:15:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2dT23yMLz3c90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 19:15:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lx5KEXtg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2dSJ6fK7z304n
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 19:14:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lx5KEXtg; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J2dSJ39V3z4xPv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 19:14:56 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J2dSJ36lYz4xR9; Mon, 29 Nov 2021 19:14:56 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lx5KEXtg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J2dSH6LQPz4xPv
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 19:14:54 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AT7HORb016528
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 08:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=zHGVCvcua4AHlCl6lcHUMJBfuulHnhm9MxTthmBvYVU=;
 b=lx5KEXtgdLLtCwh8Pez7+2vSpEiAsrhsWwO+467PmOJWhbkkI0HdJcPKOJLscrAHaZ+i
 tjCDlDEJwqEL96eIH2EiG7VNwWJrm0YQz0AOwUSK+LJEf/MI+M6ee0IDLVF/WtuBbbL0
 k10aovsBWSHQzudKkvhAiWrRpMXu1EYW7F61zij/+TKLTT6PWdYsC87iysRRhV6H/Bjj
 fD07PfwVySCyo3LTf0BEkwWvTdocSCJ1FehQVH+zX1CqPKOC1lr9AH7/75tNlhKrf2sB
 5KTiUY5EfG2FeIaubvQkgHXIDSKzuU8rohEjXZdTah1Cke1vSEN5+0QHXk2xfbEuR6wK Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmtbf941h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 08:14:52 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AT7n3RQ039423
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Nov 2021 08:14:51 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cmtbf9410-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 08:14:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AT88I9W031423;
 Mon, 29 Nov 2021 08:14:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3ckca91bne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 08:14:49 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AT8ElYh10355052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 08:14:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C7FF4C058;
 Mon, 29 Nov 2021 08:14:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B74AD4C050;
 Mon, 29 Nov 2021 08:14:46 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.16.143])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 29 Nov 2021 08:14:46 +0000 (GMT)
Date: Mon, 29 Nov 2021 13:44:43 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/eeh: Delay slot presence check once driver is
 notified about the pci error.
Message-ID: <20211129081443.fbj6vb77bmmfnpfi@in.ibm.com>
References: <163767273634.1368569.7327743414665595326.stgit@jupiter>
 <CAOSf1CFRY=VsGenpwqVu_VOUYuBheVUEoX2M_h-XSHk6NdUtwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CFRY=VsGenpwqVu_VOUYuBheVUEoX2M_h-XSHk6NdUtwg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qvVB--TCdJn04kDM_HKKrppAwb4Fmf-D
X-Proofpoint-GUID: ilptNliSp4lVqGJc1zH6TWEOQcFVJvGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_02,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290039
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-11-24 23:01:45 Wed, Oliver O'Halloran wrote:
> On Wed, Nov 24, 2021 at 12:05 AM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> >
> > *snip*
> >
> > This causes the EEH handler to get stuck for ~6
> > seconds before it could notify that the pci error has been detected and
> > stop any active operations. Hence with running I/O traffic, during this 6
> > seconds, the network driver continues its operation and hits a timeout
> > (netdev watchdog).On timeouts, network driver go into ffdc capture mode
> > and reset path assuming the PCI device is in fatal condition. This causes
> > EEH recovery to fail and sometimes it leads to system hang or crash.
> 
> Whatever is causing that crash is the real issue IMO. PCI error

I have seen crash only once but that was triggered by HTX tool and may
not be related. However, the major concern here is EEH failure. I will
correct the above statement in my next patch.

> reporting is fundamentally asynchronous and the driver always has to
> tolerate some amount of latency between the error occuring and being
> reported. Six seconds is admittedly an eternity, but it should not
> cause a system crash under any circumstances. Printing a warning due
> to a timeout is annoying, but it's not the end of the world.

Yeah, but due to timeout sometimes the driver gets into a situation
where when EEH recovery kicks-in, the driver is unable to recover the
device. Thus EEH recovery fails and disconnects the pci device even when
it could have recovered. To recover, we need to either reboot the lpar
or re-assign the I/O adapter from HMC to get it back in working
condition.

[16532.212197] EEH: PCI-E AER 30: 00000000 00000000
[16532.213207] EEH: Reset without hotplug activity
[16534.229469] bnx2x: [bnx2x_clean_tx_queue:1203(enP22p1s0f1)]timeout waiting for queue[2]: txdata->tx_pkt_prod(37003) != txdata->tx_pkt_cons(36996)
[16534.385484] EEH: Beginning: 'slot_reset'
[16534.385489] PCI 0016:01:00.0#10000: EEH: Invoking bnx2x->slot_reset()
[16536.229469] bnx2x: [bnx2x_clean_tx_queue:1203(enP22p1s0f1)]timeout waiting for queue[4]: txdata->tx_pkt_prod(64894) != txdata->tx_pkt_cons(64891)
o[...]
[16623.571502] bnx2x: [bnx2x_nic_load_request:2342(enP22p1s0f1)]MCP response failure, aborting
[16623.571507] bnx2x: [bnx2x_acquire_hw_lock:2019(enP22p1s0f1)]lock_status 0xffffffff  resource_bit 0x800
[16623.571881] bnx2x: [bnx2x_io_slot_reset:14359(enP22p1s0f0)]IO slot reset initializing...
[16623.571976] bnx2x 0016:01:00.0: enabling device (0140 -> 0142)
[16623.576169] bnx2x: [bnx2x_io_slot_reset:14375(enP22p1s0f0)]IO slot reset --> driver unload
[16623.576174] PCI 0016:01:00.0#10000: EEH: bnx2x driver reports: 'disconnect'
[16623.576177] PCI 0016:01:00.1#10000: EEH: Invoking bnx2x->slot_reset()
[16623.576179] bnx2x: [bnx2x_io_slot_reset:14359(enP22p1s0f1)]IO slot reset initializing...
[16623.576239] bnx2x 0016:01:00.1: enabling device (0140 -> 0142)
[16623.580241] bnx2x: [bnx2x_io_slot_reset:14375(enP22p1s0f1)]IO slot reset --> driver unload
[16623.580245] PCI 0016:01:00.1#10000: EEH: bnx2x driver reports: 'disconnect'
[16623.580246] EEH: Finished:'slot_reset' with aggregate recovery state:'disconnect'
[16623.580250] EEH: Unable to recover from failure from PHB#16-PE#10000.

Thanks,
-Mahesh.

-- 
Mahesh J Salgaonkar
