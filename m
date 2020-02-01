Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B574014F8FB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 17:43:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4890JP41PVzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 03:43:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jsFiPNcF; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4890Fl0rVHzDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 03:40:40 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id fa20so4339339pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Feb 2020 08:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QwZ3CLPSOKerZ4q2cB/Hi0ai1yGFzd/B3udh3ZqTtuM=;
 b=jsFiPNcF+Kv+AD+cCoimAjdmxdXVfz+jklLjuWAodKYGoYYpsmGFXd7lewm9b+k+0a
 YxyMuZnoFgQBJJT4fvhBfbLaQinvoO/ovQPcFEXi5AGzl5olCx5gYZ4Eq7/UZCm/eIOr
 OQ9onHvvIcrtHkP4clI72kPgvkSCx4wYKUuIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QwZ3CLPSOKerZ4q2cB/Hi0ai1yGFzd/B3udh3ZqTtuM=;
 b=ndR6hu8fHygv+dEVXXj9Uum+C25NoTIU8aaIN9Is2OWCb5Vc83nzNiFtjoYc1itBUg
 4Z1yjxqKbujvflhnCE0l19zX4CzK2EKKAC+LakI3DsBB2RkkYSrfb63qCrUeKRfFcIQ8
 vVoSiDiWbJHtUrSYinIVrAEUtjjUFzszmWV1u6G+dmwh0FnCCJPWkh//h9bIka9t0UZp
 q5tCcPe9mSTkMjIAi1Mgq1WdeLb0eq18RCMX2gz59g4VWgyEUwwCAv4bbnjfFyMiqS2b
 R8hoIjGmVwzMAp4vgXp2wOqNJGyBFyddycXlnn8nFYk5RMJPBVrtCssTypm3+WLRFnsE
 1JCg==
X-Gm-Message-State: APjAAAVfNvDdaAGUqnE5aHSV/o2wdA1ZJoBckMw2jMhhP9ifkRL8bMnT
 hp7tEn9W5fMpUDW0h+TJS6MgRQ==
X-Google-Smtp-Source: APXvYqxXMppfrfTklyz+pwg0P3CdY6ihdgY9Vslz5MfHbndtzF8KzUGwo01U+1jLgg/AvUUKozH1GA==
X-Received: by 2002:a17:902:d20f:: with SMTP id
 t15mr16360800ply.55.1580575236433; 
 Sat, 01 Feb 2020 08:40:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id dw10sm14222430pjb.11.2020.02.01.08.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 08:40:35 -0800 (PST)
Date: Sat, 1 Feb 2020 08:40:34 -0800
From: Kees Cook <keescook@chromium.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH] lkdtm: Test KUAP directional user access unlocks on
 powerpc
Message-ID: <202002010836.76B19684@keescook>
References: <20200131053157.22463-1-ruscur@russell.cc>
 <1b40cea6-0675-731a-58b1-bdc65f1e495e@c-s.fr>
 <0b016861756cbe27e66651b5c21229a06558cb57.camel@russell.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b016861756cbe27e66651b5c21229a06558cb57.camel@russell.cc>
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
Cc: kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 31, 2020 at 05:53:14PM +1100, Russell Currey wrote:
> Correct, the ACCESS_USERSPACE test does the same thing.  Splitting this
> into separate R and W tests makes sense, even if it is unlikely that
> one would be broken without the other.

That would be my preference too -- the reason it wasn't separated before
was because it was one big toggle before. I just had both directions in
the test out of a desire for completeness.

Splitting into WRITE_USERSPACE and READ_USERSPACE seems good. Though if
you want to test functionality (read while only write disabled), then
I'm not sure what that should look like. Does the new
user_access_begin() API provide a way to query existing state? I'll go
read the series...

-- 
Kees Cook
