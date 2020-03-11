Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A97201812A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 09:10:36 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cl4V6gSQzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 19:10:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cl2n2FDTzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 19:08:29 +1100 (AEDT)
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MJm8N-1isTin10kj-00K8iO for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar
 2020 09:08:20 +0100
Received: by mail-qt1-f178.google.com with SMTP id e20so905259qto.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 01:08:18 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2Hbr2TVMB7uTi0C/Xdi1qUsQ/d3yRjbvpPszMczmsyGzs0gzZl
 qj7f8Le+HJzTacXEbtGtzspgPY+FJYGs09ag0hI=
X-Google-Smtp-Source: ADFU+vs2hxeVvWF6CFcvsnapxW/+7M3Z6M+ve+CzkmMddCW8sT2Z3/y60I2QSZoEPomImODxZOnSGSEEAy3EsgD3YN8=
X-Received: by 2002:ac8:440c:: with SMTP id j12mr1507383qtn.142.1583914097268; 
 Wed, 11 Mar 2020 01:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583896344.git.joe@perches.com>
 <03073a9a269010ca439e9e658629c44602b0cc9f.1583896348.git.joe@perches.com>
In-Reply-To: <03073a9a269010ca439e9e658629c44602b0cc9f.1583896348.git.joe@perches.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 11 Mar 2020 09:08:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a06imYP7smZ=nJ_X_kqMfubZR0GF-HQ38S0creGqCo9rg@mail.gmail.com>
Message-ID: <CAK8P3a06imYP7smZ=nJ_X_kqMfubZR0GF-HQ38S0creGqCo9rg@mail.gmail.com>
Subject: Re: [PATCH -next 017/491] CELL BROADBAND ENGINE ARCHITECTURE: Use
 fallthrough; 
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4Xdgx3y535mdsXNAecS9/R1LsNjNymOCgDSa4iqr5/Wb+yU441I
 Jhn0dKUpfC7bsvz75EeAw5+J4QjSJbEgHAxu9h8etKKMuNSY8TLyteoPkIBiQ+5K/1fBl9s
 M3t2lAjcpMeMC+35WVZpyWieqEl8ukERnzGoEN/Pg2q3QOvmO7RG+yMuMSGCV5E4+4hVA/5
 GVN44HSn9nNFid3CNOx1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UyYXyoxVdp8=:RhIJr7XV1Gws1clnsTS8gW
 dqkY+zdc3XZksYOKMimTr34BBaLZ2nsnbR+Q2hIPl12UK/9UbHTddiD5JUYhffPMk2jtWiJCa
 e2g7mAG3AElwuYeR6yy+xufcGY6tLqSoa3yb3QDReMnovZ6EC9EyBfOdK8j9lZ3m+axghqaqi
 yUXf6TJ1jDzBcWbQfJteHsqhz7uQEy/OIOpfiCkLByV6l0z/3DRken4zDgFYxCd1M5dlHc8Si
 0QYuy1nelP1J/BYIYewsQRhB5uO3bTwPXaL88txLP4Qoa8VOf9BUPB9TeOdzy9I3/r72OJ0o+
 B+1mj5TBUm3hbaurt+ozpEJJCEwzHms2zeitFG4Jg08iRiqdjtXfItIuGAbNS0G+JWkYp7QOJ
 QsI83tMXv/bqePjkuKIoNOQLUybbw3WwIbTHDYCfKIoY3+D8B0vdyu/RUR6SKXoXafq8jJgel
 OholBYH2VnsXjt8Yv9Oh5la+PSRToHJTD+eqDQDr4qWzhTFwMRQOKudRCH3CYonYHejuDXoCB
 znyIXVRq3BZagbJNHMF2zvuP30nScdEMqEBdGqQxnT+O4SATIhsJ6cuX21wBnrVcjJB7jrU90
 OfuqwevxWziyRcWMkLGycqIWy8q8Kqiq0E6URhPdxnCKmosv+wlu9KSxaHfQcn1KZEXAukd35
 KBTq1IhuzpvOHi1GJI6+P7F1yp3cE6twmty5Gre5x0HfEiStnJOKFSZJR4belSyL0wrMWRAxN
 FQy/cYQHF3IbRUDWMz8hPHEFRfPPmnYjMKjxeq/UpVU0IjBe+9qyTKJG5oc/hE4eX5H2Ayzkv
 seZEqoxAAR/sJDhOymLd9xGYS7M+EA0BXE75vipLwZXElrmv84=
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
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 11, 2020 at 6:07 AM Joe Perches <joe@perches.com> wrote:
>
> Convert the various uses of fallthrough comments to fallthrough;
>
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
>
> Signed-off-by: Joe Perches <joe@perches.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
