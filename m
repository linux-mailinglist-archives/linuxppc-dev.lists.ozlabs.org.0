Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFEF0CB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 04:10:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477BNp5Sf0zF4NL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 14:10:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477BKk4nyVzF3DC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:07:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="b5tCaED+"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 477BKk20C6z8tPT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 14:07:38 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 477BKk17h6z9sQp; Wed,  6 Nov 2019 14:07:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="b5tCaED+"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 477BKj0kClz9sQy;
 Wed,  6 Nov 2019 14:07:36 +1100 (AEDT)
Received: from [10.137.112.111] (unknown [131.107.147.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7FD8720B7192;
 Tue,  5 Nov 2019 19:07:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7FD8720B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1573009655;
 bh=t+UX8ssq46MLjcIIguwgYQLFTqBQfN20laK/0LJnJMk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b5tCaED+1a14jU4yDtJu7DHZpYKeU9bgyFe7/6cyEQ9AMFm/YaUzZN3tW3ammEHen
 3XQnptYEN3Xga6e/24SucJMjEQ/auFnVvUJ7eTfQW8LMG1nQVLpe/LyWzLc6mUNPRR
 6zW1QXKCY3gFLNwPy+gFg1B+uGOBz9wacrmAJUWA=
Subject: Re: [PATCH v6 1/4] powerpc/powernv: Add OPAL API interface to access
 secure variable
To: Eric Richter <erichte@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191105082450.14746-1-erichte@linux.ibm.com>
 <20191105082450.14746-2-erichte@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <3d2e3792-e78e-95a8-623e-1ddcf3ccf241@linux.microsoft.com>
Date: Tue, 5 Nov 2019 19:07:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191105082450.14746-2-erichte@linux.ibm.com>
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
> The X.509 certificates trusted by the platform and required to secure boot
> the OS kernel are wrapped in secure variables, which are controlled by
> OPAL.
> 
> This patch adds firmware/kernel interface to read and write OPAL secure
> variables based on the unique key.

I feel splitting this patch into smaller set of changes would make it 
easier to review. For instance roughly as below:

  1, opal-api.h which adds the #defines  OPAL_SECVAR_ and the API signature.
  2, secvar.h then adds secvar_operations struct
  3, powerpc/kernel for the Interface definitions
  4, powernv/opal-secvar.c for the API implementations
  5, powernv/opal-call.c for the API calls
  6, powernv/opal.c for the secvar init calls.

> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 378e3997845a..c1f25a760eb1 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -211,7 +211,10 @@
>   #define OPAL_MPIPL_UPDATE			173
>   #define OPAL_MPIPL_REGISTER_TAG			174
>   #define OPAL_MPIPL_QUERY_TAG			175
> -#define OPAL_LAST				175
> +#define OPAL_SECVAR_GET				176
> +#define OPAL_SECVAR_GET_NEXT			177
> +#define OPAL_SECVAR_ENQUEUE_UPDATE		178
> +#define OPAL_LAST				178

Please fix the indentation for the #defines


> +static int opal_get_variable(const char *key, uint64_t ksize,
> +			     u8 *data, uint64_t *dsize)
> +{
> +	int rc;
> +
> +	if (!key || !dsize)
> +		return -EINVAL;
> +
> +	*dsize = cpu_to_be64(*dsize);
> +
> +	rc = opal_secvar_get(key, ksize, data, dsize);
> +
> +	*dsize = be64_to_cpu(*dsize);

Should the return status (rc) from opal_secvar_get be checked before 
attempting to do the conversion (be64_to_cpu)?

> +static int opal_get_next_variable(const char *key, uint64_t *keylen,
> +				  uint64_t keybufsize)
> +{
> +	int rc;
> +
> +	if (!key || !keylen)
> +		return -EINVAL;
> +
> +	*keylen = cpu_to_be64(*keylen);
> +
> +	rc = opal_secvar_get_next(key, keylen, keybufsize);
> +
> +	*keylen = be64_to_cpu(*keylen);

Same comment as above - should rc be checke before attempting to convert?

> +
> +	return opal_status_to_err(rc);
> +}
> +
> +static int opal_set_variable(const char *key, uint64_t ksize, u8 *data,
> +			     uint64_t dsize)
> +{
> +	int rc;
> +
> +	if (!key || !data)
> +		return -EINVAL;

Is the key and data received here from a trusted caller? If not, should 
there be some validation checks done here before enqueuing the data?

  -lakshmi

