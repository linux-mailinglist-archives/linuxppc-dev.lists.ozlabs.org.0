Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B116326E1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 05:25:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HL5x5xg6zDqMn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 13:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p6EmQsSt"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HL4X30sJzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 13:23:55 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id p26so24832562edr.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 20:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pSfpsds9EQbM9WscG0cMmvHxHZNBbzbAhxUSUQzMxEw=;
 b=p6EmQsSt3vDqhOEAwdmtI53kfWo8NyOM/SYeUgm4HfVyXUGbblyzBEvJnA5bHfpVPG
 xCFLdPnD1URb6fyiDAuy641+yfjX2pTPOqINI1Dkw1w4MRtvrUi9PJVzd1YW+ybRtJrs
 cmbdXsMHjSI2Q439j1d2MingD2Mi6Acj+RLRpUWwWtNpOQAtNnAmPyk0uvbecGTv3Ezo
 mJM+RwmKVo0EuneEkAfSZU0AxwmE3ndyzF48eI+0G9be6V1wrOTHhoG6Y8kuIGO6gR4D
 p8AkgiTx7mTFmxTMG0l1mTJD2k46Cxs8BeBLR9E+q43EhepsyS872Lui4rFkACUg7P4I
 DgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pSfpsds9EQbM9WscG0cMmvHxHZNBbzbAhxUSUQzMxEw=;
 b=JCmtKJh+axY534rK4TLRW5q4UtTUwjCVhk+7VYdzJVu1fD71ipVCWE6wLCei3JRDrp
 U/QNQJa/Gi9wNIzWt5zO3JPw4b6w75o2BQt0r4bHAk7DR6/dfRZK9KcIzYCZPtGA7M0y
 8ly3Ix8nO378diDR4LrdzRrW87NKmnftPx+JhbtHky3riairQv2VBs+Y9Vj+6dJn+E/q
 F1/JmJafQM88fGQfrb1AV1mGQnPTaPSxSV29Sd7MVjW/JzANukYXBcReEFimQ9+ATWES
 3lSj+HcR0+r9UHxT5sk03ZDfAdZURMTRbQVVVZESteJCJr63YuvxI0YtWHv+FQ2iZf/y
 VDYg==
X-Gm-Message-State: APjAAAVA6AUDCtIjcE/at0xa3qbMOSqDuK1R+GT5PZjpQzjfzeUNhGoA
 4g8cnRSAFLhyADt/hmTEZ64=
X-Google-Smtp-Source: APXvYqy4Hsm/zoTmC0MBbcJlJ9Z2m/nmDD28JaXgZZmuAomhkyMRxC1lnzngw7n2bVbjhVi1S66Pww==
X-Received: by 2002:a50:f286:: with SMTP id f6mr23354274edm.44.1559532227215; 
 Sun, 02 Jun 2019 20:23:47 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id a40sm3735370edd.1.2019.06.02.20.23.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 02 Jun 2019 20:23:46 -0700 (PDT)
Date: Sun, 2 Jun 2019 20:23:44 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
Message-ID: <20190603032344.GA26021@archlinux-epyc>
References: <20190531185306.41290-1-natechancellor@gmail.com>
 <87blzgnvhx.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blzgnvhx.fsf@concordia.ellerman.id.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Sun, Jun 02, 2019 at 08:15:38PM +1000, Michael Ellerman wrote:
> Hi Nathan,
> 
> It's always preferable IMHO to keep any initialisation as localised as
> possible, so that the compiler can continue to warn about uninitialised
> usages elsewhere. In this case that would mean doing the rc = 0 in the
> switch, something like:

I am certainly okay with implementing this in a v2. I mulled over which
would be preferred, I suppose I guessed wrong :) Thank you for the
review and input.

> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index 727c31dc11a0..7ee5755cf636 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -2123,9 +2123,6 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>  
>         spin_lock_irqsave(hostdata->host->host_lock, flags);
>         switch (hostdata->action) {
> -       case IBMVSCSI_HOST_ACTION_NONE:
> -       case IBMVSCSI_HOST_ACTION_UNBLOCK:
> -               break;
>         case IBMVSCSI_HOST_ACTION_RESET:
>                 spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>                 rc = ibmvscsi_reset_crq_queue(&hostdata->queue, hostdata);
> @@ -2142,7 +2139,10 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>                 if (!rc)
>                         rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
>                 break;
> +       case IBMVSCSI_HOST_ACTION_NONE:
> +       case IBMVSCSI_HOST_ACTION_UNBLOCK:
>         default:
> +               rc = 0;
>                 break;
>         }
> 
> 
> But then that makes me wonder if that's actually correct?
> 
> If we get an action that we don't recognise should we just throw it away
> like that? (by doing hostdata->action = IBMVSCSI_HOST_ACTION_NONE). Tyrel?

However, because of this, I will hold off on v2 until Tyrel can give
some feedback.

Thanks,
Nathan
