Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0D5E50C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 18:05:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47088l2srnzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 03:05:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47085k5h78zDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 03:02:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="ZG+7BShM"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47085j5KyLz8vP3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 03:02:49 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47085j4LD8z9sPZ; Sat, 26 Oct 2019 03:02:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="ZG+7BShM"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 47085j1Mvlz9sPh;
 Sat, 26 Oct 2019 03:02:49 +1100 (AEDT)
Received: from [10.137.112.108] (unknown [131.107.174.108])
 by linux.microsoft.com (Postfix) with ESMTPSA id 167462010AC4;
 Fri, 25 Oct 2019 09:02:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 167462010AC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1572019368;
 bh=OgpaEOi3NtTvH8dAdXEaqJn/1OjtmfuxmiFQB2mjN+g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZG+7BShM7Zs+mQe8xyrHK3yGYcucqlMeIramEfEZ1sTdU9sg8hPD0fYRb6sPTmWOE
 mfuzyQAWb2eGe7bxnNeeHBCOX5WDqTnqNjsV8KOUmQJyoHqYr5+3BSb7PCe/79h6cs
 un5CwwbPOuujsxZ9OErVRUI0EgJ/VAIxSVOFu1K4=
Subject: Re: [PATCH v5 4/4] powerpc: load firmware trusted keys/hashes into
 kernel keyring
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191025005839.4498-1-nayna@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <5be98aad-66b9-2549-2772-ef30aa1275b4@linux.microsoft.com>
Date: Fri, 25 Oct 2019 09:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025005839.4498-1-nayna@linux.ibm.com>
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
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/24/19 5:58 PM, Nayna Jain wrote:

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

Is there a MIN\MAX limit on size that should be validated here before 
memory allocation?

> +	if (!db)
> +		return NULL;
> +
> +	rc = secvar_ops->get(key, keylen, db, size);
> +	if (rc) {
> +		kfree(db);
> +		pr_err("Error reading db var: %d\n", rc);
> +		return NULL;
nit: set db to NULL and return from the end of the function.

> +	}
> +
> +	return db;
> +}

