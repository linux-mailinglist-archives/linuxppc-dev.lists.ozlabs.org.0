Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF10248FD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 23:02:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWNds10NkzDqq5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 07:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=anastas.io (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.a=rsa-sha256
 header.s=mail header.b=X4GfFD58; dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWNbh51QxzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 07:00:31 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4D78B7EC65;
 Tue, 18 Aug 2020 15:59:57 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1597784398; bh=8lSL9nX1Oy4AG17LVB+JfZrE2H6gnlyzQLrXSLzOlD4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=X4GfFD58thhfjf9vkb6QUWsU7HcnnB9zppuleL6J04mfuCM5Bn/VMhK7e2gQcZ82W
 llw4UbZgsva004h4VzZTVPWJ8gggEHTig1xezv+1iifShJPDbIE2nLykmqVLA7Mopb
 wKd1+iGRgqaVZf5Hc8QcZ56L5+UuwsSzCn0w6wB1IxyrinTU7DDmw8/wf1qCYUPO89
 iI1Y3IOUiougrodH3u2oDPDUN44AVAG5VhYLr4nJJfsMKtg+o/s2Au7FD+u2eQkylz
 CC8iJ/BWqvoOLOjp1qYAcg+6/hiXSwn9O6YDAPOoG4p+QliSd57/bNBs0TmxihpauT
 szv2p0FNLxWbA==
Subject: Re: [PATCH 1/2] powerpc/64s: remove PROT_SAO support
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200607120209.463501-1-npiggin@gmail.com>
 <0c74bf2c-beff-c13a-7cfc-83b7d0433963@anastas.io>
 <1597733955.vlt37n2lw9.astroid@bobo.none>
From: Shawn Anastasio <shawn@anastas.io>
Message-ID: <3c053cc9-751c-9899-79ba-1013af140148@anastas.io>
Date: Tue, 18 Aug 2020 15:59:55 -0500
MIME-Version: 1.0
In-Reply-To: <1597733955.vlt37n2lw9.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/18/20 2:11 AM, Nicholas Piggin wrote> Very reasonable point.
> 
> The problem we're trying to get a handle on is live partition migration
> where a running guest might be using SAO then get migrated to a P10. I
> don't think we have a good way to handle this case. Potentially the
> hypervisor could revoke the page tables if the guest is running in hash
> mode and the guest kernel could be taught about that and sigbus the
> process, but in radix the guest controls those page tables and the SAO
> state and I don't think there's a way to cause it to take a fault.
> 
> I also don't know what the proprietary hypervisor does here.
> 
> We could add it back, default to n, or make it bare metal only, or
> somehow try to block live migration to a later CPU without the faciliy.
> I wouldn't be against that.


Admittedly I'm not too familiar with the specifics of live migration
or guest memory management, but restoring the functionality and adding
a way to prevent migration of SAO-using guests seems like a reasonable
choice to me. Would this be done with help from the guest using some
sort of infrastructure to signal to the hypervisor that SAO is in use,
or entirely on the hypervisor by e.g. scanning the through the process
table for SAO pages?

> It would be very interesting to know how it performs in such a "real"
> situation. I don't know how well POWER9 has optimised it -- it's
> possible that it's not much better than putting lwsync after every load
> or store.


This is definitely worth investigating in depth. That said, even if the
performance on P9 isn't super great, I think the feature could still be
useful, since it would offer more granularity than the sledgehammer
approach of emitting lwsync everywhere.

I'd be happy to put in some of the work required to get this to a point
where it can be reintroduced without breaking guest migration - I'd just
need some pointers on getting started with whatever approach is decided on.

Thanks,
Shawn
