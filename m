Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8E48C2CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 12:05:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYl8X39SJz30LJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 22:05:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3kfY68G;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3kfY68G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=M3kfY68G; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=M3kfY68G; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYl7p63Mmz2xCM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 22:04:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641985476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQRmWQJO7h35wGy22fa7tdbvt7nutmZtPTdgCQaUOQQ=;
 b=M3kfY68GE+dYQYOrIAD6qpxDGtdqdsgzCW7zV+E0zRJI6sRVO49KO3YS+6MVS9CD1WeAM7
 +NJDXx6Bc0oKeC+9Sxr3Wu9xCZ21WRlXxFRBAwFM8dXTteQ+qMZmdiAnbbbLWdx8oY59e0
 TVio8LF2zPVrRFrLAW5iWFSWjcFQtY0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641985476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQRmWQJO7h35wGy22fa7tdbvt7nutmZtPTdgCQaUOQQ=;
 b=M3kfY68GE+dYQYOrIAD6qpxDGtdqdsgzCW7zV+E0zRJI6sRVO49KO3YS+6MVS9CD1WeAM7
 +NJDXx6Bc0oKeC+9Sxr3Wu9xCZ21WRlXxFRBAwFM8dXTteQ+qMZmdiAnbbbLWdx8oY59e0
 TVio8LF2zPVrRFrLAW5iWFSWjcFQtY0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-8mcjcjLTNXGfDdCBUmML8w-1; Wed, 12 Jan 2022 06:04:32 -0500
X-MC-Unique: 8mcjcjLTNXGfDdCBUmML8w-1
Received: by mail-ed1-f72.google.com with SMTP id
 z9-20020a05640240c900b003fea688a17eso1950525edb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 03:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eQRmWQJO7h35wGy22fa7tdbvt7nutmZtPTdgCQaUOQQ=;
 b=hxHtoitzK6IQsnk6cnGhBnD99MWeH9haa8BQ4bRruDxOHcw7OP0VhGJbswxAt5JV7v
 Fb93/bWeLTpYn8oS+knh5AO511TDuDqayyFnTSthJw4jhG3ho2/3GNQt+nxy+Ke7K54w
 IrHtxhWiXheZQ//yS4j/rI949T4O3df64fdp28Xpim/ftoU6uMQqG2cypBpjPu+st096
 60IvbXM301D10+C0W/aJScSVQQE6OsHk08aQvSviNSLHEhWMTeJ31lp3h9+dIVvrzV2V
 kYXVu8V76DoBLPYSW7omBmRAuSpQXS+ligbu6AAot40H/Ph75nvLJSh2vyuKITaQ4plR
 dqbw==
X-Gm-Message-State: AOAM531Seytwy6QJnLO2m8rkMViklrQx3zxFVbX0QWHqfiiLn/OCEt81
 71J2f1msvGaH3z0SC7gklJZ25rXZWdUCZUaEcaGHUWz4mZQ3ZgMSeZLsHFwotCrN9IV8L8xkUL1
 gLaSgMOka6LKj1plOHN+8vDRq+w==
X-Received: by 2002:a05:6402:486:: with SMTP id
 k6mr8580284edv.330.1641985471846; 
 Wed, 12 Jan 2022 03:04:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLu6iWsDVwPl07dmV9nmwCMbbplxs+ZFDOgPiX/VhbSWFK2LAa03DeMHirncilimRMIa9S6A==
X-Received: by 2002:a05:6402:486:: with SMTP id
 k6mr8580274edv.330.1641985471689; 
 Wed, 12 Jan 2022 03:04:31 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id qw4sm4413621ejc.55.2022.01.12.03.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 03:04:31 -0800 (PST)
Message-ID: <970ca2a4-416d-7e8f-37c7-510c5b050f4b@redhat.com>
Date: Wed, 12 Jan 2022 12:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 3/8] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-4-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220105214756.91065-4-zi.yan@sent.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.01.22 22:47, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> alloc_migration_target() is used by alloc_contig_range() and non-LRU
> movable compound pages can be migrated. Current code does not allocate the
> right page size for such pages. Check THP precisely using
> is_transparent_huge() and add allocation support for non-LRU compound
> pages.

IIRC, we don't have any non-lru migratable pages that are coumpound
pages. Read: not used and not supported :)

Why is this required in the context of this series?


-- 
Thanks,

David / dhildenb

