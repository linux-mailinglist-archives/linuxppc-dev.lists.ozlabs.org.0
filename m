Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDABB4830
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 09:22:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XZLN5X7dzF47y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XZJG4QgXzF408
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 17:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Je08zzCn"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46XZJG3mSDz8xKq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 17:20:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46XZJG3ZxDz9sNx; Tue, 17 Sep 2019 17:20:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Je08zzCn"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46XZJF6pY6z9sNF
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Sep 2019 17:20:12 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id u17so1505840pgi.6
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Sep 2019 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1b+U1Nzm9O0QA4glqcmO/uZ3v1M7siGCSMhNnLK7FJs=;
 b=Je08zzCnm0q36re4AEp6Lm98FBHaGD/6HQc6Lz3CHLTLdlE7ZRQNwFu706iBexv5Se
 SpoUWWulP3fy8ggO2a+Xi+laO5ygySjsu3oIqFibNbnR7fyOwFX/iXa5BvbfSwODOsA3
 2etUXUaTCkZIIih5GG80xwxdF5vbesZDj7sKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1b+U1Nzm9O0QA4glqcmO/uZ3v1M7siGCSMhNnLK7FJs=;
 b=STL7pTX5P0mO1IFdRCsd3pYdvB/5cB5LWO5KkiFF9BkPaz31zJBMzj6BTnwbXD0M+e
 G4yrR3FQcrN8tjvyAmTrpqJIA0YplAcCjjWLoNxSKd0TcURqCBa6ZPDiNywB01TE1awy
 bvLFq+tfleR5AiJZM1ECeku5yjRcj6LZUVSbOG9qcO0IbanDr9Ia/ZLnn6x8znGaxD6k
 5CJFUuC7vOO7l2ILdrcYmKClQAuHY+RDPzPzI431xyIaDdR4ouLMQ/YjR7APnDwwxOgJ
 YX1furGQWjOFW5vvnn4rBni5XVYMjFYt2xH9qgZc81K9gaWoDZ2EblXRWg8oYTmAOwXV
 KaMQ==
X-Gm-Message-State: APjAAAWSNprTp05IjpOp4qjTifZainjNBLL9wUK10pVdNWwwwN+kywcN
 ozpGxyooG/cHeNQeCedlMsfDWQ==
X-Google-Smtp-Source: APXvYqy4kjiS5gpcI18fBUp34VEwJV58XddHH7tBOwgSkIm6SPQlr/wW6um4nq2Q5IUwAWuNNG+3ug==
X-Received: by 2002:a63:67c6:: with SMTP id b189mr1994224pgc.163.1568704808022; 
 Tue, 17 Sep 2019 00:20:08 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id b5sm1230415pgb.68.2019.09.17.00.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 00:20:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com, Matthew Garrett <mjg59@google.com>
Subject: Re: [PATCH v7 0/2] Restrict xmon when kernel is locked down
In-Reply-To: <20190907061124.1947-1-cmr@informatik.wtf>
References: <20190907061124.1947-1-cmr@informatik.wtf>
Date: Tue, 17 Sep 2019 17:20:03 +1000
Message-ID: <87y2yngzj0.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

So Matthew Garrett and I talked about this at Linux Plumbers. Matthew,
if I understood correctly, your concern was that this doesn't sit well
with the existing threat model for lockdown. As I understand it, the
idea is that if you're able to get access to the physical console,
you're already able to get around most restictions by just dropping into
the BIOS/UEFI configuration, disabling secure boot and booting something
of your choice. xmon, being a Linux feature that only operates on the
physical console, therefore falls outside the threat model for lockdown.

I've had a few chats with powerpc people about this, and I think our
consensus is that the boundaries of our threat model are slightly
different. Power machines are almost all server-class*, and therefore the
console is almost always accessed over IPMI or the BMC. As such, we
don't consider console access to be the same as physical access but
instead consider it a form of, or akin to, remote access.

This makes more sense on bare-metal powerpc than it does on x86: we
don't have a boot-time configuration system that's accessible on the
console, so you can't get around secure boot or any other lockdown
restrictions that way.

It's also consistent across our future plans: our planned assertion of
physical presence for authorising unsigned keys for secureboot involves
pressing a physical button on the case at a particular point in the boot
sequence, rather than typing in something at the console.

So I think that given that this doesn't disrupt anything else in
lockdown or affect any other platforms, it's worth taking.

Kind regards,
Daniel

* yes, there are 32-bit and even some 64-bit embedded systems still. But
  I don't think that should preclude xmon going in to lockdown: the
  existence of powerpc boxes where the physical console may be trusted
  doesn't mean that this is true of all the powerpc systems.


> Xmon should be either fully or partially disabled depending on the
> kernel lockdown state.
>
> Put xmon into read-only mode for lockdown=integrity and completely
> disable xmon when lockdown=confidentiality. Since this can occur
> dynamically, there may be pre-existing, active breakpoints in xmon when
> transitioning into read-only mode. These breakpoints will still trigger,
> so allow them to be listed and cleared using xmon.
>
> Changes since v6:
>  - Add lockdown check in sysrq-trigger to prevent entry into xmon_core
>  - Add lockdown check during init xmon setup for the case when booting
>    with compile-time or cmdline lockdown=confidentialiaty
>
> Changes since v5:
>  - Do not spam print messages when attempting to enter xmon when
>    lockdown=confidentiality
>
> Changes since v4:
>  - Move lockdown state checks into xmon_core
>  - Allow clearing of breakpoints in xmon read-only mode
>  - Test simple scenarios (combinations of xmon and lockdown cmdline
>    options, setting breakpoints and changing lockdown state, etc) in
>    QEMU and on an actual POWER8 VM
>  - Rebase onto security/next-lockdown
>    b602614a81078bf29c82b2671bb96a63488f68d6
>
> Changes since v3:
>  - Allow active breakpoints to be shown/listed in read-only mode
>
> Changes since v2:
>  - Rebased onto v36 of https://patchwork.kernel.org/cover/11049461/
>    (based on: f632a8170a6b667ee4e3f552087588f0fe13c4bb)
>  - Do not clear existing breakpoints when transitioning from
>    lockdown=none to lockdown=integrity
>  - Remove line continuation and dangling quote (confuses checkpatch.pl)
>    from the xmon command help/usage string
>
> Christopher M. Riedl (2):
>   powerpc/xmon: Allow listing and clearing breakpoints in read-only mode
>   powerpc/xmon: Restrict when kernel is locked down
>
>  arch/powerpc/xmon/xmon.c     | 119 +++++++++++++++++++++++++++--------
>  include/linux/security.h     |   2 +
>  security/lockdown/lockdown.c |   2 +
>  3 files changed, 97 insertions(+), 26 deletions(-)
>
> -- 
> 2.23.0
