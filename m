Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F276EB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 18:17:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45wDkr31nXzDqRr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2019 02:17:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="GhJtb6y3";
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wDj11D0WzDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2019 02:16:02 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f20so15770449pgj.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9pxdI8Q1eQGc6MFJDXbX8IPKQf5e9FjRtdij/Ccdk+g=;
 b=GhJtb6y3IvR2euTrzUQLBPzuWpMC1r078nOKLTS2B26A9HymM6QBFZfT03uDUsxGMt
 qEU5Dj5ZPRoFY2MiQMolT8V6egN2ZpXNx0R/y1ExRSFTnrcIQQkTlH+qisWgVrr+fhu5
 fwWtJB/yQ5JNCDew1FsG+XjvLgH1fzf99fEmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9pxdI8Q1eQGc6MFJDXbX8IPKQf5e9FjRtdij/Ccdk+g=;
 b=ROX3yxdLbOv77fJGhU0Q+iSErFdJm6rH+GZnE4cfU6rpj4U909gP8KzyKWI5PPAp6u
 rLTpipHfpt7w2TwN46ErfRGTZowYqMbE7fMQiDgD5YzMqtlnYFh0LFjQkqoQA1PUe52T
 FZO5BTblHBQVcbvBZ9HaPu6dkYAK1oYh7zAF03FPdofiPTqAnNzoCH1HhuWxnhAWs0qK
 4uCiZEY92w/iSjn+o9uACYQULdOisyD7meTY1LnchHO6PdNuLzyvZY4aInGkGqJDWtoV
 hX5J4U2uZWl2rYMWoYN34zOedmzKLAEvNnoSn3wtdTDBTdpRENuiP1JE2Ap2cECBlzXY
 PdUQ==
X-Gm-Message-State: APjAAAXIyC+na3FtwF/F51LkprvsuBvvt3vfqUFtwNwhB6jbLJlW/4cJ
 SAMdh6xeNuWDR6pUOUh7uNHZmw==
X-Google-Smtp-Source: APXvYqxorBpjLgP/KwuMcH8kC+695azPg68CPTEJ3NXXlbisGsg21F6WBT3zy6Q5jm5oFPVjAt8Owg==
X-Received: by 2002:a62:5344:: with SMTP id h65mr23349574pfb.32.1564157758990; 
 Fri, 26 Jul 2019 09:15:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i126sm61479400pfb.32.2019.07.26.09.15.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jul 2019 09:15:58 -0700 (PDT)
Date: Fri, 26 Jul 2019 09:15:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [RFC PATCH 00/10] implement KASLR for powerpc/fsl_booke/32
Message-ID: <201907260914.E37F9B041@keescook>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <e6ad41bc-5d5a-cf3f-b308-e1863b4fef99@huawei.com>
 <201907251252.0C58037@keescook>
 <877d818d-b3ec-1cea-d024-4ad6aea7af60@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d818d-b3ec-1cea-d024-4ad6aea7af60@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, kernel-hardening@lists.openwall.com,
 thunder.leizhen@huawei.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 jingxiangfeng@huawei.com, diana.craciun@nxp.com, paulus@samba.org,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2019 at 03:20:26PM +0800, Jason Yan wrote:
> The boot code only maps one 64M zone at early start. If the kernel crosses
> two 64M zones, we need to map two 64M zones. Keep the kernel in one 64M
> saves a lot of complex codes.

Ah-ha. Gotcha. Thanks for the clarification.

> Yes, if this feature can be accepted, I will start to work with powerpc64
> KASLR and other things like CONFIG_RANDOMIZE_MEMORY.

Awesome. :)

-- 
Kees Cook
