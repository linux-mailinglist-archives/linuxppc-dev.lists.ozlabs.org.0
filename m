Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C0A1A9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 15:00:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K2lV05m1zDr2y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 23:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.193; helo=mail-qt1-f193.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K2hm5nVFzDqxX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 22:57:59 +1000 (AEST)
Received: by mail-qt1-f193.google.com with SMTP id t12so3483048qtp.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 05:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eBPBkBKyWo1gxv5n6v6wKh2d1Kik1L8vXbkWwc2K3bs=;
 b=ex0cMmNp9lcEPldJaSqVwwJHo1eilXEi/f21NAa7HxeQkiKGnX1siqVgXs1KYQ8CQZ
 d4hCMlHuHhJpix2uzX7bR0LPyFc802nZwOOOp6KXzgKeVjp69tP5CSZvTln+rbnjhAWV
 oC3lVGltinCMf8loSRp6IwgmC4l/jiasAr2TmQ2WDNV3nEW5rMlBD+lsjfZdOmVwfB4X
 XvUt4T1fF/kmHORtaxbFtKyRDnwjE0bVSFwFcn8XJknTaijLqU8yH6o7MBl9jJCXcvhU
 coq3dSZV97ZhaLB7u5h7ctCSAxbxKDHX2aso1qLCwOt/+/Zho/zSmej5l3CjitIxzYhu
 t4kA==
X-Gm-Message-State: APjAAAX+FQEDFm3HqnIJC/keqgVYvBgZMpX3iAfKZ9Q9ZOQwTQbbKXvy
 rCCgRR67yz4U4zV7CsqyyFBf/TzAMSydYBmeLs4=
X-Google-Smtp-Source: APXvYqwY3WgtxDzkiHef+9HQh/ay0Es1FEwtogifyQxitHWZN7yE+/+41B7zXg5JPfw7deyTXnwsCWcNTDVb6Yevmn4=
X-Received: by 2002:ac8:239d:: with SMTP id q29mr9597999qtq.304.1567083475450; 
 Thu, 29 Aug 2019 05:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567072270.git.msuchanek@suse.de>
 <061a0de2042156669303f95526ec13476bf490c7.1567072270.git.msuchanek@suse.de>
 <CAK8P3a1wR-jzFSzdPqgfCG4vyAi_xBPVGhc6Nn4KaXpk3cUiJw@mail.gmail.com>
 <20190829143716.6e41b10e@naga>
In-Reply-To: <20190829143716.6e41b10e@naga>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 29 Aug 2019 14:57:39 +0200
Message-ID: <CAK8P3a2DHP+8Vbc4yjq5-wT9GpSxvndCa8gnvx0WcD8YAUAsMw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] powerpc: make llseek 32bit-only.
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Michael Neuling <mikey@neuling.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Christian Brauner <christian@brauner.io>,
 Firoz Khan <firoz.khan@linaro.org>, Breno Leitao <leitao@debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 2:37 PM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
> On Thu, 29 Aug 2019 14:19:46 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Aug 29, 2019 at 12:23 PM Michal Suchanek <msuchanek@suse.de> wr=
ote:
> > In particular, I don't see why you single out llseek here, but leave ot=
her
> > syscalls that are not needed on 64-bit machines such as pread64().
>
> Because llseek is not built in fs/ when building 64bit only causing a
> link error.
>
> I initially posted patch to build it always but it was pointed out it
> is not needed, and  the interface does not make sense on 64bit, and
> that platforms that don't have it on 64bit now don't want that useless
> code.

Ok, please put that into the changeset description then.

I looked at uses of __NR__llseek in debian code search and
found this one:

https://codesearch.debian.net/show?file=3Dumview_0.8.2-1.2%2Fxmview%2Fum_mm=
ap.c&line=3D328

It looks like this application will try to use llseek instead of lseek
when built against kernel headers that define __NR_llseek.

Changing the powerpc kernel not to provide that to user
space may break it unless the program gets recompiled against
the latest headers.

      Arnd
