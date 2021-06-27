Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B403B5538
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jun 2021 23:12:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCk3H0RdGz30D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 07:12:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.177;
 helo=mail-pg1-f177.google.com; envelope-from=bart.vanassche@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCk2w1cwVz2yjK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 07:12:23 +1000 (AEST)
Received: by mail-pg1-f177.google.com with SMTP id v7so13582594pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 14:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cR0LSa7hQHxDZ8gB3Did0Bb+VeSNqfYHg3w0G+AVSOY=;
 b=dMb8f3PiOpBa0+H4OI74GjKAYxQfi9Mrt3WL7uLLdQ68gJRwKHEXAxeM4k0XrjSFD9
 tH8HwPkPKQ8WzYuepvsNoBhu/bBiZu04kocLgbzSHTE9/+8YglEhluKW1FuY1GsQ74/a
 +3AZuapCioxqJHCaecZiehfOEM9kRZMjkgN1Jaxbrn6F9LzTA7PrYnCVQTgATmN1JFs+
 znARdgfHPbZ2SohO482u8vmqmyAbYLUZdDpELeyIxc5o5BcefXU3t89vO7csmHAH13ae
 TaquYSNICe+9XJiC3xfOO0WyqpJW/pD+wake4Xi3ZEuvDhN5MBo9gWcmL8gh1YFhMA6z
 1uVw==
X-Gm-Message-State: AOAM5311dLMhu+RBPXb2uPGlIMoV2TOdwRkfyUHLDA70tRRjgcFR80oh
 bcqpI4IRHsvCzozdQqtHNes=
X-Google-Smtp-Source: ABdhPJz2dvDEjoTFobY6u4OvX1N/qlgiX9LWwds3dVb5opirv0byCScSz57eVmf9KYDYqsVvc2ZtXw==
X-Received: by 2002:a63:191d:: with SMTP id z29mr20515543pgl.126.1624828335119; 
 Sun, 27 Jun 2021 14:12:15 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id z26sm7862066pfk.112.2021.06.27.14.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 14:12:14 -0700 (PDT)
Subject: Re: [powerpc][next-20210625] WARN block/mq-deadline-main.c:743 during
 boot
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-block@vger.kernel.org
References: <74F24228-8BC7-49FA-BD43-A9FB90269E76@linux.vnet.ibm.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <d9bb36b5-fb81-8394-e80c-1dc4562376e4@acm.org>
Date: Sun, 27 Jun 2021 14:12:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <74F24228-8BC7-49FA-BD43-A9FB90269E76@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
Cc: axboe@kernel.dk, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/27/21 6:30 AM, Sachin Sant wrote:
> While booting 5.13.0-rc7-next-20210625 on POWER9 LPAR following warning
> is seen [ ... ]

Please help with testing of the patch that is available at
https://lore.kernel.org/linux-block/20210627211112.12720-1-bvanassche@acm.org/T/#u

Thanks,

Bart.
