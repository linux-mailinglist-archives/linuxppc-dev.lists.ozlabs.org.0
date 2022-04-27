Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF6511BE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:28:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpN1m4Lmzz3bfL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 01:28:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c+Td9xCQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c+Td9xCQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c+Td9xCQ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=c+Td9xCQ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpN106B3Sz3bXw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 01:27:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651073260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWPJI3GaP+EemnN1bohfLW5L2SIRlKZhScApda+umvM=;
 b=c+Td9xCQ8SVD7R3f7TAoWahB6tJJMy9HE5+vLpZ/R81kwP1tCw46LiTDPbYIDHNcRrzaMj
 8EBhe7P/o72V9ljvQC4OGBLJpRLeEU7J6cf2iuwgZ/uB7d6wMvsEMIQhd21DNTtjj4FFBj
 1Si3ttlbr3QZksoUcyhHzSDQzWcLmf8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651073260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWPJI3GaP+EemnN1bohfLW5L2SIRlKZhScApda+umvM=;
 b=c+Td9xCQ8SVD7R3f7TAoWahB6tJJMy9HE5+vLpZ/R81kwP1tCw46LiTDPbYIDHNcRrzaMj
 8EBhe7P/o72V9ljvQC4OGBLJpRLeEU7J6cf2iuwgZ/uB7d6wMvsEMIQhd21DNTtjj4FFBj
 1Si3ttlbr3QZksoUcyhHzSDQzWcLmf8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-pRqCEmllN3GaRaKw7ECAmg-1; Wed, 27 Apr 2022 11:27:38 -0400
X-MC-Unique: pRqCEmllN3GaRaKw7ECAmg-1
Received: by mail-wm1-f71.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso2973455wmh.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 08:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:references:cc:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=mWPJI3GaP+EemnN1bohfLW5L2SIRlKZhScApda+umvM=;
 b=aGRCfbi0zFPlTWWtj2/RRv4HExFjdlZzjVAp3UntbAoFxA9iNjmt0/3AN09S+oeuDJ
 cNXFiMcfQ5H5uZfxhZOJi3HyYvlScDUH4REMsSHSUDpVeKJUm1tI8gKK6O8UKHoK5UFs
 odzTQfbbTQ0azOTzk899GogzWHBN3kXTxHE9WFYnzHfrhOfY2Uq+IkkEdQTgZZueTOaq
 kowKtiBjn4vvEf48wj30iAhbNyU8XhDTRhM9KWnjq1onwkJisSngApJQMtVuKiTIAbMr
 VFNfe8qwuB1HmjWQ0j0YqeRhvPsxhyNwVuhX6caCYY+/pgQWx5FKAtqvJD5Z33IoGajy
 ZOFQ==
X-Gm-Message-State: AOAM531guGtSTPfu6iVHH4iZXuVpH4khyRwB9EoiYsXhjDVAPtcM9FQo
 zXiU/rSWqRc97sAP3VmXVTzbzYtwVyFyuyjwEpbd4vTBawWgP1QVlhAHtimtcDav5pnJtZzf4mj
 DFlKDeVkHJgYZvz11k6gmnBcm0Q==
X-Received: by 2002:a1c:e916:0:b0:38e:ac96:f477 with SMTP id
 q22-20020a1ce916000000b0038eac96f477mr36175008wmc.160.1651073257734; 
 Wed, 27 Apr 2022 08:27:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXcrH2krqbyc5aJWCsbmfrh8a9LtDx7A/EaJib4meUuP7AZGmp2ulxlWdgF2g2rPk/kKkMiQ==
X-Received: by 2002:a1c:e916:0:b0:38e:ac96:f477 with SMTP id
 q22-20020a1ce916000000b0038eac96f477mr36174992wmc.160.1651073257526; 
 Wed, 27 Apr 2022 08:27:37 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c1d0b00b00393fbabdddfsm1831839wms.36.2022.04.27.08.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:27:37 -0700 (PDT)
Message-ID: <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
Date: Wed, 27 Apr 2022 17:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: Rob Landley <rob@landley.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
In-Reply-To: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/04/2022 12.26, Rob Landley wrote:
> When I cut and paste 80-ish characters of text into the Linux serial console, it
> reads 16 characters and stops. When I hit space, it reads another 16 characters,
> and if I keep at it will eventually catch up without losing data. If I type,
> every character shows up immediately.

That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
QEMU sources, I think.

> (On other qemu targets and kernels I can cut and paste an entire uuencoded
> binary and it goes through just fine in one go, but this target hangs with big
> pastes until I hit keys.)
> 
> Is this a qemu-side bug, or a kernel-side bug?
> 
> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
> 
> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
> console=hvc0"

Which version of QEMU are you using? Which frontend (GTK or terminal?) ... 
this rings a distant bell, but I thought we had fixed these issues long ago 
in the past... e.g.:

https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28

... but maybe my memory also just fails and this has never been properly fixed.

  Thomas

