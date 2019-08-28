Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E94A06CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 17:58:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JVlX4L9tzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 01:58:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=shuah@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="InFHVs6M"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JVdW3q1WzDr3l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:53:18 +1000 (AEST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D10A22064A;
 Wed, 28 Aug 2019 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567007596;
 bh=6/85+MzB1JJmEyPqfvT2XU196VzVe0Da/hn+nwH94WI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=InFHVs6MWH1gnWoAc3XBoEGci7TX31v4oYyKXQyASPylb9B/f/f/NKujpijCRB9yq
 HjTQRDEkRzEWeu09eK61jLdk8gHjL+8f9hjsuiCsKEMq2bJqiq8WnI74b34D1FqrK4
 JC/Kvcpz6qgHIa019eKMcbL9hjFJtOnHuSGgbfxA=
Subject: Re: [PATCH v1] sefltest/ima: support appended signatures (modsig)
To: Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org
References: <1567005240-12912-1-git-send-email-zohar@linux.ibm.com>
From: shuah <shuah@kernel.org>
Message-ID: <4a9f9cd3-c550-98e4-1513-14ef161c34c2@kernel.org>
Date: Wed, 28 Aug 2019 09:53:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567005240-12912-1-git-send-email-zohar@linux.ibm.com>
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
Cc: shuah <shuah@kernel.org>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, Petr Vorel <pvorel@suse.cz>,
 linux-kselftest@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/28/19 9:14 AM, Mimi Zohar wrote:
> In addition to the PE/COFF and IMA xattr signatures, the kexec kernel
> image can be signed with an appended signature, using the same
> scripts/sign-file tool that is used to sign kernel modules.
> 
> This patch adds support for detecting a kernel image signed with an
> appended signature and updates the existing test messages
> appropriately.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
> ---

Thanks Mimi. This commit log looks good. My Ack for the patch
to go through the IMA tree.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
