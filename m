Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9784C00B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 18:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K36Mj3zRKz3bVx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 04:57:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1Y9hBwC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1Y9hBwC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=atomlin@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=T1Y9hBwC; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1Y9hBwC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K36M00dZLz2xrj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 04:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645552629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=;
 b=T1Y9hBwCAp+Zn3JT6xpWEyfR1QnIkNsNMbNa0BCflRWedtGlB462I+lGaEoHcP4V1TJhZP
 Y/fNCDutTY6NhAhdkWT4fTVio5jQVUpuUgVhph/TgUp+maViTvhK5FviAofX6b0fK7h1Pn
 LxXWOO54mMx53cPpxdj5kuGVmMfpA3I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645552629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=;
 b=T1Y9hBwCAp+Zn3JT6xpWEyfR1QnIkNsNMbNa0BCflRWedtGlB462I+lGaEoHcP4V1TJhZP
 Y/fNCDutTY6NhAhdkWT4fTVio5jQVUpuUgVhph/TgUp+maViTvhK5FviAofX6b0fK7h1Pn
 LxXWOO54mMx53cPpxdj5kuGVmMfpA3I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-oxpqT9ydNomY7QWqJZTLow-1; Tue, 22 Feb 2022 12:57:07 -0500
X-MC-Unique: oxpqT9ydNomY7QWqJZTLow-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so9264245wrc.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 09:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hJzZgeDzNY7zmhhmPD8Ts6QhadgVuW+LtnZrIEdFmk4=;
 b=HSlNUOJSUsOG+blJlflTMJwoHW933Ltl6E2vv3JmDiKlm0aYQcCe1FON1UixPhWw0G
 cznDX2iOI0jFvxLkeBmvuSwoBjtfoGsRk6Pym4lZLMmPv9Hl1EZcbTsPXctgXJ7owOVV
 ac+ZqXbSdsjqSZWyrRCqwmIPjJ1stJ0vk8x/Xm7agQ5E+CNS5pdfjEnXJyNF6wENEPYd
 4AY40er5SJPxxfdhGyRORPd+GK9jyHINC22AEWXnJR5yRAp0up1o3UE3K2vTH3LBGDl9
 e9fdeQXK8ytPTYwMXbQLtjzgv0IcVaMlVNqx8DMCrpa/6FQ0JChVeHOg1FYWMMVoc+Ck
 nGUQ==
X-Gm-Message-State: AOAM533ecxVp3fG96gBNXHsZnwPFSJWD/RCeCJvF7MuqGYyZgicab4qn
 lS2jPyS0pVC1SAPpsvRWSdU57569Wdo5KQgH4UtqyTl3jjbtJdOjdaYJT5DAOg9OaIgAcJT5AWm
 80OnwQCPhUxH6EadZSpTpFEGA
X-Received: by 2002:adf:e10a:0:b0:1e3:3188:79c7 with SMTP id
 t10-20020adfe10a000000b001e3318879c7mr20431440wrz.329.1645552626669; 
 Tue, 22 Feb 2022 09:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBLqieyLWhR9YxZvOyFiDe21CGa5pv2+OROhVCjx6WLj1pEI28rUPcGkTq6FUILDxoAizVhQ==
X-Received: by 2002:adf:e10a:0:b0:1e3:3188:79c7 with SMTP id
 t10-20020adfe10a000000b001e3318879c7mr20431432wrz.329.1645552626509; 
 Tue, 22 Feb 2022 09:57:06 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net.
 [82.17.115.212])
 by smtp.gmail.com with ESMTPSA id e7sm33021244wrg.44.2022.02.22.09.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:57:06 -0800 (PST)
Date: Tue, 22 Feb 2022 17:57:05 +0000
From: Aaron Tomlin <atomlin@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 1/6] module: Always have struct mod_tree_root
Message-ID: <20220222175705.ryqmhhrpokx7xbgv@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <cover.1645541930.git.christophe.leroy@csgroup.eu>
 <c9584f48abce748e62e65e6757ceb23800f15380.1645541930.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <c9584f48abce748e62e65e6757ceb23800f15380.1645541930.git.christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=atomlin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: linux-arch@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2022-02-22 16:00 +0100, Christophe Leroy wrote:
> In order to separate text and data, we need to setup
> two rb trees.
> 
> This means that struct mod_tree_root is required even without
> MODULES_TREE_LOOKUP.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  kernel/module/internal.h | 4 +++-
>  kernel/module/main.c     | 5 -----
>  2 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin

