Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692630EE7D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:33:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWzV5Ds3zDww7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:33:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rYqUS88Q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWxm62dBzDsTw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:32:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1148W45n138055; Thu, 4 Feb 2021 03:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=UegUGB66zxCvCtBf3zRQr+5RNUn7jqFoiSbenMuBwl8=;
 b=rYqUS88Q8bYyVvHoNuLHinP+P7c5Q/5VnvPV08nOwmGQapoWBz/mac5hMrFrHmpbuKA+
 nIf0YElzAvgZ7yRuV/QVZ7/pR1Y1P2J9J1dp6vAAMoaUr6B8GCcVxkHxpJpEQ/I0u33z
 okxh72aFHu2ausDMA4eyK7CNwpcwFKwXxqJaW7If5a/GwLZ16V6AV07DLtKpMMYEfeol
 fQtZbFWm/YXLzbCbgOMlYp4xpRYnBqQs972vBcYjlCLgPxseqQzGgM5JlyUAZY6S7ggd
 MtLa0xLO4TGqPhv9xAr5uPVyF78dkXSw1IJAXI3nTjK3Gah0r/l4C81wD7A7HCkiheJ1 MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcd0snua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:32:06 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1148W5EP138196;
 Thu, 4 Feb 2021 03:32:05 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gcd0snr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 03:32:05 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1148Qvxd014119;
 Thu, 4 Feb 2021 08:31:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 36cy38mpa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:31:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1148VdIQ26476814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 08:31:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1813D52057;
 Thu,  4 Feb 2021 08:31:48 +0000 (GMT)
Received: from localhost (unknown [9.85.87.37])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A1EA05204E;
 Thu,  4 Feb 2021 08:31:47 +0000 (GMT)
Date: Thu, 4 Feb 2021 14:01:46 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc: sstep: Fix load-store and update emulation
Message-ID: <20210204083146.GJ210@DESKTOP-TDPLP67.localdomain>
References: <20210204080744.135785-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204080744.135785-1-sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040048
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/02/04 01:37PM, Sandipan Das wrote:
> The Power ISA says that the fixed-point load and update
> instructions must neither use R0 for the base address (RA)
> nor have the destination (RT) and the base address (RA) as
> the same register. Similarly, for fixed-point stores and
> floating-point loads and stores, the instruction is invalid
> when R0 is used as the base address (RA).
> 
> This is applicable to the following instructions.
>   * Load Byte and Zero with Update (lbzu)
>   * Load Byte and Zero with Update Indexed (lbzux)
>   * Load Halfword and Zero with Update (lhzu)
>   * Load Halfword and Zero with Update Indexed (lhzux)
>   * Load Halfword Algebraic with Update (lhau)
>   * Load Halfword Algebraic with Update Indexed (lhaux)
>   * Load Word and Zero with Update (lwzu)
>   * Load Word and Zero with Update Indexed (lwzux)
>   * Load Word Algebraic with Update Indexed (lwaux)
>   * Load Doubleword with Update (ldu)
>   * Load Doubleword with Update Indexed (ldux)
>   * Load Floating Single with Update (lfsu)
>   * Load Floating Single with Update Indexed (lfsux)
>   * Load Floating Double with Update (lfdu)
>   * Load Floating Double with Update Indexed (lfdux)
>   * Store Byte with Update (stbu)
>   * Store Byte with Update Indexed (stbux)
>   * Store Halfword with Update (sthu)
>   * Store Halfword with Update Indexed (sthux)
>   * Store Word with Update (stwu)
>   * Store Word with Update Indexed (stwux)
>   * Store Doubleword with Update (stdu)
>   * Store Doubleword with Update Indexed (stdux)
>   * Store Floating Single with Update (stfsu)
>   * Store Floating Single with Update Indexed (stfsux)
>   * Store Floating Double with Update (stfdu)
>   * Store Floating Double with Update Indexed (stfdux)
> 
> E.g. the following behaviour is observed for an invalid
> load and update instruction having RA = RT.
> 
> While a userspace program having an instruction word like
> 0xe9ce0001, i.e. ldu r14, 0(r14), runs without getting
> receiving a SIGILL on a Power system (observed on P8 and
> P9), the outcome of executing that instruction word varies
> and its behaviour can be considered to be undefined.
> 
> Attaching an uprobe at that instruction's address results
> in emulation which currently performs the load as well as
> writes the effective address back to the base register.
> This might not match the outcome from hardware.
> 
> To remove any inconsistencies, this adds additional checks
> for the aforementioned instructions to make sure that the
> emulation infrastructure treats them as unknown. The kernel
> can then fallback to executing such instructions on hardware.
> 
> Fixes: 0016a4cf5582 ("powerpc: Emulate most Book I instructions in emulate_step()")
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
> Previous versions can be found at:
> v3: https://lore.kernel.org/linuxppc-dev/20210204071432.116439-1-sandipan@linux.ibm.com/
> v2: https://lore.kernel.org/linuxppc-dev/20210203063841.431063-1-sandipan@linux.ibm.com/
> v1: https://lore.kernel.org/linuxppc-dev/20201119054139.244083-1-sandipan@linux.ibm.com/
> 
> Changes in v4:
> - Fixed grammar and switch-case alignment.
> 
> Changes in v3:
> - Consolidated the checks as suggested by Naveen.
> - Consolidated load/store changes into a single patch.
> - Included floating-point load/store and update instructions.
> 
> Changes in v2:
> - Jump to unknown_opcode instead of returning -1 for invalid
>   instruction forms.
> 
> ---
>  arch/powerpc/lib/sstep.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

For the series:
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

- Naveen

