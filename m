Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F288EE9B3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:36:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476PjN58LCzF2FJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:36:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rientjes@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OY0XB+pn"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476PdF0v9fzF44h
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:33:14 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id f19so3108166pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 12:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=DnK/FIUjtfMpvgjhYJHwDVVqbAfzXMvLjaoAfA8yVt8=;
 b=OY0XB+pnC7EUpHSQ8yqmSdGzuM19l1QV2njz4lt2384NL+vVsTzKuslwpXHwsk0N+I
 dZMVtGQNTBtLEVBnR8gAD9XNgACmQrzJC68sh448rTQlDayrJqeB0M445s6/jf3cT6Pb
 NZZ+pL+6f4BBHH/B3nMcaAYKUkl2AQQnq6f98/RCiuh6DgUl+/f96fWCFaFlkmskNChx
 MZ/7akyfS7PP1xF/9bTh/55R2+Y5DT5rWJm7Cv0RUqBYhuwjKxViCvgW0uYk/xg33Sc/
 xfRMVnNsQczWqMvmGtgK05lodct1STvVjmeasrhxMRgmb3Ko1i8IBBDPrpRAfsUyE3+k
 eHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=DnK/FIUjtfMpvgjhYJHwDVVqbAfzXMvLjaoAfA8yVt8=;
 b=o7WiOnd+DJybcgQheRHB0KHBfiCdBxMm0zQUwJljtLWgTCKkYnWFB+VT2ucmKCI5GE
 Gp29HXpwdb5eCT4EcMhfH4kUVjfDcIMdXAHhSbXWWiVE4Sk/AALrIlob/VVMIyKWdqaR
 piQB49T+M4WdxBxHttEM9UFLufHKKdjZU9K8ghZoslg3QfVPW5gsosvQbDT0ny7QVCFp
 YSUV4odnJBsqCboUSr7+OxIobEj4+8WZWVLav8asb7dQ4araWSgXKA6dquKoGe2VnkuM
 XMcYNAjwxGast7PdkDQf0RVsxJJT+kQ5v+OOckIrmWfXWWuY/RN1dIfmdqqQGdV5pqo3
 hZfQ==
X-Gm-Message-State: APjAAAUux6u+bZYxSPpIl4N9xJ4WE4oSUgJAqQrY5rrofgI5fGhfFRUi
 9cD4j3vtyh7fIBG+iM+1GZFVuQ==
X-Google-Smtp-Source: APXvYqyhviRnVEE8HSNsRv5kFXmlmiRaKK/VWcjGWZKAhJfF3CiA7Y5Kptgh8pnqs8cZ8TjFJYIjHQ==
X-Received: by 2002:a17:90a:9406:: with SMTP id r6mr1471858pjo.0.1572899590774; 
 Mon, 04 Nov 2019 12:33:10 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id e17sm18228455pfh.121.2019.11.04.12.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 12:33:10 -0800 (PST)
Date: Mon, 4 Nov 2019 12:33:09 -0800 (PST)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
In-Reply-To: <20191103211813.213227-6-jhubbard@nvidia.com>
Message-ID: <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Sun, 3 Nov 2019, John Hubbard wrote:

> Introduce pin_user_pages*() variations of get_user_pages*() calls,
> and also pin_longterm_pages*() variations.
> 
> These variants all set FOLL_PIN, which is also introduced, and
> thoroughly documented.
> 
> The pin_longterm*() variants also set FOLL_LONGTERM, in addition
> to FOLL_PIN:
> 
>     pin_user_pages()
>     pin_user_pages_remote()
>     pin_user_pages_fast()
> 
>     pin_longterm_pages()
>     pin_longterm_pages_remote()
>     pin_longterm_pages_fast()
> 
> All pages that are pinned via the above calls, must be unpinned via
> put_user_page().
> 

Hi John,

I'm curious what consideration is given to what pageblock migrate types 
that FOLL_PIN and FOLL_LONGTERM pages originate from, assuming that 
longterm would want to originate from MIGRATE_UNMOVABLE pageblocks for the 
purposes of anti-fragmentation?
