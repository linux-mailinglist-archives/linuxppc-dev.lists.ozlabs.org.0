Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC2C93D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 23:53:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46k8zC1q3jzDqW5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 07:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46k8tK0dLzzDqX0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 07:49:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46k8tF4Q1xz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 07:49:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46k8tF32mHz9sPd; Thu,  3 Oct 2019 07:49:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46k8tD2gPjz9sPL
 for <linuxppc-dev@ozlabs.org>; Thu,  3 Oct 2019 07:49:24 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x92LkkwN067898
 for <linuxppc-dev@ozlabs.org>; Wed, 2 Oct 2019 17:49:21 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vd3pf0n05-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 02 Oct 2019 17:49:21 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Wed, 2 Oct 2019 22:49:19 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 2 Oct 2019 22:49:14 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x92LnDE019792014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 21:49:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BA8A4C044;
 Wed,  2 Oct 2019 21:49:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 339C64C040;
 Wed,  2 Oct 2019 21:49:11 +0000 (GMT)
Received: from dhcp-9-31-103-196.watson.ibm.com (unknown [9.31.103.196])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 21:49:11 +0000 (GMT)
Subject: Re: [PATCH v6 3/9] powerpc: add support to initialize ima policy rules
From: Mimi Zohar <zohar@linux.ibm.com>
To: Nayna <nayna@linux.vnet.ibm.com>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>
Date: Wed, 02 Oct 2019 17:49:10 -0400
In-Reply-To: <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
 <877e5pwa1b.fsf@morokweng.localdomain>
 <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100221-0016-0000-0000-000002B37556
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100221-0017-0000-0000-000033147C3D
Message-Id: <1570052950.4421.70.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020172
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-01 at 12:07 -0400, Nayna wrote:
> 
> On 09/30/2019 09:04 PM, Thiago Jung Bauermann wrote:
> > Hello,
> 
> Hi,
> 
> >
> >> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
> >> new file mode 100644
> >> index 000000000000..39401b67f19e
> >> --- /dev/null
> >> +++ b/arch/powerpc/kernel/ima_arch.c
> >> @@ -0,0 +1,33 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) 2019 IBM Corporation
> >> + * Author: Nayna Jain
> >> + */
> >> +
> >> +#include <linux/ima.h>
> >> +#include <asm/secure_boot.h>
> >> +
> >> +bool arch_ima_get_secureboot(void)
> >> +{
> >> +	return is_powerpc_os_secureboot_enabled();
> >> +}
> >> +
> >> +/* Defines IMA appraise rules for secureboot */
> >> +static const char *const arch_rules[] = {
> >> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
> >> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
> >> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
> >> +#endif
> >> +	NULL
> >> +};
> >> +
> >> +/*
> >> + * Returns the relevant IMA arch policies based on the system secureboot state.
> >> + */
> >> +const char *const *arch_get_ima_policy(void)
> >> +{
> >> +	if (is_powerpc_os_secureboot_enabled())
> >> +		return arch_rules;
> >> +
> >> +	return NULL;
> >> +}
> > If CONFIG_MODULE_SIG is enabled but module signatures aren't enforced,
> > then IMA won't enforce module signature either. x86's
> > arch_get_ima_policy() calls set_module_sig_enforced(). Doesn't the
> > powerpc version need to do that as well?
> >
> > On the flip side, if module signatures are enforced by the module
> > subsystem then IMA will verify the signature a second time since there's
> > no sharing of signature verification results between the module
> > subsystem and IMA (this was observed by Mimi).
> >
> > IMHO this is a minor issue, since module loading isn't a hot path and
> > the duplicate work shouldn't impact anything. But it could be avoided by
> > having a NULL entry in arch_rules, which arch_get_ima_policy() would
> > dynamically update with the "appraise func=MODULE_CHECK" rule if
> > is_module_sig_enforced() is true.
> 
> Thanks Thiago for reviewing.  I am wondering that this will give two 
> meanings for NULL. Can we do something like below, there are possibly 
> two options ?
> 
> 1. Set IMA_APPRAISED in the iint->flags if is_module_sig_enforced().
> 
> OR
> 
> 2. Let ima_get_action() check for is_module_sig_enforced() when policy 
> is appraise and func is MODULE_CHECK.

I'm a bit hesitant about mixing the module subsystem signature
verification method with the IMA measure "template=ima-modsig" rules.
 Does it actually work?

We can at least limit verifying the same appended signature twice to
when "module.sig_enforce" is specified on the boot command line, by
changing "!IS_ENABLED(CONFIG_MODULE_SIG)" to test
"CONFIG_MODULE_SIG_FORCE".

Mimi

