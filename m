Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7716C61
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 22:43:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zBQ76zlGzDqFw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 06:43:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="n2cLf9Qv"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zBKG1cfKzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 06:38:57 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id g8so16269187otl.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 13:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6pfRHejW3cZFOE77y3IUUX4go4AGbYiRoY6juBt94WE=;
 b=n2cLf9QvpatFw6Fx6Im50C3lqxaAWG43jr2hC2ev1xZpfJ6J8FUzxhXEUavTl94SZm
 SVHlKHKIcM/ZhfovCw4MijKPgzW/E+HLz4qZ175x7tfNV+dQC05A0tETwYssL7clan9W
 UsEpcZNB+TJeQSbZEqorEcfiOUdbu+Sy8m9YAZ3S+el0grhl2bD78JddE66O4Q+1avuY
 KR225hZ12kjGn4PRHpeZLqKoFnuS+tJCq4z76VyCpIv4O/vr+Au5mfwKYyPGTxiEapDr
 R3GKFkX289EisuP8nBoU3VOoPxvd3l0FVJ+ulJz6IltOlc4nobKQXXstnEsx5ZFdmsTb
 rEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6pfRHejW3cZFOE77y3IUUX4go4AGbYiRoY6juBt94WE=;
 b=Ww1wPcRPRRjK7AGcYiraZR1mqStevw/xWHLY1HXP1I4bWsQoXEg3uflNKaVLGWjVY5
 bNt51HcJC2ysAkP6HwtYyk7z+qXTbeWfmH97lJnxBsGNVf0km/d0dco1UhklVBjx3vnh
 fTm6p87t9ZjG5nPUmSh2k6o26cIzMYrX0c3bUJatTJxdZohY0m15AOGckGJqRBDOSlis
 VcahI6QcMI3Ddy4QzBSVpW6ysFr7aqwbgfAueMpfZMPbxNKZ0GRdrJJdkPor39MWfWGi
 /Go+Ual+VZIPAdGwvTRJH8PWzvLxBZUvumuU+T0KhDqcOBIPUHpDheRUYloLrBlqKcav
 9cpA==
X-Gm-Message-State: APjAAAWQXqYf3S/DhoIynlKNf/zdLaPH+1mY9i2Tu9MlpUfQZJwvLjyk
 PfTQ/t6BlMV8khVKVdkW4LHo7wOjbVgfCVljY6/JtQ==
X-Google-Smtp-Source: APXvYqyoyS46mGkeS8xfe2+s5llXVwHTTrq4TjXi1ZN6I2Su0aHjvxJMNj2Psjrwn9yCamOWlD6+DD7mFrLZ6kZfD1Q=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr21322434oti.229.1557261534468; 
 Tue, 07 May 2019 13:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-2-david@redhat.com>
In-Reply-To: <20190507183804.5512-2-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 13:38:43 -0700
Message-ID: <CAPcyv4jCtOYLCtAhRPhGrHZKyvHZmE8i1aGsRRBWk+G0v4EGAg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] mm/memory_hotplug: Simplify and fix
 check_hotplug_memory_range()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Linux-sh <linux-sh@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, Linux MM <linux-mm@kvack.org>,
 Qian Cai <cai@lca.pw>, Arun KS <arunks@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
>
> By converting start and size to page granularity, we actually ignore
> unaligned parts within a page instead of properly bailing out with an
> error.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
