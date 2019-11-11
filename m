Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E82F830B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 23:39:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bm5s17FdzF4Kt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 09:39:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bm3W0vDYzF4Kf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 09:37:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="pEqqdmWe"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Bm3V3hkhz8t2l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 09:37:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Bm3V3R7cz9sPL; Tue, 12 Nov 2019 09:37:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.b="pEqqdmWe"; dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by ozlabs.org (Postfix) with ESMTP id 47Bm3V17sBz9sPK;
 Tue, 12 Nov 2019 09:37:41 +1100 (AEDT)
Received: from [10.137.112.108] (unknown [131.107.174.108])
 by linux.microsoft.com (Postfix) with ESMTPSA id 6858120B7192;
 Mon, 11 Nov 2019 14:37:40 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6858120B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1573511860;
 bh=JAJ429uDrlDNbZDkeSdCYcoCvf5POqtncvJncujgjRA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pEqqdmWeWwca6el82Y7BDyoW0kZAMB8in5gjKJPT2x1CG6HOBn/9RiHD4x8RTtit9
 K/rXdmeJTfLfnjR4hDXzrEYWmSGGTUNOl5XZrT/ui95vcOrJQDlI/H1v2sQp5mjse3
 rjQ+HO3OErxJ3Tonv+3R/6GUHlKCF/fQZPMQopUA=
Subject: Re: [PATCH v9 0/4] powerpc: expose secure variables to the kernel and
 userspace
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
References: <1573441836-3632-1-git-send-email-nayna@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <216572e5-d8c6-f181-3ec0-b4a840f20f46@linux.microsoft.com>
Date: Mon, 11 Nov 2019 14:37:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573441836-3632-1-git-send-email-nayna@linux.ibm.com>
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

On 11/10/19 7:10 PM, Nayna Jain wrote:

Hi Nayna,

> In order to verify the OS kernel on PowerNV systems, secure boot requires
> X.509 certificates trusted by the platform. These are stored in secure
> variables controlled by OPAL, called OPAL secure variables. In order to
> enable users to manage the keys, the secure variables need to be exposed
> to userspace.
Are you planning to split the patches in this patch set into smaller 
chunks so that it is easier to code review and also perhaps make it 
easier when merging the changes?

Just a suggestion - but if, folks familiar with this code base don't 
have any objections, please feel free to ignore my comment.

Patch #1
  1, opal-api.h which adds the #defines  OPAL_SECVAR_ and the API signature.
  2, secvar.h then adds secvar_operations struct
  3, powerpc/kernel for the Interface definitions
  4, powernv/opal-secvar.c for the API implementations
  5, powernv/opal-call.c for the API calls
  6, powernv/opal.c for the secvar init calls.

Patch #2
1, Definitions of attribute functions like backend_show, size_show, etc.
2, secvar_sysfs_load
3, secvar_sysfs_init
4, secvar_sysfs_exit

thanks,
  -lakshmi
