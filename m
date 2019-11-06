Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E78F0CF9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:23:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477BhH21LhzF32D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 14:23:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477BfJ6fjNzF5KR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:22:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="h8vE0YBT"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 477BfJ4hrmz8tPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:22:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 477BfJ49XNz9sPn; Wed,  6 Nov 2019 14:22:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="h8vE0YBT"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 477BfJ1Sfcz9sPK;
 Wed,  6 Nov 2019 14:22:00 +1100 (AEDT)
Received: from [10.137.112.111] (unknown [131.107.147.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 188C720B7192;
 Tue,  5 Nov 2019 19:21:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 188C720B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1573010519;
 bh=btanoP8xvS9QFvuryL6LOBj/cR6eFnV38JO12TA+2Es=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h8vE0YBTBFtolSdZJ6D5H4kGsI8Fe1ayeWlTmxyy2LPG/uxRdVa6pe1IYU77Gz2sB
 MpYk0o1suZiadsaEDpVL2zwUf9LYYj5U9LsVUfyVmaJZR/iA5V9qV7g6pNWaeE+u31
 Kxd8IkbeVsmeuXj0v3befYTEYuI4h0vOTVs25gNc=
Subject: Re: [PATCH v6 2/4] powerpc: expose secure variables to userspace via
 sysfs
To: Eric Richter <erichte@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191105082450.14746-1-erichte@linux.ibm.com>
 <20191105082450.14746-3-erichte@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <79a6a7de-360c-c5c9-04e9-807952098ae5@linux.microsoft.com>
Date: Tue, 5 Nov 2019 19:22:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191105082450.14746-3-erichte@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/5/2019 12:24 AM, Eric Richter wrote:

> From: Nayna Jain <nayna@linux.ibm.com>
> 
> PowerNV secure variables, which store the keys used for OS kernel
> verification, are managed by the firmware. These secure variables need to
> be accessed by the userspace for addition/deletion of the certificates.
> 
> This patch adds the sysfs interface to expose secure variables for PowerNV
> secureboot. The users shall use this interface for manipulating
> the keys stored in the secure variables.

Can this patch be split into smaller set of changes:
1, Definitions of attribute functions like backend_show, size_show, etc.
2, secvar_sysfs_load
3, secvar_sysfs_init
4, secvar_sysfs_exit

> +static int secvar_sysfs_load(void)
> +{
> +	char *name;
> +	uint64_t namesize = 0;
> +	struct kobject *kobj;
> +	int rc;
> +
> +	name = kzalloc(NAME_MAX_SIZE, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +
> +	do {
> +		rc = secvar_ops->get_next(name, &namesize, NAME_MAX_SIZE);
> +		if (rc) {
> +			if (rc != -ENOENT)
> +				pr_err("error getting secvar from firmware %d\n",
> +					rc);
> +			break;
> +		}
> +
> +		kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +		if (!kobj) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +
> +		kobject_init(kobj, &secvar_ktype);
> +
> +		rc = kobject_add(kobj, &secvar_kset->kobj, "%s", name);
> +		if (rc) {
> +			pr_warn("kobject_add error %d for attribute: %s\n", rc,
> +				name);
> +			kobject_put(kobj);
> +			kobj = NULL;
> +		}
> +
> +		if (kobj)
> +			kobject_uevent(kobj, KOBJ_ADD);

kobject_event() will add kobj and free the memory when done using the 
object?

  -lakshmi
