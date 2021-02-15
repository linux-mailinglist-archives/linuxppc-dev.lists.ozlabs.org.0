Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74E31C3CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 22:51:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dfd9K1Hwwz3cHl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 08:51:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fkZfmzXS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fkZfmzXS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dfd8t1YZtz30Jf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Feb 2021 08:51:25 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11FLhE3W062034; Mon, 15 Feb 2021 16:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=KjcWjrzpVphFTO5FFSUfC3u1TkMq+mBtwaNHZAkSXQw=;
 b=fkZfmzXSSGZ1pLt7nIAqKdphiTx2RX00y4U/2m31Ar6nmC5/jsP7RohDhhlOKWhVtwcv
 1Z8xKf/BuE26k4Bvl6ZaZIYsXQdl2PmWG+vbM6Je/qMv7C5/ROnHkAIzv9KEPMKmRlwk
 nUB91Ib8QhrLDQUb+ATEYDuVtz/tTfWURZiaB7YVrgH8omfRqX7dbwx9KfjwTQ4pUFGm
 9ZSCUQXybu7qoQLtCEAsmC7NO5Rz+6ijnnIQotqQ6QWcANG6fWTd83BhxDSKOguh7Et+
 8iAyh98kj2SNEJdawkae24ypkcRkTA3ayDo9JTSBWjJe6PsqfOFM2f8I6N09kr/5aQyW gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36r1470487-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 16:51:07 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11FLjZcl066428;
 Mon, 15 Feb 2021 16:51:06 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36r147047q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 16:51:06 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11FLmABZ026281;
 Mon, 15 Feb 2021 21:51:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 36p6d8hwjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 21:51:05 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11FLp4TZ7537262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Feb 2021 21:51:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F4072C6059;
 Mon, 15 Feb 2021 21:51:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC117C6057;
 Mon, 15 Feb 2021 21:50:55 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.173.121])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Feb 2021 21:50:55 +0000 (GMT)
References: <20210213161049.6190-1-nramas@linux.microsoft.com>
 <20210213161049.6190-6-nramas@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v18 05/11] powerpc: Use common
 of_kexec_alloc_and_setup_fdt()
In-reply-to: <20210213161049.6190-6-nramas@linux.microsoft.com>
Date: Mon, 15 Feb 2021 18:50:53 -0300
Message-ID: <87tuqdq9tu.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_16:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150160
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
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> From: Rob Herring <robh@kernel.org>
>
> The code for setting up the /chosen node in the device tree
> and updating the memory reservation for the next kernel has been
> moved to of_kexec_alloc_and_setup_fdt() defined in "drivers/of/kexec.c".
>
> Use the common of_kexec_alloc_and_setup_fdt() to setup the device tree
> and update the memory reservation for kexec for powerpc.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |   1 +
>  arch/powerpc/kexec/elf_64.c       |  30 ++++---
>  arch/powerpc/kexec/file_load.c    | 132 +-----------------------------
>  arch/powerpc/kexec/file_load_64.c |   3 +
>  4 files changed, 26 insertions(+), 140 deletions(-)

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
