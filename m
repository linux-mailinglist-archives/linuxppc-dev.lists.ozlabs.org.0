Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF34C0F6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 10:44:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3WMn0cBRz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:44:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pMsAkznu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pMsAkznu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3WM44rw5z2yHZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:43:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N7kPsI009942; 
 Wed, 23 Feb 2022 09:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=loC/xo38MxlxqWDk4uhpVcv/L+olWCZnX/sh41FHPvQ=;
 b=pMsAkznur2oLU+ECkSx6MaZQi1+4Uulz6707jOH63XXM2tfwoz7zoDAFh7a7hHXZORNM
 CTnqJ6N14+NTF/z5egwBXoVih4Ocz0PMCaaCBqXGqkg73Io1krrtNIV6PMQa9IDr6BNE
 RRH9s15Sj20uUwpqzLkhlPDjyVsW47sfow79oddUv/CxQUzwqfNsfq/DEuYqDijhV3J1
 IM0K5yC2Ryu9F9t9fWldfDKPeDjBbJWkktz8ExOZc7uumkmRp4YFkuo3TwQ3ZlVeW3sj
 KBBQgihdonNRN1FU12CXJyW4GMSkpwBbK+Qg8cwg3nvRMrYyEt80BkQGOMQGeD2e9i5F hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edgu3a4yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:43:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21N9TB5j030013;
 Wed, 23 Feb 2022 09:43:39 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edgu3a4yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:43:39 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21N9binT007541;
 Wed, 23 Feb 2022 09:43:38 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3ear6afp1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:43:38 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21N9hY6N50725256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 09:43:34 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3EC5B2067;
 Wed, 23 Feb 2022 09:43:34 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 895A5B205F;
 Wed, 23 Feb 2022 09:43:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Feb 2022 09:43:33 +0000 (GMT)
Message-ID: <5712db372dea7c2d345d6ac3414fd156bd015206.camel@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] powerpc/pseries/vas: VAS/NXGZIP support with LPM
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Wed, 23 Feb 2022 01:43:31 -0800
In-Reply-To: <1645608873.sgy6idnhcp.astroid@bobo.none>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <1645608873.sgy6idnhcp.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5GW_fGWW8uMEr9j_Tgl47WW4Zeg96svR
X-Proofpoint-ORIG-GUID: 2X0fYQ7r-mywpESiZOR029UyIJyqCONj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_03,2022-02-21_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=715 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230052
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

On Wed, 2022-02-23 at 19:38 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 6:04 am:
> > Virtual Accelerator Switchboard (VAS) is an engine stays on the
> > chip. So all windows opened on a specific engine belongs to VAS
> > the chip.
> 
> The problem is more that PAPR does not virtualise the VAS windows,
> right? That's a whole other gripe but nothing you can do about it
> here.

Yes, There is no virtualization with VAS windows and they are specific
to the chip. 

> 
> Thanks,
> Nick
> 
> > The hypervisor expects the partition to close all
> > active windows on the sources system and reopen them after
> > migration on the destination machine.
> > 
> > This patch series adds VAS support with the partition migration.
> > When the migration initiates, the VAS migration handler will be
> > invoked before pseries_suspend() to close all active windows and
> > mark them in-active with VAS_WIN_MIGRATE_CLOSE status. Whereas
> > this migration handler is called after migration to reopen all
> > windows which has VAS_WIN_MIGRATE_CLOSE status and make them
> > active again. The user space gets paste instruction failure
> > when it sends requests on these in-active windows.
> > 
> > These patches depend on VAS/DLPAR support patch series
> > 
> > Changes in v2:
> > - Added new patch "Define global hv_cop_caps struct" to eliminate
> >   memory allocation failure during migration (suggestion by
> >   Nathan Lynch)
> > 
> > Changes in v3:
> > - Rebase on 5.17-rc4
> > - Naming changes for VAS capability struct elemets based on the V4
> > DLPAR
> >   support patch series.
> > 
> > Haren Myneni (4):
> >   powerpc/pseries/vas: Define global hv_cop_caps struct
> >   powerpc/pseries/vas: Modify reconfig open/close functions for
> >     migration
> >   powerpc/pseries/vas: Add VAS migration handler
> >   powerpc/pseries/vas: Disable window open during migration
> > 
> >  arch/powerpc/include/asm/vas.h            |   2 +
> >  arch/powerpc/platforms/pseries/mobility.c |   5 +
> >  arch/powerpc/platforms/pseries/vas.c      | 234 +++++++++++++++++-
> > ----
> >  arch/powerpc/platforms/pseries/vas.h      |   6 +
> >  4 files changed, 201 insertions(+), 46 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > 
> > 

