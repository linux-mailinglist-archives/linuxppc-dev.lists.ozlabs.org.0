Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C567B30422
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 23:46:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FLkP2Xq5zDqZH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 07:46:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=soleen.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=pasha.tatashin@soleen.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.b="LYlHNdAV"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FFZY3KF1zDqVM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 03:54:07 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id f20so10247276edt.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QlYOqgGgItn5hucl8pZOYZeRpF+/j+lyZEX0rN4v98g=;
 b=LYlHNdAV/SNBSa2OU1jdHVGlps7i+f4ToRjbTl9D2wFgpxOnqYU6L0tHRyBKqXN8PS
 bA20mdUlqFwilW74sDweWwxCRjLlo9fuLRBJptvvxIq+vYgZ96pbtG7pADnxLsZ5u6Ed
 xa3CEpbgxATF5V1HpcSCSGovWdI7wIoti8PlUbQ7uPq+eFKDXrzPzbDKxcOs/rbfxHdW
 3wcYT/Y0vSetxxTI7PMr+4dEKBZMAaPHqAJ4cafp6No1HT2gZdPpzYTqxY9BWFqu5i8v
 c8SEsw9ZPMpf8Cmj587OTzTy+La1UCwO9pu1FiOK6SpUJ9aeYM0ra8QLMjn3GNWlh/JN
 PXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QlYOqgGgItn5hucl8pZOYZeRpF+/j+lyZEX0rN4v98g=;
 b=VEc78tYMtGqk9YuAJrrVSBMznMit9gM4tS5+26aVXcNkNVbFBqsqPOUCdgWF9l9yhu
 nKWEiA/mK/MKq9XBD4zCpBAD7vSQN2dXvOwsMrVEctqy62ulARhaKYjC7aNycGHDcYPO
 grziG8X23zJW6lbzsXWXgJTTHqhI0cTx2vkFarGsWgSXcF8Ss8tDbmtJlIuRNE7RpLIS
 ZjL7sk5aEEW2hBi3F3nSvV+jpKzOoieYhEoDO+7QapBSQ/ybjLHsuLyE9/fn6Yjmi5le
 iX7TqbZVVKinYmTjuM1oxyInM3zCmPXKD/H2Hr7ln/zcwIm3DrpqkiOF27KkpYNnkacW
 e1Gg==
X-Gm-Message-State: APjAAAVr4DXjub83h5XkwVnQsEEV6vMVPunCz8jOHxe/zI1NtSJeQNnj
 ETP8xqm26W9oQklku4wgHmWaceARopkI0tEWQCNufw==
X-Google-Smtp-Source: APXvYqxJpnEky/HQoCMiqMXy5GPOyKza2hJ+52II0wfo1HpL9rVDxjuGoL3UWKguhdIYjncFwf0xnjjAWLfB3JRkG5w=
X-Received: by 2002:a17:906:a354:: with SMTP id
 bz20mr4932536ejb.209.1559238840892; 
 Thu, 30 May 2019 10:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-2-david@redhat.com>
In-Reply-To: <20190527111152.16324-2-david@redhat.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 30 May 2019 13:53:50 -0400
Message-ID: <CA+CK2bBW4vH+J6bam1dOxjSwFwvoOEok0VNO0n_JjyHxpkGj+A@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] mm/memory_hotplug: Simplify and fix
 check_hotplug_memory_range()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 31 May 2019 07:45:15 +1000
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
Cc: linux-s390@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, LKML <linux-kernel@vger.kernel.org>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm <linux-mm@kvack.org>,
 Arun KS <arunks@codeaurora.org>, Qian Cai <cai@lca.pw>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 7:12 AM David Hildenbrand <david@redhat.com> wrote:
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
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
