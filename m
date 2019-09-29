Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB409C1308
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 06:22:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46gsnM51NNzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 14:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gslr0F2xzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 14:20:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46gslq2FkRz8tPq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 14:20:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46gslq1TgHz9sPD; Sun, 29 Sep 2019 14:20:55 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46gslp2W2tz9sNk
 for <linuxppc-dev@ozlabs.org>; Sun, 29 Sep 2019 14:20:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8T47Awi097289
 for <linuxppc-dev@ozlabs.org>; Sun, 29 Sep 2019 00:20:49 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vamks0y6p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 29 Sep 2019 00:20:49 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Sun, 29 Sep 2019 05:20:47 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 29 Sep 2019 05:20:42 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8T4Kf8m42926160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 29 Sep 2019 04:20:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14F41A4051;
 Sun, 29 Sep 2019 04:20:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D89D1A404D;
 Sun, 29 Sep 2019 04:20:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.142.195])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 29 Sep 2019 04:20:38 +0000 (GMT)
Subject: Re: [PATCH v6 5/9] powerpc/ima: add measurement rules to ima arch
 specific policy
From: Mimi Zohar <zohar@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Sun, 29 Sep 2019 00:20:38 -0400
In-Reply-To: <1569594360-7141-6-git-send-email-nayna@linux.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-6-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092904-0028-0000-0000-000003A3A3C0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092904-0029-0000-0000-00002465C963
Message-Id: <1569730838.4999.31.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-29_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909290047
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-09-27 at 10:25 -0400, Nayna Jain wrote:
> This patch adds the measurement rules to the arch specific policies for the
> systems with trusted boot.
> 

on trusted boot enabled systems.


> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

Minor comment correction below.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

> ---
>  arch/powerpc/kernel/ima_arch.c | 44 +++++++++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
> index 39401b67f19e..77c61b142042 100644
> --- a/arch/powerpc/kernel/ima_arch.c
> +++ b/arch/powerpc/kernel/ima_arch.c
> @@ -12,8 +12,18 @@ bool arch_ima_get_secureboot(void)
>  	return is_powerpc_os_secureboot_enabled();
>  }
>  
> -/* Defines IMA appraise rules for secureboot */
> +/*
> + * The "arch_rules" contains both the securebot and trustedboot rules for adding
> + * the kexec kernel image and kernel modules file hashes to the IMA measurement
> + * list and verifying the file signatures against known good values.
> + *
> + * The "appraise_type=imasig|modsig" option allows the good signature to be
> + * stored as an xattr or as an appended signature. The "template=ima-modsig"
> + * option includes the appended signature in the IMA measurement list.

includes the appended signature, when available, in the IMA
measurement list. 

> + */
>  static const char *const arch_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
> +	"measure func=MODULE_CHECK template=ima-modsig",
>  	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
>  #if !IS_ENABLED(CONFIG_MODULE_SIG)
>  	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
> @@ -22,12 +32,40 @@ static const char *const arch_rules[] = {
>  };
>  
>  /*
> - * Returns the relevant IMA arch policies based on the system secureboot state.
> + * The "measure_rules" are enabled only on "trustedboot" enabled systems.
> + * These rules add the kexec kernel image and kernel modules file hashes to
> + * the IMA measurement list.
> + */
> +static const char *const measure_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK",
> +	"measure func=MODULE_CHECK",
> +	NULL
> +};
> +
> +/*
> + * Returns the relevant IMA arch policies based on the system secureboot
> + * and trustedboot state.
>   */
>  const char *const *arch_get_ima_policy(void)
>  {
> -	if (is_powerpc_os_secureboot_enabled())
> +	const char *const *rules;
> +	int offset = 0;
> +
> +	for (rules = arch_rules; *rules != NULL; rules++) {
> +		if (strncmp(*rules, "appraise", 8) == 0)
> +			break;
> +		offset++;
> +	}
> +
> +	if (is_powerpc_os_secureboot_enabled()
> +	    && is_powerpc_trustedboot_enabled())
>  		return arch_rules;
>  
> +	if (is_powerpc_os_secureboot_enabled())
> +		return arch_rules + offset;
> +
> +	if (is_powerpc_trustedboot_enabled())
> +		return measure_rules;
> +
>  	return NULL;
>  }

