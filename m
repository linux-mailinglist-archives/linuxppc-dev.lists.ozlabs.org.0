Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4A189B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 14:24:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450CG11PrNzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 22:24:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qk8MMLe0"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450CDN1hsSzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 22:23:10 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id p26so1866194edr.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kK0i9uM3pyYFcRAwxUAkFyXbwheiX8gFOss9me4xCFo=;
 b=Qk8MMLe0+SuyWjMgP91XatGFW2t4dggZxTtSGYKpznsJLPVr8BcONtuSS7vK2+gf7K
 AOz8f2Re+43WGH4w2gU97ZACFASGwvlJ9BsYZk/I6zKhqxZtdFYrjX/38dnU40HQkh1U
 G4tN2R4s9R9CwWJ/bmndCbeWVPryUwwLWlbwiPDwH/eQq8vJx/xuBrsY/S0DY47vftPl
 beRNHavogoku7ouurr5Qk28cy6CYq3fUoDbbB7XwFqW/xUFQkGf9jzXQyPoxzYSR02oS
 LuXCyGRPIx2GXpfe/NaXJcWMPc29xGk8RCsL4VkdyzOoOb94p8cK40z5g0o66s7TUtCa
 IGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=kK0i9uM3pyYFcRAwxUAkFyXbwheiX8gFOss9me4xCFo=;
 b=ipptHoqsXOooxrSVJi1ux4gcgOe0K3wdRF6CP6DNGjcNxFgPWt643Rk39mJusIIFiT
 AMFOdPQ2xQLIMbffwH8OZBkbetHeqQYoryxz6tNW5u9oloTYXayFU6vQLBHWOasQb87U
 UmK0hadZGrCjRJsMTdsDODawkOukeoUmU+u/YUkavhFGg2zTiKaMFcgzR7/i9ILckTVr
 /wGUdBIPS4xtfSC/r1Rcha82joEjYOK9+NJy+EqgKhvfdiNlJHIvsmzW5bObG92oBZwN
 z+PjLsgamKaWVhVZ0Sh3WTugDdjl/RcDDxQJnTFFh6nrpWK/v0dGRpWNYgxHtfDjKj7a
 b68g==
X-Gm-Message-State: APjAAAUDFrxHTap4Vo77xZ8bkFunyT6uU0ilM+HgnJroTnnc8rrsa3J8
 +XBZ+CPPenqlYqcLuuuT3A8=
X-Google-Smtp-Source: APXvYqx/LQ9p+oEzzHrZ1uIdWPZDCJZ5+WDWvbYvuz3X/C9E2PgZsOqljcdk3brSDSoy+FnXpjuuOw==
X-Received: by 2002:a17:906:5013:: with SMTP id
 s19mr2949960ejj.203.1557404586529; 
 Thu, 09 May 2019 05:23:06 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id c2sm299961eja.61.2019.05.09.05.23.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 05:23:05 -0700 (PDT)
Date: Thu, 9 May 2019 12:23:04 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/8] mm/memory_hotplug: Simplify and fix
 check_hotplug_memory_range()
Message-ID: <20190509122304.haksywk3p2ks6gcg@master>
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507183804.5512-2-david@redhat.com>
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
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 linux-sh@vger.kernel.org, Mathieu Malaterre <malat@debian.org>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07, 2019 at 08:37:57PM +0200, David Hildenbrand wrote:
>By converting start and size to page granularity, we actually ignore
>unaligned parts within a page instead of properly bailing out with an
>error.
>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Michal Hocko <mhocko@suse.com>
>Cc: David Hildenbrand <david@redhat.com>
>Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
>Cc: Qian Cai <cai@lca.pw>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Cc: Arun KS <arunks@codeaurora.org>
>Cc: Mathieu Malaterre <malat@debian.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>


-- 
Wei Yang
Help you, Help me
