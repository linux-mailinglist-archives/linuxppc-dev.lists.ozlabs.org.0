Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775F1A1766
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 23:32:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xgbJ6RsMzDr3N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 07:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=richard.weiyang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GHbNDz0o; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xgYG1WftzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 07:30:09 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id 65so5564403wrl.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 14:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xeOb7bw7ZU05WWRpiZXDbb732pxeQMi4LbeTnQvk5RI=;
 b=GHbNDz0o8lcP5xbu+Wb/yshUnWPBucml6fsGMRJi7IBP7dlySYYTU+1q09y0DGhMZ5
 l+vEnigD2NFXbI2q9UGJX0uKIiYrZHR6Z0PPksE81MY8Ij18sJ15Swrxe+rgJxmlxvHG
 wgmgqsIm4ZTFD/9Uck+I6zXU2Phju7lN0KT6wsP9QYYd5Zf/hxU0LKqjFyLjLzPDpsd0
 HCnXfUYrCTWW/GmGqoRSbUOCYwpq8WpJQPJGI5n1IhUT96jNUjfacOh4zsltx4qHHbIr
 4JCy2UJtZyDC14m7/+K42dxM9U71fsoXZNlZcS3a215KLEzfZzN+CV9GBtnoFqijrgHE
 PskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xeOb7bw7ZU05WWRpiZXDbb732pxeQMi4LbeTnQvk5RI=;
 b=YXuU7ClNRIovIH0/yFhtwAiBquNQOsrUoYiU8gUaeW7NG3yBCDwlbuV9uZNqvh25FR
 xDGGTFaZICfuMHSeOCu51KImColMZZr9BagJYi4+nj+iGPR9oHZfUJwA0WoqDaVLTPb4
 YUTvLCySbs0erjoxLBWCAr4vpz7j0xc2aiXgl24LDsBkUtlthP2vng8n7bPdqeJnh3ra
 nmcZLZ4lb46TTjfNz+oOAJCOKqQnHrzc7xtEJfzrlQWit5ePg9lUHlNsi+syDVLmJAsE
 S4RLPDg7UZxLXxJHlwqKEle/uJpi8UnR+s2Clw3CYhIxnyp5/5lQABerGn1G7UCgWk0F
 V/cg==
X-Gm-Message-State: AGi0PuYctizABnnPInnE/8qvfclIpV8qoWCTau8wYyQDUIFwScJbkQQO
 /m76OXlvxYX492zSsgG/4GI=
X-Google-Smtp-Source: APiQypLgEgrDf34HSgRuIR4yNy76OxilPFRw0shtbt54IFPaMkrRIaOXKXmW1ahdPA+N0lBTKuGvuw==
X-Received: by 2002:adf:916f:: with SMTP id j102mr4530675wrj.335.1586295005505; 
 Tue, 07 Apr 2020 14:30:05 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id t67sm4438171wmg.40.2020.04.07.14.30.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Apr 2020 14:30:04 -0700 (PDT)
Date: Tue, 7 Apr 2020 21:30:04 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] mm/memory_hotplug: remove
 is_mem_section_removable()
Message-ID: <20200407213004.xeipetht4eq5g72r@master>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407135416.24093-3-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Michal Hocko <mhocko@suse.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 07, 2020 at 03:54:16PM +0200, David Hildenbrand wrote:
>Fortunately, all users of is_mem_section_removable() are gone. Get rid of
>it, including some now unnecessary functions.
>
>Cc: Michael Ellerman <mpe@ellerman.id.au>
>Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Nice.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
