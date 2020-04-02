Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A619BE75
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 11:16:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tHW32WhDzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 20:16:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=bharata.rao@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AsedCKJm; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tHSq0GhTzDrP0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 20:14:34 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id 31so3273913wrs.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7oO5ojwsmMbiz9bV8lc0KuGAlbZ9cZsYY465AETTzhw=;
 b=AsedCKJmk3zh2162AWk03RYYnuwMu43SqSyMa22CuDwuKeBsqYZ/ZpnbkpH9ozYkzi
 UdXHImrAQuck55VmiVaUc2Nh40UFymzSnq12eRdEMV2fCGw5xg3RIKi87r7RIsrkhjOV
 FmI7Yf200tOGPV1eG5J30GDQiQTVsMJ4Bndl1DYtAe6hC17/LXNjtlyfa8UFMdkFToWZ
 hcc13K0AEdtmoH0CvI/oH7xvQVljRKJ4Zh1YV4BLdsVHZaG+zqt+GyJYnqB4Z/VJoLQP
 cF/eh3b7QZAbGi9mDpyj18Tjbz9WZdwsbY5+ih/eofyYe/IlJsptXWGbm/Ee+gYLYeEF
 VOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oO5ojwsmMbiz9bV8lc0KuGAlbZ9cZsYY465AETTzhw=;
 b=TfZyF3Ga76ylKRJT0TuwiD8yIfX30epAkd3ssM/nvXwGV1Ru5CN8hrfIZYSuyKsBIu
 EwhsuAgFDdQraDgrOFJC+0ZDAn1ESU8+JstMrtYNlUofgpiw52VFRkTV00JE0dibSdpK
 kKPqafEKLM0SB+L1e57Pt39N23+vVPyxlRemfv4Zqe0yTCnzUevrYe5V05H09KzJT2a4
 ju4kYp9IMt+kuknoHAAg9hI7jwcv3IXLG548ZwVfv5TZEXTC9tWHbs+/i3SYd8eS4Fys
 uLB5449GOXl0LKIrNgmdgJMxMkINnEsfjt63Po2mN7ugjheqXs8kdBadBgrVaGAHke9j
 +NNg==
X-Gm-Message-State: AGi0PuaEsUsjy8i8mQZnbSBmHryWUCCTt0LGLXaW4HWJHZ2/UVlu6EFt
 kJWuT3q6gJqIBLu2+dZ5h36pUOaE8STgozo9Euk=
X-Google-Smtp-Source: APiQypKwMvEoXZrpaQ4HZtkwJZMlk/p+Ce1lVBXhTtTkZk8wqF0d2jH6KErb2sML3hZjLYmwCQ9w8019RNXG/6FVFXI=
X-Received: by 2002:adf:ff8b:: with SMTP id j11mr2592490wrr.117.1585818868271; 
 Thu, 02 Apr 2020 02:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200305233231.174082-1-leonardo@linux.ibm.com>
 <33333c2ffe9fedbee252a1731d7c10cd3308252b.camel@linux.ibm.com>
In-Reply-To: <33333c2ffe9fedbee252a1731d7c10cd3308252b.camel@linux.ibm.com>
From: Bharata B Rao <bharata.rao@gmail.com>
Date: Thu, 2 Apr 2020 14:44:17 +0530
Message-ID: <CAGZKiBp7qjH1gMOzRuPgX=qcrJs4b7UgBbfxjgzAEpQPZ0nhHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] powerpc/kernel: Enables memory hot-remove
 after reboot on pseries guests
To: Leonardo Bras <leonardo@linux.ibm.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Anderson <andmike@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Bharata B Rao <bharata.rao@in.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 1, 2020 at 8:38 PM Leonardo Bras <leonardo@linux.ibm.com> wrote:
>
> On Thu, 2020-03-05 at 20:32 -0300, Leonardo Bras wrote:
> > ---
> > The new flag was already proposed on Power Architecture documentation,
> > and it's waiting for approval.
> >
> > I would like to get your comments on this change, but it's still not
> > ready for being merged.
>
> New flag got approved on the documentation.
> Please review this patch.

Looks good to me, also tested with PowerKVM guests.

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

Regards,
Bharata.
-- 
http://raobharata.wordpress.com/
