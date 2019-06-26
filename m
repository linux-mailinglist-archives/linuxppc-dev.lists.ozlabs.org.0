Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D368D55CEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 02:30:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YP7f372hzDqR5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 10:30:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="YeX/xFTe"; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YP5p1n1pzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 10:28:44 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id w25so1124032ioc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 17:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/uR/4PciUq//wm8VvTrYpqXShwr7/kFFKyCPyP8pcs=;
 b=YeX/xFTe86cLjtEiwNDGr0CKTn6yvfRoFVYAyjGpJqcjyjOauh0oSms8qNpsPWv76x
 eRvUUgmWL0+6wScBbr8rD2ZZ/RfhNpAX4UKm1peplkD8GmwmOk+8uVKUsB9hanwxe3Dm
 H0krLG+sD5Fzr71HJU1x0kXlYQzuI9cWXt4LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/uR/4PciUq//wm8VvTrYpqXShwr7/kFFKyCPyP8pcs=;
 b=O1hiscYwB7ebfPQGyxjLusgaKVpRAYkweUBq0wc5vC6Y9UD+yPrLabId+zDKQoH5js
 k46uvXDxr+Sm9tZbdR1wiswHhAjk8H5qLh7KPXJA6K6Q1mXJ3uH90LUNTfsCFekPB7a/
 Xx2uvbNftn0LvTTY5iPWUVkYXtmWh41RkHrj0GEbSR9IrKWb/IHoeBqysNrH4L1ucipQ
 1SG09BPc07MIhzLhVpSAcqsQZF+UFb7KjyJAkECOOZEgRbJgpp7bEZzc17WuWf/mVLpO
 YNtztQwCWpjQ6t++pyvFaAnSCKn/yJWlJuCU+t+71V43Jnk32cljdNh1HmkyFBgVy6es
 1rew==
X-Gm-Message-State: APjAAAVY46ubppPGWdaO9f7ociCr0pEnxs9xn5Ia/6ralml8JS1V8fL6
 3ETf62v/8M57/j8pl7EkR4QKsfy58scV6X6nYNYNEQ==
X-Google-Smtp-Source: APXvYqxX0Qrt909cJIALCW0svY89PQl3z7r/J2jSYrLO+BEo6+PoMkKF1jAWxKfLc2PBHctF8DPoeOKanHzXan7VOSY=
X-Received: by 2002:a6b:6d07:: with SMTP id a7mr1751422iod.254.1561508921439; 
 Tue, 25 Jun 2019 17:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
In-Reply-To: <1561501810-25163-1-git-send-email-Hoan@os.amperecomputing.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Jun 2019 08:28:30 +0800
Message-ID: <CAADWXX8wdEPNZ26SFJUfwrhQson3HPTrZ7D2jju3RhEeMuc+QQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable CONFIG_NODES_SPAN_OTHER_NODES by default for
 NUMA
To: Hoan Tran OS <hoan@os.amperecomputing.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Open Source Submission <patches@amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oscar Salvador <osalvador@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is not a comment on the patch series itself, it is a comment on the emails.

Your email is mis-configured and ends up all being marked as spam for
me, because you go through the wrong smtp server (or maybe your smtp
server itself is miconfigured)

All your emails fail dmarc, because the "From" header is
os.amperecomputing.com, but the DKIM signature is for
amperemail.onmicrosoft.com.

End result: it wil all go into the spam box of anybody who checks DKIM.

                       Linus

On Wed, Jun 26, 2019 at 6:30 AM Hoan Tran OS
<hoan@os.amperecomputing.com> wrote:
>
> This patch set enables CONFIG_NODES_SPAN_OTHER_NODES by default
> for NUMA. [...]
