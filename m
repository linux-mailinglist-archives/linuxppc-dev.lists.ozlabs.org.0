Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF393234BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 02:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dld935ClVz3cZ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 12:08:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rGSWdzTo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rGSWdzTo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dld8N17qZz3cM0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 12:08:20 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11O15hMh071159; Tue, 23 Feb 2021 20:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=fvB3rzAf+nSMX8mMPWYXXuPAPGObMNYcBPw6HsZjV10=;
 b=rGSWdzTokt+BjuGdJizFgnzR1MUUoSsry6lb6/JGEO8CXx7ysUQgOCdndTPlwulgvslA
 XbCa2ZU8rczINW5MofXTdIZbt0TNxzfAXy2Xn3qHtpkHvgBX6zRxI7dp7O2Omwikhg2u
 EL3fSWqXqdJsHg6kP269tD9FoLHmkGzQoBCcuaEeYkQbf/baY5jcK4mqq7tEn8MtLqbC
 Uc+9g5sX2sr97GZPbDVMVFqykOFvmc+NkRtGSGkdTti5nRwY+WNZvabEHqRPgBFet+yl
 eB0tCN//QH0OGqMHJVO4Oe45AVI4ZV2/DVUPI/q21vcymSS9Z9oYcMLIP6K/+U8bi/Up 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wau9anbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 20:08:02 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11O14WF5062184;
 Tue, 23 Feb 2021 20:08:01 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36wau9anb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 20:08:01 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11O180nb032208;
 Wed, 24 Feb 2021 01:08:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 36tt29tsmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 01:08:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11O17xG727460078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 01:07:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 354CC7805C;
 Wed, 24 Feb 2021 01:07:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85C9478066;
 Wed, 24 Feb 2021 01:07:50 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.80.200.35])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Feb 2021 01:07:50 +0000 (GMT)
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-4-nramas@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v19 03/13] powerpc: Use ELF fields defined in 'struct
 kimage'
In-reply-to: <20210221174930.27324-4-nramas@linux.microsoft.com>
Date: Tue, 23 Feb 2021 22:07:48 -0300
Message-ID: <87czwqw9wb.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-23_12:2021-02-23,
 2021-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
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

> ELF related fields elf_headers, elf_headers_sz, and elfcorehdr_addr
> have been moved from 'struct kimage_arch' to 'struct kimage' as
> elf_headers, elf_headers_sz, and elf_load_addr respectively.
>
> Use the ELF fields defined in 'struct kimage'.
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")

This Fixes tag should be removed. It is referencing a patch from the
future (later in the series), and the commit id is meaningless.

> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |  4 ----
>  arch/powerpc/kexec/file_load.c    |  6 +++---
>  arch/powerpc/kexec/file_load_64.c | 14 +++++++-------
>  3 files changed, 10 insertions(+), 14 deletions(-)

With that fixed:

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
