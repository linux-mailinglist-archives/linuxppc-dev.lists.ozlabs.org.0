Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A636CEB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 00:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVGxv2Blqz301x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 08:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MYUj8/FC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MYUj8/FC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVGxS1BCdz2xYY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 08:42:51 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RMZSnc151986; Tue, 27 Apr 2021 18:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ruAZPEzTR+4YVIRfRCnw1Uz68JCGk128IOc9g3VyJyE=;
 b=MYUj8/FCXw2rGK9WRR7NLraqjBU66ESHNNUubfA1yPvyT7bRcuxDPigrvMenZah11sb3
 RhjAOjMEiJKYQ3aWIByh4dS3JbngB00WjeSOC4CAVNgAKZn0oui7i15tNsP0c7kHAx4n
 aHYy2NaGTfbhIjhOAZn4U+N7U5+SMUWguTB4TrhnDF3aUYvEfwWQ3EHicKXKumjk4bZZ
 P6a/6Sfu76DNuWWSxIGz2t8wsydwrXH8ANS5VGooRzdeHc5aaNTk77BPs1sOIhDIIoK0
 6rYj7ivAvkwrRpuHc3XxnqAFopY5zreWBSjYdCTRzGl3tRiy/8h2iLXQyPb4faWY6BrZ Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386tbft0uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 18:42:37 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RMZweq156200;
 Tue, 27 Apr 2021 18:42:36 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386tbft0up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 18:42:36 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RMeaL1011078;
 Tue, 27 Apr 2021 22:42:35 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 384ay9gpyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 22:42:35 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13RMgYZg10486764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 22:42:34 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44AA8124083;
 Tue, 27 Apr 2021 22:42:34 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DFD912407B;
 Tue, 27 Apr 2021 22:42:33 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.93.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 22:42:33 +0000 (GMT)
Message-ID: <2f7587b1986d597a63169567124438325cbedfd7.camel@linux.ibm.com>
Subject: Re: PPC476 hangs during tlb flush after calling /init in crash
 kernel with linux 5.4+
From: Eddie James <eajames@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Date: Tue, 27 Apr 2021 17:42:32 -0500
In-Reply-To: <a24e9e0d-1d4f-506b-9303-4b995815d3c4@csgroup.eu>
References: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
 <a24e9e0d-1d4f-506b-9303-4b995815d3c4@csgroup.eu>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LuXX_Tvi81UzGjkSjbHWnPTgBsTK_7SV
X-Proofpoint-ORIG-GUID: d9Hpr1QGdG5PGt2vCxCITze9-gFqLPGG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_13:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270151
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
Cc: miltonm@us.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-04-27 at 19:26 +0200, Christophe Leroy wrote:
> Hi Eddies,
> 
> Le 27/04/2021 à 19:03, Eddie James a écrit :
> > Hi all,
> > 
> > I'm having a problem in simulation and hardware where my PPC476
> > processor stops executing instructions after callling /init. In my
> > case
> > this is a bash script. The code descends to flush the TLB, and
> > somewhere in the loop in _tlbil_pid, the PC goes to
> > InstructionTLBError47x but does not go any further. This only
> > occurs in
> > the crash kernel environment, which is using the same kernel,
> > initramfs, and init script as the main kernel, which executed fine.
> > I
> > do not see this problem with linux 4.19 or 3.10. I do see it with
> > 5.4
> > and 5.10. I see a fair amount of refactoring in the PPC memory
> > management area between 4.19 and 5.4. Can anyone point me in a
> > direction to debug this further? My stack trace is below as I can
> > run
> > gdb in simulation.
> 
> Can you bisect to pin point the culprit commit ?

Hi, thanks for your prompt reply.

Good idea! I have bisected to:

commit 9e849f231c3c72d4c3c1b07c9cd19ae789da0420 (b8-bad,
refs/bisect/bad)
Author: Christophe Leroy <christophe.leroy@c-s.fr>
Date:   Thu Feb 21 19:08:40 2019 +0000

    powerpc/mm/32s: use generic mmu_mapin_ram() for all blocks.
    
    Now that mmu_mapin_ram() is able to handle other blocks
    than the one starting at 0, the WII can use it for all
    its blocks.
    
    Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

I also confirmed that reverting this commit resolves the issue in 5.4+.

Now, I don't understand why this is problematic or what is really
happening... Reverting is probably not the desired solution.

Thanks
Eddie


> 
> Assuming the problem is in arch/powerpc/ , you should get the result
> in approx 10 steps:
> 
> [root@po15610vm linux-powerpc]# git bisect start -- arch/powerpc/
> [root@po15610vm linux-powerpc]# git bisect bad v5.4
> [root@po15610vm linux-powerpc]# git bisect good v4.19
> Bisecting: 964 revisions left to test after this (roughly 10 steps)
> 
> 
> Christophe

