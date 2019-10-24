Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E321EE3D11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 22:18:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zdqg2FrgzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 07:18:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zZTd32JnzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:48:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="NmpVP5wJ"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46zZTc2tK8z8svl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:48:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46zZTc1djYz9sP3; Fri, 25 Oct 2019 04:48:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="NmpVP5wJ"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 46zZTb4yhlz9sPV;
 Fri, 25 Oct 2019 04:48:03 +1100 (AEDT)
Received: from [10.137.112.111] (unknown [131.107.147.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id BDA842007698;
 Thu, 24 Oct 2019 10:48:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BDA842007698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1571939281;
 bh=3ZUalX6KkoUAF5B6PB7Omcj6z9c3JtgzJCEvYAwd0VY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NmpVP5wJwINzCT0SPLjmqinpkGdSwyezoHpWRuvlMuBoj9iE7RB28lUD40Bbxfjey
 ekY0mojRGuFy3P8GrrjWA9dKAcBB4rHMFXuK7nh/PpQdPkp4tcss7tqrIo+VXeYYry
 tOfu2KguYoTByJZvD24zDoXytbjBV/MhtxKq9PlQ=
Subject: Re: [PATCH v9 7/8] ima: check against blacklisted hashes for files
 with modsig
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191024034717.70552-1-nayna@linux.ibm.com>
 <20191024034717.70552-8-nayna@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <8e6dde58-17c2-a834-9ec3-1271b4ffd3a8@linux.microsoft.com>
Date: Thu, 24 Oct 2019 10:48:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191024034717.70552-8-nayna@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Oct 2019 06:41:16 +1100
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
 Eric Ricther <erichte@linux.ibm.com>, Prakhar Srivastava <prsriva02@gmail.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/23/2019 8:47 PM, Nayna Jain wrote:

> +/*
> + * ima_check_blacklist - determine if the binary is blacklisted.
> + *
> + * Add the hash of the blacklisted binary to the measurement list, based
> + * on policy.
> + *
> + * Returns -EPERM if the hash is blacklisted.
> + */
> +int ima_check_blacklist(struct integrity_iint_cache *iint,
> +			const struct modsig *modsig, int pcr)
> +{
> +	enum hash_algo hash_algo;
> +	const u8 *digest = NULL;
> +	u32 digestsize = 0;
> +	int rc = 0;
> +
> +	if (!(iint->flags & IMA_CHECK_BLACKLIST))
> +		return 0;
> +
> +	if (iint->flags & IMA_MODSIG_ALLOWED && modsig) {
> +		ima_get_modsig_digest(modsig, &hash_algo, &digest, &digestsize);
> +
> +		rc = is_binary_blacklisted(digest, digestsize);
> +		if ((rc == -EPERM) && (iint->flags & IMA_MEASURE))
> +			process_buffer_measurement(digest, digestsize,
> +						   "blacklisted-hash", NONE,
> +						   pcr);
> +	}

The enum value "NONE" is being passed to process_buffer_measurement to 
indicate that the check for required action based on ima policy is 
already done by ima_check_blacklist. Not sure, but this can cause 
confusion in the future when someone updates process_buffer_measurement.

Would it instead be better to add another parameter to 
process_buffer_measurement to indicate the above condition?

  -lakshmi
