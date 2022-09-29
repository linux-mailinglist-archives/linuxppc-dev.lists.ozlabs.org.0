Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFC5EFFEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:11:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mdncy3Rbrz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:11:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRFMJ4xT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRFMJ4xT;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdncJ51xCz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 08:10:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TLtBqu005868;
	Thu, 29 Sep 2022 22:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=pQH4tiUYaJap9C/cCB5G8K+8InauKQNHX4Htnd4fKa8=;
 b=pRFMJ4xTOsLOL/0BKhDdFOBa3Zbi/8J5p+cUdOkF17Ndxxo6Lq9AXDMhUIHo6PW0bsWK
 w0Nr6CWfT2VoXMIqLIo54pRk9C9KZFeeQ5htA1MarmmuFJ3dKac7iQaALYVNQh608aol
 EH5ZhkMq497ExevEdLShJbKydI10EXoF7seVTvOJWn086E+ERtZ6BiBf21T9lK61del/
 SjcxIr8LeTHvReQbaYpi8LH7FWAxZYjB6juk7Dp1S9L1ZF5qCcjJ3UnhDx+2o7iMEP4O
 VnZ8CzIPJY8eJbKm9qTKc11dOM1WZyuSvvzDta3jfTIAP6d8pSHpyAqaPjVrN02IbnVP fg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwkpy10xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:10:33 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28TM6OTb009469;
	Thu, 29 Sep 2022 22:10:17 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma01wdc.us.ibm.com with ESMTP id 3jt40s9wq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Sep 2022 22:10:17 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28TMAHbC26935804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Sep 2022 22:10:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84B555805D;
	Thu, 29 Sep 2022 22:10:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 737AC58056;
	Thu, 29 Sep 2022 22:10:16 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Sep 2022 22:10:16 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 6/6] powerpc/pseries: Add firmware details to the
 hardware description
In-Reply-To: <20220929142251.1987025-6-mpe@ellerman.id.au>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
 <20220929142251.1987025-6-mpe@ellerman.id.au>
Date: Thu, 29 Sep 2022 17:10:16 -0500
Message-ID: <87zgehbznb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DeVhf6RBgcLLHL5ss7ghK6jmkBdqiUfH
X-Proofpoint-GUID: DeVhf6RBgcLLHL5ss7ghK6jmkBdqiUfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_13,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0
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
> Add firmware version details to the hardware description, which is
> printed at boot and in case of an oops.
>
> Use /hypervisor if we find it, though currently it only exists if we're
> running under qemu.
>
> Look for "ibm,powervm-partition" which is specified in PAPR+ v2.11 and
> tells us we're running under PowerVM.
>
> Failing that look for "ibm,fw-net-version" which is seen on PowerVM
> going back to at least Power6.
>
> eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:'phyp'
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/platforms/pseries/setup.c | 30 ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> v2: Look for "ibm,powervm-partition" as suggested by Nathan.
>     Use of_property_read_string().

LGTM.

I noticed that we don't get an "of:" report with qemu+vof, because there's no
/openprom node.

$ qemu-system-ppc64 -nographic -vga none -M pseries,x-vof=off -kernel vmlinux | grep Hardware
Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER9 (raw)' pvr:0x4e1200 lpvr:0xf000005 of:'SLOF,HEAD' machine:pSeries
$ qemu-system-ppc64 -nographic -vga none -M pseries,x-vof=on -kernel vmlinux | grep Hardware
Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER9 (raw)' pvr:0x4e1200 lpvr:0xf000005 machine:pSeries
$ qemu-system-ppc64 --version
QEMU emulator version 7.0.0 (qemu-7.0.0-6.fc36)

I didn't see anything in the vof device tree that would help though.


> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 5e44c65a032c..83b047db35da 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -41,6 +41,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/memblock.h>
>  #include <linux/swiotlb.h>
> +#include <linux/seq_buf.h>
>  
>  #include <asm/mmu.h>
>  #include <asm/processor.h>
> @@ -1011,6 +1012,33 @@ static void __init pSeries_cmo_feature_init(void)
>  	pr_debug(" <- fw_cmo_feature_init()\n");
>  }
>  
> +static void __init pseries_add_hw_description(void)
> +{
> +	struct device_node *dn;
> +	const char *s;
> +
> +	dn = of_find_node_by_path("/openprom");
> +	if (dn) {
> +		if (of_property_read_string(dn, "model", &s) == 0)
> +			seq_buf_printf(&ppc_hw_desc, "of:'%s' ", s);
> +
> +		of_node_put(dn);
> +	}
> +
> +	dn = of_find_node_by_path("/hypervisor");
> +	if (dn) {
> +		if (of_property_read_string(dn, "compatible", &s) == 0)
> +			seq_buf_printf(&ppc_hw_desc, "hv:'%s' ", s);
> +
> +		of_node_put(dn);
> +		return;
> +	}
> +
> +	if (of_property_read_bool(of_root, "ibm,powervm-partition") ||
> +	    of_property_read_bool(of_root, "ibm,fw-net-version"))
> +		seq_buf_printf(&ppc_hw_desc, "hv:'phyp' ");
> +}
