Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5EA775F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 00:56:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NMlP63ynzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 08:56:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NMjP61dZzDq9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 08:55:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46NMjP5Mbnz8xGy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 08:55:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46NMjP5B7jz9sP7; Wed,  4 Sep 2019 08:55:05 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46NMjP1j77z9sDB
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Sep 2019 08:55:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83Mr1hd133338
 for <linuxppc-dev@ozlabs.org>; Tue, 3 Sep 2019 18:55:03 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ut0mcs3y5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 03 Sep 2019 18:55:03 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Tue, 3 Sep 2019 23:55:01 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 23:54:56 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x83MssVe50004060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 22:54:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8319E5204E;
 Tue,  3 Sep 2019 22:54:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.191.35])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8E51452051;
 Tue,  3 Sep 2019 22:54:52 +0000 (GMT)
Subject: Re: [PATCH v3 4/4] powerpc: load firmware trusted keys/hashes into
 kernel keyring
From: Mimi Zohar <zohar@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Tue, 03 Sep 2019 18:54:51 -0400
In-Reply-To: <1566825818-9731-5-git-send-email-nayna@linux.ibm.com>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-5-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090322-4275-0000-0000-00000360BA63
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090322-4276-0000-0000-00003872FD9F
Message-Id: <1567551291.4937.8.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030229
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-26 at 09:23 -0400, Nayna Jain wrote:
> The keys used to verify the Host OS kernel are managed by firmware as
> secure variables. This patch loads the verification keys into the .platform
> keyring and revocation hashes into .blacklist keyring. This enables
> verification and loading of the kernels signed by the boot time keys which
> are trusted by firmware.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

Feel free to add my tag after addressing the formatting issues.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> new file mode 100644
> index 000000000000..359d5063d4da
> --- /dev/null
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain <nayna@linux.ibm.com>
> + *
> + *      - loads keys and hashes stored and controlled by the firmware.
> + */
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/cred.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <asm/secboot.h>
> +#include <asm/secvar.h>
> +#include "keyring_handler.h"
> +
> +/*
> + * Get a certificate list blob from the named secure variable.
> + */
> +static __init void *get_cert_list(u8 *key, unsigned long keylen, uint64_t *size)
> +{
> +	int rc;
> +	void *db;
> +
> +	rc = secvar_ops->get(key, keylen, NULL, size);
> +	if (rc) {
> +		pr_err("Couldn't get size: %d\n", rc);
> +		return NULL;
> +	}
> +
> +	db = kmalloc(*size, GFP_KERNEL);
> +	if (!db)
> +		return NULL;
> +
> +	rc = secvar_ops->get(key, keylen, db, size);
> +	if (rc) {
> +		kfree(db);
> +		pr_err("Error reading db var: %d\n", rc);
> +		return NULL;
> +	}
> +
> +	return db;
> +}
> +
> +/*
> + * Load the certs contained in the keys databases into the platform trusted
> + * keyring and the blacklisted X.509 cert SHA256 hashes into the blacklist
> + * keyring.
> + */
> +static int __init load_powerpc_certs(void)
> +{
> +	void *db = NULL, *dbx = NULL;
> +	uint64_t dbsize = 0, dbxsize = 0;
> +	int rc = 0;
> +
> +	if (!secvar_ops)
> +		return -ENODEV;
> +
> +	/* Get db, and dbx.  They might not exist, so it isn't
> +	 * an error if we can't get them.
> +	 */
> +	db = get_cert_list("db", 3, &dbsize);
> +	if (!db) {
> +		pr_err("Couldn't get db list from firmware\n");
> +	} else {
> +		rc = parse_efi_signature_list("powerpc:db",
> +				db, dbsize, get_handler_for_db);
> +		if (rc)
> +			pr_err("Couldn't parse db signatures: %d\n",
> +					rc);

There's no need to split this line.

> +		kfree(db);
> +	}
> +
> +	dbx = get_cert_list("dbx", 3,  &dbxsize);
> +	if (!dbx) {
> +		pr_info("Couldn't get dbx list from firmware\n");
> +	} else {
> +		rc = parse_efi_signature_list("powerpc:dbx",
> +				dbx, dbxsize,
> +				get_handler_for_dbx);

Formatting of this line is off.

> +		if (rc)
> +			pr_err("Couldn't parse dbx signatures: %d\n", rc);
> +		kfree(dbx);
> +	}
> +
> +	return rc;
> +}
> +late_initcall(load_powerpc_certs);

