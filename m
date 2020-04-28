Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B21BD190
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 03:14:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BgXg5ZnkzDqx9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 11:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=andrew.cmu.edu (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=jaharkes@andrew.cmu.edu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cs-cmu-edu.20150623.gappssmtp.com
 header.i=@cs-cmu-edu.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OX9cephv; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BWng4VKQzDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:25:15 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id 71so18282781qtc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs-cmu-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vip41qUVMKBqTzEGULB2fq8TW2WA+09ehaEg4M6b7gA=;
 b=OX9cephvVUT6NSDLm2aPp0wg7GbJRFkTlOE6HtLl4AbVbrBiWitjfdPqKFn2uTTlo6
 RZZdVY5cYJ+X7nFP4U5wwIm17XpQi5lJMGdnsrRRWdXhllecGup4mn011MRDxqd3PaX1
 pXXo7vzr8OqmVOdwIAIy9lxu/ZmUvfEliPItaLNfxjqDftU0dYHi4Rqi6laIoRZoWuq6
 QUwdoT7Qegg/09sur7Wia9CP4DHAidc5klwQee/5ecVGpPPKoPvyQ94BuQk8ERNSDOBw
 I9n2PPZxuM4t/KRY1hbRe5t/i6EWjpMK7w0MzwXDgyzGwrJciJy1oRw5ZNA/A4Ib1xiv
 Z8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=vip41qUVMKBqTzEGULB2fq8TW2WA+09ehaEg4M6b7gA=;
 b=IKYMidZpnjlKH/xE28lMiW04CP1vOojmedXzlZK8T8Lgu4cf3LT/bLHu7VplbRu2SE
 ZKCqWr33l495wJoSeB5i7Gig1M0jVOd3wRUIt6DC73p+qVM58HI5/F3A+uWtTLRn5Hn4
 y2V7N3p0TYQmkOhe9Psv23vo7PlTZ2S1fLj4KxnL98ljdOBfeMlc50NUmWvMkf+Ddmta
 7wKw4PG6bKbaSU7eRlGNId10RHvesry5+m9omzSmXdGYGGKthUP0tQw1A0o+SW2wse3a
 +shJdlzex3vNWedc07BTxj3Afy3jdhO/MAULHpmep5EtJYca759wUdhBlBMxRWHrqYiO
 ai6Q==
X-Gm-Message-State: AGi0PuYjJwdc2eKpgLYVgdrgO20rO8i1gdL0IKeZjRklzbWA/W3HXHpU
 OYhMmVaG1d07BNAjWcGGMBEWqg==
X-Google-Smtp-Source: APiQypIhJhTV5HGwJH/cgQxWAhYS/uXm9mZJikUijUM58zV+qHDsER/fp3y62V6/MA+IjGf4ymv/JQ==
X-Received: by 2002:ac8:1a2b:: with SMTP id v40mr30279995qtj.170.1588101910910; 
 Tue, 28 Apr 2020 12:25:10 -0700 (PDT)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net.
 [2001:470:7:582::2])
 by smtp.gmail.com with ESMTPSA id y9sm14261631qkb.41.2020.04.28.12.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 12:25:10 -0700 (PDT)
Date: Tue, 28 Apr 2020 15:25:07 -0400
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 00/29] Convert files to ReST - part 2
Message-ID: <20200428192317.7h5d2wiqmy7y473r@cs.cmu.edu>
Mail-Followup-To: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
 <20200428130128.22c4b973@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428130128.22c4b973@lwn.net>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 29 Apr 2020 11:13:26 +1000
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 03:09:51PM -0400, Jonathan Corbet wrote:
> So I'm happy to merge this set, but there is one thing that worries me a
> bit... 
> 
> >  fs/coda/Kconfig                               |    2 +-
> 
> I'd feel a bit better if I could get an ack or two from filesystem folks
> before I venture that far out of my own yard...what say you all?

I acked the Coda parts on the first iteration of this patch. I have no
problem with you merging them.

Jan
