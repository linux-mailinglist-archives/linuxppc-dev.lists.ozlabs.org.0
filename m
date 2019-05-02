Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E854311B9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 16:39:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vyZT1HQpzDqHl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 00:39:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=codeaurora.org
 (client-ip=198.145.29.96; helo=smtp.codeaurora.org;
 envelope-from=mojha@codeaurora.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="AZixdJk/"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="AZixdJk/"; dkim-atps=neutral
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vyXy4YW0zDq9F
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 00:37:53 +1000 (AEST)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id E5194607B9; Thu,  2 May 2019 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1556807871;
 bh=LFrnrg1kd52WYVEfpqt6x7qXfH3+6LG4aPrINU56sFQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AZixdJk/U74e2NG2xXw2qB0k18C4BojmhLUimCgLlQJ3NbXItjLv6raL1y9JuR7sd
 iwV/NWforWtg/Hywt/9BKAchq+elwr7kg62wC7VY0091OTr3wWzJ6CECs49ueTMCy4
 OX6rFDDo6g/SYVFsxxoCSCAo0/XFmctFfV6QzWAg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.204.79.15]
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B901607C3;
 Thu,  2 May 2019 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1556807871;
 bh=LFrnrg1kd52WYVEfpqt6x7qXfH3+6LG4aPrINU56sFQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AZixdJk/U74e2NG2xXw2qB0k18C4BojmhLUimCgLlQJ3NbXItjLv6raL1y9JuR7sd
 iwV/NWforWtg/Hywt/9BKAchq+elwr7kg62wC7VY0091OTr3wWzJ6CECs49ueTMCy4
 OX6rFDDo6g/SYVFsxxoCSCAo0/XFmctFfV6QzWAg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B901607C3
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH][next] KVM: PPC: Book3S HV: XIVE: fix spelling mistake
 "acessing" -> "accessing"
To: Colin King <colin.king@canonical.com>, Paul Mackerras
 <paulus@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20190502102313.25093-1-colin.king@canonical.com>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <a7883281-bae0-694e-8436-f385023c1f88@codeaurora.org>
Date: Thu, 2 May 2019 20:07:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502102313.25093-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/2/2019 3:53 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_err message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh


> ---
>   arch/powerpc/kvm/book3s_xive_native.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 5e14df1a4403..6a8e698c4b6e 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -235,7 +235,7 @@ static vm_fault_t xive_native_esb_fault(struct vm_fault *vmf)
>   	arch_spin_unlock(&sb->lock);
>   
>   	if (WARN_ON(!page)) {
> -		pr_err("%s: acessing invalid ESB page for source %lx !\n",
> +		pr_err("%s: accessing invalid ESB page for source %lx !\n",
>   		       __func__, irq);
>   		return VM_FAULT_SIGBUS;
>   	}
