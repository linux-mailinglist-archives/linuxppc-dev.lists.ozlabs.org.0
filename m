Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C747A9DA94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 02:23:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HV2r54PKzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HNfP4WxkzDqWQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 06:20:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=catern.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46HNfN4nNYz8vhn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 06:20:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46HNfN2PHsz9sMr; Tue, 27 Aug 2019 06:20:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=m.gmane.org
 (client-ip=195.159.176.226; helo=blaine.gmane.org;
 envelope-from=glppd-linuxppc64-dev@m.gmane.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=catern.com
X-Greylist: delayed 903 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Aug 2019 06:20:11 AEST
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
 [195.159.176.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46HNfM5sfxz9sML
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 06:20:11 +1000 (AEST)
Received: from list by blaine.gmane.org with local (Exim 4.89)
 (envelope-from <glppd-linuxppc64-dev@m.gmane.org>)
 id 1i2LEc-000X1s-An
 for linuxppc-dev@ozlabs.org; Mon, 26 Aug 2019 22:05:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linuxppc-dev@ozlabs.org
From: sbaugh@catern.com
Subject: Re: [PATCH RESEND v11 7/8] open: openat2(2) syscall
Date: Mon, 26 Aug 2019 19:50:50 +0000
Message-ID: <854l2366zp.fsf@catern.com>
References: <20190820033406.29796-1-cyphar@cyphar.com>
 <20190820033406.29796-8-cyphar@cyphar.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Cancel-Lock: sha1:ym8TD2+JE56rxevrCvTf9T8Ptcg=
X-Mailman-Approved-At: Tue, 27 Aug 2019 10:19:41 +1000
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@ozlabs.org,
 sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aleksa Sarai <cyphar@cyphar.com> writes:
> To this end, we introduce the openat2(2) syscall. It provides all of the
> features of openat(2) through the @how->flags argument, but also
> also provides a new @how->resolve argument which exposes RESOLVE_* flags
> that map to our new LOOKUP_* flags. It also eliminates the long-standing
> ugliness of variadic-open(2) by embedding it in a struct.

I don't like this usage of a structure in memory to pass arguments that
would fit in registers. This would be quite inconvenient for me as a
userspace developer.

Others have brought up issues with this: the issue of seccomp, and the
issue of mismatch between the userspace interface and the kernel
interface, are the most important for me. I want to add another,
admittedly somewhat niche, concern.

This interfaces requires a program to allocate memory (even on the
stack) just to pass arguments to the kernel which could be passed
without allocating that memory. That makes it more difficult and less
efficient to use this syscall in any case where memory is not so easily
allocatable: such as early program startup or assembly, where the stack
may be limited in size or not even available yet, or when injecting a
syscall while ptracing.

A struct-passing interface was needed for clone, since we ran out of
registers; but we have not run out of registers yet for openat, so it
would be nice to avoid this if we can. We can always expand later...

