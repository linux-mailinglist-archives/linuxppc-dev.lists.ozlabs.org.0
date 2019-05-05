Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABEB13D8D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 07:30:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44xZFY3q9YzDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 15:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=d-silva.org
 (client-ip=66.55.73.32; helo=ushosting.nmnhosting.com;
 envelope-from=alastair@d-silva.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.b="mL/hJNzk"; 
 dkim-atps=neutral
X-Greylist: delayed 550 seconds by postgrey-1.36 at bilbo;
 Sun, 05 May 2019 15:28:53 AEST
Received: from ushosting.nmnhosting.com (unknown [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 44xZD564jZzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 15:28:53 +1000 (AEST)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 669C22DC0068;
 Sun,  5 May 2019 01:19:38 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1557033578;
 bh=jTyWNX0tenu8oSQr1YIabggyKqUeXI66jOG52Th+zoI=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=mL/hJNzkdJZkxnMvbbWj1t882MsD+hC/wqp2+mlgQnaNxKIBDEH0uegq984+iGuLT
 J6tsN3djphhaKLr9Tfjki7hCjn17efcZzii65JN7bHtpzydbag3GVokQQvopgn5o9x
 NSGqSgvTaH0a2oHAYp+zgDEq60tZkb9foLNHGhDBG32BWwMbGwrKy2SbBOK7MbUWgw
 rCfaBofYJ5XsT/Yx3hDGRxtE1qt6/tGCniwIlZOZfXr7QVoNSMYgWvjYjKMDvvcEKK
 hUyKkpIEVn8y+8Q2GM7V56eCgNtiKjQkwet3km60McmutYTNPryVZR3v2UkkuifdQb
 dy1FL3jTFG05TpMbcNjbFZUiLc6FPJMMj1QsXNofjPaxzsQ+dHArD1oQNgt4tth3e8
 D2jaeRg8l4SzFnt8bpyjdDGNZ0x95rNj+0MVaMXxfc+VdknxRGj+/Vms8KmxW2PBs1
 B+p6LEd/oH4Xll/9M9iydCluUIwAw+E1uIrcQumtwTaRPegVxWVCb6xtU//7KUVIIW
 TyGPE3O0iowGR0lxm3d1Fuw//BYpkyF92otb5rlT7p0fSY/NSY+CQruEeYKAIxjK3y
 NnzzslYESFYRdfl5XxzTpaRUAFQ2IV2ULnKDsXkxZE83jO1UcA1LzhnNEpK2ijB4PN
 /3yq50LD6t15MHAApax1s8P4=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id x454ki37097385
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 5 May 2019 14:46:44 +1000 (AEST)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Wei Yongjun'" <weiyongjun1@huawei.com>,
 "'Frederic Barrat'" <fbarrat@linux.ibm.com>,
 "'Andrew Donnellan'" <ajd@linux.ibm.com>,
 "'Arnd Bergmann'" <arnd@arndb.de>,
 "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>
References: <20190504070430.57008-1-weiyongjun1@huawei.com>
In-Reply-To: <20190504070430.57008-1-weiyongjun1@huawei.com>
Subject: RE: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
Date: Sun, 5 May 2019 14:46:46 +1000
Message-ID: <01d701d502fd$8c2da240$a488e6c0$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJOAUDns2AVT+PBmhNLMaSajBbpZaVp+Ezg
Content-Language: en-au
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Sun, 05 May 2019 14:46:45 +1000 (AEST)
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Wei Yongjun <weiyongjun1@huawei.com>
> Sent: Saturday, 4 May 2019 5:05 PM
> To: Frederic Barrat <fbarrat@linux.ibm.com>; Andrew Donnellan
> <ajd@linux.ibm.com>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; Alastair D'Silva <alastair@d-
> silva.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linuxppc-
> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
> 
> In case of error, the function eventfd_ctx_fdget() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/misc/ocxl/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c index
> 8aa22893ed76..2870c25da166 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -257,8 +257,8 @@ static long afu_ioctl(struct file *file, unsigned int
cmd,
>  			return -EINVAL;
>  		irq_id = ocxl_irq_offset_to_id(ctx, irq_fd.irq_offset);
>  		ev_ctx = eventfd_ctx_fdget(irq_fd.eventfd);
> -		if (!ev_ctx)
> -			return -EFAULT;
> +		if (IS_ERR(ev_ctx))
> +			return PTR_ERR(ev_ctx);
>  		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler,
irq_free,
> ev_ctx);
>  		break;

LGTM

Acked-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece

