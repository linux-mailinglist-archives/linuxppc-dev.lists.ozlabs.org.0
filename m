Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B9E3C54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 21:48:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zd8n0pB8zDqbY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 06:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zWC83VxtzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 02:20:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="Aec2M9vn"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46zWC806Czz8vKD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 02:20:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46zWC76mjvz9sQv; Fri, 25 Oct 2019 02:20:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="Aec2M9vn"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 46zWC71fgdz9sQr;
 Fri, 25 Oct 2019 02:20:18 +1100 (AEDT)
Received: from [10.137.112.108] (unknown [131.107.174.108])
 by linux.microsoft.com (Postfix) with ESMTPSA id 650BD20106BE;
 Thu, 24 Oct 2019 08:20:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 650BD20106BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1571930417;
 bh=fOMyGZiF2U/ZovXZCK4NxXGRhszfJdpIiYVpPS9my4M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Aec2M9vnd4bkFq+YJyfVqt/f6e6cTCfnbLFWz6VXmyIfPtpveq4FRmSkcxURnmukq
 yc5P586Y1pzliC68WKrbH+wbgqDa7TwK90cxmoKM7Pcp1YO/7hI0hzZNTw+cVejRq1
 3bYYgWQLDV+AOyZqQHWlEumXZxWRsb4zKUtge8tM=
Subject: Re: [PATCH v9 5/8] ima: make process_buffer_measurement() generic
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20191024034717.70552-1-nayna@linux.ibm.com>
 <20191024034717.70552-6-nayna@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <1ae56786-4d5c-ba8e-e30c-ced1e15ccb9c@linux.microsoft.com>
Date: Thu, 24 Oct 2019 08:20:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024034717.70552-6-nayna@linux.ibm.com>
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

On 10/23/19 8:47 PM, Nayna Jain wrote:

Hi Nayna,

> +void process_buffer_measurement(const void *buf, int size,
> +				const char *eventname, enum ima_hooks func,
> +				int pcr)
>   {
>   	int ret = 0;
>   	struct ima_template_entry *entry = NULL;

> +	if (func) {
> +		security_task_getsecid(current, &secid);
> +		action = ima_get_action(NULL, current_cred(), secid, 0, func,
> +					&pcr, &template);
> +		if (!(action & IMA_MEASURE))
> +			return;
> +	}

In your change set process_buffer_measurement is called with NONE for 
the parameter func. So ima_get_action (the above if block) will not be 
executed.

Wouldn't it better to update ima_get_action (and related functions) to 
handle the ima policy (func param)?

thanks,
  -lakshmi
