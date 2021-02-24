Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08063234BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 02:04:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dld4K3p4hz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 12:04:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ShfbwJy4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ShfbwJy4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dld3t3Tw5z30LR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 12:04:25 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11O12qxn090069; Tue, 23 Feb 2021 20:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=LiUHUTJGKM9F5JZaSQZZBvR7ceGcxURUydnol1dcBUg=;
 b=ShfbwJy4SURD1oyhdMKXmcfvSI0WvhH8nz7P7v83L1vSIgWgW/b9RsuuSNrfcShs6wII
 FCSn6X5ifxXptX9x93rBL5cIY1DLjDNLERGNAa4234Yw4OPC1A1zr+uHdDEX4MXfDUIe
 cTHb6Xrq2N77vSLaELWS/u5hVxFJjkmplvLKY9hf58UcSu2VmjIzJtUd87M3dXDjB6HN
 nxHuEbscH4tK141F1exo63Db0dp8WmXFhw1KM49Ue/4r4pTnzThg6NzgbG+7eY0A5MjX
 oBwIg1RYjMxug4/0+XoPm4A5ExNykoarn0b1RwYOwWhlJdffx4fHfxu6+Xt2h+azYRfp ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkg3n2un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 20:03:48 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11O13lpk093319;
 Tue, 23 Feb 2021 20:03:48 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkg3n2u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 20:03:47 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11O12L2S009228;
 Wed, 24 Feb 2021 01:03:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 36tt2ahf0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 01:03:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11O13jH328639738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 01:03:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94D42BE058;
 Wed, 24 Feb 2021 01:03:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2342BE059;
 Wed, 24 Feb 2021 01:03:36 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.80.200.35])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Feb 2021 01:03:36 +0000 (GMT)
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-2-nramas@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v19 01/13] kexec: Move ELF fields to struct kimage
In-reply-to: <20210221174930.27324-2-nramas@linux.microsoft.com>
Date: Tue, 23 Feb 2021 22:03:34 -0300
Message-ID: <87im6iwa3d.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-23_12:2021-02-23,
 2021-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=988 mlxscore=0 impostorscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102240005
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, sfr@canb.auug.org.au,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 gregkh@linuxfoundation.org, joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> ELF related fields elf_headers, elf_headers_sz, and elf_load_addr are
> defined in architecture specific 'struct kimage_arch' for x86, powerpc,
> and arm64.  The name of these fields are different in these
> architectures that makes it hard to have a common code for setting up
> the device tree for kexec system call.
>
> Move the ELF fields to 'struct kimage' defined in include/linux/kexec.h
> so common code can use it.
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")

This Fixes tag should be removed. It is referencing a patch from the
future (later in the series), and the commit id is meaningless.

> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  include/linux/kexec.h | 5 +++++
>  1 file changed, 5 insertions(+)

With that fixed:

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
