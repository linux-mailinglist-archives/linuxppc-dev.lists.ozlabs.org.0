Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15FE3C9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 21:57:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zdLT04mFzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 06:57:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zZJj6ZKxzDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="oq7uLOnC"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46zZJh3hdPz8vLT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:40:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46zZJh2Sbbz9sPl; Fri, 25 Oct 2019 04:40:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="oq7uLOnC"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 46zZJg6411z9sP3;
 Fri, 25 Oct 2019 04:40:19 +1100 (AEDT)
Received: from [10.137.112.111] (unknown [131.107.147.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id C0E872010AC3;
 Thu, 24 Oct 2019 10:40:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C0E872010AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1571938819;
 bh=IDatuhvAIUC8shfzil97Wc2552dWcbQTynpu3KtnO84=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oq7uLOnCiIJzJwKl9UtoSEsELanj0SNiNpRNkf9QVKFoTu6UFAw3U0jslONs7uWcF
 A+Pl8F79LgCQ4zHWSptkJGYeWpxb+b8VfxcAT/agpYuQRQJYOtZ5Q/F0REVjtsus4B
 ynwZmDSY2ruTgnlJoEsiy8VF3xAHRuXX28ZWXfi4=
Subject: Re: [PATCH v9 4/8] powerpc/ima: define trusted boot policy
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191024034717.70552-1-nayna@linux.ibm.com>
 <20191024034717.70552-5-nayna@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <3e36c14f-d4bb-5da5-b188-ca84bc282f0d@linux.microsoft.com>
Date: Thu, 24 Oct 2019 10:40:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191024034717.70552-5-nayna@linux.ibm.com>
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
> + * The "secure_and_trusted_rules" contains rules for both the secure boot and
> + * trusted boot. The "template=ima-modsig" option includes the appended
> + * signature, when available, in the IMA measurement list.
> + */
> +static const char *const secure_and_trusted_rules[] = {
> +	"measure func=KEXEC_KERNEL_CHECK template=ima-modsig",
> +	"measure func=MODULE_CHECK template=ima-modsig",
> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
> +#ifndef CONFIG_MODULE_SIG_FORCE
> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
> +#endif
> +	NULL
> +};

Same comment as earlier - any way to avoid using conditional compilation 
in C file?

  -lakshmi
