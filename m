Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD05EFFDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdnR213sNz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:02:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjGhfwQz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjGhfwQz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdnQL66HWz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 08:02:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TLtBYN005830;
	Thu, 29 Sep 2022 22:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=mwNTSdtMsNzksyiATlRMNJhPPpiCONr4JNWKeACm0Ww=;
 b=mjGhfwQzEd6Hoat2bOCchHLWM61MvASAK2XEpeAN++GwUDGBbrF6Ke35UZ7C5BnjKY4f
 ZlGp1XGgS1GW/izOTPrpX0t4FQq/dvU3RuolDnynf5T5dPL2HtY59pfr53HOidPXY/3I
 l9QLC42IkPfpkswfWsrvjht6XtR9ls41FCqL7HgXWoWZJu/ajIL2ojJ7N5IKce07SVOt
 OKhSINY5Zi1CPScEkL1FgQkxZqNuyelv/JspqF42xD86oh+pm5wcfTKh75ORJAURlaW0
 PgtZFTTLgCBngEiUQIj04jPYFDB1x4d83z7cx8d43YIhQ152AdiYmEpBVC3mM5/CVxcG GA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwkpy04kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:01:56 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28TLpObY024210;
	Thu, 29 Sep 2022 22:01:55 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma02dal.us.ibm.com with ESMTP id 3jsshawwua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:01:54 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28TM1sQd66322738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 22:01:54 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 349FD58052;
	Thu, 29 Sep 2022 22:01:53 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23F5558062;
	Thu, 29 Sep 2022 22:01:53 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 22:01:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/6] powerpc: Add hardware description string
In-Reply-To: <20220929142251.1987025-1-mpe@ellerman.id.au>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
Date: Thu, 29 Sep 2022 17:01:52 -0500
Message-ID: <8735c9delr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Jz7w41fPZ7yquNR2mnnyDeBDH3P_-T7A
X-Proofpoint-GUID: Jz7w41fPZ7yquNR2mnnyDeBDH3P_-T7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_13,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=585 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290139
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Create a hardware description string, which we will use to record
> various details of the hardware platform we are running on.
>
> Print the accumulated description at boot, and use it to set the generic
> description which is printed in oopses.
>
> To begin with add ppc_md.name, aka the "machine description".
>
> Example output at boot with the full series applied:
>
>   Linux version 6.0.0-rc2-gcc-11.1.0-00199-g893f9007a5ce-dirty (michael@alpine1-p1) (powerpc64-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #844 SMP Thu Sep 29 22:29:53 AEST 2022
>   Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER8 (raw)' pvr:0x4d0200 lpvr:0xf000004 of:'SLOF,HEAD' machine:pSeries
>   printk: bootconsole [udbg0] enabled
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/setup.h   |  2 ++
>  arch/powerpc/kernel/setup-common.c | 19 ++++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> v2: Print the string at boot as suggested by Nathan.

Thanks!

I've booted the series on P8 and P9 LPARs:

Hardware name: model:'IBM,8408-E8E' cpu:'POWER8E (raw)' pvr:0x4b0201 lpvr:0xf000004 of:'IBM,FW860.50 (SV860_146)' hv:'phyp' machine:pSeries

Hardware name: model:'IBM,9040-MR9' cpu:'POWER9 (raw)' pvr:0x4e2102 lpvr:0xf000005 of:'IBM,FW950.01 (VM950_047)' hv:'phyp' machine:pSeries

Not on objection but just an FYI: we're already very close to exceeding
the arch description buffer's size on PowerVM. Both of the above are
over 120 bytes.

It also occurs to me that we'll want to rebuild the arch description
string after partition migration. Probably immediately after processing
the device tree updates.

Regardless, LGTM.
