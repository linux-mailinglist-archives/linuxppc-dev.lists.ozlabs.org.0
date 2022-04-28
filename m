Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B84512B3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 08:00:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KplNF5PfSz3bp2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 16:00:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=landley-net.20210112.gappssmtp.com header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=QsPFOxsz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=landley.net
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=rob@landley.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QsPFOxsz; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KplMY6zwnz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 16:00:08 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id y63so4340725oia.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 23:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=dwbQm1VnzIZbY2anbYhUFvRcuN5zNqRnT0QiofDbYFM=;
 b=QsPFOxszwAea8I2uDx2LL3px60JVaGQdFIl0s5GnXNBKEYdEKcKhvMKT+UK0sK00nW
 pYOJfUwIE0QylyPMt56mqqFa9gzHHzG3OzJ/0gv4Z4li1YqrCV0PhMRVbpJ/786tugtV
 CGYtO28C/cNf9pgN0zXN30dKpI47cNkBXSiHKXOT1Qnj3eXaVFsLTzvOs0xLts05FDnY
 FtsKIOkN0L5HbzMuGsIe7CCGAMnug8WJktAP+yshAD3DAGMxNcI+Hu51xl5lpL9E5ehK
 ZDBxkuX3nyROEbtcqstM1DnBWZIeT88cKuQ8kfDau81bPtF7zZQEnDkhQCy2W24bISAQ
 EkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dwbQm1VnzIZbY2anbYhUFvRcuN5zNqRnT0QiofDbYFM=;
 b=XF5npGziCtak0Okbnu9w0AaDRDqq0T1JHCX3O8OmEiZR+aUn7YhNR+P7xjWZs5jUhU
 O7X5/oIHjI8pAh55a1soXf+5q9/ncBPdyKxDkYUTHciU4Ke+lc+Yi1Vo7vyykY+bwCpG
 sqnszFjxkEdF1k8bI+UGF+sUp8lfJmOxlCNESkXPAoAZf6/SIkhDDcC/3FDLnJiHfCYB
 8gYP4x0aVWgP5OFrq3kssxxldq2WgFUnuGv5uUGgQ1GXdhH99NgC7mPLXdU1sCaZp7KW
 fR7MGCqFJayonXmhqn8AjexqXEuT1WxXXeZkFnXIEvlqAIwvp2vOtWvDYl6VlmSRlx2g
 jlRQ==
X-Gm-Message-State: AOAM530Nr8JF5qDpoEX/+ubPIKcpSjN7HJ9/jbVV4vvFrEc/kk6MSO8b
 TRQwK6K+LKE+5src+UcgMAlDoj5j1vmaJQ==
X-Google-Smtp-Source: ABdhPJydMG7AIJHy4NILtehzI/2byH735WJAOu42PHnGZD4ghQspODKJV6nPMPs0hDYUjPFmJjIjTA==
X-Received: by 2002:a05:6808:1645:b0:325:5182:a9ca with SMTP id
 az5-20020a056808164500b003255182a9camr7430840oib.104.1651125604567; 
 Wed, 27 Apr 2022 23:00:04 -0700 (PDT)
Received: from [192.168.86.188] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a056870028400b000e5aa7f2cadsm1525070oaf.3.2022.04.27.23.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 23:00:04 -0700 (PDT)
Message-ID: <45188be3-0e1a-8645-f7da-3c87a6f8d8e5@landley.net>
Date: Thu, 28 Apr 2022 01:04:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
Content-Language: en-US
From: Rob Landley <rob@landley.net>
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
 <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
In-Reply-To: <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
Content-Type: text/plain; charset=UTF-8
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



On 4/28/22 00:41, Rob Landley wrote:
> On 4/27/22 10:27, Thomas Huth wrote:
>> On 26/04/2022 12.26, Rob Landley wrote:
>>> When I cut and paste 80-ish characters of text into the Linux serial console, it
>>> reads 16 characters and stops. When I hit space, it reads another 16 characters,
>>> and if I keep at it will eventually catch up without losing data. If I type,
>>> every character shows up immediately.
>> 
>> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
>> QEMU sources, I think.
>> 
>>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>>> binary and it goes through just fine in one go, but this target hangs with big
>>> pastes until I hit keys.)
>>> 
>>> Is this a qemu-side bug, or a kernel-side bug?
>>> 
>>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>>> 
>>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>>> console=hvc0"
>> 
>> Which version of QEMU are you using?
> 
> $ qemu-system-ppc64 --version
> QEMU emulator version 6.2.92 (v6.2.0-rc2)
> Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

Just confirmed it behaves the same with current git (commit cf6f26d6f9b2).

Rob
